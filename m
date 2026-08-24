Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FEBC5DF9C
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 10:29:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyRuw-00038j-6s; Mon, 24 Aug 2026 06:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyRuc-00033r-B2
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:28:18 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wyRuY-0001pz-Te
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 06:28:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so1425356f8f.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787567292; x=1788172092; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=aqKROqzH1WTtSlOfECpDIdu6BBJpY3xxMUxQ+mbxfpw=;
 b=p1hwnrPuDW0qP7DGJ8BZ53l+ip/AvgD7HLRvtgpFmYV5HQfQ01f5DpUdqBDaCEcGZu
 ZmSMo88R5iair6A1Rj/ttwYaZ78mR40Unz4KDy8MZP7c4dEx2AelFtCzCfvSfPyHlLEP
 pkP2Zah28zIA/jmQQDdjteutsQROTL7dB6apGL0Y/ImwbR6yzPGQF9h62bZMOabgEEtS
 GMI8WIh1QkAD/2CExi6aqp8nZdhQG2L0baZ5BsT1hAdVFgyC+znhW0KNaxMttQpz+In2
 +8Zc3LRcMJlX78xpSDykBReP3QxF3zsBWrvvyorMJrN0Oj1KjHf317ZVsaZrbRkmBsJX
 Nk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787567292; x=1788172092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=aqKROqzH1WTtSlOfECpDIdu6BBJpY3xxMUxQ+mbxfpw=;
 b=KKcfN1my2rXwKT26oytHAyg/K7V30/vxM1tInbsu/lUaO5wfqB0CJXikmJj039jMmh
 xDTjG7RRdL/Jx24GlZAnlb5KNEPkL36Gov5LMAQCrWo8rc4VkjJl2Eor/63VAk6JfMwE
 9w6sULvoXjAhGyFczIq7CwM9CSa1zwZ/jhNSC5tmCgxIQxkkfGMFwcEISqR88qC3WYEg
 mW/FH/tToNgjNfMaxjDGgH2As1o05dvlawd/ww/A/Dz6G85EDGcUIkW+JAaKEs6Xfsbr
 7V4TMlsbIAfa52klgsmLAJtYDYNIE6UAPsxfd4DwbDVC5x7xm0fvwNKaB+1tKnrjVP+z
 ap/w==
X-Gm-Message-State: AFuF++nW5HKSqRUzPUKdOXnmGNMZfAbPwKMokEy/Qs1vR/MeFAYrVcqH
 bS+tnwAhQeIx8YJTnS/E1ehlWWrHgpq+C444kTzcWD8wi4Y0XOd1p2qSWkBiKTocq4DQ9pBHktr
 NisMNPLo=
X-Gm-Gg: AR+sD11ZMrLXwYn91g1h0g0cNlGi+N94RUEVctqJJZI3X6fFyES9eYnfP3vHT2tfTTf
 Um9lWkOZoV28mmCPJGpleF3ZXEmb6+dU+T5mOweq4Ti6cEgaPD1s+Oy5rT2dqNFYjdUbZTWzsKV
 tmCA/8k8XUEjYkOd4m+5I/5CJv6dJ9ycYKc5lb2NFSYe02nt9Dms/lqPiMmeJ3I2aSEyXfwx8Px
 3nMSKlIPbKpRAnF5v27AEWRnGcTygRZRteLmtc6aPwgSiQNLehI/48gkEkiR6ZPwbCeqgbKvQyx
 01yTcozKz9xN/GEiW9sTQHWgrImEYB8tiEE0hxhy6etduGs6gKgsyAWBwT2eGxI+87J8jKXcNsz
 1SetuEV925U5Qx/e4qgF4CfbG1fOShpqGHmeWZqrk6hsseQjrCSknpvqyGyHhRsvMSyPUsrX1ef
 zSkuw3IHU7e81Xp60JM8i9HLYFFldY9yk3swOcKwpVIlTncc6apuS+jP0lAHra0KJnHkhIOnMp7
 i9bNJdS5DeUqNQ4R09eEuPvuWUwPacJdCk44rRnLdZKVZxVFIKc1rK9LeFoqqJkSXMfyg==
X-Received: by 2002:a05:600c:1548:b0:499:841c:2016 with SMTP id
 5b1f17b1804b1-499b8273456mr303455385e9.0.1787567291654; 
 Mon, 24 Aug 2026 03:28:11 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499c355e6d1sm77730095e9.6.2026.08.24.03.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 03:28:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/intc/arm_gicv5: Regularize spacing in config_readl()
 switch
Date: Mon, 24 Aug 2026 11:28:02 +0100
Message-ID: <20260824102805.639072-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824102805.639072-1-peter.maydell@linaro.org>
References: <20260824102805.639072-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In this file we don't put blank lines between cases in switches,
except that for the switch in config_readl() we've written it half
with blank lines and half without.  Delete the blank lines to make it
consistent with itself and the rest of the file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I figured probably better to do this before adding a bunch
more cases to the switch, which virt support will do.
---
 hw/intc/arm_gicv5.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index 20680a5c225..7480c12413b 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -1468,53 +1468,41 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             v &= ~R_IRS_IDR0_VIRT_ONE_N_MASK;
         }
         return true;
-
     case A_IRS_IDR1:
         *data = cs->irs_idr1;
         return true;
-
     case A_IRS_IDR2:
         *data = cs->irs_idr2;
         return true;
-
     case A_IRS_IDR3:
         /* In EL3 IDR0.VIRT is 0 so this is RES0 */
         *data = domain == GICV5_ID_EL3 ? 0 : cs->irs_idr3;
         return true;
-
     case A_IRS_IDR4:
         /* In EL3 IDR0.VIRT is 0 so this is RES0 */
         *data = domain == GICV5_ID_EL3 ? 0 : cs->irs_idr4;
         return true;
-
     case A_IRS_IDR5:
         *data = cs->irs_idr5;
         return true;
-
     case A_IRS_IDR6:
         *data = cs->irs_idr6;
         return true;
-
     case A_IRS_IDR7:
         *data = cs->irs_idr7;
         return true;
-
     case A_IRS_IIDR:
         *data = cs->irs_iidr;
         return true;
-
     case A_IRS_AIDR:
         *data = cs->irs_aidr;
         return true;
-
     case A_IRS_IST_BASER:
         *data = extract64(cs->irs_ist_baser[domain], 0, 32);
         return true;
-
     case A_IRS_IST_BASER + 4:
         *data = extract64(cs->irs_ist_baser[domain], 32, 32);
         return true;
-
     case A_IRS_IST_STATUSR:
         /*
          * For QEMU writes to IRS_IST_BASER and IRS_MAP_L2_ISTR take effect
@@ -1522,11 +1510,9 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
          */
         *data = R_IRS_IST_STATUSR_IDLE_MASK;
         return true;
-
     case A_IRS_IST_CFGR:
         *data = cs->irs_ist_cfgr[domain];
         return true;
-
     case A_IRS_SPI_STATUSR:
         /*
          * QEMU writes to IRS_SPI_{CFGR,DOMAINR,SELR,VMR} take effect
@@ -1537,7 +1523,6 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
         v = FIELD_DP32(v, IRS_SPI_STATUSR, IDLE, 1);
         *data = v;
         return true;
-
     case A_IRS_SPI_CFGR:
     {
         GICv5SPIState *spi = spi_for_selr(cs, domain);
-- 
2.43.0


