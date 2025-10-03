Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4295ECAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:32:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jPr-0003yf-IH; Fri, 03 Oct 2025 13:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLj-0007mV-Id
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:44 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKD-0007un-8R
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:42 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7833765433cso3306365b3a.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511523; x=1760116323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gclATv708qJLJB/SCyo2oWtJwkQ64mZdma6VCmxYGoI=;
 b=RsosVuVd7LAuh/9nkc+Qw/e3lQ7Dk9ttmbkVBK1MJh3d8vvlbMjB5U5ZH8pT4y4aA6
 mxOiNLVxO1WtLIf+25LDdFk5hZtxnhWrRe1l8nlAlGgN58vOx9UCUYPtVx7WnUECnWpC
 Ao/KLoNy2IF6X1vktiokbN5hzBGsazc3W23fjz3RBXlNviJWmTSkVBbCZh/KMEYQP07U
 W/xcNwjJ5z9VoH3Y9yLlKGVLbcNrTPleMIBz6h54zoJz4EHiOlYbqXllH1EsCyo4MI6j
 80b54yVG17Q9ZY18l4sYajtFoEeCt5knbSKv9XuY9Hi2HPfLQgQC7dw4PDKWWXXsd0W3
 ncVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511523; x=1760116323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gclATv708qJLJB/SCyo2oWtJwkQ64mZdma6VCmxYGoI=;
 b=S7MF3uTTq7xhgpvXl11vrNEKhwE8Xopzc/qJgK7n9OIA1Gj6hL9azOqDqlYQZHt0b+
 ofWaLXowl9mb/x4NK5SyervXXzGu5rRS0/4kH2sTj1tAlIhE+wjYzulCExMD/Q+hCKkl
 LH+hI/Ke8V+FgckX/CHB4xWk1BZHekue/bdN4gdk1Kd2A3WcF5rfdnEoneVYWGSleCDK
 VZv2C+ubhN4m29W/UEgClx94+ROXDg9K32wwuORDIezF44nGgvK0Z+4k3xk767kKcPkP
 sywESq/7xcjWjYsxP3Gt0lJoyq+VsDaM+1Ni8YQDMa51i6eKXJ0oh4/jv55wJEKCMB7b
 wtAA==
X-Gm-Message-State: AOJu0Ywyq0DaptUGrNYuZD34z6NyFqIN3II75AvcXPvrehMLlsOTAHi2
 x+3KE7064WrfMXWnpOqNM0WQWDkYdyCgF9zWkaQEKrK4CFZZnEdazNjwMi4UIO8nTos=
X-Gm-Gg: ASbGncscLYgHcpnRKyJ08sm9abGSQN1QCS7/V9WtWgoA5MI8fJq45mWrJvZ9RN5qGwY
 f76OhOTxoZKwqzTaDgpeY1KK9JVrZYK+A6N1SEMQBzAJqsLTrBf32xB9mDC4/TApAOks12NIWCl
 hRyt/GQPspeMfW0xx4Of+Lc9msNBU1OtP9P0EF/sgG1UMO5GVhLIfJOE+Hmf9g0aU9UBiO4YSad
 QNaT6nRXhuIhuPX/O8JtpcnoDcebiY6KAjcwSBKhpuBY747KBJFx2jQ1qwXyxjAmrHcb8GP7NNN
 /dHTuPjPEHZOA8xu6nsQ1QPJGvKNwfuLeYAmySYIvFayhN9upkohfyibPmauZF5oZUrieBSNKUf
 DXYDZMNGxkLIP5Y/e2MgwiuDCqmn0eFz1vRLEmWHyPC7vL7b7zh7vGNIO
X-Google-Smtp-Source: AGHT+IGT+s6ZjPsn5deOJkPxJSbRS+LvqcC7NgDDMEePcGeSbB5/MwhFNz3O62ZvDc0cXmIn6bXBeA==
X-Received: by 2002:a05:6a00:1816:b0:781:24ec:c8fa with SMTP id
 d2e1a72fcca58-78c98dff8a6mr4662044b3a.27.1759511522948; 
 Fri, 03 Oct 2025 10:12:02 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:12:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 68/73] linux-user/aarch64: Inject SIGSEGV for GCS faults
Date: Fri,  3 Oct 2025 10:07:55 -0700
Message-ID: <20251003170800.997167-69-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 50a4c99535..7f66a879ea 100644
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


