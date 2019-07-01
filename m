Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653830wru;
        Mon, 1 Jul 2019 06:26:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRmT8vUDaijvKHRn8GatqvRBhlM+1/h8jvS85amX2OIZc+0V/LyYcVeWCqTPjSfwVeiARU
X-Received: by 2002:a37:98e:: with SMTP id 136mr19405835qkj.444.1561987601317;
        Mon, 01 Jul 2019 06:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987601; cv=none;
        d=google.com; s=arc-20160816;
        b=EXD9gr5I2blew2wOaqQ2dVRSNPrsW93NnaFP3piP4iynySayp6+//aicz7blsqsET1
         ZSW1/VOQdvlalvVclLHfm7hRdmRzw0m+8OGX1lAHk6d4xVOczxB+zk9RSen6WYLX+Jfs
         q0v5Qh6pMmDuk2ONcupNflxhMeYCs9DmDY2dwRjz3kDWcntx3BYw5NJLx2Lp1UWqf8cO
         rqvWFm3EwE0Z9yqydazbBQMwDip345wjsVrEYqxNgTcSZRPLylE0VyedjL8bEgzNVQOh
         vFS4J5iJuOKP21w9amYroiusfHZzVXYRDu+Cm7sNlqBF1K31dE5f3qCUBZePwpwIgtEg
         gonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=4X9M/VSqd7PSNgXSkMXX68Tw3CPgBzwr2XJbr1AwnsQ=;
        b=zLB7XbodbCp2HdW9jZNcGMDpe7zsSNx5LYbWXNww6oM8JAPX3yQXTvKk7/70soAeSb
         kuj2Pj8+/8Ovv6heIbuDTqDJ8bmk/S60ksmzqyEeGj3GEyMtWHE33jJ9jMOVD6kHkIrK
         t5JK6HJ7HamITWyvYtsJVwbJRIbMx3UKIxVH1BoFmSdKg7cfSXxhmaMl9HYJJl9T6cBM
         M7gyfDqNtpEuSNv0jZLI7NwLoGPnWbnkomLiJX+XfXqz/9Huw3uaVwGtsS3+VVxoyVOZ
         eeeTzgzhVaUl0DtmBPAsih5NU/Z6EiVUzRaCGkJ/M9I6yLMmkxQxi/SvhkrfNh+Lt/kY
         PQCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l7si7695817qkg.304.2019.07.01.06.26.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E77A330260;
	Mon,  1 Jul 2019 13:26:32 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BF686085B;
	Mon,  1 Jul 2019 13:26:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 16/27] target/arm/vfp_helper: Extract vfp_set_fpscr_from_host()
Date: Mon,  1 Jul 2019 15:25:05 +0200
Message-Id: <20190701132516.26392-17-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 01 Jul 2019 13:26:32 +0000 (UTC)
X-TUID: Ey5VhIx4Emzu

The vfp_set_fpscr() helper contains code specific to the host
floating point implementation (here the SoftFloat library).
Extract this code to vfp_set_fpscr_from_host().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/vfp_helper.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index b19a395b67..838f7d25fd 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -81,6 +81,18 @@ static inline int vfp_exceptbits_to_host(int target_bits)
     return host_bits;
 }
 
+static uint32_t vfp_get_fpscr_from_host(CPUARMState *env)
+{
+    uint32_t i;
+
+    i = get_float_exception_flags(&env->vfp.fp_status);
+    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
+    /* FZ16 does not generate an input denormal exception.  */
+    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
+          & ~float_flag_input_denormal);
+    return vfp_exceptbits_from_host(i);
+}
+
 static void vfp_set_fpscr_to_host(CPUARMState *env, uint32_t val)
 {
     int i;
@@ -141,12 +153,7 @@ uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
             | (env->vfp.vec_len << 16)
             | (env->vfp.vec_stride << 20);
 
-    i = get_float_exception_flags(&env->vfp.fp_status);
-    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
-    /* FZ16 does not generate an input denormal exception.  */
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
-          & ~float_flag_input_denormal);
-    fpscr |= vfp_exceptbits_from_host(i);
+    fpscr |= vfp_get_fpscr_from_host(env);
 
     i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
     fpscr |= i ? FPCR_QC : 0;
-- 
2.20.1
