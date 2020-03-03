Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp640634lfi;
        Tue, 3 Mar 2020 09:50:10 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtrWkYDhQ96credjtNm62oNMIttowa1LPtqwIzwmTwwEEtmB2nTa38Mogc+7U9BDpbup6Wf
X-Received: by 2002:ac8:3893:: with SMTP id f19mr5486640qtc.46.1583257809925;
        Tue, 03 Mar 2020 09:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583257809; cv=none;
        d=google.com; s=arc-20160816;
        b=AeHdzdwh8IE4UOO1HR2oIid6hzPniByBv2ZcEVNNTFde4hbmIqzC3j2ctYkBp0gFsa
         OxoihfM4N3I4Tz2BTpxZpUnfUnWprP5X8HADqWZNA42J41RCTFfBngJbW95uGmFy9hme
         IP/xHdweqTfiSh1XOjEouwW764BQGoxbgYcy5SNZbMFP4rZoIJA2hltA6DMVVgX5DzxD
         JPn+MeUqbt1rajowfFw4tVotPV382cCaWZ8Uqthlxr9du/PWZkhrkNFHa0Yug25dwm9Y
         +gwvJwPLPXhMGpSwjjBBhMcCZYnEQjGtVHR6ez4kPJCzVhJkC9SQ1H1fJTIJ0Ot305JW
         pOww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WjgOJgBdYSXtQmeNwF9DoqEimVF3dYdv8tsIBaWzzNA=;
        b=bQXcxSnVwFCXee4pa7bXPvTFQWdnXtvlbh/nswHa2S7B0Ox84a7z2KMFFlYt+qClaC
         DoHD/ZTgyyRwwd5d5wZCVz03CXZw20VFkH5nk5LM67ZmdbuI2KBN1Ti2HchufS9wdnJg
         PUpqpp7xXZUtBsFOXq9/X/Z9Nex4wXWi+CQMQ6kDCsZ0iy3flW1y8Qx30aV8WK030jiG
         c4noWmAcMW3yexAWkv66lBwR6qcmD4rxBHABu2lITEVRAU1um5wmmqkcqKjmP4HA0H1K
         KRNQcmvWNV+27WDRNAHcJ7dPq3TBMtJs9qb+6J/T2zSXG8sqpwmcislrKL/F3j1h2UBj
         vKew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFrEHhWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d127si8293672qkg.226.2020.03.03.09.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Mar 2020 09:50:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFrEHhWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9BgH-0007cW-BA
	for alex.bennee@linaro.org; Tue, 03 Mar 2020 12:50:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41171)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg7-0007YE-35
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:50:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9Bg6-0006LS-3X
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:59 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36793)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9Bg5-0006L0-UA
 for qemu-arm@nongnu.org; Tue, 03 Mar 2020 12:49:58 -0500
Received: by mail-wm1-x341.google.com with SMTP id g83so3811076wme.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2020 09:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WjgOJgBdYSXtQmeNwF9DoqEimVF3dYdv8tsIBaWzzNA=;
 b=zFrEHhWJBoRbD4SyQnI007OXIaxcomKTDOAW99kVGSTurKjqjxiDvRLAEXusDS8zhd
 YOEt9wkyxlWDz+ovbqi914IssmmEHx+x2CSjt8CHhSacHeqTST22rMBwDe57/pjIDGc+
 /7w9sAOkTEQiY2j+YjxASst0rW5uhLntesWgjPb4Yqrny/142hFAzu+tPYXOlYt8YU5n
 Bro93hyC3FQoktYTPKHeI9xxAWkVfAAq7ddm1Mz671OvjxPreHx9dtaYQ0ESGFJ38UkM
 +pqj9Tag4e2M0O6JSlNrnOrtXu9kZcG8605AReiHV1WDEOQE9S0Tyck67A4v5gxQtE0d
 UFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WjgOJgBdYSXtQmeNwF9DoqEimVF3dYdv8tsIBaWzzNA=;
 b=TgitIFdxh18udH5UcwCfv6HuMZkZ8hw8yovyHiodnTIHZ/OUS6zovP/Ryo1W2/YCVN
 zGt7SCdwqgsDfMnLmQhUH6Htrns6pKZAYOmeBrzKy2rjf/vIMt+lWO/oDdiIGwmEoGYI
 vkmfV7EP2xW09nPbABTJNir01iqdJeFodEFPNISBJ1rI/xUgrg+r4smhlYiuJ4AcXyRL
 a5MJpA5m1FE06Ty+r5Va02cqIdDqFZRlqTuGxNMHkUllmcGv/BHg1dHiJan0nz1Wy5xL
 ZJXL9Y0WgPnoMFWKcrNnw7TQ0fT5b/rs1eHyeF3bHFyfUEx+8PZNSNM5q6Ax7cJLK+sc
 Oi8A==
X-Gm-Message-State: ANhLgQ02Xloiuco5CgtXg0xRXaBdQOG1BEZJpxgfw4B+9O75ODscIr4V
 rcdMKajo6nseR85b0UwruAvwTVcS5OkYIw==
X-Received: by 2002:a1c:1bd6:: with SMTP id b205mr5307915wmb.186.1583257796764; 
 Tue, 03 Mar 2020 09:49:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d63sm4867576wmd.44.2020.03.03.09.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 09:49:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Fix some comment typos
Date: Tue,  3 Mar 2020 17:49:50 +0000
Message-Id: <20200303174950.3298-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200303174950.3298-1-peter.maydell@linaro.org>
References: <20200303174950.3298-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /sgEzIia439w

Fix a couple of comment typos.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Noticed these while writing the other patches...
---
 target/arm/helper.c    | 2 +-
 target/arm/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2eec812b80b..3fa9c0cc861 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12347,7 +12347,7 @@ void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
 
 /*
  * If we have triggered a EL state change we can't rely on the
- * translator having passed it too us, we need to recompute.
+ * translator having passed it to us, we need to recompute.
  */
 void HELPER(rebuild_hflags_a32_newel)(CPUARMState *env)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4715ca0d2ad..9f9f4e19e04 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7296,7 +7296,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
 
         if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
             /*
-             * A write to any coprocessor regiser that ends a TB
+             * A write to any coprocessor register that ends a TB
              * must rebuild the hflags for the next TB.
              */
             TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
-- 
2.20.1

