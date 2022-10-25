Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp614274ejc;
        Sun, 30 Oct 2022 19:17:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7mKB12wQr82MgBBL96dGc/O2qoPsLU3AlBx9cbJi/lLcrf734dAo5JmB5Y6eUAPERssW0Z
X-Received: by 2002:a05:6214:3013:b0:4bb:1be2:f542 with SMTP id ke19-20020a056214301300b004bb1be2f542mr9130545qvb.7.1667182661567;
        Sun, 30 Oct 2022 19:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182661; cv=none;
        d=google.com; s=arc-20160816;
        b=Pw2CwXp/NZiGMqdoMWcIp/G+3TAx1iCuWci1zmXvCZ9BK2onxy42XbHymspW+/rePZ
         JU/Hr6+LEL/LXezSi4BYAcyyqaP1Njxn+WVy0zm4vLJ6i7JCPJFXdF3r/sDATRzUmK1i
         T4aylJb13AkvbtZWR88x9cRWSSUzddaYnA+OKMtb1VWeEQrxGL4sQEchUdh0+blPo1k1
         Fmbzxz5URDSEvGGCHJnwMjKL5cpbPItt1lHECXrKjWYPdoJS0VPCAGEf+yCRapn6Gu9r
         aq09RM0KZXD2MDy0FS50LibW2G+iuVYfzJyorxUgrrrb12dd8mhUyUulb9cX793yPokX
         aOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=+6kqSowzGdHCIpqGZ9BD3DzMdtO/3erO9vhg8oXzwh8=;
        b=vBq+IQG9TvDKT/f3CNbRPar0mrIw03QJv6yairS7c4V8m8qRAHws/BiuYLyHkK+Qf5
         41vhtJTaybf//BvHpuG43D0Rwnv7ZNKYg2xBdK5ZENZYt0WLQ1fZb4jKz2zS01asqdUI
         k6Vkol5omHKhSqTlUQJTwLsfOgsYm48FyMZMvLioJ6OOvz5z/M/8V90dYyeXWQk+DRaB
         b1z0JWuh6C+0poC7HNvOreooItCNDXF8MvX5GqWusX7pt+dz0C8PyK5I7zTnvfSBrh6H
         QyUUuZuoHgA5WkpKQmAlUzef1l2Rirdsfflk7BIWBdJMU3DQhrKXv7dnvDFaUMKuMc05
         kABA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7-20020a05622a124700b0039ce87e3d49si2811900qtx.292.2022.10.30.19.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:17:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKLM-0001BB-Pf; Sun, 30 Oct 2022 22:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL9-000167-Fn; Sun, 30 Oct 2022 22:15:51 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL7-00035v-PJ; Sun, 30 Oct 2022 22:15:51 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 941A711F279;
 Mon, 31 Oct 2022 02:15:46 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 20:06:20 +0200
Subject: [PATCH qemu.git 07/11] hw/timer/imx_epit: do not persist CR.SWR bit
Message-ID: <166718254546.5893.5075929684621857903-7@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: B4k4krTfhGOl

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 2e4ff89613..bba9c87cd4 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -175,9 +175,12 @@ static void imx_epit_reload_compare_timer(IMXEPITState *=
s)
 static void imx_epit_write_cr(IMXEPITState *s, uint32_t value)
 {
     uint32_t freq =3D 0;
+
+    /* SWR bit is never persisted, it clears itself once reset is done */
     uint32_t oldcr =3D s->cr;
-    s->cr =3D value & 0x03ffffff;
-    if (s->cr & CR_SWR) {
+    s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
+
+    if (value & CR_SWR) {
         /* handle the reset */
         imx_epit_reset(DEVICE(s));
         /*
@@ -189,7 +192,7 @@ static void imx_epit_write_cr(IMXEPITState *s, uint32_t v=
alue)
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
=20
-    if (!(s->cr & CR_SWR)) {
+    if (!(value & CR_SWR)) {
         freq =3D imx_epit_set_freq(s);
     }
=20
--=20
2.34.5

