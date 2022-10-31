Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp614830ejc;
        Sun, 30 Oct 2022 19:18:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KtGNj4HorXVjTfoU29sJpWnRj680iiuIIe9Sgcpd+fL79hhRUbzF0scrJRDCi43RnEy2J
X-Received: by 2002:a05:6214:2aa8:b0:4bb:64ed:3a86 with SMTP id js8-20020a0562142aa800b004bb64ed3a86mr9210905qvb.29.1667182719082;
        Sun, 30 Oct 2022 19:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182719; cv=none;
        d=google.com; s=arc-20160816;
        b=VGAXzs2ejKJstTEYODnJttYlc9h8ow9AB9MnZbmZehpy2gZI8YWro88JXTJie2Y3JK
         Zd7mR5a7zEQ8qFGDNvWnhq40hpGYjbg+hP9q8AxhSAOHMInQDZgPqZcmsYN/vCZx6Rol
         K9mAKGwLhz9Jw/EyKkZah2BB7B7cVvIlw97OmgV79Oy8WoFZUmtJcQPTWyNtjhYEfcZJ
         eUjmU0sVw0pGlJ20O9V4AZoy6/QP2qxImsXUP8N/lHfz1jHrzY20Lr58CKtal5BsBdoP
         M6imSPXLhQa0850wvq7HUlTXoo0iuhlv1LRYlivwrT7pIt+0WISnEe2GhmIPg3jDSN/V
         yq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=2+vpnWWFqXd7shL4bPq2e9Bg0n76a/cFDXPhP2ggvs0=;
        b=e6b6utvhsUGN8WTlPeHg8CLZUVlJcMmkRK2yxYbbHG/zRP8Op9xLLFtRxHJUV+TC0T
         Y2M0SKfamkFDA6+ZiXfJWnVS/Zz059ncNmLOcjBbkFK8vzHlbn/q+p/u5CcKDxVZ1VmI
         s1dRad58cR6996aODAZuQ+dk10iqqNX+MqUVCZyzL4L6ZoqzmOSMG07oNesYL2YMMcwb
         57rpS0TssIoS77uv+jYLKeXN3aHiswWe28NmPKUwPkrmpO1W9mqj3DFi9vx8l7eWE/yx
         50LmE5bjhjq1PH/8nWV5Lr49BjutPZ9TxAin47fEmUle0rzhtpjnsWYmOWHoGKghefcr
         VpQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15-20020a0562141ccf00b004b3f281a292si3132232qvd.9.2022.10.30.19.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opKLb-0001Gk-8E; Sun, 30 Oct 2022 22:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKLW-0001C1-HD; Sun, 30 Oct 2022 22:16:16 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKLS-00036u-Pb; Sun, 30 Oct 2022 22:16:12 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 01F9E11F298;
 Mon, 31 Oct 2022 02:15:47 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 01:25:21 +0100
Subject: [PATCH qemu.git 10/11] hw/timer/imx_epit: fix compare timer update
Message-ID: <166718254546.5893.5075929684621857903-10@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YxyGyZ+Q1CXV

From: Axel Heider <axel.heider@hensoldt.net>

The compare timer will never fire if the reload value is less
than the compare value, so it must be disabled in this case.
The compare time fire exactly once when the compare value is
less than the current value, but the reload values is less
than the compare value.

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 112 +++++++++++++++++++++++++-------------------
 1 file changed, 64 insertions(+), 48 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 196fc67c30..7dd9f54c9c 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -61,29 +61,12 @@ static const IMXClk imx_epit_clocks[] =3D  {
     CLK_32k,       /* 11 ipg_clk_32k -- ~32kHz */
 };
=20
-/*
- * Must be called from within a ptimer_transaction_begin/commit block
- * for both s->timer_cmp and s->timer_reload.
- */
-static uint32_t imx_epit_set_freq(IMXEPITState *s)
+static uint32_t imx_epit_get_freq(IMXEPITState *s)
 {
-    uint32_t clksrc;
-    uint32_t prescaler;
-    uint32_t freq;
-
-    clksrc =3D extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
-    prescaler =3D 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
-
-    freq =3D imx_ccm_get_clock_frequency(s->ccm,
-                                imx_epit_clocks[clksrc]) / prescaler;
-
-    DPRINTF("Setting ptimer frequency to %u\n", freq);
-
-    if (freq) {
-        ptimer_set_freq(s->timer_reload, freq);
-        ptimer_set_freq(s->timer_cmp, freq);
-    }
-    return freq;
+    uint32_t clksrc =3D extract32(s->cr, CR_CLKSRC_SHIFT, CR_CLKSRC_BITS);
+    uint32_t prescaler =3D 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCA=
LE_BITS);
+    uint32_t f_in =3D imx_ccm_get_clock_frequency(s->ccm, imx_epit_clocks[cl=
ksrc]);
+    return f_in / prescaler;
 }
=20
 static void imx_epit_reset(DeviceState *dev)
@@ -106,7 +89,12 @@ static void imx_epit_reset(DeviceState *dev)
     ptimer_stop(s->timer_cmp);
     ptimer_stop(s->timer_reload);
     /* compute new frequency */
-    uint32_t freq =3D imx_epit_set_freq(s);
+    uint32_t freq =3D imx_epit_get_freq(s);
+    DPRINTF("Setting ptimer frequency to %u\n", freq);
+    if (freq) {
+        ptimer_set_freq(s->timer_reload, freq);
+        ptimer_set_freq(s->timer_cmp, freq);
+    }
     /* init both timers to EPIT_TIMER_MAX */
     ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
     ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
@@ -155,21 +143,51 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offs=
et, unsigned size)
     return reg_value;
 }
=20
-/* Must be called from ptimer_transaction_begin/commit block for s->timer_cm=
p */
-static void imx_epit_reload_compare_timer(IMXEPITState *s)
+/*
+ * Must be called from a ptimer_transaction_begin/commit block for
+ * s->timer_cmp, but outside of a transaction block of s->timer_reload,
+ * so the proper counter value is read.
+ */
+static void imx_epit_update_compare_timer(IMXEPITState *s)
 {
-    if ((s->cr & (CR_EN | CR_OCIEN)) =3D=3D (CR_EN | CR_OCIEN))  {
-        /* if the compare feature is on and timers are running */
-        uint32_t tmp =3D ptimer_get_count(s->timer_reload);
-        uint64_t next;
-        if (tmp > s->cmp) {
-            /* It'll fire in this round of the timer */
-            next =3D tmp - s->cmp;
-        } else { /* catch it next time around */
-            next =3D tmp - s->cmp + ((s->cr & CR_RLD) ? EPIT_TIMER_MAX : s->=
lr);
+    int is_oneshot =3D 0;
+
+    /*
+     * The compare time will only be active when the EPIT timer is enabled
+     * (CR_EN), the compare interrupt generation is enabled (CR_OCIEN) and
+     *  the input clock if not off.
+     */
+    uint32_t freq =3D imx_epit_get_freq(s);
+    if (!freq || ((s->cr & (CR_EN | CR_OCIEN)) !=3D (CR_EN | CR_OCIEN))) {
+        ptimer_stop(s->timer_cmp);
+        return;
+    }
+
+    /* calculate the next timeout for the compare timer. */
+    uint64_t tmp =3D ptimer_get_count(s->timer_reload);
+    uint64_t max =3D (s->cr & CR_RLD) ? EPIT_TIMER_MAX : s->lr;
+    if (s->cmp <=3D tmp) {
+        /* fire in this round */
+        tmp -=3D s->cmp;
+        /* if the reload value is less than the compare value, the timer will
+         * only fire once
+         */
+        is_oneshot =3D (s->cmp > max);
+    } else {
+        /*
+         * fire after a reload - but only if the reload value is equal
+         * or higher than the compare value.
+         */
+        if (s->cmp > max) {
+            ptimer_stop(s->timer_cmp);
+            return;
         }
-        ptimer_set_count(s->timer_cmp, next);
+        tmp +=3D max - s->cmp;
     }
+
+    /* re-initialize the compare timer and run it */
+    ptimer_set_count(s->timer_cmp, tmp);
+    ptimer_run(s->timer_cmp, is_oneshot);
 }
=20
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
@@ -193,7 +211,12 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t =
value)
     ptimer_transaction_begin(s->timer_reload);
=20
     if (!(value & CR_SWR)) {
-        freq =3D imx_epit_set_freq(s);
+        uint32_t freq =3D imx_epit_get_freq(s);
+        DPRINTF("Setting ptimer frequency to %u\n", freq);
+        if (freq) {
+            ptimer_set_freq(s->timer_reload, freq);
+            ptimer_set_freq(s->timer_cmp, freq);
+        }
     }
=20
     if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
@@ -203,22 +226,15 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t=
 value)
             ptimer_set_limit(s->timer_reload, limit, 1);
             ptimer_set_limit(s->timer_cmp, limit, 1);
         }
-
-        imx_epit_reload_compare_timer(s);
         ptimer_run(s->timer_reload, 0);
-        if (s->cr & CR_OCIEN) {
-            ptimer_run(s->timer_cmp, 0);
-        } else {
-            ptimer_stop(s->timer_cmp);
-        }
+        imx_epit_update_compare_timer(s);
     } else if (!(s->cr & CR_EN)) {
         /* stop both timers */
         ptimer_stop(s->timer_reload);
         ptimer_stop(s->timer_cmp);
     } else if (s->cr & CR_OCIEN) {
         if (!(oldcr & CR_OCIEN)) {
-            imx_epit_reload_compare_timer(s);
-            ptimer_run(s->timer_cmp, 0);
+            imx_epit_update_compare_timer(s);
         }
     } else {
         ptimer_stop(s->timer_cmp);
@@ -255,11 +271,11 @@ static void imx_epit_write_lr(IMXEPITState *s, uint32_t=
 value)
     /*
      * Commit the change to s->timer_reload, so it can propagate. Otherwise
      * the timer interrupt may not fire properly. The commit must happen
-     * before calling imx_epit_reload_compare_timer(), which reads
+     * before calling imx_epit_update_compare_timer(), which reads
      * s->timer_reload internally again.
      */
     ptimer_transaction_commit(s->timer_reload);
-    imx_epit_reload_compare_timer(s);
+    imx_epit_update_compare_timer(s);
     ptimer_transaction_commit(s->timer_cmp);
 }
=20
@@ -268,7 +284,7 @@ static void imx_epit_write_cmp(IMXEPITState *s, uint32_t =
value)
     s->cmp =3D value;
=20
     ptimer_transaction_begin(s->timer_cmp);
-    imx_epit_reload_compare_timer(s);
+    imx_epit_update_compare_timer(s);
     ptimer_transaction_commit(s->timer_cmp);
 }
=20
--=20
2.34.5

