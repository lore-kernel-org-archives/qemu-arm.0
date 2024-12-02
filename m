Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802339njk;
        Mon, 2 Dec 2024 05:14:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU2gEAR/77DlPL0QDDEN18PtK12o6a4IDDPc5AycXczsZJIJXI4e3Z8rXQAK0ct51oQswNYEa7NgNZ/Jg==@linaro.org
X-Received: by 2002:a05:600c:4e8b:b0:42c:de34:34be with SMTP id 5b1f17b1804b1-434a9db8393mr233611755e9.3.1733145279402;
        Mon, 02 Dec 2024 05:14:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145279; cv=none;
        d=google.com; s=arc-20240605;
        b=LRI3hu6pCSmWfDbNniLvqX8Q1dJuneSMQjFiQq24cX/2TNm0ATkHlvXiJ1pRb1aMDx
         n/p5OUh0ATPuhH+vT8u955+4Ywg6ogG0MIGvaAVf5Hc9XEHyr3olgRBBuxBT0K4rCVrJ
         NxPMruaA9MYctQQovy7ZY2dDPcuEfYvVqFS8qnkwBmkjnW1ML+DeFJZaO4cyRn2MJBaI
         HrWoAY6lvI+ukrX0vdjihgAHbnVVLrF1sc+lBCR68RCpRZfmYG9f90FwXUuNSH82SnEC
         Yaww9hUUH9TAuEBypp08c6QWf4gs2e8ThSOe/V+3T6/R43GA0pxOpeq2MMVqo7b/ILDb
         bIaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bcSQWPJxoEZ5kc/cEyAZreOowNhccL15M84TKXenqM8=;
        fh=raBMUz886tDeYtRHm3IQKl/GQAjxEl7gMlqdEQfhJjg=;
        b=LF5mLmQY2o2J/qsv2bfwj3Z7z9h/o3V3f2EApneVqSlY9VbvwMUm1fkRJw5F78wdxB
         RK/YAUHbd6mfmXRzbbcj0DBRgGDPr5sP2L1d+LJ/Xki7Bp2s/1JKgFTInIoAgi+H4otN
         7XNiBctdnpDqC31y1GupaaUzboaFaM0gIYPnA1AqLXrURNZrNnQfiPVKCLUPI3n+FUTq
         ICN5Cvg2e1kHBiA0Yu9yGnzt10Mou9EShiqFH+r4kdDPX3Wxxbxg4q/o9PfEvu7vLvLd
         gds2op5iDOstSv0R2k1Pg1Q+RUPOFEyYJu3WsL/Ce4JoiXi3JIgICwpJaj+HI6HX/7eb
         wK/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GO5ravyw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385f1574a2fsor660108f8f.6.2024.12.02.05.14.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:39 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GO5ravyw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145279; x=1733750079; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcSQWPJxoEZ5kc/cEyAZreOowNhccL15M84TKXenqM8=;
        b=GO5ravywRtVwdVUJ/+cWOxGnV0jTr8sDea3D4atrT6funy3Yj02nmyJD7L+vIpj/6Z
         5Uok0Wvnu2QIyfj1936ASYE7sTAe/O/bzvCC0D+4zxN8rbMn2Gfe7ZeLDEs45HS2jrhh
         62y5RMmmfufwFQnWioRufW35G6PVcVTlyqOyNjHwAW6FUzF3fQRPAXeCHeC5gtvCE9PG
         sgVUGEcE6mRfMLvaIwmQ6xq6PITiELm0l0q21302OB7fMlX6AAAkl4XGVhuBHEtpIsWN
         1fOeJU96ckuXwgal8sYtnOHLRDwJKjWxwJ2dWMf/SZKsVHsJ2xCXtzoN/Sd4l5qKvPcK
         xBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145279; x=1733750079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcSQWPJxoEZ5kc/cEyAZreOowNhccL15M84TKXenqM8=;
        b=U7bjJfbo4+GAT8Bpx2s36GjnPc9zpXCjC3g50gMkUBBR6aWvcRVo9SjzBcZtmBS4Ji
         tyjHRzOx3RuaVkZHVfy3ZfFt3vGXyTsJvef6jd9UtvJBgkgD8uVou0CvH5ot3H/RT1In
         EEslheLbIg+rXrXJxQpx5KPs3iRALFbVfrI4IGmOAJh99ZwmUD0DVwTXnM0dXbtkfr8a
         hqWrAQsoDSDNagj5Ib+ONi6vmEqu3tZcjPnqwAu+Ns1avwlw7lIpuVeGPUshdIpn/1jm
         dz3GfDpEK1gfj2KuSR89MJ9hzf5cC2ceHWM+hX3ZNMPTG1CVxBsRNTu7wF9/zEj1UJ4C
         qe4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXg4TbVxTzxLSuws4erLhI3wo+xnr3TZ3xHzVgIb8R3l6eZyvS44Fsqi0z2J0JVPDkNeQR6VhlB5zH7ug==@linaro.org
X-Gm-Message-State: AOJu0YxixbcL5cgz7f5WxdSZhJIOj6TQAlqEFuwAof2rOnIfF4jNWGrn
	9FCVYRB2yaKlUYrrYfv9SVLob5RzKa1i7hyrOOizRXtEPbBuytc1YsxkZcTImHu5vA==
X-Gm-Gg: ASbGncs95sqbPi94eeJmRCLa6ah2xBrfk9gD3+KNhOGA0iSXj4x6MaymNnmTVJ0dYsB
	VaPh2Q7UAfO3g1EpCJuq2lLy7BiFmPjJx1Zqw/MiZnofT/3SavyLG7fpweyzhwREaanaDrt53ib
	WqX70uVzV6rtHf8DcEW6cuuHkPc1SRjXA/6Ew4QYHaMqAbzCK1GxADh93mX2NIe+gtAviWD3oYc
	HZtp6vKtDuo2P8Ltpf0oZCCyam26I3O0d+Hkp29g8ByZr6FEc02KOU=
X-Google-Smtp-Source: AGHT+IHr1vI+MOZbtPkNYb3mNUy7gWjvLx38mjS4L3RplG6H9NCgwOtAH784x77t7dH5oedV37mDOA==
X-Received: by 2002:a5d:6d8e:0:b0:382:4b2a:4683 with SMTP id ffacd0b85a97d-385c6eb84c3mr21557497f8f.2.1733145278737;
        Mon, 02 Dec 2024 05:14:38 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:38 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 32/54] target/sparc: Initialize local scratch float_status from env->fp_status
Date: Mon,  2 Dec 2024 13:13:25 +0000
Message-Id: <20241202131347.498124-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aqkjdaOd02JX

In the helper functions flcmps and flcmpd we use a scratch float_status
so that we don't change the CPU state if the comparison raises any
floating point exception flags. Instead of zero-initializing this
scratch float_status, initialize it as a copy of env->fp_status. This
avoids the need to explicitly initialize settings like the NaN
propagation rule or others we might add to softfloat in future.

To do this we need to pass the CPU env pointer in to the helper.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/sparc/helper.h     | 4 ++--
 target/sparc/fop_helper.c | 8 ++++----
 target/sparc/translate.c  | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/sparc/helper.h b/target/sparc/helper.h
index 134e519a377..1ae3f0c467d 100644
--- a/target/sparc/helper.h
+++ b/target/sparc/helper.h
@@ -51,8 +51,8 @@ DEF_HELPER_FLAGS_3(fcmpd, TCG_CALL_NO_WG, i32, env, f64, f64)
 DEF_HELPER_FLAGS_3(fcmped, TCG_CALL_NO_WG, i32, env, f64, f64)
 DEF_HELPER_FLAGS_3(fcmpq, TCG_CALL_NO_WG, i32, env, i128, i128)
 DEF_HELPER_FLAGS_3(fcmpeq, TCG_CALL_NO_WG, i32, env, i128, i128)
-DEF_HELPER_FLAGS_2(flcmps, TCG_CALL_NO_RWG_SE, i32, f32, f32)
-DEF_HELPER_FLAGS_2(flcmpd, TCG_CALL_NO_RWG_SE, i32, f64, f64)
+DEF_HELPER_FLAGS_3(flcmps, TCG_CALL_NO_RWG_SE, i32, env, f32, f32)
+DEF_HELPER_FLAGS_3(flcmpd, TCG_CALL_NO_RWG_SE, i32, env, f64, f64)
 DEF_HELPER_2(raise_exception, noreturn, env, int)
 
 DEF_HELPER_FLAGS_3(faddd, TCG_CALL_NO_WG, f64, env, f64, f64)
diff --git a/target/sparc/fop_helper.c b/target/sparc/fop_helper.c
index 6f9ccc008a0..236d27b19c1 100644
--- a/target/sparc/fop_helper.c
+++ b/target/sparc/fop_helper.c
@@ -490,13 +490,13 @@ uint32_t helper_fcmpeq(CPUSPARCState *env, Int128 src1, Int128 src2)
     return finish_fcmp(env, r, GETPC());
 }
 
-uint32_t helper_flcmps(float32 src1, float32 src2)
+uint32_t helper_flcmps(CPUSPARCState *env, float32 src1, float32 src2)
 {
     /*
      * FLCMP never raises an exception nor modifies any FSR fields.
      * Perform the comparison with a dummy fp environment.
      */
-    float_status discard = { };
+    float_status discard = env->fp_status;
     FloatRelation r;
 
     set_float_2nan_prop_rule(float_2nan_prop_s_ba, &discard);
@@ -518,9 +518,9 @@ uint32_t helper_flcmps(float32 src1, float32 src2)
     g_assert_not_reached();
 }
 
-uint32_t helper_flcmpd(float64 src1, float64 src2)
+uint32_t helper_flcmpd(CPUSPARCState *env, float64 src1, float64 src2)
 {
-    float_status discard = { };
+    float_status discard = env->fp_status;
     FloatRelation r;
 
     set_float_2nan_prop_rule(float_2nan_prop_s_ba, &discard);
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index cdd0a95c03d..322319a1288 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5584,7 +5584,7 @@ static bool trans_FLCMPs(DisasContext *dc, arg_FLCMPs *a)
 
     src1 = gen_load_fpr_F(dc, a->rs1);
     src2 = gen_load_fpr_F(dc, a->rs2);
-    gen_helper_flcmps(cpu_fcc[a->cc], src1, src2);
+    gen_helper_flcmps(cpu_fcc[a->cc], tcg_env, src1, src2);
     return advance_pc(dc);
 }
 
@@ -5601,7 +5601,7 @@ static bool trans_FLCMPd(DisasContext *dc, arg_FLCMPd *a)
 
     src1 = gen_load_fpr_D(dc, a->rs1);
     src2 = gen_load_fpr_D(dc, a->rs2);
-    gen_helper_flcmpd(cpu_fcc[a->cc], src1, src2);
+    gen_helper_flcmpd(cpu_fcc[a->cc], tcg_env, src1, src2);
     return advance_pc(dc);
 }
 
-- 
2.34.1
