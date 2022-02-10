Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1829218lfk;
        Thu, 10 Feb 2022 13:03:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8CLKnXyzsBDCbpOZ8S9JGC2+h+j3pmyc7zBTW+Em/hj99sykQGEcv3HzoV67o7EnL7+CO
X-Received: by 2002:a25:32cc:: with SMTP id y195mr9178834yby.235.1644526985733;
        Thu, 10 Feb 2022 13:03:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644526985; cv=none;
        d=google.com; s=arc-20160816;
        b=vMgE3BTflJkQU1Jprg0C5m2oLSm/L+BPSfk6IbyF1xhI/MpB3E6ollvscNXYHIkDHy
         iHbRiQE1f79lnXogZHedPp2sXfhAPsk0P25NRMHGz9znq3Ao6GCYA1IU/L2ZLF37fNq5
         sDyT5IgjRSu66TJkIfZ4J81Wj3f0ZAvhxnEh9HAEfNKM2KyhUZYCasd9Rl95bQCxBf9G
         vqRS/ywbktvRLnB1qGyqNQDmYf8lagKzwf4O4m+9UMO4MGnLxMeXZP2F8ByAxWFH6Kps
         ZAfa7mzFfdQAwyIQUDk1DGqC6T2t5+nallT0r/oCDZv4TPfxPlGHkdHWn54zIGEYI4m+
         HLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/HLq/gHeUXvoR0qXgOV5J7lPCXpIMXUke6vhLjSZEdA=;
        b=drNYaMn6eNBeoH0HwpdrXpqqp8HTHyNw4BXoMJRWkI67MNFp05AgLQEtv0QZn8kAuc
         oZyggmrVDu61n0eCGGhdyIJGYQ4OaNkE40Bp5KRuYeaPAZYi4zBB9V5p02C44VOFWlm5
         gZO5yfacif82nQ9bPwooz44jFyVdgkxxpvm7Cf5eLPM8VPoPfwFu1UtudfHp65dLUkIR
         81K8WKZHWHB3+hRvn/Qb9zM/m41Ov/MLzWz2BTIDGH2KQFedsDz4Dz4yNqd2Of93KFXV
         KSDQGJB5OM2tJwWbmNkK2t3dnOasmeI8/2oQBLhHq5rOfVPtUlKejGRY/QdDEZUEHhrp
         r8HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gNeRDJgI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si11589789ywu.7.2022.02.10.13.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Feb 2022 13:03:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gNeRDJgI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nIGan-0005sH-5I
	for alex.bennee@linaro.org; Thu, 10 Feb 2022 16:03:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIGaR-0005qY-4Z
 for qemu-arm@nongnu.org; Thu, 10 Feb 2022 16:02:43 -0500
Received: from [2607:f8b0:4864:20::231] (port=47071
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nIGaO-0003xd-0W
 for qemu-arm@nongnu.org; Thu, 10 Feb 2022 16:02:42 -0500
Received: by mail-oi1-x231.google.com with SMTP id y23so7327873oia.13
 for <qemu-arm@nongnu.org>; Thu, 10 Feb 2022 13:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/HLq/gHeUXvoR0qXgOV5J7lPCXpIMXUke6vhLjSZEdA=;
 b=gNeRDJgIw47tJ+MZ1k54Z/fb7FJlm42rlOe3y57olkx7R42T5zZcVrH/TogUVMyg/j
 uWU9cDyifyJTwoNywSo0ArzHzbOMTzuz2mvApLWryi0awk3CNjYVPHpQZUnjTTAhnlCu
 EzOJRtQpIZbooI5g2auh2QRaMqRzGqHmic6D7+uBE+UZToD3GccdlA62pu0tlmilWEPb
 sZ6wWVyTHHDOX2RtmBAay1dIJxpwCRdd3PHCnKl55RDv96Tm+FjeiTJ0YqOqgg9ViAel
 3vAXSZju5MiA5Ksxzd1qUe2pU0TBhSXPZZkZiLRhgZTiE4pSHKc7StogfZizLdd1SDV5
 37NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/HLq/gHeUXvoR0qXgOV5J7lPCXpIMXUke6vhLjSZEdA=;
 b=ATO77qmLMAtK+9ndi0wApf90mteWLrzKd/2dMlQbtWaO7WRRYM/EBlqNLLDhDEiWTY
 0ZUpcpZsxDdAbbmWOcrgoJtbxFYH0cEe4/tFghl1kFsn9GghYxickxevID1GFbsieCDI
 pedNcVkvqBXfV4/XW6+FgFZO2//TnpxAenNCAC2YpTHiLj0VIV9T0OZNVOh4QQkO4lTi
 gHygGYjU/TKL05kcYWH8C/Vkr/P9G0th5ID7AvHrejn0jGYi42GwIM9P2v2k4lJf78Ez
 HWiVJ7BtzpkJI8oM6dzJU0fVcohX/7wZffeVoKcQ496MzFKBT2A5SP5tqjscVUlIahXf
 Gpww==
X-Gm-Message-State: AOAM532H3pHxguXh84axg+5TfXORteD2qzUeFd4mSRj4jLzTESNmzXLI
 ETeixBGbYFA4Hh64IfJjlwKzhg==
X-Received: by 2002:a05:6808:168b:: with SMTP id
 bb11mr1840510oib.184.1644526957885; 
 Thu, 10 Feb 2022 13:02:37 -0800 (PST)
Received: from localhost.localdomain (24-155-109-70.dyn.grandenetworks.net.
 [24.155.109.70])
 by smtp.googlemail.com with ESMTPSA id b6sm8221642otl.0.2022.02.10.13.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:02:37 -0800 (PST)
From: Jimmy Brisson <jimmy.brisson@linaro.org>
To: 
Subject: [PATCH] mps3-an547: Add missing user ahb interfaces
Date: Thu, 10 Feb 2022 15:02:27 -0600
Message-Id: <20220210210227.3203883-1-jimmy.brisson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=jimmy.brisson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kBLD6aQKrYAd

With these interfaces missing, TFM would delegate peripherals 0, 1,
2, 3 and 8, and qemu would ignore the delegation of interface 8, as
it thought interface 4 was eth & USB.

This patch corrects this behavior and allows TFM to delegate the
eth & USB peripheral to NS mode.

Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
---
 hw/arm/mps2-tz.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f40e854dec..e287ad4d06 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1078,6 +1078,10 @@ static void mps2tz_common_init(MachineState *machine)
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
                 { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
                 { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
+                { /* port 4 USER AHB interface 0 */ },
+                { /* port 5 USER AHB interface 1 */ },
+                { /* port 6 USER AHB interface 2 */ },
+                { /* port 7 USER AHB interface 3 */ },
                 { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 49 } },
             },
         },
-- 
2.33.1

