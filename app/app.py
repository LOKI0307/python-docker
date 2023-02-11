from flask import Flask, request

app = Flask(__name__)


@app.route('/sum', methods=['GET','POST'])


def sum():
    num1=int(request.args.get("num1"))
    num2=int(request.args.get("num2"))
    result= num1+num2
    return "sum of two number {0} and {1} is = {2}".format(num1,num2,result), 200
@app.route('/multiply', methods=['GET','POST'])
def mul():
    num1=int(request.args.get("num1"))
    num2=int(request.args.get("num2"))
    result= num1*num2
    return "multiplication of two number {0} and {1} is = {2}".format(num1,num2,result), 200

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')