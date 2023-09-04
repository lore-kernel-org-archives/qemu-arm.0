Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1238548ejb;
        Mon, 4 Sep 2023 03:28:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOVAsK2L4Gn2wXvRy4V7MEW2eVgmhFMVKFlosu9n38+cAgsL7Z+iuRMVoJj7kftPQa8ciN
X-Received: by 2002:a67:f845:0:b0:44b:fb1d:2e3a with SMTP id b5-20020a67f845000000b0044bfb1d2e3amr8050371vsp.23.1693823286021;
        Mon, 04 Sep 2023 03:28:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693823286; cv=none;
        d=google.com; s=arc-20160816;
        b=vU6NJTUvpFVBm+nGloQH9sR8UynLxL+SElNbeDaDc/hPUTWtM5n4kVVHaV8idSs/s/
         ldrZrurTkr3CRSQNDqioD4L0z33AnDmMD9KRTWB5I49WwRvYBQVAZHY5g7J1IF7OysBZ
         ne+fFzEV76cbxIHmO5BFiE9BhUsaaKJGM2Ri688GXH3ropdwVVGxjp3WToeVIw6dSkX1
         nzuSi0QQCirLOLek6OBZyifw7VhPjb3UV8JKgRGiGNYYDu+OKw+EbCO8SdUjOkWgDNoF
         R2DjGlYyFEFqSOAKk+RylJ3xIGiDc/tj0dAE3woE5nSql2Rc/pQl1SzE2Iz3FRh6R0lV
         v0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :references:subject:cc:to:from:date;
        bh=v5SRtfEKbxZTHp15qTMhJN9a6VjzMNwfYQ9UW5U5Hto=;
        fh=TPuqDWNMdq96IDBssnZ5cRlKmE2feXZTfz7taqWAy8E=;
        b=aLd6GQRgSn5HmxmX71OLFyc35uxyqJnEFWhbzOYCq2k73ZzSqD5VbRZFwhjhnVirMt
         gTZNhXTGvpjsw0qNNo9t0uryTTA/TNmliSC0PsI1U+V3TcBmJuz0sHs8qVchM3tFcXuD
         W9RkMnBMr84JT4oO/N7I8xYejOyFRJ55QWOUwOoQUCVWuLGjLI6ITcNaGmL6c83x9A9A
         k7qhm0xwmqrGB0nE6cEUhR24sxuO6FNq615cCQeomXxRll4vxMoUphDUiXZQqL3ABWwV
         8vec6JzCU2JvKgxepGXUPWmlAJZeRuulVesHkVwTBh0pCQY+tXOcy2mfqIlpSzUcCnpH
         C/OA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fh3-20020a0562141a0300b006493968ca8fsi6396776qvb.580.2023.09.04.03.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 03:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd6oC-00031U-0n; Mon, 04 Sep 2023 06:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qd6o3-0002nU-J6
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 06:27:43 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1qd6ny-0004VZ-KC
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 06:27:43 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwAHgpT_sPVkBtGmAA--.32321S2;
 Mon, 04 Sep 2023 18:27:11 +0800 (CST)
Received: from WYQ-S (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDnbIv9sPVk1VsAAA--.781S3;
 Mon, 04 Sep 2023 18:27:10 +0800 (CST)
Date: Mon, 4 Sep 2023 18:27:10 +0800
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: jonathan.cameron <Jonathan.Cameron@Huawei.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "gregory.price@memverge.com" <gregory.price@memverge.com>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
References: <2023082215220191352877@phytium.com.cn>, 
 <ZOZho3SyqASo9MPD@memverge.com>, 
 <20230824100635.0000565d@Huawei.com>
X-Priority: 3
X-GUID: 861804EB-D77C-4D43-9728-932112EF770A
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.228[cn]
Mime-Version: 1.0
Message-ID: <2023090418270957278822@phytium.com.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart268137765623_=----"
X-CM-TRANSID: AQAAfwDnbIv9sPVk1VsAAA--.781S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAMAWT02qQDoAABsA
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_FONT_LOW_CONTRAST=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: gOQQQGK+ZZLO

This is a multi-part message in MIME format.

------=_001_NextPart268137765623_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGksIEpvbmF0aGFuDQoNCkR1ZSB0byBteSBwb29yIGV4cGVyaWVuY2UgYW5kIGtub3dsZWRnZSBv
biBjeGwgZGV2ZWxvcG1lbnQgaGlzdG9yeSwgSSBhbSBzb3JyeSB0byBjb250aW51ZQ0KdG8gYXNr
IHNvbWUgdmVyeSBzaW1wbGUgYW5kIGZ1bmRhbWVudGFsIHF1ZXN0aW9ucyAgOiAoDQoNCkluIGh3
L2FybS92aXJ0IDoNCltWSVJUX0NYTF9IT1NUXSA9ICAgICAgICAgICB7IDB4MCwgNjQgKiBLaUIg
KiAxNiB9LCAvKiAxNiBVSUQgKi8NCg0KSXQgc2VlbXMgbGlrZSB0aGUgc3BlY2lmaWMgc3BhY2Ug
Zm9yIE1NSU8gb2YgY3hsIGhvc3QgYnJpZGdlcy4gIFdoeSBub3QganVzdCB1c2UgdGhlIGV4aXN0
aW5nICJWSVJUX1BDSUVfTU1JTyIgDQpzcGFjZSBmb3IgdGhlbT8gDQoNCkkgd291bGQgYmUgZ3Jh
dGVmdWwgaWYgeW91IGhhdmUgc29tZSBmcmVlIHRpbWUgdG8gaGVscCBjaGVjayB0aGlzIGlzc3Vl
IDogKQ0KDQpNYW55IHRoYW5rcw0KWXVxdWFuDQo=

------=_001_NextPart268137765623_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }body { font-size: 13px; font-f=
amily: "Times New Roman"; color: rgb(0, 0, 0); line-height: 1.5; }</style>=
</head><body>=0A =0A<div>Hi, Jonathan</div><div><br></div><div><span style=
=3D"background-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);">Due&nbsp;to&=
nbsp;my&nbsp;poor&nbsp;experience&nbsp;and&nbsp;knowledge&nbsp;on&nbsp;cxl=
&nbsp;development&nbsp;history,&nbsp;I&nbsp;am&nbsp;sorry&nbsp;to&nbsp;con=
tinue</span></div><div><span style=3D"color: rgb(0, 0, 0); background-colo=
r: rgba(0, 0, 0, 0);">to&nbsp;ask&nbsp;some&nbsp;very&nbsp;simple&nbsp;and=
&nbsp;fundamental&nbsp;questions&nbsp;&nbsp;:&nbsp;(<br><br>In&nbsp;</span=
><span style=3D"background-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);">=
hw/arm/virt :</span></div><div><span style=3D"color: rgb(0, 0, 0); backgro=
und-color: rgba(0, 0, 0, 0);">[VIRT_CXL_HOST]&nbsp;=3D&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{&nbsp;0x0,&nbsp;64&nbsp;*&n=
bsp;KiB&nbsp;*&nbsp;16&nbsp;},&nbsp;/*&nbsp;16&nbsp;UID&nbsp;*/</span></di=
v><div><span style=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0,=
 0);"><br></span></div><div>It seems like the specific space for MMIO of c=
xl host bridges.&nbsp; Why not just use the existing&nbsp;<span style=3D"b=
ackground-color: transparent;">"</span><span style=3D"color: rgb(0, 0, 0);=
 background-color: rgba(0, 0, 0, 0);">VIRT_PCIE_MMIO</span><span style=3D"=
background-color: transparent;">"&nbsp;</span></div><div><span style=3D"ba=
ckground-color: transparent;">space for them?&nbsp;</span></div><div><span=
 style=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);"><br>I&=
nbsp;would&nbsp;be&nbsp;grateful&nbsp;if&nbsp;you&nbsp;have&nbsp;some&nbsp=
;free&nbsp;time&nbsp;to&nbsp;help&nbsp;check&nbsp;this&nbsp;issue&nbsp;:&n=
bsp;)<br></span></div><div><br></div><div>Many thanks</div><div>Yuquan</di=
v></body></html>
------=_001_NextPart268137765623_=------

