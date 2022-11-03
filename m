Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3158833ejx;
        Mon, 7 Nov 2022 08:45:04 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7ZKomssY0M2+G4P+RvAdCXpHhN1ir124xexoEyKM2ZyHT8h0ijZJfs1HrMhAyXY635lbv8
X-Received: by 2002:a05:622a:199f:b0:3a5:5c12:fcf5 with SMTP id u31-20020a05622a199f00b003a55c12fcf5mr16173182qtc.27.1667839504716;
        Mon, 07 Nov 2022 08:45:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667839504; cv=none;
        d=google.com; s=arc-20160816;
        b=L0NneO+1uMvCpzaMINKHmW7wRB6mdqOpaAif00GzGaJtVEoZqxzeVaQGq/2wFjjLDB
         VRvCo/4Stv1QUtcPU4XW8QpiTmUu2M41AgA73/l60HpBcykkZrJE6kt+xsdmZPA85lGT
         Z6GxDGwAlNINqhk1JqygwjcHJj7qFQeQ5bF4Rvlh6IfvODV/pq+PvsGM79ENI8pTVNU7
         8ifuP/8nCpbLXdBt7Tg3UdnJhGNkjTFx5HiMQn68p+UU7UM1a4Ox4+Ir4BhciLhh/h6u
         u2ByXS11zsnz5QW7H9deg7ifkr28R1gS+frIgDzHbO+MCsiC0sx+kudbSFZD7AAbalbU
         PaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=35WDcap5KGRzmYkcqyswsXCYPof1z6EShN54xupSGJw=;
        b=PtULhvqHBbiaElUy7Y5neNvvAiM8shbKgNnaAwwCj9nK2KVhWwhuD/PdlE1a5xmC5t
         E7cLk7kELMnYSAzGRWJmiOI7KI1c8JVT24q6reO8BYLa31APSzL/OUgo0RSZEV1XobFy
         WNmHnM61VPnhkNN0njwTVfUD36QY2aB9eXKJULmlqr86Bp0rYODADeZLecpYFB01KSZg
         /V7xzdC0ybEkNG+26elqJuFGdped+r6tIFlORVLxJUnQN+QDk4U177l5gIl4LAeApSyZ
         NEKP4FcAgSOvt7RELfVShv5B4xV3g/rYXddzxBIwY8pu2S6D3x1j9rUgYjr5bbQtx39m
         TUNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs11-20020a056214226b00b0049b876cf102si4828202qvb.100.2022.11.07.08.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 08:45:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5Cm-0002Fb-C2; Mon, 07 Nov 2022 11:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CT-00027G-Ao; Mon, 07 Nov 2022 11:42:18 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CO-0005KB-EJ; Mon, 07 Nov 2022 11:42:17 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id BA2AF11F854;
 Mon,  7 Nov 2022 16:42:05 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Thu, 03 Nov 2022 12:09:28 +0100
Subject: [PATCH qemu.git v2 9/9] hw/timer/imx_epit: fix compare timer handling
Message-ID: <166783932395.3279.1096141058484230644-9@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166783932395.3279.1096141058484230644-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tZfgtxXKyMl5

From: Axel Heider <axel.heider@hensoldt.net>

- fix #1263
- rework compare time handling
  - The compare timer has to run even if CR.OCIEN is not set,
    as SR.OCIF must be updated.
  - The compare timer fires exactly once when the
    compare value is less than the current value, but the
    reload values is less than the compare value.
  - The compare timer will never fire if the reload value is
    less than the compare value. Disable it in this case.

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 188 +++++++++++++++++++++++++++++---------------
 1 file changed, 123 insertions(+), 65 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 77bd2b0a2b..cb2880cabc 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -6,6 +6,7 @@
  * Originally written by Hans Jiang
  * Updated by Peter Chubb
  * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
+ * Updated by Axel Heider
  *
  * This code is licensed under GPL version 2 or later.  See
  * the COPYING file in the top-level directory.
@@ -110,33 +111,84 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offs=
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
+    uint64_t counter =3D 0;
+    bool is_oneshot =3D false;
+    /* The compare timer only has to run if the timer peripheral is active
+     * and there is an input clock, Otherwise it can be switched off.
+     */
+    bool is_active =3D (s->cr & CR_EN) && imx_epit_get_freq(s);
+    if (is_active)
+    {
+        /*
+         * Calculate next timeout for compare timer. Reading the reload
+         * counter returns proper results only if pending transactions
+         * on it are committed here. Otherwise stale values are be read.
+         */
+        counter =3D ptimer_get_count(s->timer_reload);
+        uint64_t limit =3D ptimer_get_limit(s->timer_cmp);
+        /* The compare timer is a periodic timer if the limit is at least
+         * the compare value. Otherwise it may fire at most once in the
+         * current round.
+         */
+        bool is_oneshot =3D (limit >=3D s->cmp);
+        if (counter >=3D s->cmp) {
+            /* The compare timer fires in the current round. */
+            counter -=3D s->cmp;
+        } else if (!is_oneshot) {
+            /*
+             * The compare timer fires after a reload, as it below the
+             * compare value already in this round. Note that the counter
+             * value calculated below can be above the 32-bit limit, which
+             * is legal here because the compare timer is an internal
+             * helper ptimer only.
+             */
+            counter +=3D limit - s->cmp;
+        } else {
+            /*
+             * The compare timer wont fire in this round, and the limit is
+             * set to a value below the compare value. This practically means
+             * it will never fire, so it can be switched off.
+             */
+            is_active =3D false;
         }
-        ptimer_set_count(s->timer_cmp, next);
     }
+
+    /*
+     * Set the compare timer and let it run, or stop it. This is agnostic
+     * of CR.OCIEN bit, as this only matters for interrupt generation. The
+     * compare timer needs to run in any case, as the SR.OCIF bit must be
+     * updated even if no interrupt in generated.
+     * Note that the timer might already be stopped or be running with
+     * counter values. However, finding out when an update is needed and
+     * when not is not trivial. It's much easier applying the setting again,
+     * as this does not harm either and the overhead is negligible.
+     */
+    if (is_active) {
+        ptimer_set_count(s->timer_cmp, counter);
+        ptimer_run(s->timer_cmp, is_oneshot ? 1 : 0);
+    } else {
+        ptimer_stop(s->timer_cmp);
+    }
+
 }
=20
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
     uint32_t freq =3D 0;
-    uint32_t oldcr =3D s->cr;
+    bool set_limit =3D false;
+    bool set_counter =3D false;
=20
     /* SWR bit is never persisted, it clears itself once reset is done */
+    uint32_t old_cr =3D s->cr;
     s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
-
-    ptimer_transaction_begin(s->timer_cmp);
-    ptimer_transaction_begin(s->timer_reload);
+    uint32_t toggled_cr =3D old_cr ^ s->cr;
=20
     if (value & CR_SWR) {
         /* Soft reset doesn't touch some bits; only a hard reset clears them=
 */
@@ -149,49 +201,52 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t=
 value)
         /* turn interrupt off since SR and the OCIEN bit got cleared */
         qemu_irq_lower(s->irq);
         /* reset timer limits, set timer values to these limits */
-        ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-        ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
+        set_limit =3D true;
+        set_counter =3D true;
     } else {
-        freq =3D imx_epit_get_freq(s);
-        if (freq) {
-            ptimer_set_freq(s->timer_reload, freq);
-            ptimer_set_freq(s->timer_cmp, freq);
-        }
+        /* re-initialize the limits if CR.RLD has changed */
+        set_limit =3D toggled_cr & CR_RLD;
+        /* set the counter if the timer got just enabled and CR.ENMOD is set=
 */
+        set_counter =3D ((toggled_cr & s->cr) & CR_EN) && (s->cr & CR_ENMOD);
+    }
+
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
+
+    freq =3D imx_epit_get_freq(s);
+    if (freq) {
+        ptimer_set_freq(s->timer_reload, freq);
+        ptimer_set_freq(s->timer_cmp, freq);
     }
=20
-    if (freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
-        if (s->cr & CR_ENMOD) {
-            if (s->cr & CR_RLD) {
-                ptimer_set_limit(s->timer_reload, s->lr, 1);
-                ptimer_set_limit(s->timer_cmp, s->lr, 1);
-            } else {
-                ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-                ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-            }
+    if (set_limit || set_counter) {
+        uint64_t limit =3D (s->cr & CR_RLD) ? s->lr : EPIT_TIMER_MAX;
+        if (set_limit) {
+            ptimer_set_limit(s->timer_cmp, limit, 0);
         }
+        ptimer_set_limit(s->timer_reload, limit, set_counter ? 1 : 0);
+    }
=20
-        imx_epit_reload_compare_timer(s);
+    /*
+     * If there is an input clock and the peripheral is enabled, then ensure
+     * the wall clock timer is ticking. Otherwise stop the timers. The compa=
re
+     * timer will be updated later.
+     */
+    if (freq && (s->cr & CR_EN)) {
         ptimer_run(s->timer_reload, 0);
-        if (s->cr & CR_OCIEN) {
-            ptimer_run(s->timer_cmp, 0);
-        } else {
-            ptimer_stop(s->timer_cmp);
-        }
-    } else if (!(s->cr & CR_EN)) {
-        /* stop both timers */
-        ptimer_stop(s->timer_reload);
-        ptimer_stop(s->timer_cmp);
-    } else  if (s->cr & CR_OCIEN) {
-        if (!(oldcr & CR_OCIEN)) {
-            imx_epit_reload_compare_timer(s);
-            ptimer_run(s->timer_cmp, 0);
-        }
     } else {
+        ptimer_stop(s->timer_reload);
+        /* Stop the compare timer also. This just plays safe, the call to
+         * imx_epit_update_compare_timer() below should also so this. */
         ptimer_stop(s->timer_cmp);
     }
=20
-    ptimer_transaction_commit(s->timer_cmp);
+    /* Commit the changes to s->timer_reload, so they can propagate. */
     ptimer_transaction_commit(s->timer_reload);
+
+    /* Update the compare timer based on the committed reload timer value. */
+    imx_epit_update_compare_timer(s);
+    ptimer_transaction_commit(s->timer_cmp);
 }
=20
 static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
@@ -218,14 +273,10 @@ static void imx_epit_write_lr(IMXEPITState *s, uint32_t=
 value)
         /* If IOVW bit is set then set the timer value */
         ptimer_set_count(s->timer_reload, s->lr);
     }
-    /*
-     * Commit the change to s->timer_reload, so it can propagate. Otherwise
-     * the timer interrupt may not fire properly. The commit must happen
-     * before calling imx_epit_reload_compare_timer(), which reads
-     * s->timer_reload internally again.
-     */
+    /* Commit the changes to s->timer_reload, so they can propagate. */
     ptimer_transaction_commit(s->timer_reload);
-    imx_epit_reload_compare_timer(s);
+    /* Update the compare timer based on the committed reload timer value. */
+    imx_epit_update_compare_timer(s);
     ptimer_transaction_commit(s->timer_cmp);
 }
=20
@@ -233,8 +284,9 @@ static void imx_epit_write_cmp(IMXEPITState *s, uint32_t =
value)
 {
     s->cmp =3D value;
=20
+    /* Update the compare timer based on the committed reload timer value. */
     ptimer_transaction_begin(s->timer_cmp);
-    imx_epit_reload_compare_timer(s);
+    imx_epit_update_compare_timer(s);
     ptimer_transaction_commit(s->timer_cmp);
 }
=20
@@ -274,16 +326,22 @@ static void imx_epit_cmp(void *opaque)
 {
     IMXEPITState *s =3D IMX_EPIT(opaque);
=20
-    /* Set the interrupt status flag to signaled. */
-    DPRINTF("sr was %d\n", s->sr);
-    s->sr =3D 1;
+    if (s->cr & CR_EN) {
+        /* Set the interrupt status flag to signaled. */
+        DPRINTF("sr was %d\n", s->sr);
+        s->sr =3D 1;
=20
-    /*
-     * An actual interrupt is generated only if the peripheral is enabled
-     * and the interrupt generation is enabled.
-     */
-    if ((s->cr & (CR_EN | CR_OCIEN)) =3D=3D (CR_EN | CR_OCIEN)) {
-        qemu_irq_raise(s->irq);
+        /* If CR,OCIEN is set, an actual interrupt is generated */
+        if (s->cr & CR_OCIEN) {
+            qemu_irq_raise(s->irq);
+        }
+    } else {
+        /*
+         * The cmp ptimer is not supposed to be running when the
+         * peripheral is not enabled. Ignore this. However, it's
+         * worth investigating why this happened.
+         */
+        DPRINTF("compare trigger when timer not enabled\n");
     }
 }
=20
--=20
2.34.5
