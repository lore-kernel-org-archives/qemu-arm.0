Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1309361eja;
        Fri, 1 Mar 2024 12:42:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXQgQU7M+MlCz4b5zj5u5fapjHiwZFmm62kywoG4ewYL6sa3rXL2b1dXNEz2tR9WVhWDH6dLd4rfnmAO6GMAvKhwYdCiF92
X-Google-Smtp-Source: AGHT+IH09CRiA5wTS1cjbkIhDbE8xA1WONYNkqBVVcNPBtHon1hIFa9Im5YNUANtpHv+wMFcURcF
X-Received: by 2002:a25:68ca:0:b0:dcc:57ff:fb70 with SMTP id d193-20020a2568ca000000b00dcc57fffb70mr2597664ybc.60.1709325768113;
        Fri, 01 Mar 2024 12:42:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709325768; cv=none;
        d=google.com; s=arc-20160816;
        b=Cwee/t/NRAGQVMH9z/p+LicY6xy0zBxxyA8TICIFcD0+XVJeimgHMgGngZeifttqId
         W/qHTW8THU70X3KZI7qrF5XY0IoKn/VVWwo5l0+e+I4RjW1i68Jm29Zf0yCPmRtDveKs
         U0YrIfsT6IiZCIhcD2Fja2qGH2X4BgL2E2hNqmxP3auMRNrAX7LRvofheacoVo1WVYDY
         AxxSdt2uqGKuGAuPZ71I4mW8BjjVxMU/RMSn0B9oSqUZmFjbIJMd3WHnC9pezoX61wuK
         /KOJDl8KTHYj7QTc9DSpXL75JfZgZPf5Q+K/RaCxpnXrD8TbTuSYC3HmzaEP2ZspJaUB
         j0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GuRyEJUy3EeC0acSqgIfQ+cNnDkZek7t4EbMZ1kuVCY=;
        fh=OZQBfL75rC14cCDy3q+1fYHCs9KjWAQ7ZJ3hTfS+5lQ=;
        b=YTKJthINcCdkS7wd2HN5yvtECn0KJy68KJwTxsADkIdnCNYM/9ee0amTzCyEMJPlrK
         fKaFGtO0DOSv/nLl/INuThMUrVO9Ud6eOUpciPY2u2ziObR6Jfp01PcOwxHRy847pEOU
         ZxXKARCBJasLLJJPzmTNjx3g2Ug3dDPv8y1+vieZF3w1+hBFqk9NmWlbstfG2fK7FI0t
         Yi9bZRtzbED6oboZqs5LaaMaoPQ2xKObV6ag15VUVPQSeLZDrFYqMMo5lfy/xfpv9dj/
         Bxz4l1aqFCZhoXTtLuj/8Ww1bVHPWOXSecx/I3eL3tvmchefZ4F0HG+nbgnDUanIe11d
         EezA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RwKdvFaq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vr11-20020a05620a55ab00b00787b47da3b0si4231204qkn.347.2024.03.01.12.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 12:42:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RwKdvFaq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg9h5-0001yD-4D; Fri, 01 Mar 2024 15:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h3-0001xQ-UU
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 15:41:21 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rg9h2-0006zK-Cd
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 15:41:21 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-29a6dcfdd30so2053112a91.0
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 12:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709325678; x=1709930478; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GuRyEJUy3EeC0acSqgIfQ+cNnDkZek7t4EbMZ1kuVCY=;
 b=RwKdvFaqq+YtR1qtErSzsheNZ+g7f+aCRXaIinkm2fFzev/elFg03wwOIitDH9Hbh4
 mGGAffPIFtlgqoOXRTaA13amAK/qsVPk+3cZU+8OzbtoDd1oXsomnvXln+rBSvbsp+Ut
 l89hObcazN9Ak7VeDuEvRk5RGaAyp+7tvUWKZxLUpfO4Kyr9abtcSIgtqQlAGjxr2d01
 hCMXBh5l4Iazio3P2R0HiwAZfIm7p1ECn4J0fC5CwBCSlnLXmtMkD3ku3m767yoYu11C
 7EGAw9lstkEc2lku8Hovq+Z/h8DldO+KuvwWO0CcNWh1i3V0QkOgVEYAcTHidA4z+fS7
 5uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709325678; x=1709930478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GuRyEJUy3EeC0acSqgIfQ+cNnDkZek7t4EbMZ1kuVCY=;
 b=hjjkePb9/D/qCXldXfZMyrSSRTwMBYZB9dTT10Y6qsIJYZE0TjavhPFBqHR7TRSGMg
 Ck3DObmQpTCPxuHv3bnT6g44j21cNd/zEe4jCC4x0KPBiwQm24R4rIBMpKkXEe/UUdjo
 LhH1piQWOB3mIN9Y03ey9xGcKdJypYg1Rp8MRpAikfgBxxJgujz2Ks8HOJ8JCENn0y0H
 QIKDm9pU2NBEPC8wzjNSRlP0Toc1ufI7JeSNb1v8ybR//wxUlo4UeQ3HIzDbAYPOQtnu
 sP7SHy8reIv8JaNrmr3LjwW4oaaBoi+HU4YrZgRUzJLt284Ye6dCCJ/jKOEq+17cuNX1
 Pn+A==
X-Gm-Message-State: AOJu0YzQJqmQp2sIK0cu199bMSRjeECjlUOs4Yxq3MCzy7TBn6s4ELh8
 aIMCYe7py/1ZCvo6++Mi9d++bWAY/QVRCgzfpenSGLamqNFxvCY6tLL6VmA43NU=
X-Received: by 2002:a17:90a:990b:b0:29a:cb1d:7a37 with SMTP id
 b11-20020a17090a990b00b0029acb1d7a37mr2624088pjp.32.1709325678004; 
 Fri, 01 Mar 2024 12:41:18 -0800 (PST)
Received: from stoup.. (098-147-055-211.res.spectrum.com. [98.147.55.211])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a17090ac58300b0029b2e00359esm681947pjt.36.2024.03.01.12.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 12:41:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 3/6] accel/tcg: Add tlb_fill_flags to CPUTLBEntryFull
Date: Fri,  1 Mar 2024 10:41:07 -1000
Message-Id: <20240301204110.656742-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301204110.656742-1-richard.henderson@linaro.org>
References: <20240301204110.656742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: n26YHScimpln

Allow the target to set tlb flags to apply to all of the
comparators.  Remove MemTxAttrs.byte_swap, as the bit is
not relevant to memory transactions, only the page mapping.
Adjust target/sparc to set TLB_BSWAP directly.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h   | 2 --
 include/hw/core/cpu.h     | 3 +++
 accel/tcg/cputlb.c        | 5 +----
 target/sparc/mmu_helper.c | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index afa885f983..14cdd8d582 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -52,8 +52,6 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
-    /* Invert endianness for this page */
-    unsigned int byte_swap:1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index af1a29526d..4c2fddc85b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -230,6 +230,9 @@ typedef struct CPUTLBEntryFull {
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
 
+    /* Additional tlb flags requested by tlb_fill. */
+    uint8_t tlb_fill_flags;
+
     /*
      * Additional tlb flags for use by the slow path. If non-zero,
      * the corresponding CPUTLBEntry comparator must have TLB_FORCE_SLOW.
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 047cd2cc0a..72d6a09616 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1145,14 +1145,11 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
               " prot=%x idx=%d\n",
               addr, full->phys_addr, prot, mmu_idx);
 
-    read_flags = 0;
+    read_flags = full->tlb_fill_flags;
     if (full->lg_page_size < TARGET_PAGE_BITS) {
         /* Repeat the MMU check and TLB fill on every access.  */
         read_flags |= TLB_INVALID_MASK;
     }
-    if (full->attrs.byte_swap) {
-        read_flags |= TLB_BSWAP;
-    }
 
     is_ram = memory_region_is_ram(section->mr);
     is_romd = memory_region_is_romd(section->mr);
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
index 5170a668bb..e7b1997d54 100644
--- a/target/sparc/mmu_helper.c
+++ b/target/sparc/mmu_helper.c
@@ -580,7 +580,7 @@ static int get_physical_address_data(CPUSPARCState *env, CPUTLBEntryFull *full,
             int do_fault = 0;
 
             if (TTE_IS_IE(env->dtlb[i].tte)) {
-                full->attrs.byte_swap = true;
+                full->tlb_fill_flags |= TLB_BSWAP;
             }
 
             /* access ok? */
-- 
2.34.1

