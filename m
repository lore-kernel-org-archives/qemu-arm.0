Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp808147ejt;
        Wed, 21 Jun 2023 05:21:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6N7IE8iLeJha8hcwKdBJb2stRQaKAG3PJNG5G9iJXT5bh/eux96saUQhUbBLHMRkMnl7AJ
X-Received: by 2002:a05:620a:2793:b0:762:3b58:8abc with SMTP id g19-20020a05620a279300b007623b588abcmr14450905qkp.59.1687350070341;
        Wed, 21 Jun 2023 05:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687350070; cv=none;
        d=google.com; s=arc-20160816;
        b=uzzL/aRiYh7ktbot0qjeVCeHJrJNeavAAnon3f5k8os6KXBIuxMeilVvI+MUpK4gsD
         hK5inKx9fUWp9K0m3QRr0uHTu1hdZA/RFbeOaEVWnnopJJXw30rUrgBeTqlQopchX7bv
         C7ssgxj5mJ//mlFxOOHK5K/NedWdKQfrMtpSCN4pWBdMEugH2Ts0h/8+TZ0PJMbWU1xr
         wd8OeyVtyA9K4YArhbNuaz2kWm63B4oNeJpYDvd3EiAbwwyE1Y+BOfGact0FeUzFF4wa
         7Q7FOt8W7Stzu7oq2hzgLxjcbyB6ygcBViUxQuef+LFGwlycGOUMHawI5QXLUKEGZUgh
         Tv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+bycXui2RuZ2kW1i70HcWSrb541nDGsMKgy0HbURvr0=;
        b=DLouZd1KN+85/HUKIH5I05LAIVeTxNCU2doablk9sUjFq4XfK8tHiWHquAKK7QT440
         fmyHUsHmLBMt+DchT0iayFyWFXBF8IGqJxa/EidGuL88CLDaBWo+RZQucf2Ham2jzt1j
         Jl7L1ZzMK3j3UmJuJ5NejMI0+IU+/ycRNzQ9gk10CefdIXJNY+tINso5haYr0jU+PYq/
         lV/glf6zFqKW4JnB/M2U6rvj2GHxJi+MG8j8mscDot1OurMpk/gDVWY6AEPLhEd18lgd
         xrKm/P7HZkPuwLVjyqvioFrrRuz21HSPXhwsVM3IkAjWsHXObhDyZtsmZdTS1JFVCtsZ
         BY0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npFYVs4V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1-20020a37e301000000b00763a6a10e2esi1636042qki.222.2023.06.21.05.21.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 05:21:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npFYVs4V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBwo9-0006nS-4f; Wed, 21 Jun 2023 08:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnt-0006dx-8X
 for qemu-devel@nongnu.org; Wed, 21 Jun 2023 08:19:19 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBwnn-0000Iw-Us
 for qemu-devel@nongnu.org; Wed, 21 Jun 2023 08:19:13 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51a20138617so7959808a12.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jun 2023 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687349950; x=1689941950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bycXui2RuZ2kW1i70HcWSrb541nDGsMKgy0HbURvr0=;
 b=npFYVs4V/FRu/JnaEMpJbTC5gtmRQ6ijdnhwy6u4NbHceSvFf5/Z6ssCsyoJBI1YTt
 QM8Df1E1CPcMjGIkRdD8RPslseSvcHfc2RcWlwFaOqnsgo1aM4IT9m5ePSVqCn38888t
 FIa+tbTjLymZvQjK02gV0/92ahwEY7xZVsl4IlAKUVqUH4yy+yLr6sh0FvQvOqJO0y38
 8IoHDLxaBbyPsPKbHdO7AGLym9r/GHif6/UNRasHxO3g/omEHRdOfc3mIxH8srGCycOS
 uu7ufU/yFa8s6Na7eZxhz5Ror4KH3ZjT8GkeOX8FSBobhR3xSGQjbn7L42YDqpKSAvh6
 +91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687349950; x=1689941950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bycXui2RuZ2kW1i70HcWSrb541nDGsMKgy0HbURvr0=;
 b=hildz+M92bdHqwGjuGQxKxOTcv+ZmpF0MQHnApDsaR6SOQfdJkPReqvNzGTq6cH30l
 J5hhbqg0387YzlY6PQ8aA2r/CqfJFtUlx1M7OXvXQ8EZwKjPGrBUpVxTaNn3BzS0TVKp
 upPEViz3QrGwUdLhdEia7HA7GnK51GIST5hVW7ZVjYKZ4x+inGoNtI4vsgyAfqk3UeyP
 k7r3CWNrUh9w3muPtukNSflvowGm6JCR3SrSEfgxJVWb/GG28lisa6/hH1MOByOvP2EC
 jyEkVVyITdaBsR3M6X8HSFYnMFMq3qMFJh1QbsWwee/fotKys42GCIvjLp95Wk5HAtdV
 +9zg==
X-Gm-Message-State: AC+VfDy3aIiS10LhWg+yE8aQY1R4NHuMHlEAxwVn9XACKQk/XaZOaGjM
 o5cOKwpD1CHlCo+d85ysctquBDwhWHsGUWzjDX4OWOt/
X-Received: by 2002:a50:ed0d:0:b0:510:72b1:5f4e with SMTP id
 j13-20020a50ed0d000000b0051072b15f4emr9887196eds.22.1687349950531; 
 Wed, 21 Jun 2023 05:19:10 -0700 (PDT)
Received: from stoup.lan ([176.176.128.70]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056402014600b0051bdf152295sm543176edu.76.2023.06.21.05.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 05:19:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/9] accel/tcg: Add tlb_fill_flags to CPUTLBEntryFull
Date: Wed, 21 Jun 2023 14:18:59 +0200
Message-Id: <20230621121902.1392277-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621121902.1392277-1-richard.henderson@linaro.org>
References: <20230621121902.1392277-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: s4l8PSQvqv/U

Allow the target to set tlb flags to apply to all of the
comparators.  Remove MemTxAttrs.byte_swap, as the bit is
not relevant to memory transactions, only the page mapping.
Adjust target/sparc to set TLB_BSWAP directly.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h   | 3 +++
 include/exec/memattrs.h   | 2 --
 accel/tcg/cputlb.c        | 5 +----
 target/sparc/mmu_helper.c | 2 +-
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index c174d5371a..9d39252271 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -124,6 +124,9 @@ typedef struct CPUTLBEntryFull {
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
 
+    /* Additional tlb flags requested by tlb_fill. */
+    uint8_t tlb_fill_flags;
+
     /*
      * Additional tlb flags for use by the slow path. If non-zero,
      * the corresponding CPUTLBEntry comparator must have TLB_FORCE_SLOW.
diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 1bd7b6c5ca..5300649c8c 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -45,8 +45,6 @@ typedef struct MemTxAttrs {
     unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
-    /* Invert endianness for this page */
-    unsigned int byte_swap:1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 152c4e9994..61f4d94a4d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1172,14 +1172,11 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
               " prot=%x idx=%d\n",
               vaddr, full->phys_addr, prot, mmu_idx);
 
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
index 453498c670..11f03b74d2 100644
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

