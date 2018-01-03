Received: by 10.223.134.117 with SMTP id 50csp12110053wrw;
        Wed, 3 Jan 2018 08:24:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBovgDeytXeb24bL3PpA4X7nJ7CiGLDJTCuKHVKkniXv39n74867djdEinFu7mO2TClVbw2Q9
X-Received: by 10.37.233.2 with SMTP id n2mr1843145ybd.274.1514996691186;
        Wed, 03 Jan 2018 08:24:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514996691; cv=none;
        d=google.com; s=arc-20160816;
        b=nyJ6W0ZRoJ+JoMy5Z5JFuUjNvZP8sjBPsRQo+ALC9RsDy1QD2HX3fMc8fUpdJXtC6D
         o7/igW55yNzEzJxzfpF1JZ6p8TE7N2X40JTsud2Wip0i7rADzBuOIUAsKIJped95LPTG
         ynAmOcozRBepx2mCSTO7P9pmy6KAGOYtAyQSHqn0iYMCkaKP9B3rqz//5nH2nZeDllZ7
         Cmuxd56KKjp0kPaUy5k+36qZZaUfrvbLRQuyjRYTKZUnU05KmsqjX+abbTqfbaT8A5aF
         LGP+N4UKTTR8d0XXJ4m2wXlFn2HJfiYO73dA+opI9Q+0pi/cHje0mPAtGH4h7M+KrOit
         O11w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ZAYXSXLOCdt3LidcgZriVmI+pUUqymgFJ7ci/yxcKeY=;
        b=xcHpa40pHF8Bynal3wJJj9GEJzUsW2gSFSpgnT/usJ4IRU0812wrXkfJ00qMxeMZVI
         XOGdh+5dtUlDXMW++4rGV1DGiVGQeC80t85Q+5fyzGBfYROrw1ya0KGuRHDEjf36V9QU
         YwRcC3kQbL2AflUZFWx411J/WiELMMajVZJ4/iGOZXWTa4SH86fIAi7RbxmCVoBZbG/n
         THoZleUBCEwXsXsSjUiaY9fOFgKzMHvWxGdQDaRN7lETIPJjWrAjs/Y4WUn7+VL8wxTk
         qSOGZBsLdKg+czeQldzxupe0vS4MVLyayvWg1ZSqw8k5+HtWxn0GHAhjSz68SBE3Uh3r
         Aizg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gc77Cete;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7si286500ybh.653.2018.01.03.08.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:24:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gc77Cete;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWlqU-00046L-Hv
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:24:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpv-00043S-Ga
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpu-0004yn-Km
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:24:15 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:39377)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWlpu-0004yS-Gr; Wed, 03 Jan 2018 11:24:14 -0500
Received: by mail-qt0-x242.google.com with SMTP id k19so2721390qtj.6;
	Wed, 03 Jan 2018 08:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZAYXSXLOCdt3LidcgZriVmI+pUUqymgFJ7ci/yxcKeY=;
	b=Gc77CeteX2vHOr79D5er1GaQyLwHDiM1PQqzF/Bxtsa+m6/UtPQ+goX4VMKID0UBZY
	VlnJeF6/e8Xp5Vyp8naS9UeCREkGS5i2qe3huy4Luszc6xs2LQO/g58dj3u5WgpqByYJ
	8PWJ2VQFLH8vrAQAGQU58h/Nk0mGtazr4BIyf73VfNzkUv7HO9Cn23ss1kKX1B89KVBk
	robvfWg8qMtrXFwmrKMkviBVh134gm6pSQhK5zhlqbU5gwRFwoYhoE1gf/tedgD0HIAE
	tYqJSB99xV34YTPy2bSCn3Lz1UbEwxCO2IafzeGxqSHfOLmnhG5z+Tmyd+KVsVRsf7De
	D5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ZAYXSXLOCdt3LidcgZriVmI+pUUqymgFJ7ci/yxcKeY=;
	b=PIcZq7ycAWvy1IGBstDSofrVPs2iiCmupAszR6qooRSHUepmI96s6bF8kYr+eDXWGb
	9LUE81d52cb4onT04VIlVfTNye+FyEs8q0lh2kXP5cT+Njdlfo5GWCIeQXdUQ9JN/7dZ
	/LScL8ZapWASByVcQGuHAFP8IFUjUcVY09MqQ5bKvNzk2fVhfN1gtw/EjjkErTaqyEiR
	L7oDIMeHRlKFJ2tTuoRJoRry4pOBjVhzi4SbdHYRneRRJWUCELS+zeJv3teLhj8oYq7t
	jJUTogDK3HkANBVCBCfTlPAAlFt9vY/xYh+c1wIlP4HtEStsO0ezsA74B+gUs8Oza92E
	4+Eg==
X-Gm-Message-State: AKGB3mIWWoTn89/cJnyf4mSfoJFyKrbPlFXRmSRev24lwY9eDurotQDx
	bs7W/H3+f2LvSURCZcSEAa0=
X-Received: by 10.237.59.202 with SMTP id s10mr2373806qte.294.1514996654016;
	Wed, 03 Jan 2018 08:24:14 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 102sm839393qkx.85.2018.01.03.08.24.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:24:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>,
	Xiaoqiang Zhao <zxq_yx_007@163.com>
Date: Wed,  3 Jan 2018 13:23:56 -0300
Message-Id: <20180103162400.10396-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103162400.10396-1-f4bug@amsat.org>
References: <20180103162400.10396-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH 2/6] hw/sd/milkymist-memcard: split realize()
 out of SysBusDevice init()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cfGX3FbQjMYp

Create the SDCard in the realize() function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/milkymist-memcard.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 5de3e00e2f..5df3a0f815 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -255,24 +255,29 @@ static void milkymist_memcard_reset(DeviceState *d)
 static int milkymist_memcard_init(SysBusDevice *dev)
 {
     MilkymistMemcardState *s = MILKYMIST_MEMCARD(dev);
-    DriveInfo *dinfo;
+
+    memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops, s,
+            "milkymist-memcard", R_MAX * 4);
+    sysbus_init_mmio(dev, &s->regs_region);
+
+    return 0;
+}
+
+static void milkymist_memcard_realize(DeviceState *dev, Error **errp)
+{
+    MilkymistMemcardState *s = MILKYMIST_MEMCARD(dev);
     BlockBackend *blk;
+    DriveInfo *dinfo;
 
     /* FIXME use a qdev drive property instead of drive_get_next() */
     dinfo = drive_get_next(IF_SD);
     blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
     s->card = sd_init(blk, false);
     if (s->card == NULL) {
-        return -1;
+        error_setg(errp, "failed to init SD card");
+        return;
     }
-
     s->enabled = blk && blk_is_inserted(blk);
-
-    memory_region_init_io(&s->regs_region, OBJECT(s), &memcard_mmio_ops, s,
-            "milkymist-memcard", R_MAX * 4);
-    sysbus_init_mmio(dev, &s->regs_region);
-
-    return 0;
 }
 
 static const VMStateDescription vmstate_milkymist_memcard = {
@@ -298,6 +303,7 @@ static void milkymist_memcard_class_init(ObjectClass *klass, void *data)
     SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
 
     k->init = milkymist_memcard_init;
+    dc->realize = milkymist_memcard_realize;
     dc->reset = milkymist_memcard_reset;
     dc->vmsd = &vmstate_milkymist_memcard;
     /* Reason: init() method uses drive_get_next() */
-- 
2.15.1

