Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2156455njc;
        Mon, 22 Jul 2024 14:46:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7GLeqCtjyxB5v38JP2nka4TRLXWEKxwj6nKDvGOBeBRMHJcXMLxQDSjL99cFRs3FfSqwkyjmjA/vyeNO4fprgNwrMLC8W
X-Google-Smtp-Source: AGHT+IHD0jo7LIxToF02fOWMNjVrx8WlfkWcTmdm8O46BtO7SlnLn6U7Ol9sfC70VbArRNQjc2fO
X-Received: by 2002:a05:6122:3bd6:b0:4ef:5744:483 with SMTP id 71dfb90a1353d-4f68e46be4bmr1334436e0c.6.1721684814368;
        Mon, 22 Jul 2024 14:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721684814; cv=none;
        d=google.com; s=arc-20160816;
        b=0l23XJisEJXeELmPBW0Yn6+ECMB1+xO/iKctWvRkajMALMWtGDlFYONMQrW+AF8l+t
         ZMFkF7H7kvP11EWRlaD+vdpL4w/7U86qJ8QA0TSvbCCGBxzUeA/hPbzN31l3TjOQP2U1
         WwyGF8IP0VNSSApalDyivo5pByITSlmG0CZlky1eCDi8484omTTgWdhzoGxOmUTrLuOk
         9yXvgfx3WdGvcv55b6oB1fu4T7CoOXxqUpEqxaXV8P+dutAVsEISG7b6WuD+Z7O/RfOt
         FOYJ/2dujdjaSi7GeG4/MN453HOPR2EBITEwcKl4JUBQbQkJ952VDe9nnlRQ1OiaaRBS
         alKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
        fh=mcaTBERFFN1sd/mSknfz40U1DL3HF/Duj99KW1MouW8=;
        b=o7WxB13AHsJKtivot9BrWY/O/Kuld+djdUXXXdlF5FzYQ3OHdkV+UjJwCF+lPkEgjK
         zYUwDceIwWFgA2kHFPYaOjRQ4cBds1vojPrKJNnh8XHd/63mcgHZpIUiXGQcQrQ0avdW
         h6FlWYyuWCUztpiXu60I7s0lct2ybpVElRfVR6tVsXtLckqGOwCG93qfX+fs6v661V/w
         6r6aQT33k6oINqhGaac3EpVGZnNmz/lmju2P29rIhnaaUt9emsxwdaw87KLUxsmxE+nE
         WFHR7OqV1rIr2ixR0IE9dUPB4rjWQwDApbF1NO/ZL3zJIx7tKXaMYomQ4TmRu1wGs7sO
         TTHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=mGImdnD6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1990b1a0dsi874635585a.724.2024.07.22.14.46.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 14:46:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=mGImdnD6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sW0qA-0005cj-5k; Mon, 22 Jul 2024 17:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0py-00052t-BO
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 17:44:55 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sW0pv-0004Jv-4u
 for qemu-devel@nongnu.org; Mon, 22 Jul 2024 17:44:54 -0400
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-8036ce6631bso192165939f.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2024 14:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721684689; x=1722289489;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
 b=mGImdnD6NnY2fiyMxfff6bzdmMsZ4PCTGUG0fv4jw0BaE7TjCSWTxxe17AgcFVxlnD
 nqjo/ezwe0hhuwsnbyosVFuFfJ6bov0zchrm6ufpsmCHgRJsBGGR6AHtFCR0JrW0GT5X
 QlPsn+ph3iauhRZDpDUT7YJNPv9tPrZM3+q/PomNq8K5CZFDYyHuNdOIZcBpgEa1tGMg
 GHrVjAt/5JcEWfT0j2O82G5TCmtiHoeL5DcYuXSEpz46srNn5kzgzuqcq/zjYSSP3wao
 6SHjJFWRFtgQTmde3CThIDA8lLXuFzYKYArPrJx+XPIXzFjXRW26A/oDuQS9i6B1YF94
 hzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721684689; x=1722289489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXCw0+RJXjXO156yoRFr2t5+0iBs33zwi5q8sWmsNWs=;
 b=AmqZp/5LMfU+ClvejZLQDuQMbN46CZFJt3LvHDrLpItjvvQy9/eYWC3+lJA/18SqHM
 LBlsrp9+s9zlUb5vXlTxNkvJ7RSdj0k2FrSlcSZI5bXYs8sjGKw56AEvep5pWImeJ8WS
 0ZIu8IkOscWTD3Mz3ABKqf78InEOUMEAjuhany7KLOEVQNM2JuC07n5V8dOBifN43DnK
 6ZyDfcHqZjHJVDJQag11ToNwn+npHPXeDdaSq6aQSoiAX00ScvbFNpLP7vSgqz+SUIo1
 AoJCo8hDyaCVTAo7UBhZb4CzwONGhLUUOq5gsx5/HaV8IgISkwhcYERKRMroUThK2l+B
 VZEQ==
X-Gm-Message-State: AOJu0YyrhbQT3ieXfBUZZd0sW/Jo5Juo4c1kO+HRGkblYBKB+eawxUY2
 zz8R1uMCzJZ0djUxFrZzr32aRluzgN+bxnSNpSYdjvrcSMiej8+YtgGCJqZp67XaGJKqY1M1LgH
 8wIY=
X-Received: by 2002:a05:6602:6003:b0:804:9972:2f8c with SMTP id
 ca18e2360f4ac-81ea375ce88mr139197139f.8.1721684689326; 
 Mon, 22 Jul 2024 14:44:49 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2343d2ff3sm1816830173.128.2024.07.22.14.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 14:44:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>,
 Ajeet Singh <itachis@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 06/14] bsd-user:Add setup_sigframe_arch function for ARM
 AArch64
Date: Mon, 22 Jul 2024 15:43:05 -0600
Message-ID: <20240722214313.89503-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240722214313.89503-1-imp@bsdimp.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AmEBb8xT5Ig/

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

