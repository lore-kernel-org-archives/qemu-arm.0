Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3087614lfh;
        Sun, 22 May 2022 12:31:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFkE6+60gLVVNpb+V05HEg3BcP9jXI3Y5MiAVcnhhHR5pQIWeAhoys5KoCdkud8D5oiuy8
X-Received: by 2002:a05:6214:194f:b0:461:b6e5:79b6 with SMTP id q15-20020a056214194f00b00461b6e579b6mr14744046qvk.60.1653247871012;
        Sun, 22 May 2022 12:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653247871; cv=none;
        d=google.com; s=arc-20160816;
        b=WmIyktuYK/pjUmu2mfzNC7L8yXJGdfIDjaPDf1jg8WQmQXxC35ZNi6GFZStYRpUkvd
         oifSWf8kxGHhCsNT/J7epyVkJ2wYvUrEevXKQcGs1+Gej1u+5ayBhnPO6SjziYpDgeet
         0dToKuEv6kjuF7AZ4pmryXcWR14A1/Rz2hgxBrro7Le28F+ILMUVTFgPCLNvD0Vk2B9w
         v0BAkHcvAQxVnwwhrEk9GgNeQ65v19xMhQOcjHUmW4rSJS3SHTsj7LIZDXB+LGw1TgyL
         bCQcD7qewz40Iq4emX3H87faD2QVGeRgUNXPZx8pjerKkVcilZA8AUaPGh1jxgHYR7ZV
         3zMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wIsgZdKuzxuxVIE6vIHLiUkAPJTWZ/P6Ag372fXTSq8=;
        b=DMJy49Oo5QsxUBMWuIli0TFuCbwBW6SOfDiGGwBEJ7or9vOnKMKblgiY6VsrJ6tX28
         SzqhJUMH0D9ZUF/Ft6mFsSD8s1r4v2jSTm8plROT31dajUL7rkDLQujKNITdnxuCqaGU
         rmdn90Yig7KQjcfOBhMcJVfCQeMyoYeAP8rhyykZ8tO6wwgr/9WmSr2dIlx9TXTdzTgv
         byyy+bSxGkzm0+EFx6g47EanM5ySZ3Ll4g80k/i9okzaAgWb/22mAL5knUmFTERNnmVP
         x2/EU2udAYBX1LWgM0ueZ3rYx30Te8Njf6Yk/zQVlCyJE6Ts+/imBCXr8fOAKO9kY5XQ
         tCHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=pfx0CPZT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o204-20020a37a5d5000000b0069eaaf48eebsi1848504qke.224.2022.05.22.12.31.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 12:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=pfx0CPZT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsrIE-0005cF-HX
	for alex.bennee@linaro.org; Sun, 22 May 2022 15:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCS-0000ja-OF; Sun, 22 May 2022 14:21:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCR-0003wY-74; Sun, 22 May 2022 14:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wIsgZdKuzxuxVIE6vIHLiUkAPJTWZ/P6Ag372fXTSq8=; b=pfx0CPZTyEi1YJihxrzf+tFZV+
 II5rIbKP0UvdJ7gv28GRiC2v8fDVdLw2XZquYUzYo4KgWFUtkFjogyyUeopiNsZXtIz2FVk3+JN/U
 QZ9blGwkddhKN9CHiQKGyBudnILd4dDvtYyYJWuc6V+8Kiu4298CAateTaJyLM9k23dx2AAq+Nd05
 6EHFWmifNWJT3qmnpVDAeFFEgFHEDV7+7hhsF+T4XTh2Kcuq4b6cVpBo451IDdHYNFZeyI3OFYnXQ
 5cY7UBfIQf9pI43tT0/9FJcYjSZ0lhedJxNLDlSkLSGnqxB/GZ4RUW2ZDiBWiGdcPpL4uCV5wQhfR
 o3clr8ksm86y0vFBTW8IR2zPW8zQZCi6mwJy3UzBvhjXf3ximYO1S4DfpHKwjjkUnyNrNfscwQEGL
 32OGoUL3+ze2pYWEoDV5esCCZYc4HKE3+tumMM6sxsEQd209Xbxtzv7+GChCJCPBb9q3nxQQCFRC6
 m0xuiVbtFfA8J63uvUOC1UlKMGo15T4fm7l99jfbhLvkUVKm9DOnwQR9TRWSlzPOqOP7mSLHfLKjK
 ClUJnURSHhVSV0TsN5+D1dX/63bc7i+fQ4+5DXbXPrcnS8fRdewwEuLuCj8ilUtgh4uj+cSwz2qSb
 MgZOEO0cBpejdJ4JsKbLdThNI3sxbAPKmLVp0C8no=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAx-0007pH-W9; Sun, 22 May 2022 19:19:40 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:34 +0100
Message-Id: <20220522181836.864-49-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 48/50] pckbd: add i8042_reset() function to I8042 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0634kcZeg8UX

This means that it is no longer necessary to call qemu_register_reset() manually
within i8042_realizefn().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index d89efddda9..b2fdd1c999 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -801,6 +801,14 @@ static const MemoryRegionOps i8042_cmd_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
+static void i8042_reset(DeviceState *dev)
+{
+    ISAKBDState *s = I8042(dev);
+    KBDState *ks = &s->kbd;
+
+    kbd_reset(ks);
+}
+
 static void i8042_initfn(Object *obj)
 {
     ISAKBDState *isa_s = I8042(obj);
@@ -847,7 +855,6 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
         s->throttle_timer = timer_new_us(QEMU_CLOCK_VIRTUAL,
                                          kbd_throttle_timeout, s);
     }
-    qemu_register_reset(kbd_reset, s);
 }
 
 static void i8042_build_aml(ISADevice *isadev, Aml *scope)
@@ -893,6 +900,7 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
     ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
 
     device_class_set_props(dc, i8042_properties);
+    dc->reset = i8042_reset;
     dc->realize = i8042_realizefn;
     dc->vmsd = &vmstate_kbd_isa;
     isa->build_aml = i8042_build_aml;
-- 
2.20.1

