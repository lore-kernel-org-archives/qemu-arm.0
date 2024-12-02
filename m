Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2801827njk;
        Mon, 2 Dec 2024 05:14:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVJwSQjlDWQ2CNT4NcbJSTy4eqzVtWyWpk+DgmWjlyn3U3YfGBCmtfYWtv2x010FRwximcqHDD236TRvA==@linaro.org
X-Received: by 2002:a5d:64c7:0:b0:385:f7e5:de88 with SMTP id ffacd0b85a97d-385f7e5dfe3mr1848116f8f.3.1733145248370;
        Mon, 02 Dec 2024 05:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145248; cv=none;
        d=google.com; s=arc-20240605;
        b=F9x6yXeXg53bR4xj2ZV8+4qUDVWtj+WFbbp4Kcp1J8OIr3ae+rFj15dTLVlPFSbENx
         m3TYFLUoWwlUXoPJsPCD+/ej8Rj32boFqxRvAuQ/FU2aJu8y6K/cPcARGJ0CNlC9O241
         LMKOkhQaFBjfSG7SD3luXYRA8gkjk+ceVOW/e5KtvuWwJ4itrWGsmR/vhNSTiw820+Dc
         nrV9edymI+g6cFoTtFibVXHbeRo36ETYvvLTzryaSSvuJTah0K6QmH27nJiXklyBxsL+
         1ZvT3qjO2d8pbexSaEWGBjZRryNw1JtnVcauop2GfZYFWHC84Zb0CbGxrK2OJo57Ekof
         Xbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kkb6PbnkCxHke0j4zsNXKqcSWFA8ovR1gPxWc3WytsM=;
        fh=KjYpow5+WnF7RQxf9P/WoPpJAYpkQyNMAlTVeTVySuQ=;
        b=DqeR1lq7nRGh2UEMzyaXfYna9FYU98Ms63i5GPFu7jA+ja3mBISaUdcWynFyPrfcih
         22ne8TBWHl/9n09IOqVBDZxQVOyJ3O+PbgMd5ORj0+3YgBgVMA23dWh6FfmONRuSGSRV
         7P8l5Ua/dmICzllobpKe+vqvw+ryrK8LtpRLJoB83DKkZrMKH4Aa/pB8lfyhdzQtvXzy
         9MVbDFqxfcZ6NmrqXyJgk3G0nfIuqmfaN7MK7SmouPvUfga4a1LBWGCuE4pokUpaqPPE
         0ZMJwNBPTRMMA4uonl9+pKw2fVIaQJJ92O6mGct289vmvYYInwl7IWx3nb7h2+gSf5mK
         H1Uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RqkF4sLR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385d7e854f3sor1728345f8f.2.2024.12.02.05.14.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RqkF4sLR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145248; x=1733750048; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkb6PbnkCxHke0j4zsNXKqcSWFA8ovR1gPxWc3WytsM=;
        b=RqkF4sLRY969inkmHuqurd7gdNXetSGv/kolSu9nJy1mJLWzQr4knI1yI3sGMn6Gjw
         HccWPn4/gicvoBQWwBUKozS+tuBJuVvOJaHwALgBg/u4Pv6MrzC37kDpGkdIIAQZ29LF
         r76fRct0ET/i+C+ZQH0xhQYllnqvqvrImIMwOV2sirkz2/RC5JrQdgmQWJlXF3TRETZz
         wL9JLHa7QUrD3SQuBHPl2P58ZLebzHtKai6pW9O93Hzbn+xCz3plxqokNjntLtM29H71
         v2vSe7Pwkn3bywCmI8Tgt9CEcJ8XMpwB66D9OSuqQAXYOK0iaELt0+8Xt/utSsreUT5u
         KOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145248; x=1733750048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkb6PbnkCxHke0j4zsNXKqcSWFA8ovR1gPxWc3WytsM=;
        b=qg9NTQud9qgT8LlYdKbTUpcy39TcROu5mcIPxZ8Eo7X96a5bLphE8YSzLSFAg9VXlg
         F5ydUQWQW7J5L9Oo724aF78JvR7bq5zUqtrPcPfODUB9MI+V7d/OqJG0S3pR0PfmdPbF
         QBUsgh/MRLO1c5K9k15zOTL6YcZBDbEDpepDJw5O8FqgaVFwLFqR5gfhPEhtBp5t/MTL
         WTEHmX05NGPtWDcQ4rZEfwBNDbm2JLG5VJLQd2fJqnUHe41Qw65EaOYfJ+sfQau0Tnbz
         T68IvFw9+dtmC7BllSRs/p7klvlB5dJvBBX/UtkfW3KbKJ44cM9tMyx/uuk8CDZpR24I
         zUlw==
X-Forwarded-Encrypted: i=1; AJvYcCXivhBgLifO/j9dry+G2OY2BJxvIhaNHENEoREAyQs8DM9xhNrHhB3fwdiqW2Vr+Ut0e3CvDF0cj/g2pQ==@linaro.org
X-Gm-Message-State: AOJu0YwJgxIeKGce/O4JREtu9UlpGExJ6q8bA53bTpHn2Hg5ncLSJ1mc
	EmOSSVN//7RA1nxPFnfOWM7AVSFsC1rVKSJx1fm1Kwpix5IwZb28j5/g83gX4T/gTA==
X-Gm-Gg: ASbGnct9onSP9+lhEpxpuwtCZ8MqyG3GPOatuvYyrCDsaGM3S8Wb7ULQmFbpgRjBXz8
	6p8IRSMX66WR2BPe+eN8rR1PynslMn8x+yLsXvX5TGWWtkFBySDEEWApLDQQEanoKnNKONKnfur
	Q5tEzs4R62ve4H/RyMy5FSt9Hk9I9bhjJruXg2oijv2kKcPQF8Zgxe+UgjsMUt8nRrG4NtaE3+l
	cxRvHe12urSLGACQqu6NjjQtUGRXtI+cbnePHLoUTyUnMeHSfGKI/M=
X-Google-Smtp-Source: AGHT+IG6X1oEyIyDyppf7rwXx4M+n6JAUQhRDkZTGhHP6FublpG3tieqd2otQMma5wzvliP0/sGg+Q==
X-Received: by 2002:a05:6000:2a7:b0:385:efc7:9335 with SMTP id ffacd0b85a97d-385efc7985bmr4874353f8f.24.1733145246433;
        Mon, 02 Dec 2024 05:14:06 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:06 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 09/54] target/sparc: Set FloatInfZeroNaNRule explicitly
Date: Mon,  2 Dec 2024 13:13:02 +0000
Message-Id: <20241202131347.498124-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ieWRwdB3GOlp

Set the FloatInfZeroNaNRule explicitly for the SPARC target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.c             | 2 ++
 fpu/softfloat-specialize.c.inc | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index dd7af86de73..61f2d3fbf23 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -814,6 +814,8 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
      * the CPU state struct so it won't get zeroed on reset.
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ba, &env->fp_status);
+    /* For inf * 0 + NaN, return the input NaN */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index db9a466e05b..7e57e85348b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,8 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_SPARC) || \
-    defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
+#if defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
     defined(TARGET_I386) || defined(TARGET_LOONGARCH)
         /*
          * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
-- 
2.34.1
