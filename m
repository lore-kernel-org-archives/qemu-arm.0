Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1873046wru;
        Thu, 9 Aug 2018 06:02:49 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwxHe1KBB9QoEJzYcnOo8njXd5jl2RQsy2CiHrg2j7BAFld+smcocMD1yeGEcctBkS9ubpM
X-Received: by 2002:a25:a302:: with SMTP id d2-v6mr983538ybi.193.1533819769065;
        Thu, 09 Aug 2018 06:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819769; cv=none;
        d=google.com; s=arc-20160816;
        b=laDLhD8flWruNGB+Mms9UzWOmRnFtsNoYHae+6huBV6pIF5Q1ukU+mVCrmTZ78Vteg
         avYLAQh+Wa7E7Ig7l+PpOR0viBmrIltkz26HUVuEifCpQtj/vycjBkf93lymMgBRBJzj
         JvQ673QvgCqUCppOaVZbfSLcnt96E/z1KMfnSUpqWD0+keap8lj1Ek4Md1Hsz7ShIL01
         q6pA2qx0NYAvEUS4ixtWnrN63v8cfbTguwkKJ/XLftq8Cyc9F2LNNhe4k3fXUMLtld+b
         azriQoJh6XvETjdbG2XrcgWO3aOTrpXaagxg8+Jnv0sBWL9ikbEWkesiiXMkE9godhI+
         7isA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=n8uuyt2ZudM98RA82kXcYbhpvrT9oTgQmSk1xPoMa/0=;
        b=hDJFOXKbz0Ju91gSOllgsZNdRYNb8JbNt6fJFc8sdCYPz4wLWQm9Xsy2KWIoCyug15
         L+mTaalBEfFhXtQcfBazplHh8e6j7QQfEAHWxl32nKyyxV+fJU/Qoy3f6bbz5Pzs7ct7
         Xq3XqOUrr4yufVvb/bQtbcuuqbz8zrV9rias8Q8CgBlL5UHTaiOiq225426keOwj26Hu
         c7vlwNmOaRpE0OPJdnYq/RxZJrCliSFF29y/f8VP2Mqb6fSfvMMuelsxRropGnLm3Msd
         qk6EeAoF4Sq7onivtWFbLJmUP1xT4FloHusMx8VCwbGpViAY8C+GoaAHqwTWHA38Iw0+
         jnqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z16-v6si1754928ywz.572.2018.08.09.06.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50700 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkaW-0006Zl-Gf
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:02:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZO-0005w0-Vr
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZL-0003LI-7x
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:39 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZL-0003KI-0m; Thu, 09 Aug 2018 09:01:35 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZI-0003Ko-1x; Thu, 09 Aug 2018 14:01:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:12 +0100
Message-Id: <20180809130115.28951-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 13/16] hw/dma/pl080: Provide device reset function
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kC+coe0sqc2V

The PL080/PL081 model is missing a reset function; implement it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/pl080.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
index 8f9f3e08d9a..a7aacad74f0 100644
--- a/hw/dma/pl080.c
+++ b/hw/dma/pl080.c
@@ -348,6 +348,30 @@ static const MemoryRegionOps pl080_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void pl080_reset(DeviceState *dev)
+{
+    PL080State *s = PL080(dev);
+    int i;
+
+    s->tc_int = 0;
+    s->tc_mask = 0;
+    s->err_int = 0;
+    s->err_mask = 0;
+    s->conf = 0;
+    s->sync = 0;
+    s->req_single = 0;
+    s->req_burst = 0;
+    s->running = 0;
+
+    for (i = 0; i < s->nchannels; i++) {
+        s->chan[i].src = 0;
+        s->chan[i].dest = 0;
+        s->chan[i].lli = 0;
+        s->chan[i].ctrl = 0;
+        s->chan[i].conf = 0;
+    }
+}
+
 static void pl080_init(Object *obj)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
@@ -393,6 +417,7 @@ static void pl080_class_init(ObjectClass *oc, void *data)
     dc->vmsd = &vmstate_pl080;
     dc->realize = pl080_realize;
     dc->props = pl080_properties;
+    dc->reset = pl080_reset;
 }
 
 static const TypeInfo pl080_info = {
-- 
2.17.1

