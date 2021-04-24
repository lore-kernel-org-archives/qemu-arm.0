Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp2324357lfb;
        Sat, 24 Apr 2021 09:28:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgqrzcnRrIUtA7+XzjfNfpHZ4d/HjHtRABp9xHYELx5F6E0IoNbHRQQ+iFAZhbTB63UTFr
X-Received: by 2002:a05:6638:3013:: with SMTP id r19mr8508337jak.36.1619281696477;
        Sat, 24 Apr 2021 09:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619281696; cv=none;
        d=google.com; s=arc-20160816;
        b=rc6xumdYPDtTz3yTaTlD3npbRHdm769LY6Yb5BMcxv+I8QEcHHRlzylpFq6CYXrFa9
         aSjozyyFBxTavQwNUd2nwoLXLVjIr/Xgc5A+NxoyY6WoE3fNMLwUuQq4j+0n3uLydJOa
         p0XHESFOuTkPrjlDDyCzw6vJRDGhoDdLxtmTlov1tiicUmb5kr7SXEOdTY5AjwzkXDYn
         GOJK/fr7bB3XLQ8+dBqnlO7T+aYQfDkTUXe/yHmHQ99RrXiKzHWGmz277Z0M1jf0VhBp
         GSfOhgJ4SDMhQu8INsp3aIcqx/jTw6fv/yLrtITvb2aSP6X8pA0mmhgd2rn9VLRQYVOu
         F/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4+QISpS2fmofHFusvT0iZzLeTqf48stVhGPP0rBj26c=;
        b=rExTBVSPzkuGpK9ZXwiGCE1FcfmOgunEEhdURoNcrqgQI5sxw/0c/Vfcpmw+vUaxg0
         VXPjIl81D3bgJ55jN8sD/F245Si9jvvyNDJhg4abSY1/d3S6gqB0LSoXvHo1HM+/SiLm
         /sgGDnozWlwtvHdGs+foYctZvfY9Vf5mbZGEprH689cQNmUvDCc4XFKlDleNhTFQ/xbn
         h0N0B1094sp/8wVywnAYxIM6Zx84QOJ5k06N6TtucU3L0uGxk5yV3w7Hb4RLaCrju8fP
         r1vjJBYndXV+t1vgahMgvRysmsfyaKOlSxi25D5ZggHhk58JIDSaG+lxbpsF8K4WvlFy
         i6xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X9aNCpiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si9392722ila.22.2021.04.24.09.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Apr 2021 09:28:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X9aNCpiU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1laL8h-0007d9-RE
	for alex.bennee@linaro.org; Sat, 24 Apr 2021 12:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3U-0000Ck-IT; Sat, 24 Apr 2021 12:22:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laL3T-0004Ma-5a; Sat, 24 Apr 2021 12:22:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id p6so44746223wrn.9;
 Sat, 24 Apr 2021 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4+QISpS2fmofHFusvT0iZzLeTqf48stVhGPP0rBj26c=;
 b=X9aNCpiU5uRRiB4ZvEDKILDSMIgY4GeFiCX/xw971wZzOSpY8Wsc5uyf8DvE63kKEO
 y3Ca1JRzH0MZ+qeYaWuyDw+Bczl+VD+LDFZbivN+YnBS6xFt1YFg5/7pQLWfe3qnLTNL
 JFLJYPoLYYEWaSPjkvdVaqrWcJRHYav3pLjhCWQkYzTmQT63Wb9D6KeCTIvqrqpWFx0P
 x8hiXo18CnpQN2qW+S5ZQNVL4QduF9E1v36ey08dsUFAN5i2nhcMB4olJGO3UltO/AuK
 EgKA0OkUBHn+7KZoZG7YZ8fBSYCnXoiVjeu3W2+Gitv3Tg3L04eU3TsI3eDXTrK29u3B
 esgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4+QISpS2fmofHFusvT0iZzLeTqf48stVhGPP0rBj26c=;
 b=gUu5KLruo/TvfyjhgZeH5zmkGR9LHFy/0mDmCV5IoIg7BEnkaQpu8bYx3gODkE+eHT
 KbBZSKp1mn2q542wQtQHTnQiwyrMYCDLsopDxHP9FX8rs9JJZmCGCSr9uCtYZhMklgMq
 oXX/Nbe5mYzdFZA6KPC1KLjuXLcmaFz3Opmd08LpjRYl5b1zaTOO/RKJ334vAIBteC9u
 dm/TRZBPcT4egDgN/8CynpwwGYdCRsW5fCkI57qW+m7uCEEeAT+PH5f493dBPsLwb6wn
 lkhdwMEMm6Xe1UOP88fe9bdoU3mv2jYzBCM6wM28zYzLp+jniv3LFwrUz7gVCknSk1dG
 NCjQ==
X-Gm-Message-State: AOAM531c7MeBJGtpjkUOARgTudwxo7gUfcHiWGuO+WhDNa1M6KVjP1AI
 sjofOtXBQ7avQXJtKkp6ZxjAZCShcz24Yw==
X-Received: by 2002:a05:6000:23c:: with SMTP id
 l28mr11521347wrz.79.1619281368579; 
 Sat, 24 Apr 2021 09:22:48 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u14sm12782211wrq.65.2021.04.24.09.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Apr 2021 09:22:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/block/nand: Register machine reset handler
Date: Sat, 24 Apr 2021 18:22:27 +0200
Message-Id: <20210424162229.3312116-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210424162229.3312116-1-f4bug@amsat.org>
References: <20210424162229.3312116-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b/OOBaqZ9bm4

The TYPE_NAND device is bus-less, thus isn't reset automatically.
Register a reset handler to get reset with the machine.

Fixed: 7426aa72c36 ("nand: Don't inherit from Sysbus")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/block/nand.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index 8bc80e35144..d3fb5107bfe 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-properties-system.h"
 #include "hw/block/flash.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/reset.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -364,6 +365,11 @@ static const VMStateDescription vmstate_nand = {
     }
 };
 
+static void nand_reset_handler(void *dev)
+{
+    device_legacy_reset(DEVICE(dev));
+}
+
 static void nand_realize(DeviceState *dev, Error **errp)
 {
     int pagesize;
@@ -423,6 +429,13 @@ static void nand_realize(DeviceState *dev, Error **errp)
     }
     /* Give s->ioaddr a sane value in case we save state before it is used. */
     s->ioaddr = s->io;
+
+    qemu_register_reset(nand_reset_handler, dev);
+}
+
+static void nand_unrealize(DeviceState *dev)
+{
+    qemu_unregister_reset(nand_reset_handler, dev);
 }
 
 static Property nand_properties[] = {
@@ -437,6 +450,7 @@ static void nand_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = nand_realize;
+    dc->unrealize = nand_unrealize;
     dc->reset = nand_reset;
     dc->vmsd = &vmstate_nand;
     device_class_set_props(dc, nand_properties);
-- 
2.26.3

