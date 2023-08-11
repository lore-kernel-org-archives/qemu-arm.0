Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1266595ejc;
        Fri, 11 Aug 2023 03:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF5U3cnD+xbZ7bm/+1uO0StOkqZfrm93iNsMYCtUl/ACBuU9VEd/Hd+YxrAvEtWXtZD8y3
X-Received: by 2002:a05:622a:1c4:b0:405:5337:4166 with SMTP id t4-20020a05622a01c400b0040553374166mr1703966qtw.68.1691749918107;
        Fri, 11 Aug 2023 03:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691749918; cv=none;
        d=google.com; s=arc-20160816;
        b=FrCZWkn1TlCK5FTpCoaKe0Gmtx8rVYvkyzjIlANvxZJaM1HzdHiBiU+//fGU6wgRtF
         ZlodV1zqEGcKGtU3EgXYv8jtEP1RJtKxmaLA+iOJMaJs1UdHnqi9fFt8KAgkIAwtBokD
         9a+YHt2hzWrojuFE4A5O9WSuQDuG5W86PhMFAn5ZOwACX0ZEwJqlFEPLodYqaCcUCrr2
         ZlrR1lXPxuhnvglAXntDTB+ScdeC4KCctPGbALPCxIpWyG+m/PpE/MIysWR/ab45FC8j
         fHOt76v/e5rkFCwQsgKfRgJ1dYwwivIXxU3dClusgqflFZoLKTcKJqss5/j4ngZDT5r5
         Q3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:mime-version
         :references:subject:cc:to:from:date;
        bh=fekSJ+3A8z0XKeOF3oZfXF0sbVi+Chin/xIRXdSsz8Y=;
        fh=iueHeHAJkSFiIJrqayicYFMsvSV98gYef1wBHnyI2rg=;
        b=Dc3cPDhc/S8GPJq3u3u/Ek23afYXbjJ4E57sg1/TVA2e8LaAmm1HdBpHGcuwl+DTg2
         B/wYzHSmD2ob92KcOWc1O1zHGG6GfIdXzETeK8GYJmzmexYNSpdWtw4BkMpvzCDh+X6H
         mwPZsLtco5NWhOptuDY5vFio2VO+mG2Amp13FJzl0nKfNAqEXb+kihL8mnaRYJMWU4tp
         dIeRTMHoR3Ly93CEhSfxn1lFKXclTiJAxgD9ub8e66MHmSPc0L6GlLOVdRFtptji3sDt
         j82T2aGmO/MrMJvdrpiV8OoClonEEf5aODMim+F4UK2jLpgqS5UN1EnkfbaNc+lCDijF
         rF6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a05622a034e00b003fff01022f8si2111778qtw.520.2023.08.11.03.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 03:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUPQl-0006pB-0M; Fri, 11 Aug 2023 06:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qUPQi-0006nh-Fz
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:31:40 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>) id 1qUPQf-00089k-Ir
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 06:31:40 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwBnokgADtZkYA0SBw--.1943S2;
 Fri, 11 Aug 2023 18:31:28 +0800 (CST)
Received: from WYQ-S (unknown [218.76.62.144])
 by mail (Coremail) with SMTP id AQAAfwC3rL3_DdZkY7YAAA--.4519S3;
 Fri, 11 Aug 2023 18:31:27 +0800 (CST)
Date: Fri, 11 Aug 2023 18:31:28 +0800
From: "Yuquan Wang" <wangyuquan1236@phytium.com.cn>
To: jonathan.cameron <Jonathan.Cameron@Huawei.com>
Cc: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
References: <2023061615433049315231@phytium.com.cn>, 
 <2023081017304217150830@phytium.com.cn>, 
 <20230810110429.000041cb@Huawei.com>, 
 <20230810145601.000041ea@Huawei.com>
X-Priority: 3
X-GUID: ECD8692B-B9DC-4FAF-8D1D-DEC665F0B7CB
X-Has-Attach: no
X-Mailer: Foxmail 7.2.25.228[cn]
Mime-Version: 1.0
Message-ID: <2023081118312729037834@phytium.com.cn>
Content-Type: multipart/alternative;
 boundary="----=_001_NextPart117511722581_=----"
X-CM-TRANSID: AQAAfwC3rL3_DdZkY7YAAA--.4519S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAIAWTVNq4DJQABsG
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWrKrWDJryfKrW8CrWfJFyfCrg_yoWDKrcEkw
 4qyayUAa1Dtay7Ww42gwsrAFWfZw4Ikry3G3y7Wa4xJ3s3Jrs5WF4qga97XrWYka13tr9x
 AryDX3W8Aw13ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
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
X-TUID: aN3vnj+x8YWB

This is a multi-part message in MIME format.

------=_001_NextPart117511722581_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

SGksIA0KT24gMjAyMy0wOC0xMCAyMTo1NiwgIGpvbmF0aGFuLmNhbWVyb24gd3JvdGU6DQogDQpT
byB0b29rIGEgbG9vayBhdCB5b3VyIGlzc3VlIC0gYmUgaXQgb24gdGhlIGN4bC0yMDIzLTA4LTA3
IGJyYW5jaCByZWJhc2VkIG9uIHFlbXUvbWFzdGVyDQpmcm9tIHRvZGF5IChzaWRlIGVmZmVjdCBv
ZiBsb29raW5nIGF0IHRoZSBzZWdmYXVsdCB0aGF0IHdhcyBzdG9wcGluZyBtZSBnZXR0aW5nIHRv
IHRoaXMpLg0KIA0KRm9yIG1lIGF0IGxlYXN0IHRoZSBicmFuY2ggZG9lcyBjcmVhdGUgYW4gQUNQ
STAwMTcgRFNEVCBlbnRyeSBhbmQgYW4gQUNQSTAwMTYgb25lDQphbmQgYWxsIHRoZSBDWEwgZGV2
aWNlcyB0dXJuIHVwIGluIC9zeXMvYnVzL2N4bC9kZXZpY2VzIGFzIGV4cGVjdGVkLg0KIA0KDQpP
aCwgdGhhbmtzIGZvciB5b3VyIGd1aWRhbmNlLiBJdCB3b3JrcyBzbyBub3cgSSBjYW4gZ2V0ICBB
Q1BJMDAxNyAmIEFDUEkwMDE2IGluZm9ybWF0aW9uIGluIERTRFQuICAgOiApDQoNCkJ5IHRoZSB3
YXksICBJIGZvdW5kIHRoYXQgaWYgd2UgYWRkIGEgcGNpZSByb290IHBvcnQgd2hpY2ggY3JlYXRl
IHRoZSBzYW1lIGJ1cyBudW1iZXIgYXMgd2UgYXNzaWduZWQgdG8gcHhiLWN4bCwgDQp0aGUgZW51
bWVyYXRpb24gb2YgY3hsIGFuZCBwY2llIHdvdWxkIGJlIGRpZmZlcmVudCBmcm9tIHdoYXQgd2Ug
ZXhwZWN0ZWQuICBJbiB0aGlzIGNhc2UsICB3ZSBjYW5ub3QgZmluZCANCkNYTCBkZXZpY2VzIGlu
IC9zeXMvYnVzL2N4bC9kZXZpY2VzLiANCg0KQWNjb3JkaW5nIHRvIG15IHRlc3QsIHRoZSBlcnJv
ciBoYXBwZW5lZCBpbiANCiJkZXZtX2N4bF9yZWdpc3Rlcl9wY2lfYnVzKCkiICBvZiAgImFkZF9o
b3N0X2JyaWRnZV91cG9ydCIgaW4gICJjeGxfYWNwaV9wcm9iZSIuDQpBY3R1YWxseSwgIGluIGFi
b3ZlIGNhc2UsIHRoZSBpbmNvcnJlY3QgZW51bWVyYXRpb24gb2YgcGNpZSB3aWxsIGFsc28gb2Nj
dXIgd2l0aCBweGItcGNpZSBleGNlcHQgZm9yIHB4Yi1jeGwsIA0KaGVuY2UgSSBndWVzcyB0aGUg
a2VybmVsIGRpZCBub3QgZGVhbCB3aXRoIHN1Y2ggY2FzZSBhbmQgdXNlcnMganVzdCBuZWVkIHRv
IGF2b2lkIGl0IGlmIHRoZXkgbmVlZCBhIGNvcnJlY3QNCmVudW1lcmF0aW9uIHJlc3VsdC4NCg0K
TXkgcWVtdSBzY3JpcHQgKHdoaWNoIHdpbGwgY2F1c2UgdGhlIGluY29ycmVjdCBlbnVtZXJhdGlv
bik6DQpxZW11LXN5c3RlbS14ODZfNjQgXA0KLU0gcTM1LG52ZGltbT1vbixjeGw9b24gXA0KLW0g
NEcsbWF4bWVtPThHLHNsb3RzPTggXA0KLXNtcCAxIFwNCi1vYmplY3QgbWVtb3J5LWJhY2tlbmQt
ZmlsZSxpZD1jeGwtbWVtMSxzaGFyZT1vbixtZW0tcGF0aD0uL21lbWZpbGUvY3hsdGVzdDMucmF3
LHNpemU9MjU2TSBcDQotb2JqZWN0IG1lbW9yeS1iYWNrZW5kLWZpbGUsaWQ9Y3hsLWxzYTEsc2hh
cmU9b24sbWVtLXBhdGg9Li9tZW1maWxlL2xzYTMucmF3LHNpemU9MjU2TSBcDQotZGV2aWNlIGlv
aDM0MjAsYnVzPXBjaWUuMCxpZD1yb290X3BvcnQxLGNoYXNzaXM9MCxzbG90PTEsYWRkcj0wNCBc
DQotZGV2aWNlIHFlbXUteGhjaSxidXM9cm9vdF9wb3J0MSBcDQotZGV2aWNlIHB4Yi1jeGwsYnVz
X25yPTEsYnVzPXBjaWUuMCxpZD1jeGwuMSBcDQotZGV2aWNlIGN4bC1ycCxwb3J0PTAsYnVzPWN4
bC4xLGlkPXJvb3RfcG9ydDEzLGNoYXNzaXM9MCxzbG90PTIgXA0KLWRldmljZSBjeGwtdHlwZTMs
YnVzPXJvb3RfcG9ydDEzLG1lbWRldj1jeGwtbWVtMSxsc2E9Y3hsLWxzYTEsaWQ9Y3hsLXBtZW0w
IFwNCi1NIGN4bC1mbXcuMC50YXJnZXRzLjA9Y3hsLjEsY3hsLWZtdy4wLnNpemU9NEcgXA0KLi4u
Li4uDQoNCk1hbnkgdGhhbmtzDQpZdXF1YW4NCg==

------=_001_NextPart117511722581_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }blockquote { margin-top: 0px; =
margin-bottom: 0px; margin-left: 0.5em; }body { font-size: 13px; font-fami=
ly: "Times New Roman"; color: rgb(0, 0, 0); line-height: 1.5; }</style></h=
ead><body>=0A =0A<div>Hi,&nbsp;</div>=0AOn&nbsp;2023-08-10&nbsp;21:56,&nbs=
p;&nbsp;<span>jonathan.cameron</span>&nbsp;wrote:<div><table width=3D"100%=
"><tbody><tr><td width=3D"100%"><blockquote style=3D"BORDER-LEFT: #000000 =
2px solid; MARGIN-LEFT: 5px; MARGIN-RIGHT: 0px; PADDING-LEFT: 5px; PADDING=
-RIGHT: 0px"><div><span style=3D"background-color: transparent; font-size:=
 13px;">&nbsp;</span></div>=0A<div>So took a look at your issue - be it on=
 the cxl-2023-08-07 branch rebased on qemu/master</div>=0A<div>from today =
(side effect of looking at the segfault that was stopping me getting to th=
is).</div>=0A<div>&nbsp;</div>=0A<div>For me at least the branch does crea=
te an ACPI0017 DSDT entry and an ACPI0016 one</div>=0A<div>and all the CXL=
 devices turn up in /sys/bus/cxl/devices as expected.</div>=0A<div>&nbsp;<=
/div>=0A</blockquote></td></tr></tbody></table></div><div><br></div><div>O=
h, thanks for your guidance. It works so now I can get&nbsp; ACPI0017 &amp=
; ACPI0016 information in DSDT.&nbsp; &nbsp;: )</div><div><br></div><div>B=
y the way,&nbsp; I found that if we add a pcie root port which create the =
same bus number as we assigned to pxb-cxl,&nbsp;</div><div>the&nbsp;enumer=
ation&nbsp;<span style=3D"background-color: transparent;">of cxl and pcie =
would be different from what we expected.&nbsp;</span><span style=3D"color=
: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nbsp;In this case,&n=
bsp; we cannot find&nbsp;</span></div><div><span style=3D"color: rgb(0, 0,=
 0); background-color: rgba(0, 0, 0, 0);">CXL&nbsp;devices&nbsp;</span><sp=
an style=3D"background-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0);">in&n=
bsp;/sys/bus/cxl/devices.&nbsp;</span></div><div><br></div><div>According =
to my test, the error happened in&nbsp;</div><div><span style=3D"backgroun=
d-color: transparent;">"devm_cxl_register_pci_bus()"&nbsp; of&nbsp; "</spa=
n><span style=3D"color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);"=
>add_host_bridge_uport" in&nbsp;</span><span style=3D"background-color: tr=
ansparent;">&nbsp;"cxl_acpi_probe".</span></div><div>Actually,&nbsp; in ab=
ove case, the&nbsp;incorrect enumeration of pcie will also occur with pxb-=
pcie except for pxb-cxl,&nbsp;</div><div>hence I guess the kernel&nbsp;<sp=
an style=3D"background-color: transparent;">did not deal with such case an=
d users just need to avoid it if they need a correct</span></div><div><spa=
n style=3D"background-color: transparent;">enumeration result.</span></div=
><div><br></div><div>My qemu script (which will cause the incorrect enumer=
ation):</div><div><span style=3D"color: rgb(0, 0, 0); background-color: rg=
ba(0, 0, 0, 0);">qemu-system-x86_64&nbsp;\<br>-M&nbsp;q35,nvdimm=3Don,cxl=
=3Don&nbsp;\<br>-m&nbsp;4G,maxmem=3D8G,slots=3D8&nbsp;\<br>-smp&nbsp;1&nbs=
p;\<br>-object&nbsp;memory-backend-file,id=3Dcxl-mem1,share=3Don,mem-path=
=3D./memfile/cxltest3.raw,size=3D256M&nbsp;\<br>-object&nbsp;memory-backen=
d-file,id=3Dcxl-lsa1,share=3Don,mem-path=3D./memfile/lsa3.raw,size=3D256M&=
nbsp;\<br>-device&nbsp;ioh3420,bus=3Dpcie.0,id=3Droot_port1,chassis=3D0,sl=
ot=3D1,addr=3D04&nbsp;\<br>-device&nbsp;qemu-xhci,bus=3Droot_port1&nbsp;\<=
br>-device&nbsp;pxb-cxl,bus_nr=3D1,bus=3Dpcie.0,id=3Dcxl.1&nbsp;\<br>-devi=
ce&nbsp;cxl-rp,port=3D0,bus=3Dcxl.1,id=3Droot_port13,chassis=3D0,slot=3D2&=
nbsp;\<br>-device&nbsp;cxl-type3,bus=3Droot_port13,memdev=3Dcxl-mem1,lsa=
=3Dcxl-lsa1,id=3Dcxl-pmem0&nbsp;\<br>-M&nbsp;cxl-fmw.0.targets.0=3Dcxl.1,c=
xl-fmw.0.size=3D4G&nbsp;\<br>......</span></div><div><br></div><div>Many t=
hanks</div><div>Yuquan</div></body></html>
------=_001_NextPart117511722581_=------

