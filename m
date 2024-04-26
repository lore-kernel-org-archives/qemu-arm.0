Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638865ejb;
        Fri, 26 Apr 2024 12:47:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdo54waJnMZA7w5TNWtAD9BLBePaNu0SYhSw+9qOXoeAwTdmVGF81jFxMqmGHyb8o+MbhRnOBXnCYYzIHzdp8L2bsxB4v7
X-Google-Smtp-Source: AGHT+IGrcvDEteoMIrACz3RHGbONh7HbS7xTPSxunqOuqPCxb+VK59jKoqlWC4gFL52zaF93vLdS
X-Received: by 2002:a05:6358:2886:b0:184:c1b:4136 with SMTP id n6-20020a056358288600b001840c1b4136mr4136647rwb.6.1714160852635;
        Fri, 26 Apr 2024 12:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160852; cv=none;
        d=google.com; s=arc-20160816;
        b=kP1/++KgiS+mjDlcjwf49Ihfqj7o2dme00kMx1o/+EVkj9mXwaaC3cPqEEsNFioiuD
         pmPCDPKBHryKSk1nNvFYtc0vQ87rkuoSlPWRZb4QnEmXAYxewNUwj66J/t/hCVauiVBc
         S3nqk9KBVrmQs2S212f57LqKHlRC1YEmmY4bWnZYQDZHwNxjDBiBcXqqWQ6SfkHVzmEZ
         K1qrer4T5hvVUf3uMQ3aZQGrv212xFSySLgrNQ7RjycXsm5N5mx7Czg8zjjxmmNdvFfP
         ois7N7DXVbVcP+mG3A4mZEcM47hV5ZG/GxTQbPbInjHIwwKtFjf5TeyZjjgFYLpQ4UtF
         wt9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NnqT/8KLlXL1A5GjOlmM9XBc7s531rVah3xCrUywBWs=;
        fh=1toBfyTSePzZo3C4bv48rP4OkybQnEzyMlBrSu2IYKw=;
        b=NdLmqKLaXDVIQJ2BSaiCuuXHBj76WriLH1NSlyKOKEf1kj7o7ybamFMfjOCgmsPRA1
         Qwd64luv9IXf5AQyEHClVdWZ6tV8QOLp6Thluhums+8ArmxRtwE+YJ1kim/9CzZsA092
         TNle2iyXjqxP8aPprFGEJiWYjK2NgNxX1bSqyOTWOpLIJO1pMDq9EkA8BN84o0Q19j4u
         lXlCcdsYd8GWq+YCqhIIUXgOYQAdKvkQSdhC9r52AarwjFQvJKcOT56yGzOVgqMRNYb1
         f7TxhFa7ioxdCueXLcpeuUeKz4SVBeankqIIlQLIvzPI5kCX9YHhA5+D0Omw2eZSLZk0
         J5fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ji4Ua1XC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12-20020a056214124c00b0069935d75206si21447535qvv.496.2024.04.26.12.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ji4Ua1XC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RSy-0000a2-Hs; Fri, 26 Apr 2024 15:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSr-0000LQ-Du
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:35 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSo-0002oD-9s
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:32 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5724f26b8c9so2604265a12.1
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160542; x=1714765342; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NnqT/8KLlXL1A5GjOlmM9XBc7s531rVah3xCrUywBWs=;
 b=Ji4Ua1XCpcu/s4+b+Xk1OStGLCOaPVhLeOufT2H0YXy6CMSTQyRze2tOpW2zUIHgoz
 2gAj0XAPgma4MQPWaiyR232g9XD6jzdKp2BY+Ekdo6trYcgAmhdDmXYWLYAS/CWbYyRt
 UHKYt3yYGaJFwpvtKfy5addaJrUmW92wM7xZH4vwOJOQIisTZq/Ikv1uMGTb+HbnF+4r
 j/QlwgNW23c7/V7RcU+Vd4i47kUkfh9fi+KDHbSjOdaDTtQhbnwaqXoOxi2fm7AfcHWd
 xxlgLPxKxCJmpyJdcnjVai+9xusOOJphGrlyi53TX+bYf3xdJp+eYMYEpPadY56Vukyr
 FCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160542; x=1714765342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NnqT/8KLlXL1A5GjOlmM9XBc7s531rVah3xCrUywBWs=;
 b=GnLg5MwsdySPFOGUneTzEEnP6qrgspcoW/dcrGwfLiv8czzd+R2/riJSO3efULIq0g
 I+tBlq1QrqPAZT5ZVvxZ9KMGVuPEueIAyB+v1ESbTIc2AFvX11uo9uNcEjg4asqdL+PC
 wXV6yQOUnlmYRwofglOEZNuoDXrWFIPcYhJvFgoV09CRhklnClK0wKSzo7j+citX8QpZ
 lsYPeDw9uFUtLnu0K78ZgJQiuEsOO8aEx+hEua8drzY5P4Nd4zOKfZ20dSkcA6SIIPLW
 jqR1JzdneyfLeMsMCrk16yDEuMsarFNn8A9BiYUc1vAYbuAhJDc1+trcoXakl0N/jXOQ
 FR/w==
X-Gm-Message-State: AOJu0YyRNgkRYEX443fFVDBsYLuq+MH4bNgpNKJ+l8E4yRse3xyXvb2Y
 NDTOf+xUUwo0m8NFSeTHO/9GXLiGSds/fHmSlvbLORhrfN2xeVYCON0GaQCii3j8pDqZuARE0dH
 qz48=
X-Received: by 2002:a17:906:1950:b0:a58:9899:89ab with SMTP id
 b16-20020a170906195000b00a58989989abmr3098213eje.22.1714160542218; 
 Fri, 26 Apr 2024 12:42:22 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 q10-20020a170906388a00b00a46aba003eesm10856553ejd.215.2024.04.26.12.42.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:42:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 03/38] exec: Include 'cpu.h' before validating CPUArchState
 placement
Date: Fri, 26 Apr 2024 21:41:23 +0200
Message-ID: <20240426194200.43723-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DoO+a7bvLFyl

CPUArchState 'env' field is defined within the ArchCPU structure,
so we need to include each target "cpu.h" header which defines it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20231211212003.21686-2-philmd@linaro.org>
---
 include/exec/cpu-all.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 1a6510fd3b..b86209fc49 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -391,6 +391,7 @@ static inline bool tlb_hit(uint64_t tlb_addr, vaddr addr)
 #endif /* !CONFIG_USER_ONLY */
 
 /* Validate correct placement of CPUArchState. */
+#include "cpu.h"
 QEMU_BUILD_BUG_ON(offsetof(ArchCPU, parent_obj) != 0);
 QEMU_BUILD_BUG_ON(offsetof(ArchCPU, env) != sizeof(CPUState));
 
-- 
2.41.0

