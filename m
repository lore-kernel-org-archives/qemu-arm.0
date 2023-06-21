Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp621116ejt;
        Tue, 20 Jun 2023 20:47:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75DWMVwnjBSd4Euz4TFXnTzx3kxngHkSNWbVgbbT+Dp8inW64+sVHq9lKJAhUyI87YSIU7
X-Received: by 2002:a05:6214:1c85:b0:621:265e:f726 with SMTP id ib5-20020a0562141c8500b00621265ef726mr13836812qvb.43.1687319240597;
        Tue, 20 Jun 2023 20:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687319240; cv=none;
        d=google.com; s=arc-20160816;
        b=k8h+yHYltjzwtUNsSw4LltPkSQmGP/ZHekUNZ67v6OcdaDfRIH/aXCwTgb2j1abtNV
         VJInbzpZtwzfxyuujrJ5KzYC7N6/g/N5UT4ngbIKaYPFqz42c3nD4IAZpC51HirGTvrA
         vQOi9eXW9j9QrWkRSkXrWIZSvQTOBZN6WCo/cKe0bpoW51+NvHCmtMHTZmD05sqxuLx8
         8+YiUEXXYw6q2ji2vH+EBOmINu74ZIH0CBgbG+UtOPdWZ7ptq9y8XetSbyYKgB4hSH+2
         XBzs/cmKKY1BmdDbTJYRutNI0KJfK3OXeVGi8cBgzJOlK9NWZMW40doijayKowau+Y8P
         RBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :references:subject:cc:to:from:date;
        bh=ZZmDB6dh2SrIfJgHTLEvHwNfLmIeQDGA8LHczgV305o=;
        b=qdVEFvx+CT3oKIwJmWkDA7W2s6xmEereSdIv669OiqneSILaVlLVFReZ2Ws/k0g4J3
         E2gsi+ZH6mpcRUDvRufw8cFQfa9mcg9owwjMKs3Akk8SUnoXTE793V6RI/XHuioOtGMG
         NJlytdzo+q6PQYc/dIzde4yKVJoR4BaMqOY384wRWPNnBqTPagg9n4oevLb6zmAQJ7RP
         yMcxk/g2j0ccUIXabOxcWr/VMxMJKSHS/86l56L1LlyfXxqqRhol1w0Hw2DFljvH4IoJ
         A75a0ZM6+YfFpb9iLDZGz6w+92F9ZBeB5AowYKnu/y9/dKuEEDTakO7iSkPvpRLuiR8z
         GLgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo6-20020ad45f06000000b0062618936271si1409152qvb.504.2023.06.20.20.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 20:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBooI-0008BE-D1; Tue, 20 Jun 2023 23:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qBooG-0008Aj-Ue; Tue, 20 Jun 2023 23:47:08 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qBooE-0003G4-Ez; Tue, 20 Jun 2023 23:47:08 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwDHTV9BcpJkrLSMAA--.24950S2;
 Wed, 21 Jun 2023 11:45:05 +0800 (CST)
Received: from WYQ-S (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwCXErKkcpJkfDcAAA--.2596S3;
 Wed, 21 Jun 2023 11:46:45 +0800 (CST)
Date: Wed, 21 Jun 2023 11:46:45 +0800
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: quic_llindhol <quic_llindhol@quicinc.com>, 
 peter.maydell <peter.maydell@linaro.org>
Cc: rad <rad@semihalf.com>, pbonzini <pbonzini@redhat.com>, 
 marcin.juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 chenbaozi <chenbaozi@phytium.com.cn>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 1/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
References: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>, 
 <20230607023314.192439-2-wangyuquan1236@phytium.com.cn>, 
 <CAFEAcA-B6Pbc2KyTVP9hheGfEecfTbwu-zi7_9EmjJH5opbiYg@mail.gmail.com>, 
 <f1e8edcc-14ed-0e97-0172-292032e61f1d@quicinc.com>
X-Priority: 3
X-GUID: 27CBE808-AD2C-4349-AF22-F7AF4419C482
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.228[cn]
Mime-Version: 1.0
Message-ID: <2023062111461132026159@phytium.com.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart378351548818_=----"
X-CM-TRANSID: AQAAfwCXErKkcpJkfDcAAA--.2596S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQARAWSR+kEBRwABsY
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_FONT_LOW_CONTRAST=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_KAM_HTML_FONT_INVALID=0.01,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GBNTnNAxPksS

This is a multi-part message in MIME format.

------=_001_NextPart378351548818_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

T24gMjAyMy0wNi0yMSAwMToyNCwgIExlaWYgd3JvdGU6DQoNCj4gTGVpZiwgZG8geW91IHRoaW5r
IHdlIHNob3VsZCBidW1wIHRoZSBtaW5vciB2ZXJzaW9uIGhlcmU/DQogDQpJIHRoaW5rIHRoYXQg
bWFrZXMgc2Vuc2UsIHllcy4NCiANCi8NCiAgICAgTGVpZg0KDQpUaGFua3MgZm9yIGV2ZXJ5b25l
J3MgZ3VpZGFuY2UuDQpUaGVyZSBpcyBhIG5ldyBjb25mdXNpb246IFdoaWNoIG1pbm9yIHZlcnNp
b24gc2hvdWxkIEkgYnVtcCB0byAoMiBvciAzKSA/DQpBcyBJIGZvdW5kIHRoYXQgTWFyY2lu4oCZ
cyBsYXRlc3QgcGF0Y2ggKGFkZCBJVFMgc3VwcG9ydCBpbiBTQlNBIEdJQw0KaHR0cHM6Ly9saXN0
cy5ub25nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWFybS8yMDIzLTA2L21zZzAwNzA5Lmh0bWwg
KQ0KaW5jcmVhc2VkIHRoZSBtaW5vciB2ZXJzaW9uIHRvIDIuIA0KDQoNCk1hbnkgdGhhbmtzDQpZ
dXF1YW4NCg==

------=_001_NextPart378351548818_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 13px; font-fami=
ly: "Times New Roman"; color: rgb(0, 0, 0); line-height: 1.5; }</style></h=
ead><body>=0A =0A<div><span style=3D"background-color: transparent;">On&nb=
sp;2023-06-21&nbsp;01:24,&nbsp;</span><span style=3D"background-color: tra=
nsparent;">&nbsp;</span><span style=3D"color: rgb(0, 0, 0); background-col=
or: rgba(0, 0, 0, 0);">Leif&nbsp;</span><span style=3D"background-color: t=
ransparent;">wrote:</span></div><div><div><table width=3D"100%"><tbody><tr=
><td width=3D"100%"><blockquote style=3D"border-left: 2px solid rgb(0, 0, =
0); margin: 0px 0px 0px 0.5em; padding-left: 5px; padding-right: 0px;">=0A=
<div><br></div>=0A<div>&gt; Leif, do you think we should bump the minor ve=
rsion here?</div>=0A<div>&nbsp;</div>=0A<div>I think that makes sense, yes=
.</div>=0A<div>&nbsp;</div>=0A<div>/</div>=0A<div>&nbsp;&nbsp;&nbsp;&nbsp;=
 Leif</div>=0A</blockquote></td></tr></tbody></table></div><div><br></div>=
<div>Thanks for everyone's guidance.</div><div>There is a new confusion:&n=
bsp;<span style=3D"background-color: transparent;">Which minor version sho=
uld I bump to (2 or 3) ?</span></div><div><span style=3D"background-color:=
 transparent;">As I found that&nbsp;</span><span style=3D"color: rgb(0, 0,=
 0); background-color: rgba(0, 0, 0, 0);">Marcin=E2=80=99s latest patch (<=
/span><span style=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, =
0);">add&nbsp;ITS&nbsp;support&nbsp;in&nbsp;SBSA&nbsp;GIC</span></div><div=
><a href=3D"https://lists.nongnu.org/archive/html/qemu-arm/2023-06/msg0070=
9.html" style=3D"background-color: transparent;">https://lists.nongnu.org/=
archive/html/qemu-arm/2023-06/msg00709.html</a><span style=3D"color: rgb(0=
, 0, 0); background-color: rgba(0, 0, 0, 0);">&nbsp;)</span></div><div>inc=
reased the minor version to 2.&nbsp;</div><div><br></div><span style=3D"co=
lor: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);"></span><div><span =
style=3D"background-color: transparent;"><br></span></div><div><span style=
=3D"background-color: transparent;">Many thanks</span></div><div>Yuquan</d=
iv></div></body></html>
------=_001_NextPart378351548818_=------

