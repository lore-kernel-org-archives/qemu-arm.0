Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp740962wrd;
        Mon, 20 Aug 2018 07:18:34 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxRHPjfxNPNeqToyBV4RapyJLicJ4LPFN02G3evENfP31uWoysoHiAoDYQYM56AM7mif0tD
X-Received: by 2002:a0c:d842:: with SMTP id i2-v6mr41145548qvj.145.1534774713985;
        Mon, 20 Aug 2018 07:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774713; cv=none;
        d=google.com; s=arc-20160816;
        b=ErZGgRU21wmVmnzEJfsiHFZE2h0fDapqjgB/KyTVU0fzmr230SkSWFACkzvA04Cxgb
         HskdLdm/OmZR642lsWpDAVEZu/LEQWhNE8Rt/iEz/NwXqXmn91v43AoVpNEu3HQ8bX7g
         sOedrIAQ0/c1EnGizeYEZ79hn2wDj/QfVkeo036xGkCpJKHBKAWuh0KPE0In0hM+Brqy
         L0hT0yzASWVrMJUOfF81oFS5Tbav/AehSOpwwyAbQsfMBRy/yzpMVNPySdtsHgO8e5VW
         kwe691qoklOxpuCEk/+37DlSjD9dejbiq8xeYCejwwGcphTfCgkOpY+SwCx0O7synrp4
         3Tkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=wdtsziCQA3qnUfEryrR6yT3shyBS5Sp/LtVp7JI8iuo=;
        b=vC1CTfJXHGeFqb3cw43R4/xQg5EA8L4OzebmRCeXB7KMsVrYLV+6raQ38Y2goFg+1C
         ueZVJtDgkoppmU7CDUJDXnV8LAODw3nrzGuIl5IlF7/SvV4ZucdizflMBK7PEaOSMjPO
         0FeQqN77ndHJUcFSR1l43pmdjm3Kze5B5ZF9eQ4nPdDiuPw72JCioAPROrSP+HdfIZis
         pdVHj5VGT+whvM34gr07aCojT134tdiS9aB9UnsKqtZ23IQDMv1j5aGvQmZNxMylI465
         yIu2UkwaxPI5jqRWOrtf8COPnel6iTxW4zCyj16QS8YaKy0CsmY3m7bud9RjE8El7+zF
         5SuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17-v6si2761957qke.302.2018.08.20.07.18.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frl0r-0000kQ-GN
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:18:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuF-0003eZ-A2
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuE-0007P4-Eh
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frkuC-0007MX-J8; Mon, 20 Aug 2018 10:11:40 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frkuB-0003Tp-LB; Mon, 20 Aug 2018 15:11:39 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:12 +0100
Message-Id: <20180820141116.9118-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 18/22] hw/ssi/pl022: Use DeviceState::realize
 rather than SysBusDevice::init
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nCzGliv2PUO2

Move from the legacy SysBusDevice::init method to using
DeviceState::realize.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/pl022.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index c9989537062..3ac57f4c96a 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -270,26 +270,24 @@ static const VMStateDescription vmstate_pl022 = {
     }
 };
 
-static int pl022_init(SysBusDevice *sbd)
+static void pl022_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = DEVICE(sbd);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     PL022State *s = PL022(dev);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &pl022_ops, s, "pl022", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     s->ssi = ssi_create_bus(dev, "ssi");
-    return 0;
 }
 
 static void pl022_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    sdc->init = pl022_init;
     dc->reset = pl022_reset;
     dc->vmsd = &vmstate_pl022;
+    dc->realize = pl022_realize;
 }
 
 static const TypeInfo pl022_info = {
-- 
2.18.0

