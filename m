Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2291546ejc;
        Mon, 9 Jan 2023 06:19:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvdE6/PAHn5mfhM/yb3ijAWHUmhpxE8S3WkNf4+dlv098zVJo200yN86UFZL2QDj1bOqhDd
X-Received: by 2002:a05:6102:109c:b0:3cc:5e03:6ab with SMTP id s28-20020a056102109c00b003cc5e0306abmr20530855vsr.8.1673273991187;
        Mon, 09 Jan 2023 06:19:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673273991; cv=none;
        d=google.com; s=arc-20160816;
        b=Asera8R2+qRBVxDtovne7EMtnLQ+vPmMDFpDvLmprBdnPEHLhIu7Kp/OvrnStEfJg/
         PHa2R3tTO9MeGOtJK3UzohLo4t3YISQskzMIPbGuWtWZWL7BZ09+z5Uk4dc7e6bpqIg6
         cW2PiuhmPZfBXl5mAEJ8y9ihMr3bByXX25BFqlzX8ULDBdF2eVtXYel+H6MqwAyd9ytx
         O8gzmiWp2TgtZyol+U7nU1Q3YgGfGF1gnEjseNTf7wWI6Vx09NsdsnXH4fI2bYlKjD0x
         7zEUV0JOuqksVwaGhG1EceRWArB6rsBIyqWq4bcur/FXYoZK3+Jf1Y8GqAc88TojNNmu
         GqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QlHQBOjSmhQVd2SMP2d1A4sh6JcfbzBv9sZkKRmApVc=;
        b=LbA4hyV9UNa0cIfEv3knPdN8o7OBTvB9enhCQlTVfv/2r9mnPCbF4wjL89+bMRzxsM
         r1rVioZ1aF3Vu243mSD9FEhnBZBDeOIZUS+/pFOf/5RWQDV9pM5scEhql6BW43FYyaF+
         8DXYciEzoUT/tFLQogOc+uD35mD+uYQdBg8tgDiwsq2doWDWqdDtK9aZNs6fZD04i2u2
         UUyOpFQSe3UJ9ockkFmpUSf4fh7cTDkaAOxJgtk9RkgLkSaJRQytx3b8vxcIuB8tTh2f
         tXdyocgUoKnSEd7t5LLv9Xj5//UxRokm8+HEbMBaP8Ttu2Ny5yQNVJQl+8eUcPeZfqqf
         f3Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xW74q+C9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt12-20020a05620a478c00b006ee7fa13ddfsi4568121qkb.471.2023.01.09.06.19.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 06:19:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xW74q+C9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEslE-0001so-Ma; Mon, 09 Jan 2023 09:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskw-0001ld-Ns
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:12 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsku-0006ye-QL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6841680wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QlHQBOjSmhQVd2SMP2d1A4sh6JcfbzBv9sZkKRmApVc=;
 b=xW74q+C9PemYkd7uAK1OOa6A2bRIzPARJsdG2ZYm/Ng8/zQN4hKyDn2y64Y4aMkkTy
 vZN7CamorCv8a/gdg0RNyWGErnsk7azIUsbFSS9CPcr4gU/vJhGWtp9ECvHLByMPB5Qi
 74PGpVB+QIUe7KDHnCcl7uoow1dlAaIfaRQMskhhG0ocuVr181Fq83mBWWQX70z4rZTB
 msm8qgzh7rs6N7me27uM6u8yd8cWXM+mReBSRUeReaNJBdpGlIcFG+CHK6gYuBYpB4tw
 57AiuZ86hSiIT+Zsn0xnQ2YYg4oVzU+yjIYPOps9DoxqhVrQdl9gIbCYImObkwtCwmA5
 vF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QlHQBOjSmhQVd2SMP2d1A4sh6JcfbzBv9sZkKRmApVc=;
 b=bV1f0zsWOoGBoDkxcfmrztGQFTyuIY7b60t4uVtG/HRUvBKPoLB+GxRsnZQFvucvYq
 YnTsMk49DzFlff2Xf84+r2x7ZVrsImBUsazxFmUS2McMNd920Tbq0d0G57FGZWasOzcV
 R9mNpCuif235baCVHlc5HbiPqGzCPEJ3aiaOVQFLrjIfu9WURtCFvF5DePL+blndo1P3
 S7i00RGDCfaatc51FpugQms7yrvEN7YRxF1LR1tvlvNvcWUGkNDrVDJ6Q36/SiZOpjmX
 bmBfvso9YYYT62tnYGfELX/92zdK68uYve1I6iDxXuuD/eWAazM74x16CcqZuGi3EA5e
 S2tQ==
X-Gm-Message-State: AFqh2kq1UdGJO4POQ4zak0GaJT1/FyLYTZ7b0n7KPZa0GCukm/6hy5mm
 F1pADyhYEYzvl2KEk93Ox9+oMVRQTQ4jQN6s
X-Received: by 2002:a05:600c:47d1:b0:3d3:496b:de9d with SMTP id
 l17-20020a05600c47d100b003d3496bde9dmr46557159wmo.34.1673273043307; 
 Mon, 09 Jan 2023 06:04:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003d2157627a8sm17083837wmq.47.2023.01.09.06.04.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:04:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 11/14] hw/misc/sbsa_ec: Rename TYPE_SBSA_EC ->
 TYPE_SBSA_SECURE_EC
Date: Mon,  9 Jan 2023 15:03:03 +0100
Message-Id: <20230109140306.23161-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zNY2ymKkD2ob

The structure is named SECUREECState. Rename the type accordingly.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/sbsa_ec.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 8d939fe31b..6f19c21195 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -15,13 +15,14 @@
 #include "hw/sysbus.h"
 #include "sysemu/runstate.h"
 
-typedef struct {
+typedef struct SECUREECState {
     SysBusDevice parent_obj;
     MemoryRegion iomem;
 } SECUREECState;
 
-#define TYPE_SBSA_EC      "sbsa-ec"
-#define SECURE_EC(obj) OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_EC)
+#define TYPE_SBSA_SECURE_EC "sbsa-ec"
+#define SBSA_SECURE_EC(obj) \
+        OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_SECURE_EC)
 
 enum sbsa_ec_powerstates {
     SBSA_EC_CMD_POWEROFF = 0x01,
@@ -36,7 +37,7 @@ static uint64_t sbsa_ec_read(void *opaque, hwaddr offset, unsigned size)
 }
 
 static void sbsa_ec_write(void *opaque, hwaddr offset,
-                     uint64_t value, unsigned size)
+                          uint64_t value, unsigned size)
 {
     if (offset == 0) { /* PSCI machine power command register */
         switch (value) {
@@ -65,7 +66,7 @@ static const MemoryRegionOps sbsa_ec_ops = {
 
 static void sbsa_ec_init(Object *obj)
 {
-    SECUREECState *s = SECURE_EC(obj);
+    SECUREECState *s = SBSA_SECURE_EC(obj);
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
 
     memory_region_init_io(&s->iomem, obj, &sbsa_ec_ops, s, "sbsa-ec",
@@ -82,7 +83,7 @@ static void sbsa_ec_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo sbsa_ec_info = {
-    .name          = TYPE_SBSA_EC,
+    .name          = TYPE_SBSA_SECURE_EC,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(SECUREECState),
     .instance_init = sbsa_ec_init,
-- 
2.38.1

