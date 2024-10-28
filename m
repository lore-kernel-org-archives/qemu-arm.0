Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1591554njf;
        Mon, 28 Oct 2024 09:24:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUysymfvraJzoRpdkojj2BhOTPtQbbzS+qHiW1xevIyl1wEOlUrdihI81nijmwwbouMJQSM9OKmxMmqQw==@linaro.org
X-Google-Smtp-Source: AGHT+IEsaoLzVJ4kwyQlTxB2huL0oiFzbV8Yh/Uu5MjX/oPdjlX6NUbp8MRtWr/6dFMv1s3QDoky
X-Received: by 2002:a05:620a:4690:b0:7b1:4536:8dc1 with SMTP id af79cd13be357-7b193f5dad1mr1385139985a.62.1730132655082;
        Mon, 28 Oct 2024 09:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730132655; cv=none;
        d=google.com; s=arc-20240605;
        b=R+BQLKdXHh0ZVW3UZ98BpLRRLERIcLnEr50mRrf3KqEt0h9pIyqRBIhbiHFfrxm5kX
         W8AHgi17Aswoq+03YnvSd/R4DOEN34c0CE1FFx0To7U3JBpFU6uuATtXIXh/t7bcNpyv
         fBWFWsqYJXGEdXdrXxVlT/2vX0hIx08ZEl9b8uOSSZ1DTKW9ipK85YBLHduoIli0p4bZ
         xccgIAmM778gtledHmokCygccaU7r28q8dVm+9WzrnjJ6fWun1KML18HBc1EGdskgckr
         YraK/mBaVKIQuC0B+a3/nipYe0gHbGgMHvFQ2wFkbBMFa8t994swDkliIyufjDfr25E5
         qztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=VhjHBG46BtoVzYXpyhvo3Lw+9rpTLr2mBx0PmHkI4Ik=;
        fh=6z6kEATecrmSDmE1QEQLDcmJBZy5GR2pFVO6zm2FJTc=;
        b=YtUaVc+S8CXdb6Ye5ySjzPIEZU0hhFm+VH1CD5V6v08G70JIndvQjcaCFshhfXN5Sf
         ZTFvqax8FasbGpIXwtV48xVP1pwKy2JjZ+78dIoli7+WPTQCrj+bNXrQMZNLqLl46w7g
         Ef2ssd5l3/9vxc3dsO5AokMihNcL6Vop3/7ASlNpQqbZSsEl9FbDZP6jRIcK0dNYPS5P
         kv1w9tLbPQP1SkyHkvH28j4Z+oJfBmtCZ+sAeVsN0mkX1z27XpEefrgW8TuKvL4KIooS
         uR548K/V47H8YrONG+UOqt8uP+F6R/b8J4Om/bat+w3IsB//DjX5DdJkxzC0mdSSVMNI
         Q87A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d37ab4bsi849503185a.721.2024.10.28.09.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2024 09:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5SWz-000419-1J; Mon, 28 Oct 2024 12:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1t5SWu-00040N-6R
 for qemu-devel@nongnu.org; Mon, 28 Oct 2024 12:23:44 -0400
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jlu@pengutronix.de>)
 id 1t5SWs-0007U9-6p
 for qemu-devel@nongnu.org; Mon, 28 Oct 2024 12:23:43 -0400
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <jlu@pengutronix.de>)
 id 1t5SWa-0007ML-0S; Mon, 28 Oct 2024 17:23:24 +0100
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1t5SWY-000t4Z-2z;
 Mon, 28 Oct 2024 17:23:22 +0100
Received: from jlu by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <jlu@pengutronix.de>) id 1t5SWY-00921s-2h;
 Mon, 28 Oct 2024 17:23:22 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Jan Luebbe <jlu@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-block@nongnu.org
Subject: [PATCH] hw/sd/sdcard: Fix calculation of size when using eMMC boot
 partitions
Date: Mon, 28 Oct 2024 17:23:08 +0100
Message-Id: <20241028162308.2152712-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1bce4c22-9281-44c5-8acb-860881dc271c@kaod.org>
References: <1bce4c22-9281-44c5-8acb-860881dc271c@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: qemu-devel@nongnu.org
Received-SPF: pass client-ip=2a0a:edc0:2:b01:1d::104;
 envelope-from=jlu@pengutronix.de; helo=metis.whiteo.stw.pengutronix.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7598lK6QwVW9

The sd_bootpart_offset() function calculates the *runtime* offset which
changes as the guest switches between accessing the main user data area
and the boot partitions by writing to the EXT_CSD_PART_CONFIG_ACC_MASK
bits, so it shouldn't be used to calculate the main user data area size.

Instead, subtract the boot_part_size directly (twice, as there are two
identical boot partitions defined by the eMMC spec).

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 hw/sd/sd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 2d3467c3d956..8430d5ae361c 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -826,7 +826,9 @@ static void sd_reset(DeviceState *dev)
         sect = 0;
     }
     size = sect << HWBLOCK_SHIFT;
-    size -= sd_bootpart_offset(sd);
+    if (sd_is_emmc(sd)) {
+        size -= sd->boot_part_size * 2;
+    }
 
     sect = sd_addr_to_wpnum(size) + 1;
 
-- 
2.39.5

