Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5185846gdb;
        Wed, 14 Sep 2022 05:37:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5TX2HQFGIMdbrgX9PGDguzshE3kbn2/CJFMr1sQG9a6WfKWWnrhWb7edjAYmLEkXM+Zjjn
X-Received: by 2002:a05:6214:cc5:b0:49d:af6b:5363 with SMTP id 5-20020a0562140cc500b0049daf6b5363mr31764703qvx.33.1663159043427;
        Wed, 14 Sep 2022 05:37:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663159043; cv=none;
        d=google.com; s=arc-20160816;
        b=J4tMHQW/NZJix21q0a/ZcODhFMl+GFsp6zQfH51QPQVOgoIRNpbDuh9Nb4ZZNZBNIc
         yelWLFh6HkNnEyFVcpKK9eCcdns9Z7Mt3hRh9O6o4yEVdLDJFaE8uspyG711AeDVsLLK
         2fqIvau9/DC9RCGD3LCM2X1dtPOkOSrkpsZW6dYdAfqbCaVcFtpSXYs/DH21+9X1oKkZ
         S2CuP6Qcl2gUg04+tHwraf4bmgqDuPfpgLAHLv5GO8gbvjLgag2XhAivA0gV+sH6Zn3a
         62IagHfs0tdeh8Kw/NW+gEhyRCxU7ncftZORide7KZWNCTXSpl6ZdM8M50BxPcynsa+b
         BXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HI8nneT2Aq4atpT5V+FHF2miYHGHQUWxdQQ3h2wAeFs=;
        b=HbiyefUi9OvWr7pqoUyvl6SWiwNtsktUZ0OwfEmtDTXhAq7AHllG/HaMr4wUaadZTr
         L7z5GAmcf7aUZlqyLnWJuiKHEr2wl2sn3aUeYf0pYmnb2oBzz6m40GHm8AxyG27MTAtv
         hyDcVFggXoUAtRcSHpZ6uuUiCv+Qxmd36xedUbU/qeFiGwyUU4NeF9pwI+9uTjdKPS9i
         FiStnAA9EvEtSILX7SEkF5OlcjJA7CIIki90Tev6cVUFpwygqhECYeE9QFMr67ZMNdMB
         3W45U14Ka9Q1TCERzjaKoVyVKB8TmY+c+mT6yH2Nw/tqfcTIbuJ1Ui32LRzwUody+qWl
         XZ6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Af2/W7jW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020a0562140c4b00b004ac851deae8si1227779qvj.119.2022.09.14.05.37.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:37:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Af2/W7jW";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRdr-0001Ae-0n
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwY-0000Pc-Ko
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:38 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwP-00004w-Nw
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:52:38 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so2144971wmr.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 04:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HI8nneT2Aq4atpT5V+FHF2miYHGHQUWxdQQ3h2wAeFs=;
 b=Af2/W7jW7WB6cg2hmvALNxdXMBaVoqzYNts1ph+D8bEOYOWWPNAEXkpmL4s4/2Mwzk
 fNdufX7GatvsDg8owHsxcbH4fnN7lWUBEHSzB6138xM7FqSH1KyVJtIp/FvEjqabRZs6
 sikNKpABQs+Qib4IDdL8hhmIsHF0ZWZ19AmsMqhwfAPHoA7edJOxvbCIHX3uE8fupSIJ
 WaqPenW2GxnSDmlZony3QvuB/cgTiKisB0kKfkaNhndsS24tvuh/b1xxy+6ndEVfDgq4
 cPHjPuSWd5jK5xSoMd/iUAYTTRqdKO8Z1s6x20j0ckyd7yBkwCHegbE0KY5wt3Sbdwm+
 uGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HI8nneT2Aq4atpT5V+FHF2miYHGHQUWxdQQ3h2wAeFs=;
 b=dS+8tjhvt9U87MihTjULnxHgYs/cbgrU/4Yv+nBgNGL1sCUau9lv32ue5jhN4L3a44
 Sh+6rtuS0FFuEKbWIHD5qUDXmFzft+HIpq30xHajAPaaS6pp3ipxiDuAEyzDvmV3u55A
 RyhUPOqtcN2iqh0Za09AqUVS29ctB958KtAOvapPS59OK02pa98/b62h8s2rdcN+At1D
 KJVzCw43+AtyAJ5Al7VaLgbso4MIS9fwi0i34IFKNZfi3ickCwyJR/2+BOhOh79BYbyd
 u3Qr10SG3nmW4o1LESUd6mial0fS5I3vO948le9fJAJll3gDQbcva1t/dnxisZW3JG1K
 DIaA==
X-Gm-Message-State: ACgBeo07iwVZoLsYtCTOdX0ctJ8i0j/s6yckhA7PO1EMrKnLZCvZoqLA
 oyOP2wI1E9hbj8vIM3bxot9X2PTESGTJXOvs
X-Received: by 2002:a05:600c:154b:b0:3a6:1863:acc0 with SMTP id
 f11-20020a05600c154b00b003a61863acc0mr2886837wmg.29.1663156348401; 
 Wed, 14 Sep 2022 04:52:28 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/20] target/arm: Correct value returned by pmu_counter_mask()
Date: Wed, 14 Sep 2022 12:52:07 +0100
Message-Id: <20220914115217.117532-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EYwYkekIC4VX

From: Peter Maydell <peter.maydell@linaro.org>

pmu_counter_mask() accidentally returns a value with bits [63:32]
set, because the expression it returns is evaluated as a signed value
that gets sign-extended to 64 bits.  Force the whole expression to be
evaluated with 64-bit arithmetic with ULL suffixes.

The main effect of this bug was that a guest could write to the bits
in the high half of registers like PMCNTENSET_EL0 that are supposed
to be RES0.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-3-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b8fefdff67..83526166de 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1296,7 +1296,7 @@ static inline uint32_t pmu_num_counters(CPUARMState *env)
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
 static inline uint64_t pmu_counter_mask(CPUARMState *env)
 {
-  return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
+  return (1ULL << 31) | ((1ULL << pmu_num_counters(env)) - 1);
 }
 
 #ifdef TARGET_AARCH64
-- 
2.34.1

