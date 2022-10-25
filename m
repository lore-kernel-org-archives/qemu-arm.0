Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp531123ejx;
        Thu, 1 Dec 2022 07:42:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7hWLCMQbh63csi1slq9ZqkpX93b/zfJ+gJwWVRRmxKrqGGz36QheMYcxsKQ+m4lmS7LOhm
X-Received: by 2002:a37:e30f:0:b0:6eb:70db:b2e5 with SMTP id y15-20020a37e30f000000b006eb70dbb2e5mr37406972qki.445.1669909373571;
        Thu, 01 Dec 2022 07:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669909373; cv=none;
        d=google.com; s=arc-20160816;
        b=Y77C5K19K3UbKgLc7+2BEhgHqL8ccV5L2Vri2q+/GcUOZ5kyheJiT+D12VJ7btnp9V
         wFCSCDl55rpQ5UUpsp7s3IERKQfVS6vAenfG5JeLFkLr+NxCZvfz5Ex6XrSwSLJ1GvNt
         q2wdwDuQFSgoG5fywmy5kzcJH+dl5AqDCrmzkZzmHG+Vmw3ULKMuCItBu3/sj1YgIkkE
         nd7/TBP+K2J8XhL1F8HXZIENF88vnReGlGbr3eLhWC8NfTbPXfe5t0MUuLjxHXWhgnED
         1uipRNScFZqgfKDqhS5g7fH5fYwa+gPQw31FeCXyk7mTboxYdFSqolxHNZ3v2oQK0EGR
         Mhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=RI0q9sWDWOkMMowfgkuUgcsqySzGkASgT+IuCMeuRn8=;
        b=FpFre5oPwpfRNycgpaSOlnUJXcWGVm7/scyU0s6s4bAAu5GS1i/PO3FkffQGx2kRrz
         t9lrctm6NjIVkqhWAQ1z3MXT3JugwE21uR+ii3Ni8ui3G2acRpjVxd5lJD0J7ohC949G
         4fc7lG4GuEgsmyeLITdaf6cJzLINui/zaxZo9AewP0/zBSyOKTIrIIBSoVuCIBhd7odl
         0apod4yXvi88tpFroSGAmGX9VD3vovF19fSBdizUwTq5h9ruPwK2wA3SQ25dC9jvVdTY
         wptC1Zz0tc8TIeQKBW+jHi9a4bH3PzOtoz/wl2/xEFkwSNDW1M2GVwftZ5nTA0fRWPRr
         KR8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay40-20020a05622a22a800b003a603561e0esi2562305qtb.485.2022.12.01.07.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 07:42:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0lhS-0005Ho-3t; Thu, 01 Dec 2022 10:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhN-0005Ep-DC; Thu, 01 Dec 2022 10:42:05 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhL-0004vw-0j; Thu, 01 Dec 2022 10:42:05 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 0AC7C11F204;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 17:33:43 +0200
Subject: [PATCH qemu.git v3 1/8] hw/timer/imx_epit: improve comments
Message-ID: <166990932074.29941.8709118178538288040-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166990932074.29941.8709118178538288040-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
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
X-TUID: dgqKBupqaGG9

From: Axel Heider <axel.heider@hensoldt.net>

Fix typos, add background information

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index ec0fa440d7..2841fbaa1c 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -96,13 +96,14 @@ static void imx_epit_set_freq(IMXEPITState *s)
     }
 }
=20
+/*
+ * This is called both on hardware (device) reset and software reset.
+ */
 static void imx_epit_reset(DeviceState *dev)
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
@@ -214,6 +215,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         ptimer_transaction_begin(s->timer_cmp);
         ptimer_transaction_begin(s->timer_reload);
=20
+        /* Update the frequency. Has been done already in case of a reset. */
         if (!(s->cr & CR_SWR)) {
             imx_epit_set_freq(s);
         }
@@ -254,7 +256,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         break;
=20
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clear the OCIF bit */
+        /* writing 1 to OCIF clears the OCIF bit */
         if (value & 0x01) {
             s->sr =3D 0;
             imx_epit_update_int(s);
@@ -352,8 +354,18 @@ static void imx_epit_realize(DeviceState *dev, Error **e=
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

