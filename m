Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413041njb;
        Thu, 28 Nov 2024 02:43:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXRx24FpaxtPS2YK90ixnBI/KMR5YTaQaPBTE1h+SviURt1uB4e5Ygw3SizSxEzU1zeh6c9AI8MHRlEHA==@linaro.org
X-Received: by 2002:a05:600c:1c81:b0:434:9936:c828 with SMTP id 5b1f17b1804b1-434a9dc3db3mr61764885e9.12.1732790597041;
        Thu, 28 Nov 2024 02:43:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790597; cv=none;
        d=google.com; s=arc-20240605;
        b=UyMCuKcom8L9KUBBCjR1OYmeHhUdSNUB3BvGVIpcXGBO3/Mpgyop9ZLWtFWLaAxFvB
         d/PjTZAZJmXf9ODiYKrmQOPntOxq+5I9bxcngsu0ZmYymMyAwjX0QG4xLEhDNzc2avcZ
         9b04o7zHfsNprzblz8lw19qj79aHUuWHatCD8hlL0xmDgMalponXPeBtOznuaKA2dx+L
         heylSACD9/dZO2Imo2jorlXub9ZuSmx09v6j7173APyh303o4gLMnygLtl6lwVB8a+zT
         OlhRz4nqhucIXfdWY7OZ6qRLWlTPwWALy6G2SZsWC/k+gifodHBhXkEP7ITshG0oMXbe
         kxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jI12Che8rR4gDrXI7XaPlHeXLQNnrp2Bpm/Wl6NH9ec=;
        fh=FP9q6T/FMz/AjhmcZx9WXZ0OEvQIqHfH1cw6wWQ0ik4=;
        b=SVJo4S7RvwHOLv6TJwF17lSv1yytzfiWPZHUSnTacHrpiOERFNXDjsinrQPk5qbYGu
         tQ9Ip6yZggl5e9H7RqYVc+ywfyhIvT6eI2N/ib+uS2KLeYyB3P5xmFHWhbSUqOtoioKz
         fq8c385ru/xfsKrKPPAlzKc1iEGiyNa7BUi3tP535KNfLnzZpwgvYNzI98CxZQ7/sBPE
         n9gt3suX7gF+pXc0t+Z8pe4UqsExqtZgGhbZddPQmYry9S3cx9RlRRRdSiMOnSMWPscZ
         dH1zoVNtjHz6tZD28vj08iR4lDilIf2KJMmHQf8ZP4Msm19Ibd9NOCR5/9DDVDz7jO4N
         Sy+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MWhvTEEd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b109ac80sor5008875e9.7.2024.11.28.02.43.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MWhvTEEd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790596; x=1733395396; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jI12Che8rR4gDrXI7XaPlHeXLQNnrp2Bpm/Wl6NH9ec=;
        b=MWhvTEEdowPTUWPf9Xf/MiELfAd++wfKgwqOn8w4gjMG9q1KKDx8yL89697iAW1Og4
         RipZakPVOn8tpd/NtmFRdMArLVMDPkVImuQ+POgEbI2RjdHOATiU2zYUoTHk8zwG786F
         aqYx8cydsVJ7gtXSK2/s5WHDrecd0casngUsEvGKq8w3d7sy1w+eezctbYookhoQSpT0
         H/ktypeUmcJJVA58nHLy4RJI9pJljZhMzYEP36Se3o66NdZoj3hNfDc68kOZ6m6Y51pI
         vDUJgzB4BERven8QquEn1Om55x9D/olw5OacpfHYQG137u/1e0rKRWF5vcq48F6V1Rs/
         nYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790596; x=1733395396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI12Che8rR4gDrXI7XaPlHeXLQNnrp2Bpm/Wl6NH9ec=;
        b=Vxd1+4pzexJxBa9yLVLBwE+Z+/SJExfPy7KW35C/rwCFJLBkt2IOW0U5R+/YbE20j5
         QsoofVYr8lH1blS27Iq0I8TEu3ipXfQ542G4+dKxHc/hNHmKnlmTLDJ4upLQzhdHkWh0
         NpAbgKlksmawyANDMZ3rlo/E8loiZqIc0oCN7aen6I+kOEdhMesZlL8Re9a3a5ffb28o
         U1n14GOqXUIplqEQOAQM2dR2vsF6CVHR4twVWv01u1qHj68hF3mIIoCOXDR+xvkJzkVL
         Ct9hnSyCsq8xMPocKagpjx1DDjcfA9lk8E4YwIB+w/J4ioa8Oj39Ve6nDyJLSlI2JWrA
         4Gsg==
X-Forwarded-Encrypted: i=1; AJvYcCURBQh7jYk/WeaiMS6nDJXRquqe4Y9+7sfcXTOYbhHW4gRx2qemXSBWTqjIavXN0bpBn22MU+yZ4oEIcA==@linaro.org
X-Gm-Message-State: AOJu0YxOKTdBraNP/d+Lb5IgPHaU87SHK3c1+j3vLqgqklzFvpV9mzOZ
	bmB0aBlrmdXLOct3nRf4B6joj2U7SJ9D8xDaxLdybSYaNyBDazyq3wtq2ByyENh+ZA==
X-Gm-Gg: ASbGnctNdnWvciNmOMNjhXyOOVqVA1AyG59upzFPtbTbqXswFVBTm9cXOFzfBJg4ros
	8Gq7MDucclm/BaZcNBqc2v8E+gO9Oj5vI/fHD4Ou4tpVa78JP2rs0ySiAKxhRDQBUZr/he0cdu5
	jdlVnE6iC8dm62TCrpN+2YjBKhwmCBLV1VAjNSCL4fPx8MM8cD1RZnTl3h74041bJEok7/VRD9/
	mCEwEm7pdyxxDa/Jo1+nwRRRnjV9JbX8tI/HTV+3RppEDQycm5RsCM=
X-Google-Smtp-Source: AGHT+IEg9PnTcT6BSRsSqrS8CdhAVEObZ4GIia4fpQ6/wBRhLPAJAaAuqSZKOxEWiKUIlV1NYlviHA==
X-Received: by 2002:a05:6000:2d12:b0:382:3afd:1273 with SMTP id ffacd0b85a97d-385c6ec0b21mr4354997f8f.30.1732790596550;
        Thu, 28 Nov 2024 02:43:16 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:16 -0800 (PST)
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
Subject: [PATCH for-10.0 04/25] tests/fp: Explicitly set inf-zero-nan rule
Date: Thu, 28 Nov 2024 10:42:49 +0000
Message-Id: <20241128104310.3452934-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KuenIO51azJK

Explicitly set a rule in the softfloat tests for the inf-zero-nan
muladd special case.  In meson.build we put -DTARGET_ARM in fpcflags,
and so we should select here the Arm rule of
float_infzeronan_dnan_if_qnan.
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
