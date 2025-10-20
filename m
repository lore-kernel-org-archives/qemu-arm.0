Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BF5CCD19F
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:16:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyAP-0008H0-1T; Mon, 20 Oct 2025 18:15:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyAN-00088Z-JC
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:47 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyAL-0006qP-T6
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:15:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47495477241so1756685e9.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998544; x=1761603344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sd9XbBWaPuGKNpw5kMPlomKlbYG7JtQTngo7iwdPDmw=;
 b=yj/vdcBum2mwhJw9CMZy4tLPySUC/KZcIpAWen/tg91sz/b2h028txmtT1reePPziL
 Z4Ei7YfooiiQsvFjV79iBHLvvzJwnjjZxWqIVSf4RDKk/d6VspL5IJvYeErqDDN4z5Aw
 1gg62yivZUBtbXxH2eA14h7SqeLxTcK8D3unfI1DlETooEUYUgAhFfZHik54Krd60NHI
 0TnimGoEyVp/JYLrf6TgNpRJWmb86Hm6R13Uj43KkyopPHF2kk9O7JI7ZXgD+86emt4A
 sFshSbvwnAr8FQPn5NxkN2i2qMQCoeuIjDg85jcWBT+18fQJdNdi6Xxx+udoGjvVaxrh
 yhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998544; x=1761603344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sd9XbBWaPuGKNpw5kMPlomKlbYG7JtQTngo7iwdPDmw=;
 b=H2LU8CdFoSkCBgbMY2jb7jIGNoMBsxPyTLVQG4+OI5ftcpjSBclHQcXWftv5t152zO
 Ui4XVT6745KZtz326KnDog0veylxaCP8l2jtkzvSmHj2ojsPrNyBXN9nRRyBX7UB47DI
 8halxObJSif4OJBPg0l1txzkakUinZ1J0jMU93CShgrk0wGVHSEgiLrS+CWFQ4iHwgDc
 FWLJtYai1hCHuyqNcBAEF1E2RfgDX7/QKK/piwopNZH2vx1YR4gtxXYL7uejrrXk+FEw
 c70gXJzg6kLhNL4/SWTmB2Ot5aqbLonNBJkvLr6prXOOtmSqNmuc/0zEo3hrxfZ97ODW
 mrHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNez0W+ipeRMxXrG/aO2tJ6z+uBdgD5viQxekMhB7QAU4HWO4g0q5AFg0oR9xnb4Vnf19VDXuP9Q==@nongnu.org
X-Gm-Message-State: AOJu0YxQGjPpJOnjqswOfuGuiUSzOtGO/8n6LbP8i7fDPyJWitHF5CNn
 u3ILUDkdU6djE3p5wkiGzp9SRu8o+T9OMy2lHFSCpZh4KvOXEfV93ll5MIW+bOxxNr9QZDL1Gew
 8JbmarWU=
X-Gm-Gg: ASbGnctHTPm8XizqdW1ZEHfFnHYCIdUnzr4itDLULkQyH06Pt8AncIhZEnD/dCcupqB
 QO5Tdm54v84E4gJ5/43OI98Sf9ixG5aF829H9sNNs0CCF+FWZRNBXlNa2TDMvWWKBcWV6X+xpX0
 v7fWUKSKhZtb7BHwBgunYdzw445TE4xOuAW0/wDL1mJ0XTNjCF/MGlaCCKFbizdDRuD6s+9AICP
 fLLHVUsTrCqCi0aXK9Ppn4ClEk1xm0JuiJN8A5XXhvETFkZmk2Kw+uVsRKRSvCxzEwS2LJ1fJI3
 2A1tsLy+j0WdaSCO1HPrZnmjc1s7SmX90+5F8Fsfvy5MNQcrKqSvqXmvK9GGHDOUS5jB/I2CU7X
 LkPBPwxTKDAcuICUj0QFMi6EkSIQbLBL/CFhjxa4jWWhrJwP5C910cv62L3WITIeA/qq5r2Grep
 gCfUgy19EjzY0ne9uo79X6ky7Pmrr+du7KqcLf+kczOtBd+eACMQ==
X-Google-Smtp-Source: AGHT+IH7yvA9+h5U0ggooXDqiX18ilulXBihN7dp6QNEq8NwdI9hfCtCiAczaouISZ5R/bNTWe+lXg==
X-Received: by 2002:a05:600c:8b30:b0:45d:f88f:9304 with SMTP id
 5b1f17b1804b1-4711791cbcbmr110605165e9.30.1760998543934; 
 Mon, 20 Oct 2025 15:15:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47494b365adsm4350515e9.6.2025.10.20.15.15.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:15:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 22/30] hw/core: Introduce
 MachineClass::get_default_cpu_type() helper
Date: Tue, 21 Oct 2025 00:15:00 +0200
Message-ID: <20251020221508.67413-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

MachineClass::get_default_cpu_type() runs once the machine is
created, being able to evaluate runtime checks; it returns the
machine default CPU type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/hw/boards.h |  6 ++++++
 hw/core/machine.c   | 10 ++++++++++
 system/vl.c         |  2 +-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 8fc34579412..5f0fa5f56c3 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -25,6 +25,11 @@ OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 
 extern MachineState *current_machine;
 
+/**
+ * machine_default_cpu_type: Return the machine default CPU type.
+ * @ms: Machine state
+ */
+const char *machine_default_cpu_type(const MachineState *ms);
 /**
  * machine_class_default_cpu_type: Return the machine default CPU type.
  * @mc: Machine class
@@ -309,6 +314,7 @@ struct MachineClass {
     int numa_mem_align_shift;
     const char * const *valid_cpu_types;
     GPtrArray *(*get_valid_cpu_types)(const MachineState *ms);
+    const char *(*get_default_cpu_type)(const MachineState *ms);
     strList *allowed_dynamic_sysbus_devices;
     bool auto_enable_numa_with_memhp;
     bool auto_enable_numa_with_memdev;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 5d9684fbc85..bf0530b25cc 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1559,6 +1559,16 @@ const char *machine_class_default_cpu_type(MachineClass *mc)
     return mc->default_cpu_type;
 }
 
+const char *machine_default_cpu_type(const MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+
+    if (mc->get_default_cpu_type) {
+        return mc->get_default_cpu_type(ms);
+    }
+    return machine_class_default_cpu_type(mc);
+}
+
 static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
 {
     MachineClass *mc = MACHINE_GET_CLASS(machine);
diff --git a/system/vl.c b/system/vl.c
index a96063f9901..fd98ea52d9c 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -3817,7 +3817,7 @@ void qemu_init(int argc, char **argv)
     migration_object_init();
 
     /* parse features once if machine provides default cpu_type */
-    current_machine->cpu_type = machine_class_default_cpu_type(machine_class);
+    current_machine->cpu_type = machine_default_cpu_type(current_machine);
     if (cpu_option) {
         current_machine->cpu_type = parse_cpu_option(cpu_option);
     }
-- 
2.51.0


