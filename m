Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576A7CEACCB
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:11:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK08h-0000CC-EH; Fri, 14 Nov 2025 15:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03z-0008T2-Uu
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:39 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03u-00058a-Rk
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-429c48e05aeso1446971f8f.1
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150785; x=1763755585; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/Gn6pj9/95Lzbm+SIWtnMyaV4WJR3oCGo7MQI4hS50=;
 b=syZL/YGVeiERCX3BxI5CnkhKrtVXiCcHDeCM1RV5oQPBvdwBZkGsIbmJLfl9vt4DWl
 F1bBrX1EShLJ3m69ZIKmu71xV2nMUqGrpKbZrjqqSC9usfEY6hHyagIBDSJ7VpsnhoVX
 cq9PMV6lKFkpV42oy+uHo45gV5RLCMryLGM8swDR92Hj3rATbnMWaYjWah9jYZmUjObb
 FTS7sny1XgLXlWWEK/sM9jdZoroztRtYAVH+CpNY3GxbIl90gNDRk+/HA2lbgX0GxH6a
 jb3iIkBFhKp7iOkELDVIzVR0vSzLOkh4c5f3sW/9A1vN7OA2ABApECGljZU5Bmjlg6Pr
 nZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150785; x=1763755585;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I/Gn6pj9/95Lzbm+SIWtnMyaV4WJR3oCGo7MQI4hS50=;
 b=BJ4OJzHmPEyQTacYX8z5yw1+MbaLZLnUESAFG1TtNW9SSLu8rYJCFSvpH+5xGptnM5
 FuPwQQVEAoQji3vntQw/GEColcmNplYnQAxRJ5oOLkPUIVtYcjV5us/D2Rq/LgN7w5V5
 Yv9PgvTWslyphTL3y9TDTG5V9OUkHJrV/SOCmDvbd5QZV1bznG/tHNsLZ1le05HXRrgB
 iW7GyMNVdSYtitMXlorn/0wmVBdldC5oQQOblLb06EwZb0ASO6gAHfP0BOzu7ZvWWLWf
 qbwJIxJ7wCTdl18mRo54ubyrRizxz7EqVrU3I/8adDdxY4EvgRxPxxlh7Nyhu/71dPtL
 PVGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMw54pT+V9DJ/IRbOtyw4oli3Ikgx1WNy2JsryOJLuVjRmvSDOGNUp8pSaacq7pFe+j71P7e4JDA==@nongnu.org
X-Gm-Message-State: AOJu0YwdKLXJzUX8UiwPrVHWGTQlGQcW/6KkPIFdDt2pqIX3e6Bv5CHn
 lf2FHyfs0Rbkk4+a7oAb/HyxZqqseSWAknIfDpbjBleZl4VSxRozkqfAz4MPhSLzDh3vMAIG1jt
 hvjjYbaL2tw==
X-Gm-Gg: ASbGncsq1/Bh5Gb7IofE+vD/JDIx4HuNFR/ibzLF3dZqXwlyqn4i2R3bXLEhoTnMJo1
 zgyAoavBeGqwhj516r5HWueKohUCkiI2qlDGfE4Qk8Ogfbj2w5S9FpmQdZ7Y5W5NAjACTiJE4lE
 wAlpkL9JscQH8xW/W5ai7v9o5mA3sorvudCABd3Y0JYdRTZwqytAf1rh7bbrq3DYhznjm6wI+9P
 7UR4C8bfYY4cLFgEltOASA9TcmBDUyS8MiSoNoY8bpzbH092t/HZWsWz2/3R/g4NejyjQEJrog6
 BEyoWlViuXBA1/2MiJZYtyy+VngqbB1ABEasOdPhSVGwMlsKypfZJ6wOGFQ68ORH1ZrO9VrxIsg
 P75UQ6fhJW5Hhr8an7x82XfRT7imY2bQvPvos9nFya5a94/F3F14dUitwzshZ4uiwSJ/QWsJnnr
 ZGNuQjYlyEWlT64T29z/Lt2bKbT0c3qVGK0kWIZYPr9Y2fvOLFpA==
X-Google-Smtp-Source: AGHT+IFAqMWC8AmiJ/xDPOeCoz1E3glovvClUZmiH6C3iMUJ9mnK8XLfUoS/CdKjeK5987QXHOVMUA==
X-Received: by 2002:a05:6000:200c:b0:42b:3108:5671 with SMTP id
 ffacd0b85a97d-42b528452c9mr8159397f8f.29.1763150785163; 
 Fri, 14 Nov 2025 12:06:25 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f21948sm11798996f8f.43.2025.11.14.12.06.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:06:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 16/19] accel/hvf: Add hvf_arch_cpu_realize() stubs
Date: Fri, 14 Nov 2025 21:04:18 +0100
Message-ID: <20251114200422.4280-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
index 5922eb02e70..02c5d01670d 100644
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
index 59a2ef53629..8208d345daa 100644
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
index d0ee00425f0..1b189efb4c7 100644
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
2.51.0


