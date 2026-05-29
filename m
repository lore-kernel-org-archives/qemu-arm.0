Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D03CD6E4A
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:51:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3EH-0006er-EU; Fri, 29 May 2026 15:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3E8-0006RF-Li
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:50:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3E5-0004iq-Hs
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:50:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-44c350a5b87so8410399f8f.3
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084236; x=1780689036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiKly4HPenv8/ZKUBSNL5mBIXiH6MvoTy+hNbg4YgG0=;
 b=Btun9GV1KEzP0XAMcGfA67coAECrQPwiMdzVfClLHNrbKCBqtSKpICfTOXrbgOEa5D
 ai8cgScpOM1f+pqCYkSzaWgorOERQ9mFcLhfr2wOvz47CTeat2Sk4A5yFJFGCz1V4uTB
 1b2HemybRd9QBLQlPLUJ/FNF/cEqJKEn3HYsSX4ECJOIDGmpzcL6loAk7aAo7gU/0gB7
 Hd+x1v8d8gL0685/K9p5wJyBdnSGt+zxaumJ178dqidUcdJAGeCJmsUUSUfWkGTPWX4/
 T7a12ZS9GPDb/shLrE0s0UI0e8qc3TgmDuPPc+Z/hJ27eH74YNafMdCjScR0+mj7bMLh
 P8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084236; x=1780689036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LiKly4HPenv8/ZKUBSNL5mBIXiH6MvoTy+hNbg4YgG0=;
 b=cNHDJUt3cZjXAfrjZ6Hy/77tqoV8G9zzdbVTT1K8WBFFdTP6X0t/eVDvLC+YKru4Zs
 mvRMh+7D4F5UIIM9qCoeXS08y/+AZ6UaDDXNEnURceo2LKvpGdXQMO5ACjV+Y7jXNF0o
 aAFQoHXc/ves9fxnBDIOuzOGILDmD6UwW1E9G6tGYNoDJGMm8aBXcqivCRvFuHohXNIt
 VQ4qykVRerEQ/JVxEblGboK7Z56SwnnaaGoo6MgrUYkZS637CJjhZKOk9LnGAJeXv2dF
 RiSVql5oKlYo7U9vWuJ+fhqTY8OHmNVzYn1mRUIlPtVZMWWZz8x3ghj2dPqWVkrZ9Oy8
 Vjxg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Hd7KgoAqic0Pr0RAkJcKJmvkDLe5pGaxiFclVzIQK/wSnkQfyyjibRXs/AF4wVD/oVrSjVHH63A==@nongnu.org
X-Gm-Message-State: AOJu0YxpySZxcETJy65W32caK0XGFtxmABQ2medPrpLyFlD30HwPQKnO
 EB8tVkTixTAI1vHUIFL2PejXM82u/INshLoteTZ0WZDxN/5OnBqsL5dx824Ic11MTHY=
X-Gm-Gg: Acq92OEgAVMdzMdMhFlFplS5w5CyEy+WAx8ikhNZ/HWndNzRge32UQ9zFCU5ds93HIQ
 8bmZyOqZRmtalV0XqG5PHmWYX9QfCl2z5kPYJofdGm1Rzd5Zk9PwmDuFNsAua9BnTGaTvMRMbgt
 qrYbaoyuWvecMvUffNb7Pfu/p0J/urRnw3xYEdbY2ltkm5+KEa5SYpdO5Pc4hyrTXbVfwiZK6uW
 NM/h53mCR/hjDgdwfgV2AGku4fE89xAsEut4dtqTuYB7VxnCn5xiy4PoyGuXELRQfO0ApguG+qR
 fGsZ2JOMdKMVBHaWqWJkq3BUA19DGFNhu45KrhzUFaxjvSnWPz9x2nkSpux9VGm13dkvkPnjqy9
 r7m37ry30bG808YdT3bjKjlVdYDTXg1mj76fQ1Vj+O5jx6y847TN6M8LfzsNrxFIXnuGoiuu2sE
 nuZQhfDOkflTdIHcvtMolQy2Xn0yHX2T00x0+BaJ6nFOEi3DfESE/SiME4ErUMl6dE9Q==
X-Received: by 2002:a05:6000:2812:b0:45e:73b3:4515 with SMTP id
 ffacd0b85a97d-45ef6b8c2e1mr1557937f8f.35.1780084235811; 
 Fri, 29 May 2026 12:50:35 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a03f8sm5924106f8f.7.2026.05.29.12.50.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:50:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Johansson <anjo@rev.ng>, Claudio Fontana <cfontana@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Reinoud Zandijk <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 06/17] accel: Introduce AccelOpsClass::cpu_instance_init
 handler
Date: Fri, 29 May 2026 21:49:28 +0200
Message-ID: <20260529194940.97143-7-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
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

accel_cpu_instance_init() currently dispatch via target specific
AccelCPUClass which we want to remove. Introduce a similar hook
in the generic AccelOpsClass structure.
We will convert implementations from one struct to the other, so
add an assertion to be sure only one implementation at a time.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
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


