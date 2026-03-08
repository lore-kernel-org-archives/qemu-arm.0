Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54FCEA8546
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 20:35:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzKqZ-0007FC-Vs; Sun, 08 Mar 2026 16:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqY-0007Da-GU
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:30 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqW-00044O-UJ
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:30 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439af7d77f0so6901371f8f.0
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002127; x=1773606927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBkN0OXRGFMvrV2S5QZAiH2Wv1UWYT7/qi+m9sCjHKk=;
 b=CNcGv54lNxDSE3yue3N8ztXgTI5tmdLJLt8CbOQcipY8ChC4K4G9XnVz6qVLAFxZ5T
 FAJw7eziMcQ8Q1PQkebRtEEfj50pEtTnnhmKhX5FWxVPd+NEMvXRXMOpfnjkX6BtihwD
 NKT1n/vjaOiZCApN7OwfN+6Qd40nTGWVImXYUJaPMcWWPP8FARljh5L3mP4MUPAyy4rs
 MwHL3LXigJ3RV5jUaNp3KdGZd++RgJz4L++r9TA2fLVvfupJg0FQZDUpiH/JxC4EUhRD
 qSodm+FnnaWh2zr/FFmO43G9tf6uEVjYuBqoEClT0RmsqDQWTLxPqWiadTn47mWpJTXM
 0ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002127; x=1773606927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TBkN0OXRGFMvrV2S5QZAiH2Wv1UWYT7/qi+m9sCjHKk=;
 b=mgfCAeRf3UrFAb70aa0vo+TM61DNx9PLO9Qw9lGesGI8Ra0jjhM00z+hiU1cGi69Bw
 awiEQDHXraFLWJaLWOeRExkOgH57sy77qr556OHXpZhpsfOIh1hiD0SkddNlGZuF3+cS
 gs5Fm9RuqQqGr+U9FUon+HKaFDOxNm9MATuU/ppYfyN7liH26S5Mi/FpY8uz1CHfrWJV
 L/U5jSAcvKD1EBx5ITApwFnk/bOEJ4t7DRX8N+go1i/xZGQOm/vLXL4m8SbeLZvZ+NLF
 0xqHx6jdfmbOt9/oJzdQPLvi+9xld5WFsdo1xw0sZ/bVFtxahGt/7pvsUctU0hGYWHW/
 Dbtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM4Ib5Gw2eg3oa79cdJxHjRPPg52KIZl1F/Jh6LFEV3fhCtlFqMhGOjFtpc3L+62CxfI0awjP4Lw==@nongnu.org
X-Gm-Message-State: AOJu0YxnHYiXv9ZBuHBqtvLCJX8XjZVBu6oCpZ7uK9UHEwI9EM8t2zxt
 APbTb4829gaLsQbc6/thePsvzhTedLydHA+kOL8X26AAwMcRM1DUdRO0
X-Gm-Gg: ATEYQzxcHoRDnJW1iyI2DStVhyFW6Z4aOhkvDLwbcLyEx+mohSwHQb3bUVyQXruJ/+m
 y2REAZueIy3eF4hmo94vab+I2/QfX3qnDlrbG3w5hjAXUODF0yoQbt1ZwOfEaZPfi6c7aMTufTt
 z/TFmcbUQpXi2WmPZquVXAKmZst0JVfU2o4zY2WzaEH3ZY7LMztM1ztfVI9nDy/JNMrxi1ifEVg
 XN9gnyHDJuxaZY74ndsAwvj+/7mQEH5nhQ2AKs+WujUbdzIfODef1luYvIaReTI4NR62m2gkuHS
 WwQ4seFSEJriP4Ckz70vvhEEOBP0Km3URZ8wiW0c+UskTSlpUvIz2OL4EVPvbLx2cANRatBbXcz
 xSGrMj1uj0rjbNPuCMT0OEQ+qo4w9xaF1UpYiN9lnOa5Y4APJhiEzzTCisKSsxuM3SpLXiDs5af
 jXkysXzy540b2Os8ofFBN9HwTj3BGtISmDOiCdweWXZoaNVciCGyQp4BvLZF0sQz3+egMIjRi7L
 J8viqXjIjQKVyjlm3kNhNGhBgh23exd/QFpnjfljw==
X-Received: by 2002:a5d:5d06:0:b0:439:b886:20d3 with SMTP id
 ffacd0b85a97d-439da35f64dmr16113282f8f.15.1773002127220; 
 Sun, 08 Mar 2026 13:35:27 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 2/5] hw/arm/fsl-imx8mp: Fix parent of ocram memory region
Date: Sun,  8 Mar 2026 21:35:13 +0100
Message-ID: <20260308203516.160103-3-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Rather than having a NULL parent, let the containing SoC object be the
parent. This cleans up the QOM composition tree a bit.

Fixes: 1aaf3478684f ("hw/arm/fsl-imx8mp: Add on-chip RAM")
cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/fsl-imx8mp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx8mp.c b/hw/arm/fsl-imx8mp.c
index 0119a18416..839c925e4a 100644
--- a/hw/arm/fsl-imx8mp.c
+++ b/hw/arm/fsl-imx8mp.c
@@ -671,7 +671,7 @@ static void fsl_imx8mp_realize(DeviceState *dev, Error **errp)
                     fsl_imx8mp_memmap[FSL_IMX8MP_PCIE_PHY1].addr);
 
     /* On-Chip RAM */
-    if (!memory_region_init_ram(&s->ocram, NULL, "imx8mp.ocram",
+    if (!memory_region_init_ram(&s->ocram, OBJECT(dev), "imx8mp.ocram",
                                 fsl_imx8mp_memmap[FSL_IMX8MP_OCRAM].size,
                                 errp)) {
         return;
-- 
2.53.0


