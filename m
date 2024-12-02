Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802326njk;
        Mon, 2 Dec 2024 05:14:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUeOd5ibJ09PqlBgHp3LApkrKNys0V8sQpyqK/hchbdrbL+HxCKy8AvTNWvC0GArLEx4a3muEjr0A0Q4A==@linaro.org
X-Received: by 2002:a05:6000:178c:b0:385:d7f9:f168 with SMTP id ffacd0b85a97d-385d7f9f2c9mr13682529f8f.17.1733145278038;
        Mon, 02 Dec 2024 05:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145278; cv=none;
        d=google.com; s=arc-20240605;
        b=kGq9fDhQJxZzS4qHUZyNV/DZUHE/69jBYNNyznpoOxqN8KqAwu+PXLojFhTTXdByxC
         VykM0doU7JKvH+QHWxXMohLLBSjLgyfir1xU6G8m22GjiKg5IEf63Km4uct+LANAyNQ2
         o+DAej3SNwSp6RyuPPWFOXZv9GdOAGZe+AZcD+6bn3LelFDghcmR7tIssJds4677omiM
         z3vQTGj3EBgRiglUGUjJ7Sm58Ike28T4QO4KRhhqk2XdJtyBpUnqcreWJMM43kUpy7Om
         SeZwG8R8WX+lzgcWQMrT0jdx2JJ65r37xoAQkVKu7mV07KSXDkOUInSWhzXQtBS4DXpl
         sMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=y0Xx5AyANaS6WVZhR0dQwQ3Dsfoy1K8k2mwf7TXf+0Q=;
        fh=LEag32dvAktKMQxd6L0HL8ChhzNs28vmou0lBD27ci8=;
        b=d9UxJKc2sacu6uwl0DHAjW2BjL9CoruRMUOzewhs6uZpyJBL4QFhuF9MxjUKtOVLst
         75XPlEh7+isr1bpKbLjPz1ubc25XjYoaQdxt2FVrW8de6IW4PfDKdjyRtcFo8GlAXMC9
         Lpcv71jmuxN8gWH3NLguXBNERJBx5kIynkLYlzZLYmKuvKHa21uwSgNXIBZwTjb0Lx0j
         UoESoc1JhMShus33VqayxU0dEaDmrhL49bUMh5SSDAcQqjpDPed9CH2c/QnTsvsPCjrT
         v7s44Tl2+awho0oF91DEhZHfIVBpW+gi7Edi/FgRjZBFRRp2ppoNUR5c/s7+A2OCBQFy
         W5og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HFQOCAo5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385f28cef75sor595463f8f.3.2024.12.02.05.14.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HFQOCAo5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145277; x=1733750077; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0Xx5AyANaS6WVZhR0dQwQ3Dsfoy1K8k2mwf7TXf+0Q=;
        b=HFQOCAo51OhmWdtWFV4a/TVbJQED9FXOdx1dutltFF+11wBOl5BN8Ld5qE/a7H2m3J
         AkCJMtpFjYmKP0M27CzIjn5w/PpgUi8PnEo8GY4lAtKbWVrBU6UAGMzSI57KP7TH+d8b
         vWGhbwccaKYxDoKoNA6NtlfETQDeXFviD8R97sgR6EosKYfsAsVDfajrxI9SpqhgXHEi
         H6VTZCpzSx3PHX3X+cJfPvIKFdtUXisgU3BkkTBjb9au7FJbSGBISwnpCfWQSEX1wKFi
         Vq1HTumq3OUJ+JhGVhM0EgV/TlkVwlH16ukvrxHftI8dvv4GGYAeMciUQ1iAa0fPSFom
         O4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145277; x=1733750077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0Xx5AyANaS6WVZhR0dQwQ3Dsfoy1K8k2mwf7TXf+0Q=;
        b=izGu8/5mxgROyThvaUdpPnxFbFTbWYyO3dM6shHUOVwV96BtmHxqLPKCDqE+8D7cyT
         FxPt2DXTx6PIxDbF4QAcN98NAfmUhfwdr1oGbKgTQ8JE6BnKuiLb/laO1VTNdX7f0aq/
         S1vm7isd0yIbvIIvZvCx7j1kQ36aGyydXVx4CrUiKUs6EaYtqIH0XsfbCmMsozEjKDoT
         hzov3ZHAZuy1ZqC7KrZdJhJaijv+AjGMXv2CfwN50+W9ZKAUg/QR/Rt+IOna8CTxcOw2
         Xb7Z1jPSR96X+mQ2yvYqZmGzrouyIMAQwNyoLNCmvoXawNbj0I0YDKKDlD4BZcZXveF5
         +7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/92MzwoICX3ZjGJuEFBAIMiqE77vGlwf5C3g+MY9JSwQM191j1LthReV2j5hy1kYgVq3v0AKM+TFy8w==@linaro.org
X-Gm-Message-State: AOJu0YzqjT6ZwXISxJDdBq5+e2Lem6iKg/CvUBqbZ15pXoXEyeSrEsyc
	u0L3XPH7al+UGSvdkky+tRfpT6nAG53X57vBTjh/eDHoN+hDpPqDLWNPARJZkmv0YA==
X-Gm-Gg: ASbGnctnbsSCWa7UbeNpHqht9cuxJKd5rPuiWSeXvwpEAVwdfx0s8iYS9riXAwYTbYJ
	jHNj7io/m/9wBUGvaBRxY0PoqLMK9xF0QTblHW4I5LRUZBXBdyucQ/3FvNXnSXVjjWTD0JsJAwo
	NjzRo1AaTOpeqq2KDrtjv7vVXrzoWeHdMihltjIR1CJipgm8JMc7g0kw0UhuWjKPDS72sGwuZ+C
	Cxi8SVv5+ciY3HxszkBXkYBoDEdF+UwRjTD6Qa/PeIZnCcPdn89gJQ=
X-Google-Smtp-Source: AGHT+IF7/dDg8KXtRoJE3fE/ctSGSHBQI+1um0ZFXkjxt7vXDSSfH94Og34g1HVsiH7CtOchKtbbog==
X-Received: by 2002:a5d:5f8d:0:b0:385:f2a2:50df with SMTP id ffacd0b85a97d-385f2a253a2mr3340910f8f.27.1733145275906;
        Mon, 02 Dec 2024 05:14:35 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:35 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 29/54] target/loongarch: Use normal float_status in fclass_s and fclass_d helpers
Date: Mon,  2 Dec 2024 13:13:22 +0000
Message-Id: <20241202131347.498124-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2SFYTib5OV+l

In target/loongarch's helper_fclass_s() and helper_fclass_d() we pass
a zero-initialized float_status struct to float32_is_quiet_nan() and
float64_is_quiet_nan(), with the cryptic comment "for
snan_bit_is_one".

This pattern appears to have been copied from target/riscv, where it
is used because the functions there do not have ready access to the
CPU state struct. The comment presumably refers to the fact that the
main reason the is_quiet_nan() functions want the float_state is
because they want to know about the snan_bit_is_one config.

In the loongarch helpers, though, we have the CPU state struct
to hand. Use the usual env->fp_status here. This avoids our needing
to track that we need to update the initializer of the local
float_status structs when the core softfloat code adds new
options for targets to configure their behaviour.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It would be nice to get the riscv fclass_s etc also not to use a
stunt float_status, but plumbing the env through would require
fiddling with the macro magic, and in practice for the is_quiet_nan
functions it works out OK.
---
 target/loongarch/tcg/fpu_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/tcg/fpu_helper.c b/target/loongarch/tcg/fpu_helper.c
index 37a48599366..aea5e0fe5e6 100644
--- a/target/loongarch/tcg/fpu_helper.c
+++ b/target/loongarch/tcg/fpu_helper.c
@@ -359,8 +359,7 @@ uint64_t helper_fclass_s(CPULoongArchState *env, uint64_t fj)
     } else if (float32_is_zero_or_denormal(f)) {
         return sign ? 1 << 4 : 1 << 8;
     } else if (float32_is_any_nan(f)) {
-        float_status s = { }; /* for snan_bit_is_one */
-        return float32_is_quiet_nan(f, &s) ? 1 << 1 : 1 << 0;
+        return float32_is_quiet_nan(f, &env->fp_status) ? 1 << 1 : 1 << 0;
     } else {
         return sign ? 1 << 3 : 1 << 7;
     }
@@ -378,8 +377,7 @@ uint64_t helper_fclass_d(CPULoongArchState *env, uint64_t fj)
     } else if (float64_is_zero_or_denormal(f)) {
         return sign ? 1 << 4 : 1 << 8;
     } else if (float64_is_any_nan(f)) {
-        float_status s = { }; /* for snan_bit_is_one */
-        return float64_is_quiet_nan(f, &s) ? 1 << 1 : 1 << 0;
+        return float64_is_quiet_nan(f, &env->fp_status) ? 1 << 1 : 1 << 0;
     } else {
         return sign ? 1 << 3 : 1 << 7;
     }
-- 
2.34.1
