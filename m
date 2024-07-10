Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp118198njb;
        Tue, 9 Jul 2024 20:31:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoyWVOjFg+OMuwrFKNRoS1Im/qRKiUf9RVWJ/pjHStEzsC9Dbp/redm4Bo5ejXyXTUjM1UtOUDWjDztRjJ4B9NGfogn6my
X-Google-Smtp-Source: AGHT+IE02ZFtqkltv0OzK8zvS9LRuCnAJeYio+IU51kPYT2ZQE/5CNkEhyAcJoWo8MtQ8Ph4QwFJ
X-Received: by 2002:a05:620a:893:b0:79f:67b:5004 with SMTP id af79cd13be357-79f19a509e1mr411302185a.38.1720582269151;
        Tue, 09 Jul 2024 20:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720582269; cv=none;
        d=google.com; s=arc-20160816;
        b=z2SCXnQ11TIcPe5eABY6rfqchy4jlSi8w31Sx0oyJhl9T4QIWQRxeyh61mNRybvLyq
         U05Z7LCnY8CVr7OxW5/dyzBPYyDdKUo8/hEldmqwAFhz6AVC1qZvzlEe3aeGt/tlIOh9
         og2TWHDrkl5pUJR1viqyeWC8hDq64MmsKM6w5z8NkbwcJfc/GhOtkue3BkaOYssYdVhI
         Cg0NhTAEFyYvVsRz8Y4zwRV2SaLYzmFhx9+gq8ZItsR7kMKynDk9IsMiOWV37TwtwrKl
         JJ1NXHFuOCCiBtLrpmMtsSCP/XdbjSkWZ0W2NubRhvxppkRWPQJsifkuOPOex/XO6Bd9
         IWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sb62XWFDa9Gh05Ca0jxdQeAaMaUiQWBTgpRySguRiT4=;
        fh=ghNV7mL7MT64gEZ5PHgzOSgxQoCZ3IZKAHIIlbKGaqE=;
        b=1DjS5v5F9NBBDswvNA5IcJWnYt8MF3B5QjUCegLVD6HRCwor4IGMI8UtGa3R44Om0z
         nSo+qN95cAkWtOZQKEGKsPdVkVbcyOzLpgCOB76kXGLxgQNoAkFgls0XcOJWfYi7zUpk
         tbyGLPJ7z6PFz++Ntslm0FUwf502MPSDeHQ76s0FUYCJflQ+hUjAlG69s4hSXDtGS/Qj
         lt6BwifmxLukpvgKHAZnF1YOKmkQE3HpQ2Qr3eqHDWeVtCkH46/04nnKnzCTPfrBii30
         2Uq+4KXRrVZY52IBbiJmsJUl31V+ZrvGwnl2CXB+3+xcypabSw/FeLjhVe0ac2oYF0bM
         FphA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LPpU++pf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190b7ac6si361419985a.454.2024.07.09.20.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 20:31:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LPpU++pf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRO0N-0008UG-Lp; Tue, 09 Jul 2024 23:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0M-0008Mw-5A
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 23:28:30 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sRO0E-0003jl-71
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 23:28:28 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7039e4a4a03so686674a34.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 20:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720582100; x=1721186900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sb62XWFDa9Gh05Ca0jxdQeAaMaUiQWBTgpRySguRiT4=;
 b=LPpU++pfEDsPqHCSHfgECniQSRYYT6Ll+4OuFGhVGdriXQinohYfIxOXxlVDVTkeM1
 8fy8Hfu/fmwHfVZL4KOGXq3FKCd0zTK28iLOcg0GTL7WvY2TWjXPAM1atrHSPgoxab2Q
 v9xa716IvRE5V1uURP8QMLXYCSwbYjQ+ER6topnnFqaq58/FPk2oW3n9qRvWoJ2ecYZz
 ZhzR+Em5eDQ91q20t3rqjPZI+suAdOrIslmAl+GveoEOrUrHVWtwL5sms6nMsRMRj6kA
 odrMgsgy65vdJL9pr5cRdWYDMpMTBrutbzQrWfzyTQx1tZRIPdPaGZxx6cvfNwahKRve
 WaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720582100; x=1721186900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sb62XWFDa9Gh05Ca0jxdQeAaMaUiQWBTgpRySguRiT4=;
 b=q8H47lYA3DmkuxcXb57k3tBXbj8xvUbYGOSvVJsAWDI56sKH8CSQau9AfVA0/p64dG
 0hjSMdlVzj41d1/VLi73S5mtck3jmAazWdPhHErKfkxMM7lEf5Qco6xOnIZ9YeJRejW9
 LUQb//DRNtPg76favmwDP8jBt5CiF3R6Ty6t0R/+LIPbZBemegQ8zHT8k+Yinf4ab6tf
 WoEHcDVNynZDOUtDfLRhiH02KmxdHsaAW1RvKT8Jx8XaC80tM0UdIngmA9PIHrIkxw7M
 zfO1QeBagpn9ot8ZReXl5uGhqzYKEAsAUFL1Pgu3JIp+bOn1GR7f+goz5PgCj+2fts/5
 QfEg==
X-Gm-Message-State: AOJu0YxUBLcJp6Egnm8NlWuiEfKPiIPsSXCWXENYQlUKyezuvlPUfNGU
 qO24Y1xvO/eg/fwttqdwGtTBEB3FCQd02dizwWcBDtjvIUm8tihp54P2OETZ5i8=
X-Received: by 2002:a9d:66d6:0:b0:704:45b5:6464 with SMTP id
 46e09a7af769-70445b56aafmr2493074a34.29.1720582100227; 
 Tue, 09 Jul 2024 20:28:20 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b438f5679sm2687280b3a.90.2024.07.09.20.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 20:28:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, max.chou@sifive.com
Subject: [PATCH v2 04/13] target/arm: Use set/clear_helper_retaddr in SVE and
 SME helpers
Date: Tue,  9 Jul 2024 20:28:05 -0700
Message-ID: <20240710032814.104643-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710032814.104643-1-richard.henderson@linaro.org>
References: <20240710032814.104643-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: j0WVDBPJ7mpY

Avoid a race condition with munmap in another thread.
Use around blocks that exclusively use "host_fn".
Keep the blocks as small as possible, but without setting
and clearing for every operation on one page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c | 16 ++++++++++++++++
 target/arm/tcg/sve_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

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
index dd49e67d7a..8d0af4bb1c 100644
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
 
@@ -6093,6 +6101,8 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
     reg_last = info.reg_off_last[0];
     host = info.page[0].host;
 
+    set_helper_retaddr(retaddr);
+
     do {
         uint64_t pg = *(uint64_t *)(vg + (reg_off >> 3));
         do {
@@ -6113,6 +6123,8 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
         } while (reg_off <= reg_last && (reg_off & 63));
     } while (reg_off <= reg_last);
 
+    clear_helper_retaddr();
+
     /*
      * MemSingleNF is allowed to fail for any reason.  We have special
      * code above to handle the first element crossing a page boundary.
@@ -6348,6 +6360,8 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
     reg_last = info.reg_off_last[0];
     host = info.page[0].host;
 
+    set_helper_retaddr(retaddr);
+
     while (reg_off <= reg_last) {
         uint64_t pg = vg[reg_off >> 6];
         do {
@@ -6362,6 +6376,8 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
         } while (reg_off <= reg_last && (reg_off & 63));
     }
 
+    clear_helper_retaddr();
+
     /*
      * Use the slow path to manage the cross-page misalignment.
      * But we know this is RAM and cannot trap.
@@ -6381,6 +6397,8 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
         reg_last = info.reg_off_last[1];
         host = info.page[1].host;
 
+        set_helper_retaddr(retaddr);
+
         do {
             uint64_t pg = vg[reg_off >> 6];
             do {
@@ -6394,6 +6412,8 @@ void sve_stN_r(CPUARMState *env, uint64_t *vg, target_ulong addr,
                 mem_off += N << msz;
             } while (reg_off & 63);
         } while (reg_off <= reg_last);
+
+        clear_helper_retaddr();
     }
 }
 
@@ -6560,7 +6580,9 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     if (unlikely(info.flags & TLB_MMIO)) {
                         tlb_fn(env, &scratch, reg_off, addr, retaddr);
                     } else {
+                        set_helper_retaddr(retaddr);
                         host_fn(&scratch, reg_off, info.host);
+                        clear_helper_retaddr();
                     }
                 } else {
                     /* Element crosses the page boundary. */
@@ -6782,7 +6804,9 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     goto fault;
                 }
 
+                set_helper_retaddr(retaddr);
                 host_fn(vd, reg_off, info.host);
+                clear_helper_retaddr();
             }
             reg_off += esize;
         } while (reg_off & 63);
@@ -6986,7 +7010,9 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
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

