Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1085975njx;
        Fri, 25 Oct 2024 07:12:58 -0700 (PDT)
X-Received: by 2002:a5d:4248:0:b0:374:c1ea:2d40 with SMTP id ffacd0b85a97d-3803abc523bmr4537270f8f.1.1729865578668;
        Fri, 25 Oct 2024 07:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865578; cv=none;
        d=google.com; s=arc-20240605;
        b=Hg1sRwFqsSphvnVl4daxag9sFJ1au9dUiASz3F59YPgwMmJpwB9LWhm/uGUqzbLdF5
         gziSYPgEIqS7H5Q2h7X0rBSGn3R0ZifA8AvyFGDDkyfl3H0j1LN++VrmJTLNGtVnXHhz
         Uiib91zdkqCDbRzoJLcVlVtOhfAYrwE7XEor9vnbCpBZ1JUir3L3Rs9girCO7Fz6w318
         936FlcTy6HkXqMHlpysnQ/0rou2X+Aasu+0kj3ULTD9JjSi0hbSQwEtijFL//S2DUGFm
         wd8c8DMrIOuG3MiC08igQnS1ftIaE+qyUu7Q/0WqZ+JnTJ2mzrQisUC6WifgDVIXHKnn
         QZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZnxIUdeIDPfopOqS6esccSkst6Aak8TUkDQf9Y6bLJw=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=DtxQalrMhbhXHwoTp43E6HToGgbCB13EGioqAfpT51xTN2ba1SGdGzaELNaOTSYJu6
         RF8KrDbM+GwYm63hvFXYBG3odYpIdq7W6aaVla1SHiGsgptREH84SPxO0zTEKWUTvCIo
         cfCd43Qq6tTWcejoccL+7/omGDB+xoyUUzn75rAFQ+YRD1P/4xn0UqdrKWDE2UosYiGf
         GoYl5h0KESU6Gtxl3ZdU+0PRBl3Nd1mcj2/CYEgXBXAHutQcaEXVOO62ORRoi9i1bTm2
         H6ByHYndil++IuGDe3hHaW1PsVy6t6fVdqiBxI38um9PxZSvXEc/+aSLjxW7fp5QA3Ob
         dQKg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgjMsxTl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38031761c2bsor947083f8f.0.2024.10.25.07.12.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OgjMsxTl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865578; x=1730470378; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnxIUdeIDPfopOqS6esccSkst6Aak8TUkDQf9Y6bLJw=;
        b=OgjMsxTltakYMy6maxAUhmdcoILasXgStKOdCMUKaCZwn+rEZ5cBYrMsiaKfgPOOtG
         r3enajLG1Ar5hUGRFQtiZiquy+vxmaQo1CU12VrB2qo+sU2L0SHMZi7r/Cl46K7tjZNP
         pFyRxB6+kLgfsPnfKqBT1qL/qEpaS2GAeEFgVxMqIZCUoi5q+y3lb4sy5fh74xonN3Ki
         IkN8d1ZoXx78ysX1MPACO4DZQdgrK/19ffAWGZ8gPQF81FknXBDsK4zyfUfi5nclGv75
         Jej+Zf8gOuTuCGrtTePvO7CMMdTzR6SIdIZ3iqYXdts1s1nwovv6gwDvkilqqFsmopCX
         COIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865578; x=1730470378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnxIUdeIDPfopOqS6esccSkst6Aak8TUkDQf9Y6bLJw=;
        b=BNX1WqQqspnRW4M0A1zdT/9BozkaVDNGxbsq9ianvDOd79fWWuMIdbWBCEEx3t8W37
         FaHNtHiG8aFoEA2QWXzTKwsTTAV8y7ASKK1DTcNDPAau8B6l25TFGlE7jBL3agFlLVCu
         vdGNqBSTRzOFSEyGJkQfDSoJSaxEdJ3u+AgEOQHhpfUnAbunTKh/QyAl7VbiiPdIYHqG
         dzu6hUWMmoaRFy2dBcZ20lpFmHNQaT1ywJ1HbfhZm11kIbRiNmuFQ/QmT6Z84USE1OIE
         SeBLDwZRLcJnSqozwG7ALFtf08K6HfQBzPt33NFjsx3ZQc60UukD05aGnN12oqV564Fd
         oNJQ==
X-Gm-Message-State: AOJu0Yy0c7s7CwGNPDSIPOCLS+20AonSD1H6azexw/RbIq/eXVJhaOl4
	rAHOVPETvsjlrM67J12hFJ9eNJ7hEMsgi3QHfe1Af49OhBCm+BISUpv5VRXMqNc72WqO2BtIO2y
	MrXU=
X-Google-Smtp-Source: AGHT+IGbytfqhK7flKWpsy7Fx6Uu02lBkJU5a5y/tCFHWWrB5gwAn7GzxDwiORlerliSD/mfpFRIBw==
X-Received: by 2002:a5d:4fcb:0:b0:374:c33d:377d with SMTP id ffacd0b85a97d-380458812bbmr4321188f8f.28.1729865578101;
        Fri, 25 Oct 2024 07:12:58 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:12:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 02/21] tests/fp: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:35 +0100
Message-Id: <20241025141254.2141506-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QoVSqfSu+/lN

Explicitly set a 2-NaN propagation rule in the softfloat tests.  In
meson.build we put -DTARGET_ARM in fpcflags, and so we should select
here the Arm propagation rule of float_2nan_prop_s_ab.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/fp/fp-bench.c     | 2 ++
 tests/fp/fp-test-log2.c | 1 +
 tests/fp/fp-test.c      | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index 8ce0ca1545d..75c07d5d1f1 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -488,6 +488,8 @@ static void run_bench(void)
 {
     bench_func_t f;
 
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab, &soft_status);
+
     f = bench_funcs[operation][precision];
     g_assert(f);
     f();
diff --git a/tests/fp/fp-test-log2.c b/tests/fp/fp-test-log2.c
index 4eae93eb7cc..de702c4c80d 100644
--- a/tests/fp/fp-test-log2.c
+++ b/tests/fp/fp-test-log2.c
@@ -70,6 +70,7 @@ int main(int ac, char **av)
     float_status qsf = {0};
     int i;
 
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab, &qsf);
     set_float_rounding_mode(float_round_nearest_even, &qsf);
 
     test.d = 0.0;
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 36b5712cda0..5f6f25c8821 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -935,6 +935,8 @@ void run_test(void)
 {
     unsigned int i;
 
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab, &qsf);
+
     genCases_setLevel(test_level);
     verCases_maxErrorCount = n_max_errors;
 
-- 
2.34.1
