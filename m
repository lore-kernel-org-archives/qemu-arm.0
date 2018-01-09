Received: by 10.28.173.206 with SMTP id w197csp3733693wme;
        Tue, 9 Jan 2018 06:04:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBosqdeWnM9XQzBkD4FSiDJgrinIZFn11jD4783QPLi+bonLiJb7UkbrM3JXiAbJLpMXVsB2i
X-Received: by 10.129.119.131 with SMTP id s125mr9280550ywc.166.1515506677549;
        Tue, 09 Jan 2018 06:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515506677; cv=none;
        d=google.com; s=arc-20160816;
        b=IPabb408N6FBK/es2Q0gpKmw8CYZsXNMv9025YwlVKyyx20rWvkBzn5ucTcXZtEAQa
         O0DWYycgehxclVzVFyrh0BKj5rvsiXls25KTgc2UImfzJu6GpsYxBUJxGRcb+WOvnY6S
         WFknUYaSydZhBHO0TPFgf5j4SgitQXzzrvsgeM5N5jbk/CUPZ7n3GzvQofGuqfI+e1o4
         iXDbTf1mdGWpiQNmt8tE8zGz6qK6tDZBuqprjY/FxMNk6zQ3pxg2yiDT2uQ2tVE693nP
         eEINJ38AHRW14JajMct17YeAcPzU+o8CHfm0xOte82izPWNreBJTJ0/6ZaJIQ8sEdbbM
         BnYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=J1ldDW2V7oPKtznNt7RCOwJyIeTQj2tkcROExEUA6RE=;
        b=aMS3cVsM4mOJyhosm/P10ZvH89WsFFVR5dm01foNhwh8qJjZ9blj6DXL+ndo1vBsyx
         STG3XXBVxdLDETr9jnHKTQUWvad7JgicAlLtu1qtbM7Y5D+56MBD2ifG2Z3Y5vGHDCWR
         GCqosIq4RCauA9whYJ5ZK3ZjboPgrhyH/yOMQIGmPyj+2ec6O2gat402HstWchbKOs3r
         NLwuRX0YR8Zsw/gasusyAW0BiMaR8M+1AOunmzLReu5kceiIr+a072rl9yJA7jKanhyU
         ILZs2tO2UKslkQtUkL1gICMKJf78dc2WYX/6elAuRBfB2pzTgESYe24CMXzTKXZ9Ziwv
         8MvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k14si3063450ybf.745.2018.01.09.06.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYuW5-0000Xu-0R
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:04:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYuTc-00075H-C4
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:02:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eYuTW-000176-Oa
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 09:02:04 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:45806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eYuTW-00016a-HT; Tue, 09 Jan 2018 09:01:58 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eYuTV-0003f0-C0; Tue, 09 Jan 2018 14:01:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  9 Jan 2018 14:01:53 +0000
Message-Id: <1515506513-31961-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/4] hw/sd/omap_mmc: Reset SD card on controller
 reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B18iXRGrYqVc

Since omap_mmc is still using the legacy SD card API, the SD
card created by sd_init() is not plugged into any bus. This
means that the controller has to reset it manually.

Failing to do this mostly didn't affect the guest since the
guest typically does a programmed SD card reset as part of
its SD controller driver initialization, but would mean that
migration fails because it's only in sd_reset() that we
set up the wpgrps_size field.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This one isn't cc-stable because the OMAP boards don't
support migration at all anyway, being un-QOMified.
---
 hw/sd/omap_mmc.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index e934cd3..5b47cad 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -305,6 +305,12 @@ void omap_mmc_reset(struct omap_mmc_s *host)
     host->cdet_enable = 0;
     qemu_set_irq(host->coverswitch, host->cdet_state);
     host->clkdiv = 0;
+
+    /* Since we're still using the legacy SD API the card is not plugged
+     * into any bus, and we must reset it manually. When omap_mmc is
+     * QOMified this must move into the QOM reset function.
+     */
+    device_reset(DEVICE(host->card));
 }
 
 static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
@@ -587,8 +593,6 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
     s->lines = 1;	/* TODO: needs to be settable per-board */
     s->rev = 1;
 
-    omap_mmc_reset(s);
-
     memory_region_init_io(&s->iomem, NULL, &omap_mmc_ops, s, "omap.mmc", 0x800);
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
@@ -598,6 +602,8 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
         exit(1);
     }
 
+    omap_mmc_reset(s);
+
     return s;
 }
 
@@ -613,8 +619,6 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
     s->lines = 4;
     s->rev = 2;
 
-    omap_mmc_reset(s);
-
     memory_region_init_io(&s->iomem, NULL, &omap_mmc_ops, s, "omap.mmc",
                           omap_l4_region_size(ta, 0));
     omap_l4_attach(ta, 0, &s->iomem);
@@ -628,6 +632,8 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
     s->cdet = qemu_allocate_irq(omap_mmc_cover_cb, s, 0);
     sd_set_cb(s->card, NULL, s->cdet);
 
+    omap_mmc_reset(s);
+
     return s;
 }
 
-- 
2.7.4

