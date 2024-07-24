Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3360415njc;
        Wed, 24 Jul 2024 15:06:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlqhrM/dkoxTB7y8o6lPS/JAFAlj2owsj4hdRrZQrdPVR9QFOaETKDdevti01T9kztjUQ6bx8hUokcblHk4MtS4WzS2cz4
X-Google-Smtp-Source: AGHT+IHN/gMhefWpaBmJVDdwcFe1D+/h04lZAGqTPCMMU/bWjCLfhsKEB6XWZO23z7MK/PKVDiII
X-Received: by 2002:ac8:58c9:0:b0:447:e60c:61f with SMTP id d75a77b69052e-44fe48b6a4fmr14673271cf.45.1721858806439;
        Wed, 24 Jul 2024 15:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858806; cv=none;
        d=google.com; s=arc-20160816;
        b=mvhnVL1lhESTLddMui6fdeqcZgqhX3Y/aTYQ9jYGwrJ328WhOPkMvSty5RwGxuipSO
         WNjaUrw0A2V9MfXoMXFPb006TNGPxEuEyDql45V4EjFvhfBhHFvGRw9I1aqrB+CvXQU3
         VKP2vvq/B11nytdhTZzvNdcPXDROuUU2UOGRL0S3HdrhWtsPU5iXmEJCsWdKGDhSIiGg
         UMcNzAFysSOvOIBEVZuPB2awLgZ7HmTlntP2BlFlnJRyiykz+lJ2SgAK5cUu35mGqqhr
         /qr6jlNIcCajza5BHKbScGyi+u7xqhouTibLEloYJQPNRoj9SJEk6LGRlKuvYvhA9pWP
         +jgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
        fh=mfZ5I7WmgjhrpNn+LbpCZEcP2CpBuj0KaDpd9JG/+ho=;
        b=En6F7+b5pTC6PgKPBpzwNEGP2BdWLHXpgQM7XsUZa2EoZPe11dpJxo7L4WQWrRzaKV
         JFj0BmukfBjnrMXvP5UiEeZjUbS7IFd3t7zrXL2F5TEV0AmO7WwMfip+BS8xm5Sfgt4U
         HfIQAqFMmd/8sSs2i2DYdw5Q5GK7WAaDgIDm5w3fIdCycQLV6QCAbYTUwziaxsCU/tK2
         iQhBf90N72AWkgmE5zGvJqAPN86t5k4hkDe9M92Bk8tCuThbUBqDaZy3nRkg3HrW0vA7
         2l3T3mSQQBMVwdkUpik5ipA3a/DnRUri1LE708floz5d59rTfi8JUQIIsvOEYB5WR3iP
         MalQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=r6iMvlOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe851ae2fsi1027211cf.669.2024.07.24.15.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:06:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=r6iMvlOG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk88-00016Z-J9; Wed, 24 Jul 2024 18:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7w-0000MT-Vu
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:29 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk7t-0006Z6-Gc
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:28 -0400
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-8138e2f2f69so12023739f.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858784; x=1722463584;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
 b=r6iMvlOGayIczFJ0h0RFOFJu9yyAVL9GAM1/mQY05q+fM9S5RZwHHp9dWGm5srJRCl
 PzS61jrbipx52EU0+jtZzdz9kfsk09eKQb/yJniUUNHxv1adNPG8w1CV007jk5wFZxas
 9pfmu2h9UiRctsAJ/e3G9+Xi3249TTjvhbyjl44QYeWXjIsF1QbW7UILcPidl8f/TVBY
 0TgKOlk130MKtl4WlrRiD0VqfD/q3k71cemT/Qo+8VphrbygYYZ3VYw6mm8TbTuGwyNy
 U4wvniB0GgiHzpjAHMfUj6aaWCkNkuMgBcW+QA9UvD0Y5Tqv5Jwk6YuvQQvInUf37mx7
 cgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858784; x=1722463584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
 b=lrwOD0RK1sCEqywTvMv/pmOxtg0s2FXaJuooqelc4Bfv8fb/xKxnc5dF2+l1UFzzNe
 0On62kfq5SYyv+KvhXL7KqZSvU7di4V64eVE5N/bReAsXE4uSDgSDJvOzG04/I1z8nfX
 pjZSjl5ZfXfSYWflLSU0IA+JNNzpIXXZPooNf8ifztwI6wgQ+xPW8dlJ/brau7LxbXS4
 SW623oxnnos3V3kmwISTESb5+L+lcdq4VbrBHCynNuRunDao9FV1Zz1X6JHYPa9lCUYq
 TZWhLUiCK7vBaNp0OtYX6LpuPoUq0N8nN6JlnyppSRj7KHHXBqK//+1ATg/KFFCj9inS
 GZ0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm7qaPbd0F4HcwBN7Uq8bGTel25UarTzbhtN7xG8Ux9BEOwlUjPW9lu0YIQC5j0O//ctd+T6yxvAoVKszrkXlZjcjU
X-Gm-Message-State: AOJu0YzCcJAbXLpGR9Rmaer9XF8FB/OXYpJ1BZ+EQmfNgIeBwoWiNCDa
 h6OOO/d9faomlSgKHDUPTfDdST7aGmcfN4JZVSxBoNK3FhbmfbZA47Qcx+9jmVg=
X-Received: by 2002:a05:6602:6c14:b0:7fe:3c5a:c7bd with SMTP id
 ca18e2360f4ac-81f7e3e2e37mr22559039f.1.1721858783843; 
 Wed, 24 Jul 2024 15:06:23 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:22 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Ajeet Singh <itachis@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/15] bsd-user:Add setup_sigframe_arch function for ARM AArch64
Date: Wed, 24 Jul 2024 16:04:39 -0600
Message-ID: <20240724220449.10398-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: W5ThtzyDUdJl

The function utilizes the `get_mcontext` function to retrieve the machine
context for the current CPUARMState

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Ajeet Singh <itachis@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240707191128.10509-7-itachis@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/aarch64/signal.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/bsd-user/aarch64/signal.c b/bsd-user/aarch64/signal.c
index ab3bf8558ab..43c886e6036 100644
--- a/bsd-user/aarch64/signal.c
+++ b/bsd-user/aarch64/signal.c
@@ -81,3 +81,17 @@ abi_long get_mcontext(CPUARMState *regs, target_mcontext_t *mcp, int flags)
 
     return err;
 }
+
+/*
+ * Compare to arm64/arm64/exec_machdep.c sendsig()
+ * Assumes that the memory is locked if frame points to user memory.
+ */
+abi_long setup_sigframe_arch(CPUARMState *env, abi_ulong frame_addr,
+                             struct target_sigframe *frame, int flags)
+{
+    target_mcontext_t *mcp = &frame->sf_uc.uc_mcontext;
+
+    get_mcontext(env, mcp, flags);
+    return 0;
+}
+
-- 
2.45.1

