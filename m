Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp2108748njb;
        Mon, 23 Sep 2024 02:23:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLDtRq6ZFY30cv9HMvdI8VIlLhuVs9z1NP6Gs1btnp3SDm5Mi+b6Vv8kQ4jd/b+xniDy7J/AMU+qCjjw==@linaro.org
X-Google-Smtp-Source: AGHT+IFuzwhyMk6/h4uFKwyLKbonBLcJ6MCcMNlk9Z2xApVQ+y7HG1ShTJxpJld+oVtU15qYtZ5h
X-Received: by 2002:a05:6214:5712:b0:6c7:c7dc:15d5 with SMTP id 6a1803df08f44-6c7c7dc17b3mr146670686d6.33.1727083382214;
        Mon, 23 Sep 2024 02:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727083382; cv=none;
        d=google.com; s=arc-20240605;
        b=Z7/mUKHDA+egbKeBr1TzhO1z9rL+vXnMIgVpD7icNmCPQ8lINyXkBF/OKxFdsBr41s
         gbJplodrHoJFa6mReNxGLxncL2y0DjmPP2PSx9N+54s7v/MobDZKdB6h9YXfrxA+dcUe
         wPIdQn7hdHnFLHZhMcjrAYV3D+nioik2ByRW0jyzY1aswitCnvYbcth6UimsAz2ilQC2
         U9HJJXzvdT56m8PxXrI8LlS41MAkPV+5nXfJlSR6OpAp6aM1DLsu2cH2ehOyVpRj+xWg
         vymlcXDkOglo03GaDrzPBiWf84JBYisfBAfQXB5dQDnPqiyadlgA6HtQgI+T2Ghts7ZD
         WwTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=Vx0S0EoF5VOfTDD0EAY1LpxEtaebb5mReMlj7psinmA=;
        fh=NKy2LJHyIU9nzb/6SJi95FRthFJndORmIhxCHfrIn28=;
        b=J1U+3CSlXcese2/dLuaJtv3SkVb7rGRkF1x6hJGpLhlHmMG/ESJndoPfTZ2fAaEGfu
         xce87yzxyUX+Q25uQWyUkHn9U7jjfDGqg/ZWETCYQzLuUjmbW8QM2zYB6a6AfSrHOJDo
         M3ZiASXwgzUnYevxix430+YpMTWsrK7TaT8XhROWhccnhMoyBRIfPWWKuWuIsDMW3Xww
         rKSCz6q3EyI4Y2gcZiWGczCyPON6GpgMzdElCosTT7kLZlF6C8MeDWP3nTBi1vz/fAhv
         CdLTmDwykeKqj3xUI/LeOcP63/iCJNhvDXd2skJZOvble8h6t0abbj31hURuXmh25A5S
         7MlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="qzn/Ogsf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c75e5ac1d3si99313426d6.531.2024.09.23.02.23.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2024 02:23:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="qzn/Ogsf";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ssfHN-0003oF-3t; Mon, 23 Sep 2024 05:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YTPxZggKCMoq7tr+wy9w44w1u.s426u2A-q72343w3A.47w@flex--ardb.bounces.google.com>)
 id 1ssfHK-0003iH-Rj
 for qemu-arm@nongnu.org; Mon, 23 Sep 2024 05:22:46 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YTPxZggKCMoq7tr+wy9w44w1u.s426u2A-q72343w3A.47w@flex--ardb.bounces.google.com>)
 id 1ssfHJ-0005zf-0g
 for qemu-arm@nongnu.org; Mon, 23 Sep 2024 05:22:46 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-6ddbcc96a5fso53873907b3.0
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2024 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727083361; x=1727688161; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Vx0S0EoF5VOfTDD0EAY1LpxEtaebb5mReMlj7psinmA=;
 b=qzn/OgsfXDu1oH6SVFY0/sqZd1Crjmr8V+D0gKvfRPgEr0721T+ITQrX5ZUNo5c/to
 umep7xa1UhYkFFJyEYNpbjDEyLxBIZNt4VDGthIZ32D0dY2VsGAgqiwsYbHiK1LsqjEa
 5BkQ/hd4Ri++MnKZINqUOCKcKl6Tl+EwLZOC17NtwUwE7QmBJGJoKdbcIY25hga/Jtjt
 vlw0OWCX+TeBTTob+OG6fOXYtl77rsb7LIbcx1DpiSWGIbh9zc3EiBiDnZACRGPaREaF
 s4omSwSwed9sqt7IEzbE2UuorRG/tMR2EmBSU9TBJgOArUSTLnaUa+PyXuOGPJ9deq+5
 C8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727083361; x=1727688161;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vx0S0EoF5VOfTDD0EAY1LpxEtaebb5mReMlj7psinmA=;
 b=eWNu7HNCJZv3jCcqiXStU3nU+xlL/e1TtqxT6mzgY2fikA604JkbihL57nwYAzc5xo
 PP3tA6Lub43UjA9RH9QKWAqUeeOXVeJpmxE92zn8DZHDZSnCgHJOKWlmYn7rfmi7/tvH
 t5SrYKFUVqUuWkk8+ottxBVsBUz3ybZuLSxzxPJ+5OtVZ5he7x5bznQSChtWgOoMQfhj
 sv2bQFeMPScEWm5w9WANvV3xDkfuWoncEPuuKO+6YJCoQYLyqXqrl7H37avBw4k4cFUb
 V7d8sQsdZm169S8e/vJirvtkp5HSOQXf1EkatdNnxtcVZx2G5DRaTK7CoJmoqjM1Rlgt
 ECuw==
X-Gm-Message-State: AOJu0Yxobn9F9Bt7Mzxn/ov+ijw/WEKsy+JE2tidFHcHpSenFetHRoZT
 eJV7OV8e3vKLZBmqsd49qm4VaX0lmLOYdgqj9/7TVRVTp6V83CL9J5yJjIjgOVQDN5HWUQ==
X-Received: from palermo.c.googlers.com
 ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a81:8d50:0:b0:62f:1f63:ae4f with SMTP id
 00721157ae682-6dfeed0ead4mr947207b3.1.1727083361430; Mon, 23 Sep 2024
 02:22:41 -0700 (PDT)
Date: Mon, 23 Sep 2024 11:22:33 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923092233.3235856-1-ardb+git@google.com>
Subject: [PATCH] target/arm: Avoid target_ulong for physical address lookups
From: Ard Biesheuvel <ardb+git@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, 
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=3YTPxZggKCMoq7tr+wy9w44w1u.s426u2A-q72343w3A.47w@flex--ardb.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: we14Zx2CvMb8

From: Ard Biesheuvel <ardb@kernel.org>

target_ulong is typedef'ed as a 32-bit integer when building the
qemu-system-arm target, and this is smaller than the size of an
intermediate physical address when LPAE is being used.

Given that Linux may place leaf level user page tables in high memory
when built for LPAE, the kernel will crash with an external abort as
soon as it enters user space when running with more than ~3 GiB of
system RAM.

So replace target_ulong with hwaddr in places where it may carry an
address value that is not representable in 32 bits.

Fixes: f3639a64f602ea ("target/arm: Use softmmu tlbs for page table walking")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 target/arm/internals.h |  4 ++--
 target/arm/ptw.c       | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c5d7b0b492..31c82430d8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1449,7 +1449,7 @@ typedef struct GetPhysAddrResult {
  *  * for PSMAv5 based systems we don't bother to return a full FSR format
  *    value.
  */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
+bool get_phys_addr(CPUARMState *env, hwaddr address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
@@ -1468,7 +1468,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
  * Similar to get_phys_addr, but use the given security space and don't perform
  * a Granule Protection Check on the resulting address.
  */
-bool get_phys_addr_with_space_nogpc(CPUARMState *env, target_ulong address,
+bool get_phys_addr_with_space_nogpc(CPUARMState *env, hwaddr address,
                                     MMUAccessType access_type,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index defd6b84de..8ec4f7f368 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -74,13 +74,13 @@ typedef struct S1Translate {
 } S1Translate;
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
-                                target_ulong address,
+                                hwaddr address,
                                 MMUAccessType access_type,
                                 GetPhysAddrResult *result,
                                 ARMMMUFaultInfo *fi);
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
-                              target_ulong address,
+                              hwaddr address,
                               MMUAccessType access_type,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi);
@@ -3217,7 +3217,7 @@ static ARMCacheAttrs combine_cacheattrs(uint64_t hcr,
  */
 static bool get_phys_addr_disabled(CPUARMState *env,
                                    S1Translate *ptw,
-                                   target_ulong address,
+                                   hwaddr address,
                                    MMUAccessType access_type,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
@@ -3300,7 +3300,7 @@ static bool get_phys_addr_disabled(CPUARMState *env,
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
-                                   target_ulong address,
+                                   hwaddr address,
                                    MMUAccessType access_type,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
@@ -3405,7 +3405,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 }
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
-                                      target_ulong address,
+                                      hwaddr address,
                                       MMUAccessType access_type,
                                       GetPhysAddrResult *result,
                                       ARMMMUFaultInfo *fi)
@@ -3542,7 +3542,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
 }
 
 static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
-                              target_ulong address,
+                              hwaddr address,
                               MMUAccessType access_type,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
@@ -3558,7 +3558,7 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
     return false;
 }
 
-bool get_phys_addr_with_space_nogpc(CPUARMState *env, target_ulong address,
+bool get_phys_addr_with_space_nogpc(CPUARMState *env, hwaddr address,
                                     MMUAccessType access_type,
                                     ARMMMUIdx mmu_idx, ARMSecuritySpace space,
                                     GetPhysAddrResult *result,
@@ -3571,7 +3571,7 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, target_ulong address,
     return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
 }
 
-bool get_phys_addr(CPUARMState *env, target_ulong address,
+bool get_phys_addr(CPUARMState *env, hwaddr address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
-- 
2.46.0.792.g87dc391469-goog

