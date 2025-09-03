Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79A0CA1009
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 10:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utkRZ-0006P6-8t; Wed, 03 Sep 2025 06:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRD-0005fd-63
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:10:00 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utkRB-0008VP-CF
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 06:09:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3df2f4aedc7so263865f8f.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756894195; x=1757498995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oCaAK1U7AfzQjqZldPBE5RveEpShlRIboizZxhe2VkY=;
 b=h0bklGCQv/xiIteVzE4B+ytaBKY5ziCFDSVtfVemH5FW+XW9BOhZ876QYVxyMtlw9S
 ujNVpDWFta2NiCtThwUk6584X2OAcgxD96qox4Z9GXHsf91dheONKvJZpAmU/apd6gSx
 1xiFwX97SGaLGPwFTv+yd3LWcbUD2vaNsl2u91z/64i0aTAYQhKScvqmjza37A5pon9+
 85fxmtrQgR5LdikhmekRjBfMLyexAv0uWR4pIROJOW0gdp8bPILfwla4w9CPOmWlVv5U
 Q/4BPpD0MQXdLwuuHLJvD2H4APfD9WoDLQ2z1Z+7hew+wl5opL40R27M64iY07Ut/fzF
 2zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756894195; x=1757498995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCaAK1U7AfzQjqZldPBE5RveEpShlRIboizZxhe2VkY=;
 b=jyPoju0ZpBdL+kmXPBg03GPJ5v2bHciUOA8rvvl7Ixm5kczPoPLoS6tUnjY4NvzSxc
 BatVZnfrwu6b5AipBe/I+EEAb/I3fxsjWiy0pP0Uabbok/3sXd4UzP7IyDQnohqw0tQo
 v5mLSjp8MjOSbWQl5sCbZHQT7jK+D6Gc66/lQMqVf5fK5DiSmaJgGBWbhc5eJwGXQBDZ
 PGSfXVIrrjjcACDELTfJTr9kn8YK8io3FO++1w0WkzB4K1Ohhnbc8StRQhMVl8/t6ZQ3
 jE2FFbkgBZULu7xOEykJn1LlhkqJPGEttZ/z/Z0f1Pb2Re7QeJkcUhu0Bbfd54ved/8D
 yDNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+J8JkG+nh5GRwfaFQl3ywZAQdvxwszJPi1HPHof+wz8ZsZH5+x/PEfufpN/qiT1TiMiu11IL2OA==@nongnu.org
X-Gm-Message-State: AOJu0Ywi6jc5ETIRymGASuLWzW+I/psbTuxtU+AsM+RPmMdU1Vy9DKGv
 LGCDYAinLCzkpktEKTKaDKTIW99O0ADq+dl2jv7se2Z8itH5y6yhdKoEk1a+1zBWDAM=
X-Gm-Gg: ASbGncvp9mEeAaqv2a1kpUqz4TznqLxj9VlRPj8LpHRwCZanxRgzKer237jiSzPyxDn
 K4xTsaqen9+ht8TGfRXrXBFSZjacfzH/tR/b2E+p3fT2zFkJdvIft42DkrduXUOFgea+53U2Amz
 7v9/ca7ZarniZzH2jWDbHPm8wZMNU+RyGtOY4a7f3LFaZwZ/hQY6jxK4x3Wn/CDkfJlBMVRC4IV
 UXdUGO7MNrHGT4SZEjRU4dCBQbL3+Z/DOM1mRYmDp6RhjG1hlU52Q2Xyp52FdOiGYwF/pVpXnQ1
 a1BlJirrtfhAh/LDf4vwl3GX7HPzmlxAsW25wOwhujHirsrK2zKXCoSSgoO1SAioTQDav2i9Fo4
 DTcxgM03fz0Tirjqq4WdfZlU+PGGO7oNcUh4cYGTtfhsPFouH+g0hQklzSLoaKAr9vC7R99tWRf
 VvWzmaoeID4TlMjeNp
X-Google-Smtp-Source: AGHT+IGU8BAg7tq431LWl+B0LEsfKkDkREYGOYoLoyFgBZgv+sRl6kcDrBAKCXXTt4l3HFRmI9CCoA==
X-Received: by 2002:a05:6000:40ce:b0:3d5:f5ef:3bb with SMTP id
 ffacd0b85a97d-3d5f5ef0766mr8304072f8f.11.1756894195377; 
 Wed, 03 Sep 2025 03:09:55 -0700 (PDT)
Received: from localhost.localdomain (98.red-88-29-180.dynamicip.rima-tde.net.
 [88.29.180.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45cb687fe4esm11930835e9.23.2025.09.03.03.09.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 03 Sep 2025 03:09:54 -0700 (PDT)
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
Subject: [PATCH 20/24] accel/hvf: Guard hv_vcpu_run() between
 cpu_exec_start/end() calls
Date: Wed,  3 Sep 2025 12:06:56 +0200
Message-ID: <20250903100702.16726-21-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903100702.16726-1-philmd@linaro.org>
References: <20250903100702.16726-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf/hvf.c  | 2 ++
 target/i386/hvf/hvf.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b60efdc1769..40ec930d244 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -2154,7 +2154,9 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
         flush_cpu_state(cpu);
 
         bql_unlock();
+        cpu_exec_start(cpu);
         r = hv_vcpu_run(cpu->accel->fd);
+        cpu_exec_end(cpu);
         bql_lock();
         switch (r) {
         case HV_SUCCESS:
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 73c50175048..cb4af70e91d 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -749,9 +749,13 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
             return EXCP_HLT;
         }
 
+        cpu_exec_start(cpu);
+
         hv_return_t r = hv_vcpu_run_until(cpu->accel->fd, HV_DEADLINE_FOREVER);
         assert_hvf_ok(r);
 
+        cpu_exec_end(cpu);
+
         /* handle VMEXIT */
         uint64_t exit_reason = rvmcs(cpu->accel->fd, VMCS_EXIT_REASON);
         uint64_t exit_qual = rvmcs(cpu->accel->fd, VMCS_EXIT_QUALIFICATION);
-- 
2.51.0


