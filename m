Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F9FCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:18:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yRM-0002Kx-N9; Wed, 01 Oct 2025 11:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQv-0001mS-OC
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:07:58 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPd-0000kT-1r
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:07:57 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso5914506f8f.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331188; x=1759935988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoIBFbfrsz0t0Xevzl+WovcI4TEmiT7XaJGhm9ak06U=;
 b=nlRfxxewELkEOoBWYOA6cRJ89bc1Z59JARKf3fadJUd/Ph/WL0EPsLYlsO1spmPER0
 yJ+trwz4rBlfLMd/aHhbNnzGrPq1gfW7EF0kRB4L5uehy7ciqhqRXjrjEeIrAvI9Yvtz
 h5sGzM98beDX1e5FiUhRZC4f/V+mRO05sbvgWxJ/mJ6hykC8tbvEs7TplkBJHAGCvaLT
 4nJ2aGANSuliJWXHgiavbtgdYnOazKL10ga6ieuLpWFjxLUr/2bJDFL5VrWcxqBcjnch
 MavihMDuj8OvI3r9oVMkSZkbaaKS0IpUHTfeL6ExoXrbGxx4R9phWaMMl9kILfurr4eC
 rzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331188; x=1759935988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HoIBFbfrsz0t0Xevzl+WovcI4TEmiT7XaJGhm9ak06U=;
 b=J49DNReg/l/UUY0HVVq733cXVrQU4LQF2UqmObSdtwZsjygUvH3bfPKI7qk9FgBFWX
 SPVJZWkH/y5UfGemqPHipN+a6Lwx6ncgk9j6/aHUgV+XOjK090LeoGfuPmEa4azvvEc4
 d1ntDXkAuRJvM8UEKp6qKJGX7ZI5BmFQ4Cu6XTI8+iXfda5uB+XUz9ydA//j5D0R0xC0
 IIKUdQDsXoCpDx+8sd6PEK6kNGVhvBWiAW5Grz5tYbC6gQ7ibddpxkbj1sj/2lY2f/+c
 /Kg+unJNIN6Q4zcIErfTY38mBL02NUj85Db5LC5Mc5ZqNRt+hw0mofbpdRVvUKXTcp9i
 dJaw==
X-Gm-Message-State: AOJu0YyrjR/6E3KCUsCdBzQb9YJyw9FF/kNiCuinAk6x+5G/osJVY0vL
 xjCUKLppXvZv4H1tMPGfJOCdYAuiuvMyHw3gCS68LAq0lnZyA5qp8vAZxvxCNFB1/AU=
X-Gm-Gg: ASbGncuNreFGZr66Iae1AtiEiakT1eSCatz17jz8H0FAXOXBYidJJxVzki5vor0Nwga
 g51RgWXE0OQiaiuA/4IaWssc95oEhuaS+MS6LwVqE33CgAxuqxX2zPWC7gT81JSznJvNBK4uDtp
 WU6bETpTaGVgZT5de1zVl9MzSDQ5VKUZr72KJwvaVnZFkyF6lfU6rD5lPUdfAXcoaFjUtabSpiL
 GwcGDVhR0ypTUuRx74PNdKup+A57hHE9d4imrYIG0adF9Xb1VTvHzAOHqtBHvOa/AvozwIupY51
 WhCgfyEwtcGDzK9D3T8BLCFdazrNKj0u/pPil3/liqQszc3B5QfrDvfKU9rkAkTDcrvGLix6VyI
 O98wuoqF1SFJTT+JjM9Yyf+6w9qKj21A8zgEAjHANIqGvXWv1YpZa2G6C2TYSP0tKAkJgNI8gQP
 kDKZ/LEgpyCnvLyxC/OJY4
X-Google-Smtp-Source: AGHT+IEJ81qtfG04DHe/4mEazGBmhdqjREcWngyjsG2pu87Vb24G+7/Rah+ejZND5Mr0zO8mHcd6Fw==
X-Received: by 2002:a05:6000:2907:b0:3e0:2a95:dc90 with SMTP id
 ffacd0b85a97d-4255780b9dfmr3190951f8f.35.1759331187866; 
 Wed, 01 Oct 2025 08:06:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb9e1b665sm27390018f8f.27.2025.10.01.08.06.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/22] target/arm: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:16 +0200
Message-ID: <20251001150529.14122-12-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 30e29fd3153..f781d1cfd80 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -371,6 +371,7 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
 
     if (arm_feature(env, ARM_FEATURE_M)) {
 #ifndef CONFIG_USER_ONLY
+        AddressSpace *as = cpu_get_address_space(cs, 0);
         uint32_t initial_msp; /* Loaded from 0x0 */
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
@@ -439,7 +440,7 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
 
         /* Load the initial SP and PC from offset 0 and 4 in the vector table */
         vecbase = env->v7m.vecbase[env->v7m.secure];
-        rom = rom_ptr_for_as(cs->as, vecbase, 8);
+        rom = rom_ptr_for_as(as, vecbase, 8);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
              * copied into physical memory.
@@ -452,8 +453,8 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
              * it got copied into memory. In the latter case, rom_ptr
              * will return a NULL pointer and we should use ldl_phys instead.
              */
-            initial_msp = ldl_phys(cs->as, vecbase);
-            initial_pc = ldl_phys(cs->as, vecbase + 4);
+            initial_msp = ldl_phys(as, vecbase);
+            initial_pc = ldl_phys(as, vecbase + 4);
         }
 
         qemu_log_mask(CPU_LOG_INT,
-- 
2.51.0


