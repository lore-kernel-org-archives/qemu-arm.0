Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3080494lfh;
        Sun, 22 May 2022 12:10:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4G1SAkpOOIPBTW6kiuHxFXxbcY2R8sp2UqPe1+XOihmRg/lmiyyYsYCZrw4oD8322cn6x
X-Received: by 2002:a05:620a:784:b0:6a3:596b:d9a3 with SMTP id 4-20020a05620a078400b006a3596bd9a3mr6316641qka.394.1653246650963;
        Sun, 22 May 2022 12:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653246650; cv=none;
        d=google.com; s=arc-20160816;
        b=QxrKM5kttwBifNg1xWQpd3BVtJAHqTsVC2jF7UCA6RGFtixGaKR6dtrNGj1ODbwXMD
         x00izs3Yc9MQkm2RrqRyyK+MaT5zPTcFr1sAxr+6M9pq2mg9KuaY2tW+wC4OJRAm949R
         xZBSqFj/cYPU2+GzpD3CRwSoraXV6EJH9CpGK8dlWvmrdFX2YDlTUz0/Mg3i68Os7KFv
         bal0gWjv8Kv3KRtb+jLTtxL97mA2c9tymOJGV+AHhjL1GpRte08gnrdy1q7V8DH8Lu5z
         PNdYqXzpIKJ/xPaGEmd+g3Swk5Kp9cVLrgA+pzDmouEIXT/3dxmjr8o8R+o06zSc1VLq
         TQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=TiKunVyuEOnENdlPtZRZIB9VgBsQdAVg6xJsfHP4w6w=;
        b=iQFaH4jJvB6GsFqBfF99rkmQrEo0AizuBj1r+VX720XNj4wHNk8796EHchU1YHQyfP
         cH0WeWnr3/pFKCoRAGh/PuROFodud72wzAhjIuPkNLXYdq4FwaLOCovkc7cr9IzE9KBe
         8h+i2Cn4+WVK/PCa4CkNc3/Q7OQUZ52WHCrQe+SnOLvN85hXjWSbfBEgFpvbICdLUzfX
         r4vCkb1zcjTLxf8SiFp+qiaSpFJ6SGNEkNNbCSJYvtKvYw+Ucobjb7rQ0LW2F2U6g/2Q
         OYuZ15Ily3nqHKh+48g1C2j5d0NU175LjoEobW4Q+pt7HVnzGSyJk4aN+PjmRPXuzsgX
         2ZBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=bhi3bZrf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az20-20020a05620a171400b006a001616802si2081945qkb.340.2022.05.22.12.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 12:10:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=bhi3bZrf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:60954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqyY-000101-FR
	for alex.bennee@linaro.org; Sun, 22 May 2022 15:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBm-0007yv-Do; Sun, 22 May 2022 14:20:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBk-0003e0-0A; Sun, 22 May 2022 14:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TiKunVyuEOnENdlPtZRZIB9VgBsQdAVg6xJsfHP4w6w=; b=bhi3bZrf3nQfHobXqyWZVtEaNp
 ApErbVvXXhAQYDnQLlmZyB2nPpcQDKcEfo3/uCqLloCkbCifsBpMzsu7RRfyixg4M/8Q0t93jKhxD
 1lZbP/K4aMRyx7JDFymmar166krVX+B9eZWGJVH385kODpDEYWh15LurhKx2iG1+vjvHrG9kfmm9z
 bAJmG1wOKEc9jtQW/ejI7P/Qu4fJ2egZRKWcDMABT0gqDJ8ukkXTQ/ou8NplM5s/l9+MUrwxRyp6N
 Fo5nSfCiyE7cAUnvYvmgi3arZ18QiMKw4O+SlP/z7Ee0iaasI8jxyPThGB5rNlPZEiqwoopRBA38b
 /s5dOPHSTJmFjwyqxmySpEXvZANrXmd8+NA9aV58NygjnPzE3D55lXaTizjIgRpZRNYhnkE0MbUdL
 9b46yL66RnO5fzqkumIIKOTjRSk/eWJgZ5+WVWfM+4PXAorNEh3y7z+KYmk56AAtjB6jyCJR2G3Hr
 Bktmdny2NK35Dm1kjPLWuFbUMtVni4ajBQrU14GqAnM5Px51t0ASbb3DXtDG5Xw1SN+fFuCSB/rPC
 xMxQO41UyhVPElcLWLZ9Gp0mCPtnYzEvMKgLlRjZd9drAHurv12bTHuPPMUv4N14I574m3yDVTR4P
 9s9tSvP2Hv58BByuVxsTDK27+3ksNbCVy1ItaiH1w=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAG-0007pH-97; Sun, 22 May 2022 19:18:56 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:13 +0100
Message-Id: <20220522181836.864-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 27/50] pckbd: alter i8042_mm_init() to return a I8042_MMIO
 device
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
X-TUID: k/y2VF2F986d

This exposes the I8042_MMIO device to the caller to allow the register memory
region to be mapped outside of i8042_mm_init().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/pckbd.c         | 8 +++++---
 include/hw/input/i8042.h | 6 +++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index c407c082e2..a7f1439994 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -706,9 +706,9 @@ static void i8042_mmio_class_init(ObjectClass *klass, void *data)
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
-void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                   MemoryRegion *region, ram_addr_t size,
-                   hwaddr mask)
+MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
+                            MemoryRegion *region, ram_addr_t size,
+                            hwaddr mask)
 {
     DeviceState *dev;
     KBDState *s;
@@ -728,6 +728,8 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
 
     s->kbd = ps2_kbd_init(kbd_update_kbd_irq, s);
     s->mouse = ps2_mouse_init(kbd_update_aux_irq, s);
+
+    return I8042_MMIO(dev);
 }
 
 static const TypeInfo i8042_mmio_info = {
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 59d695a9dd..d05cd33e3c 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -64,9 +64,9 @@ struct MMIOKBDState {
 #define I8042_A20_LINE "a20"
 
 
-void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
-                   MemoryRegion *region, ram_addr_t size,
-                   hwaddr mask);
+MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
+                            MemoryRegion *region, ram_addr_t size,
+                            hwaddr mask);
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
 void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
-- 
2.20.1

