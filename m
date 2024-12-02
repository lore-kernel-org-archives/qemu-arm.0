Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801596njk;
        Mon, 2 Dec 2024 05:13:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwRM/knYlQrOKMBpj+Te2Qr/nrVK1fDAkLAo/TbWDgC2UdapQ+YD/eUujOnqd5zx5jsn1eXh/Bfn0wZw==@linaro.org
X-Received: by 2002:a5d:588f:0:b0:382:4aeb:91c7 with SMTP id ffacd0b85a97d-385c6eb6911mr19275828f8f.18.1733145235919;
        Mon, 02 Dec 2024 05:13:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145235; cv=none;
        d=google.com; s=arc-20240605;
        b=U/6jMcWeGp/Eupo46YFZyxDbRO9u74v3kqgyjoUx1NhvSTmXKSWlgCkdlk5JTBiM9t
         7/uK0BjRsY8uChNRDLI6+gWMXWlHfGzW0bcUxKbrg1g70WOXjn387gu/ty/25Wl1AraG
         5NGTaomdruYoXnNAzynMSxbtIhmgPyfkzMp4yEDw6sNR0+n3IiFJKCz8xp+QR/amjmrU
         805gESIlu1Dc0xrCsUZKDHrh3KkIXshNngalWThSB/3dArK95jH8Fd0OhM0L2LROqxH2
         TIBmNOxkF6nbwSHuAWO6DlpPBQ3ulI0dtrW08wuNi6HaKY4TXet6fkxCc0KT0lSJKVI5
         SWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OkwmxObRxprUaJij2XbynAGv6Fy1VFYe1VACXWXiwGA=;
        fh=VOdyjClgNcOImSERBulISgqArZxgnTj41cW9yF+cxS8=;
        b=EPvA1tN+HjHHfKfSVkBqP2KJGgl0Ox1d2o+GsK5fMPIbnXCbs7SiDqv5pychl+Irgf
         FVugKDh7WegbLwg02JIh6tVDh5OyTXyMBUnIgcMpvudv09CLX1xS6SgH3gmrUOGXO4XE
         upyAB6aigwKHDgyRDB6u0ky2kdjKPkXRwyXMPpoUTguCzxI8Rv2edG0tfuFgIkz14YEe
         CArViry6CqQE6C0nzQgdkqZwwXicFWcMnhy9jCyb5Ks95Puzp746VlOBmxn7e8k5coGk
         n3GfXalyEspQ0VxCJbTQBW1EufTAYv4h9N30g9hPOQsHk0DwDAW/nJPLaLWZrLxnErJY
         PnYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lklJTP1B;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ebb9db68sor674810f8f.9.2024.12.02.05.13.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:13:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lklJTP1B;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145235; x=1733750035; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkwmxObRxprUaJij2XbynAGv6Fy1VFYe1VACXWXiwGA=;
        b=lklJTP1Bi0MkNmdMNOH8/s8/Czuc38gtx0Aqo3kgfRFyjfm5uZrOcffNqG618RqQqV
         9Ajevt9h1WmqTRrt3ZiL4Lc7DOGTDkWYihWM/leqsBS5n6RDgNrLpvOcIQcMskihHz1T
         c0SOz+5Es6eRNsrlx41lvVtLHRrHyulWPr+0bXAmZUpgF5SA77CcnAXSSoW95Dvwc+9k
         cf6d8OdZi+Fej73/TSFbSNodt3ZZIuUFDVnYWNY1E5MaIkEJ29NELcIxUl/1vTg2W2XX
         OEAfApcrE+rlyxvnACDMiMiKFW6ZAuGFdBJSRYd8wWForgiKNgbFS1gp1D0w8VCzEQ8w
         WnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145235; x=1733750035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkwmxObRxprUaJij2XbynAGv6Fy1VFYe1VACXWXiwGA=;
        b=aYUScdB7Kf8RQWIPO55BWg7gqImhgrWPfcGoH5p1sW94oW6jZaWWHGsLlovu3aInz/
         6UoicDz5tAbKw6IQTnti6CKTDkd0yn043ZdUB8Sw0tiaOzBKXoyzb1ncG9MaLUi5X2Qx
         WnGdviMqOQRw4Om9OS643UrgI0An1ya1MI4potDgZpYI+65jtlDj+Q0fbsF2zpowO0OY
         rti+biX84cX36XJP3Jxt+65i30KcJEY5aKLr44cyp4uwA1KHGv7uDAk96p18SqhF1v6r
         IvwtskwAu5qpGWmVu8bbzOPR72belvbO7Algxl2UUDHpW4OzlVhhNZM8Rhz4jbQvAT5p
         iRqA==
X-Forwarded-Encrypted: i=1; AJvYcCX/3winoHr+HfjaiZSjbacTCPDfUN3JLQmA2IgFQFVtEy2Ttvm8mGK2ZBw131CJP4iqsLm7i0rKW0iHxg==@linaro.org
X-Gm-Message-State: AOJu0Yyq+X/scAMAqeplywjzHg1BC+qldif0ExWXvzt1WZI/kSEjtosR
	TIPexP2oyD5VgjrsQekhXmoLTD0uqMEdVusD0UoQt0lCCNc36Oq8weae90Qcvssn3w==
X-Gm-Gg: ASbGncs/L44hjMf/2h9vQtrbmtM9juj45n4t3qrNGXSA2FpAwro8enTTWhHOEz4kA4x
	vT5jh2+bDdQDJ1RJq0m36HUfqCcM3zB6NUtb+sO0ubbx2okuVeLzgo7EGbpOEkhSsrF9umYjLhM
	FBd3xLnDeKfvmdGQchliTeZ6A8hF65KhmX4Y2QEvIiNOo8cX9eySorzBsrTlvSB65istXAhERxh
	DkXGzHTRyzRCYDG5MiAUAypchYDLXLT8gWGmGQqbHYQaZssrcGqm84=
X-Google-Smtp-Source: AGHT+IGy3HsLoAPvtrEg0h7F4JFEuE7tVbYhcQYvcU/l+t5bgP8Z4z1Fr47xDBOr+dQSqigzRmPxtg==
X-Received: by 2002:a5d:64a5:0:b0:385:f9db:3c58 with SMTP id ffacd0b85a97d-385f9db43c7mr626560f8f.49.1733145235342;
        Mon, 02 Dec 2024 05:13:55 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:13:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 04/54] tests/fp: Explicitly set inf-zero-nan rule
Date: Mon,  2 Dec 2024 13:12:57 +0000
Message-Id: <20241202131347.498124-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aSR+GvW0XEyN

Explicitly set a rule in the softfloat tests for the inf-zero-nan
muladd special case.  In meson.build we put -DTARGET_ARM in fpcflags,
and so we should select here the Arm rule of
float_infzeronan_dnan_if_qnan.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/fp/fp-bench.c | 5 +++++
 tests/fp/fp-test.c  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index 75c07d5d1f1..fde64836194 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -488,7 +488,12 @@ static void run_bench(void)
 {
     bench_func_t f;
 
+    /*
+     * These implementation-defined choices for various things IEEE
+     * doesn't specify match those used by the Arm architecture.
+     */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &soft_status);
+    set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, &soft_status);
 
     f = bench_funcs[operation][precision];
     g_assert(f);
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 5f6f25c8821..251c278ede9 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -935,7 +935,12 @@ void run_test(void)
 {
     unsigned int i;
 
+    /*
+     * These implementation-defined choices for various things IEEE
+     * doesn't specify match those used by the Arm architecture.
+     */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &qsf);
+    set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, &qsf);
 
     genCases_setLevel(test_level);
     verCases_maxErrorCount = n_max_errors;
-- 
2.34.1
