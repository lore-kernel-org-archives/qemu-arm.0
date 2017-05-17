Received: by 10.25.0.6 with SMTP id 6csp412868lfa;
        Wed, 17 May 2017 13:57:41 -0700 (PDT)
X-Received: by 10.55.201.26 with SMTP id q26mr743863qki.107.1495054661250;
        Wed, 17 May 2017 13:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495054661; cv=none;
        d=google.com; s=arc-20160816;
        b=TvtaWiuWJFzNRPWXu/KvUY5Oc8IlrSru3D2wGpyd6kCtTSABHrhpo8PrGx/pZKB7Jo
         DpbrQlJLohl01BquiHYnS/xklZWIIRwh2br6X5NVskHdVb+d7xmR4D+0/FSjy2KJwP0b
         thjRXP5BUqS6e8zror/KKJ0/zJRkXtJiScFgnybyKRwjL8o+8ZenpPW6/hrhv73WGqfW
         dHkUIZAL6FCzNb2EEAl6GS/KUHUbQM4rul57ucga1yBRrRIjuzXz7VrJmlkQn/TiCrtA
         ZC08lJCYDcfi3PQteA3uJg/vnRr49Dc+aoZ5HWhGvZ+E65zzwnLEcsGgVsRT0jtZ8gaN
         qG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-length:mime-version:references:in-reply-to:message-id:to
         :date:dkim-signature:arc-authentication-results;
        bh=ZSWKgGU4NVmoEzMesgK+l3h9buK11p8sPLNdP0OXhYc=;
        b=H5GVQQ/HWd/5iaZn+gWKCyENSQR6hkRkIBDBchY6RYcgsX4vdRAIX6FwMlYZxGLDDx
         4gRAqm/1cZR7LmqqEgT1EWMAe6ZAnTG8ZKcInC7u+R27w/KJYTrEqCWwOo+JoaHtkHye
         3nG/mBBLfagG0DrqaEuupV/pAsJcv0sOBLsNCzNMPD/oDJC2BHa1B6spBHZNHvIUx4NP
         NDqQP5v4N9kAUvlBgib2VLIjk4ST5rbN9t4vOkbPvp8c60YybymPBv7srx0FFX2FTlq7
         gFkn+iwyYBMEPPDqw06JIaqFP4QppXq2aVCRarCeL/e+68vCJDYQqglmR+iiS+0Wndfp
         KX9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g9si3380956qkh.323.2017.05.17.13.57.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 13:57:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yahoo.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dB60q-0003sY-MS
	for alex.bennee@linaro.org; Wed, 17 May 2017 16:57:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB60l-0003m1-7K
	for qemu-arm@nongnu.org; Wed, 17 May 2017 16:57:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB60g-0004Xc-MQ
	for qemu-arm@nongnu.org; Wed, 17 May 2017 16:57:35 -0400
Received: from sonic311-1.consmr.mail.ir2.yahoo.com ([77.238.176.244]:35334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flypie1@yahoo.com>) id 1dB60g-0004XL-DZ
	for qemu-arm@nongnu.org; Wed, 17 May 2017 16:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1495054649; bh=ZSWKgGU4NVmoEzMesgK+l3h9buK11p8sPLNdP0OXhYc=;
	h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
	b=YjHH1jRLk1JTPhibW/lBWB6F7z0+YwBvLd2k+//va2wfy4GKabl3pIO0W9obThq+6o03bkw1j/2yxIevgDwmDpaItmcWP+y1bhz8tpAO5hC+OMD0Q9m7GvauhWaAFmDsFRzDFuUe7MP0/uBK0YCaqosawJFX2KiuEEPfdSahhSxiVoZNCpgMmK0DPm2cJn9Ko+MZ8djJHulCvQXYOzXQVsw+7fes9EF3XKEaca0n2fDiPNA9XEbluMSg9wFDLIUJ+PJPtcjqcJKVeuFJ2tnP5MRJCkJnSChCrJcYsvEm5tVkBJHqkBZbrMh9DYc9Pi4mHdNlurgHmZ5F4NXLWh6Xnw==
X-YMail-OSG: mQjNDp4VM1kDvqh4AtgY3_7bpUb7eSvhbhrN.mzvXzldVzLKHs_bJ6TqvB7qhPz
	Ic3WY7.MV95uOk_rpeV.e1US1bo.1GMm_E8aYDAr3ki00X3gcEsNE78LUwfl4FzUmoX1NVV3ofWU
	f5j0X694QsucXjzDXd4YS8mEV8JXtI.A.f96doUGzesW017ZocTzY9AkXWJKXi9VUSoUc3Gua54z
	MIAW3FkCTXlUfP.UVf_Dmc8vouTD2LXZwDRjLNKDvZbaiWzI_kdWkP1NHMiBo.t08yl63mw9KFnx
	T1deLwML2Xy3bBom_Ze9tetJmGqBT637R.PJfsgqhqE.fNOQmOZLt_67a_sn97qJ6.3DzZAryBm1
	GwmuIVwb5OfkFNu4im8UXmBZTJgoqsoc9zZbYASPoCFBLTTCce0jepMFdAQKjRWjsutfVKbSyPAo
	WTSLkYev0gEjGxXLYqAZnEHCt45fT5XtXTdea.OGz.sya58nSqjFmWbpbKhynxr5AIOPqBa0eq1t
	fYQYKrbu.5s2nAlmg8D3FLyzwgx7g5fMQUprAvxPIGpVS40gNqfmoC3Aj
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic311.consmr.mail.ir2.yahoo.com with HTTP;
	Wed, 17 May 2017 20:57:29 +0000
Date: Wed, 17 May 2017 20:53:28 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <1832071588.99743.1495054408073@mail.yahoo.com>
In-Reply-To: <5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
	<107015620.2969780.1495046091978@mail.yahoo.com>
	<5a2b9e50-1444-af4a-dc89-021a4beca0f4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_99742_1248432851.1495054408071"
X-Mailer: WebService/1.1.9679 YahooMailNeo Mozilla/5.0 (Windows NT 10.0; WOW64;
	rv:53.0) Gecko/20100101 Firefox/53.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 77.238.176.244
Subject: Re: [Qemu-arm] [Qemu-devel] Add Markus Armbrusters code for
 Broadcom Perhiperals for ARM.
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
From: John Bradley via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: John Bradley <flypie1@yahoo.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Geert Martin Ijewski <gm.ijewski@web.de>,
	John Bradley <flypie@rocketmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p5wltXzAhJd3

------=_Part_99742_1248432851.1495054408071
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Andrew Baumann has and others have release the code under GNU General Publi=
c License version 2 (GPLv2), the same as QEMU that allows me to added it to=
 QEMU as it is under the same license, by signing it off this is what I am =
certifying.=20
=C2=A0John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge H=
ill Liverpool L7 7AF=20

    On Wednesday, 17 May 2017, 20:11, Eric Blake <eblake@redhat.com> wrote:
=20

 On 05/17/2017 01:34 PM, John Bradley wrote:
> This is especial true as I meant Andrew Baumann 0xabu (Andrew Baumann)

Top-posting is not nice on technical lists.

> 0xabu (Andrew Baumann)
>=C2=A0 0xabu has 3 repositories available. Follow their code on GitHub.=C2=
=A0 |=C2=A0 |

Using github requires the use of non-free (as in freedom) Javascript.
That's why this list prefers that all patches be sent through the list
as emails, not as github pull requests.=C2=A0 I'm not going to look at what
0xabu's repository contains, but rather at what you send through the
list. But part of the contract of Signed-off-by is that you have
permission to post the patch and agree to the license in use - which
means that if your work is a modified version of Andrew Baumann's work,
then you need Andrew Baumann's sign-off before you can add yours.

Other hints for better patch submission may be found here:
http://wiki.qemu.org/Contribute/SubmitAPatch

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +1-919-301-3266
Virtualization:=C2=A0 qemu.org | libvirt.org


  =20
------=_Part_99742_1248432851.1495054408071
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;font=
-size:16px"><div id=3D"yui_3_16_0_ym19_1_1495034604426_172178" dir=3D"ltr">=
Andrew Baumann has and others have release the code under GNU General Publi=
c License version 2 (GPLv2), the same as QEMU that allows me to added it to=
 QEMU as it is under the same license, by signing it off this is what I am =
certifying. <br></div><div id=3D"yui_3_16_0_ym19_1_1495034604426_172184">&n=
bsp;</div><div class=3D"signature" id=3D"yui_3_16_0_ym19_1_1495034604426_17=
2141"><div id=3D"yui_3_16_0_ym19_1_1495034604426_174749">John Bradley</div>=
<div id=3D"yui_3_16_0_ym19_1_1495034604426_174750">Tel: 07896 839635</div><=
div id=3D"yui_3_16_0_ym19_1_1495034604426_172140">Skype: flypie125</div><di=
v id=3D"yui_3_16_0_ym19_1_1495034604426_174751">
 125B Grove Street</div><div>Edge Hill </div><div id=3D"yui_3_16_0_ym19_1_1=
495034604426_172177">Liverpool L7 7AF</div></div> <div class=3D"qtdSeparate=
BR"><br><br></div><div class=3D"yahoo_quoted" style=3D"display: block;"> <d=
iv style=3D"font-family: Helvetica Neue, Helvetica, Arial, Lucida Grande, s=
ans-serif; font-size: 16px;"> <div style=3D"font-family: HelveticaNeue, Hel=
vetica Neue, Helvetica, Arial, Lucida Grande, Sans-Serif; font-size: 16px;"=
> <div dir=3D"ltr"><font face=3D"Arial" size=3D"2"> On Wednesday, 17 May 20=
17, 20:11, Eric Blake &lt;eblake@redhat.com&gt; wrote:<br></font></div>  <b=
r><br> <div class=3D"y_msg_container"><div dir=3D"ltr">On 05/17/2017 01:34 =
PM, John Bradley wrote:<br clear=3D"none">&gt; This is especial true as I m=
eant Andrew Baumann 0xabu (Andrew Baumann)<br clear=3D"none"><br clear=3D"n=
one">Top-posting is not nice on technical lists.<br clear=3D"none"><br clea=
r=3D"none">&gt; 0xabu (Andrew Baumann)<br clear=3D"none">&gt;&nbsp; 0xabu h=
as 3 repositories available. Follow their code on GitHub.&nbsp; |&nbsp;  |<=
br clear=3D"none"><br clear=3D"none">Using github requires the use of non-f=
ree (as in freedom) Javascript.<br clear=3D"none">That's why this list pref=
ers that all patches be sent through the list<br clear=3D"none">as emails, =
not as github pull requests.&nbsp; I'm not going to look at what<br clear=
=3D"none">0xabu's repository contains, but rather at what you send through =
the<br clear=3D"none">list. But part of the contract of Signed-off-by is th=
at you have<br clear=3D"none">permission to post the patch and agree to the=
 license in use - which<br clear=3D"none">means that if your work is a modi=
fied version of Andrew Baumann's work,<br clear=3D"none">then you need Andr=
ew Baumann's sign-off before you can add yours.<br clear=3D"none"><br clear=
=3D"none">Other hints for better patch submission may be found here:<br cle=
ar=3D"none"><a shape=3D"rect" href=3D"http://wiki.qemu.org/Contribute/Submi=
tAPatch" target=3D"_blank">http://wiki.qemu.org/Contribute/SubmitAPatch</a>=
<div class=3D"yqt2368136726" id=3D"yqtfd07136"><br clear=3D"none"><br clear=
=3D"none">-- <br clear=3D"none">Eric Blake, Principal Software Engineer<br =
clear=3D"none">Red Hat, Inc.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  +1-919-301-=
3266<br clear=3D"none">Virtualization:&nbsp; qemu.org | libvirt.org<br clea=
r=3D"none"></div></div><br><br></div>  </div> </div>  </div></div></body></=
html>
------=_Part_99742_1248432851.1495054408071--
