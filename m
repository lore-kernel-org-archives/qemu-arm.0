Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp933153njk;
        Fri, 24 Jan 2025 08:39:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbQd0Ayk19/hGpyMa+DSMmxOfsR+IyiuSlgmWMAllkSCv0jC/w/SMvOcktapzBMehomiWReE4gKksGDA==@linaro.org
X-Google-Smtp-Source: AGHT+IENOe8YnSwq9mV2IvYAi2WDSjT1NyFTUrEEC30LYvhIQ3v6qdKcMl34HFkCy9+5h6BkXqW5
X-Received: by 2002:a05:6102:6c7:b0:4b6:8e5d:4bfd with SMTP id ada2fe7eead31-4b690cc968emr26994978137.22.1737736785644;
        Fri, 24 Jan 2025 08:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736785; cv=none;
        d=google.com; s=arc-20240605;
        b=Dn+5MzWdGGY5qbvYqHbrknwuQmrSqARDPAPwCyf4z7tVDZZ9kNdI1XTwyeJQzTW2Mc
         urLrKBYFj2ZhQFuqMgjB94rSLDBcrR6XA+V3A2/A2wrCZmvUC8g33gzqQby/3i+Y3hog
         2SCJSdgB2nYOT5u/xmgKUHdaaxOHA3XzWDYbDZgpE3E9qB24Bg4+rT0Oig66MiIoHkIc
         sXv0p6d6c87glG+XH90/M9LbOS/ozSpUg7Yg6mztjjvwFb0vdy+PAb1gV12AsiDqjLQJ
         ng6AldojhNT5cMvWr/dD3/MFAtJDMmxo6hfqQO1wEGu9x9M+cJKkELZGgLMbnw1yyYFw
         709g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oV62nQbavYpaLNeL3j3KFgn+7cVCaGdr4oQFW+y825Y=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=TF5gYUMbOfkH1MErxOYpSP1Dv+Lnpmg8ImTz6+8WDIT01rhJnFTfdCfT85KtXxwXHt
         mI2pEwHq+dJ6NOB8FNa9LsxJHp2t3s/XHvZmElPO/gxoRaDBM6aRFE47c76iUZpMc1mo
         a9pKSRZQitjiuuEYuo/Xi6LEYpbrngkKjOQITzd7mhV5aTBNRXKaLaV5QEY2rxr44O52
         WXHh81dUnVxHzLCt7S+8JbDJfvdHDoQxi25qkzA9rwKuZvFqwzog34ILaz4ME4Zopqvd
         gRso/fFCEJeZGLSs+y86BOVmQHONprI22RCPlRRRrquchGBLKhA3GZz/XFpyDLYbnfcu
         4ndg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/YvdDbO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709796c4fsi861968137.171.2025.01.24.08.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:39:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/YvdDbO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMdw-00012l-QE; Fri, 24 Jan 2025 11:34:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZh-0006B1-Kc
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZX-00064R-Fm
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-436341f575fso24731365e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736214; x=1738341014; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oV62nQbavYpaLNeL3j3KFgn+7cVCaGdr4oQFW+y825Y=;
 b=C/YvdDbOYdAda5mAhbwWlJQh4WkhHwNkHMBBnBNAVIpQe/vpgtdteR3stVCSXcZ6b8
 P//VCLOFvQwKg78R4UhbciAWMNXN8aL0rWFrW7mq9cdTDLKyoc9NjuyClzabUikkuvBa
 xEZyutPmH1yRFk27DmK12IkEM6jcFtSZLjJhi97rqtNVWdj/vUIv4/l13AIXbVZYDfrn
 RDYWSkG43eeFe+xMfXwX0spOssMywf5SfkKZw7oz08hfJGFLedxdlRjdDvKjAJDeKOF8
 TkEyih/KMWS/JS7LbJGBAamq0PdVKLrzA3F+pZoqd2ayDSJKc3NojamH1ECzrBgg7WyR
 NHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736214; x=1738341014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oV62nQbavYpaLNeL3j3KFgn+7cVCaGdr4oQFW+y825Y=;
 b=ulvLSTEaP9414MgtVj4uwfKeXvOb1v4KI3fxY8hh1wg8yBp2K92u54z1tVgwn0de9x
 VmvoMVTXBhqAwEpS/ax03ld+04tGvhHbUcebk9eTZLb/1pT4x52MU1++zSuonwE0tQvp
 5/o+sB2P7QFTxKZ1uHcYBEJ6ABwjH/OraxT7uOa1nzzrFHbVtCUu4lvbb8q6l/mqQ9Z1
 SjHOQ+mFbqaUsIBeOxDIQbCSE2kavl9K6LMxgEKv+kN597mj8En8mlOKnOB4elfCEH3r
 4VcK5J5BG6qszUCXQsn+3yZZ752CQPehfu5PM9SBkRbQ6LYN+IXj/wOOk5uVYQnTu1V8
 uhpA==
X-Gm-Message-State: AOJu0YxolJP7eCW3W4MliAIn9RVBQd6ZrPy83JJgCWfA3sQMGYgqA4Nr
 Rfd/v5aYG8okCSEvbxCOwum8axnuXXxEGIyJiId+RlgryB7mlpEVABI0TDhbutR3HA/bygtZt2s
 v
X-Gm-Gg: ASbGncvpymt7WGB5SBjl+EymQhUaDfCc7Y21tqrfpZ9tS0Uzq8src3H6ak1sUnV7JPI
 xUZlJW/kwqzEX/kgdH5h32OoD4yhIJ3kX3bJk07MeyPtiN5hV+bvqSKejQcbHn7x6BFR76YOV/S
 5AezT9HOTmVB4bfNrR6ag5OwFH/KaZ+ODzQNSI+c6Ypqj4z1iLysC0VROnWfRTxcpghayXQchkW
 ji9tG7QEWDtFEXkJ53n6XHLkbCIkZJDapY6GemZCSCPlQZTuvrGg9dsvlj6km+S6k5uTmu8VoKf
 7S9ePytuWng=
X-Received: by 2002:a05:600c:35c3:b0:434:f131:1e71 with SMTP id
 5b1f17b1804b1-438913cf2e0mr294415915e9.8.1737736214070; 
 Fri, 24 Jan 2025 08:30:14 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:30:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 75/76] target/i386: Wire up MXCSR.DE and FPUS.DE correctly
Date: Fri, 24 Jan 2025 16:28:35 +0000
Message-Id: <20250124162836.2332150-76-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ZlyQazfU9fIW

The x86 DE bit in the FPU and MXCSR status is supposed to be set
when an input denormal is consumed. We didn't previously report
this from softfloat, so the x86 code either simply didn't set
the DE bit or else incorrectly wired it up to denormal_flushed,
depending on which register you looked at.

Now we have input_denormal_used we can wire up these DE bits
with the semantics they are supposed to have.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 97b46307d56..fd1cd823e9e 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -215,7 +215,7 @@ static void merge_exception_flags(CPUX86State *env, int old_flags)
                        (new_flags & float_flag_overflow ? FPUS_OE : 0) |
                        (new_flags & float_flag_underflow ? FPUS_UE : 0) |
                        (new_flags & float_flag_inexact ? FPUS_PE : 0) |
-                       (new_flags & float_flag_input_denormal_flushed ? FPUS_DE : 0)));
+                       (new_flags & float_flag_input_denormal_used ? FPUS_DE : 0)));
 }
 
 static inline floatx80 helper_fdiv(CPUX86State *env, floatx80 a, floatx80 b)
@@ -3251,6 +3251,7 @@ void update_mxcsr_status(CPUX86State *env)
 
     /* Set exception flags.  */
     set_float_exception_flags((mxcsr & FPUS_IE ? float_flag_invalid : 0) |
+                              (mxcsr & FPUS_DE ? float_flag_input_denormal_used : 0) |
                               (mxcsr & FPUS_ZE ? float_flag_divbyzero : 0) |
                               (mxcsr & FPUS_OE ? float_flag_overflow : 0) |
                               (mxcsr & FPUS_UE ? float_flag_underflow : 0) |
@@ -3267,14 +3268,8 @@ void update_mxcsr_status(CPUX86State *env)
 void update_mxcsr_from_sse_status(CPUX86State *env)
 {
     int flags = get_float_exception_flags(&env->sse_status);
-    /*
-     * The MXCSR denormal flag has opposite semantics to
-     * float_flag_input_denormal_flushed (the softfloat code sets that flag
-     * only when flushing input denormals to zero, but SSE sets it
-     * only when not flushing them to zero), so is not converted
-     * here.
-     */
     env->mxcsr |= ((flags & float_flag_invalid ? FPUS_IE : 0) |
+                   (flags & float_flag_input_denormal_used ? FPUS_DE : 0) |
                    (flags & float_flag_divbyzero ? FPUS_ZE : 0) |
                    (flags & float_flag_overflow ? FPUS_OE : 0) |
                    (flags & float_flag_underflow ? FPUS_UE : 0) |
-- 
2.34.1

