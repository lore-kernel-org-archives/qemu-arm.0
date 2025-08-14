Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495CBCA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:15:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXeM-000412-1o; Thu, 14 Aug 2025 09:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXe7-0003XK-D4
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:32 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXds-0005c0-Qo
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:05:30 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-76e2e60433eso786399b3a.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176715; x=1755781515; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0WgDnjZZbQNGrZHbHxQl5y/Vvc/Dh17BYKXEKy/nEk=;
 b=MXB4OkMT1f22OiEtP+X4ik1vyxe8SWDx9zPFpdmWbsu2lNl1cxOM1XsrRmYQ0mlE0i
 Go5kHHmu3WyLklJcSBxnqFAdjfe/VW4uZ5PZMT0zby1tAYu1X7vPTnTmHy20NSR9CQGR
 dIe0X4JcW2WWnVnOp8Mr/B16AyNEiqu2jdheNpvELfNb7AyRxHDxMQ1FRpeB3FBEr4zM
 Ei54y4Jh2Boxdt6R3nnyHF0Vfd9ANfZivedQjczjUUXNPdjAFmKJ/4hpFxBks0N/rXP+
 HGITiaLgpIqSWeQ6WSJ9xMKL1rj0MXlQ6Bae5mVvYyrVcDXfkZWuEA368yePr4D7Kn8E
 8Kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176715; x=1755781515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0WgDnjZZbQNGrZHbHxQl5y/Vvc/Dh17BYKXEKy/nEk=;
 b=weYpnUrqw2Ps+VLn40dVXiXnXBfz6G608gCeTUAee9fSXearmMvH/b2/LCB0Ikk9BL
 ziNkAhDTpftJ4sPn9qLSzIOY/5rZGN03RxNHAIVDSIAUbfIK7J6NsqpQMD+HCD6RlFga
 mBKTuDoRApXN/VXzbf+ZXLf5qfRxMeaYr0GM2gkQO+hOgO6G556JP/CfVL1lU+C+JZEY
 HPAtn+GvZZ/kboOUvtLUTWd7+Xu0lzJCAOJ1O/nwHSIEQ+sVM4OOxgqT6OgP73rMBsvN
 s5Ef3a51LeaI02VWkvFsrxMzMHBuQaOM3jG/+dbeVHMzgY83Qj9JH+AhHnTpxDa47z7q
 HNOw==
X-Gm-Message-State: AOJu0YxYITswjpDQO/ZeJG2f8sFPFqnfB4OsCijFUPOK0Dlac8HH6K3t
 QKOaVmbqQ0HTNuw5rooHMtw7oq+OX+u0XazAxAhKiJYwifz+WG5JlLd/1T4Tu4qEDpeAPoUAUI5
 4C/brLcI=
X-Gm-Gg: ASbGnctCRgwRthYaAuNGOWVCBIwL9cc52/98NrLIxPxtkgy3FzozaX0+wUpsOOuRtlF
 Il6QEp90+dpE/Ytq+9ZUPT4l3rNdCigfUfydyOmU4vic/I6ltSNMBc4XB5X37Q5nC++xGuGL1VT
 EQk8MrrjsdaqdyTonMl5gfWzOmk/ivZ4/DEMKHbhtMOzgghjsy1g1TvIrvltiNcIGURxVIF8va1
 HG8qxw7SPIqADBTdXJaDtk6aacpz4V0x/KyT/7tyb2FSB1ge4ReeQl8I2qJ5VLYbnwNdFXqfBTP
 YGfos1kVtsU8tCUAPZlWqcwgmUIUceXS3s7iRdlA0tNtB9AkqIuS0tZ2ypjfh7ks8Sf5zeYSfob
 A6zR796KO3DAt+lyZV0aTZklY3itE/kYfYmt7xUxCmlSLTSk=
X-Google-Smtp-Source: AGHT+IFfO9vl4AwAbosB3xXp1RewKyiDguAhLwyKrcGPiQ51KSA0BbQ1pNvVS49hhtDh9IXpitPncg==
X-Received: by 2002:a05:6a20:3949:b0:240:356:f033 with SMTP id
 adf61e73a8af0-240bcfc8202mr4423678637.16.1755176714753; 
 Thu, 14 Aug 2025 06:05:14 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:05:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 77/85] linux-user/aarch64: Implement map_shadow_stack
 syscall
Date: Thu, 14 Aug 2025 22:57:44 +1000
Message-ID: <20250814125752.164107-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 59 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index dfe114ceb3..0a7ce7a262 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6356,6 +6356,12 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 # define PR_SET_SHADOW_STACK_STATUS  75
 # define PR_LOCK_SHADOW_STACK_STATUS 76
 #endif
+#ifndef SHADOW_STACK_SET_TOKEN
+# define SHADOW_STACK_SET_TOKEN  (1u << 0)
+#endif
+#ifndef SHADOW_STACK_SET_MARKER
+# define SHADOW_STACK_SET_MARKER (1u << 1)
+#endif
 
 #include "target_prctl.h"
 
@@ -6571,6 +6577,54 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     }
 }
 
+#ifdef TARGET_AARCH64
+static abi_long do_map_shadow_stack(CPUArchState *env, abi_ulong addr,
+                                    abi_ulong size, abi_int flags)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    abi_ulong alloc_size;
+
+    if (!cpu_isar_feature(aa64_gcs, cpu)) {
+        return -TARGET_EOPNOTSUPP;
+    }
+    if (flags & ~(SHADOW_STACK_SET_TOKEN | SHADOW_STACK_SET_MARKER)) {
+        return -TARGET_EINVAL;
+    }
+    if (addr & ~TARGET_PAGE_MASK) {
+        return -TARGET_EINVAL;
+    }
+    if (size == 8 || !QEMU_IS_ALIGNED(size, 8)) {
+        return -TARGET_EINVAL;
+    }
+
+    alloc_size = TARGET_PAGE_ALIGN(size);
+    if (alloc_size < size) {
+        return -TARGET_EOVERFLOW;
+    }
+
+    mmap_lock();
+    addr = gcs_alloc(addr, alloc_size);
+    if (addr != -1) {
+        if (flags & SHADOW_STACK_SET_TOKEN) {
+            abi_ptr cap_ptr = addr + size - 8;
+            uint64_t cap_val;
+
+            if (flags & SHADOW_STACK_SET_MARKER) {
+                /* Leave an extra empty frame at top-of-stack. */
+                cap_ptr -= 8;
+            }
+            cap_val = (cap_ptr & TARGET_PAGE_MASK) | 1;
+            if (put_user_u64(cap_val, cap_ptr)) {
+                /* Allocation succeeded above. */
+                g_assert_not_reached();
+            }
+        }
+    }
+    mmap_unlock();
+    return get_errno(addr);
+}
+#endif
+
 #define NEW_STACK_SIZE 0x40000
 
 
@@ -13945,6 +13999,11 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         return do_riscv_hwprobe(cpu_env, arg1, arg2, arg3, arg4, arg5);
 #endif
 
+#ifdef TARGET_AARCH64
+    case TARGET_NR_map_shadow_stack:
+        return do_map_shadow_stack(cpu_env, arg1, arg2, arg3);
+#endif
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         return -TARGET_ENOSYS;
-- 
2.43.0


