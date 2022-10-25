Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp530900ejx;
        Thu, 1 Dec 2022 07:42:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7K2ccHlpW/UFIofxY8hDBO6oCEqFn7BZxk2+F8Luwc22jkt7BN67/ZkG6y3m9uOR+S0HS6
X-Received: by 2002:a05:6214:370e:b0:4c6:9c41:13b1 with SMTP id np14-20020a056214370e00b004c69c4113b1mr56439106qvb.44.1669909353343;
        Thu, 01 Dec 2022 07:42:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669909353; cv=none;
        d=google.com; s=arc-20160816;
        b=yLWsZkBAP4FjPV5G2x/H5d1kIvYgjZEILXdsQfd9vX6FD9ms+6ZqDHlK2hZya3km79
         EhbqFSam3Jo8rb3NWMiveKdwdNXIdTB8XOTBuxTH6DAyDmAT0O0wM5hnU1m92us4zYcp
         xdETFSLACxmUcBndgf2Ck8nk/S2PaYVNFK9h5lm0rdy+GL7AiWKehqPrzs6jl4JOhIRV
         02n1xEaeCu/SaZCou32vDKR53Yav8qoC8PwGCdqX2Ey3WsGXjsLy9DYzew1/SYmvty2R
         diQ4ubI3L/kWIgUBtCZFZXvmhHL9GAw2b6Dfm2cDGwF0Wob249uxNkFsRsXTBNQDCPJC
         VWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=poXOZKuHLeaDp/LD2Gv8e1Lxu2Kpc/jkSbizH5UQtLc=;
        b=iPZyNCwO2LavFjyLo2Eb3JTIM7bbZCntyyPanv2eSRI1ubfT70jSJ5mmwVsuJDi01h
         EohoPRhDwJifHh2s/lJZbFYAXyyXhOK+qY3Q0MTAvuIyHOV2IollhQ/IYpk7sQ8Db9cK
         cIGl8iDH3U1zypu2AwI87C1ovGn4ugGChgqVH1/pR5FfLjs4kt/uFvUiJ1dg3KTWXMEG
         KS0xCEHvpaFzwgJVOfDgeAsrHTe27HXQFtadNsKYy5WOJkB5iaeI7S7QVjIoKlr30Ji5
         4uewleYyzN3WQovzbU1R3g8ToVVIPR6TLy5bxPX1KMkcm4b0fDq/ErG9zeLJh99msZnC
         EWDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020a05620a158900b006ed277c6079si2232012qkk.122.2022.12.01.07.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 07:42:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0lhO-0005Fy-Pc; Thu, 01 Dec 2022 10:42:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhM-0005E9-4G; Thu, 01 Dec 2022 10:42:04 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1p0lhK-0004w2-FZ; Thu, 01 Dec 2022 10:42:03 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6865F11F99F;
 Thu,  1 Dec 2022 15:42:01 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 20:32:30 +0200
Subject: [PATCH qemu.git v3 4/8] hw/timer/imx_epit: update interrupt state on
 CR write access
Message-ID: <166990932074.29941.8709118178538288040-4@git.sr.ht>
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
X-TUID: JJm4RYMr2eBl

From: Axel Heider <axel.heider@hensoldt.net>

The interrupt state can change due to:
- reset clears both SR.OCIF and CR.OCIE
- write to CR.EN or CR.OCIE

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index f148868b8c..7af3a8b10e 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -206,12 +206,20 @@ static void imx_epit_write(void *opaque, hwaddr offset,=
 uint64_t value,
         if (s->cr & CR_SWR) {
             /* handle the reset */
             imx_epit_reset(DEVICE(s));
-            /*
-             * TODO: could we 'break' here? following operations appear
-             * to duplicate the work imx_epit_reset() already did.
-             */
         }
=20
+        /*
+         * The interrupt state can change due to:
+         * - reset clears both SR.OCIF and CR.OCIE
+         * - write to CR.EN or CR.OCIE
+         */
+        imx_epit_update_int(s);
+
+        /*
+         * TODO: could we 'break' here for reset? following operations appear
+         * to duplicate the work imx_epit_reset() already did.
+         */
+
         ptimer_transaction_begin(s->timer_cmp);
         ptimer_transaction_begin(s->timer_reload);
=20
--=20
2.34.5

