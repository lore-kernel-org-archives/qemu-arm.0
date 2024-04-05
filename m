Received: by 2002:a17:906:4f0b:b0:a47:c39e:cbe with SMTP id t11csp958980eju;
        Fri, 5 Apr 2024 05:54:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaQ/96i5On064y+azJcLQRnpoAJq5nhyZsD/qHodM/q13l26RwZNVnql/FjtedX76Nzsm1YLOEXSjEEdndctO1KMVDlEmY
X-Google-Smtp-Source: AGHT+IE7X1WfNWX3ybGw2uOhe7s6b7UGK+2n3w3ZvVaQUG6JwkiiLx7TaM7O662luylqRGFROwzA
X-Received: by 2002:a05:620a:8530:b0:78d:3a35:6af with SMTP id pe48-20020a05620a853000b0078d3a3506afmr1271852qkn.57.1712321699529;
        Fri, 05 Apr 2024 05:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712321699; cv=none;
        d=google.com; s=arc-20160816;
        b=g9NNp5nH6RXrShs6WvPq1LnMLBFEPk8T2qBGmTDsgwM1ZktewGSevasVi/m26vUTO6
         xYYr+7abHX8kEDjuPjCXwjop9LA1gDh3m6fZ0tbQhfskB29cjxJJwRDhW9SLeKTWVUgc
         9J8d6mIa4eLxk0fH6M9cXRMZRil5B/RIRuQ7cNc6wd0c95o7XERJcvXeTKi9SMdky8f7
         8CHqoDjAVKiVMz6T6bnZrPz9dUeQcfnhAoowVCG3TJu24RdhGxdWTP8M341CDE3jlw3p
         uYulbcc/fxEUMJAbqdsh7iAZKeLCA2NHYfou/+A9ViR59OtIUhn5olIJ97qj/scEZfTm
         Bd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VHJJaFhy7VrzZXRwW2V+yycJSsEcKBdj9aGgV2xzP/I=;
        fh=RWDiiNMcihtazI0BpyaeDylU016CiR82tYj80iPXJtc=;
        b=dqr548XYL+7fnPld6JKz5AXqeKdTF3wUQjXL3fgOZK5k4cOQaC2M0p3uHPuFDeW9cf
         opsAqQ5tTY4HIVFOdLfqQm8WsPhwrpmv1z3XQfN14xbq5wM39QwvUJpPjwF9FbjX9JNN
         cuJvSOlT55Ibmr98d9fdNm8As6WiSvxIdjM1nSOJkcFcfDFbTGopPmv2PwNV+AFIVawq
         UjZv5S93nk0sYDGzmRRHSOyBaiTObHJsMiLF40mle8Oro4YkREtoA9OJDIO5KGuV6xcE
         QYFLAc4nekgg0zzVCUK4wj0PUmFUkwMrutfykh2b9hlvOuL9YT4tNSgWxnjqMiSBtK/9
         /6hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KK61Dq5i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi19-20020a05620a379300b0078a3a96b13asi1689926qkn.114.2024.04.05.05.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Apr 2024 05:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=KK61Dq5i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rsj58-0004kr-1s; Fri, 05 Apr 2024 08:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rsj56-0004g2-LU; Fri, 05 Apr 2024 08:54:08 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1rsj54-0000xA-8c; Fri, 05 Apr 2024 08:54:08 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6ecf1bb7f38so1388988b3a.0; 
 Fri, 05 Apr 2024 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712321643; x=1712926443; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHJJaFhy7VrzZXRwW2V+yycJSsEcKBdj9aGgV2xzP/I=;
 b=KK61Dq5ixkcl703Qo8L7PzUCwpH5LU9eqvqWGaVoVxLTn+qIhbjGALq35M7HEEcQIK
 O3O0MVL1X2Qa/f45P+SdzCqAZwaMWL9yMW0JqNtax2tiRHMPQVg0RKDDGXCvp2IAaCZ5
 ICvZ+S/8PekUrYFFjbExGrpqmrzDTLbr8oJZyJiQABCRTV7E9zvmlzsE/EzdEUB2DvyM
 Q5Tizb/gNjUkG3QVHHv4HWGgspLj67pyyayPgjBAtRmvxiP247rC9SOgy11pvl/nqGeV
 Emqyq+X3XYKIvK++mlkGEZfs/i6ZKKf9Dezi/EjBx72xLpo0rZAP5p5DmjTJopBZUCa1
 pV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712321643; x=1712926443;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHJJaFhy7VrzZXRwW2V+yycJSsEcKBdj9aGgV2xzP/I=;
 b=bTprrGsbB2IMCqyr51EPCbNeg1fV0CDC0KZhKxkVBplivAPGDpC3nUxh1AYzzCNeoR
 zFJ8I7gv5PS/uSXiXVsUV+8lOsQaRP90KQFeut9uRH9XcV61nhgnt8KtCirmNJDu9+g3
 mvcI55GG1a3GXJ4bMULOdEJTRix5beF88rK6rCWxoFmjuUDVC9uH44vXv6+ynFdR1yg2
 HZcegVik55WMOH+YL/80HFGL2dldVPqYsOnsd5L7CXkKF+4NddlYaQnoiyRHgP6HDPpn
 0/euD+caNqPuMBwe1ar9LvXU9CfOgQGx/2Z253z2FJF/9prrMGuI/e1ZSsPlHEmLQgZZ
 IFKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRCbcCMbOmPOGBiAiC6eiqQG61+nG01IeELUapKZEn/F9osqas1lgc0L7sw/VBwmkIVkrklNMFT7jE4o3/jvNCo8lcXIloGKp5X4WV14K0VG5GEBy+jwOQyFNccwjVCc7oYBqCRANfppI4JsCYYpfZpeX90AFVrrohhEcSqWcT0g9y1kiY1gMi
X-Gm-Message-State: AOJu0YxkXlc7cG1oLsHjz5JtGcU3VxZ7ty+f6/MR3ZkriKmAjiPwJjdh
 FIiyNp3W6fOdtCEaX2OWYDs26hRkngGzg0eO2HpTak9olONGZZiU+X3msgvL
X-Received: by 2002:a05:6a20:12cf:b0:1a7:3b7c:2e9b with SMTP id
 v15-20020a056a2012cf00b001a73b7c2e9bmr1349958pzg.4.1712321643258; 
 Fri, 05 Apr 2024 05:54:03 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au.
 [124.169.104.130]) by smtp.gmail.com with ESMTPSA id
 t19-20020a17090ae51300b002a2d8d34009sm2984414pjy.27.2024.04.05.05.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 05:54:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v2 2/3] tcg/cputlb: Remove non-synced variants of global TLB
 flushes
Date: Fri,  5 Apr 2024 22:53:37 +1000
Message-ID: <20240405125340.380828-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405125340.380828-1-npiggin@gmail.com>
References: <20240405125340.380828-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O88cSXdBTLCh

These are no longer used.

  tlb_flush_all_cpus: removed by previous commit.
  tlb_flush_page_all_cpus: removed by previous commit.

  tlb_flush_page_bits_by_mmuidx_all_cpus: never used.
  tlb_flush_page_by_mmuidx_all_cpus: never used.
  tlb_flush_page_bits_by_mmuidx_all_cpus: never used, thus:
    tlb_flush_range_by_mmuidx_all_cpus: never used.
    tlb_flush_by_mmuidx_all_cpus: never used.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 docs/devel/multi-thread-tcg.rst |  13 ++--
 include/exec/exec-all.h         |  97 +++++-------------------------
 accel/tcg/cputlb.c              | 103 --------------------------------
 3 files changed, 19 insertions(+), 194 deletions(-)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 1420789fff..d706c27ea7 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -205,15 +205,10 @@ DESIGN REQUIREMENTS:
 
 (Current solution)
 
-We have updated cputlb.c to defer operations when a cross-vCPU
-operation with async_run_on_cpu() which ensures each vCPU sees a
-coherent state when it next runs its work (in a few instructions
-time).
-
-A new set up operations (tlb_flush_*_all_cpus) take an additional flag
-which when set will force synchronisation by setting the source vCPUs
-work as "safe work" and exiting the cpu run loop. This ensure by the
-time execution restarts all flush operations have completed.
+A new set of tlb flush operations (tlb_flush_*_all_cpus_synced) force
+synchronisation by setting the source vCPUs work as "safe work" and
+exiting the cpu run loop. This ensures that by the time execution
+restarts all flush operations have completed.
 
 TLB flag updates are all done atomically and are also protected by the
 corresponding page lock.
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 3e53501691..7cf9faa63f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -66,24 +66,15 @@ void tlb_destroy(CPUState *cpu);
  */
 void tlb_flush_page(CPUState *cpu, vaddr addr);
 /**
- * tlb_flush_page_all_cpus:
+ * tlb_flush_page_all_cpus_synced:
  * @cpu: src CPU of the flush
  * @addr: virtual address of page to be flushed
  *
- * Flush one page from the TLB of the specified CPU, for all
+ * Flush one page from the TLB of all CPUs, for all
  * MMU indexes.
- */
-void tlb_flush_page_all_cpus(CPUState *src, vaddr addr);
-/**
- * tlb_flush_page_all_cpus_synced:
- * @cpu: src CPU of the flush
- * @addr: virtual address of page to be flushed
  *
- * Flush one page from the TLB of the specified CPU, for all MMU
- * indexes like tlb_flush_page_all_cpus except the source vCPUs work
- * is scheduled as safe work meaning all flushes will be complete once
- * the source vCPUs safe work is complete. This will depend on when
- * the guests translation ends the TB.
+ * When this function returns, no CPUs will subsequently perform
+ * translations using the flushed TLBs.
  */
 void tlb_flush_page_all_cpus_synced(CPUState *src, vaddr addr);
 /**
@@ -96,19 +87,14 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, vaddr addr);
  * use one of the other functions for efficiency.
  */
 void tlb_flush(CPUState *cpu);
-/**
- * tlb_flush_all_cpus:
- * @cpu: src CPU of the flush
- */
-void tlb_flush_all_cpus(CPUState *src_cpu);
 /**
  * tlb_flush_all_cpus_synced:
  * @cpu: src CPU of the flush
  *
- * Like tlb_flush_all_cpus except this except the source vCPUs work is
- * scheduled as safe work meaning all flushes will be complete once
- * the source vCPUs safe work is complete. This will depend on when
- * the guests translation ends the TB.
+ * Flush the entire TLB for all CPUs, for all MMU indexes.
+ *
+ * When this function returns, no CPUs will subsequently perform
+ * translations using the flushed TLBs.
  */
 void tlb_flush_all_cpus_synced(CPUState *src_cpu);
 /**
@@ -123,27 +109,16 @@ void tlb_flush_all_cpus_synced(CPUState *src_cpu);
 void tlb_flush_page_by_mmuidx(CPUState *cpu, vaddr addr,
                               uint16_t idxmap);
 /**
- * tlb_flush_page_by_mmuidx_all_cpus:
+ * tlb_flush_page_by_mmuidx_all_cpus_synced:
  * @cpu: Originating CPU of the flush
  * @addr: virtual address of page to be flushed
  * @idxmap: bitmap of MMU indexes to flush
  *
  * Flush one page from the TLB of all CPUs, for the specified
  * MMU indexes.
- */
-void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu, vaddr addr,
-                                       uint16_t idxmap);
-/**
- * tlb_flush_page_by_mmuidx_all_cpus_synced:
- * @cpu: Originating CPU of the flush
- * @addr: virtual address of page to be flushed
- * @idxmap: bitmap of MMU indexes to flush
  *
- * Flush one page from the TLB of all CPUs, for the specified MMU
- * indexes like tlb_flush_page_by_mmuidx_all_cpus except the source
- * vCPUs work is scheduled as safe work meaning all flushes will be
- * complete once  the source vCPUs safe work is complete. This will
- * depend on when the guests translation ends the TB.
+ * When this function returns, no CPUs will subsequently perform
+ * translations using the flushed TLBs.
  */
 void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu, vaddr addr,
                                               uint16_t idxmap);
@@ -158,24 +133,15 @@ void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu, vaddr addr,
  */
 void tlb_flush_by_mmuidx(CPUState *cpu, uint16_t idxmap);
 /**
- * tlb_flush_by_mmuidx_all_cpus:
+ * tlb_flush_by_mmuidx_all_cpus_synced:
  * @cpu: Originating CPU of the flush
  * @idxmap: bitmap of MMU indexes to flush
  *
- * Flush all entries from all TLBs of all CPUs, for the specified
+ * Flush all entries from the TLB of all CPUs, for the specified
  * MMU indexes.
- */
-void tlb_flush_by_mmuidx_all_cpus(CPUState *cpu, uint16_t idxmap);
-/**
- * tlb_flush_by_mmuidx_all_cpus_synced:
- * @cpu: Originating CPU of the flush
- * @idxmap: bitmap of MMU indexes to flush
  *
- * Flush all entries from all TLBs of all CPUs, for the specified
- * MMU indexes like tlb_flush_by_mmuidx_all_cpus except except the source
- * vCPUs work is scheduled as safe work meaning all flushes will be
- * complete once  the source vCPUs safe work is complete. This will
- * depend on when the guests translation ends the TB.
+ * When this function returns, no CPUs will subsequently perform
+ * translations using the flushed TLBs.
  */
 void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu, uint16_t idxmap);
 
@@ -192,8 +158,6 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, vaddr addr,
                                    uint16_t idxmap, unsigned bits);
 
 /* Similarly, with broadcast and syncing. */
-void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu, vaddr addr,
-                                            uint16_t idxmap, unsigned bits);
 void tlb_flush_page_bits_by_mmuidx_all_cpus_synced
     (CPUState *cpu, vaddr addr, uint16_t idxmap, unsigned bits);
 
@@ -213,9 +177,6 @@ void tlb_flush_range_by_mmuidx(CPUState *cpu, vaddr addr,
                                unsigned bits);
 
 /* Similarly, with broadcast and syncing. */
-void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu, vaddr addr,
-                                        vaddr len, uint16_t idxmap,
-                                        unsigned bits);
 void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                vaddr addr,
                                                vaddr len,
@@ -288,18 +249,12 @@ static inline void tlb_destroy(CPUState *cpu)
 static inline void tlb_flush_page(CPUState *cpu, vaddr addr)
 {
 }
-static inline void tlb_flush_page_all_cpus(CPUState *src, vaddr addr)
-{
-}
 static inline void tlb_flush_page_all_cpus_synced(CPUState *src, vaddr addr)
 {
 }
 static inline void tlb_flush(CPUState *cpu)
 {
 }
-static inline void tlb_flush_all_cpus(CPUState *src_cpu)
-{
-}
 static inline void tlb_flush_all_cpus_synced(CPUState *src_cpu)
 {
 }
@@ -311,20 +266,11 @@ static inline void tlb_flush_page_by_mmuidx(CPUState *cpu,
 static inline void tlb_flush_by_mmuidx(CPUState *cpu, uint16_t idxmap)
 {
 }
-static inline void tlb_flush_page_by_mmuidx_all_cpus(CPUState *cpu,
-                                                     vaddr addr,
-                                                     uint16_t idxmap)
-{
-}
 static inline void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                             vaddr addr,
                                                             uint16_t idxmap)
 {
 }
-static inline void tlb_flush_by_mmuidx_all_cpus(CPUState *cpu, uint16_t idxmap)
-{
-}
-
 static inline void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                        uint16_t idxmap)
 {
@@ -335,12 +281,6 @@ static inline void tlb_flush_page_bits_by_mmuidx(CPUState *cpu,
                                                  unsigned bits)
 {
 }
-static inline void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *cpu,
-                                                          vaddr addr,
-                                                          uint16_t idxmap,
-                                                          unsigned bits)
-{
-}
 static inline void
 tlb_flush_page_bits_by_mmuidx_all_cpus_synced(CPUState *cpu, vaddr addr,
                                               uint16_t idxmap, unsigned bits)
@@ -351,13 +291,6 @@ static inline void tlb_flush_range_by_mmuidx(CPUState *cpu, vaddr addr,
                                              unsigned bits)
 {
 }
-static inline void tlb_flush_range_by_mmuidx_all_cpus(CPUState *cpu,
-                                                      vaddr addr,
-                                                      vaddr len,
-                                                      uint16_t idxmap,
-                                                      unsigned bits)
-{
-}
 static inline void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                              vaddr addr,
                                                              vaddr len,
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 93b1ca810b..8ff3aa5e50 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -379,21 +379,6 @@ void tlb_flush(CPUState *cpu)
     tlb_flush_by_mmuidx(cpu, ALL_MMUIDX_BITS);
 }
 
-void tlb_flush_by_mmuidx_all_cpus(CPUState *src_cpu, uint16_t idxmap)
-{
-    const run_on_cpu_func fn = tlb_flush_by_mmuidx_async_work;
-
-    tlb_debug("mmu_idx: 0x%"PRIx16"\n", idxmap);
-
-    flush_all_helper(src_cpu, fn, RUN_ON_CPU_HOST_INT(idxmap));
-    fn(src_cpu, RUN_ON_CPU_HOST_INT(idxmap));
-}
-
-void tlb_flush_all_cpus(CPUState *src_cpu)
-{
-    tlb_flush_by_mmuidx_all_cpus(src_cpu, ALL_MMUIDX_BITS);
-}
-
 void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *src_cpu, uint16_t idxmap)
 {
     const run_on_cpu_func fn = tlb_flush_by_mmuidx_async_work;
@@ -604,46 +589,6 @@ void tlb_flush_page(CPUState *cpu, vaddr addr)
     tlb_flush_page_by_mmuidx(cpu, addr, ALL_MMUIDX_BITS);
 }
 
-void tlb_flush_page_by_mmuidx_all_cpus(CPUState *src_cpu, vaddr addr,
-                                       uint16_t idxmap)
-{
-    tlb_debug("addr: %016" VADDR_PRIx " mmu_idx:%"PRIx16"\n", addr, idxmap);
-
-    /* This should already be page aligned */
-    addr &= TARGET_PAGE_MASK;
-
-    /*
-     * Allocate memory to hold addr+idxmap only when needed.
-     * See tlb_flush_page_by_mmuidx for details.
-     */
-    if (idxmap < TARGET_PAGE_SIZE) {
-        flush_all_helper(src_cpu, tlb_flush_page_by_mmuidx_async_1,
-                         RUN_ON_CPU_TARGET_PTR(addr | idxmap));
-    } else {
-        CPUState *dst_cpu;
-
-        /* Allocate a separate data block for each destination cpu.  */
-        CPU_FOREACH(dst_cpu) {
-            if (dst_cpu != src_cpu) {
-                TLBFlushPageByMMUIdxData *d
-                    = g_new(TLBFlushPageByMMUIdxData, 1);
-
-                d->addr = addr;
-                d->idxmap = idxmap;
-                async_run_on_cpu(dst_cpu, tlb_flush_page_by_mmuidx_async_2,
-                                 RUN_ON_CPU_HOST_PTR(d));
-            }
-        }
-    }
-
-    tlb_flush_page_by_mmuidx_async_0(src_cpu, addr, idxmap);
-}
-
-void tlb_flush_page_all_cpus(CPUState *src, vaddr addr)
-{
-    tlb_flush_page_by_mmuidx_all_cpus(src, addr, ALL_MMUIDX_BITS);
-}
-
 void tlb_flush_page_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                                               vaddr addr,
                                               uint16_t idxmap)
@@ -835,54 +780,6 @@ void tlb_flush_page_bits_by_mmuidx(CPUState *cpu, vaddr addr,
     tlb_flush_range_by_mmuidx(cpu, addr, TARGET_PAGE_SIZE, idxmap, bits);
 }
 
-void tlb_flush_range_by_mmuidx_all_cpus(CPUState *src_cpu,
-                                        vaddr addr, vaddr len,
-                                        uint16_t idxmap, unsigned bits)
-{
-    TLBFlushRangeData d;
-    CPUState *dst_cpu;
-
-    /*
-     * If all bits are significant, and len is small,
-     * this devolves to tlb_flush_page.
-     */
-    if (bits >= TARGET_LONG_BITS && len <= TARGET_PAGE_SIZE) {
-        tlb_flush_page_by_mmuidx_all_cpus(src_cpu, addr, idxmap);
-        return;
-    }
-    /* If no page bits are significant, this devolves to tlb_flush. */
-    if (bits < TARGET_PAGE_BITS) {
-        tlb_flush_by_mmuidx_all_cpus(src_cpu, idxmap);
-        return;
-    }
-
-    /* This should already be page aligned */
-    d.addr = addr & TARGET_PAGE_MASK;
-    d.len = len;
-    d.idxmap = idxmap;
-    d.bits = bits;
-
-    /* Allocate a separate data block for each destination cpu.  */
-    CPU_FOREACH(dst_cpu) {
-        if (dst_cpu != src_cpu) {
-            TLBFlushRangeData *p = g_memdup(&d, sizeof(d));
-            async_run_on_cpu(dst_cpu,
-                             tlb_flush_range_by_mmuidx_async_1,
-                             RUN_ON_CPU_HOST_PTR(p));
-        }
-    }
-
-    tlb_flush_range_by_mmuidx_async_0(src_cpu, d);
-}
-
-void tlb_flush_page_bits_by_mmuidx_all_cpus(CPUState *src_cpu,
-                                            vaddr addr, uint16_t idxmap,
-                                            unsigned bits)
-{
-    tlb_flush_range_by_mmuidx_all_cpus(src_cpu, addr, TARGET_PAGE_SIZE,
-                                       idxmap, bits);
-}
-
 void tlb_flush_range_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
                                                vaddr addr,
                                                vaddr len,
-- 
2.43.0

