Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26588E9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 11:03:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt1no-0003zF-QB; Thu, 19 Feb 2026 06:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt1nm-0003yZ-KT
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 06:02:34 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt1nk-0004di-H5
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 06:02:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-436263e31abso759690f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 03:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771498950; x=1772103750; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Gy5U0HG/xNgrXivum+nhASnmAiunCrfWJbQ244sE4s=;
 b=vLCaklMa4wlU0365OhAF7i8lmjMwfx9YUmrz7qlir08zbuK2q8+9Z0tecx/cF+c1wY
 gAo18ySf/cCu4B7DohnoKwSh06ygyJbQHuqv0/fPI+Ky2P5n7DQ8ReXn6RevQGVr52oL
 pMKHSzVTSrPq2AaOef92loMwNcD3LwUlyfA/fRejrsFF+bxTeodM1pFNfz26DIGOKQBb
 VGjFZupkmwovRfuUecXPJ1BvRuHwA1lawwlfiDQXwZOCEy7qfsSTjYQ5/DFmu4akcLGc
 Bu9hvQDcb49Z06/ngWifb2cmrOfLe3jzgpamNvdsv03HbCV0u8WU882w2sINFgGg0gKv
 vD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771498950; x=1772103750;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Gy5U0HG/xNgrXivum+nhASnmAiunCrfWJbQ244sE4s=;
 b=jEC7Qn70aTa6ZoyzQvH2e8ANFURWKv9SogeQRmFsT/FTU5GLiYUjhuHVdE1gkRwT0C
 cWrmSNYYOWHrncEubn+HyAMuaB4aO4wwNHT27yky33dR/qw9d2NpPmcRWxLIejumOl7r
 0WUYMTLwL8AjKacHFhwiNPNwqBgS8dqq3UxhHurz1CJz4vpFFqd9MT15obAtmY4L7NL/
 /cT2498gB/aELktNTBTJdec5Hv9ND5wGIoKUyibnP6RGRyHwksmlY2l2D8dQFw1geN49
 tOZ9wMmRCnuXMx4ma3/b1UTPKeb8wVIIdK3nbDjHKWulV4vh1s6VpqqKmzymvI8JwQiV
 tLyw==
X-Gm-Message-State: AOJu0YxuKwh+FFn5IjImw+CedEElhnAl8/sZMKEVlKK30HtTxyatIx9y
 RBmXheTDMMjUtvhsaejCiIoZObK5ZmBgHYCFkFnn4DBfnQli7FTAfQbg5Ng3Zk5liROSRvYYRVj
 PlZbB
X-Gm-Gg: AZuq6aIx8PPSFwlejZCgXL1OSLN6HDdl8/ZpDxWvQzmUE0iSdLIyj2IKU/jhwH+SwCb
 rnOWM+Bf8D8/jxk4G4amLSfWgGHEpIn6qT4LWXTab3hcT9/SAh49OQEDGswfWVaLohz9OIarrUM
 dQjlfV+abDbhQ17XWEpb/LUM4qqXlVbr71z2WTVVtnP/Pc3owL3k5l6KocqymB2t23Kj6c5o01h
 xR+Omo7XZNMVanSL0WrNQRAi30LARYpt7lEWswbasiGiYyg/M6DoXqGYPThZaSAR9qnjwpHV89n
 WrHUJ7Fb5gIYJhqddE5aeaIu6vjxyTHxS9me7a+3DMlVB/Tp1oPaNRYDGCH2vG6PVlX/GK3KEPV
 c1MfUC1ca178EGSyVsZwAPFrRhPMfJdC/OrXhwEcdDVfStkNcbSzahMqy/yrybRrMA3n11CjfSF
 CAryY7zRORG9+nCG35x/3BYnVF7YdRUdhUCf56jK8QVDyfvw8y1Zoh/PdQcD3Ikl1n/Y6qoJN0n
 FrG2PCDBhyJg1jclQ+F6gB0HEusGA8=
X-Received: by 2002:a5d:5d11:0:b0:436:34c0:c9c8 with SMTP id
 ffacd0b85a97d-43797941daamr33860376f8f.60.1771498950020; 
 Thu, 19 Feb 2026 03:02:30 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc21dsm50997201f8f.20.2026.02.19.03.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 03:02:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/virt: Update error message for bad gic-version option
Date: Thu, 19 Feb 2026 11:02:28 +0000
Message-ID: <20260219110228.3804482-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

As we added different valid gic-version option settings,
we forgot to update the hint in the error message produced
when the user specifies an invalid value:

$ qemu-system-aarch64 -M virt,help | grep gic-version
  gic-version=<string>   - Set GIC version. Valid values are 2, 3, 4, host and max
$ qemu-system-aarch64 -M virt,gic-version=bang
qemu-system-aarch64: Invalid gic-version value
Valid values are 3, 2, host, max.

Update the error string to match the one we use in the help text
for the option.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 50865e8115..8dc999712c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2971,7 +2971,7 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
         vms->gic_version = VIRT_GIC_VERSION_MAX; /* Will probe later */
     } else {
         error_setg(errp, "Invalid gic-version value");
-        error_append_hint(errp, "Valid values are 3, 2, host, max.\n");
+        error_append_hint(errp, "Valid values are 2, 3, 4, host, and max.\n");
     }
 }
 
-- 
2.43.0


