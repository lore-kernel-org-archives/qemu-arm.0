Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp179912njc;
        Thu, 18 Jul 2024 18:08:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUaBap7VLxsMZJEcJNcVRSUPj2G2rh7qH9KdqAx10hrNKUMue31/pu9+Enz0q/pf0eRU7py5USaQ9L0joMTYo63QDqdhr65
X-Google-Smtp-Source: AGHT+IGfz/rj3B/a/jqZw2DoanZAIrlHNgsDP0o9PPVlsJEmEI37mDBpgqSqj4HAp3i9PzLcZN0c
X-Received: by 2002:a0d:e0c4:0:b0:648:2c60:fdee with SMTP id 00721157ae682-664ff8da734mr75789487b3.38.1721351301034;
        Thu, 18 Jul 2024 18:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721351301; cv=none;
        d=google.com; s=arc-20160816;
        b=UBMRTP2iKB/7Q3MqmZ7n8BU/CilWcKRXsWB5Zn2e9FJqGDEv4/eVvoYAI30xQkneug
         nMtRJyaUNCHeopMNNRAKJ4cSSQKwL8MmMB0zrrvdtpru9FclOs0ay8+enQQvznD93cYJ
         TOEHTlY46stpp3CHTMJjuPwxFS4DpTxEaaGn90GFJlnlRRf9iy77ZiSnwYuoQCJKRVOA
         NsWz4JHDzRVEcyKk5mkkdwT/obSW/DbRwLAsYiuMbIgzeFA8vayomLbp1vjDymW4uefB
         8VWd+GCr07BKr0zLW/hFYkIBLGe5Z2TYFBBBSBD7Ck07q88WjresTwGzkFIt88pr5zxN
         zYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jMsQ8jSa2C8xRls4TTp8Ou8tDoyMnkK5KK/Q8+Xs4/o=;
        fh=PMD1cJf9IbYeK/VmAJgusCYc7DxmYIcIgC7fGquy+wg=;
        b=T+rXKAZSXZVZCD1aJBcC4Q9iepHKuD/oh2GXXZ28cenDzAlhmaZ9Yqp8D2GUEb5+I8
         V4Ws1WW/cvkDEJVdMZkFqJSO0loqnptJMes1SVN/3ZJdu584CyEkaq/Dim0cToRjV4MC
         1y4AiXohtFWTGnTxp7RCebUY2GVpAmPW5US6oBROSJZCGh0w8Ps8I6b9p1CdFicHUaJK
         tEcNDeTiCNVwCbn2MQBh+iCzr08cP6rAKlYDAfbY6p8qU+K9yeityP057tHqlX+uzeCZ
         gbr+LpyTZnIfpElXiFl9r8kS91zfoDW7WDY8p6DkPCooQuqc4lFjMpIbqQoIWxIwxAQU
         0JtA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I0/VwhUz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a199066e8csi49982485a.464.2024.07.18.18.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2024 18:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I0/VwhUz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUc6H-0004E4-1V; Thu, 18 Jul 2024 21:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5u-00037p-EU
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:35 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sUc5n-0000kp-8Z
 for qemu-arm@nongnu.org; Thu, 18 Jul 2024 21:07:30 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1fc6ee64512so7179015ad.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jul 2024 18:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721351245; x=1721956045; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMsQ8jSa2C8xRls4TTp8Ou8tDoyMnkK5KK/Q8+Xs4/o=;
 b=I0/VwhUzsyxWIvd0RxFcBcFTCiHJs+Zhs7yG41Ti9MUJQI9DjNn1Arh9YmolF6Geyg
 QRutRHCsqF+8gqVwEJ8/a6u0BPtM4NGyYdGGmeQIE4IOw8oIDe3Yuw8JQSCKzA0Xnbc6
 ywYkZD8wcVjx9Vpsr3UUztTWdg9AJnbdxFPCl8a4HtB3cTuTIWQI++gf2PkI/3xonm5Q
 0yKHvobfctF+cI3LbQX+4a5ydblHdth0XhOJQabyvuiXtZucOsSfnMxjaGiFBrDEba1Z
 +OhoAGdCdPUO4e9Ut/BKm1ig9w7ogUCRLaKmUlXVoeCZh7TkfJC+zu5FjJCAcpioKMpT
 sXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721351245; x=1721956045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jMsQ8jSa2C8xRls4TTp8Ou8tDoyMnkK5KK/Q8+Xs4/o=;
 b=INb78ECIv2wjto2PcPP2j0bZex/pyGUjqLpghy2G3O52W22vKrKIY+h5mOQEH0glHh
 D2Tw/gRQ5uO8LxGSqislpyc78XlXWWPItWElnUxZXTGnCpfhjoMmzrmcPwTnNyMNUDIN
 s6A1GI7MjEJ/qbxcehH6kymOA/UxllVB4lGc5wcESlSy6Hn/r/y44qtVTCYUl4GN7GJ+
 Wl9heQSsnxdC8MAZLsPURJ0yWLp2+z2PyjfEsyLuY0Fu3ZHGg6sBpbGyCtJlxlVsiDNK
 lGuaBIJwhl1wwfhxYHKk/FNp55UMv0p09zvpj63rKrdY5G0Qv1G0BNSxWBpL3Ws479ba
 ikFA==
X-Gm-Message-State: AOJu0YzlLsP4XPrJE8PDdk16LJuFh1paJq/59YoBV9oWQj7Q5VG366zX
 +qCOIL0QXn913U7CSD2uCcp5hoxpWOwu/nUT3pu+hr6REH7+/d1yXxG7hbrLu/g=
X-Received: by 2002:a17:903:1c5:b0:1fb:7e12:ee3a with SMTP id
 d9443c01a7336-1fc4e1318bbmr55951805ad.24.1721351244933; 
 Thu, 18 Jul 2024 18:07:24 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd64d07ad9sm2067415ad.177.2024.07.18.18.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 18:07:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 03/12] target/arm: Use set/clear_helper_retaddr in SVE and
 SME helpers
Date: Fri, 19 Jul 2024 11:06:58 +1000
Message-ID: <20240719010707.1319675-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719010707.1319675-1-richard.henderson@linaro.org>
References: <20240719010707.1319675-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: 37
X-Spam_score: 3.7
X-Spam_bar: +++
X-Spam_report: (3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: bYsq+I1DeG0W

Avoid a race condition with munmap in another thread.
Use around blocks that exclusively use "host_fn".
Keep the blocks as small as possible, but without setting
and clearing for every operation on one page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c | 16 ++++++++++++++
 target/arm/tcg/sve_helper.c | 42 +++++++++++++++++++++++++++++--------
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index e2e0575039..ab40ced38f 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -517,6 +517,8 @@ void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
         clr_fn(za, 0, reg_off);
     }
 
+    set_helper_retaddr(ra);
+
     while (reg_off <= reg_last) {
         uint64_t pg = vg[reg_off >> 6];
         do {
@@ -529,6 +531,8 @@ void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
         } while (reg_off <= reg_last && (reg_off & 63));
     }
 
+    clear_helper_retaddr();
+
     /*
      * Use the slow path to manage the cross-page misalignment.
      * But we know this is RAM and cannot trap.
@@ -543,6 +547,8 @@ void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
         reg_last = info.reg_off_last[1];
         host = info.page[1].host;
 
+        set_helper_retaddr(ra);
+
         do {
             uint64_t pg = vg[reg_off >> 6];
             do {
@@ -554,6 +560,8 @@ void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
                 reg_off += esize;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
+
+        clear_helper_retaddr();
     }
 }
 
@@ -701,6 +709,8 @@ void sme_st1(CPUARMState *env, void *za, uint64_t *vg,
     reg_last = info.reg_off_last[0];
     host = info.page[0].host;
 
+    set_helper_retaddr(ra);
+
     while (reg_off <= reg_last) {
         uint64_t pg = vg[reg_off >> 6];
         do {
@@ -711,6 +721,8 @@ void sme_st1(CPUARMState *env, void *za, uint64_t *vg,
         } while (reg_off <= reg_last && (reg_off & 63));
     }
 
+    clear_helper_retaddr();
+
     /*
      * Use the slow path to manage the cross-page misalignment.
      * But we know this is RAM and cannot trap.
@@ -725,6 +737,8 @@ void sme_st1(CPUARMState *env, void *za, uint64_t *vg,
         reg_last = info.reg_off_last[1];
         host = info.page[1].host;
 
+        set_helper_retaddr(ra);
+
         do {
             uint64_t pg = vg[reg_off >> 6];
             do {
@@ -734,6 +748,8 @@ void sme_st1(CPUARMState *env, void *za, uint64_t *vg,
                 reg_off += 1 << esz;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
+
+        clear_helper_retaddr();
     }
 }
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index dd49e67d7a..f1ee0e060f 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5738,6 +5738,8 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
     reg_last = info.reg_off_last[0];
     host = info.page[0].host;
 
+    set_helper_retaddr(retaddr);
+
     while (reg_off <= reg_last) {
         uint64_t pg = vg[reg_off >> 6];
         do {
@@ -5752,6 +5754,8 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
         } while (reg_off <= reg_last && (reg_off & 63));
     }
 
+    clear_helper_retaddr();
+
     /*
      * Use the slow path to manage the cross-page misalignment.
      * But we know this is RAM and cannot trap.
@@ -5771,6 +5775,8 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
         reg_last = info.reg_off_last[1];
         host = info.page[1].host;
 
+        set_helper_retaddr(retaddr);
+
         do {
             uint64_t pg = vg[reg_off >> 6];
             do {
@@ -5784,6 +5790,8 @@ void sve_ldN_r(CPUARMState *env, uint64_t *vg, const target_ulong addr,
                 mem_off += N << msz;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
+
+        clear_helper_retaddr();
     }
 }
 
@@ -5934,15 +5942,11 @@ DO_LDN_2(4, dd, MO_64)
 /*
  * Load contiguous data, first-fault and no-fault.
  *
- * For user-only, one could argue that we should hold the mmap_lock during
- * the operation so that there is no race between page_check_range and the
- * load operation.  However, unmapping pages out from under a running thread
- * is extraordinarily unlikely.  This theoretical race condition also affects
- * linux-user/ in its get_user/put_user macros.
- *
- * TODO: Construct some helpers, written in assembly, that interact with
- * host_signal_handler to produce memory ops which can properly report errors
- * without racing.
+ * For user-only, we control the race between page_check_range and
+ * another thread's munmap by using set/clear_helper_retaddr.  Any
+ * SEGV that occurs between those markers is assumed to be because
+ * the guest page vanished.  Keep that block as small as possible
+ * so that unrelated QEMU bugs are not blamed on the guest.
  */
 
 /* Fault on byte I.  All bits in FFR from I are cleared.  The vector
@@ -6093,6 +6097,8 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     reg_last = info.reg_off_last[0];
     host = info.page[0].host;
 
+    set_helper_retaddr(retaddr);
+
     do {
         uint64_t pg = *(uint64_t *)(vg + (reg_off >> 3));
         do {
@@ -6101,9 +6107,11 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
                     (cpu_watchpoint_address_matches
                      (env_cpu(env), addr + mem_off, 1 << msz)
                      & BP_MEM_READ)) {
+                    clear_helper_retaddr();
                     goto do_fault;
                 }
                 if (mtedesc && !mte_probe(env, mtedesc, addr + mem_off)) {
+                    clear_helper_retaddr();
                     goto do_fault;
                 }
                 host_fn(vd, reg_off, host + mem_off);
@@ -6113,6 +6121,8 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         } while (reg_off <= reg_last && (reg_off & 63));
     } while (reg_off <= reg_last);
 
+    clear_helper_retaddr();
+
     /*
      * MemSingleNF is allowed to fail for any reason.  We have special
      * code above to handle the first element crossing a page boundary.
@@ -6348,6 +6358,8 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
     reg_last = info.reg_off_last[0];
     host = info.page[0].host;
 
+    set_helper_retaddr(retaddr);
+
     while (reg_off <= reg_last) {
         uint64_t pg = vg[reg_off >> 6];
         do {
@@ -6362,6 +6374,8 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
         } while (reg_off <= reg_last && (reg_off & 63));
     }
 
+    clear_helper_retaddr();
+
     /*
      * Use the slow path to manage the cross-page misalignment.
      * But we know this is RAM and cannot trap.
@@ -6381,6 +6395,8 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
         reg_last = info.reg_off_last[1];
         host = info.page[1].host;
 
+        set_helper_retaddr(retaddr);
+
         do {
             uint64_t pg = vg[reg_off >> 6];
             do {
@@ -6394,6 +6410,8 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
                 mem_off += N << msz;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
+
+        clear_helper_retaddr();
     }
 }
 
@@ -6560,7 +6578,9 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     if (unlikely(info.flags & TLB_MMIO)) {
                         tlb_fn(env, &scratch, reg_off, addr, retaddr);
                     } else {
+                        set_helper_retaddr(retaddr);
                         host_fn(&scratch, reg_off, info.host);
+                        clear_helper_retaddr();
                     }
                 } else {
                     /* Element crosses the page boundary. */
@@ -6782,7 +6802,9 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     goto fault;
                 }
 
+                set_helper_retaddr(retaddr);
                 host_fn(vd, reg_off, info.host);
+                clear_helper_retaddr();
             }
             reg_off += esize;
         } while (reg_off & 63);
@@ -6986,7 +7008,9 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     do {
         void *h = host[i];
         if (likely(h != NULL)) {
+            set_helper_retaddr(retaddr);
             host_fn(vd, reg_off, h);
+            clear_helper_retaddr();
         } else if ((vg[reg_off >> 6] >> (reg_off & 63)) & 1) {
             target_ulong addr = base + (off_fn(vm, reg_off) << scale);
             tlb_fn(env, vd, reg_off, addr, retaddr);
-- 
2.43.0

