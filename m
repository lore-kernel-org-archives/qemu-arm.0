Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DBACCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:18:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yRq-0003C1-8D; Wed, 01 Oct 2025 11:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yRD-0002Bd-Io
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:08:16 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPj-0000lh-B0
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:08:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e317bc647so47945605e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331198; x=1759935998; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKIJiurQy11fAb1+UubMdJKdkBS0bnFi1raQMLM9p9c=;
 b=AhH6UJyKzJ4WpArAUUL0U1vvEImeSuuIptLL2G+HK53UsIuyW0sYHTZaIFiFQSeh3Z
 z+fRb5fPBvaRCDJZgfAez62yhwxKSBsAvO9y7CR/vgr9zX+WKARq8y6J5/Jd7KVD6Lry
 cRJPOzHmfWHpKmEzgO6fHDlGwhg/EPQ2R9RMUEXYRQTAhZaenPRhTn8NICz6koEjAHmn
 TX1rkz35Inj4mPIDJ+6IA3RyCQ7fCEl4SmunH0mVPd/IolfGt/Si53Rcc796uffMMJWH
 3dBIRKxNu1C4rRzKhy34unlLH4C5WMqQFRctZwjArlfcBnGnm0z8MRsPJuH0d2vr1zkz
 cY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331198; x=1759935998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKIJiurQy11fAb1+UubMdJKdkBS0bnFi1raQMLM9p9c=;
 b=JMsuYbCOB1TRv+qzuuqfk2epa4UW1bZl9DvLdrLLROfxkm2BSDr0RnyjHnihZAQMqv
 p4AQab4iJgQMjAc2O4EVjBm392Pvbjakp38fgI2A4ON62N/NMI5gI3uZGsNujbL2Lvom
 mrSScIJy81tfIMR+EY54/VIIcqrROaPKKrC+IGD45ggfOwia5nAqWArKwWCDXf69R2su
 HgFNB5Ob1GnjANWnOm/fkn8/3mip04nqxPJnBPdP4Y7IsFL0o1gm5I1Z7y/4S/3BzY5G
 FCTWVbtXu5Kh067RzOEkMwR3obayvUkaqNJvKasaA6fC0seR3UUBY1Zp5vPMoNrfVZZu
 NSgA==
X-Gm-Message-State: AOJu0YzGLqsN/iKrQaLTCQ6egmW79DyOUPH0EfW+GwgryWW+fXz05nkv
 w7tqrEruCcZp8Qy1uSG/tqGhNl/c49ATnAERtemw782+uq2GFvVARl4SxcvyS55wbp4=
X-Gm-Gg: ASbGncudN1UMBdBuaL4uqb6fnhjwcAXrFsWhUfR8V/NKDKkIQSnXmB4qvZgoV4bTTa0
 RRCJ+6LpgJoY87+Glu6OZO20M+rEm21mSitVY5BkVBn8zJJyQBdU4VI8AiLImpF2fRFUSH8FtkZ
 eAhP4tpW+E7AlhCifD/138BMHkCMZLwtPnhtrpEsNPSnknBX4UuaHTqA4QvFYD1J4xJeh2QQAgH
 fmHWkRqlXJx9S9NW59yicUXrR48EDTTGasDEztwi8NP54qE592fRUsZxheO76KVJOeUvt11ai8k
 2+L/vDLRu6URvua2Y+SSh3y74FbNdTmV9gwjDVhtcgP5CErJp/oLCuZYHtjftQY/iwAPqRppand
 EG+mfDuMWFheL3/ueLcdO9prtyhurDxfh6TWL/hYB7TiaxjbCjvWD733HNZ3JGnZDPzcBbIEyG6
 XcRFBhHwvndoCS7St6Y8XO
X-Google-Smtp-Source: AGHT+IFyi3wB+ED6O52P0EVUdsoFZprWN7mLrwrybDjTk8VfikX41h8QHP87F214i0CStGpv2q5UhQ==
X-Received: by 2002:a05:600c:6094:b0:45d:d88b:cca with SMTP id
 5b1f17b1804b1-46e6125cf67mr30485905e9.1.1759331197898; 
 Wed, 01 Oct 2025 08:06:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a0241bsm41643575e9.11.2025.10.01.08.06.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 13/22] target/i386: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:18 +0200
Message-ID: <20251001150529.14122-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/arch_memory_mapping.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/i386/arch_memory_mapping.c b/target/i386/arch_memory_mapping.c
index 560f4689abc..809c4cb0298 100644
--- a/target/i386/arch_memory_mapping.c
+++ b/target/i386/arch_memory_mapping.c
@@ -273,12 +273,14 @@ bool x86_cpu_get_memory_mapping(CPUState *cs, MemoryMappingList *list,
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
     int32_t a20_mask;
+    AddressSpace *as;
 
     if (!cpu_paging_enabled(cs)) {
         /* paging is disabled */
         return true;
     }
 
+    as = cpu_get_address_space(cs, 0);
     a20_mask = x86_get_a20_mask(env);
     if (env->cr[4] & CR4_PAE_MASK) {
 #ifdef TARGET_X86_64
@@ -287,12 +289,12 @@ bool x86_cpu_get_memory_mapping(CPUState *cs, MemoryMappingList *list,
                 hwaddr pml5e_addr;
 
                 pml5e_addr = (env->cr[3] & PLM4_ADDR_MASK) & a20_mask;
-                walk_pml5e(list, cs->as, pml5e_addr, a20_mask);
+                walk_pml5e(list, as, pml5e_addr, a20_mask);
             } else {
                 hwaddr pml4e_addr;
 
                 pml4e_addr = (env->cr[3] & PLM4_ADDR_MASK) & a20_mask;
-                walk_pml4e(list, cs->as, pml4e_addr, a20_mask,
+                walk_pml4e(list, as, pml4e_addr, a20_mask,
                         0xffffULL << 48);
             }
         } else
@@ -301,7 +303,7 @@ bool x86_cpu_get_memory_mapping(CPUState *cs, MemoryMappingList *list,
             hwaddr pdpe_addr;
 
             pdpe_addr = (env->cr[3] & ~0x1f) & a20_mask;
-            walk_pdpe2(list, cs->as, pdpe_addr, a20_mask);
+            walk_pdpe2(list, as, pdpe_addr, a20_mask);
         }
     } else {
         hwaddr pde_addr;
@@ -309,7 +311,7 @@ bool x86_cpu_get_memory_mapping(CPUState *cs, MemoryMappingList *list,
 
         pde_addr = (env->cr[3] & ~0xfff) & a20_mask;
         pse = !!(env->cr[4] & CR4_PSE_MASK);
-        walk_pde2(list, cs->as, pde_addr, a20_mask, pse);
+        walk_pde2(list, as, pde_addr, a20_mask, pse);
     }
 
     return true;
-- 
2.51.0


