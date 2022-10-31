Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp613840ejc;
        Sun, 30 Oct 2022 19:16:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jhFcbYOZA57cCbRvd0Mw01DJgIfOXbqpj72LOJhN5fpErSswkspXX6w6SeQsWC4lyI80f
X-Received: by 2002:ac8:5f0b:0:b0:399:6c9:fc05 with SMTP id x11-20020ac85f0b000000b0039906c9fc05mr8673934qta.611.1667182605121;
        Sun, 30 Oct 2022 19:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182605; cv=none;
        d=google.com; s=arc-20160816;
        b=sreKcSF0B4A+W5lnnZNRyZVDSqCklWGJfgfSZtH7K+N2iGY3Sri+yeCBvSuKA7I2TP
         we1ktVlXmafnpCyCrCuTE/nuGTrCydBIwmAZwy4lyOn/f8ZxjHBQ6SGk4osBSoPZxbB5
         EotmnRBUAJUpiCfn19mpf9IWfFS5Twf/MWAhj6T4D5GKFyj/SFW+Vfo+kBmWMNHr8GVd
         H2Eby1xAX1yJ2MjK3IqX7nkzv/a+pOFbtRLWIsPMBmMFOLNSOOx78k3EDYhOMCngJb+S
         cRi3CCJ6u36gKpoQnl8GtiXyu7iOBcHLrWEXX2APB4XMi+AgKHIeUcBoQD1P9/6KrnVd
         9QiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=U5AHZaHLtS1DZQ3a2z8zhHBdM1uCH1zPUO+OKDDgq9U=;
        b=BRIp11nqz35U4qSQ15JcP9p/98mFjlktkVZgZFnecELd+bAwSOJQCtCkEhtYKqX7ea
         I1eDMGqLAmLd3wpGpePFLXJBBU7M4HSlEwKOW1nXoOlcxkf9C6IR0Jt+FRPn7m3MORxj
         PxhbV5k1uK/SKZxj5aV4x5GE7As4tDbgUh+oYmbCT5bfW56kACG85avYpYrP6bvcr9Lu
         xqvl7h1HdDxcbX4akUE2pI4dMZBD+K52tUy5bWpybus8an0se03yQZyit9gohcqbugFH
         evUI3KJZapmChMHAXVJzOqTyJ5jo5in2FPEJWDrd49U80k39Nkyb+m6jeZ+jyh9hEwlb
         +O+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fa13-20020a05622a4ccd00b0039ceb3aba38si3313031qtb.572.2022.10.30.19.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:16:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opKLc-0001Ii-8b; Sun, 30 Oct 2022 22:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKLW-0001CS-LZ; Sun, 30 Oct 2022 22:16:16 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKLT-000372-0l; Sun, 30 Oct 2022 22:16:13 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 2074511F299;
 Mon, 31 Oct 2022 02:15:47 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Mon, 31 Oct 2022 01:28:54 +0100
Subject: [PATCH qemu.git 11/11] hw/timer/imx_epit: rework CR write handling
Message-ID: <166718254546.5893.5075929684621857903-11@git.sr.ht>
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
X-TUID: rzPrcy+h0Z2N

From: Axel Heider <axel.heider@hensoldt.net>

- simplify code, improve comments
- fix https://gitlab.com/qemu-project/qemu/-/issues/1263

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 139 +++++++++++++++++++++-----------------------
 1 file changed, 65 insertions(+), 74 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 7dd9f54c9c..4a6326b1de 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -69,43 +69,6 @@ static uint32_t imx_epit_get_freq(IMXEPITState *s)
     return f_in / prescaler;
 }
=20
-static void imx_epit_reset(DeviceState *dev)
-{
-    IMXEPITState *s =3D IMX_EPIT(dev);
-
-    /*
-     * Soft reset doesn't touch some bits; hard reset clears them
-     */
-    s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
-    s->sr =3D 0;
-    s->lr =3D EPIT_TIMER_MAX;
-    s->cmp =3D 0;
-    /* clear the interrupt */
-    qemu_irq_lower(s->irq);
-
-    ptimer_transaction_begin(s->timer_cmp);
-    ptimer_transaction_begin(s->timer_reload);
-    /* stop both timers */
-    ptimer_stop(s->timer_cmp);
-    ptimer_stop(s->timer_reload);
-    /* compute new frequency */
-    uint32_t freq =3D imx_epit_get_freq(s);
-    DPRINTF("Setting ptimer frequency to %u\n", freq);
-    if (freq) {
-        ptimer_set_freq(s->timer_reload, freq);
-        ptimer_set_freq(s->timer_cmp, freq);
-    }
-    /* init both timers to EPIT_TIMER_MAX */
-    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-    if (freq && (s->cr & CR_EN)) {
-        /* if the timer is still enabled, restart it */
-        ptimer_run(s->timer_reload, 0);
-    }
-    ptimer_transaction_commit(s->timer_cmp);
-    ptimer_transaction_commit(s->timer_reload);
-}
-
 static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
@@ -192,56 +155,75 @@ static void imx_epit_update_compare_timer(IMXEPITState =
*s)
=20
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
-    uint32_t freq =3D 0;
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
=20
-    /* SWR bit is never persisted, it clears itself once reset is done */
     uint32_t oldcr =3D s->cr;
     s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
=20
     if (value & CR_SWR) {
-        /* handle the reset */
-        imx_epit_reset(DEVICE(s));
         /*
-         * TODO: could we 'break' here? following operations appear
-         * to duplicate the work imx_epit_reset() already did.
+         * Soft reset doesn't touch some bits, just a hard reset clears all
+         * of them. Clearing CLKSRC disables the input clock, which will
+         * happen when we re-init of the timer frequency below.
+         */
+        s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
+        /*
+         * We have applied the new CR value and then cleared most bits,
+         * thus some bits from the write request are now lost. The TRM
+         * is not clear about the behavior, maybe these bits are to be
+         * applied after the reset (e.g. for selecting a new clock
+         * source). However, it seem this is undefined behavior and a
+         * it's assumed a reset does not try to do anything else.
          */
+        s->sr =3D 0;
+        s->lr =3D EPIT_TIMER_MAX;
+        s->cmp =3D 0;
+        /* turn interrupt off since SR and the OCIEN bit is cleared */
+        qemu_irq_lower(s->irq);
+        /* reset timer limits, set timer values to the limits */
+        ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
+        ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
     }
=20
-    ptimer_transaction_begin(s->timer_cmp);
-    ptimer_transaction_begin(s->timer_reload);
-
-    if (!(value & CR_SWR)) {
-        uint32_t freq =3D imx_epit_get_freq(s);
+    /* re-initialize frequency, or turn off timers if input clock is off */
+    uint32_t freq =3D imx_epit_get_freq(s);
+    if (freq) {
         DPRINTF("Setting ptimer frequency to %u\n", freq);
-        if (freq) {
-            ptimer_set_freq(s->timer_reload, freq);
-            ptimer_set_freq(s->timer_cmp, freq);
-        }
+        ptimer_set_freq(s->timer_reload, freq);
+        ptimer_set_freq(s->timer_cmp, freq);
     }
=20
-    if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
-        if (s->cr & CR_ENMOD) {
-            uint64_t limit =3D (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
-            /* set new limit and also set timer to this value right now */
-            ptimer_set_limit(s->timer_reload, limit, 1);
-            ptimer_set_limit(s->timer_cmp, limit, 1);
-        }
-        ptimer_run(s->timer_reload, 0);
-        imx_epit_update_compare_timer(s);
-    } else if (!(s->cr & CR_EN)) {
-        /* stop both timers */
-        ptimer_stop(s->timer_reload);
+    if (!freq || !(s->cr & CR_EN)) {
+        /*
+         * The EPIT timer is effectively disabled if it is not enabled or
+         * the input clock is off. In this case we can stop the ptimers.
+         */
         ptimer_stop(s->timer_cmp);
-    } else if (s->cr & CR_OCIEN) {
-        if (!(oldcr & CR_OCIEN)) {
-            imx_epit_update_compare_timer(s);
-        }
+        ptimer_stop(s->timer_reload);
     } else {
-        ptimer_stop(s->timer_cmp);
+        /* The EPIT timer is active. */
+        if (!(oldcr & CR_EN)) {
+            /* The EPI timer has just been enabled, initialize and start it.=
 */
+            if (s->cr & CR_ENMOD) {
+                uint64_t limit =3D (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
+                /* set new limit and also set timer to this value right now =
*/
+                ptimer_set_limit(s->timer_reload, limit, 1);
+                ptimer_set_limit(s->timer_cmp, limit, 1);
+            }
+            ptimer_run(s->timer_reload, 0);
+        }
     }
+    /*
+     * Commit the change to s->timer_reload, so it can propagate and the
+     * updated value will be read in imx_epit_update_compare_timer(),
+     * Otherwise a stale value will be seen and the compare interrupt is
+     * set up wrongly.
+     */
+    ptimer_transaction_commit(s->timer_reload);
+    imx_epit_update_compare_timer(s);
=20
     ptimer_transaction_commit(s->timer_cmp);
-    ptimer_transaction_commit(s->timer_reload);
 }
=20
 static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
@@ -269,10 +251,10 @@ static void imx_epit_write_lr(IMXEPITState *s, uint32_t=
 value)
         ptimer_set_count(s->timer_reload, s->lr);
     }
     /*
-     * Commit the change to s->timer_reload, so it can propagate. Otherwise
-     * the timer interrupt may not fire properly. The commit must happen
-     * before calling imx_epit_update_compare_timer(), which reads
-     * s->timer_reload internally again.
+     * Commit the change to s->timer_reload, so it can propagate and the
+     * updated value will be read in imx_epit_update_compare_timer(),
+     * Otherwise a stale value will be seen and the compare interrupt is
+     * set up wrongly.
      */
     ptimer_transaction_commit(s->timer_reload);
     imx_epit_update_compare_timer(s);
@@ -390,6 +372,15 @@ static void imx_epit_realize(DeviceState *dev, Error **e=
rrp)
     s->timer_cmp =3D ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
=20
+static void imx_epit_reset(DeviceState *dev)
+{
+    IMXEPITState *s =3D IMX_EPIT(dev);
+
+    /* initialize CR and perform a software reset */
+    s->cr =3D 0;
+    imx_epit_write_cr(s, CR_SWR);
+}
+
 static void imx_epit_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc  =3D DEVICE_CLASS(klass);
--=20
2.34.5
