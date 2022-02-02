Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1231285lfk;
        Wed, 2 Feb 2022 08:15:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUXUgHAmwdPvUCra26B3g5G2v9g5mjhm9DsLHfnQUDpk4Q+ul70wsy2HSBtFrxVIUA6sM4
X-Received: by 2002:a25:234f:: with SMTP id j76mr40398393ybj.338.1643818551723;
        Wed, 02 Feb 2022 08:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643818551; cv=none;
        d=google.com; s=arc-20160816;
        b=pUyV1+dp6jC2yOypZcXlRqc+6LGBHGFPh3eSfQ9zmLfDTMWLtdaaJJFj0CditRr7bB
         ZxBDX7P7ZocG/uOlE5C5jonbYutVkYGu7WU3fNndurXcgi03L4sJQNbKlqmLiE/W11LX
         ztRem9yL84z7ZQlJHtiw4q4pVYIsX4yyb5jwN1bQxMFJNXVSL4HbDQUFJjPlmrIu86bw
         u8MkJuCcQ8MMAul+eIIYn4zn4fMsPE/Mpc0Tg0LDhrrxGK43sRG2PI9jKe8snR9srnnq
         Rm/2Z+3NQM29atVgZM76cz+hSN9abe684i1rV55iwOlNbzIoe1wTIOOIxigSSSiEssvz
         ddaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=5R63wW0wINKNcTBXuI9ixers15a2a72LEpYe6L/uNbU=;
        b=Gyk+KOH1vR4RkoLRt31dq6BRHnrzg7oFd5osWSNCAYNhCEgatRXj0sbFoSMi9/vht9
         tabpARnGQMVlDosU3w5IRfNrw+PdliQwsinii+EJ5OZBIX9liCuBHFfDNs1QHvW/wvKd
         fTJFiQhsIgarAZSA9VSacQvwpBuLyyYOOqbhGExhpuRcvmyDzd2UZ3nqcZzze+e3yuSA
         HPM840VKYtpJ+BuymyrClbQJEcfByukXzAnvpKWzA2VgAoYLiwQBDGJn9IH5FvDtzM5O
         JekRwtey9D7um2EoMLzCksLzxJ5ikE2PnLYdnIppvBqd5Xyxt9QgQzKWk0xiQyBXZCC3
         U6+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m8HSujcc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h129si10910227ybg.174.2022.02.02.08.15.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Feb 2022 08:15:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m8HSujcc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nFIIQ-0005Rc-I2
	for alex.bennee@linaro.org; Wed, 02 Feb 2022 11:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nFHTl-0004Ry-CX
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:23:29 -0500
Received: from [2607:f8b0:4864:20::22f] (port=37808
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jimmy.brisson@linaro.org>)
 id 1nFHTj-0003tm-Kv
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:23:28 -0500
Received: by mail-oi1-x22f.google.com with SMTP id r27so18114435oiw.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 07:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5R63wW0wINKNcTBXuI9ixers15a2a72LEpYe6L/uNbU=;
 b=m8HSujccROQm3mxSeqQQL8GFPKZOEUM9g602j+R7MIjNolUE6Gxwbj4dY4VY+kywfr
 uBmphzxQKpifa38IPLY8Q3HeDlfTXxQBieyomoasiLU0/aLjeOkqI83dV6tqYedPY9OO
 fe/+SanXJcHGIlCohXPnrCHibyfMiUbJ+u1yGYz/ucpsDfSzrf9nAc2A/0G5TKxY049F
 JzHQ3VQbeKDhlXdoBRGQJDHkN+glYsJWJkwCcg0le7Tg5jJLmmFitrdAD09dNYLkj4bZ
 GQdlc5HtsQCGcY4t2HtKooaINIjjiBog/c/GqpdNAoNeaepWPHFp9504v5CbsIUlyXZY
 4OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5R63wW0wINKNcTBXuI9ixers15a2a72LEpYe6L/uNbU=;
 b=hHpUb7IhKuRf4HpOsd66HdhhqGG9ByDDdG5fZIYdozGq3x3DvRt9rliu9xePzEBm3n
 dZqBhDp83W0PNK5mTWST9J/zr8mXvx190ECxvMreuz5xrnEU9mAa52OT18hWbPThCKui
 6dauKiQc1ZH93AID3bv14Yp17B2O2RScfSjWigQtjaNU/8UBgnu5JE967HUchnY/EpxN
 B3x3bKF+co2n2Z3uTTKcm3TuyJWs8zrMY2IUmqatvQD/Y4BGIvyBungIxRR7usN8DWfT
 VRJcMTqs3YcCtwPxuBubwYH9nrap/dn0N/bPd31eOdpEcEiKbvXsfCPsTgdpSGYM2TRr
 SUaA==
X-Gm-Message-State: AOAM530UYkuF981wEAw1AXC12C+rSCMF3eQEEhCSmag56b4/x75Tc1fG
 gUylnWE5aSGcNy6NN56yIOlNnQ==
X-Received: by 2002:a05:6808:189b:: with SMTP id
 bi27mr4671294oib.211.1643815406099; 
 Wed, 02 Feb 2022 07:23:26 -0800 (PST)
Received: from localhost.localdomain (24-155-109-70.dyn.grandenetworks.net.
 [24.155.109.70])
 by smtp.googlemail.com with ESMTPSA id q11sm9655814oti.3.2022.02.02.07.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 07:23:25 -0800 (PST)
From: Jimmy Brisson <jimmy.brisson@linaro.org>
To: 
Subject: [PATCH v1] an547: Correct typo that swaps ahb and apb peripherals
Date: Wed,  2 Feb 2022 09:23:23 -0600
Message-Id: <20220202152323.2529767-1-jimmy.brisson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=jimmy.brisson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eKbXOm9asweF

Turns out that this manifests in being unable to configure
the ethernet access permissions, as the IotKitPPC looks
these up by name.

With this fix, eth is configurable

Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
---
 hw/arm/mps2-tz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f40e854dec..3c6456762a 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1030,7 +1030,7 @@ static void mps2tz_common_init(MachineState *machine)
     };
 
     const PPCInfo an547_ppcs[] = { {
-            .name = "apb_ppcexp0",
+            .name = "ahb_ppcexp0",
             .ports = {
                 { "ssram-mpc", make_mpc, &mms->mpc[0], 0x57000000, 0x1000 },
                 { "qspi-mpc", make_mpc, &mms->mpc[1], 0x57001000, 0x1000 },
@@ -1072,7 +1072,7 @@ static void mps2tz_common_init(MachineState *machine)
                 { "rtc", make_rtc, &mms->rtc, 0x4930b000, 0x1000 },
             },
         }, {
-            .name = "ahb_ppcexp0",
+            .name = "apb_ppcexp0",
             .ports = {
                 { "gpio0", make_unimp_dev, &mms->gpio[0], 0x41100000, 0x1000 },
                 { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
-- 
2.33.1

