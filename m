Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1714943lfq;
        Fri, 2 Oct 2020 09:42:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+qjnVAN+7X3DYJFmahybwle6rUtL6c0eyulgkFxaonKGrV6xn7JC5aKfVyi7f0us6ca5H
X-Received: by 2002:a25:2393:: with SMTP id j141mr4058822ybj.462.1601656973020;
        Fri, 02 Oct 2020 09:42:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601656973; cv=none;
        d=google.com; s=arc-20160816;
        b=aZINCjTThEh+KLSb2OdFxg1Ao64bAmUhcnXI3APrY9mpFpxFvFP73J+bzrXkepkY6y
         bh80Z0Pn6kgxqgU/f4sewhFKaLf0uu6gifCBqxa6QoyH931RraEkEZQmNFFyJh1grApM
         aOE31rVel0IlIMB4ChqnZErGMnJUlYC8PLIIL9auFOzyiPz6Z2oX0VVoW8/nVJZGLXCm
         CSPzfeFa3aKE272POUip2AO2uyv7Wr/lMgQlLuFOKcqRIktcbXR54aBzxYUJtbcbhwT+
         86HKbqWFWp2nQAVxIjlFCxISOf53xBVQw+hZjNHVCJeQjV7YoD/lj63P+S+nGcrXJdKp
         B7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kqAvM0Pu10/HybQXi4LUrcWWzLXPnfvBTRL2IryhEpk=;
        b=FKB4x1m6f0/+r0mMay10P0U+MPjLntlaKrJEZiHGPWazAyEM2JjFS2kJFhJj/2DXns
         sQCGnogYRsBPYakmResT/fbZLHaV8sTkRgkJ3/1iBQFaBqSwsUK7ywbdVLcFpphATqLF
         ytESFXB97ut5KI+RhufdlP/v4CcqM1KgO5E46x3ueYzm988/RDYbsP+6xs+DLV9TbFQx
         xLKIgnlPtkIzUtg3VDJkFtXfUllBTQZb1q9dTtj1ZRPOHsYG4rQNVL2g/3lBAmganTTM
         //hg5+LUKcLVD/Bmy9apzOqwL3tLvlCJ2AVRjIaTOLXpbKe4YYjUEgLxjlAz87lhqWdc
         730g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JmpUvUF7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x134si2717449ybe.297.2020.10.02.09.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:42:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JmpUvUF7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:60524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kOO8y-0004Bm-0X
	for alex.bennee@linaro.org; Fri, 02 Oct 2020 12:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOO8V-00049z-T7; Fri, 02 Oct 2020 12:42:23 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kOO8U-0005cj-Cs; Fri, 02 Oct 2020 12:42:23 -0400
Received: by mail-wm1-x341.google.com with SMTP id l15so1485864wmh.1;
 Fri, 02 Oct 2020 09:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kqAvM0Pu10/HybQXi4LUrcWWzLXPnfvBTRL2IryhEpk=;
 b=JmpUvUF7IZ22bKv1nFca5fYWjZBmknzrDmb/qFfqqgPIC015Qfi+N+thBX73bpf0qA
 LYjrhHBg12vtiTfF79NIBbsatlUwUNhJsfg3046oRNEpYjkZS0D+XVay9XFb+H25ZMah
 BhY6Zb/kW3akyNfStalnQSstKXCtgD7AkxOTCrBOtQ2Ul9vjwVK0XQZum7rt+hUuQ0bD
 Jb0l5R8GxJTu1hYkHlSKswy2RjdeqP5etX4YumRe6q6sRHYlTQ+wmeUkwEL6DXl1Wvqw
 ETBauO14eFzdKhCXul1ZTovEAlKHGPhP3PZXzqMltL/zQ+S4yOtdzTiALcJzPUM8a0WX
 Bkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kqAvM0Pu10/HybQXi4LUrcWWzLXPnfvBTRL2IryhEpk=;
 b=mJRaRSQcFP9Tm4QbBCBJ3xCw1JNCQXlk6c6ihy4n6Kfwficyv3FcD+8F82nitTggCD
 sWmJwbwEg1bbEqo9gco2n/dc7zcOpC3ZBj2DN9njkfBsyBxINHRH5FKpT+uB1enA6/9M
 3WX7ED92jyxOdp+XYrEJhSaMklQdDWvfobs2A6v1GIjKvrhouE9SpoAzjGHCtqAXNuEK
 DjFfwTxqHkmKQepv0C5hm+MB6JcaGBDiEAwvsW2rKoVSTfY8jLdk2wMnEiktKkj2dk6w
 koxFPCvPgdTed9VJGVkkea4GEQmVBtfkdHtOFkCPQmmNe9DwZRTkKvir5QziKaBtMsrq
 xIbg==
X-Gm-Message-State: AOAM532wgPUNyp4/aKEIMq6IBsShOEn99bQ5C78BjB794ueqHQZG+Ze3
 xCQyVUERN0m8eYk/B9mmfilc2ogFXEg=
X-Received: by 2002:a1c:ed05:: with SMTP id l5mr3859583wmh.106.1601656940043; 
 Fri, 02 Oct 2020 09:42:20 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id t17sm2378673wrx.82.2020.10.02.09.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 09:42:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] hw/timer/bcm2835: Introduce BCM2835_SYSTIMER_COUNT
 definition
Date: Fri,  2 Oct 2020 18:42:13 +0200
Message-Id: <20201002164216.1741110-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002164216.1741110-1-f4bug@amsat.org>
References: <20201002164216.1741110-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B2runX/dY1Hw

Use the BCM2835_SYSTIMER_COUNT definition instead of the
magic '4' value.

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/timer/bcm2835_systmr.h | 4 +++-
 hw/timer/bcm2835_systmr.c         | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
index 7ce8f6ef4d..43df7ee488 100644
--- a/include/hw/timer/bcm2835_systmr.h
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -16,6 +16,8 @@
 #define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
 OBJECT_DECLARE_SIMPLE_TYPE(BCM2835SystemTimerState, BCM2835_SYSTIMER)
 
+#define BCM2835_SYSTIMER_COUNT 4
+
 struct BCM2835SystemTimerState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -26,7 +28,7 @@ struct BCM2835SystemTimerState {
 
     struct {
         uint32_t status;
-        uint32_t compare[4];
+        uint32_t compare[BCM2835_SYSTIMER_COUNT];
     } reg;
 };
 
diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
index 3387a6214a..ff8c553661 100644
--- a/hw/timer/bcm2835_systmr.c
+++ b/hw/timer/bcm2835_systmr.c
@@ -134,7 +134,8 @@ static const VMStateDescription bcm2835_systmr_vmstate = {
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(reg.status, BCM2835SystemTimerState),
-        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState, 4),
+        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState,
+                             BCM2835_SYSTIMER_COUNT),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.26.2

