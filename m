Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B69E77361
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 15:16:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYQag-0003bn-NR; Wed, 24 Dec 2025 10:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQZf-0002QQ-8L
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:14:57 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYQZa-000340-EX
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 10:14:49 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64bea6c5819so6260193a12.3
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 07:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766589283; x=1767194083; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1b6x18riFiHnFkkcqn+CtPN4j8BBN9191Tesnu/1k0=;
 b=spiv030viaOWA6OU7NT5FMY9cfOHxzGiyYsqM6HS/MrDgkUyKWHVm9HxVodg0m2Xm1
 Z6zJOTKboOmT01s+izUb7CmXi+1rCeBiy2pfnVt/soR43I+sES+O0oEYcgug5aDZMK35
 DHVvVSzj6YE0ImVwI5Di3bQQLC/6KNIJyRloMxCEAMioTyN9/kr3DsT2Ry4XvKIr5O1k
 S+o9VYR+bl0MFlb0QAvqNDESYS4Mqnqmtm7+X7n695cuLCYjs/aY/y1TUlk/A7fQGdZJ
 qddpJXTcq9WrMDd7Ke+6N3bfdVkPOjaeEeZJGMsE+88QEkj5EsBUv6l/vDzF7GVRAT3l
 9YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766589283; x=1767194083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=B1b6x18riFiHnFkkcqn+CtPN4j8BBN9191Tesnu/1k0=;
 b=M7hfnGeq3o4Bts/z7vYI9rkOtmYrW5bM+RmQ4jzYZe4RwZhkEjw9ZKB1T0s7F7QgqR
 7MFjGWO/0zGm95yzeOkFCDtokP9pgYtzNuTPMVY4ws7+4x4a3H4tUFGGCiAd3yh+qrBI
 dOVCzBwhlM2+NrQ5Qqhh/9iOWmqBqk4rBfIxcJUgYo0wASTKEZBsGPJCndUHzJA0ucmk
 TJSWrqXFOytZDEYfoZI0VKxp0DuDanbjz8KlXzOPX+m9ZGuf1Hrq8hxjlLhcq8IeANkX
 3+1r4s3/2FLld9+tE+pKkg6vSQER4JOzflc/ZZrxGMt5dl0BZvtKRBpX1ouqPVl/bmQv
 ypug==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWzWhNFZ0x9bRQKKHKavXzfV954ptaIo5EWBKIo8wczu9nQHJRXl4OavMRcdhsYmu+54wBf3vCSw==@nongnu.org
X-Gm-Message-State: AOJu0YzR0TnHwS48eImoJB8Efe1YpjMtecGbMXQqxfUBJ4VgzujmXBmR
 T8cZSS6Y2XbZGpdNagijv4RAOSDFCmSfj3x5s86wS/h7FBPZK5vab4Ns2BAT6Ywxa6IFWQ/0G/h
 bVdayFIg=
X-Gm-Gg: AY/fxX7JGsRQgfybymdXDtCvJJTty0b8BbNl7bG6p/aNPTVMN5EarBKFV/ymUczBWry
 efioGxjZVX3c3822B7LcmZnNBnibhiWkKlsmGRMRE/W2ur4fqdMtDkuI3INiwl54Q6NpRgzWxH2
 C91F6IY6lL2EUaqSREukc3/ws4sOSBqoniDs6I9g2PcD350TdEYIotoPAPP4iX/nFDE+2IPKMol
 EB02x1u7vUIONWcUGUI5Yb33SCAN0eNT6UW1MMGjwaNgedHeZStFWOOXglBh0tqV4O3JrJHme9B
 rfg8Dljg8Ky43gIqmZ2o0Xb4/WB7A+8FrmEK03Qm3jqCpSpaTAyZ/DJKBc3aLcIwfZYdH9d10rW
 u8GaIziMvCBOig/KB7PYNFPPbJv33YYP7zFd621zG9Upp9KS8kfVkXAN3arWGJovr4cPhU1Cjvf
 MdMag1PRKI8o0ikZ0PWRSNZKmkDt9kVmmXcccJAKCIvwI5r4958UsC5Lg=
X-Google-Smtp-Source: AGHT+IGTA1F9pGUvnOxUvBAxEuM5CajhpP2d4b0KJNCfBuEsjq+HRDLQvm8HHAx9wQXKy+k4QHriRw==
X-Received: by 2002:a17:906:c109:b0:b80:325d:99e2 with SMTP id
 a640c23a62f3a-b803705ddb6mr1961657066b.33.1766589283089; 
 Wed, 24 Dec 2025 07:14:43 -0800 (PST)
Received: from localhost.localdomain (188.171.88.92.rev.sfr.net.
 [92.88.171.188]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8080e2177csm782017566b.68.2025.12.24.07.14.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 07:14:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Weiwei Li <liwei1518@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, David Hildenbrand <david@kernel.org>,
 qemu-riscv@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Troy Lee <leetroy@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zhao Liu <zhao1.liu@intel.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/9] system/memory: Remove address_space_stl_notdirty and
 stl_phys_notdirty
Date: Wed, 24 Dec 2025 16:13:45 +0100
Message-ID: <20251224151351.86733-5-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224151351.86733-1-philmd@linaro.org>
References: <20251224151351.86733-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
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
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


