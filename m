Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C19CEACC1
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:11:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK08f-000053-7t; Fri, 14 Nov 2025 15:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03p-0008MR-5m
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:28 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK03n-00057k-G4
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:06:20 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477770019e4so28052325e9.3
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150778; x=1763755578; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xopSbsh+IkB5STrBQ4YQZEElngQLIdle4gTE7izg1DA=;
 b=CQDBzIoo1wN6X1defK+qJL6S316WVnKHRL7jJzf3ehtQ/AABH0A8hQhP9j3bAZe62Y
 vSw0XtHMMZJr5Tftc9nsO7x5l5yvsapMC5NkRZO8Nqimzu5SCkAsiptNR6eONithjOxb
 3YBmsanXgadJUW5+/cOXBdUuGYfl0u7EKJLZIrbrIwK+f0qEsz1WI4w0voutKbjQBFJC
 EKxVlNMGpbJePGethwoFZHnfRP4MksCvTxA6DOa4yl0CnCOlngX/ySEM473U/MoXb17G
 3GgYAQxSrYYdOesihIo/FPws7aucm2aTI+jyygseUMTi5EuSuNC46WO8/4e7Y0VCz5Df
 LNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150778; x=1763755578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xopSbsh+IkB5STrBQ4YQZEElngQLIdle4gTE7izg1DA=;
 b=UdSOckbIqs5mgZDHx84SNDNI6Whh4quMCif365GNPxTjVHGGAkfZ0bLfWXPl+DI8Pz
 ojo3QjVJY7Ks1tf1swTtND2Vn1XC+BpVL9CQreTfyB8THni3TJ86muo9HEMPbY/waAOd
 WfC2RQTDm8vm1/OS2jPlPnpehKcOqDPkzqvJHrcWNkeBPqHlMMfQOZapvQHfp4v9zZWn
 EcfDLOi8DGhJeiO1V3+MvJXk0c6I/huRlh7/bfZy0Ru95r81iZrFiazOj0JCfRQlf3Tm
 BpbWUMY6Ueu1dOAzWiK6hNvjDLekMXh+afV+G34fP64DTROsG+sLH2Bhj5TSItDxtX42
 /Rtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ1sdWrBiegutEUGJ3FaIxGzSulZsqei4WKp8/nc0V29mlv7COdG5P2fFqWX+vFfxt9KCoYHuLLg==@nongnu.org
X-Gm-Message-State: AOJu0YzMBdhxEl78cacUNVU1UiLYUPwVJOxY6TT2N7atwBOd71+wUM0I
 W05BVIE2qURSfrA9cBo652NO4MHRcC3yPIFJET/B7WGOPHK+//ZtLwt6vExTX1on4EgesJs12/L
 4GmULQVPXnw==
X-Gm-Gg: ASbGncuiPcqsURdPhzXY8Yoxa0bEgwCeMbpcpS+GX5wsXVQI3fptgnWBlHxbTpGjfi2
 on2cGNMtxfHw5VonSdXmUwN63mYMEFuQ4yrRvUq95nBs+CA3MoykGguWSpNlsuHuQlD8xRGJaKJ
 FUPs0/8ifTNySgXJd6JWQQg2TN4rrjpXnDkXT29wSXXrRhYwdhzKcpoFJJPtTRv1ZktLGjWNOAX
 XP23rdXm5gwMPQ9k0a4AHyIbQO4D+/aVQ5Cjf98deyfL21f5t6u/yhUraA9eue9FZ3ovbccYrY7
 kndLSHM3mCWbzKYSUxlePsFN0SX7m6XD+f0/jNmwK60s9HsxRKBlrLGDD5nrdjjjh4zTI4JX4lX
 r9+kvo6e7BM4gRQ13veipgF9sMPMIg2W78g68dnelYD+m+y70onJP62RRh4fdD/lISKcZHfmquS
 rExGNexVrdwGw3HMVDV3ySqfSynAzGtz8TmgF9IDiXCrqdvHkfcg==
X-Google-Smtp-Source: AGHT+IH41REs9jc7+HGQfnUdi77sViMc+7C8b5QgWaI/7/9dqqR4bSTH/3gcvkJEh73yZ8VJPOUN7g==
X-Received: by 2002:a05:600c:6385:b0:477:9814:6882 with SMTP id
 5b1f17b1804b1-477981470c2mr1472145e9.5.1763150777988; 
 Fri, 14 Nov 2025 12:06:17 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4778bb2f9c8sm54243985e9.1.2025.11.14.12.06.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:06:17 -0800 (PST)
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
Subject: [PATCH v5 15/19] accel: Introduce AccelOpsClass::cpu_target_realize()
 hook
Date: Fri, 14 Nov 2025 21:04:17 +0100
Message-ID: <20251114200422.4280-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251114200422.4280-1-philmd@linaro.org>
References: <20251114200422.4280-1-philmd@linaro.org>
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

Allow accelerators to set vCPU properties before its realization.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/accel-cpu-ops.h | 1 +
 accel/accel-common.c          | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/accel/accel-cpu-ops.h b/include/accel/accel-cpu-ops.h
index 0674764914f..9c07a903ea0 100644
--- a/include/accel/accel-cpu-ops.h
+++ b/include/accel/accel-cpu-ops.h
@@ -34,6 +34,7 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelClass *ac);
 
+    bool (*cpu_target_realize)(CPUState *cpu, Error **errp);
     bool (*cpus_are_resettable)(void);
     void (*cpu_reset_hold)(CPUState *cpu);
 
diff --git a/accel/accel-common.c b/accel/accel-common.c
index 850c5ab4b8e..eecb2a292af 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -106,6 +106,11 @@ bool accel_cpu_common_realize(CPUState *cpu, Error **errp)
     if (acc->cpu_common_realize && !acc->cpu_common_realize(cpu, errp)) {
         return false;
     }
+    if (acc->ops
+        && acc->ops->cpu_target_realize
+        && !acc->ops->cpu_target_realize(cpu, errp)) {
+        return false;
+    }
 
     return true;
 }
-- 
2.51.0


