Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45597CA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:59:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0liQ-0001EH-OX; Mon, 22 Sep 2025 14:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lgS-0006At-Tg
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:49 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lfU-00052n-G6
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:54:35 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2698e4795ebso47458075ad.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567222; x=1759172022; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TShQhvQkk0r8kwmD31rsIF74/vVO8BlgWjtZI7/oTSM=;
 b=yhD1Q5t28H7xSwacFqTjjKYycEZd2GQPVlxVjoVv9GYfW85z926SjeSi4GrVMZsvCf
 CamX0xyV5RIsQ6V37qItCusQ8QUbYmHl2izRnWjpkFB321H+z298habIJbgXb9vUU3pu
 HVdjUUSFWtF3EbfrP4wji9BrZjK+vnLoOt/nwHXGzqkLqlDj0DRAT+b5k7BE20zGZ8Jk
 4LoJZIXus79UUKitdFIIMvCSEo++YIzNhZahKOBTA4k1di2D6WLaUq/huVXhCs241ZDv
 awtmUH66D3sbFh7ow0K7sgZ6wOyPNf/axjuHhSN+/RxtviXqIu2P1yxUxdLk7RSmc3df
 B2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567222; x=1759172022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TShQhvQkk0r8kwmD31rsIF74/vVO8BlgWjtZI7/oTSM=;
 b=MBIM6Jbmw50NS2LsOwvPUsDDfFdNeCNJHGaq8iwznpPn7vGpEIAaF56uBqAW+M1C03
 roiROTS4bb9NtxuND9//j/TeiBBZARGxZ+zlvTcqN2shBf2h5enSPX52a+kQPwlasimy
 hjcXyuv8gR3GmaLiWdqLO6Gi6jgqfMr5xqwGvmO0aQ8pjSmUQjfuZ7ERj5n/41tAZCIU
 hLfIZZGwO1E12jv/p8uaPokKaihNLgkI2o8ash9bJKxMo3jOrAHokXhoAm53mkpjKfyA
 n4uFDxeLXc2t0Wi0pC5aubUPf4TsChT37XGDBkKjvI0wTAR/6wPZw0N/zvyUB+F03dM+
 A+0Q==
X-Gm-Message-State: AOJu0YzDbMsTGvsgn2HquX2ZRaul1sOFXDbeXshC4ut6lGyilGvDrCKY
 S4LHjuP2O1LBJD/UX1jEJxZiUQZyQ6/0qjP5Hi2Ji908Qoh79BPf1OqQevmm41NDF0U=
X-Gm-Gg: ASbGncsdonM8WMIZtlOpplxA6buUPQ2tOwvzF1e/Ch6nccdPp3QT4yKG0p0A7t/+6sP
 /H1VZSsfssDqqUF0TUjPKM8EASbR3mK9Grk75LjK8DGD7rfuAcTCtiL7seGhHvb0JKqVJJ2eolB
 HtdEpmQ/bQXZVPXGRFnSaYp4t6BKR0ZNtD7Il6PsQxX65BrxvEA/N3t0ticlFgapO7FqalUD29c
 Ru744qy8g8o6WLpojWKCGhblWyLH7k6luvOp0Ep5fz7rU0l8YzwDdihfEsVTBc68VCezWkKUpDu
 crp06wCp1+WDlpS2yJQrIOdHvKBAZj1qtTIXemq5UdTXXAAwFszK3EWI6kvDgAZFHYjRIpnjyPP
 xGvWgYAnXkJvP5n+GRRzSWBDgxHSi
X-Google-Smtp-Source: AGHT+IHy+NiEq0EnPsUFsqcW5xhWtpj3DbTWRLQCxEVHdXkA/yKAveRZoFM44VEFLntx/Jj0IvlLGw==
X-Received: by 2002:a17:902:ecce:b0:268:500:5ec7 with SMTP id
 d9443c01a7336-269ba3ec4e2mr195656955ad.2.1758567221608; 
 Mon, 22 Sep 2025 11:53:41 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2698018a472sm138554795ad.58.2025.09.22.11.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:53:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 71/76] linux-user/aarch64: Inject SIGSEGV for GCS faults
Date: Mon, 22 Sep 2025 11:49:19 -0700
Message-ID: <20250922184924.2754205-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_signal.h | 1 +
 linux-user/aarch64/cpu_loop.c      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/linux-user/aarch64/target_signal.h b/linux-user/aarch64/target_signal.h
index 6f66a50bfd..e509ac1032 100644
--- a/linux-user/aarch64/target_signal.h
+++ b/linux-user/aarch64/target_signal.h
@@ -7,6 +7,7 @@
 
 #define TARGET_SEGV_MTEAERR  8  /* Asynchronous ARM MTE error */
 #define TARGET_SEGV_MTESERR  9  /* Synchronous ARM MTE exception */
+#define TARGET_SEGV_CPERR   10  /* Control protection fault */
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 6060572eed..41d6b35498 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,6 +89,11 @@ static void signal_for_exception(CPUARMState *env, vaddr addr)
         si_code = TARGET_ILL_ILLOPN;
         break;
 
+    case EC_GCS:
+        si_signo = TARGET_SIGSEGV;
+        si_code = TARGET_SEGV_CPERR;
+        break;
+
     case EC_MOP:
         /*
          * FIXME: The kernel fixes up wrong-option exceptions.
-- 
2.43.0


