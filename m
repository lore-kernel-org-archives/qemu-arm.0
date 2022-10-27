Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp613726ejc;
        Sun, 30 Oct 2022 19:16:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7h3NVgR7mdln7aQzNpG88HJj3+c98VKBy/5fLwjZPy9ybwXAoRz11OrzF9lJg2QTpyaTnm
X-Received: by 2002:a37:2d84:0:b0:6fa:1747:5369 with SMTP id t126-20020a372d84000000b006fa17475369mr6046790qkh.693.1667182587459;
        Sun, 30 Oct 2022 19:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182587; cv=none;
        d=google.com; s=arc-20160816;
        b=AXdDm6UBCrGpDwpakyh3OyWQZqY2sEpNTXFRslKW0mWKxYCOUpoVJzyc0tUBjqJWmQ
         jCZ+CNmv2xLNB2JCy2+8sevDexx9yR7AQB+euFIvG9nPUCKRE2VKB8ExoN2pGcjT5ibB
         zqc6CpjXZ/Sl+C1Ewon6XnOsVpUng8O624swH25Io8wklD9wFy2QBkYU4Oq1MRg8ouJG
         9qCIpGszWaIF0TELICcvujdV4qafyV35xdV8pJJ6vJD3We5LzNq8eAM8cKmwTcdzA3vp
         MZCmSaQwMDUTfR+r6+ZKasskmwfwP9H/8J1fSHrQUWmEIswjOVboWoXcpSDy8lxAbMyo
         YW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=u4QB5MdOYijQ6wz9cNTsumgqBbAvVfNFfbfy0u+zsqo=;
        b=XkY/6gylXJbfS3EoKqLRFaMD6yq5h9mk/LZ/MlQvJqlHWjekJL+qNYFk2oGyG2JZFm
         7cn6bdZRacr+ak6O6nYAAB80Fc3tJD97qMWUhM2ZW0m9d4C0OWVGr1jzuf93jmlfOc3r
         HEYQNPhDoIE+HGBQdaluYCM1hy74hAE+Ah20ZhqJsXBDcUKbUEXqVk99QLCpOGl4N6ej
         8fP201hIneKdMuQDbyeSaxdFsZ0No6bpkaGpDf4UgyV8ME2eWInVnwRNFdZP7UhkVuTQ
         iz9DzPxl0ElZXN9De8utj+6+FF84AeDXw8jT+wN01Q/ztbU0vKr3c8wC60UzXkNtSxNo
         I1Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci9-20020a05622a260900b003a4f758c177si3270433qtb.254.2022.10.30.19.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opKLB-00018K-R7; Sun, 30 Oct 2022 22:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL8-000156-H5; Sun, 30 Oct 2022 22:15:50 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL5-00033w-GZ; Sun, 30 Oct 2022 22:15:50 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 09B0811F25B;
 Mon, 31 Oct 2022 02:15:46 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Thu, 27 Oct 2022 15:09:58 +0200
Subject: [PATCH qemu.git 03/11] hw/timer/imx_epit: factor out register write
 handlers
Message-ID: <166718254546.5893.5075929684621857903-3@git.sr.ht>
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
X-TUID: e/lNBjyd0Sln

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 189 ++++++++++++++++++++++++--------------------
 1 file changed, 103 insertions(+), 86 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index b6c013292f..a79f58c963 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -188,111 +188,128 @@ static void imx_epit_reload_compare_timer(IMXEPITStat=
e *s)
     }
 }
=20
-static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
-                           unsigned size)
+static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
-    IMXEPITState *s =3D IMX_EPIT(opaque);
-    uint64_t oldcr;
-
-    DPRINTF("(%s, value =3D 0x%08x)\n", imx_epit_reg_name(offset >> 2),
-            (uint32_t)value);
-
-    switch (offset >> 2) {
-    case 0: /* CR */
-
-        oldcr =3D s->cr;
-        s->cr =3D value & 0x03ffffff;
-        if (s->cr & CR_SWR) {
-            /* handle the reset */
-            imx_epit_reset(DEVICE(s));
-            /*
-             * TODO: could we 'break' here? following operations appear
-             * to duplicate the work imx_epit_reset() already did.
-             */
-        }
-
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
+    uint32_t oldcr =3D s->cr;
+    s->cr =3D value & 0x03ffffff;
+    if (s->cr & CR_SWR) {
+        /* handle the reset */
+        imx_epit_reset(DEVICE(s));
+        /*
+         * TODO: could we 'break' here? following operations appear
+         * to duplicate the work imx_epit_reset() already did.
+         */
+    }
=20
-        if (!(s->cr & CR_SWR)) {
-            imx_epit_set_freq(s);
-        }
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
=20
-        if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
-            if (s->cr & CR_ENMOD) {
-                if (s->cr & CR_RLD) {
-                    ptimer_set_limit(s->timer_reload, s->lr, 1);
-                    ptimer_set_limit(s->timer_cmp, s->lr, 1);
-                } else {
-                    ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
-                    ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
-                }
-            }
+    if (!(s->cr & CR_SWR)) {
+        imx_epit_set_freq(s);
+    }
=20
-            imx_epit_reload_compare_timer(s);
-            ptimer_run(s->timer_reload, 0);
-            if (s->cr & CR_OCIEN) {
-                ptimer_run(s->timer_cmp, 0);
+    if (s->freq && (s->cr & CR_EN) && !(oldcr & CR_EN)) {
+        if (s->cr & CR_ENMOD) {
+            if (s->cr & CR_RLD) {
+                ptimer_set_limit(s->timer_reload, s->lr, 1);
+                ptimer_set_limit(s->timer_cmp, s->lr, 1);
             } else {
-                ptimer_stop(s->timer_cmp);
-            }
-        } else if (!(s->cr & CR_EN)) {
-            /* stop both timers */
-            ptimer_stop(s->timer_reload);
-            ptimer_stop(s->timer_cmp);
-        } else  if (s->cr & CR_OCIEN) {
-            if (!(oldcr & CR_OCIEN)) {
-                imx_epit_reload_compare_timer(s);
-                ptimer_run(s->timer_cmp, 0);
+                ptimer_set_limit(s->timer_reload, EPIT_TIMER_MAX, 1);
+                ptimer_set_limit(s->timer_cmp, EPIT_TIMER_MAX, 1);
             }
+        }
+
+        imx_epit_reload_compare_timer(s);
+        ptimer_run(s->timer_reload, 0);
+        if (s->cr & CR_OCIEN) {
+            ptimer_run(s->timer_cmp, 0);
         } else {
             ptimer_stop(s->timer_cmp);
         }
+    } else if (!(s->cr & CR_EN)) {
+        /* stop both timers */
+        ptimer_stop(s->timer_reload);
+        ptimer_stop(s->timer_cmp);
+    } else if (s->cr & CR_OCIEN) {
+        if (!(oldcr & CR_OCIEN)) {
+            imx_epit_reload_compare_timer(s);
+            ptimer_run(s->timer_cmp, 0);
+        }
+    } else {
+        ptimer_stop(s->timer_cmp);
+    }
+
+    ptimer_transaction_commit(s->timer_cmp);
+    ptimer_transaction_commit(s->timer_reload);
+}
+
+static void imx_epit_write_sr(IMXEPITState *s, uint32_t value)
+{
+    /* writing 1 to OCIF clears the OCIF bit */
+    if (value & 0x01) {
+        s->sr =3D 0;
+        imx_epit_update_int(s);
+    }
+}
+
+static void imx_epit_write_lr(IMXEPITState *s, uint32_t value)
+{
+    s->lr =3D value;
+
+    ptimer_transaction_begin(s->timer_cmp);
+    ptimer_transaction_begin(s->timer_reload);
+    if (s->cr & CR_RLD) {
+        /* Also set the limit if the LRD bit is set */
+        /* If IOVW bit is set then set the timer value */
+        ptimer_set_limit(s->timer_reload, s->lr, s->cr & CR_IOVW);
+        ptimer_set_limit(s->timer_cmp, s->lr, 0);
+    } else if (s->cr & CR_IOVW) {
+        /* If IOVW bit is set then set the timer value */
+        ptimer_set_count(s->timer_reload, s->lr);
+    }
+    /*
+     * Commit the change to s->timer_reload, so it can propagate. Otherwise
+     * the timer interrupt may not fire properly. The commit must happen
+     * before calling imx_epit_reload_compare_timer(), which reads
+     * s->timer_reload internally again.
+     */
+    ptimer_transaction_commit(s->timer_reload);
+    imx_epit_reload_compare_timer(s);
+    ptimer_transaction_commit(s->timer_cmp);
+}
+
+static void imx_epit_write_cmp(IMXEPITState *s, uint32_t value)
+{
+    s->cmp =3D value;
+
+    ptimer_transaction_begin(s->timer_cmp);
+    imx_epit_reload_compare_timer(s);
+    ptimer_transaction_commit(s->timer_cmp);
+}
=20
-        ptimer_transaction_commit(s->timer_cmp);
-        ptimer_transaction_commit(s->timer_reload);
+static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
+                           unsigned size)
+{
+    IMXEPITState *s =3D IMX_EPIT(opaque);
+
+    DPRINTF("(%s, value =3D 0x%08x)\n", imx_epit_reg_name(offset >> 2),
+            (uint32_t)value);
+
+    switch (offset >> 2) {
+    case 0: /* CR */
+        imx_epit_write_cr(s, (uint32_t)value);
         break;
=20
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clears the OCIF bit */
-        if (value & 0x01) {
-            s->sr =3D 0;
-            imx_epit_update_int(s);
-        }
+        imx_epit_write_sr(s, (uint32_t)value);
         break;
=20
     case 2: /* LR - set ticks */
-        s->lr =3D value;
-
-        ptimer_transaction_begin(s->timer_cmp);
-        ptimer_transaction_begin(s->timer_reload);
-        if (s->cr & CR_RLD) {
-            /* Also set the limit if the LRD bit is set */
-            /* If IOVW bit is set then set the timer value */
-            ptimer_set_limit(s->timer_reload, s->lr, s->cr & CR_IOVW);
-            ptimer_set_limit(s->timer_cmp, s->lr, 0);
-        } else if (s->cr & CR_IOVW) {
-            /* If IOVW bit is set then set the timer value */
-            ptimer_set_count(s->timer_reload, s->lr);
-        }
-        /*
-         * Commit the change to s->timer_reload, so it can propagate. Otherw=
ise
-         * the timer interrupt may not fire properly. The commit must happen
-         * before calling imx_epit_reload_compare_timer(), which reads
-         * s->timer_reload internally again.
-         */
-        ptimer_transaction_commit(s->timer_reload);
-        imx_epit_reload_compare_timer(s);
-        ptimer_transaction_commit(s->timer_cmp);
+        imx_epit_write_lr(s, (uint32_t)value);
         break;
=20
     case 3: /* CMP */
-        s->cmp =3D value;
-
-        ptimer_transaction_begin(s->timer_cmp);
-        imx_epit_reload_compare_timer(s);
-        ptimer_transaction_commit(s->timer_cmp);
-
+        imx_epit_write_cmp(s, (uint32_t)value);
         break;
=20
     default:
--=20
2.34.5

