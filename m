Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2711464lfg;
        Mon, 2 Mar 2020 09:59:01 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsGWhFii5+a439t1ogrG7M52WR2T1n8hg3/q1sZk+lJvyz2p8xuNtfF4H4lp9jOchhLGkGc
X-Received: by 2002:ac8:2618:: with SMTP id u24mr857034qtu.297.1583171941101;
        Mon, 02 Mar 2020 09:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583171941; cv=none;
        d=google.com; s=arc-20160816;
        b=i2wO8zMHIpchNx2ufPsbAog+CkapQnVpJo2/4MqZyM/v9C6urdRtuAIlsfULiGG+MI
         iBsEFmmld9wk94yFOPGeph2bXpeq6pGQa7wt6uJM3TvdYMku1yseMsA7uKT55DsDsQl+
         HNpyqPYKNUb/LDUcIiTmpefUdjgTPPdyakYKzF93ATQSNJvobPxXHRGBoapLGAwnA9yI
         eH0dlz/nEVrhER2HCSwO8r7dAgMmfnRemqskHNabfJCikzQawC2FGdENwzntTJkBnSC7
         5CriuQ4CJDytX6apyoGtNNHtBxHfAuqt3FYm98fietkzw9XcYTExOyVXwRZsPUOfmxOk
         LOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Xb4MZkBU7c3SsPvbbpOINi23WCHWKuPEyPWHI7rJrJg=;
        b=X9zoqbpKpSxsTFEsTZW0Fgb+hDPlndp1DIpxEJEiwEJ12/4v4mEfCFylynz1ZINei4
         dP1vVHlllV12f07OQ6NS8/IdZqf8TM2uhBJcLwgZMc+N7Ue79Z5+L/GZkyNap5c1+CAk
         U8eZ+DNNO4pJLGsQYuMfPMZhKnhgXxkLnn7Idhb3IjR7GBltUS4+hQgy+yfcBKWOwynY
         PZy7qUu0q5TCkU7ZNiABfSxI9rhWEJTb08mOrqYl2t2H+09crTnWt7hGGVZD+ZVs/Bfv
         WzO+fmcnLncESd3g8qeTcC587xoQ1eYgPP8p9Ui4jRQ171VSmvNBibU8xCtDUnnFCOtm
         pYQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzo2x0RU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si5912087qkh.213.2020.03.02.09.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 09:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzo2x0RU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pLI-00078C-Es
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 12:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39084)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKw-0006dD-HZ
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8pKv-0007ZK-A4
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:38 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:45258)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8pKv-0007Z1-4t
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 12:58:37 -0500
Received: by mail-pg1-x541.google.com with SMTP id m15so166754pgv.12
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 09:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xb4MZkBU7c3SsPvbbpOINi23WCHWKuPEyPWHI7rJrJg=;
 b=lzo2x0RUxzilhpgFVTN4QYmyqJjuqg1RBfGHJzW9ioWN2CpVjgwp/jz/psxx9r+m/2
 rdPP2kEKvlq2CfqxQAWsYlAZQUP4AE6HJYBS3dOSu1pfEDMhMQdITg/SjJG3TuuWQRYn
 fAun+xHZNpHxWDep7FcS8owD75Wn0VDVMau4w2c1nM+Lvw1xOI3NVMaiRKTk3lti1hJ5
 BaphvzV1T5ZuuYLC5wWPDWQhm8hvf2/pHshDIVIW6Qedcfhs2NB4wzgNFfgRc22T4kF5
 cyucm2PRyh8xygFz8amS86X7NP4+reSephwQs36H/X4zDMo4BFGwjpr2kSK/63PCHUDe
 TExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xb4MZkBU7c3SsPvbbpOINi23WCHWKuPEyPWHI7rJrJg=;
 b=TARojlVlDXhKZEcA9nrPXXMIb+7CpEhWrRpneDWMcKEDPICxdh6Xw0I8cXPq5NyX1O
 qCQacuZNkPfFh5HNgpiIcJj1E3tOAGyT8C45i5yeqq2Hj8rzglRfgScCY7rDrrZTmqNW
 T8Lqol74fqyRSXNX6AVZWfKDHg3E6FoNRM1YNWkA5PWbtEeyPFd2dxq/Z/RSHqwGC7x/
 W82NzXUMXpkFsbY64mTWl4XOLR+TxdkJ0L0iVFeSDdgGgibonfyVfWwi0WKWKpjHOBxm
 pZ7eZsWnskBu5VLvewatwn91dMZlXzfsCJ2JLwVp8G5ZO9S9F3VTjeSPCaCvSdBxtJl4
 jSFg==
X-Gm-Message-State: ANhLgQ3qNvxlMPic5Xg3RBXyXDYvvlOAzqSGkj6SSharGrG4UtNWzz5R
 U+1icOgMkoUAw12r3Bd88MR4Ig==
X-Received: by 2002:a63:d0b:: with SMTP id c11mr103192pgl.296.1583171916269;
 Mon, 02 Mar 2020 09:58:36 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id s18sm99510pjp.24.2020.03.02.09.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 09:58:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] target/arm: Apply TBI to ESR_ELx in
 helper_exception_return
Date: Mon,  2 Mar 2020 09:58:24 -0800
Message-Id: <20200302175829.2183-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302175829.2183-1-richard.henderson@linaro.org>
References: <20200302175829.2183-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9vM99N5LZIST

We missed this case within AArch64.ExceptionReturn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 509ae93069..123ce50e7a 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -1031,6 +1031,8 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
                       "AArch32 EL%d PC 0x%" PRIx32 "\n",
                       cur_el, new_el, env->regs[15]);
     } else {
+        int tbii;
+
         env->aarch64 = 1;
         spsr &= aarch64_pstate_valid_mask(&env_archcpu(env)->isar);
         pstate_write(env, spsr);
@@ -1038,8 +1040,27 @@ void HELPER(exception_return)(CPUARMState *env, uint64_t new_pc)
             env->pstate &= ~PSTATE_SS;
         }
         aarch64_restore_sp(env, new_el);
-        env->pc = new_pc;
         helper_rebuild_hflags_a64(env, new_el);
+
+        /*
+         * Apply TBI to the exception return address.  We had to delay this
+         * until after we selected the new EL, so that we could select the
+         * correct TBI+TBID bits.  This is made easier by waiting until after
+         * the hflags rebuild, since we can pull the composite TBII field
+         * from there.
+         */
+        tbii = FIELD_EX32(env->hflags, TBFLAG_A64, TBII);
+        if ((tbii >> extract64(new_pc, 55, 1)) & 1) {
+            /* TBI is enabled. */
+            int core_mmu_idx = cpu_mmu_index(env, false);
+            if (regime_has_2_ranges(core_to_aa64_mmu_idx(core_mmu_idx))) {
+                new_pc = sextract64(new_pc, 0, 56);
+            } else {
+                new_pc = extract64(new_pc, 0, 56);
+            }
+        }
+        env->pc = new_pc;
+
         qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
                       "AArch64 EL%d PC 0x%" PRIx64 "\n",
                       cur_el, new_el, env->pc);
-- 
2.20.1

