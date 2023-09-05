Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1906012ejb;
        Tue, 5 Sep 2023 03:46:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHMFt/RmRD1DtvU/93ou9+IlX2H9R24p/RjzXOXEnI9/+eDcKKcsGlXPJjh57BLYC1vzc6
X-Received: by 2002:a05:620a:28c8:b0:767:f130:8f8a with SMTP id l8-20020a05620a28c800b00767f1308f8amr16627457qkp.49.1693910798911;
        Tue, 05 Sep 2023 03:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693910798; cv=none;
        d=google.com; s=arc-20160816;
        b=VWcGEza3CW1nUh29xamgSwLgpcENdZ1oHiWrcAYgcyVWAlQM+qVXd7PBojZK39Aud9
         ISTP4vrAvdMCzd0OqM5mE1mxUk76aemzunazwrU3+Zgzmqa02j6P9bPenQImOEakmfQQ
         /e8xMIbeW+MwkYAM4f9/Ict1Mo8qJXF502EBAdABHjYxvbHispfyYG7brrQL+ijC087w
         x8XZxt8FJLkptNA4e1iEGQ/VgczIr8il0XRqrq/+GsTHBmiKe7GA45A2dre0W1ktEPTx
         IxaQa/m5ju/XbQepU4B7wlz2/t0yg0/eDtthHRr62Ko4JcdTf5ljfPebgnEOogCURmoo
         EHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :references:subject:cc:to:from:date;
        bh=T/19ZgoFf97rhfURM9qQDeFPVoqxS4feMy2ywLvWg2A=;
        fh=1kIw3gCtj1LL71Q+5HxIjlqazqKBgsXw6o+7pYAz75U=;
        b=ZcxdveVY5Drd/orR/sb8HKyjkt83jxoWXhJj54Vu+sd7xdFkQs1np90znED9d6PArC
         hWRpvMgWB1+cAMz5HsdLl7yVGTNH3RmeZ8KJzGuiTjcSUI0w7R8GMUmx/4xL7vKgawF6
         RjmCR1p5HUQPD9bToMjfZGgj5C8Odafd9Iwzi35Zd+wnX2tZwsfadHcNCTvzG0U4+nPZ
         PviYlII0GK/ZWQFrL6rkXytgqfE+F3l+wRqqPjUSD2t7ECRsa46SUX7KUVzM7DExERUj
         UkJqr7ZG4ZKIH9T6dXvKU78XcKBIBinv3PG8s8gv7W3pAoc/nap8xY1koRcEMDdL7pTq
         OImw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020a05622a025000b0040e5556ede7si7811298qtx.30.2023.09.05.03.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 03:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qdTZ3-0005ik-RP; Tue, 05 Sep 2023 06:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qdTYo-0005iL-IJ; Tue, 05 Sep 2023 06:45:30 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qdTYh-0004mg-DV; Tue, 05 Sep 2023 06:45:29 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwD3aMyzBvdkclqNAQ--.4827S2;
 Tue, 05 Sep 2023 18:45:07 +0800 (CST)
Received: from WYQ-S (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDHW0mtBvdkeosAAA--.2224S3;
 Tue, 05 Sep 2023 18:45:02 +0800 (CST)
Date: Tue, 5 Sep 2023 18:45:02 +0800
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: jonathan.cameron <Jonathan.Cameron@Huawei.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 gregory.price <gregory.price@memverge.com>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
References: <2023082215220191352877@phytium.com.cn>, 
 <2023090418270957278822@phytium.com.cn>, 
 <20230904134342.000048bf@Huawei.com>
X-Priority: 3
X-GUID: 1381A605-65B8-43CF-9DA7-5BA1882C14A0
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.228[cn]
Mime-Version: 1.0
Message-ID: <2023090518450211126476@phytium.com.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart883331330581_=----"
X-CM-TRANSID: AQAAfwDHW0mtBvdkeosAAA--.2224S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQANAWT2LCcEogABsz
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW7JryDXry7Ww45tFWrAFW5Jrb_yoW8Jr15pa
 4j9ay7ta1qga4jyFy0qws7JrykGa4kGF42vr9YvrWF9wn8u3Z5Xr4Ut3W5AasrCw18tw1I
 93y0qrs7uayUAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gzUn70Z8zVSX

This is a multi-part message in MIME format.

------=_001_NextPart883331330581_=----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGksIEpvbmF0aGFuDQpPbiAyMDIzLTA5LTA0IDIwOjQzLCAgam9uYXRoYW4uY2FtZXJvbiB3cm90
ZToNCj4gDQo+IEF0IHRoZSBzeXN0ZW0gZGVzaWduIGxldmVsLCBNTUlPIHNwYWNlIG9mIFJvb3Qg
Y29tcGxleCByZWdpc3RlciBzcGFjZSB2aWEgUkNSQg0KPiBkb2VzIG5vdCBtYXAgaW4gYSBzaW1p
bGFyIGZhc2hpb24gdG8gUENJRSBNTUlPIHNwYWNlICh3aGljaCBpcyBoYW5kbGVkIHZpYQ0KPiBh
ZGRyZXNzIGRlY29kaW5nIGluIHRoZSBQQ0lFIGZhYnJpYykuIEl0IGlzIG11Y2ggbW9yZSBzaW1p
bGFyIHRvIE1NSU8gZm9yIHBsYXRmb3JtDQo+IGRldmljZXMgLSBhcyBzdWNoIHRoZSBpbXBsZW1l
bnRhdGlvbiBoYW5kbGVzIGluIGxpa2UgYSBwbGF0Zm9ybSBkZXZpY2UgKHdlbGwgMTYgb2YNCj4g
dGhlbSB3aGljaCBzZWVtZWQgZW5vdWdoIGZvciBhbnkgc2FuZSB1c2VjYXNlKS4NCj4gDQo+IA0K
DQpPaCx0aGFua3MhIEFjY29yZGluZyB0byBhYm92ZSwgdGhlcmVmb3JlLCB0aGUgY29yZSBmYWN0
b3IgaXMgdGhlIGltcGxlbWVudGF0aW9uIG9mIFJDUkIuDQoNCj4gDQo+IFNvIGluIHRoZW9yeSB3
ZSBjb3VsZCBtYWtlIHNvbWUgc3BhY2UgZm9yIHRoZSBDWEwgcm9vdCBicmlkZ2UgUkNSQiByZWdp
c3RlcnMNCj4gYnV0IGl0IHdvdWxkIG1ha2UgdmFyaW91cyBnZW5lcmljIHBhdGhzIG1vcmUgY29t
cGxleC4gIEluIGEgcmVhbCBzeXN0ZW0NCj4gdGhvc2UgcmVnaXN0ZXJzIGFyZSBsaWtlbHkgdG8g
YmUgZmFyIGZyb20gdGhlIFBDSSBNTUlPIHNwYWNlIGFueXdheSBzbyB0aGUNCj4gd2F5IGl0J3Mg
bW9kZWxlZCBpcyBwcm9iYWJseSBtb3JlIHJlYWxpc3RpYyB0aGFuIHB1c2hpbmcgdGhlIFJDUkIg
aW50byB0aGUNCj4gZXhpc3RpbmcgYWxsb2NhdGlvbi4NCj4gDQoNCkhlcmUgaW1wbGllcyB0aGF0
IGFsbCBDWEwgcm9vdCBicmlkZ2Ugd2lsbCB1c2UgUkNSQiByZWdpc3RlcnMuDQoNCkZyb20gVGFi
bGUgOC0xNyBhbmQgRmlndXJlIDktMTQgaW4gQ1hMMy4wIHNwZWNpZmljYXRpb24sIEkgdW5kZXJz
dG9vZCB0aGF0IG9ubHkgUkNIIERQICYNClJDRCBVUCB3aWxsIHVzZSBSQ1JCcywgYW5kIENYTCBo
b3N0IGJyaWRnZXMgVkggbW9kZSB3aWxsIHVzZSBvdGhlciB3YXkgdG8gcmVhbGl6ZQ0KdGhlIENI
QkNSLiBJIGhhZCB0cmllZCB0byBmaW5kIG1vcmUgZXhwbGFuYXRpb24gaW4gQ1hMIHNwZWMsIGJ1
dCBJIGhhdmVuJ3QgZm91bmQuIEhlbmNlIA0KdGhpcyBpcyB3aHkgSSBhbSBjb25mdXNlZC4NCg0K
TWFueSB0aGFua3MNCll1cXVhbg0K

------=_001_NextPart883331330581_=----
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dutf-8"><style>body { line-height: 1.5; }body { font-size: 13px; font-f=
amily: "Times New Roman"; color: rgb(0, 0, 0); line-height: 1.5; }</style>=
</head><body>=0A =0A<div>Hi, J<span style=3D"background-color: transparent=
;">onathan</span></div>=0AOn&nbsp;2023-09-04&nbsp;20:43,&nbsp;&nbsp;<span>=
jonathan.cameron</span>&nbsp;wrote:<div><div>&gt;&nbsp;</div><div>&gt; At =
the system design level, MMIO space of Root complex register space via RCR=
B</div><div>&gt; does not map in a similar fashion to PCIE MMIO space (whi=
ch is handled via</div><div>&gt; address decoding in the PCIE fabric). It =
is much more similar to MMIO for platform</div><div>&gt; devices - as such=
 the implementation handles in like a platform device (well 16 of</div><di=
v>&gt; them which seemed enough for any sane usecase).</div><div>&gt;&nbsp=
;</div><div>&gt;&nbsp;</div><div><br></div><div>Oh,thanks! According to ab=
ove, therefore, the core factor is the implementation of RCRB.</div><div><=
br></div><div>&gt;&nbsp;</div><div>&gt; So in theory we could make some sp=
ace for the CXL root bridge RCRB registers</div><div>&gt; but it would mak=
e various generic paths more complex.&nbsp; In a real system</div><div>&gt=
; those registers are likely to be far from the PCI MMIO space anyway so t=
he</div><div>&gt; way it's modeled is probably more realistic than pushing=
 the RCRB into the</div><div>&gt; existing allocation.</div><div>&gt;&nbsp=
;</div><div><br></div><div><span style=3D"background-color: transparent;">=
Here implies that all CXL root bridge will use RCRB registers.</span></div=
><div><span style=3D"background-color: transparent;"><br></span></div><div=
><div>From Table 8-17&nbsp;and Figure 9-14 in&nbsp;<span style=3D"backgrou=
nd-color: transparent;">CXL3.0 specification</span><span style=3D"backgrou=
nd-color: transparent;">, I understood that only RCH DP &amp;</span></div>=
<div>RCD UP will use RCRBs, and CXL host bridges&nbsp;<span style=3D"backg=
round-color: transparent;">VH mode&nbsp;</span><span style=3D"background-c=
olor: transparent;">will use other way to realize</span></div><div><span s=
tyle=3D"background-color: transparent;">the CHBCR. I had tried to find mor=
e explanation in CXL spec, but I haven't found.&nbsp;</span><span style=3D=
"background-color: transparent;">Hence&nbsp;</span></div><div><span style=
=3D"background-color: transparent;">this is why I am confused.</span></div=
></div><div><br></div></div><div>Many thanks</div><div>Yuquan</div></body>=
</html>
------=_001_NextPart883331330581_=------

