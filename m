Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1704371ejb;
        Thu, 7 Dec 2023 07:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrkMDyQTP12lY5Y4cYcRYm08SidQ8osPvDkQ6PH5+LewBtITmWfp7HT0JzJryLs3b0Hg7v
X-Received: by 2002:a05:622a:20b:b0:423:6fee:b9a7 with SMTP id b11-20020a05622a020b00b004236feeb9a7mr3052227qtx.41.1701964037748;
        Thu, 07 Dec 2023 07:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701964037; cv=none;
        d=google.com; s=arc-20160816;
        b=rbNHP0w0UHzhkKnkIJXc++pBURsdeOuUG/ZSzSjM5LKZ36jzuKR+jJ2eHlma4oLlAD
         EfPBjQAZwf+V5wlqr2Yvf4kYZnRZBWV4RO8gRq/z7S5jGRpp1DVulel8muj9AY494H2e
         nt6orvgfn9hPAtAk7nB9tJ5GLIpcq2kOXvTVl2dakfoxeQNoaePYDQ0Wupb8sXoc1nsj
         TlTSQKUw8faBEA5yvoTZe+QFylqqGCXnUIoggGDtZpndLSIgiKq9arlP+jJNZ+UAZmOQ
         kMbV7BIxVJOvSpAaWcUX2+n4CMGLCGC/Nlmhv64EFJh+wzu1l/RB4NehjBnfT/mf9Vze
         +jtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pwehzbql2APDeG+wQ20PBY5aWPTjdNYBgHCWKgUCJ14=;
        fh=A8ftaDMzewcMA0xKw++MSYMuCBPymoWdeCEx+9KcU8w=;
        b=meKiH7oASXtvSaufQC7OtyjnSUSGkg3z3ZfVlK2F7DURyd2G1krDTpf8FOjH++Xqs6
         1iokZOKVhyQqhz3Vo7Fwi3XfmwM2kWQHSCHIRadSEy4XLvxnKmEyHcVo4VmBoj5+TV+h
         zHLOBaikQ8jzoa1km6Pzd7lnWlT7s6Yc293wW0l0W1kkp3O+7wzzNFZmiiSvtG3AXlHN
         PyopiAUFVk9dlCnwGgdOi71sKEt27JPqHkSnVXPjiuNyzNzL4ZxBNKc+DTmN+Iwr4x08
         2ag550a7uoFX4xju6bdsRzuszXi6ktDpIuA0Ry3n23tXSOVqJTiPcXtLfFpCr59duOpA
         iq/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mUX6v3vp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq20-20020a05622a5e1400b00423e912e24dsi57763qtb.365.2023.12.07.07.47.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Dec 2023 07:47:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mUX6v3vp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rBGa2-0000mb-Vr; Thu, 07 Dec 2023 10:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBGZr-0000ge-Qe
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 10:46:18 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rBGZp-0002AJ-Sp
 for qemu-arm@nongnu.org; Thu, 07 Dec 2023 10:46:15 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54c74b3cd4cso2315961a12.1
 for <qemu-arm@nongnu.org>; Thu, 07 Dec 2023 07:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701963971; x=1702568771; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pwehzbql2APDeG+wQ20PBY5aWPTjdNYBgHCWKgUCJ14=;
 b=mUX6v3vp20TDI8rGeV3wmX1CvCwE0D97UZzCS/m4Cqkmf0dePOambbUezlALs1o4gm
 DxN4HX4C7cLorKX9TKqruXUxURVI54D29xRT/heARAqAkYQ8IzSa3dXFmNqw1dfNSsHO
 zbAry8azt8szyC1WLtWhVTD8pjAbdAFLz9FEYTeVNS4j7sGN+Kg1hW+DGovrv1CJAU9T
 goqLu25arS3XbBNpNZFWMgsva8ggUYwcI5WYgL532J3gt7TBb5COP9jc3gK6Qd9Ot6mb
 mWNgTrfNEl4T+QkdgXY+VA3+JyZawyhjdYXDuFKLazMSCByXgLR0yz6cwU6IANMTVAF9
 Rkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701963971; x=1702568771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pwehzbql2APDeG+wQ20PBY5aWPTjdNYBgHCWKgUCJ14=;
 b=LQas5Ro58GSfLnJoN3budQ3WM00hf8QGkhUyv9DtqDB9F+U0wQQSZuSDT5Q1FNA/V1
 isZqAVsTrqd68tvB4bS2ZF85ZwGHuqjZlpiSXn6rlhM2dxgAKvXJpY0E/hCO5gjPiGyT
 tPgAqp5qfJjlafDz7bkWYviShvby5sDbxcN50nQHK7wsB84MFlB8fIZEVa1SSaEuQbSI
 jC84r/HllXf7ttC58jpuf6XDG1rF4RdmUSKcoUVXUZIkRbQxpNJcekqIX4toR7DIk/70
 YT3jq3ZJJYa9JbBNgyca1nEeXKnrmLZPvK11fJfwssa0YpDGRHJZ0QO4dUKwwAhPZ6Xe
 Z9ww==
X-Gm-Message-State: AOJu0YyMbv1sXhB06Iw94CK7/tRCLidHHsZ8uSjtfs4gd594Wh7gv4I2
 HH5ikWYtohH0k4NfHMB8sywf7A==
X-Received: by 2002:a50:bb03:0:b0:54c:553e:67f5 with SMTP id
 y3-20020a50bb03000000b0054c553e67f5mr3540189ede.8.1701963971415; 
 Thu, 07 Dec 2023 07:46:11 -0800 (PST)
Received: from m1x-phil.lan ([176.187.202.111])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a50ccc1000000b0054ce5c00e74sm923565edj.88.2023.12.07.07.46.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Dec 2023 07:46:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/5] util/async: Only call icount_notify_exit() if icount
 is enabled
Date: Thu,  7 Dec 2023 16:45:48 +0100
Message-ID: <20231207154550.65087-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231207154550.65087-1-philmd@linaro.org>
References: <20231207154550.65087-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RWWId51xhoVS

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 stubs/icount.c |  2 +-
 util/async.c   | 16 +++++++++-------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/stubs/icount.c b/stubs/icount.c
index f8e6a014b8..a5202e2dd9 100644
--- a/stubs/icount.c
+++ b/stubs/icount.c
@@ -43,7 +43,7 @@ void icount_account_warp_timer(void)
 {
     abort();
 }
-
 void icount_notify_exit(void)
 {
+    abort();
 }
diff --git a/util/async.c b/util/async.c
index 8f90ddc304..9007642c27 100644
--- a/util/async.c
+++ b/util/async.c
@@ -94,13 +94,15 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
     }
 
     aio_notify(ctx);
-    /*
-     * Workaround for record/replay.
-     * vCPU execution should be suspended when new BH is set.
-     * This is needed to avoid guest timeouts caused
-     * by the long cycles of the execution.
-     */
-    icount_notify_exit();
+    if (unlikely(icount_enabled())) {
+        /*
+         * Workaround for record/replay.
+         * vCPU execution should be suspended when new BH is set.
+         * This is needed to avoid guest timeouts caused
+         * by the long cycles of the execution.
+         */
+        icount_notify_exit();
+    }
 }
 
 /* Only called from aio_bh_poll() and aio_ctx_finalize() */
-- 
2.41.0

