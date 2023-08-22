Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp536982ejx;
        Tue, 22 Aug 2023 00:22:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc0lPdjV3tF8hpBcCsR8r8e1UzqgTbIYZ+8/r9FjMIFY6sHdcbSER+PJ7mkqK65zdE8D/z
X-Received: by 2002:a05:620a:408f:b0:76c:b2d5:5bbe with SMTP id f15-20020a05620a408f00b0076cb2d55bbemr11231837qko.14.1692688954413;
        Tue, 22 Aug 2023 00:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692688954; cv=none;
        d=google.com; s=arc-20160816;
        b=djtDmDX0T71lJTE7dztqjkyJt+Pcf+/AV28+XCTNzxJYx6t5hahxQXgxwKPfyk1WUp
         JLS8OTAi2pnfTyD/USxsFpiK2wpX2eCIkUDf/2KXO9ZDxiCGMzO2EvrW0k0izxyTH5II
         XEVYtCyRAY1dSJFbCkrU7MYBpqwCJ76XVedTWeAZUvzcKtArSH71ktNBmawMUTh1D1SP
         vvGOxJs9ogsd7U1yTrAiN5IW5/UbpA2Nt8o+zvmHhpmxo8ADyCCuqub/lS7CZ95uoghE
         e75c/ysDfsjr/GbyvelT8crv46Cv6VwMv4yFj/fuikMCCPC7KpE9SNNbrl+wca/9I1bu
         PSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version:subject
         :cc:to:from:date;
        bh=X68REWpI6iATohF6eEmhdiwrJLCdIZEt3v+inEsmHxw=;
        fh=/Ja1wSk8TMPYCYbZ4iI6eLv9PP592kvLmacDUyo47/w=;
        b=u7TcwhB+H2f+eybfdouJT0NSh3QdS2Te6kXtlhfbPBHzWfj8fbi6tlSvXEueDHsN4q
         X1cQDrnMrb/NRf/BHOiqZBVYv5K1rYdXmn+Py8SSZyq5usBoAzpornoHdFjeu+c87lkK
         7uh9QsDGOvwXOi0d4T7X9wKZqCQU+pMJsxEqsuoO/axpNozNyMwj0/hUMQL2oJ4Aa0Mx
         p7+FuJaORS1i1zA6Y4S2YHC/CIDmKGexu2B3HexFxwx1o2BaywciAeRQr2VanohJ0nGi
         IZlNTGj4zXZA2ozzImw7aLEH/7SJNVBnKdFOIJah3212JxREM02xYmQ6Qm+XjYd/HxYh
         5q7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dl7-20020a05620a1d0700b007671d7c2370si5849713qkb.198.2023.08.22.00.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 00:22:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYLie-0003Rx-NB; Tue, 22 Aug 2023 03:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qYLid-0003Rb-Ll
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 03:22:27 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1qYLia-0005Ar-6x
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 03:22:27 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwCXeaofYuRkfDUhAA--.12388S2;
 Tue, 22 Aug 2023 15:22:07 +0800 (CST)
Received: from WYQ-S (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDHTiYaYuRkKkQAAA--.2837S3;
 Tue, 22 Aug 2023 15:22:02 +0800 (CST)
Date: Tue, 22 Aug 2023 15:22:02 +0800
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: "gregory.price@memverge.com" <gregory.price@memverge.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 jonathan.cameron <jonathan.cameron@huawei.com>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
X-Priority: 3
X-GUID: 869501CA-C6AB-40D6-8D54-1763B8C6712E
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.228[cn]
Mime-Version: 1.0
Message-ID: <2023082215220191352877@phytium.com.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart656276802654_=----"
X-CM-TRANSID: AQAAfwDHTiYaYuRkKkQAAA--.2837S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQATAWTjtyYCIwABsl
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWrAw43CFWrCrykZFWxZF4xZwb_yoWxGFb_ur
 9rKryIgrs7CFZag39Ikr13XrykCrZakFW5GF43WFn7Jr1jyr4xGF92g3s3u345Kr12grZ5
 ua1jqa1fua9a9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_FONT_LOW_CONTRAST=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
X-TUID: jt7H0B0acn+S

This is a multi-part message in MIME format.

------=_001_NextPart656276802654_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGksIEdyZWdvcnkNCkkgYW0gc29ycnkgdG8gZGlzdHVyYiB5b3UsIGJ1dCB0aGVyZSB3YXMgc3Rp
bGwgYW4gaWdub3JlZCBwcm9ibGVtIGFib3V0IENYTCwgDQpBbHRob3VnaCBJIGhhZCBzZW50IGFu
IGVtYWlsIHRvIGpvbmF0aGFuIChtYXliZSBoZSBpcyBidXN5IHJlY2VudGx5IHNvIGhlIGZvcmdv
dCB0byByZXBseSksICANCnRoZSBMaW5rIGlzIDogaHR0cHM6Ly9saXN0cy5ub25nbnUub3JnL2Fy
Y2hpdmUvaHRtbC9xZW11LWFybS8yMDIzLTA4L21zZzAwMjc4Lmh0bWwgDQoNCk1heWJlIHRoZSBj
b3JlIHF1ZXN0aW9uIGlzIHRoYXQgaG93IHNob3VsZCB3ZSB1c2UgQ1hMIGNvbXBvbmVudHMgd2l0
aCBhIHN0YW5kYXJkIFBDSWUgc3lzdGVt77yaDQoxKSBJbiBRZW11LCBzaW5jZSB0aGUgYm9hcmRz
IG9yIG1hY2hpbmVzIGluIHFlbXUgY2FuIG9ubHkgdXNlIHB4Yi1jeGwgKGF0dGFjaGVkIG9uIHBj
aWUuMCkgdG8gYWRkDQpjeGwgaG9zdCBicmlkZ2UsIHRoZXJlZm9yZSwgdXNlcnMgc2hvdWxkIGF2
b2lkIHRvIGFzc2lnbiBhbiBvY2N1cGllZCBidXMgbnVtYmVyIGJ5IG90aGVyIGRldmljZXMNCnRv
IHB4Yi1jeGwuDQoNCjIpIEluIHJlYWwgaGFyZHdhcmUsIENYTCBjb21wb25lbnRzIHNob3VsZCB1
c2UgaW5kZXBlbmRlbnQgQ1hMIHJvb3QvdHJlZSAoQUNQSTAwMTcmQUNQSTAwMTYpDQp0byBzZXBh
cmF0ZSBmcm9tIHRoZSBuYW1lc3BhY2Ugb2YgZGVmYXVsdCBwY2llIHJvb3QvZG9tYWluLg0KDQpJ
IHdvdWxkIGJlIGdyYXRlZnVsIGlmIHlvdSBoYXZlIHNvbWUgZnJlZSB0aW1lIHRvIGhlbHAgY2hl
Y2sgdGhpcyBpc3N1ZSA6ICkNCg0KDQoNCg==

------=_001_NextPart656276802654_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }body { font-size: 13px; font-f=
amily: "Times New Roman"; color: rgb(0, 0, 0); line-height: 1.5; }</style>=
</head><body>=0A =0A<div>Hi,&nbsp;<span style=3D"background-color: rgba(0,=
 0, 0, 0); color: rgb(0, 0, 0);">Gregory</span></div><div><span style=3D"b=
ackground-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);">I am sorry to dis=
turb you, but t</span><span style=3D"background-color: transparent;">here =
was still an ignored problem about CXL,&nbsp;</span></div><div><span style=
=3D"background-color: transparent;">Although I had sent an email to&nbsp;j=
onathan (maybe he is busy recently so he forgot to reply),&nbsp;&nbsp;</sp=
an></div><div><span style=3D"background-color: transparent;">the&nbsp;</sp=
an><span style=3D"background-color: transparent;">Link is :&nbsp;</span><s=
pan style=3D"background-color: transparent;"></span><a href=3D"https://lis=
ts.nongnu.org/archive/html/qemu-arm/2023-08/msg00278.html" style=3D"backgr=
ound-color: transparent;">https://lists.nongnu.org/archive/html/qemu-arm/2=
023-08/msg00278.html</a><span style=3D"color: rgb(0, 0, 0); background-col=
or: rgba(0, 0, 0, 0);">&nbsp;</span></div><div><br></div><div>Maybe the co=
re question is that how should we use CXL components with&nbsp;<span style=
=3D"background-color: transparent;">a standard PCIe system=EF=BC=9A</span>=
</div><div>1) In Qemu, since the boards or machines in qemu can only use p=
xb-cxl (attached on pcie.0)&nbsp;<span style=3D"background-color: transpar=
ent;">to add</span></div><div><span style=3D"background-color: transparent=
;">cxl host bridge,&nbsp;</span><span style=3D"background-color: transpare=
nt;">therefore, users should avoid to&nbsp;</span><span style=3D"color: rg=
b(0, 0, 0); background-color: rgba(0, 0, 0, 0);">assign an&nbsp;</span><sp=
an style=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">occu=
pied</span><span style=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0=
, 0, 0);">&nbsp;bus number by other devices</span></div><div><span style=
=3D"background-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);">to&nbsp;pxb-=
cxl.</span></div><div><br></div><div><span style=3D"background-color: tran=
sparent;">2) In real hardware, CXL components should use i</span><span sty=
le=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">ndependent=
</span><span style=3D"background-color: transparent;">&nbsp;CXL root/tree =
(ACPI0017&amp;ACPI0016)</span></div><div><span style=3D"background-color: =
transparent;">to&nbsp;</span><span style=3D"background-color: transparent;=
">separate from the namespace of&nbsp;</span><span style=3D"background-col=
or: transparent;">default pcie root/domain.</span></div><div><span style=
=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);"><br></span><=
/div><div><span style=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0,=
 0, 0);">I would be grateful if you have some free time to help check this=
 issue : )</span></div><span style=3D"color: rgb(0, 0, 0); background-colo=
r: rgba(0, 0, 0, 0);"></span><div><br></div><div><br></div><div><br></div>=
</body></html>
------=_001_NextPart656276802654_=------

