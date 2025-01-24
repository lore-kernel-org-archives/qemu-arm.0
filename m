Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp926807njk;
        Fri, 24 Jan 2025 08:29:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWxFr2WTq6nHnCy34a5rkPBJfhJhBMzRXVG50XPFa/zG7H1li6HwE1NTUMwECnrHhCSkUL3Lv7spwySKA==@linaro.org
X-Google-Smtp-Source: AGHT+IHTvF8w3xxA92cJgd7wQwXd7AMA8QFX7t6oZQs4QX0VQW1rfslTZzFvdgZQcnVBbFYXKLHv
X-Received: by 2002:a05:622a:1814:b0:467:85b1:402b with SMTP id d75a77b69052e-46e12bc5deamr385709461cf.47.1737736185192;
        Fri, 24 Jan 2025 08:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736185; cv=none;
        d=google.com; s=arc-20240605;
        b=GFpSQvPwZWX2NPatf0cLBwuRWLfuGcriolk4dOYCgRiCGvdl9EbnRqgRVAAfbh3Rdw
         twLD3/vuc082pCx2s2TdTdWWQDsUfYTSEm2YjRPS2pmMRtfqD9Z7tfy41S3WGTLQynY7
         yVzhWTNM29X+7QPQ86nGWMSWCfIpX2kcyfbp5P3uFBwjQd9yxSOX9lKeenelA+rb+Duq
         XFfyP+HNqtpUSiJsxl7E2thLStzjyaY8LuOtyvN1GcAsoIWspzRyK3jVNS4bBctJVdZG
         PkNlM0IP7AUvQKIBAuEOAnvEa59tBB1njr9D1vW2imb3glly61aOIwHnSWNaBDPugfNF
         1t+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZfLM2/7vpDqFu3x5XoiYwdSrSuh29YwT8u6Y3ue6NKY=;
        fh=nK1ks6Z3PxVWD/MX6Wm3AbQM5FHkWesazQTf3zIRM5w=;
        b=Dfg/43O99T+gir4FO9VonBanCEGQe4AVYZUDW2VrErVD9LbfChlmJmJbMi0h9Hh4b/
         9hzCX8uTLzkP6KogogektU5CpUBGxrEY+yPEa6iIdIEUqpsw3XSZ/rxMt6/Tu9m72jrK
         YlRWLR21uA2+Ss0I1JcKtU5vMqlELPwP846ZrwLUOcxXtcnr16HYbD5NmsP2dXEmwDZ8
         gINEJS+QWcAd18i2b1fj8lSaXeQqgwU8vRCzzv0zmF+abQBNGjoeIbmRiaHYZbLDQDP1
         ZH69mX42bepLKkE0go8jVvUYgDmmZM2pVGqj5r48oy5qHW5gO3FUb3/9SjQxMAJY6xTB
         uokw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LOnOkjyk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205df6135si26949866d6.233.2025.01.24.08.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:29:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LOnOkjyk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tbMYO-0003s0-Ba; Fri, 24 Jan 2025 11:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYA-0003bu-VP
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:28:55 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMY2-0005ME-W2
 for qemu-devel@nongnu.org; Fri, 24 Jan 2025 11:28:51 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso24063575e9.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jan 2025 08:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736123; x=1738340923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZfLM2/7vpDqFu3x5XoiYwdSrSuh29YwT8u6Y3ue6NKY=;
 b=LOnOkjykumiqOrKrIdrTYOsYzcEiwXBAD7VYtoeFqU+HomhXX+Taq0VL6/D+82iZm6
 mLEIufcQgrcgxU0RJWWQqGHhk5pTehtCMJtlpWILbtxuHRt6+SNHHxWSu52XhISYQfbt
 1T8IF+vXB7Tnv92W6v4pBGEEjEDQPPSvQq5d74t436i4tQpIG64gwO7DD692Y9ck4EMU
 fV3IfLA7A3/XE2yVFP8fcCsNrYAexQAY/ajq7a6wr18oZXxNL4ehBAQDxh5YnsUUDcDE
 gaRCtBqBbxLh5sSgYTWprXCo0aG61udcZprMfFGGISvFXx3Fw5UH5GPUXimwDZBCnJ3Y
 LN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736123; x=1738340923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZfLM2/7vpDqFu3x5XoiYwdSrSuh29YwT8u6Y3ue6NKY=;
 b=XFo/UlMpjki7smjJ3EeUXS5PqbAUh5uVVSQ9CS6XZ6NqvxNVB3RSMZLbO4GUrAsKJk
 TFhKKtwNlDekOae5/XCUXqq08G+AzG6f1FSkxWYdLP1RBxcWBluPBi+SeZaSRgQZmqw6
 sCEdh6tMP3MwPqx3gSD2fk891rafi67xgetFfQv0f0Y8FpfFi6flx6NFYF2RHP8zP0LD
 LEZHhsNJt6ZPd1Mu/TJ9Tcxsislg9cisDNx402REpVI58g/tAiT20RS+xKGz5U+34OeM
 lPWUGbWOJZyK42LHwn/p0mnbY64YzJt+Y//2diu7/yKX7fEbWQ8U/r0WmE6AaFYr4KSA
 HXjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQAe2NhiQhf7IFadExG470vi6l11C+A0XnOpAK1bPbdHl2hfIPXKt9klZ07vvRpVLoMnQT/lWdUMD3@nongnu.org
X-Gm-Message-State: AOJu0Yw1Z8ae3mSVCnQ7UPNrSLLlk6jgBysI3ghuZpUHwlat2vkRFVfg
 yLMtU3wmjX9PHWkOsj5QMRiZYdYuKHlWJRodNJzJSh5MRE4J3+mULQKWJOygxbq7d0flXOeEG4J
 4
X-Gm-Gg: ASbGnctl8DYzQxM4qP+jxuGnHxA59ugX+627j3kbzV7ghyWOcrEDFcxJDieH4jBbF9h
 RgPhxJwbNKVcnb1zWrXVo+2DRZm3nfEvP60w0hfz88LZv312Syax8I8AEt3AehrQJiOBpJJ5w/W
 HU5pAS6tzAdLSr3OYnQl1hmffJPT8ySFz5nsBYoLjySTyPF686mpdkLm8pWY3kaGyW9WML2D1Ji
 k/zNbgB7Ty6CbLD3/o6iMuG+yfX59Q5vkh7x1+3KsYR89HqIhA6AY2uXBLvOktT5DA1ERQF6zRY
 0Z+0dlIEFzQ=
X-Received: by 2002:a05:600c:19cc:b0:436:fb9e:26c with SMTP id
 5b1f17b1804b1-438913de937mr288271085e9.17.1737736123297; 
 Fri, 24 Jan 2025 08:28:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 04/76] target/arm: Use FPSR_ constants in
 vfp_exceptbits_from_host()
Date: Fri, 24 Jan 2025 16:27:24 +0000
Message-Id: <20250124162836.2332150-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RSLhvCg1zjoK

Use the FPSR_ named constants in vfp_exceptbits_from_host(),
rather than hardcoded magic numbers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index fc20a567530..fcc9e5d382e 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -39,22 +39,22 @@ static inline int vfp_exceptbits_from_host(int host_bits)
     int target_bits = 0;
 
     if (host_bits & float_flag_invalid) {
-        target_bits |= 1;
+        target_bits |= FPSR_IOC;
     }
     if (host_bits & float_flag_divbyzero) {
-        target_bits |= 2;
+        target_bits |= FPSR_DZC;
     }
     if (host_bits & float_flag_overflow) {
-        target_bits |= 4;
+        target_bits |= FPSR_OFC;
     }
     if (host_bits & (float_flag_underflow | float_flag_output_denormal)) {
-        target_bits |= 8;
+        target_bits |= FPSR_UFC;
     }
     if (host_bits & float_flag_inexact) {
-        target_bits |= 0x10;
+        target_bits |= FPSR_IXC;
     }
     if (host_bits & float_flag_input_denormal) {
-        target_bits |= 0x80;
+        target_bits |= FPSR_IDC;
     }
     return target_bits;
 }
-- 
2.34.1

