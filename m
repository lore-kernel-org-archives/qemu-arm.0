Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413138njb;
        Thu, 28 Nov 2024 02:43:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXKWdRrcavAcLIc/u0PFoo/cDMs6OG1GqZ8/Qnwk/1GP0JSjCZ6hnOU2AOon0Wd//7T486eNgfbuBdUg==@linaro.org
X-Received: by 2002:a05:6000:1acc:b0:382:51ae:7569 with SMTP id ffacd0b85a97d-385c6eb7303mr4802420f8f.18.1732790606863;
        Thu, 28 Nov 2024 02:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790606; cv=none;
        d=google.com; s=arc-20240605;
        b=g7Cy3X2vuEp5xoiZUbXZOSrjyXzioUILxBL58xDJVcMpPe4EztDdinfVElm7gI9O0Z
         qprqq+rof60ARKudC87iE2jkN8KJR8ZSexChSRZI9/QwL0mvI7UmhRQ3MVdAdaVM2Abf
         jnqgtPXYUzIqbUFqMrub5Q5oWq5WcUBgnGUGkhvKn6tizSJ0E5Ok/TMdm7x6l2V4tbm0
         aMZqwABnXCdmflV0XooAu077IpIb8udipjL424ly+cSskDNFGS+wQObMyFfd/lh66nug
         ShWBLfellnDQ/XbGh1rpyFooRwlBUZkVOsW9hcAt1wV2hTFintcQtBzAn8r9X84djAIv
         j+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QSKy4hpjmDanw2YkU8Msj9vNT9iFFxMr9XhYnZJtyOY=;
        fh=GuLeCxv+9JJG+rxuje8bOG62w5khFfYTS99xDovbBpA=;
        b=jzbWpZ8fBoFpinwYFXXXsdX6vc8QRt+klCEb/Ka00jqFowyDG1P3DfbM5A+EExVrOd
         AQmKwEQczzMTr1uUdB5Ozv30hZeXEKMMtxMzm2Zxn5z4yIxTXv2q7QZUJAg0uIBhiA/5
         LK+R3kZ6B3ARZxBmPmbEd7xzjSK/C29Ko8ZxoyAMpaRE5xYBbiSxaQETWkI++FMEoO4R
         5eA05KTfADFCkMhjG5sMTjMCTBmCf3VIGiOZnAI4DQec1fmIKDHHvoLUAAdE5jQqHw7e
         gLL7eXEZAZa/aTXEbz/trYY6Hq8HUYqSAc1iMtD8U9Rj/ntkMEAy5qiuqhaWIwBAHIfi
         Iriw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OzGYPCj0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd367e8sor395004f8f.3.2024.11.28.02.43.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OzGYPCj0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790606; x=1733395406; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSKy4hpjmDanw2YkU8Msj9vNT9iFFxMr9XhYnZJtyOY=;
        b=OzGYPCj0RAl1Lj5nmaUjtTtOKSB2iaSVrVZMLewuuhJWClAR8P8i3MZWokEL+cn6fr
         MIGyGi6HqPN3+r1g51fz3euVXPZBJ7j+rzqMY94ZQ+GE07PQyTaCuDczMaQg08eelv9z
         1TT1PkquwCirLSHkQ69/3/YZY3/t/lJiV3QIZ+P7Fto7kKdAF/0AKfRLkPdFvG/3fNve
         5+ZfvBY4O9p7q40/BB3TgEkOOizkeOFauwIyNbbz435km6dKQJUCVFGf/uWmoR6VvEsw
         1wIxSFEc5re4dIKUw6QCsVH1TxeCcWwBlQSGxugUVcbG3gYlQIqxKwpFhlD9n/leKPvQ
         hjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790606; x=1733395406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSKy4hpjmDanw2YkU8Msj9vNT9iFFxMr9XhYnZJtyOY=;
        b=myex0+RcCde72i+ZdasNiRDG5IcEvq8/2tWnq9So3X9N7LHglNY9KOHNrRD4+5j+/L
         wa3pVun0d3Vm4AXZzf70CvbOpzujm63YUyz2j8A+ioQHUd2/f3+sR3X9ntrJ3GO8fYCx
         8qXCYs2lQr1NoZTmS8yp/ljxzsGysuqkvSn5FmS+XElu9vnp6TuJ7AUC5d8Rb6aiSLfT
         7BGYqvYgJlBLJvw4M5i7nbnrvIM9/EPEeHfpMfNfzugzgpSc3PYD2QwrfLuqGIJgxNNY
         jMk8pLguMdUI2VkW+Ak4IBNi7XEx99EKetsm9uc49ymCdH9Cxb0rWUCpQml192y/i7G8
         VNeA==
X-Forwarded-Encrypted: i=1; AJvYcCVFdss8i6Csw9CSPsHjWqKxOXX/S4PiEiU9j8c/siffJT0GrIK3h6HUedMxJ5rEIZGj3kpaigO5INU4yw==@linaro.org
X-Gm-Message-State: AOJu0YyX/Y1GMeAsNTljm8CP3BJZoDR6KJcX/mn7AdmXSijlm0dTzkAZ
	zXba2p+IeMAF5N3r4NUJV6//xsGMBT8p0s4pw+wzaRvmOlqrGfRE/wstDaJLzmaEow==
X-Gm-Gg: ASbGncvfwTCqHv0Ai1VjjIzaZUfIsyUdyat16O21T4XKVwiHQqbvZ7mVFKmPLeOynrq
	LEGnWSoTQOU1Xqn//pd4KamJ6+DgILS7PCChvL18aA9kNA9rL7cdBuvKhW9zC5L3B51+8Q54F0b
	ZqQ1xlTPrZXP9cV7VkMVS8YDHO59xLLtNNrmiYgLjrQqwuBSt+CsFv2YPaq7bssR/g9z0kpILip
	iTrpzU08eKoV9/Q+Z+XHVprkTMpe+wslkElK4ce5uJxnlK/KcA7no8=
X-Google-Smtp-Source: AGHT+IFPYgLS/9mtFeOgG8MTJy0ecGQ8tHYcoQ6j4T4JFNFBCu+Lus0yiAtaYo6HX1Dg78AUM8LyQw==
X-Received: by 2002:a5d:59ab:0:b0:382:42d7:eedc with SMTP id ffacd0b85a97d-385c6cca8dfmr5318903f8f.5.1732790606376;
        Thu, 28 Nov 2024 02:43:26 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:26 -0800 (PST)
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
Subject: [PATCH for-10.0 15/25] tests/fp: Explicitly set 3-NaN propagation rule
Date: Thu, 28 Nov 2024 10:43:00 +0000
Message-Id: <20241128104310.3452934-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /97y7volAA+Q

Explicitly set a rule in the softfloat tests for propagating NaNs in
the muladd case.  In meson.build we put -DTARGET_ARM in fpcflags, and
so we should select here the Arm rule of float_3nan_prop_s_cab.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/fp/fp-bench.c | 1 +
 tests/fp/fp-test.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
index fde64836194..39d80c9038f 100644
--- a/tests/fp/fp-bench.c
+++ b/tests/fp/fp-bench.c
@@ -493,6 +493,7 @@ static void run_bench(void)
      * doesn't specify match those used by the Arm architecture.
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &soft_status);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, &soft_status);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, &soft_status);
 
     f = bench_funcs[operation][precision];
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 251c278ede9..f290d523ab1 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -940,6 +940,7 @@ void run_test(void)
      * doesn't specify match those used by the Arm architecture.
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, &qsf);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, &qsf);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, &qsf);
 
     genCases_setLevel(test_level);
-- 
2.34.1
