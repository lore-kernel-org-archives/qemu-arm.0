Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF96DCA0FFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOEv-0001Ub-BS; Sat, 30 Aug 2025 12:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERk-0007a5-05
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:48:19 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERh-00054P-Sl
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:48:15 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-b47174c3b3fso1689826a12.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532892; x=1757137692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0WgDnjZZbQNGrZHbHxQl5y/Vvc/Dh17BYKXEKy/nEk=;
 b=t4BoLRNWN2cVid4WNN4CzADpu5O0Kmi0sORmxhd/StfbXC2FuTt3HML5mnLiYcUbel
 aCsRAHdHgxUxRve7ojVRn98kJzYmwl0s6WnvYnL2Xclj4otCGXVy5CqyTWQ5h2vr948V
 z+AiAmykREFgdlJQZOL+0YiKwSnfWa2H6roaV5AEBrPfMpycYIa+qYdzh3dh258LCD/E
 WUZx+APTbXp3YIRLezDgOx9C5LKPYnVNrvYY6FIbQA0wz0wpT/mx6tWormvfg0PreDy1
 uvyD62cQ7PRWf/2aqc9fDtOlD4yELF18+LQ9MgcJ+SDue/WD0jJO+cWcLDNVyGy65iRS
 Sd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532892; x=1757137692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0WgDnjZZbQNGrZHbHxQl5y/Vvc/Dh17BYKXEKy/nEk=;
 b=ZqLfLvM67n8GFNQcrPfqGpX6AvUKKQl6nHo7EJb7UMTwBRjMWBXq6CmxpHcGoIqIV9
 09sW6xHavILm4RZQS/GfnpUOsfDvs5svc1tiEvBrNOmjum7gN13uTmBIF8S+LLqAZAJ3
 PR4IttPeQUti7KVUVEMqJ819zIAXgk8GpG1NXXFVAl2GRZxSQyL4/+mHk6kRpj13Q7GU
 QZCZMyJEFsTumGun+Kv5jgjDEJCe84yerN6xDjPOf6/FC0xglxuGUletHYLCgJ5EMH5L
 JBwzpdkXgOd/wm+hR4lE1fuE5oCUz94i7wlDXJynziXfEykkZfZDUu2V1NWyXnHQeoMk
 ViEw==
X-Gm-Message-State: AOJu0YyOrbQZxUJPseOZ2wmSBfHpZek2mDiIYavd3lIEmsU20Dcc6SO/
 s2WqDymewMXUDAhaSpvYPxMNiJHqOpmG5LsTdFMyi05OicBtrRAT5DD7iF0sAVUQLzo=
X-Gm-Gg: ASbGnct3fvEyb4IySZ6g/RgLFbHaqfl6H5KORscZhE89RKVTla6DLc/qbrI+UANB4tS
 AMvsBMOBxQQc8+mZKr+ZThwGLrbmQWvWD54cwNPuMg72tEZSebJdDeSPR8FUMdi2KXwwyME8LME
 XZ2k7C6gpXnj39Tri4CR92TD/NULME2n/N/tx2Jn7PQCqLDS7yMymtBFYjdD4Tdw8mQ3wwW4rev
 SIz8q34swA8zIKEqJa6pm2jkZhjw45t8maKoovmQpxINsGokFzN2RiqlSHlecSUKc0s7qTwDLRu
 8rjn1BuVd7wRLTSAm5AQWHOVbOyub5we9RJuP/I2ZXPFYRSBnF2BjetmmmbYqMqvut7h3CA3S92
 ONImK3qvg2AzwfhXD9/n3UrkC4JRYivUPwrkfojQO1+F5EKMzt0yKjLpVhe+TWwY=
X-Google-Smtp-Source: AGHT+IFhAGp04tFeGPSHGX+k/hQ7QkE+sDXVgBvtVb6ngHPJzppAca0ixsWxOWsPKeyX6vZfYtdfHA==
X-Received: by 2002:a17:902:e745:b0:246:e1f3:77b2 with SMTP id
 d9443c01a7336-24944b65071mr12458765ad.53.1756532892160; 
 Fri, 29 Aug 2025 22:48:12 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:48:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 77/84] linux-user/aarch64: Implement map_shadow_stack
 syscall
Date: Sat, 30 Aug 2025 15:41:21 +1000
Message-ID: <20250830054128.448363-78-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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


