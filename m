Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C34CD6E50
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:30:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSy9U-00045q-Lb; Fri, 29 May 2026 10:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9S-0003zs-Nc
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:25:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSy9Q-0002fJ-1Y
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:25:30 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso121174485e9.0
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064726; x=1780669526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bh2neLmp2yCN+no5zdf9s1S1CTB1NaAAPjqIYQpJDXU=;
 b=jv05KxeGCGgxY/643LjsMcSgKTuJqq9BooyT09yfEKcyXQtJkriDseh4jOuqiEoilb
 KKgyXW/pUQ7lga3/+eBYVTV/uSqvmlYsO+YkxCiHuH0TJwK0njCg1j000Kg9YhUWDnIW
 UFs4s2InFPp6b+blXW2R+uXRJg71JPe133b1EFC0fUqCPUdjI1JO+ga7TndF06X07Ug4
 KKvEdiWu/7ZRpfWyhoVLU1jXhBkSAl5tsU2g/zkaZ9i3/xfhQ7aq4KWCTbiIp2U8iKU4
 gQSwrDTSk2Lik1mkh2qa8IYbciNqUdlyo29oBvqTF4rN6x5chqoVCowIn7TOApZdbKnu
 RrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064726; x=1780669526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bh2neLmp2yCN+no5zdf9s1S1CTB1NaAAPjqIYQpJDXU=;
 b=hNLtFGouqJtFmRxkG6H9mZ5fEcLnrbxAKETOC84vKyPV8H1dlFCs/QSMtT7Qab+GkC
 sv1ujUWqunRzn/niRKyvHMv1E5cVkdmMDCVxyG5Akw+8xsxfGihsP8SLwOIvRdQENhUv
 8GUiKTGvP/SEVKkWFleoDsegg/hdoMtr0gXSEYYadtg648sqo0xvZbIC7QelZY4v28zS
 KHygMz2kxgQqGTW7QXQJDAqzwaI2Qt0UJvn+K3EJDNJOJja30ABd7nkvnhGx8aJ1mjjF
 xk9euepsBHJuYDTeMophnM6RgsglkzKg+EHrAwlNnPUn58Ct4KMt++lfNc1u29jwJGMx
 bfVA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8u+VH2jI6JGQFvGhjVN6a2jN1y+DkEn9FL3owGm2I4Ge2rY2sR5mxntLJ5X4s4ZfX4QdhmqcyQVg==@nongnu.org
X-Gm-Message-State: AOJu0YwvAE7wukybsKIAxpZVRuaxXnG+YYONqbJkQAoCYC3YMI3Q43Dh
 Jl/9iF8TxzrgGLWwmFtJ0ELqLTLfEp7O5CVUUXPLshfDuwP0iaFXgST2ts3VtqQH9Og=
X-Gm-Gg: Acq92OG6HUzvcaYKlvjX/XyPKS5L472hR44n80NAXX4D2gP/6nOgy7GgHZCZ9URUmh4
 +OaT44vEUoBMsBrhyLJxL9OrY6zLb7b50ZkezVmyf6a22va0AICPHU/egLh5CP/ffEME1lXVhBf
 EwDlqtHULYDEt51wu/OG3MM5iXe9tWkK1GpKibzH85FsauaNaLwnNu9NCZZc5pa0tDWzwGrRt1c
 MC+NOEw8Iz+Frq/KuGGv24G/asAfNXPIZCPV0H7I7nZK5W9GEvafFxgdy9f3hzWkZn6YR0+H3Rv
 nYNoW5tLA7v0AbYJC/EBA/5k8ehmExdwUuKekATcf0jN6m1WnEDp/G+/xgIWNziry+maAgn6O2X
 bhqH2YT/6Y0Xyeh/955YZ8U/kATTLWfvHoFgQIw8DReXIp+xT9KqVVwZYHNpmBLOG0Dn136MXfs
 Lv5pAXzNvOTm3BCcluAkJDD989SNjL377Oy5eb76RKvUrMZbZcYKf9dc6GUneAPZZnhPWHHYS42
 gsk
X-Received: by 2002:a05:600c:c04b:20b0:490:3cb4:f1b3 with SMTP id
 5b1f17b1804b1-4909c0ba682mr43032785e9.16.1780064726422; 
 Fri, 29 May 2026 07:25:26 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d7002e8sm55832855e9.15.2026.05.29.07.25.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:25:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/17] accel: Introduce AccelOpsClass::cpu_instance_init
 handler
Date: Fri, 29 May 2026 16:24:22 +0200
Message-ID: <20260529142434.87880-7-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

accel_cpu_instance_init() currently dispatch via target specific
AccelCPUClass which we want to remove. Introduce a similar hook
in the generic AccelOpsClass structure.
We will convert implementations from one struct to the other, so
add an assertion to be sure only one implementation at a time.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/accel-cpu-ops.h |  1 +
 accel/accel-common.c          | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index fd1307dad6d..9810cc27cd2 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,6 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
+    void (*cpu_instance_init)(CPUState *cpu);
     bool (*cpu_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 176b03e0e90..b3bcd53a4c6 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -39,7 +39,15 @@ void accel_init_interfaces(AccelClass *ac)
 
 void accel_cpu_instance_init(CPUState *cpu)
 {
-    if (cpu->cc->accel_cpu && cpu->cc->accel_cpu->cpu_instance_init) {
+    AccelState *accel = current_accel();
+    AccelClass *acc = ACCEL_GET_CLASS(accel);
+
+    if (acc->ops && acc->ops->cpu_instance_init) {
+        if (cpu->cc->accel_cpu) {
+            assert(!cpu->cc->accel_cpu->cpu_instance_init);
+        }
+        acc->ops->cpu_instance_init(cpu);
+    } else if (cpu->cc->accel_cpu && cpu->cc->accel_cpu->cpu_instance_init) {
         cpu->cc->accel_cpu->cpu_instance_init(cpu);
     }
 }
-- 
2.53.0


