Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp538051ejc;
        Thu, 10 Aug 2023 02:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjrRYeuoExzktmEZG0BXtRmhCfstXuQRWNgmrUZTuRxcMYIQCf8FnlL95QyeUThTOI5ZB5
X-Received: by 2002:a05:620a:24c8:b0:763:d32b:5091 with SMTP id m8-20020a05620a24c800b00763d32b5091mr1700430qkn.8.1691659882772;
        Thu, 10 Aug 2023 02:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691659882; cv=none;
        d=google.com; s=arc-20160816;
        b=rRMP7IC8qFlaN7JP+2Vo8/yo86Dc0JmjICk5LEp0YeT8EA27nI9L7IKJzoXiG/FF1B
         QIpPGWmzpCYlKVU7iaRgO0plB2YZuk48TE/JbJKq3oyfLjAjQMjCIsbPYKw6bhUmVAUl
         pqv7wBSu470T9Fdt563ZxDzyT6G/owvSRD/tFfbaFX4Yqi12GnwLR/sGKbuemHX1K0Kc
         aKh+w8G93OPflCWymKG7UUGfYVqSU7PemGKmwyooDaxPcdbS2uboOY0Ti01LA2bl0pkh
         RJ1C4GotIZwC0EFlDL/YrHuzN8MfsS5ajt8CiA8InvizuTXuZgHlsxqTc5GILmYJpOqP
         eRDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :references:subject:cc:to:from:date;
        bh=lonDnDBZv1qlD96A+hg+rHOgMje0W1zLD0ekCnC+6Oo=;
        fh=iueHeHAJkSFiIJrqayicYFMsvSV98gYef1wBHnyI2rg=;
        b=Olnsgz1akzmSjyf5mmecjWugO5SCR7WR1MfY4cfS93zkPod7EhxdP01balItiFvPTX
         BOQvzz4rgUPVxhKZPhNtCUqBh4U8SNsM0dqQVtDNoN6fVSUsFwCOK3OojhzMlVBafFYV
         SsDCr7YGNSbE2OKwxfPftBc7o8/goujVShU8ljhO7J0BJcYfxSpFBvLaV+qf8RWoK1+P
         gUrN9AjBZAOHMCVF9xJFZE02GPxIj3vEg9ddSmni56nAqkDmDSSKpWPk+ZpyQf0qAtky
         nI+P9LLaTlULkUu1XJLiYp/jvNgUR7s40SggmS80bWipj0c8+PWpGyJzQdxH8GtKVMvc
         /4ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20-20020a05620a0b1400b00767cc37dc22si571719qkg.209.2023.08.10.02.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 02:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qU20R-0001VN-7K; Thu, 10 Aug 2023 05:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qU20P-0001V4-Lw
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:30:57 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1qU20N-0002mv-0b
 for qemu-arm@nongnu.org; Thu, 10 Aug 2023 05:30:57 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwDXYGJErtRksYGYCA--.17383S2;
 Thu, 10 Aug 2023 17:30:44 +0800 (CST)
Received: from WYQ-S (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwDnixFCrtRkP6EAAA--.4300S3;
 Thu, 10 Aug 2023 17:30:42 +0800 (CST)
Date: Thu, 10 Aug 2023 17:30:43 +0800
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: jonathan.cameron <Jonathan.Cameron@Huawei.com>
Cc: qemu-arm <qemu-arm@nongnu.org>
Subject: CXL Namespaces of ACPI disappearing in Qemu demo
References: <2023061615433049315231@phytium.com.cn>, 
 <ZIylkIt38MXaTytx@memverge.com>, 
 <20230619105809.000007b9@Huawei.com>
X-Priority: 3
X-GUID: 812B777E-1F1E-4A1C-9788-CB167984BDE3
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.228[cn]
Mime-Version: 1.0
Message-ID: <2023081017304217150830@phytium.com.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart204403610872_=----"
X-CM-TRANSID: AQAAfwDnixFCrtRkP6EAAA--.4300S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAHAWTT5SsDIwACsc
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
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
X-TUID: H9uadV1J7PDh

This is a multi-part message in MIME format.

------=_001_NextPart204403610872_=----
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGksIEpvbmF0aGFuDQoNCldoZW4gSSB0ZXN0ZWQgdGhlIENYTCB0b3BvbG9neSBpbiBxZW11LCBJ
IGZvdW5kIHRoZSBsaW51eCBrZXJuZWwgY291bGQgZmluZCANCmFuZCBtYXRjaCB0aGUgQUNQSTAw
MTYmQUNQSTAwMTcgaW4gcmVsZXZhbnQgZHJpdmVycywgaG93ZXZlciwgSSBjb3VsZCBub3QgDQpm
aW5kIHRoZXNlIGluZm9ybWF0aW9uIGluIGR1bXBlZCBBQ1BJIHRhYmxlcyAobGlrZSBEU0RUKS4g
DQoNCkhlbmNlLCBJIGd1ZXNzIHRoZXJlIGlzIHNvbWUgcHJvYmxlbSBpbiBteSBtZXRob2QsIG1h
eWJlIHlvdSBoYXZlIHNvbWUgDQpzdWdnZXN0aW9ucyBpZiB5b3UgaGF2ZSBzb21lIHRpbWUgdG8g
bG9vayBhdCB0aGlzIGVtYWlsLg0KDQpNeSBlbnZpcm9ubWVudDoNCnFlbXU6IEpvbmF0aGFuX3Fl
bXUvY3hsLTIwMjMtMDgtMDcNCkxpbnV4OiB2Ni4zLjANCkFDUEkgRGlzYXNzZW1ibGVyOiBpYXNs
L3ZlcnNpb24gMjAyMzA2MjgNCg0KTXkgcWVtdSBzY3JpcHQgaXMgdGhlIHNhbWUgYXMgdGhlIGZp
cnN0IGV4YW1wbGUgaW4gcWVtdS9kb2NzL3N5c3RlbS9kZXZpY2VzL2N4bC5yc3QsIA0KYXMgYmVs
b3c6DQogIHFlbXUtc3lzdGVtLXg4Nl82NCAtTSBxMzUsY3hsPW9uIC1tIDRHLG1heG1lbT04Ryxz
bG90cz04IC1zbXAgNCBcDQogIC4uLg0KICAtb2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9
Y3hsLW1lbTEsc2hhcmU9b24sbWVtLXBhdGg9L3RtcC9jeGx0ZXN0LnJhdyxzaXplPTI1Nk0gXA0K
ICAtb2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9Y3hsLWxzYTEsc2hhcmU9b24sbWVtLXBh
dGg9L3RtcC9sc2EucmF3LHNpemU9MjU2TSBcDQogIC1kZXZpY2UgcHhiLWN4bCxidXNfbnI9MTIs
YnVzPXBjaWUuMCxpZD1jeGwuMSBcDQogIC1kZXZpY2UgY3hsLXJwLHBvcnQ9MCxidXM9Y3hsLjEs
aWQ9cm9vdF9wb3J0MTMsY2hhc3Npcz0wLHNsb3Q9MiBcDQogIC1kZXZpY2UgY3hsLXR5cGUzLGJ1
cz1yb290X3BvcnQxMyxwZXJzaXN0ZW50LW1lbWRldj1jeGwtbWVtMSxsc2E9Y3hsLWxzYTEsaWQ9
Y3hsLXBtZW0wIFwNCiAgLU0gY3hsLWZtdy4wLnRhcmdldHMuMD1jeGwuMSxjeGwtZm13LjAuc2l6
ZT00Rw0KDQoNCk1hbnkgdGhhbmtzDQpZdXF1YW4NCg==

------=_001_NextPart204403610872_=----
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DISO-8859-1"><style>body { line-height: 1.5; }body { font-size: 13px; f=
ont-family: "Times New Roman"; color: rgb(0, 0, 0); line-height: 1.5; }</s=
tyle></head><body>=0A =0A<div>Hi,&nbsp;<span style=3D"background-color: rg=
ba(0, 0, 0, 0); color: rgb(0, 0, 0);">Jonathan</span></div><div><br></div>=
<div>When I tested the CXL topology in qemu, I found the linux kernel coul=
d&nbsp;<span style=3D"background-color: transparent;">find&nbsp;</span></d=
iv><div><span style=3D"background-color: transparent;">and match the ACPI0=
016&amp;ACPI0017 in relevant drivers, however, I could not&nbsp;</span></d=
iv><div>find these information in dumped ACPI tables (like DSDT).&nbsp;</d=
iv><div><br></div><div>Hence, I guess there is some problem in my method,&=
nbsp;<span style=3D"background-color: transparent;">maybe you have some&nb=
sp;</span></div><div><span style=3D"background-color: transparent;">sugges=
tions if&nbsp;you&nbsp;have&nbsp;some&nbsp;time&nbsp;to&nbsp;look&nbsp;at&=
nbsp;this&nbsp;email.</span></div><div><br></div><div>My environment:</div=
><div>qemu:&nbsp;Jonathan_qemu/cxl-2023-08-07</div><div>Linux: v6.3.0</div=
><div>ACPI&nbsp;Disassembler: iasl/version 20230628</div><div><br></div><d=
iv>My qemu script is the same as the first example in qemu/docs/system/dev=
ices/cxl.rst,&nbsp;</div><div>as below:</div><div><span style=3D"color: rg=
b(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nbsp; qemu-system-x86_64=
&nbsp;-M&nbsp;q35,cxl=3Don&nbsp;-m&nbsp;4G,maxmem=3D8G,slots=3D8&nbsp;-smp=
&nbsp;4&nbsp;\<br>&nbsp;&nbsp;...<br>&nbsp;&nbsp;-object&nbsp;memory-backe=
nd-file,id=3Dcxl-mem1,share=3Don,mem-path=3D/tmp/cxltest.raw,size=3D256M&n=
bsp;\<br>&nbsp;&nbsp;-object&nbsp;memory-backend-file,id=3Dcxl-lsa1,share=
=3Don,mem-path=3D/tmp/lsa.raw,size=3D256M&nbsp;\<br>&nbsp;&nbsp;-device&nb=
sp;pxb-cxl,bus_nr=3D12,bus=3Dpcie.0,id=3Dcxl.1&nbsp;\<br>&nbsp;&nbsp;-devi=
ce&nbsp;cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port13,chassis=3D0,slot=3D2&=
nbsp;\<br>&nbsp;&nbsp;-device&nbsp;cxl-type3,bus=3Droot_port13,persistent-=
memdev=3Dcxl-mem1,lsa=3Dcxl-lsa1,id=3Dcxl-pmem0&nbsp;\<br>&nbsp;&nbsp;-M&n=
bsp;cxl-fmw.0.targets.0=3Dcxl.1,cxl-fmw.0.size=3D4G</span></div><div><span=
 style=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);"><br></=
span></div><div><span style=3D"color: rgb(0, 0, 0); background-color: rgba=
(0, 0, 0, 0);"><br></span></div><div>Many thanks</div><div>Yuquan</div></b=
ody></html>
------=_001_NextPart204403610872_=------

