Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0958D65C56
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:34:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsaD-0001hH-1B; Wed, 17 Dec 2025 09:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZs-0001br-0K
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:34 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZm-00075z-Gr
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso69550055e9.0
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765981943; x=1766586743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fqLzxUppkUl4lLkDpbtOdJVjT4/H3/NN9CQYq0CLc6M=;
 b=QXpTDq2GdubbvkvEfPitHmSDILVDtYSxY6hv3mU516BO2XmW/kIYKyTJepGiHE7gU2
 aHcUFy/pzHcNUm1tmkNtOXuJb6KnUq2oFxaYQ1311q4iIm2ePxr08cPaLkGWPj6l2DUU
 O8wyWYnJ2+mVpSCUprj3xGxIIbJL66o3HzueCwTFnoNTNVCFzWAf7uvth5uQCcOEecn3
 cIWMHlmKsI1EDYWxViE3DHyxAxOE54XavK4i1IvFyXkx1+miX+FAXbzmZvteAeTTBBBG
 RhDRZyELQ6g35A7rmeOx066Gwtw111Q7AB01mnYw23YzfGaEGGjmxoNB4FYQS9Q8XWvN
 GQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765981943; x=1766586743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fqLzxUppkUl4lLkDpbtOdJVjT4/H3/NN9CQYq0CLc6M=;
 b=Q42glL8iHYCu2DeiSr/7TsLzF9Pausjtxk3HXbmAbT2LL8/t6G7iWk4qN7W/U+HtJc
 Hm1vA+puTg9qN2ezZw7kf4wd+k/pQXXWKprUk0iH4C2Qz+nYjB9lQS+9fd8Ue/DfZr/t
 E/yjZf16l7XHCWeIglMyNjlIZfb0kpov7P6PolC/AS3jte1uWsB7hinMFRsqYpQ3nQmW
 EAPZ6qAwG5LxYaWFblT1R/Nm2I+Rl39vuxiY0vUhZAL3JjQWrACmMGEoxnRqAFUZ+jI+
 LmklJIiRzazPgoJIlm/zHuUR2NmE5GJcJJU/o3SLnhU0d2mLHWyeVV8uop5sihY144Bt
 PxKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7ayG3WA+OPp49UH/l9J9l7CEypajF2n+p9t7QCmoduTBQkfrKuKxCtV9cfkuypVbIo1D7MKZFnw==@nongnu.org
X-Gm-Message-State: AOJu0YwRMhssl18zvbn3KjmgglsCzJvdGOUM2gm6BsqS/p+fUqw8/LBi
 tvdLR7ZiWYZpVr0/PIsZ6dOB8B+qGJItbhRbjtfYuUIFpvSozDwV8c0VpRVtkzKRlk4=
X-Gm-Gg: AY/fxX50LBjrcldhCXPY03AiRWTwpiKU8UuxgXj/PnJuloQXeayk24mFTvFea2ACPnZ
 z4ujU4RVoq8Tr/6h6VASQffiMpKEVMN4/o9RTKuVqAsqhCxMze/vOACR7gaiTSjFLBgsnTGcUyh
 KXw4ipU5BlbMEt/LXMunVo5c5a4RnA+5XL+8bNimQ4bl/4hzEjPpSKN6csI1AUQbJnQddq7acoN
 Ju/ZxckbB6hp31ZIF0P8YXGvPuu+1gsk0oBOVMxUoIz3w8qkTDUxUXuY9E8I+zJF7XiX5Llw/SQ
 bPfG6CRQujsPMfNt4EGaAc6G4RSYBRogSBp8WnUWGZUX76XzDpLokhnBC8j22d+b+YujtvsDVO1
 r+7mn+BkxFA2PnzMe7+y+pX4cW72LoarU3hYzn/1Hjzb+OI5cWW4sg/NQBT5OkVOmPPEb01MD0v
 YhbH1O3xqYfEBBFyhmh0yAwZ2kDKCPrROt/p55e2kqmUrDe1eAuVvAc5gAfnBp
X-Google-Smtp-Source: AGHT+IFoxo+TUGh02vEzLyb5bAM8cofU9QlTOJGWq9LzgozqJeytl50qEz4YfJUGXmLq82W8VNnw6w==
X-Received: by 2002:a05:600c:3f18:b0:477:93f7:bbc5 with SMTP id
 5b1f17b1804b1-47a992e2ed8mr144511625e9.10.1765981943462; 
 Wed, 17 Dec 2025 06:32:23 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd9936809sm32692345e9.6.2025.12.17.06.32.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:32:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/14] system/memory: Remove address_space_stl_notdirty and
 stl_phys_notdirty
Date: Wed, 17 Dec 2025 15:31:40 +0100
Message-ID: <20251217143150.94463-5-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217143150.94463-1-philmd@linaro.org>
References: <20251217143150.94463-1-philmd@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

stl_phys_notdirty() was added in commit 8df1cd076cc ("physical memory
access functions") as a (premature?) optimisation for the CODE path.
Meanwhile 20 years passed, we might never have understood / used it
properly; the code evolved and now the recommended way to access the
CODE path is via the cpu_ld/st_mmu*() API.

Remove both address_space_stl_notdirty() and stl_phys_notdirty()
leftovers.

Suggested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/memory.h        |  6 ------
 include/exec/memory_ldst.h.inc |  2 --
 system/memory_ldst.c.inc       | 39 ----------------------------------
 3 files changed, 47 deletions(-)

diff --git a/include/system/memory.h b/include/system/memory.h
index 3bd5ffa5e0d..e69171de05a 100644
--- a/include/system/memory.h
+++ b/include/system/memory.h
@@ -2850,12 +2850,6 @@ MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
 #define ARG1_DECL    AddressSpace *as
 #include "exec/memory_ldst.h.inc"
 
-static inline void stl_phys_notdirty(AddressSpace *as, hwaddr addr, uint32_t val)
-{
-    address_space_stl_notdirty(as, addr, val,
-                               MEMTXATTRS_UNSPECIFIED, NULL);
-}
-
 #define SUFFIX
 #define ARG1         as
 #define ARG1_DECL    AddressSpace *as
diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
index 7270235c600..173164fee3a 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -25,8 +25,6 @@ uint32_t glue(address_space_ldl, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
 uint64_t glue(address_space_ldq, SUFFIX)(ARG1_DECL,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result);
-void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stw, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result);
 void glue(address_space_stl, SUFFIX)(ARG1_DECL,
diff --git a/system/memory_ldst.c.inc b/system/memory_ldst.c.inc
index 333da209d1a..b45bfecd137 100644
--- a/system/memory_ldst.c.inc
+++ b/system/memory_ldst.c.inc
@@ -261,45 +261,6 @@ uint16_t glue(address_space_lduw_be, SUFFIX)(ARG1_DECL,
                                        DEVICE_BIG_ENDIAN);
 }
 
-/* warning: addr must be aligned. The ram page is not masked as dirty
-   and the code inside is not invalidated. It is useful if the dirty
-   bits are used to track modified PTEs */
-void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
-{
-    uint8_t *ptr;
-    MemoryRegion *mr;
-    hwaddr l = 4;
-    hwaddr addr1;
-    MemTxResult r;
-    uint8_t dirty_log_mask;
-    bool release_lock = false;
-
-    RCU_READ_LOCK();
-    mr = TRANSLATE(addr, &addr1, &l, true, attrs);
-    if (l < 4 || !memory_access_is_direct(mr, true, attrs)) {
-        release_lock |= prepare_mmio_access(mr);
-
-        r = memory_region_dispatch_write(mr, addr1, val, MO_32, attrs);
-    } else {
-        ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
-        stl_p(ptr, val);
-
-        dirty_log_mask = memory_region_get_dirty_log_mask(mr);
-        dirty_log_mask &= ~(1 << DIRTY_MEMORY_CODE);
-        physical_memory_set_dirty_range(memory_region_get_ram_addr(mr) + addr,
-                                            4, dirty_log_mask);
-        r = MEMTX_OK;
-    }
-    if (result) {
-        *result = r;
-    }
-    if (release_lock) {
-        bql_unlock();
-    }
-    RCU_READ_UNLOCK();
-}
-
 /* warning: addr must be aligned */
 static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
     hwaddr addr, uint32_t val, MemTxAttrs attrs,
-- 
2.52.0


