Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp595870ejb;
        Wed, 2 Aug 2023 13:04:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEBYPFcSV5qOa72PeHJ7uCU1K1wcmrmVCsxNLo0W6AXdrh3UCvTRI3AjM+er6QZeIUX2Yni
X-Received: by 2002:a05:620a:121b:b0:76c:6f89:e5f1 with SMTP id u27-20020a05620a121b00b0076c6f89e5f1mr17740302qkj.18.1691006649171;
        Wed, 02 Aug 2023 13:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691006649; cv=none;
        d=google.com; s=arc-20160816;
        b=YpHEZAfXVxrDUrvrOiJgfFEui+hGl19wi5baLQeGr52v2dY4g4qlCDMxtBjD0GW1HT
         Sc09nldjdspcTWJrO0JVWW+Vzvrf2m3H3OnHCxvbzQ27fq6kaK/+Wx0kPksUxJQHg8xR
         FBg+cZmp1zoA/ArRvqoZeEMaKlWWP+Htwm8sdtWruDwT/CAr4fgB+tPSHPd+LnmAAvbN
         CyTerwqYFZarE1u/Pon5NbokkES4ajVxg03Nm67+02SebSXe3kzkFpMgnuE34A32XeNc
         Ng41y56oMQbSNIqdsb/3d2MMeSA0uQKCmuv07LEeOaBCPlVB+elHm18rnCf8wYBxzI0y
         vjWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=BNgzD4jjIJyoBNHAX+Nm9FQyHv/N12u9iQos8WHZvBw=;
        fh=wTuZIrxLcWc+8gegFLTD0CSAaLr16AiWkokK+KQeIXI=;
        b=J72NEAa7ab4jNafnyo8QZnRo28Zws7LjIqk2CWshjvVf9/JMsE3X6T4TsHKh+5e+sr
         LQsmvB1ufjUZH2hufT8VgRUBbTRsQKW8MLOuJL8ICvXGJzCQL8tVPzDqrHPMquX0vNhm
         SS3xcDAx1o/FLBlsMDIlRQBb1QKLr95QEJQlulssmxIRnAAcVuACgf+aCBJLQ2dsP6mm
         cM6SLI7gPScgKjJ4jrpgakLBO2ZDyT/pV/vfnyHoOON8SqorJlCSNFB7Fvc1z/y8HI2Q
         lLZn8E6Lmms1X7Gdh9ihFULj/+2YnGw2pburqZSjLSJs9FnoiAK2F216tHz+DMZKdbk3
         Ugmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=PS5vuKcF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a379303000000b00767dcd66303si8673565qkd.20.2023.08.02.13.04.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Aug 2023 13:04:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=PS5vuKcF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRI4X-00006X-Nf; Wed, 02 Aug 2023 16:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_chadk@quicinc.com>)
 id 1qRHTK-0008Fk-SU
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 15:25:27 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_chadk@quicinc.com>)
 id 1qRHTI-000631-Oo
 for qemu-arm@nongnu.org; Wed, 02 Aug 2023 15:25:26 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372HattF032466
 for <qemu-arm@nongnu.org>; Wed, 2 Aug 2023 19:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : subject
 : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=BNgzD4jjIJyoBNHAX+Nm9FQyHv/N12u9iQos8WHZvBw=;
 b=PS5vuKcFlOOn6JptGEfuha3te3dvjeKaCrY8pcG7mRT713XrEYT65TZGwbXik6MlWKLa
 o4Nabu6RJk7fkv9ITgLWNyWK/2W3J9X9+uL5NRgVRq1eUEt5gv8qplPtwBji19y4o0Y9
 23xEyA5VpGZsGKRAUofLC5GmqWnGDqQtFHYj7DsYvNGi2s/Glx5UXECgBRDvqmvDlK+y
 Hoc2QfKuK2GX4HePZtFn/8EiPUnZptkajCzF0Phfj4fQWmCt6ci6Pkx9oIF+D4DG7dEj
 pDv7jEz9LX3Xtnaezu8a6Hu2jL6Ir+TAbeasKNCLVazacr4G2PKpgvS90TVjzbT73v6i ag== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7upp08r4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 02 Aug 2023 19:25:20 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372JPJig018602
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-arm@nongnu.org>; Wed, 2 Aug 2023 19:25:19 GMT
Received: from nasanex01a.na.qualcomm.com (10.52.223.231) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 12:25:18 -0700
Received: from nasanex01a.na.qualcomm.com ([fe80::482d:250d:70b6:e1c5]) by
 nasanex01a.na.qualcomm.com ([fe80::482d:250d:70b6:e1c5%12]) with mapi id
 15.02.1118.030; Wed, 2 Aug 2023 12:25:18 -0700
From: "Chad Karaginides (QUIC)" <quic_chadk@quicinc.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: ARM64 EL3 Exception SP_EL3 Issue?
Thread-Topic: ARM64 EL3 Exception SP_EL3 Issue?
Thread-Index: AdnFdhwK+23wUfZ8QmKETJsE742LSw==
Date: Wed, 2 Aug 2023 19:25:18 +0000
Message-ID: <6b1211f5bb004b12a57c142b54fa82a3@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.110.78.4]
Content-Type: multipart/alternative;
 boundary="_000_6b1211f5bb004b12a57c142b54fa82a3quicinccom_"
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bBn-wOMOXWDbYshV5DLRK_4yk-YcXBVL
X-Proofpoint-ORIG-GUID: bBn-wOMOXWDbYshV5DLRK_4yk-YcXBVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_16,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 malwarescore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=781 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308020170
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_chadk@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 02 Aug 2023 16:03:51 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 756nnJB9U839

--_000_6b1211f5bb004b12a57c142b54fa82a3quicinccom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am executing the Zephyr RTOS on a QEMU A53 core with Trace32 as the front=
end.  I am seeing a behavior difference between the QEMU A53 core and real =
hardware.  Execution is in EL1h and an SMC call is made.  Execution transit=
ions to EL3h but the EL1 stack pointer is not propagated to SP_EL3.  Is thi=
s a potential bug or is this functionality covered in a test case somewhere=
?  If it is a bug I have no problem diving in and trying to help fix it.  I=
 am new to QEMU but willing to help.  Just wanted to make sure I am not doi=
ng something wrong first.

Thank you in advance,
Chad

--_000_6b1211f5bb004b12a57c142b54fa82a3quicinccom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am executing the Zephyr RTOS on a QEMU A53 core wi=
th Trace32 as the frontend.&nbsp; I am seeing a behavior difference between=
 the QEMU A53 core and real hardware.&nbsp; Execution is in EL1h and an SMC=
 call is made.&nbsp; Execution transitions to EL3h
 but the EL1 stack pointer is not propagated to SP_EL3.&nbsp; Is this a pot=
ential bug or is this functionality covered in a test case somewhere?&nbsp;=
 If it is a bug I have no problem diving in and trying to help fix it.&nbsp=
; I am new to QEMU but willing to help.&nbsp; Just wanted
 to make sure I am not doing something wrong first.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you in advance,<o:p></o:p></p>
<p class=3D"MsoNormal">Chad<o:p></o:p></p>
</div>
</body>
</html>

--_000_6b1211f5bb004b12a57c142b54fa82a3quicinccom_--
