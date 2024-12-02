Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802382njk;
        Mon, 2 Dec 2024 05:14:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFw8aj6c+dWTv/LS5mXVDV6rDgcPBWGdLZ7vMwgA2vj2OERdUqJ7ZlquMd4COaQrKtV16mZKWGypLyqw==@linaro.org
X-Received: by 2002:a5d:5f83:0:b0:385:f60b:f5c4 with SMTP id ffacd0b85a97d-385f60bfa3emr2344531f8f.29.1733145282230;
        Mon, 02 Dec 2024 05:14:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145282; cv=none;
        d=google.com; s=arc-20240605;
        b=hs5nNkyO48IQAGfd55JZGwBePDrWwSWRKfQX3lzw44sha3/rjskENsT5JceE52BHH3
         x/wGuVVUzuuJObBh7edjdULRF+A5qfCaQbB2U6+R33QPum7WLtRvJvW+6YQy76IFlUoY
         ijFdaZTwMJT3revu9oxPsy20C3GyVdXFyJPGONbmxbs7zy1z3sqekqZfXf51Eed8HRfR
         uunR6Fu+NjVy/G+yWJ5qtD4h/u1mLNtKpkGmSeI7Ay+Q5BCCzImz65NelVUFPAC44Dti
         bIRgsPUx8hjjxy/cQP6Bt49BcvHXAMBV/EHYKogqth3zsXqM/xYhkU+2M3b9v/hw3PQe
         V6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q4IQwxgZ7TI3dnLUr9pZJR/1M5zZVOxtymkRhBauZGw=;
        fh=Ldjuw230QrZTBCvOPNtdrHmq7zgb8Xek6l7HpzJAc5o=;
        b=ZRNgXGh/gD6EwCB0bhdxJwG0w3ZmdaYg8iMo16ACNJhrrE3+zVMV6PV2yMVxj+hYIv
         7cFt4ln5V0LrI9sObI/OuN3EK/laZVWIAvj+5JNbFJTPewS+oroOnfgY7CXGHmaS+x/u
         xeATC77jOxux0yZOpV3hHPSyQX9laIDa3WLJABBJW8AJvVGB0xsZJNRucmKsgjr6gcHJ
         zZ2cEw++eXBsNeX54d2MbX0bOYz2HQlrzaNzBlhHjst3BL1Uurnc6aDoMZaxbk1tp1na
         PG+mjKJeRnse+82zzivWm6h4e1lCSgARO3fM0Bf7DEjONtinreINv3OKc2dy+Tz8pA2b
         U2Sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xAmcebou;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385edd47d9esor777866f8f.0.2024.12.02.05.14.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xAmcebou;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145282; x=1733750082; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4IQwxgZ7TI3dnLUr9pZJR/1M5zZVOxtymkRhBauZGw=;
        b=xAmcebou4mOLalTEdmx1Uw15eJnRrS96Z/+DftYG0jSumsCOxvhUZPGePqTMBGT9iE
         NiZpAru1wf3gFNTxkOkR+zzzorymM8rVFQNjayFfDfPQFFi6jZcgng1bI+4/M66m+39O
         ukNisXb9qe+bsmIG4J+aPqla/fOxOFeU1kh7QEzMtgHW73O/oAuGE+koA2Kk6VZpnZ+i
         4Bs6ywOxxLt+vxF6jomCuVNZeRxYTnpFboh7mtnWqHxtspCmmSIdOmdg8OIZGDCPod1k
         d0kOfPUgbC7rJuKYLHUlZDWyuhev9ZESRQ7uGTIc+5bQV4byV0SRknvTitkq4MedI4hE
         B/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145282; x=1733750082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4IQwxgZ7TI3dnLUr9pZJR/1M5zZVOxtymkRhBauZGw=;
        b=CdYfJEpVk6QL0cFk7qEoTQiZRdDQcHCYOePNLAE/iWlvXae85JYlR3PKWtTuI5jgS9
         6dtjmWfFUVEnb47Kp5JT+3Ef6XVkxQkfWKCYp0w4gpIlzHRt4prRFiGqq4/hFkMztl17
         Tqtr58UwD+z7A6KWgpxYqqi2N/tMESH6XRuUJ25NOA2Lx0niLNEQIZulfJo60MGmG25I
         F/L7HV9XOkTlDqPllHo8YhKTIqQKqjj4PvGO2SCYPNVivE8vvmQcMK6DJqwsRETnKJZo
         Bm7Tb0awhsYKKzyk3AdSy+cZslguStf/bdJKRyGFwtqfFSG+VfQEDNP4z0G+sb/0oGJI
         FQng==
X-Forwarded-Encrypted: i=1; AJvYcCU7YjY8ktr9P8u1X/H89n2l+LltK3gs/vb103Zmyepu8ttG22Mrkek5RcIQuwlErjkGkLJtkY48kvqGwg==@linaro.org
X-Gm-Message-State: AOJu0YynBFXxxAbqnZfwBM519ghzE6u8BUnjEAyw48VMWA1DogHRgmHQ
	WX48/fLw3O0EQjMidJKvjgmjVUX6LVRd7ZOgjaHqPtriUS8wN4e9g0VvB/kX2URQmA==
X-Gm-Gg: ASbGncsGmJsSw4/ZXNRxKiG0+GSL3PtQePa/gP/1ot+vNVzfVKyEtlBmjD5arGzLc4j
	EPQXTfsKkPneTiLEcQHmi1nMznEb+JaqNQ+2xyr2MgFZTiD6zdcnMDlu8ihRdf4FxixkBpMaCog
	zVz67HG9pEsNd/PZ5E/F1YSI6CrfV3hq1ABOL5HY06tTaquz+IE5CgX3d3LGS7GxXbiNPl1+PKm
	onRqE18R9B6TCDGLdjQ5wC/ygS67Of2jVjvqtYJtkFzm1YJLBhwUkg=
X-Google-Smtp-Source: AGHT+IGBl63lSMExmDzDmz56Hi4ps6ZYUHjIAloYoP3kfaZz4pTVN4il5atAGH8qHrWm3IohWUeDQA==
X-Received: by 2002:a5d:64c5:0:b0:385:f7b2:aadd with SMTP id ffacd0b85a97d-385f7b2add6mr1499818f8f.41.1733145281644;
        Mon, 02 Dec 2024 05:14:41 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:41 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 35/54] tests/fp: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:28 +0000
Message-Id: <20241202131347.498124-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uJX3tgtcxsv+

Set the default NaN pattern explicitly for the tests/fp code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/fp/fp-bench.c     | 1 +
 tests/fp/fp-test-log2.c | 1 +
 tests/fp/fp-test.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index 39d80c9038f..eacb39b99cb 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -495,6 +495,7 @@ static void run_bench(void)
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &soft_status);
     set_float_3nan_prop_rule(float_3nan_prop_s_cab, &soft_status);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, &soft_status);
+    set_float_default_nan_pattern(0b01000000, &soft_status);
 
     f = bench_funcs[operation][precision];
     g_assert(f);
diff --git a/tests/fp/fp-test-log2.c b/tests/fp/fp-test-log2.c
index de702c4c80d..79f619cdea9 100644
--- a/tests/fp/fp-test-log2.c
+++ b/tests/fp/fp-test-log2.c
@@ -71,6 +71,7 @@ int main(int ac, char **av)
     int i;
 
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &qsf);
+    set_float_default_nan_pattern(0b01000000, &qsf);
     set_float_rounding_mode(float_round_nearest_even, &qsf);
 
     test.d = 0.0;
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index f290d523ab1..c619e5dbf72 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -941,6 +941,7 @@ void run_test(void)
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &qsf);
     set_float_3nan_prop_rule(float_3nan_prop_s_cab, &qsf);
+    set_float_default_nan_pattern(0b01000000, &qsf);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, &qsf);
 
     genCases_setLevel(test_level);
-- 
2.34.1
