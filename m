Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1091208njg;
        Wed, 18 Sep 2024 17:29:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZS6mFnOTU9v9o/NvJzNz7FlxpqgLHiLoY3EYL3qeuUgy6r87KrkRmGwIcEJeCNmsq1kRfca6vvVCvNg==@linaro.org
X-Google-Smtp-Source: AGHT+IGGRwQvmouedIGxRuWtEb8DgDf14ShBBoKtrh9iM49O7rqsACGn/rn8kL7pPR1n6zjlnxzH
X-Received: by 2002:a05:620a:4710:b0:79f:17af:e360 with SMTP id af79cd13be357-7a9e5f27990mr4111743785a.33.1726705763322;
        Wed, 18 Sep 2024 17:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726705763; cv=none;
        d=google.com; s=arc-20240605;
        b=UJ17qo8dlnKkmF3aPoE7Ba4OIeBA/y+pX8aVz2o9Of7LaQUGQVpH2EIc6D4cRRhsX+
         n/MxhYPqTHj/sFtsmwZLU3tDJExvHLuyWgL11GVVxCjBMsXLrtCG1vQHbV/w3gh2rY2r
         PrKJWFF2EfcQTM+yAun5BR1Lkkpg67Ww/UrkMBBtJOhzcuJ6JlyJrgTFFt0cPbeWQzkm
         NvHeYBVtOg3rMJiPCUdf1Yz/2r/LKijB6J6i0SeNQ6zWRCuPKNLUEN/FwRJn16hWhCIO
         QOX84C8d3JzoQqtfZpM6b06Ld8fWUcGnS5Ltw5bKKw4H6hTs9pmXPO+yNqIMd0ntntEh
         2v0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-index:thread-topic
         :mime-version:subject:references:in-reply-to:message-id:cc:to:from
         :date;
        bh=fB0War5yGZHqvmVIpWVqzvod6/iw+QecHsckE81z3VE=;
        fh=FXFScTia/ZNscrfjgsQ1Ysv8P38++wvfebfdNEXAN0s=;
        b=eGe26IdetHUw2FMqkO/l33SiPdvZz+q/l1mwUZEFFeEdnISJravthga7AJggoekSwF
         WPAupZXRxxLCWCwxpeX/P74otfXroyaqsIaKghiBoxrtYqy5i5U7525kxhSG1IYvXoVx
         L4qTnXkRjkvnNBtfl8Y96b1wO8NKYJI6byg/ctjZfuuLzyqC6L90S+pr6Bb6sqJT5DeZ
         W0Vd1PZmZlWb/iOk0Wy6EtmjkzPJ/gb+//WNVS86wRirjYizlc1kU/og1p8TokN85OHW
         QgaZDtjEG1lwjLUTM4Jt4Cd5vkfj5qXt/vqdPJJgrjNtsH3M0a93lmv+q1M/X+g1GElm
         8e6g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7acb07f8d21si67637785a.82.2024.09.18.17.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2024 17:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sr52a-00062A-DA; Wed, 18 Sep 2024 20:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sr52Y-00060U-NF; Wed, 18 Sep 2024 20:28:58 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sr52W-0006n1-AX; Wed, 18 Sep 2024 20:28:58 -0400
Received: from sslproxy04.your-server.de ([78.46.152.42])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sr52S-000Bj8-22; Thu, 19 Sep 2024 02:28:52 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy04.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sr52S-000DMA-03; Thu, 19 Sep 2024 02:28:52 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 0CC88480048;
 Thu, 19 Sep 2024 02:28:52 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 8djhQbyJ6X-x; Thu, 19 Sep 2024 02:28:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 2212C480061;
 Thu, 19 Sep 2024 02:28:51 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id fJSipCNRRPZP; Thu, 19 Sep 2024 02:28:51 +0200 (CEST)
Received: from zimbra.eb.localhost (zimbra.eb.localhost [192.168.96.204])
 by mail.embedded-brains.de (Postfix) with ESMTP id E259A480048;
 Thu, 19 Sep 2024 02:28:50 +0200 (CEST)
Date: Thu, 19 Sep 2024 02:28:50 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Message-ID: <934066607.108860.1726705730827.JavaMail.zimbra@embedded-brains.de>
In-Reply-To: <1242128488.101916.1726650812387.JavaMail.zimbra@embedded-brains.de>
References: <1242128488.101916.1726650812387.JavaMail.zimbra@embedded-brains.de>
Subject: Re: Xilinx Zynq 7000 Start of CPU1
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_108858_488006610.1726705730826"
X-Originating-IP: [192.168.96.204]
X-Mailer: Zimbra 9.0.0_GA_4615 (ZimbraWebClient - FF128 (Linux)/9.0.0_GA_4615)
Thread-Topic: Xilinx Zynq 7000 Start of CPU1
Thread-Index: XWOxYHF+B3TrRy5pEyz5aKlxLJtu61eRCrS9
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.5/27402/Wed Sep 18 12:32:17 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: piKk8UVbWaAo

------=_Part_108858_488006610.1726705730826
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

----- Am 18. Sep 2024 um 11:13 schrieb Sebastian Huber sebastian.huber@embe=
dded-brains.de:

> Hello,
>=20
> I recently added the support for CPU1 to the xilinx-zynq-a9 machine
> (hw/arm/xilinx_zynq.c). However, the reset behaviour doesn't match exactl=
y with
> the hardware. After a system reset (SRST), the CPU1 should execute a wfe
> instruction and then load the start address from 0xfffffff0:
>=20
> https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Starting-Code-on-CPU=
-1
>=20
> It would be great if someone has a hint for me how I can add this startup=
 code
> for CPU1 at address region 0xFFFFFE00 to 0xFFFFFFF0.

I got it working with some hacks in arm_load_kernel() and do_cpu_reset(). I=
n arm_load_kernel() had to remove the:

        /*
         * No secondary boot stub; don't use the reset hook that would
         * have set the CPU up to call it
         */
        info->write_secondary_boot =3D NULL;
        info->secondary_cpu_reset_hook =3D NULL;

This change probably breaks a lot of things. I am not sure how to address t=
his issue.

--=20
embedded brains GmbH & Co. KG
Herr Sebastian HUBER
Dornierstr. 4
82178 Puchheim
Germany
email: sebastian.huber@embedded-brains.de
phone: +49-89-18 94 741 - 16
fax:   +49-89-18 94 741 - 08

Registergericht: Amtsgericht M=C3=BCnchen
Registernummer: HRB 157899
Vertretungsberechtigte Gesch=C3=A4ftsf=C3=BChrer: Peter Rasmussen, Thomas D=
=C3=B6rfler
Unsere Datenschutzerkl=C3=A4rung finden Sie hier:
https://embedded-brains.de/datenschutzerklaerung/

------=_Part_108858_488006610.1726705730826
Content-Type: application/mbox;
 name=0001-hw-arm-xilinx_zynq-Add-CPU1-reset.patch
Content-Disposition: attachment;
 filename=0001-hw-arm-xilinx_zynq-Add-CPU1-reset.patch
Content-Transfer-Encoding: base64

RnJvbSBlYThlZjNkZjA3NTMwZWQyMjE1MjI2NGJiY2ZmMmExM2NjYjcwOTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTZWJhc3RpYW4gSHViZXIgPHNlYmFzdGlhbi5odWJlckBlbWJl
ZGRlZC1icmFpbnMuZGU+CkRhdGU6IFRodSwgMTkgU2VwIDIwMjQgMDI6MjQ6NTMgKzAyMDAKU3Vi
amVjdDogW1BBVENIXSBody9hcm0veGlsaW54X3p5bnE6IEFkZCBDUFUxIHJlc2V0CgpBZnRlciBh
IHN5c3RlbSByZXNldCAoU1JTVCksIHRoZSBDUFUxIHNob3VsZCBleGVjdXRlIGEgd2ZlIGluc3Ry
dWN0aW9uCmFuZCB0aGVuIGxvYWQgdGhlIHN0YXJ0IGFkZHJlc3MgZnJvbSAweGZmZmZmZmYwOgoK
aHR0cHM6Ly9kb2NzLmFtZC5jb20vci9lbi1VUy91ZzU4NS16eW5xLTcwMDAtU29DLVRSTS9TdGFy
dGluZy1Db2RlLW9uLUNQVS0xCi0tLQogaHcvYXJtL2Jvb3QuYyAgICAgICAgfCAxNSArKysrKysr
LS0tLS0tLS0KIGh3L2FybS94aWxpbnhfenlucS5jIHwgMTkgKysrKysrKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2h3L2FybS9ib290LmMgYi9ody9hcm0vYm9vdC5jCmluZGV4IDdjMTA4MThjNGYuLmVk
NTkwOWIwODYgMTAwNjQ0Ci0tLSBhL2h3L2FybS9ib290LmMKKysrIGIvaHcvYXJtL2Jvb3QuYwpA
QCAtNzIyLDcgKzcyMiwxMSBAQCBzdGF0aWMgdm9pZCBkb19jcHVfcmVzZXQodm9pZCAqb3BhcXVl
KQogICAgICAgICAgICAgICAgIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7CiAgICAgICAgICAgICB9
CiAKLSAgICAgICAgICAgIGNwdV9zZXRfcGMoY3MsIGVudHJ5KTsKKyAgICAgICAgICAgIGlmIChj
cyA9PSBmaXJzdF9jcHUgfHwgIWluZm8tPnNlY29uZGFyeV9jcHVfcmVzZXRfaG9vaykgeworICAg
ICAgICAgICAgICAgIGNwdV9zZXRfcGMoY3MsIGVudHJ5KTsKKyAgICAgICAgICAgIH0gZWxzZSB7
CisgICAgICAgICAgICAgICAgaW5mby0+c2Vjb25kYXJ5X2NwdV9yZXNldF9ob29rKGNwdSwgaW5m
byk7CisgICAgICAgICAgICB9CiAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAvKiBJZiB3
ZSBhcmUgYm9vdGluZyBMaW51eCB0aGVuIHdlIG5lZWQgdG8gY2hlY2sgd2hldGhlciB3ZSBhcmUK
ICAgICAgICAgICAgICAqIGJvb3RpbmcgaW50byBzZWN1cmUgb3Igbm9uLXNlY3VyZSBzdGF0ZSBh
bmQgYWRqdXN0IHRoZSBzdGF0ZQpAQCAtMTM4MCwxMyArMTM4NCw4IEBAIHZvaWQgYXJtX2xvYWRf
a2VybmVsKEFSTUNQVSAqY3B1LCBNYWNoaW5lU3RhdGUgKm1zLCBzdHJ1Y3QgYXJtX2Jvb3RfaW5m
byAqaW5mbykKICAgICAgICAgICAgIGluZm8tPndyaXRlX3NlY29uZGFyeV9ib290ID0gZGVmYXVs
dF93cml0ZV9zZWNvbmRhcnk7CiAgICAgICAgIH0KICAgICAgICAgaW5mby0+d3JpdGVfc2Vjb25k
YXJ5X2Jvb3QoY3B1LCBpbmZvKTsKLSAgICB9IGVsc2UgewotICAgICAgICAvKgotICAgICAgICAg
KiBObyBzZWNvbmRhcnkgYm9vdCBzdHViOyBkb24ndCB1c2UgdGhlIHJlc2V0IGhvb2sgdGhhdCB3
b3VsZAotICAgICAgICAgKiBoYXZlIHNldCB0aGUgQ1BVIHVwIHRvIGNhbGwgaXQKLSAgICAgICAg
ICovCi0gICAgICAgIGluZm8tPndyaXRlX3NlY29uZGFyeV9ib290ID0gTlVMTDsKLSAgICAgICAg
aW5mby0+c2Vjb25kYXJ5X2NwdV9yZXNldF9ob29rID0gTlVMTDsKKyAgICB9IGVsc2UgaWYgKGlu
Zm8tPndyaXRlX3NlY29uZGFyeV9ib290KSB7CisgICAgICAgIGluZm8tPndyaXRlX3NlY29uZGFy
eV9ib290KGNwdSwgaW5mbyk7CiAgICAgfQogCiAgICAgLyoKZGlmZiAtLWdpdCBhL2h3L2FybS94
aWxpbnhfenlucS5jIGIvaHcvYXJtL3hpbGlueF96eW5xLmMKaW5kZXggZTRlMWE2MTllMi4uNzA0
MDUyMGI4MCAxMDA2NDQKLS0tIGEvaHcvYXJtL3hpbGlueF96eW5xLmMKKysrIGIvaHcvYXJtL3hp
bGlueF96eW5xLmMKQEAgLTYyLDYgKzYyLDggQEAgc3RhdGljIGNvbnN0IGludCBkbWFfaXJxc1s4
XSA9IHsKIAogI2RlZmluZSBCT0FSRF9TRVRVUF9BRERSICAgICAgICAweDEwMAogCisjZGVmaW5l
IFNFQ09OREFSWV9TRVRVUF9BRERSICAgIDB4RkZGRkZGRTgKKwogI2RlZmluZSBTTENSX0xPQ0tf
T0ZGU0VUICAgICAgICAweDAwNAogI2RlZmluZSBTTENSX1VOTE9DS19PRkZTRVQgICAgICAweDAw
OAogI2RlZmluZSBTTENSX0FSTV9QTExfT0ZGU0VUICAgICAweDEwMApAQCAtMTA5LDYgKzExMSwy
MiBAQCBzdGF0aWMgdm9pZCB6eW5xX3dyaXRlX2JvYXJkX3NldHVwKEFSTUNQVSAqY3B1LAogICAg
ICAgICAgICAgICAgICAgICAgICBzaXplb2YoYm9hcmRfc2V0dXBfYmxvYiksIEJPQVJEX1NFVFVQ
X0FERFIpOwogfQogCitzdGF0aWMgdm9pZCB6eW5xX3NlY29uZGFyeV9jcHVfcmVzZXQoQVJNQ1BV
ICpjcHUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0
IGFybV9ib290X2luZm8gKmluZm8pCit7CisgICAgdWludDMyX3Qgc2Vjb25kYXJ5X3NldHVwX2Js
b2JbXSA9IHsKKyAgICAgICAgMHhlMzIwZjAwMiwgLyogd2ZlICovCisgICAgICAgIDB4ZTUxZmYw
MDQsIC8qIGxkciBwYywgW3BjLCAjLTRdICovCisgICAgICAgIFNFQ09OREFSWV9TRVRVUF9BRERS
CisgICAgfTsKKyAgICBmb3IgKGludCBuID0gMDsgbiA8IEFSUkFZX1NJWkUoc2Vjb25kYXJ5X3Nl
dHVwX2Jsb2IpOyBuKyspIHsKKyAgICAgICAgc2Vjb25kYXJ5X3NldHVwX2Jsb2Jbbl0gPSB0c3dh
cDMyKHNlY29uZGFyeV9zZXR1cF9ibG9iW25dKTsKKyAgICB9CisgICAgcm9tX2FkZF9ibG9iX2Zp
eGVkKCJzZWNvbmRhcnktc2V0dXAiLCBzZWNvbmRhcnlfc2V0dXBfYmxvYiwKKyAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKHNlY29uZGFyeV9zZXR1cF9ibG9iKSwgU0VDT05EQVJZX1NFVFVQ
X0FERFIpOworICAgIGNwdV9zZXRfcGMoQ1BVKGNwdSksIFNFQ09OREFSWV9TRVRVUF9BRERSKTsK
K30KKwogc3RhdGljIHN0cnVjdCBhcm1fYm9vdF9pbmZvIHp5bnFfYmluZm8gPSB7fTsKIAogc3Rh
dGljIHZvaWQgZ2VtX2luaXQoTklDSW5mbyAqbmQsIHVpbnQzMl90IGJhc2UsIHFlbXVfaXJxIGly
cSkKQEAgLTM2Myw2ICszODEsNyBAQCBzdGF0aWMgdm9pZCB6eW5xX2luaXQoTWFjaGluZVN0YXRl
ICptYWNoaW5lKQogICAgIHp5bnFfYmluZm8ubG9hZGVyX3N0YXJ0ID0gMDsKICAgICB6eW5xX2Jp
bmZvLmJvYXJkX3NldHVwX2FkZHIgPSBCT0FSRF9TRVRVUF9BRERSOwogICAgIHp5bnFfYmluZm8u
d3JpdGVfYm9hcmRfc2V0dXAgPSB6eW5xX3dyaXRlX2JvYXJkX3NldHVwOworICAgIHp5bnFfYmlu
Zm8uc2Vjb25kYXJ5X2NwdV9yZXNldF9ob29rID0genlucV9zZWNvbmRhcnlfY3B1X3Jlc2V0Owog
CiAgICAgYXJtX2xvYWRfa2VybmVsKHp5bnFfbWFjaGluZS0+Y3B1WzBdLCBtYWNoaW5lLCAmenlu
cV9iaW5mbyk7CiB9Ci0tIAoyLjQzLjAKCg==
------=_Part_108858_488006610.1726705730826--
