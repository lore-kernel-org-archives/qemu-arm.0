Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F99CA0EC4
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 17:07:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVyx-0004qb-Hk; Mon, 11 Aug 2025 13:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVyv-0004pX-BD
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:06:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVyp-0001mw-2e
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:06:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b783ea502eso3256924f8f.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 10:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754931996; x=1755536796; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4kCcMKgJsUFQdM/mVU8Sb2r9KycdWMl/tLnBwMf6U/Q=;
 b=oy/l4rcInepRoex/IKDezCvpAgxqsY/leWH8zOO35rCDZvfMUaUZkus1icH2RBLMa9
 nmxfxPeMOAo4C3TfUhRrTGCi+S08HYV569JdpfnkdcxEoAwNKARIc9gf5wX9/LzxJMEg
 MwBPM65hUbakaRTbYWV2x776bfbD9ElEy7ljjDmMSkytCOlpUp4uH+5nj0R/ryBRZF6n
 ioogttgRz90TCFvgUfgBG6yQHDchtvYPWi6wvjF7uuCD1EbzTfz1u/nIz1Moc1cjq1qJ
 FZFtGV5F4aGlFh376rdDE88nvrXP9bCiJmESrxkpoQiIDNPVBebOjOl0P/Cpl4UT59oS
 qLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931996; x=1755536796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4kCcMKgJsUFQdM/mVU8Sb2r9KycdWMl/tLnBwMf6U/Q=;
 b=uy6yH3D+G8QfmP5kIk4oneC6j3ZpNzr3NfTVLn5YZ+RVuPFuCMQ/w+nPhLaxxroM0x
 9vyw6rQeqEe6UyGFiyR1wTZf+L+FBzJMq0NpNPgI9rFPzzVHHezcfu3m4OmI3woXuqvD
 v+vMxqgSXINg6p2ITs7+AV6MYLTBI+m9zj7uxrq8PLDPA7R7U9Y/UDdOFF/RJe7sOvOi
 Mpd/DdJ6T+gggWZODDoMw3qEiYY0iD5fBZj5cZxg4Ez+cSJaF4zzepEQGdBznyRAiGtt
 dJ7PNsfQzIfVHmBMdML3axE2x6+ztT5GVWC+GZYigzpI018tYjMMHkH3aqgbEv7b6sfp
 09aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9ARGQ/+wvg+o64mJzirFj/fxrQTNoyJIGJ4lC0IPPFrCwkkh0gGv+ViJQOwObnMmTfxfl5G0BrA==@nongnu.org
X-Gm-Message-State: AOJu0YwbKigc1cA2HCrPY3UnVJYb0atNIqkVsWaVCGnEP3OA+P2fCLSd
 8LgagtV803nCMXEORkiCxrE70TLYrvc0zCI4IvWcJwTU6P1SA7Qff9vsTnVQ7FmHvvA=
X-Gm-Gg: ASbGnctIpjfZQUDcPJKdnpxoRmfM+1Y83jdQFLq9nbzfpiG2yZz7tzzPPm+LSUw+tbD
 +LP+LlwEyMBsPFx+ZiCnAJ0bfdKFrwTYuCLStVmyO3AfpY3e2l+hXNqvugt2F2heUzOB5gtlN7E
 YQEs5o7PNk4BpYFAHeGN5FyeWxdUmdm9x+0tyAXR2BmmuhQOOxmvVK5ofpoP79Qa4ncyrPq6bUx
 5HguOIfZpHAV9ZfzQWdjpIcGgB4Qu0pvKozYcDLJJdkPZ6o3aLNWT0FBmmN/T2RdJBUlQRICmwI
 yPR+i6RSB/BP6k8QU85S/ZKwrmeks2+t6ipcqY3fVA87rf9oy0pZkY7CP3q8z6ta0PPGJCA4aQg
 5gYmLOJel2RhanvuDn/cRfFIzfG6TBb3AzpDwbvk3BGFXOZDjK8d6NSitNS1n8JYzpDtUAWBL
X-Google-Smtp-Source: AGHT+IH0cwxj5ttg7X/SuYwtZcuM0ETCatH/wcruBaxy12H3LRe2v4MWcJy+yEUAgit00aPOKJauoQ==
X-Received: by 2002:a5d:5f53:0:b0:3b8:de54:6e64 with SMTP id
 ffacd0b85a97d-3b9111b5fb8mr312079f8f.26.1754931995845; 
 Mon, 11 Aug 2025 10:06:35 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0846777sm31486669f8f.48.2025.08.11.10.06.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Aug 2025 10:06:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Miguel Luis <miguel.luis@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Haibo Xu <haibo.xu@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Mark Burton <mburton@qti.qualcomm.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 04/11] target/arm: Factor hvf_psci_get_target_el() out
Date: Mon, 11 Aug 2025 19:06:04 +0200
Message-ID: <20250811170611.37482-5-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811170611.37482-1-philmd@linaro.org>
References: <20250811170611.37482-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Mohamed Mediouni <mohamed@unpredictable.fr>

Factor hvf_psci_get_target_el() out so it will be easier
to allow switching to other EL later.

Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 47b0cd3a351..81dc4df686d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1107,6 +1107,10 @@ static void hvf_psci_cpu_off(ARMCPU *arm_cpu)
     assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
 }
 
+static int hvf_psci_get_target_el(void)
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
+                             hvf_psci_get_target_el(), target_aarch64);
         break;
     case QEMU_PSCI_0_1_FN_CPU_OFF:
     case QEMU_PSCI_0_2_FN_CPU_OFF:
-- 
2.49.0


