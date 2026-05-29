Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1016ACD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:27:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSyAS-0006NE-Ej; Fri, 29 May 2026 10:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAO-0006Eo-0Z
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:26:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAK-00039s-18
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:26:27 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45eeea039ebso688181f8f.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064782; x=1780669582; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pY5dZL3lqDIGFvqQzCCG1CGy5J/P2MEPS9AZJ7MvyM=;
 b=zUTZyxeCB8QVRLG0nEPsxGdhQk2HuqM2ikiLyEkowJ2Q805TY4/y9gVU8oUwheHgfH
 AAhLsHRy/MMQDcyYD7ip0OfD33qgE/NE7kROYLXopMnqKwattCogIBmINilspf0p+U92
 ya+yxcIMxL1bUklVVrG3acGmGarDpH01IZWf4IC9jjXY9qOVY4I6IlMnrW7b3PsJTQPf
 /h/GhpAnYUq3B/xLLdqDf4fJh9yLxahbK3tJ/ag7T4/7naVerg1wP5lOxi+Qoe/2D3eE
 oQbl8Dip3z0vc456E2v21tGKd/XnfzOTalbWNczN4ucIh8WgQL7ermUntNeHaEss72hB
 gx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064782; x=1780669582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5pY5dZL3lqDIGFvqQzCCG1CGy5J/P2MEPS9AZJ7MvyM=;
 b=shJEP0wgmPjRddD54MXP1rKTlsDdbP1citqXus3AUm3BTok8oWDiYrXeT6DqxIgSkK
 3ZI8QHUUlM6lHJBhCLFnDdk2yXfOvNih17v2qlowCwdEQIEUDZoI8onnLsCcFYxbUtit
 AASGwUeBeaTrcTZeGnIMZ9O60zQWcrDgVg6ZpfcOlkjmS4AI35u10XZ4oeLt1DxCG3j3
 +wuMgAeCZpKSTpYoYT62KxvIdH3Ne2bEwQA7oStpuQSyswixtZ2tvkwbypgUQIVQAdoQ
 jYhCG+kx+LVoJVQqmav6LyNKgfCSPYW3n1cmMyeY8mZPkutr71Gegq96bIp2A7EEAh25
 3fjg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+dTY3qI9RfcecFClF7iWCEvxyjtNOq1V6or8ltdDdcDHDZfHLqVgaLqT6P8vbR9o0Ohvlzofs6/w==@nongnu.org
X-Gm-Message-State: AOJu0Yx41HO7DhA3dmn5BxeFlPTLq5dkuBTJW+VNn/nmC1afGsMPTw2P
 v+IVW8sPBqQnTiOeykuW2hesdr3OUMykZR1ZReK/Tsimwg2OF3bBq1dNJ60e5mUkjtw=
X-Gm-Gg: Acq92OGJ0WTDYX/8BxblFHpjgVKThvCm2ck4EZO8azg2CdD+kAZktUTgxEu/nQ/3rOZ
 Z6W7AFLaFTri+kkvcAp2FkCOvC2W9J0t5riiEaHQgJTN77cdm2RJg9Gm9SqF5M3D32+8dgcHeOj
 60wUO0V3ltsCQCl+fd7eoPC7n+DivuGVa/j5ccWiOCQB9ZFdwMt1lAa8AOv69naOfKSfwNonBsc
 UDujuQFeFeK4syijJia6TDRDKonavMxICy/Blxrrebwnpb3htDjl+0b/MGIxQ2Hh8trxCDf1d8c
 /hidviGK0h90OSzICDOYQs/Ov2E1GEd0/PB6wbb7t823l4tyGdgMWiMscFHpldizNi6OT0QcDCK
 nTJqLUboLx0YDMvGQdnQ6yyk1l88XD+snFPWKyGZH4VxFGaZrneDCDGRVvwM+KqkZ02NkwvtBNN
 PRrXe2x3h5n1hLFlx29agiIpsORZJ1S3v8//YGpJY8yErz5Ytvov4uFk+0VrI7z5QoCQ==
X-Received: by 2002:a05:600c:2112:b0:490:6889:1ff with SMTP id
 5b1f17b1804b1-4909c0c0b42mr42497545e9.28.1780064782308; 
 Fri, 29 May 2026 07:26:22 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef35598e5sm3754032f8f.27.2026.05.29.07.26.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:26:21 -0700 (PDT)
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
Subject: [PATCH 13/17] accel/tcg: Convert AccelCPUClass -> new
 TCGCPUOps::cpu_realize
Date: Fri, 29 May 2026 16:24:29 +0200
Message-ID: <20260529142434.87880-14-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Introduce a TCGCPUOps::cpu_realize hook and call it at
the end of tcg_exec_realizefn().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/accel/tcg/cpu-ops.h | 1 +
 accel/tcg/cpu-exec.c        | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/accel/tcg/cpu-ops.h b/include/accel/tcg/cpu-ops.h
index d7d329e419d..5eba6949ba1 100644
--- a/include/accel/tcg/cpu-ops.h
+++ b/include/accel/tcg/cpu-ops.h
@@ -49,6 +49,7 @@ struct TCGCPUOps {
      */
     void (*initialize)(void);
     void (*cpu_instance_init)(CPUState *cpu);
+    bool (*cpu_realize)(CPUState *cpu, Error **errp);
     /**
      * @translate_code: Translate guest instructions to TCGOps
      * @cpu: cpu context
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index ef44c12b601..1efa3bbe53d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -1056,11 +1056,11 @@ void tcg_cpu_instance_init(CPUState *cpu)
 
 bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
 {
+    const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
     static bool tcg_target_initialized;
 
     if (!tcg_target_initialized) {
         /* Check mandatory TCGCPUOps handlers */
-        const TCGCPUOps *tcg_ops = cpu->cc->tcg_ops;
 #ifndef CONFIG_USER_ONLY
         assert(tcg_ops->cpu_exec_halt);
         assert(tcg_ops->cpu_exec_interrupt);
@@ -1081,6 +1081,10 @@ bool tcg_exec_realizefn(CPUState *cpu, Error **errp)
 #endif /* !CONFIG_USER_ONLY */
     /* qemu_plugin_vcpu_init_hook delayed until cpu_index assigned. */
 
+    if (tcg_ops->cpu_realize && !tcg_ops->cpu_realize(cpu, errp)) {
+        return false;
+    }
+
     return true;
 }
 
-- 
2.53.0


