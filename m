Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D84C61DCB
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:27:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x052I-0002qv-MD; Fri, 28 Aug 2026 18:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x052G-0002pJ-Jt
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:56 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x052E-0002K1-Jz
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:56 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2d6e954afbdso10679945ad.2
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956008; x=1788560808; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B4qeYxozmzv5nUB9BT/DGHD7IZGaEHc1xEeHPC5DMdU=;
 b=hKvt7We/GA0BKaZdtANUDE3Qi4AsesQDoz8LXX8EkbmuOWYar7A3RwnfINgxKzLjqh
 ihwfo4WDlb9x0TQ2BTvNUCOQijwKgfatKS519ixr4KsseGuVZ7v72E3kpHmIsWE1jCWN
 KPGVgNrbl0SEFhz2S67uNF51uOa4AK7cBGqgkzBrv5gVTedR/rY2e7aYO8rjho8eMLe0
 k/y+gtcH6NsXQC6HW5JBYGHW0QqhOu/DPGe8dc174A8vr5vbnxfUJHZB7sq317nd6Ixt
 rS8WZUy6KGiIafuom3hBl8ET4eNiZOrDmlCjaZcFoAcq220l9yD2twTMUPEvjLIYy9v/
 RgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956008; x=1788560808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=B4qeYxozmzv5nUB9BT/DGHD7IZGaEHc1xEeHPC5DMdU=;
 b=KyDT03xVs11aBCim8N1KTJln9sFoBu49OEeYtozWdZQpKS++GytUrDbfYKaS0zRSN7
 px4+AC62AnaVc0Hm4vB/DKDq6jjqgXvmTiwssRmk/o9plRa+rClXmzGmVa6zaS0+5Tj5
 Yry577VGCvqvbfpuuBCqJzCzjY0wThNHoskLNxpc6IGb8wGYvF+qEeXy6KAkQKQklpUX
 BXA6YIPHGeCGxJ+tMjdva5GfFG7IJkPLszpm7AM3X/tWp+WRL+Rdmgd8HI+WzqJXVtG+
 dW+YauR2OkHh5YIkSk4b4g8O+bQ6oeXjWOt5reXG0vz2v2adt3MY85KsnAxinTMRRAKC
 9FHg==
X-Gm-Message-State: AFuF++mbXMNqRaOgt9Nt/atdWDhATgpqmz4WQTrJjaYsXkooBhBcCEsO
 sZhAtKp+vc5F9nArkotRnEaC9nkqgQypTVw5mG579h2SoGUe7OkwfPWptaz7hnOsrXQ=
X-Gm-Gg: AYBFou1YRgqz0Yl8gEjjb783GnqLGagncHFP16XHUSgRXpuDzHFj39pEuA+7VpyQNbZ
 jVO7H4C2PU6CD6Il0OCK28um9wVF8BDFWdG5TPLKRBNrtc4dTgAMxWuVib8VdBcvSF5M1f4H/Zq
 Ef0RBN8Ef08oaeJifDnFCBsFHS7AD7ALcTLTTOx9umZWT5CgVSpCcO42DHwlv2qsZrEd3EAg+Ru
 M+xWERP6DVYJMz3p0L3Md6tE7Nkm23RNPmvLu23PU1SBrLbh/u8keliW+1cHoxNHjMU/91H/jh8
 FBuhYteC5E28gndWPDUzcPKlPJNnDz+Gk04rN8UkZzs00rtMhkm8MVXzthHqBuzE+1nbzemTYxr
 k9lMc6jPtghEkBU/0AaKuh0hggj3EN0rkmuUmAHpZEJV95VB0M7zqnBCjLE/JxNrP1nwNNYU/OX
 IPjc9yYl0SKJjkRe6nZEEEbg1X81eHcVq+9WIqHEasuVLH9geTq5SJndVefIXJhGwMSsBPO7WFr
 r0y9uWBwj7Jm+DZ2ffu
X-Received: by 2002:a17:902:ce88:b0:2c9:c952:6e9 with SMTP id
 d9443c01a7336-2d74dca2281mr180565415ad.2.1787956008060; 
 Fri, 28 Aug 2026 15:26:48 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/13] target/arm: Widen cpsr_{read,
 write}_for_spsr_elx to uint64_t
Date: Fri, 28 Aug 2026 15:26:35 -0700
Message-ID: <20260828222639.1432046-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

We will shortly need to handle bit 36: PSTATE.UINJ.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++--
 target/arm/helper.c    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index be32a8c531f..69c9256984a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -2015,8 +2015,8 @@ void vfp_clear_float_status_exc_flags(CPUARMState *env);
  */
 void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask);
 bool arm_pan_enabled(CPUARMState *env);
-uint32_t cpsr_read_for_spsr_elx(CPUARMState *env);
-void cpsr_write_from_spsr_elx(CPUARMState *env, uint32_t val);
+uint64_t cpsr_read_for_spsr_elx(CPUARMState *env);
+void cpsr_write_from_spsr_elx(CPUARMState *env, uint64_t val);
 
 /* Compare uint64_t for qsort and bsearch. */
 int compare_u64(const void *a, const void *b);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ed6b4d985e1..e6b16eade76 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9353,9 +9353,9 @@ static int aarch64_regnum(CPUARMState *env, int aarch32_reg)
     }
 }
 
-uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
+uint64_t cpsr_read_for_spsr_elx(CPUARMState *env)
 {
-    uint32_t ret = cpsr_read(env);
+    uint64_t ret = cpsr_read(env);
 
     /* Move DIT to the correct location for SPSR_ELx */
     if (ret & CPSR_DIT) {
@@ -9368,7 +9368,7 @@ uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
     return ret;
 }
 
-void cpsr_write_from_spsr_elx(CPUARMState *env, uint32_t val)
+void cpsr_write_from_spsr_elx(CPUARMState *env, uint64_t val)
 {
     uint32_t mask;
 
-- 
2.53.0


