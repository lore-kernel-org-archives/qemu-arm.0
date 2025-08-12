Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66CBC87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:29:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulso4-0004Cz-Ia; Tue, 12 Aug 2025 13:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsnz-000492-UM
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsnr-0003U8-DZ
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso37241085e9.3
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755019726; x=1755624526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Gx01KlGJnh6U0DX4MaOA7JQNq9Sq+XdhCp2GXJJ2aM=;
 b=OIgfbL/ZethhyXS9sOqXPWgnY1IG2yI8Xz0jQaR4/VCM/Owx2XT36YBlPs6+ic+EzN
 QKdUGluPJNfCz6Medvtsqgx8GcsFibbPBwNHIeTDldc0hMlLsGjEn6Jv98PfPDdLjuJT
 WPKVOvo17bSz1tpShyFR/4WmKdX1v5tz+89xoVVb3HemkraP6ZXO+Z/XVsQ4P6ZBPOhS
 VEUlviUn0MwgpWqDqf++bQGCbIcNNcAXevYoEbr8fi4kNVcq7O4dA52RzeQLOZhE/vXm
 H9ATb6bX2GMfwWbS9YUNBKUURPa7t1EC8Kkb1dCleAPtNqwzGpVRXciBXt4q2wPs6JjF
 E37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019726; x=1755624526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Gx01KlGJnh6U0DX4MaOA7JQNq9Sq+XdhCp2GXJJ2aM=;
 b=kc/If0O//ews1GShBEB+gRavT33yXpnCeAL6kK0W31jo1ngT6Fa6To+9NZ/kEsitYk
 AuzFczxmjY0jIrjwllbs/YIwOJEajWKfbxozoAcx0rcrLoBORrzSG3y2PEwf2BE6a99E
 pAgxbAcwD0/tJXvYVLuDFdxW33cZ0ULjgCq/5otRut4lKw1OY0QtGSPUYpPFGub/ulNj
 MCqMtDiQWpLIKo1hO7gypc0O7VhSlaCQUlbBeRMI5JiCuSQ6sDpZGYaY8nBur+zd0gRz
 8i4YeGnshuhIX447SIqWtM01zKfT/cylKFO2JySGlzUin+1iPsZ52e/L8Ts+3QfjvmQa
 nhQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU79gFcnXqxGnwd3HeowjKXcQ8ErRjdN4EdUbHLmSidWm45RqqBIkLcQxkhSD+lYtm5IE5ymn5QGA==@nongnu.org
X-Gm-Message-State: AOJu0YwCG6YuZYne31nh9xz9aw6iSVOW7jHgdfkHsRmHgHOVFQz4cewl
 ZH/5VvYYOKLLZv2jVm5xK2BmABNRys/CtSxVmDwpkxCK04sf9Pp1BGHTLPqaP5aWwwk=
X-Gm-Gg: ASbGncuIjh5mPqMSy3aiToECLnVaMCQt7NUN90NOqi85oqTacP+E2vAvHRkqlEdzFAQ
 ejC2F+ZBVGH4JkpRPJf4bYUjnQCNPlaTCZtQEczjmGonEWshA/whZtV06ovm+JdrU+hgPvAi4dP
 LOEdcYfIl3eDT5PD1pZe9NxNPf202UqBu6/UTEODRvcbaltD1ondriEa2v5eVuDRcooUcfN5c+A
 5rNL7sHAhwBkvlHOhZ5zlY3WFORl4D0inKlO+5DINYeWMWKZEQMEY72/kjTj5cki/dUJtJq+n68
 DQDQfwHvRuwNAfaof1+FkTBvY9LvQeToFYQTsfallv4cmrSi4uXW3lYV4I6Mru8+ZwcDDwYGagZ
 AM3vwNgNAtFNzgIX6Qy30bnIudj2dleBFXn/TvfpTqqC7wPzMshoPAffbBKVyhkhzpwMS/+BY
X-Google-Smtp-Source: AGHT+IEZ2BdB+DDDUDUmqAGCaLdS1J0twMRD6GrR7y46Lkn0qIPsngqJjPbgGbfbHEgD6hhro3LQXw==
X-Received: by 2002:a05:600c:548f:b0:458:bfe1:4a82 with SMTP id
 5b1f17b1804b1-45a165e430fmr31995e9.16.1755019726154; 
 Tue, 12 Aug 2025 10:28:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b9163ae600sm918558f8f.5.2025.08.12.10.28.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 10:28:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 04/10] target/arm: Factor hvf_psci_get_target_el() out
Date: Tue, 12 Aug 2025 19:28:16 +0200
Message-ID: <20250812172823.86329-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812172823.86329-1-philmd@linaro.org>
References: <20250812172823.86329-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Mohamed Mediouni <mohamed@unpredictable.fr>

Factor hvf_psci_get_target_el() out so it will be easier
to allow switching to other EL later.

Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 47b0cd3a351..48e86e62945 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1107,6 +1107,10 @@ static void hvf_psci_cpu_off(ARMCPU *arm_cpu)
     assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
 }
 
+static int hvf_psci_get_target_el(CPUARMState *env)
+{
+    return 1;
+}
 /*
  * Handle a PSCI call.
  *
@@ -1128,7 +1132,6 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     CPUState *target_cpu_state;
     ARMCPU *target_cpu;
     target_ulong entry;
-    int target_el = 1;
     int32_t ret = 0;
 
     trace_hvf_psci_call(param[0], param[1], param[2], param[3],
@@ -1182,7 +1185,7 @@ static bool hvf_handle_psci_call(CPUState *cpu)
         entry = param[2];
         context_id = param[3];
         ret = arm_set_cpu_on(mpidr, entry, context_id,
-                             target_el, target_aarch64);
+                             hvf_psci_get_target_el(env), target_aarch64);
         break;
     case QEMU_PSCI_0_1_FN_CPU_OFF:
     case QEMU_PSCI_0_2_FN_CPU_OFF:
-- 
2.49.0


