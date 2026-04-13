Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15832F531DE
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Apr 2026 23:03:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCQJA-0005Jl-BK; Mon, 13 Apr 2026 19:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wCQJ6-0005IO-Nw
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:03:05 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wCQJ4-0005AQ-TR
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 19:03:04 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b4650d5f5cso4846335ad.0
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 16:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776121380; x=1776726180; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKaS1DCDiqzxSEU5l7F4GxOxyESqwl7tvcmMl50HH6A=;
 b=ft3bMS7P73qPL0E5Sn68IWhlhELeTNzi+FHjB/9zOkbXOvc8R5kmZIdCMYt5eEpdN7
 5B9yBdHIWIjjXnu9DpvOYUEKOwdWrz99ruaVnRad5Jn4jxNllFZoVWsb7FP3vKQmVGN5
 tMo7krLayNdrNxYiGnMJ/vi8ts0QyZvdojlUm5GO30wERXWu0fU9WB16PKeoYF4iydWR
 pwNxFDLWgIzuRY1RanyN/0ymykQrM/gcBYcVkJ13indzPLMTn2AwvVv4kV59XN076OIj
 NB9rCWtrhu2BTYSU9DBxi6GwRT9bfs9wbt82jFwM/LMnPttH/dqjlW73j9Wq5tO/SDi+
 ERew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776121380; x=1776726180;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OKaS1DCDiqzxSEU5l7F4GxOxyESqwl7tvcmMl50HH6A=;
 b=plcczUxYR7nXaz/TDd0jpgC6TjBMU0yTosfegIkhxIliXTk97zW5TqHZSuAuv1P+UQ
 XfSRG4rGHZZQH53DI3Z1h9hBfcZpri0K+9+GB248WAkVbkLUY+uoErGk9xm9d+gEsJhS
 wNw0QI63w4wcdDP0v1pbZ8M4UPNzv9lrMDXsRo8ehybK/EyC5hrexvUI98y1H2JRL3FV
 hBfbqvgueFhgDtrOWqvooCCR9tMA55EMQLSKp6dqP3UDz3S0llmhqo2cMFKbGZTK9LlF
 YlcVUr1fPK5sF6B0uopc3ICritejdDig2YwsK2W8q3FDFV7R2geaM2jdt4mDcgkk98h3
 ABoA==
X-Gm-Message-State: AOJu0YwODoSJ1gNOw5OB/uFGqga6epPweDF/2EVvJxW0qoI72Os/pAke
 IqW1zfuyRG9cmq4DJrscDjre/mAn5YYXi3YmzUnqzGqpOGLpB8sOp9CM2ayyP/oyM3c=
X-Gm-Gg: AeBDiesSb6hRP7OLKou0qs11KeJ1kQSLrnk7Jc+pEbkkz1RTF0j2bh2//URZgFHhcbG
 1TUvNlvzG1E2XSABU3iiU4Ki2n2EqJgOKT3VJrinkBPUKGuZ/fp+t25ULn2W4CDzkQkxKbdpuf5
 dzNhY/6UpTHAPKXxdKi7+j9VdZW4E+S3UxEQGHFPLUXR18H6oH/s4fYMfY8fg3Xz4WbJBUEJfnT
 7H98qCGY+bU/eDlg01jIgoMcF1R0vJKxhbcUcZG+IsHlms01DsNyoI5u7xwkf1SwL7+DBvEb+Lk
 nbiXkOvGKpSqmKgTr0GOVgvTVnxxHh8HFbJjYQBg4H7P8OF5t62cT4Kwtv987yWGBcXtmHBOiiF
 WUkF0S7QGKM7ySnneDkkhBHYnAZrCjf1VZibcBe0zMI/k8OXvPbLee7+8OjG/STFYsJJJRe87ff
 CJdJat3tPFLvtKCS0t0iT4pmjV/W3DkxTlNg==
X-Received: by 2002:a17:903:124e:b0:2b2:ec6d:16c9 with SMTP id
 d9443c01a7336-2b2ec6d19bemr75223925ad.44.1776121380356; 
 Mon, 13 Apr 2026 16:03:00 -0700 (PDT)
Received: from stoup.. ([2401:d002:dc0f:2100:377f:61ec:6edd:e205])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2d4db008esm120507675ad.16.2026.04.13.16.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 16:03:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/3] docs: Deprecate linux-user/arm/nwfpe
Date: Tue, 14 Apr 2026 09:02:49 +1000
Message-ID: <20260413230251.22537-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413230251.22537-1-richard.henderson@linaro.org>
References: <20260413230251.22537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index a6d6a71326..e7023b96c4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -494,3 +494,15 @@ If the user requests a modern x86 CPU model (i.e. not one of ``486``,
 ``athlon``, ``kvm32``, ``pentium``, ``pentium2``, ``pentium3``or ``qemu32``)
 a warning will be displayed until a future QEMU version when such CPUs will
 be rejected.
+
+User emulator features
+----------------------
+
+NetWinder Floating Point Emulator (since 11.0)
+'''''''''''''''''''''''''''''''''''''''''''''''
+
+The NetWinder Floating Point Emulator (NWFPE) is a software emulation
+of the FPA11 coprocessor to the ARM3.  This emulation is no longer
+enabled in the Linux kernel by default for any kernel supporting the EABI,
+which is now standard for all distributions.  Compiler support for FPA
+was removed for GCC 4.8.0.
-- 
2.43.0


