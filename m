Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3157823ejx;
        Mon, 7 Nov 2022 08:43:26 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5LU+Sd6LsSwKK/m2cA/Sey+8abWW4N9blyzOQ9LFcMYrWjkWphmilLBQuZVXNFdwvfLbvD
X-Received: by 2002:a37:9a93:0:b0:6fa:2ddc:87f4 with SMTP id c141-20020a379a93000000b006fa2ddc87f4mr734538qke.479.1667839406026;
        Mon, 07 Nov 2022 08:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667839406; cv=none;
        d=google.com; s=arc-20160816;
        b=tZ4g1PsUKywOrBqweqE0zlocYfo04dH1k16d+rlYNkhO9CHZP0gdPnqrxExk++sGPM
         LhZZcMTw+/tk20NMPyi+/Zl8d/OxzxI5m+UvPQ/34zAD+REicyutW4qr/IqN3fqm7md5
         CRKlwbAMjj3gt2H2aVQy/Cy99KLp+IERUOrsJ8WaLUTUUs5KnTIcQFKfbdvDPzyvlsW6
         QAeFO8/apHGrWGkUJ7+9cMqJ4MlLwkvUqisYCquT3KM4FgW0JINTnrolJrEgTjcptmwg
         Ucux+iId1PBoubNVR/cF5zCS9DVAHBKqDbwX6nlrzbPGo78iU4jt2nxNa27MnBWl3j0u
         iYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=e1J85pqX7FzxdBmRI6CcmTqhkT5f8OQyWWyxZSuqfLk=;
        b=k7KB8UTnpBM0pWoFZNz3m9rpsw+K26ISpcndihXwDlMK7yqzTDRq9QEkvNAuiFO7OJ
         2D4yK/T5htpZGDUzMVtw8nzR2PC9GLT/olh+8MG6oKDd7CiVwaOF03dP55yAn0KqdY8v
         jw/A1MMF0L3PlfwNPsCuXSLTr+8/4RtGpAWaKuUZYhLb4Utl+HYoA04JSc3PQk24gNxY
         AA81lTXD4w5jpQ4e8lT+610+CkUGbz5FOLl7duSMyoJ6X/wNPTw/wye8wprDIpl4LEfa
         1UYookOAOKVElDgoaQWvtsLbAcEFEv28ZQ0X2GoFA6Lchh9KOYPdWm8kcwkdukFVHEbO
         st+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020ac87387000000b003a2c2ec29e8si4560157qtp.194.2022.11.07.08.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 08:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1os5CX-00028N-Ca; Mon, 07 Nov 2022 11:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CO-00025E-90; Mon, 07 Nov 2022 11:42:12 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CI-0004nG-L4; Mon, 07 Nov 2022 11:42:10 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 5BDA211F0AA;
 Mon,  7 Nov 2022 16:42:04 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 17:33:43 +0200
Subject: [PATCH qemu.git v2 1/9] hw/timer/imx_epit: improve comments
Message-ID: <166783932395.3279.1096141058484230644-1@git.sr.ht>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m0UsepkYmkS/

From: Axel Heider <axel.heider@hensoldt.net>

Fix typos, add background information

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index ec0fa440d7..4af730593f 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -100,9 +100,7 @@ static void imx_epit_reset(DeviceState *dev)
 {
     IMXEPITState *s =3D IMX_EPIT(dev);
=20
-    /*
-     * Soft reset doesn't touch some bits; hard reset clears them
-     */
+    /* Soft reset doesn't touch some bits; hard reset clears them */
     s->cr &=3D (CR_EN|CR_ENMOD|CR_STOPEN|CR_DOZEN|CR_WAITEN|CR_DBGEN);
     s->sr =3D 0;
     s->lr =3D EPIT_TIMER_MAX;
@@ -214,6 +212,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         ptimer_transaction_begin(s->timer_cmp);
         ptimer_transaction_begin(s->timer_reload);
=20
+        /* Update the frequency. Has been done already in case of a reset. */
         if (!(s->cr & CR_SWR)) {
             imx_epit_set_freq(s);
         }
@@ -254,7 +253,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         break;
=20
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clear the OCIF bit */
+        /* writing 1 to OCIF clears the OCIF bit */
         if (value & 0x01) {
             s->sr =3D 0;
             imx_epit_update_int(s);
@@ -352,8 +351,18 @@ static void imx_epit_realize(DeviceState *dev, Error **e=
rrp)
                           0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
=20
+    /*
+     * The reload timer keeps running when the peripheral is enabled. It is a
+     * kind of wall clock that does not generate any interrupts. The callback
+     * needs to be provided, but it does nothing as the ptimer already suppo=
rts
+     * all necessary reloading functionality.
+     */
     s->timer_reload =3D ptimer_init(imx_epit_reload, s, PTIMER_POLICY_LEGACY=
);
=20
+    /*
+     * The compare timer is running only when the peripheral configuration is
+     * in a state that will generate compare interrupts.
+     */
     s->timer_cmp =3D ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
=20
--=20
2.34.5

