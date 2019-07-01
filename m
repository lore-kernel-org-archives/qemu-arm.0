Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653693wru;
        Mon, 1 Jul 2019 06:26:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxq+h4YF5ArEG+eBzj/QRvmRujjOv2E0thJPk+1LGm9zWFXtU1F+shB5RYdEZhvb24jT8DO
X-Received: by 2002:ac8:152:: with SMTP id f18mr19783716qtg.84.1561987593189;
        Mon, 01 Jul 2019 06:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987593; cv=none;
        d=google.com; s=arc-20160816;
        b=BkAws/+8dUqnYV5eBPIlIDguE+dlYq3SzMB4mkDJO2DWuFU0VjR00h/YhTnePhxHcS
         EMErzNDdN1V1fqbsnjebIaU4GgEaKRd5tR0xpWkcxqxvFYOpc16hZR85bwOFnK9ed/i1
         CE2qvtTF0QmeeeOqw9agcXkd4ipv4sQPfw4uk5MZarIwypoH46mKlqWw8ksU3ITrqRsV
         UCtMohc0+u99MtqlE5HhAxwHnVHkKygdJJAWQ9Y4HuFJZ++frfStbmdiMGj3JubXG/cm
         KTeEOe0AyCGxbk6Z7mDRR2gtWXF2UH34X/iebc8S/7CLihH2j31H4vmme3eVmioahVFO
         unog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=pptr5Ti+a06KM9NMKQ1GvDzvmCHJhbY8vs9t20odTzE=;
        b=D2/EtBwMk1HWsCwxYgTFc3pc7bIDJFbQsh/C03x67y+9+KreNWuoozg7BhWea8NXc2
         x4lBcmG1RSlbsqnSVIwhw6RZThpSwgQ03aYfZQyprpzuXA5Ao//ZjZ5aPa+ws8kf+Yyd
         6wc8jQkaNHSv7W+0l1pTCHuHxn/cu9xt/KPWoDUMRA6j6fmjZOcr2JaXZWQRq3RJNFMN
         dPazsFoTTiHnzAjvTMITr6vQDcvIk5MU7krT6M1l9N5GNunXUaqlBK6QR5mZGbZ2Auiw
         APVxWllxvb8dSGI/yJQDICVCEZeqre9djclmEtlxl4Tj967S0JqbDhZLL3mHCyUf1cEx
         dvNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j7si7385486qth.112.2019.07.01.06.26.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:26:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4792730C5843;
	Mon,  1 Jul 2019 13:26:24 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6616085B;
	Mon,  1 Jul 2019 13:26:21 +0000 (UTC)
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
Subject: [PATCH v3 14/27] target/arm/vfp_helper: Move code around
Date: Mon,  1 Jul 2019 15:25:03 +0200
Message-Id: <20190701132516.26392-15-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 01 Jul 2019 13:26:24 +0000 (UTC)
X-TUID: 5TYzaK8UfCvb

To ease the review of the next commit,
move the vfp_exceptbits_to_host() function directly after
vfp_exceptbits_from_host().  Amusingly the diff shows we
are moving vfp_get_fpscr().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/vfp_helper.c | 52 ++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 121bdbd3af..d54e325324 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -55,32 +55,6 @@ static inline int vfp_exceptbits_from_host(int host_bits)
     return target_bits;
 }
 
-uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
-{
-    uint32_t i, fpscr;
-
-    fpscr = env->vfp.xregs[ARM_VFP_FPSCR]
-            | (env->vfp.vec_len << 16)
-            | (env->vfp.vec_stride << 20);
-
-    i = get_float_exception_flags(&env->vfp.fp_status);
-    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
-    /* FZ16 does not generate an input denormal exception.  */
-    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
-          & ~float_flag_input_denormal);
-    fpscr |= vfp_exceptbits_from_host(i);
-
-    i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
-    fpscr |= i ? FPCR_QC : 0;
-
-    return fpscr;
-}
-
-uint32_t vfp_get_fpscr(CPUARMState *env)
-{
-    return HELPER(vfp_get_fpscr)(env);
-}
-
 /* Convert vfp exception flags to target form.  */
 static inline int vfp_exceptbits_to_host(int target_bits)
 {
@@ -107,6 +81,32 @@ static inline int vfp_exceptbits_to_host(int target_bits)
     return host_bits;
 }
 
+uint32_t HELPER(vfp_get_fpscr)(CPUARMState *env)
+{
+    uint32_t i, fpscr;
+
+    fpscr = env->vfp.xregs[ARM_VFP_FPSCR]
+            | (env->vfp.vec_len << 16)
+            | (env->vfp.vec_stride << 20);
+
+    i = get_float_exception_flags(&env->vfp.fp_status);
+    i |= get_float_exception_flags(&env->vfp.standard_fp_status);
+    /* FZ16 does not generate an input denormal exception.  */
+    i |= (get_float_exception_flags(&env->vfp.fp_status_f16)
+          & ~float_flag_input_denormal);
+    fpscr |= vfp_exceptbits_from_host(i);
+
+    i = env->vfp.qc[0] | env->vfp.qc[1] | env->vfp.qc[2] | env->vfp.qc[3];
+    fpscr |= i ? FPCR_QC : 0;
+
+    return fpscr;
+}
+
+uint32_t vfp_get_fpscr(CPUARMState *env)
+{
+    return HELPER(vfp_get_fpscr)(env);
+}
+
 void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
 {
     int i;
-- 
2.20.1
