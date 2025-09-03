Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A430CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:08:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkQ9-0001EC-8c; Wed, 03 Sep 2025 06:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQ7-0001Cc-8s
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:51 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkQ5-0008He-Mb
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:08:51 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3d0b6008a8bso2748318f8f.0
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894128; x=1757498928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XUv2o7XYM3Yj8bVioCcShOQTzM/BJdBEyBoIR/9VMY=;
 b=oLBNO9cc7hRaRpQe0x6JtFXnG+OwWBl+Y/HN7XIhIMgU6e2EC3Fe5lJM5+KVmJBOT5
 fA0Nr/ysxtA4rqIC24EdUOBH/A2KCHyo7XcXHSwJMKEPYu6J0AVDCRkzUCPPud6DYFoM
 jAa8bNeX8EWpSY0GoTXC0GJP75FXyqoo6jIauaQVu3AxvwucpiRWtMAkdYxJ62JiRgFe
 XD2354kplg7H1s9TAOD5mj7qba2XovO2mdA4XpC38Nd1FxtFtR7Iq4lE7nQYBFO3k1ku
 pVuhhDcEGZV95aPYWO/OhJMwZAnNHXU17sRIUXiRccbhwebY4ti+zWIfrMVwBUcWRQYY
 K1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894128; x=1757498928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5XUv2o7XYM3Yj8bVioCcShOQTzM/BJdBEyBoIR/9VMY=;
 b=Ej8Jh2kw1d/4LtKYlu+v3Gn2wi0C+Ff//14BjHXVFujmVxsS/oDG7+i5Ps7wOGYoGP
 bAmiDHOMZmLFJ61JpLjWhSOM2gTIUcDMjVN/7tnXfTV4zpo2X60EX/O3K+NRARXfEnq/
 O/EeHDpFKsoX3hINLlnPDIXBlz6Ky9PPRsk3KWtL+BY3BxJoGB5Q5BI7+/7NxSeIAHL8
 TJJL5hK6AV3gbZnY75ZcgB0Oc7V5uEzVXeJ/36RQeKeE9eoHrLHqanOa3lV1ZdsahYpK
 26Yh+rCRCg7t4viFpXyM0Yul8acIfHxLH5PttRhqxLHRg/QdhEhOQ7bflLwqHzfWUYb7
 XzLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeGw59RKU3NXObIggPOSgxHMGcorilM7A8tpKaC0QyX0eWXzi1DEgenwWmZl5e8kLt+VmR6j+OVQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx7RIOKmny3oL4sVjMs56NrRymkzbW9xbL/YImpeNY306wukN3U
 2H/cLImM/qrh7hofbGIqtpsfxb1iWr01ArM3AqS7OzC4BfobJbWMZ7Il54t5JFJctw4=
X-Gm-Gg: ASbGncvNJwP80+vL5Lwp4DZkbto0lY8wZg6bHh6pGgC71GHsZsIP7JrwzLEbK2sbusL
 BZPAHtmtd+duRLuS7zYWUXePDXBha0h+UpiFQYODQkguIhIOlsNMAYA8dAoQZY9LZEzOpey8hVr
 YSGjKQkILpR2HEQE+Pp6lXLsT6B2Ayq0VqMNTYv63busct08m0/r6f4CwNSlI6DlNutf+N+ygRC
 nbck5+iBbeOTC58wkqETT0o4t8VQdneC1oVrQObMkWLMaNQkC9Rjhn2RVy6ZvfxfyJwRjFyosS0
 bgtyUSVhSnYAT7wilLS3GQLcqqYY3GtDtAyxKWQi+45HL5J8flwoLfeXi/14zdPzTDOc6EPLvaE
 DS0+R8t0TlcZOsIk8xsPnKie4Yv3Rbtt3HCibFxa8XGL1lUvTf5SDIpkTUJohEAYa2prWnP04pF
 rT+GiULe3BkeXoMb3x
X-Google-Smtp-Source: AGHT+IGKdrRh3wKSM6O6crTgtfB53HxsgLd5T4oN7jiPq7tKuTmdzD00tnwfs9knYbfO/yzbvm349A==
X-Received: by 2002:a05:6000:2585:b0:3df:58c5:ef94 with SMTP id
 ffacd0b85a97d-3df58c6025emr765309f8f.40.1756894127917; 
 Wed, 03 Sep 2025 03:08:47 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d701622b92sm11754594f8f.58.2025.09.03.03.08.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:08:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 10/24] target/arm/hvf: Mention hvf_arch_set_traps() must run
 on vCPU thread
Date: Wed,  3 Sep 2025 12:06:46 +0200
Message-ID: <20250903100702.16726-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Since hvf_arch_set_traps() calls hv_vcpu_set_trap_debug_exceptions()
and hv_vcpu_set_trap_debug_reg_accesses(), which must run on a vCPU,
it also must. Mention it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index a7e4b869b04..a9793060579 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2317,6 +2317,7 @@ static inline bool hvf_arm_hw_debug_active(CPUState *cpu)
     return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
 }
 
+/* Must be called by the owning thread */
 static void hvf_arch_set_traps(CPUState *cpu)
 {
     bool should_enable_traps = false;
-- 
2.51.0


