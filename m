Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp2718127lfr;
        Sat, 10 Apr 2021 17:55:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/I2+1MEsIKNRepCh5Ejxw7C5DGVZG+qZYkRe3FD/CFwsj5bt4Z8vEEBDW6B5S57szHH1Q
X-Received: by 2002:a05:6638:2388:: with SMTP id q8mr3205100jat.127.1618102525004;
        Sat, 10 Apr 2021 17:55:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618102525; cv=pass;
        d=google.com; s=arc-20160816;
        b=I4PHGYVJO8KjyYSakfITULvM0J4m+CEKr5yLkMlufxIKrfJh2nMbwk85ydQmt0Jng3
         coerzmtUjbpnOxi4xw+vN065ZQb2VLIpcBpjUTOQ4DuGRIPwleDbCiS0SFi7zAvztuIf
         L3Gr4K4jmNixLH+WfnVaMj5cryQqLDAsZf8OaoLSZhjf3WQoibXVNFMj29TybaQQbWy2
         21dCAbPst09uZkf76/FkknUDq5ZdDCdTmgZYwf0QncKZsT6ko3NLMg/u2Lij9kNbJfLk
         005GFwdftLH1uDI3l958cLPviFp7jlWOyZrVlr+k/Hli5qidtndU4PJVkceRFw2uRDZj
         dupw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from;
        bh=1I0fkhhqtZwmQtFSZJg/8AMsW8MX2dPLIKLDdvuu9/8=;
        b=xovZxtwgGGBKJ7idcp3k6IJLYL2LP3LOfeRmE0bPgNothUOjGkj8zy93ineJjIP3Qc
         Z7mS0lOY0SaN0yUJwG95YnCOYg8DbD2mDSTsyBIcBWLF2wV/M6G+Rt0p65a4zFJ6NxZ+
         rxikAyYg8vkCciUm4/0eHSs3YPcm7uroX99vXrgSwvxaCVuJTNHfPw7xbxrJQWkEQa78
         OPcR2QGrTztN/Ve/cTV0yvAAYD6BCOjr6c26AWtgRjF1BlKSJRSbnsSH6xfiwwW8/Odh
         QGRZhN4UDbjLWpyLvnOBc0uaM0wx9czobVYL1vMoXYJm0L2z7Z6cWHigg72tuBgcOnbQ
         b1bQ==
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=hotmail.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si8215172iow.73.2021.04.10.17.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Apr 2021 17:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=hotmail.fr
Received: from localhost ([::1]:53126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lVONo-0001L2-AG
	for alex.bennee@linaro.org; Sat, 10 Apr 2021 20:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikael.esposito@hotmail.fr>)
 id 1lVMP0-0006zH-3U
 for qemu-arm@nongnu.org; Sat, 10 Apr 2021 18:48:30 -0400
Received: from mail-oln040092075033.outbound.protection.outlook.com
 ([40.92.75.33]:64993 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mikael.esposito@hotmail.fr>)
 id 1lVMOy-0006xb-JN
 for qemu-arm@nongnu.org; Sat, 10 Apr 2021 18:48:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzTkMJrGmFYoMaggA5fA6Jdz9rKIGotxxN8NMwGkes5g3EeYhU444i90lQisplhmaNr6sR4tARLvdtdwho5rVjR738kNKIAg6GbmdgY5ALRTpx0XmqyKhnAPm2g4F2Jwibr9+hGyskr9y+k6cEudeZmDZhKbgDgDyAnv4Y2q9mUne47659yJeyhX2NjRtC8Leo1LEmImLe/FvgDuthphkj4Iu2h+Y011rmBQ1HDkxSW1Ji7sVG20DMYKQOa+PfKhEQrbi/eMJd1Dfhb192u4RUXMqzI9s80a9ZY1vwHEl32tAibU3mWPXVcb4l4JsgAEk/ZidqjjeWAo3BrLLosgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1I0fkhhqtZwmQtFSZJg/8AMsW8MX2dPLIKLDdvuu9/8=;
 b=aCTgpgHnsppRRT1UjQEB6v6OzSYt5T1b0mhkVYkkul35Em8welbFqtXk6z2anR4WeHR2I6bOt2qLGgt4wCuiwKPdp8/EswHePFYm/ZzaRVJDs6VmpDeUps8d4jayEchXnM2aMT8eNmgu4qSMjvw/kX8g8XAc7Cikoawq9oaaOU+YdB0cVJ+Z2LvM4v5WIcHSPJ0LMTKtophM5UvbVwlqmRO8WjCQAhjWCBS0eEtoL2WV5uHX5nbf9Mn247Qq7D/NEuZrunlUPPfzpTkQ6w2XLYHpFRpyXxuvs6xtFAexqapgTkM3iPSkFjO00bAh9GqhWnRNaUdyxdqNNNtzOd8FQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VI1EUR04FT027.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4f) by
 VI1EUR04HT205.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::400)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Sat, 10 Apr
 2021 22:33:23 +0000
Received: from VI1PR02MB5872.eurprd02.prod.outlook.com
 (2a01:111:e400:7e0e::51) by VI1EUR04FT027.mail.protection.outlook.com
 (2a01:111:e400:7e0e::323) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Sat, 10 Apr 2021 22:33:23 +0000
Received: from VI1PR02MB5872.eurprd02.prod.outlook.com
 ([fe80::bd6e:707f:ee88:2c20]) by VI1PR02MB5872.eurprd02.prod.outlook.com
 ([fe80::bd6e:707f:ee88:2c20%5]) with mapi id 15.20.4020.022; Sat, 10 Apr 2021
 22:33:23 +0000
From: esposito mikael <mikael.esposito@hotmail.fr>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Question about harddrive
Thread-Topic: Question about harddrive
Thread-Index: AQHXLllzcJQhW2BzFEWItpvFMRZR9g==
Date: Sat, 10 Apr 2021 22:33:23 +0000
Message-ID: <VI1PR02MB58723834F2B01A718885B0DA9B729@VI1PR02MB5872.eurprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C4AB70AAD8C188CACDEA5F25A93CCFA4228ACB752CDF4B4E73B82FD79CDAE9B5;
 UpperCasedChecksum:68EA249F17BD7FCA6FD168BB9F6B0E743FA59EEF01F8A95C9DF6B96E2D30573A;
 SizeAsReceived:6770; Count:41
x-tmn: [JhWv6S1z7PrGWltpo3LRKaTVddK6wL3RbHmwbeDNoeiMk1yGDRLkltA2T20u/Ifw]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: d0913c9d-fbb2-4bd4-b1cd-08d8fc70a68f
x-ms-traffictypediagnostic: VI1EUR04HT205:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hhzAvHebjjrEZf8FcoLi3rIDav/0vvFPcHZN67sT0zmqIGXu6Ey7rDgHtgZOTzAYOf2VG1xXh6BA5hbTNMkCrUYIvQHBCH511/X6A9pprXNsgE8ELNb8ncspR3kbj/Hq7oANrT5H8issz2OipIvNAVAV11Jo9OU/trGl0McO95vDQo+vmift0H6jJ5fYq9/viMAEDGS/2VlGyopGYr6LdRSvThevPlwfKoi6JSzFjZkPzKSM+stmVW/OBRAhMKdP6eAPR3xQvHcpXwOtwmFreRsT/zsK6oz1Ov/35tYgq2lMzYaR6WmyLy1qA1nuDZk5EKZBN2Cjz4kilL6NDIpEAgz5FUVMu/qcVaGaUYabfWYP8SJuBsntnRmQLxkvEJuS
x-ms-exchange-antispam-messagedata: oexZKqO9onxQ+dmGp2jg1Vsv5lE7BUHEi8Svw9Gd54SH5Mgp++95PQxQH58GqoLgX2glBg2etcTO6lvFOO0h8/cjucVPUdDGn2Ljqf8dqU8ikmLQ+w+GuDQUuqSFUIeg4vpj1c8bq6qjBk1fPmP9wyYCMv+q4bMhLE9nsuqbn/c4hyXKca9vfsmeaKz28/S5rPAKAQagNiPsaGBQ3f3zRA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_VI1PR02MB58723834F2B01A718885B0DA9B729VI1PR02MB5872eurp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR04FT027.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d0913c9d-fbb2-4bd4-b1cd-08d8fc70a68f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2021 22:33:23.3384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT205
Received-SPF: pass client-ip=40.92.75.33;
 envelope-from=mikael.esposito@hotmail.fr;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_20=-0.001, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 10 Apr 2021 20:55:14 -0400
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F10TdWPCqKQo

--_000_VI1PR02MB58723834F2B01A718885B0DA9B729VI1PR02MB5872eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have juste a little question, i just start to use qemu for emulate arm co=
mputer. And i can't change the hard drive description for change QEMU HARDD=
ISK for something like DELL.

For information, i don't use a virtualise storage i boot from a modified im=
g file.

Thx for your help.
Best regard
Cordialement,
Mikael Esposito


--_000_VI1PR02MB58723834F2B01A718885B0DA9B729VI1PR02MB5872eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
</div>
<span style=3D"margin:0px;font-size:12pt;background-color:rgb(255, 255, 255=
)">Hi,</span>
<div style=3D"margin:0px;font-size:12pt;background-color:rgb(255, 255, 255)=
"><br>
</div>
<div style=3D"margin:0px;font-size:12pt;background-color:rgb(255, 255, 255)=
">I have juste a little question, i just start to use qemu for emulate arm =
computer. And i can't change the hard drive description for change QEMU HAR=
DDISK for something like DELL.&nbsp;</div>
<div style=3D"margin:0px;font-size:12pt;background-color:rgb(255, 255, 255)=
"><br>
</div>
<div style=3D"margin:0px;font-size:12pt;background-color:rgb(255, 255, 255)=
">For information, i don't use a virtualise storage i boot from a modified =
img file.</div>
<div style=3D"margin:0px;font-size:12pt;background-color:rgb(255, 255, 255)=
"><br>
</div>
<div style=3D"margin:0px;font-size:12pt;background-color:rgb(255, 255, 255)=
">Thx for your help.</div>
<div style=3D"margin:0px;font-size:12pt;background-color:rgb(255, 255, 255)=
">Best regard&nbsp;</div>
<div style=3D"margin:0px;font-size:15px;font-family:&quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syste=
m, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;color=
:rgb(32, 31, 30);background-color:rgb(255, 255, 255)">
<div style=3D"margin:0px">
<div style=3D"margin:0px">
<div style=3D"margin:0px;font-size:12pt;font-family:Calibri, Helvetica, san=
s-serif;color:rgb(0, 0, 0)">
<b>Cordialement,</b></div>
<span style=3D"margin:0px;font-size:12pt;font-family:Calibri, Helvetica, sa=
ns-serif;color:rgb(0, 0, 0)"><b>Mikael Esposito</b></span></div>
</div>
</div>
<div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:12pt; col=
or:rgb(0,0,0)">
<b></b><br>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_VI1PR02MB58723834F2B01A718885B0DA9B729VI1PR02MB5872eurp_--
