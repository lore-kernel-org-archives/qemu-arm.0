Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1091333lfg;
        Mon, 24 Feb 2020 19:14:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqw/D6UwpDDsfMxU2ktfNbbcCL86TogkMMGON4/v4wneLpZKnmY5DZjl6gP2XRJruVgWvvVq
X-Received: by 2002:a05:620a:381:: with SMTP id q1mr38274164qkm.191.1582600475639;
        Mon, 24 Feb 2020 19:14:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582600475; cv=none;
        d=google.com; s=arc-20160816;
        b=j5yr3OJNbCaggNx5CbY9Gdr234hEC5gxBi5/Onk8eTFudvp4nopQFKW+ahxuuCq+J/
         78tv9TYHfzR7MIIS7QEqVT41VwrgrNZwUvyH1RQk4cgteDgCqjW2lF13Y1g59r2TqRpC
         OFfhAGuj09P+ZzI1KVEOAQwHINBmu8Q1pZfMjrH6KcWSja5qoQ99ZlygukVWuxaxyI37
         OuKLBoXbhOg/VRYj2vRK8Ncdck1huKme6SbRqKpjdyVne54VpH+vI6PH2ajx+YySE/Xk
         QWSpAonUHgPLxgoKzu5Xjp6ccY3R3iiZmFvMFncJa71NsAmgVWo6WmQOAUowqEOTBjTt
         ZLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YzJYu08ie6LvTeM6gnMWpOdweYPWQCMbZiS6xrkcAUI=;
        b=SDADsuRD3nP3swtxmPUzAe7M5REEwps+VJnYql/EO88ZjRZ7uM3B/znQzUsidYy3Mr
         vrSZcTBAubdRZeTt75irdPtp1BVs55yhCk5EWRoiw0pECuAqdL56Y+4qnosdI5W+HP9t
         oODTQmsM60f9Tnh7m+BIb/epD/YSMpJrWtZjgQgOrEVC9ZW8VJq4i/t2nX/Ujd4SxVsg
         GKcmEqSjRe0qXDI94LEOymyskwhyFMzTG3NyKjOyY1tML2lCzT3kYNEpocOKtrX9SrhE
         uxtNqUlJUZ+8NcSZ+shmCn62PrCMruwjizvqpl+mWA9Q04IRkq+cayoUpLNfRXjLg05m
         pFaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JbDM96Hs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a188si7091268qkg.243.2020.02.24.19.14.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 19:14:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JbDM96Hs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Qg7-0002x4-2Q
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 22:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfr-0002tk-OM
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Qfq-0005Ks-Lx
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:19 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35167)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Qfq-0005KS-GZ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 22:14:18 -0500
Received: by mail-pg1-x542.google.com with SMTP id 7so4081071pgr.2
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 19:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YzJYu08ie6LvTeM6gnMWpOdweYPWQCMbZiS6xrkcAUI=;
 b=JbDM96Hsf8HKbiln4DC22ceoPZKszaEOKEcMoknWi+08zzlPErxAaUWrA7hHrJCxJk
 vZ4mx1QsjVmQx0J0euSesWiPIfyw+qx7U50MrWKlaDaOCtSpRhajooXgQk+rf7NhOcur
 2Vmw6gtuBmbKNAsvITBEJyEcGhBxDJraMj6r/ImAdsf80pfxzAyf6cqnAs1tn6Pj/ZXX
 SbTiNAHDVexPl7MQ4oBgUdAtmxPkojAfyNYGKSjAiR10j8un5YKo5q8ooFtJGxpR/EOy
 cJnUITn+is+sgmlP+lhGisSycXV6oI4Lei0gpSfODJoYDAPPdLYUnqe8TeMy4bN4VObx
 lG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YzJYu08ie6LvTeM6gnMWpOdweYPWQCMbZiS6xrkcAUI=;
 b=VSKjBfMHBHsvEMK236Ha+LBmm8qOjJ6EvlAX+oDCttQ2cl/5xM16AweeZas1+jscPn
 qila91s4JgoZpemZmbfgCzslR8GtfWNc02WStucEqX0SNAUQBJdT443k4alQHkxk9wjH
 HXBUla7uP0qDVVWLhO2/aADHdDQu5QiT+xTZiTj0M6O1QxxjKnu7FWzi7U2u41u51yz2
 bJz2tPtWg3KiAvaSnCsWZ22iOuywQHor4mYy4WVpiAuiuS8ch0jAiUlJUM4gl1oIK7xG
 R1k9CFbIhGtg+rqF0WpGV4hbn5cFPrJWj+USNTRE4+rWr8+dcmH618X6odVAXABl+ODL
 Gphw==
X-Gm-Message-State: APjAAAWNru02lw2j0feXD4SKJFF0m4CyZBPDu983N3WFJnjPW3Tm0FWU
 F4C0cxIMtd+wgrvWgABs2eznAOvSp3M=
X-Received: by 2002:a63:b257:: with SMTP id t23mr53950267pgo.17.1582600457561; 
 Mon, 24 Feb 2020 19:14:17 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id q66sm14975242pfq.27.2020.02.24.19.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 19:14:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] target/arm: Apply TBI to ESR_ELx in
 helper_exception_return
Date: Mon, 24 Feb 2020 19:14:09 -0800
Message-Id: <20200225031414.15649-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225031414.15649-1-richard.henderson@linaro.org>
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-TUID: Q75bTbgQVKfL

We missed this case within AArch64.ExceptionReturn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 509ae93069..95e9e879ca 100644
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
+            if (regime_has_2_ranges(core_mmu_idx | ARM_MMU_IDX_A)) {
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

