Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3832392lfb;
        Tue, 19 May 2020 01:53:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgK3hTVgqfurNEpGwbWabIXys0k5AG/Ng2ZzDC5j/Pxqn6pZzllgfHJ1WbkS2n7HnsgY4l
X-Received: by 2002:ac8:33c5:: with SMTP id d5mr11131721qtb.346.1589878380138;
        Tue, 19 May 2020 01:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589878380; cv=none;
        d=google.com; s=arc-20160816;
        b=etQecPMJ20x6yt/zCfT6CvvX5rtZJ4v2/MAuDWcHClTkE3Hep2d2nuA4BCv0CmwPw7
         Ndqs9c8sZ+0dgH2NvL1olkM4fKAuZirv4N0mblUsqaTIsDia49jhm8vPtKSEeY7b8sXz
         07l8SsNjzLrwsSEX+CAQiVaCI/5M9oHC+0DxLdPlwiFs8WRM+qx1D5Dixz7jQxSGprcf
         orErZwFx8q45RYwggN/xFN9KvtWUjeh0pTrwFR2OxEQHAdrPU5q6pk3u7FITnFgGSzse
         FOC1LQFA+DUvD9k6+5lZK9VW8GAEt3aQMqUOOKaRvFulbFrrItQm6hzdRtw4hRwF9dF9
         zTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=pOuUI+1tST3FK7Wstgga3Y1tPCzNwcrbCogRrWYxRyg=;
        b=O9Y3VSLWp/9OVQvbSFGk6PGwq353rvGbCgTDbBk7/ndv8K7l0w1pCT2AHkUBx05liB
         hbZspyyiM4UiAcGkq1Cce0Jrk0kKb0Az9YehX5eQfOJhK/Hf91GA2Xj+bmiVqw2uTA55
         o7C7De6oo2lqLfi20/q4zR0xrFEbeP7tWk59m0S3ls4YjH1arODu0TuKOpVe0SXBXO2E
         g7uE4zW/vfG7Uhpe6GE3EHxclttKJW9Zvs3FzCZqB+fC11E0HMGQ2EZI7YbiMN93BGs/
         9yZjITpDsnU/l0yLWOUM48tgTLKG/cGTrKNgB1uaU6dPsydfVGGAJ65cyKy/Fixh3KTw
         3FTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si6813661qvy.66.2020.05.19.01.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 01:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaxzf-0007Ep-LK
	for alex.bennee@linaro.org; Tue, 19 May 2020 04:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geert@linux-m68k.org>)
 id 1jaxyW-0006D5-MI
 for qemu-devel@nongnu.org; Tue, 19 May 2020 04:51:48 -0400
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19]:49374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert@linux-m68k.org>)
 id 1jaxyV-0004KV-In
 for qemu-devel@nongnu.org; Tue, 19 May 2020 04:51:48 -0400
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
 by laurent.telenet-ops.be with bizsmtp
 id gYrk2200S4CPMDc01Yrkql; Tue, 19 May 2020 10:51:44 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jaxyS-0002Mh-GL; Tue, 19 May 2020 10:51:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jaxyS-0000Mw-E7; Tue, 19 May 2020 10:51:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] ARM: PL061: Introduce N_GPIOS
Date: Tue, 19 May 2020 10:51:43 +0200
Message-Id: <20200519085143.1376-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a02:1800:110:4::f00:19;
 envelope-from=geert@linux-m68k.org; helo=laurent.telenet-ops.be
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J1Tbdt2kxgq3

Add a definition for the number of GPIO lines controlled by a PL061
instance, and use it instead of the hardcoded magic value 8.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 hw/gpio/pl061.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 2a828260bdb0b946..6d3c36bc16cf9e0d 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -36,6 +36,8 @@ static const uint8_t pl061_id_luminary[12] =
 #define TYPE_PL061 "pl061"
 #define PL061(obj) OBJECT_CHECK(PL061State, (obj), TYPE_PL061)
 
+#define N_GPIOS 8
+
 typedef struct PL061State {
     SysBusDevice parent_obj;
 
@@ -62,7 +64,7 @@ typedef struct PL061State {
     uint32_t cr;
     uint32_t amsel;
     qemu_irq irq;
-    qemu_irq out[8];
+    qemu_irq out[N_GPIOS];
     const unsigned char *id;
     uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
 } PL061State;
@@ -112,7 +114,7 @@ static void pl061_update(PL061State *s)
     changed = s->old_out_data ^ out;
     if (changed) {
         s->old_out_data = out;
-        for (i = 0; i < 8; i++) {
+        for (i = 0; i < N_GPIOS; i++) {
             mask = 1 << i;
             if (changed & mask) {
                 DPRINTF("Set output %d = %d\n", i, (out & mask) != 0);
@@ -125,7 +127,7 @@ static void pl061_update(PL061State *s)
     changed = (s->old_in_data ^ s->data) & ~s->dir;
     if (changed) {
         s->old_in_data = s->data;
-        for (i = 0; i < 8; i++) {
+        for (i = 0; i < N_GPIOS; i++) {
             mask = 1 << i;
             if (changed & mask) {
                 DPRINTF("Changed input %d = %d\n", i, (s->data & mask) != 0);
@@ -364,8 +366,8 @@ static void pl061_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &pl061_ops, s, "pl061", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
-    qdev_init_gpio_in(dev, pl061_set_irq, 8);
-    qdev_init_gpio_out(dev, s->out, 8);
+    qdev_init_gpio_in(dev, pl061_set_irq, N_GPIOS);
+    qdev_init_gpio_out(dev, s->out, N_GPIOS);
 }
 
 static void pl061_class_init(ObjectClass *klass, void *data)
-- 
2.17.1

