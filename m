Received: by 10.25.21.156 with SMTP id 28csp907284lfv;
        Thu, 28 Jul 2016 09:56:25 -0700 (PDT)
X-Received: by 10.55.19.206 with SMTP id 75mr8645169qkt.29.1469724985627;
        Thu, 28 Jul 2016 09:56:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o10si8566741qtb.120.2016.07.28.09.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 09:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSobh-0006TU-5B
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 12:56:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSobd-0006TF-RX
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bSobZ-0000jT-M6
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:56:21 -0400
Received: from mail-bl2nam02on0070.outbound.protection.outlook.com
	([104.47.38.70]:34422
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSobZ-0000jO-F6; Thu, 28 Jul 2016 12:56:17 -0400
Received: from CY1NAM02FT018.eop-nam02.prod.protection.outlook.com
	(10.152.74.51) by CY1NAM02HT119.eop-nam02.prod.protection.outlook.com
	(10.152.74.196) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.549.5;
	Thu, 28 Jul 2016 16:56:14 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT018.mail.protection.outlook.com (10.152.75.183) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.549.5
	via Frontend Transport; Thu, 28 Jul 2016 16:56:14 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:44638
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSobV-0008Bx-Rk; Thu, 28 Jul 2016 09:56:13 -0700
Received: from [127.0.0.1] (port=49925 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSobV-0005KO-O0; Thu, 28 Jul 2016 09:56:13 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6SGnRpm026407; Thu, 28 Jul 2016 09:49:28 -0700
Received: from [172.19.74.182] (port=34604 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bSobU-0005KL-Rt; Thu, 28 Jul 2016 09:56:12 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Thu, 28 Jul 2016 09:55:39 -0700
Message-ID: <69992ebef8db49ddc320cd9f5d9a60c95c593aa7.1467752513.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22478.005
X-TM-AS-Result: No-1.022-7.0-31-10
X-imss-scan-details: No-1.022-7.0-31-10
X-TMASE-MatchedRID: KYMyBIAmGGUcqJwtUHLtOdOEZs/2oH3cvz6rXsYUspHVU2WiOk7jaAm1
	YMuIrlxQyWfrAWRuDcGt3sLYKglzIdapN96o/xAjxZQoGMRGhhNY6vvKPQt6xSA6eO+NDmAxW9o
	SzMAtdLLi8zVgXoAltsIJ+4gwXrEtWBd6ltyXuvukKJtLqA0f79vv/O+c6tVIGiCoMk1n3UkVKw
	Qs6xG/X6WZrVCwpTuN83bQqbM84CRv5Z2wcPJTtnhkyQGTbxKjXIhyZAhWoW9Lv5Eyr/YIrqsDh
	ztRXZ9Cm+LY9A78UVCLPa6Os9XH3Kx4gs6iDnXyftwZ3X11IV0=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(87936001)(81156014)(64026002)(85426001)(81166006)(11100500001)(118296001)(4326007)(8676002)(36756003)(5001770100001)(86362001)(50986999)(189998001)(2906002)(9786002)(105606002)(356003)(575784001)(48376002)(106466001)(50466002)(5003940100001)(71366001)(47776003)(229853001)(92566002)(77096005)(33646002)(586003)(8936002)(15650500001)(305945005)(19580395003)(19580405001)(7846002)(50226002)(7696003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT119; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT018;
	1:paruBIbwTRPUPw6pMDVePYOQAXy3mWOPG0EK285R3U17m/43T+ZHa0O/R/i8WPSyE4qt5ud9ay82R7wouqAsFT8qEqvCNxtq3ltrDwOKNLUl4lvl+LwHORNGhwd1N+4NHdcwKqxZLQTySOP7neFl+9Swrpj7bAmBTJGEB66u+kXYBmJKuepjXRjO7wvLmHOXD3IU6mfY/t0Hn+CWyK1IKFgERepeC8JQqghYlZ5VO4PzRv/Pwtdv1q3f3Vfma6lJ0HzwdcB77EjE3SQe95CFX+oG9lS2XaAm0h4gNNQt2O+fB+DEFPwJ0N7GB1ZNwKNFMfJdPdxhdpNZV2+Xp7lCgKNDB2vyWl69M5SI9aJDQX30E+Qd4REwQ0O1PyPYwAg/HDBsQ0O8tRQ+s+OwyQX93Epj/RtAK+QxRX05Ri4F1o47DRmQ+apNbcPAN7tCp6paWjQADDtFXv07iwkln724EjEgS7Jeen1YGjVP1TrZVMfCsuT3ySK0CKqn33rekPlmalQ2ABF2ONei2/EcIk8snXzy7OO+3L99ynofUb1/5J3vlYQjh5OlLx4gw1MYiG55Xu1BBUlqEAA2a+x3IeoyAyDxZp7P2vBtT2fLD/eDdJ4=
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3e970a92-304d-4a8b-5f34-08d3b7081610
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT119;
	2:pKRWRlxCQk4oR98CTgPe+7G79Nhj9ldEoJ3RrVIcTV0pPg/pe8oStVNYt2UpwTsxkmLKSSAbbQPhis/8r7s3B9+jNxwYZq6XQuOMoIL2BO9gtObd7S8yzf5nSaJUnLuAPPpFYGulL3NFUbqmjo9y0FMi9SueYmS+GFeSaehdu7JoqPL1ppOyvHjnuG2m775n;
	3:HMSy6pqvRrcHeSWbwfqbKYmZ0G6yDP1AxVph391xndXJmCeZjEbht2o/lMfsH6aS/uBMMzF/TPYCJB12C4iGHtJauzFPDCsqAoIQYmW4GMyXEaWwvHMU7IU8AUwcxbAJTl2sK5U6HWEP0c2Tlesalooo7EWIG4zAezbifLpBLadnEbKIu1643fC/kymcF9+uDLKkT8Ldm3VlmoiIG/UN9RyogK8e7V8tBn9lmQI3CCI=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT119;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT119;
	25:mGLulEdhn2OtGl9+HM5Dizcr5yjBwr6d2FxzBPGrrfWFqS132f10mVAjQp8783cLzKmrciYtIxBANGf9DMwqOuKfuX2IGGFIybDXi8bO/pWqfzJ6xnbTsIVfzMzMJMUvY+JmnTsUg++VZejRQZ+lE1WIPG5JR8VkcufvpU8/481p6sqcn3/9Ip4GJ87V+xlnpWKHk3ftu7cgLFltWu//kFeo3mWmkHQOijOGoOTtlwYiYj6N5ipUTBWTZyTuL+nHWgsc9FBY2dPQnYfjyz0YB/L40dNIblTkn4kjwvFOwisezlYuG0f/SjMLTHh52ARrFoA/HYJdLNRzNVkoj1YgP+5bn/5qFszb9YamfmxhDbLiy30CbqLX9ecqroG01fn4/reKwDuaH1/5T0eaP6sNe8VTmlFXjTFA6yewdy/fHU6IcDBiEfoyKFLaUN8au/Wbdr+bw1yoZ6dN+o83R1F9CLVeBCLEkFVUY2tcCrDFtUuzN8+pIqLOoH9PwqjsxMfiS2AMXP7qzLUKm7ZvoSfspyCQQ3GEsTjxNay5v/8YGqSZzTOgc4E7RhyV1QyynAXs4CWpNIYsrLVT+oURFehILG04c4FIVdusspTzo2gPyiLFdwmHkLw074T/AP1MF/6YEQ1NrcXwhdLeoFsAsANM6D34ErsaHFJsuX1x3rjUq1FRS1aa29gXL04UaFJ1caja8n6wXFFR+iI5JGBAtsZvesdgNOYLHTqq0VSK8zosNYir5UsobjUOqNwR2p5yl39ozyFPq5B/e/9B7f1BIxccg2Q+TIvxYKnqnKXAqIVE7pjp7DTKEMKhZm7SfbpSTayH
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT119;
	31:ORd075nACle6qzC9iPwvbmX8It/0sv+HBY0VdHFWT6LqP67DCMWBX1DRIh8NIxj2Z3HMn05I4YXltDUzdVOs/r6FbF6B7pVyIk25rviTrRDbD7HKBFSL1IC2G33TUgbxO4FtjF82atMC9r65W0ddTZ728Xx2XiJiH4kjYO3JLI8ph/48e3c9pXeIXmSIWjdJj8AkifiYd+NcQxgDbDzWksf4Jw84GxVzWwNoWOTiqvg=;
	20:68uzAk4d9Nt3krgQDQJ9pLdH23CLXvQTu5dFd3kIznYeJIr1jsRVSHxDXog7kewm4+djSPupmLSxtqE/FvBxmbIX39GgJaLulMH0qaIZsv/kzKJ7F1lehs6ZzC+BHOI8FR9SIxS2x142SX6EU9/swGvm2xHOoeOuuVRKZClIDPm8dZRyYl5DDfK0UkDdONl991aw5ZCZoyzKRSZQUzwW9PfXYC//oQ/PC1bDNo/BAEoqfdwqtXjYeOXawruIhwYK/02rFhwf7pEmfcLdrRYiFlwijrN0qGE+jx40hO6+6IVp+tOq08cZkHpZo/yC7NOguJ8sJlSrdsK6Q1zaswoUsOxz8F2ACOlyZwpHwYUg15UplzbDmmSZPE9aPGCEpEcfmCUJvQON1mfE8Pb5INZeiP84RYO09C2DcQKfrIyvLBfJhUBZiW5FxHRrpi5U0u7epKeo5mo0xBtUY9Ic9ivSfQMSzCFrMqRswmEKPeq7V6FTLUpFjew1h1Ajh1no+hoz
X-Microsoft-Antispam-PRVS: <80086467de2241758c1911c89964283f@CY1NAM02HT119.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(50582790962513)(192813158149592)(126837547833334); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040149)(601004)(2401047)(13023025)(13024025)(13015025)(13017025)(13018025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:CY1NAM02HT119; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT119; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT119;
	4:QaFOaYGfKJ5BFEXAk89/NaesWsDbg8mfBvyKe/jLGkOPVceRLQtMFyBL8Qt3VjmGKQi5Aqitd4hRIfU6IQK2Mz+xINzrG03pvRNaxzDK+mDqAkwIi+teq9dKbeCe7sWAfC2QUCxYwZOf9bekvrAp1NLpK3o6O+RLaHPnbOwE/FYabTWywKfeYWYEoQ/xr6zleFqg0UUtNupwwGAvw23QvFRJ2E+gDOeYao55NyMJ0kUO75ABJ0AMTxSCsxm/sydxv1zednquUkjEPX12JC6O6Z9RK7VuF4PWzB9ld3btBWj16svo/lGFjGDt7k2oc9lYogz/H9iT3WDNpIpqh7p+p0+Cql606YUew5FWalU7WVrPo/1MAGf4DzgOwYawK58vxZs3j7+8oEvZrwsZmO9Wd9rWbS6MQtjCa+tfJipxXOEqzYfh87TpcjYL93o4vMqMmDQFQhsIa9UJSqyBYp+NnD9KSdHu0S5pkOTfCSau/uYurubGF550EQ/3WsO5Sk4IKalfN9XfgqSyf+U7DhV6ve7nqEJwzXcK2LXvlP1I/2ux7IRiZEmpm1BPjUJDX3S2mcdrAbjGSMyt1nmhUAgAp7+Unem7Gg/sf0VsgWE5RLo=
X-Forefront-PRVS: 00179089FD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1NAM02HT119;
	23:904mhwOR937g2TOmuWCt3rIlnoEBmlYP5cPteVwdw?=
	=?us-ascii?Q?JriymXgwKB1ycJxpIzBVAmNxKyLA11nI20zCpGLH381t7Idx/KYm8R4Kf1mL?=
	=?us-ascii?Q?WUrINtM2Q3Pa2+gDB+ZwDHl8knmSrJ1BwRDeucJ+F39sV5EadL0FSx9bXPiK?=
	=?us-ascii?Q?0F/LdzV7LR4w4lFrKDn9n4XgdxoY9GYHSVyHy2XfYUegoB995xdcL58ortrH?=
	=?us-ascii?Q?XgI9/+6rRn/Ye8M8BK3SY9ofSZ84lCWZDRgMzQLQe+ENODu5dZ4iOtkwnJoc?=
	=?us-ascii?Q?DRuk1UGZGh38l12lgOaguXMV5QJieTLeQWiKJxRm1DbTyV3/Ht/E4aSgsTgN?=
	=?us-ascii?Q?CsITzrc3IKGQYXK7GwoHrT2269MAJseieYOD+6k7PBG8PYRb1ARGHXhhB+l1?=
	=?us-ascii?Q?d8eME0IAoXXxte7LTpVZYpE25/Fl3+tT3oSkMl21va0BRWEYHWGQB88zW51o?=
	=?us-ascii?Q?tFi208+jRMxncKidHAV7aU1zABWbCrQumPRUhRmEMkuKbqu2O8/B6E+1hOnX?=
	=?us-ascii?Q?8rl0/oeL9AVIGJIinhMtMG3orfNN+y0YlzbDFJMS2BgEieLPEDfu3lb2rOQB?=
	=?us-ascii?Q?xYwvrPi+j/y+HuGo6w8hbFwb+2FWo5L0knE1kCYvI1gZdmCJf4nQz5akEAIH?=
	=?us-ascii?Q?7mMZo2VQPzAVOV2tlxZLwiH6tx/+EkryBoHIVXkwURnWqMeMlvfxtjIbnL0R?=
	=?us-ascii?Q?f9VapVBdO+0zivL+F+oBMyNyRCQJGYwNyNQd3DNW7BzbaJCOyyhcXHnLAsmU?=
	=?us-ascii?Q?zn06p4GWHBfCZ3WmXilqBpFctTmDvZ98Oi1cByz4KaU3pN89MDsVD20Cdhq4?=
	=?us-ascii?Q?GU9OsEqGWhbPEfzPMTH4MqxuH38+bguaCsBqSG9xfKYdntteipkkLhpfXu4b?=
	=?us-ascii?Q?FF6ypMMLmaLY4HKlkdfgJutxqSrhGlxf4YNaj//t761SUOkoCdBGbrMPUyaH?=
	=?us-ascii?Q?odzljaBn4UHWyFxjM9IlJcJtgHl1Mfcnqf1weQ1+B2Xy+01crLBGTn9Pmica?=
	=?us-ascii?Q?o75dP1/UAVkOlYvrlMURALpYDKjmxIILnVlnCftMKYpMJM3SWt9Tk/9HI615?=
	=?us-ascii?Q?8Ap2vrn5uD08E7s3C/kR37Q/SUHxcZPLkMNT9rMPb8tFozuXSfU/Tb4Wr7S6?=
	=?us-ascii?Q?b4ELYd0iZwX5erx3SftAcptC1lMEv2B+61qQ+XJfCFZBFcuOFJxwmJw/pgSk?=
	=?us-ascii?Q?C4rYuqaeoI95MQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02HT119;
	6:CS/x+xUWGLlNG+flpaf1PGFZxgM8PA09xwOAQi25a51QgHlDTvyDwVys4ASpFQ3PLZ319raJe4yNp1X1RJvBX672oPeJU4lrjvv4JPxdc4UgPfzMr8//IGCwY2qxcj0cVTtc5YnY75Q2UEbH/3gl3jdlu+7dciQimPd1wjsK96sd6hWvrXzA1Kk5vPNc+PIZOcaPtNI9KYFlTy9KacCHpBnf4698IUF8f40QxrXlHrFFUNE7Ywn2COWNbuzAJDJt7gc+lZgkluhrZMwLlKBLan2JPvgmuMgufYe4JccCsOp9xGoNMv6sG5lXY//FlsPgdZZa6kKESgQ42nLiuknX1A==;
	5:/hVxGwXQYgG86J9dADeADDBQrADV+KeNhbLOu7VsXsY//wanN0j1zeUqZFmiAODKuOibGcZl9Jw6ir7vhzAiMsugzFwWTaPhNV1eq5D/ChzRkPdV/rN1Ph5fldrVZQObUjwdsPBJHoZeHw3G47AkpA==;
	24:s0S1ZYjvpRyYUpgrfXychLCRhTCcqaaWan8+BCyIPQEN3oLcZPU8fvCJXhpYRqXBfqaFKLq2tXsjD9Ae25scNuvDjZrbsGOtMgnEnUxLw8o=;
	7:4YbDqbJ0Ct5K98TOOBlDgwt8rJ7aaafgmNX2HvIdAXiq94fvZOnF+U7zhHJyXYAAnUJIyBsvqx2kNuZBLJFgnHv11nQMElqcIOW8FnnHL6uLZ/R9BOAuyQrjRlRHOTV+hMvRNfcn9YTvUEMkjNEK3sKjVm4B9F4ANYwglwTIVubpxH7FmRyfRQ+lUC9iLNk/Cr5HeKs7z8M6T2hT04mSnY4sRWxPs1R5eIKFTZIPRuJcETefldZG4WS2TpKua0ZU
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2016 16:56:14.3727 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT119
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.70
Subject: [Qemu-arm] [PATCH v1 1/1] MAINTAINERS: Update the Xilinx maintainers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	crosthwaitepeter@gmail.com, alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y24siRBXJJ5S
Message-ID: <20160728165539.gt4Kb1DAg5t7sDA3RYhR2w3CFQAU1iwTfEbhb0A3OqA@z>

Update the Xilinx maintainers documentation to simplify what we maintain
and cover all of our upstream code.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 MAINTAINERS | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1d0e2c3..14183d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -449,23 +449,23 @@ S: Maintained
 F: hw/*/versatile*
 
 Xilinx Zynq
+M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 M: Alistair Francis <alistair.francis@xilinx.com>
-M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
-F: hw/arm/xilinx_zynq.c
-F: hw/misc/zynq_slcr.c
+F: hw/*/xilinx_*
 F: hw/*/cadence_*
-F: hw/ssi/xilinx_spips.c
+F: hw/misc/zynq_slcr.c
+F: include/hw/xilinx.h
+X: hw/ssi/xilinx_*
 
 Xilinx ZynqMP
 M: Alistair Francis <alistair.francis@xilinx.com>
-M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
+M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 L: qemu-arm@nongnu.org
 S: Maintained
-F: hw/arm/xlnx-zynqmp.c
-F: hw/arm/xlnx-ep108.c
-F: include/hw/arm/xlnx-zynqmp.h
+F: hw/*/xlnx*.c
+F: include/hw/*/xlnx*.c
 
 ARM ACPI Subsystem
 M: Shannon Zhao <zhaoshenglong@huawei.com>
@@ -948,14 +948,6 @@ S: Supported
 F: hw/scsi/megasas.c
 F: hw/scsi/mfi.h
 
-Xilinx EDK
-M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-M: Alistair Francis <alistair.francis@xilinx.com>
-M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
-S: Maintained
-F: hw/*/xilinx_*
-F: include/hw/xilinx.h
-
 Network packet abstractions
 M: Dmitry Fleytman <dmitry@daynix.com>
 S: Maintained
@@ -1243,6 +1235,12 @@ F: docs/*qmp-*
 F: scripts/qmp/
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
 
+Register API
+M: Alistair Francis <alistair.francis@xilinx.com>
+S: Maintained
+F: hw/core/register.c
+F: include/hw/register.h
+
 SLIRP
 M: Samuel Thibault <samuel.thibault@ens-lyon.org>
 M: Jan Kiszka <jan.kiszka@siemens.com>
-- 
2.7.4

