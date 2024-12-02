Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802121njk;
        Mon, 2 Dec 2024 05:14:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUH+1FTBN/3On4hC+DYl9uWQMd/TFFKHrWhZs9wLx5xj2S7/f4ik+wYEinTOL1fir3Jz9tPD5+ilLIOEA==@linaro.org
X-Received: by 2002:a05:600c:3588:b0:434:a350:207c with SMTP id 5b1f17b1804b1-434a9de78e8mr185506995e9.23.1733145266289;
        Mon, 02 Dec 2024 05:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145266; cv=none;
        d=google.com; s=arc-20240605;
        b=RHt49iV/Tam0cP/Lh9gXpc9rBu1+buFYquK/XsN8KpPUc8lzuJrFH3t4KZrGrM24uv
         TyjreWMNq5Msl3woEfgejXGJR7BH3m9P6EhsjhWvwcR97GN8swTUQiOYVDjndivVY+Fh
         cjo2AYyQ1MX3U6xGRPv+aRfHeUJN5Lhndp9BAeMpHmPkwK2hHL+oKVQd00zjBM4hcM0Y
         5FcYg5C6152c0x3ZuCQY51UJBw7323Ub4OBQoOgsBR9mR0IZMMpcisiw/A5jLLxQsjhP
         5iBIpubGkZUXQxDrQwa3C/BXvukKog9UGHGSW5qGVC2LLEiCrAaX/vLKiQRv6mlrst2z
         dWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RVdc4tZyi1UviPeSEA9C0j58Iz1J5UUJq0KN40I4wsc=;
        fh=yy1GCoP4udPx7KdQMSnqQBqEP47DCsPCbTP1dsLHg14=;
        b=CB0Um0dNTmaD02RapvWVM1OQFUeaxtuzSyPwr0+2fe95kLpylC5Ra1uNHxqA29d4cB
         yTC2yR5/iQzdOg+XUBpi3DIr2v2nKq9T4/LF9CjEf2j7F3lCfvrpkt+wY5giRXLnt1q6
         BhM5l7vbb4qduBSQH7JO01/GuDrBErz3b2rKR8TC0BPH7vWlP1WI0IxDVARLFE7Ijlwp
         zKRDsxgMCV3Zq05pVOtEBQd/5nM0CxLt6vofJGgzmfXTOvxpi4u4d4X611hW+kcgl/wF
         YdGaKLRIb7rUyEJzBjNYZ4l+WjGRiuiLWq41Kvp4cZMPWei1PgtqoADlkAsKH1pIccQH
         EV7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5QC4UgW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e9df81d1sor790166f8f.6.2024.12.02.05.14.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5QC4UgW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145266; x=1733750066; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVdc4tZyi1UviPeSEA9C0j58Iz1J5UUJq0KN40I4wsc=;
        b=h5QC4UgWdQBiR4OKvesIqvCKJNRJ2YqRDPd6LZkPQKUWfQtw0W58D8hzjD7dSHXTgm
         oxt+KWjmV+8MDrYGNbrqVMAmk9Jnj2VThK3pwXsE7Q8IbMGwWf3WWT6sM7pD6W/t097z
         sw6hM8tjT1GciseAxaAcS6j/Pg5au0HAF50+uiWtyszFXNLg748nVIfsgBr0imxj2wEP
         sJOkP3ykX2XgRZGG9WEuYGWE7voqgKxGERbXZhiY4gm9Q4X1MMfgoXgRS45TL84f9ZVD
         ytQnAyJKsnyOnVVlaRN2lOTiqUe/p2q1HSyhKHhrKR6888IQj4JEXXJocHUdWNw0fAbQ
         sPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145266; x=1733750066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RVdc4tZyi1UviPeSEA9C0j58Iz1J5UUJq0KN40I4wsc=;
        b=OE50jX/BQFbFAfIfeNjVF4P7FrNSS4GCEaYibYG/yf/sYh4ndI2lVES+bhbpCSArKF
         D4ujpsENojRP/xBgQhPCrPBq4yYe0hnFFwuWH3e3AWaX+DFdMwbXMB4X0tnQtnnhk6JY
         UmsZEdTXSJ/rsVGK0HayS0iCzap8kKYYbbzseI1UCFcnGFZljTTGfdroLTnesu1UF03g
         ALtUeBk2RYvpjx9lqK5ePxdPU5MivLE9HGmsEeU/9Vl1aBwSSPln2B89IwdIs8shJYkH
         fnMERsfG5/sPw5I/CGm4QTgPJ5pfOJbaeb++SUK0z5sSmRvpx9DX0hXfL2/SZMWVtOlG
         f/UA==
X-Forwarded-Encrypted: i=1; AJvYcCVvCBc3+gAPORUqDuVgXggBxYNknkRnMiqzD6bmpYZhO9+Gh5MMwXitCSAszm7E0UTNQ9IxI6X7WqUcmg==@linaro.org
X-Gm-Message-State: AOJu0Yx9vknaPzKiMDw9gVXtF7w8Ya6KchwGhCiWeMiPW9FTIVJwN5s9
	kty+U/qfD1CiPwFSo2gSl1K+sawgvdPNVePOIAy8uaD4IkWx1kT8j6/Z5YXJuARMwg==
X-Gm-Gg: ASbGncsuaax6RlDvCTKxlroVu7uMGt/bZnSECvbcxSw/VOlZ6QvLE9U7mifYBP10kwn
	wU7bot5LG4x0Xl0r5chumJkGcfOJtxcqWrgJHZ++5Os5BJTALCICba5Ki0nU1M8XqMxsQRucOPd
	bmjR2oqDPhfuK6kgNGnAn/r14hJ12+CB82P8AMJp/U3n7xqKabzq8w+ZiW/9lA5Ezk1TlNzveYF
	LTbd3rKaH00y927Oy4pgRgb2yewaStxE8WOSVS5cFph3jX156A/4cM=
X-Google-Smtp-Source: AGHT+IFX1etwkjarTt46ZlKph01y4djx8VmdliUA9Wg/W51R9iVpkNjJ7oK3rgJgCn5gIz9g28Kmog==
X-Received: by 2002:a05:6000:1566:b0:382:4f70:10cf with SMTP id ffacd0b85a97d-385c6ebba5cmr20127579f8f.20.1733145265729;
        Mon, 02 Dec 2024 05:14:25 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:25 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 20/54] target/s390x: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:13 +0000
Message-Id: <20241202131347.498124-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T1dBR8q3Op1s

Set the Float3NaNPropRule explicitly for s390x, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.c             | 1 +
 fpu/softfloat-specialize.c.inc | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d5941b5b9df..e74055bad79 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -206,6 +206,7 @@ static void s390_cpu_reset_hold(Object *obj, ResetType type)
         set_float_detect_tininess(float_tininess_before_rounding,
                                   &env->fpu_status);
         set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fpu_status);
+        set_float_3nan_prop_rule(float_3nan_prop_s_abc, &env->fpu_status);
         set_float_infzeronan_rule(float_infzeronan_dnan_always,
                                   &env->fpu_status);
        /* fall through */
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 173b9eadb57..8a36280df1a 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -511,8 +511,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             rule = float_3nan_prop_s_cab;
         }
-#elif defined(TARGET_S390X)
-        rule = float_3nan_prop_s_abc;
 #elif defined(TARGET_SPARC)
         rule = float_3nan_prop_s_cba;
 #elif defined(TARGET_XTENSA)
-- 
2.34.1
