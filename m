Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A1BCCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 14:33:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBwMP-0004hd-2o; Thu, 23 Oct 2025 10:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLt-0003WC-Oi
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:47 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBwLr-0001yJ-QO
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 10:31:41 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so687891f8f.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761229898; x=1761834698; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y25iYUJ6/iyXKTCTBsNk+6avJFehWayKoJUbzLs9o+M=;
 b=EfWX83uJquqDhJRr5SrQO47izZ76X5ek5wspiMBZxnQnv/y77MfRbKSPvTFmscUcTo
 qR6ANg5d8/MMYukMed9OBf/D4vN+Z7fDX+mujDimlanWoOaHeW+9Y5fZaldVAgIGFUXQ
 604o25xKUn1WfREIfjZ0nZ3d3Gbm5atOwiwxMM6IDNAQkurb+RjSCbLom4XrZHWYb/d6
 nGeZLwEMUqrSTh83mmbzi2C13yPa+VENZe9HkhkQFyOWiziR2USUxLZSdhM06vuxaQdC
 mU+dCssqGN21/ODdNi0QN/1Tu1nNb1ShSLKh0QWxYcCCTS5Nc5R2KlCPefAb+vATk81a
 kd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761229898; x=1761834698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y25iYUJ6/iyXKTCTBsNk+6avJFehWayKoJUbzLs9o+M=;
 b=j8Z/5ddB93Q9Ky2Thi2XujkYpoG/uK+w8ni3eMp3btnNVIkFNSi3UlQqOe60BU++i5
 G6HarSDr4+gfFLLpX5gdepECDYgYML9/YhQ4vVfnJDQ8GPdZ8Xnp3lYkUu4Smkwt7Axm
 KDx8M7UVVYXGfb0RRwOnylW5E29f00cJxXSas5PaRyP4nfsyVu8sAjuCCFsneHjQo3EI
 09crGyyZs72xdQA/5wjbw3Ea0oN9hWjhn2MV1UOJKAGjRtclm/WDjyCRCTDhPLrX/0P1
 91bYKFOfRB5J8oGpG8FRJ2f+gsEq3IoSoPjctLTy2eLVuLWDBFIfutXuSj5ooyUm8Vyt
 378g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUANlu19DI02lpj4jwDkkFrncV6ycT6hUesQ5FecpjqYEqRJOPdi7m2knNMYdKk+RqphQM7nEzWrQ==@nongnu.org
X-Gm-Message-State: AOJu0YzTcaKclPDu1kiwJJIrMXvQ59Sf2EzYo7AwsOvyIwdam1dScEQ7
 uz5m+dlh+XPxH6WlRkENNLO+KkXG6yvtNfw8Fe4ro4LxMdvsuDrivb+MfdJUiIrLDUw=
X-Gm-Gg: ASbGncvFpIrloYvcfsO5f4r/xdrZP0SJMYLsm8v1Y9TmYuR5FD+q3Ua3GY8QYAZiI+U
 BRCK4z62MO1t4AuHUpVtzQrp7DBQLwqWo6WDKVxcxqbSAE3yum1bdcQp7UTrT+KX/HWcK+HRiv5
 9kn43mn0uapxZ1ZBibZLnLT0l21ejrfAs8KM17gvgItHc2opKUmD7qA0olNSNYAjOXe4FwJtLbY
 5i+rSa5oiZDNlDkTKfKfCGS0xPMh5VtgtAVaHB0VErflKKS5hkQNG14mbpMc1hY8ohnVCuiePvQ
 /33aGQNU9rjH1olcAJgs0uvzdqOyuqmm+Gwygoz2OnvJ8PMCp+NtatnajotqNfXnpjxVlGkqH9U
 bB6ysyKN/7N2BQEmygJYBvU29QU98oxReQ7j3Vibgb9PqctMTNJ+QxKXfovxwr9XW5cfbeT1rim
 +nMzB97DuuPftWn0MvVfyWYDvIwIDz5Cvza6vKMIk45duiAYcI6aw38qWniQC8
X-Google-Smtp-Source: AGHT+IEqqBDXThZqURPuuI0fB68PXXmmwPJNSvl6KtIlYTuzwmIFWn7M+haWwaLGYiiJZsnpUFFlmQ==
X-Received: by 2002:a05:6000:4285:b0:3ea:80ec:855d with SMTP id
 ffacd0b85a97d-42704d6c57amr16021787f8f.19.1761229897491; 
 Thu, 23 Oct 2025 07:31:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429897f5696sm4542822f8f.14.2025.10.23.07.31.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 07:31:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Peter Collingbourne <pcc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 29/58] target/arm/hvf: Emulate Monitor Debug registers
Date: Thu, 23 Oct 2025 16:30:50 +0200
Message-ID: <20251023143051.11195-10-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
TODO: audit it is safe
---
 target/arm/hvf/hvf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 4fc92760934..67130ce27d2 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1596,6 +1596,9 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
         }
         break;
     case SYSREG_MDSCR_EL1:
+        if (hvf_sysreg_write_cp(cpu, "Monitor Debug", reg, val)) {
+            return 0;
+        }
         env->cp15.mdscr_el1 = val;
         return 0;
     case SYSREG_DBGBVR0_EL1:
-- 
2.51.0


