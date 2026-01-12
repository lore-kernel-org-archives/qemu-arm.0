Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC1FC9EC67
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:32:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFDs-00066T-2F; Mon, 12 Jan 2026 05:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDq-0005qi-56
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:30 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFDo-0001u6-8U
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:32:29 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so51833495e9.2
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213947; x=1768818747; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5S99U3XUshmuddLFuBd6ft79OtosHUhtCtEVlD+u7mY=;
 b=L0lI1o+tQ3J2yddKgVJ9drl1h3b03p9tClBdJuAjRBINN8IHgi4pOe3B9+i7h64OAh
 a4kycf35AgHrtmeXvuIAZrekhahUziiM61KO8nFurypWYCiz9eWmK1Zj8/iL6NSqPayD
 RlGVfI9sOkvDjoYr+NAKt7J1/E1BA1h8PC9VjpFuUQxme5NKSz5mtVqlQn5aA+ebmtVH
 PDKtSc8V7/a5na7QtrWrvgo7AUDx7QZ30YXZCGCCLBLW8x8oS4oeyR5nRLSxhQGCLN47
 ZaXSeWqKnr03I0/JA7b6km3UoTDF5XNpie2gAa7iXt5mM7oZpxvHfL1uxan7Nqo5pbqy
 ZggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213947; x=1768818747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5S99U3XUshmuddLFuBd6ft79OtosHUhtCtEVlD+u7mY=;
 b=sfl+d7F7ro/gUSoNVfInXsZiT9faBzHlO+velE39vU2LMQun1FnIk7YtNaVgD0UXQj
 8tqrEPF4IswjaKcamEOTQsVaX+bfkBDQPlXDNPbDR5A13xrQDDOHOmrDtebOrOpCYQ71
 GCbSl1osVnmah1wbwfrnhR/9RGUiR6Zh1ClXrqY1DZNENtRv3fh+efCu4gj1jPYpCxtb
 i/FI70LDlpG2eg+zDUxmj5cDu59pMiBUGTDkA3Kq1zC6yr3mLR+pqtXtdVMKK3J3Oahj
 Nf+0FrJ/u4SE08roHcXZnZw5KsIe3Z53T8xcWEtI7AxpFMYRa/v6GwTe+3KU/pTzqkKS
 7Czg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWishV2BMXcuMPthFXijsuXLgQlIIx/xsLoQmtQpJMq9HZWBo2Zii518zAK7LsiCud0qJqENKKsYg==@nongnu.org
X-Gm-Message-State: AOJu0YwzLMjCpgf2C4a0YAyeffwdm66UgVTOLRNTzNywL7gWMRMNj4bP
 sAWtEsiV3GQ/zJ+2NwKKQ+eUyjlsVxNCnKMbrfLCRFlhqqr1Bqbg23R5vFdsIxzhFRY=
X-Gm-Gg: AY/fxX5CPEulWhXUgs4jDagrvUUbZJLulf8YVyEHaeuBXVfMOLNZkNsw/4qFYS5f6cE
 jwe9gmQQH44/eyJHsLzXOKQt4ITIFGd3dBqkrpH+hX+ISCG6AcGQz2V5Sdy2nq2rNq8A2m7wuim
 d7zCfpmdCGPQ27x8Tfedah7DJFx6DPAOqA9yarQO8ALIPyC/i1chJscrP6/VyCV6ZSt4I0yNN1y
 NANnhTOMYyPpo8S4j24rOegKBLrNoWXIF2gkCAa7IN2ypsWKpqCJP4+I6fERoIYiK+yageVrqUm
 Q9o/aNx1uUag3W8hvZog9kFy9cwrnDmiY3YDPS7/rI9re0X8w0FEE80kSyAMIijv9H1EAZeNlhW
 lnHIPLVJz8ft48dVGAXTRwtNv0PgiVWue1I0sQ3E1hCmQ7Lg5FVIiQyfsL+9IUsJ1kqLIinM2Ln
 VzIkfD3/CodqGtKKvrBYItn9zcwmOs83Mi8oU0lnFRr/Fk4H4jVEyr9OIqRYfZ
X-Google-Smtp-Source: AGHT+IFg6iH9BJeHq4aOiqxHsjm/MD6f+vy1OWo+rbxM1fwDMXT1DjWBv/68mkoS6E7clyHMfcuiow==
X-Received: by 2002:a05:600c:630d:b0:475:e007:bae0 with SMTP id
 5b1f17b1804b1-47d84b1fbeamr234567095e9.16.1768213946620; 
 Mon, 12 Jan 2026 02:32:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f6ef868sm341578045e9.11.2026.01.12.02.32.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:32:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 16/19] accel/hvf: Add hvf_arch_cpu_realize() stubs
Date: Mon, 12 Jan 2026 11:30:30 +0100
Message-ID: <20260112103034.65310-17-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112103034.65310-1-philmd@linaro.org>
References: <20260112103034.65310-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Implement HVF AccelOpsClass::cpu_target_realize() hook as
empty stubs. Target implementations will come separately.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 include/system/hvf_int.h  | 2 ++
 accel/hvf/hvf-accel-ops.c | 2 ++
 target/arm/hvf/hvf.c      | 5 +++++
 target/i386/hvf/hvf.c     | 5 +++++
 4 files changed, 14 insertions(+)

diff --git a/include/system/hvf_int.h b/include/system/hvf_int.h
index c8e407a1463..96790b49386 100644
--- a/include/system/hvf_int.h
+++ b/include/system/hvf_int.h
@@ -106,4 +106,6 @@ int hvf_update_guest_debug(CPUState *cpu);
  */
 bool hvf_arch_supports_guest_debug(void);
 
+bool hvf_arch_cpu_realize(CPUState *cpu, Error **errp);
+
 #endif
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index ffcfe9663b5..b74a5779c3d 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -356,6 +356,8 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
+    ops->cpu_target_realize = hvf_arch_cpu_realize;
+
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
     ops->handle_interrupt = generic_handle_interrupt;
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 718414cc53c..bf8bed1495d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -972,6 +972,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return true;
+}
+
 void hvf_kick_vcpu_thread(CPUState *cpu)
 {
     hv_return_t ret;
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index e3e54c10bd5..089dd4da1ff 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -370,6 +370,11 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     return 0;
 }
 
+bool hvf_arch_cpu_realize(CPUState *cs, Error **errp)
+{
+    return true;
+}
+
 static void hvf_store_events(CPUState *cpu, uint32_t ins_len, uint64_t idtvec_info)
 {
     X86CPU *x86_cpu = X86_CPU(cpu);
-- 
2.52.0


