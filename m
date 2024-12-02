Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802357njk;
        Mon, 2 Dec 2024 05:14:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSaCS4QOawCDde20LbJ1Q1Z1Pqewybi43plbosHgkkWxW3RLYcRcEjxOXGKQVRHdhLjW+MQQxYiHA0Gw==@linaro.org
X-Received: by 2002:a05:6000:a0a:b0:385:f7d2:7ecc with SMTP id ffacd0b85a97d-385f7d2835bmr1935226f8f.16.1733145280353;
        Mon, 02 Dec 2024 05:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145280; cv=none;
        d=google.com; s=arc-20240605;
        b=DM7IvEA5BnfVOszh4ZZjumu6xOcO/4rx+gOy9KSxtWQD7HPRFpIKZN4mXflPTsvQ8I
         Rqna1i4/5SRNlMwgk/5ikfuDxbmXII3l6HDh2eF4/wplDk7G/jOpLcA9L9Ms+wNRKWoW
         /jPlzwPSx53uDBoym5F1BWbB4/NGAc+9BZUXIdS/4zisJlX8e3N0VK4Vc/c9Q0KfK/0o
         XpovpgTPWNyG6D+FnbMoElPaIuhSuKk9pRvwXchGQ7OeO1EZK/7C0J6nJWGrAx8ZNmoP
         XaGgq8SIrhEikp9C0CDBDtR54fJ5JnLYbTw9/JQunBnXuvcrcQScuo9szKs7FnYFH9SF
         3hcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Yn+C6iEiC0sRjTP+yU6n2XqVtvMbEiwrywPK2VrWnnM=;
        fh=25LDynjQBG2AGfmmMNqh8FJz58mkDGiNSj0yuUIBs6w=;
        b=KNC/n0wmZcz7IVLksS8lT0LD8rm/rl+02mAY+bSBiomLeixRek+TV9LrE+5pBHhNCx
         Vc+e2SZHvrL04PSiLZA8txC7BIeSi0PJAfvsQ1F7Zt7FNRs/yJzm5aOhK6U8AB/SY0hS
         c5uVS/jng2YeEhaDsFqD9ATroCx8Laqb2xDhDOYdoPYcFErDR1WrTC/AVJCAzi+MsXsK
         iQqcVbcTYTzgAoWgt0wOhMPK+yq1dP07aMU4iKKBY6ayTPUbI7FlDo9F5peyHsVd8IVZ
         tI1OXv5ro5zI7G3CNEtcf3fqIAVpokFN3TjHINtylPGKUf3fNKs7d8hgFONEFZr1hZ/u
         41hw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OTPoWxvJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e204d6d4sor1476018f8f.3.2024.12.02.05.14.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OTPoWxvJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145280; x=1733750080; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn+C6iEiC0sRjTP+yU6n2XqVtvMbEiwrywPK2VrWnnM=;
        b=OTPoWxvJgT51n3tp1WDPqFM8bvQnQVwfk+YnCc4730dxcoz+IfF/WvWCym5BnYUbSz
         4qkgD6TKJY2KChWwu7NZZf0r2IwfUmtAaNM0B0GN/tV9Vdw2E2jcFhJ0B9aGzPhrq5d2
         zQm2vwH2YYOiqSC0lnc1AID9H5iC/w4CBAgF8rRTaNBGJTifwVKKAoUy43ndZFoMlXxH
         MqDYXkCdCoDKpT5pcD4asg7yCT59PAoMaeUo1N3YDOlLUBG9fvabvhTV7E9Y/n/uDq0K
         hotHTAikQO48mPTioMWW2DuzRGoIC9EQ4KHNDfNjvtlWSN0f2U1bHLFSYV6cSZbtbWO8
         pj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145280; x=1733750080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yn+C6iEiC0sRjTP+yU6n2XqVtvMbEiwrywPK2VrWnnM=;
        b=C8eeZn9hH1QIrsNSI8yag2BZqOiXjGMdplkaxuoxwGvPRPkkmbtAa8sedxZ1ZHK/Qs
         xyUV0dMTB72W7CG/RMuHK9wdD2tOgXu+UIdezfhAulosnzAtmYF2ruLt+ufkryGY4Uv8
         yHdjVlKhNGtx1Y0XEtF+JPZGeHfcoQiFZnotp9TyWcS534kbd8jKUz5nq7DTxyQq00UH
         gFT3fy6Pr7jt+mji1wCTZyX0xnDpYTR1yVy6clsLMW0gi+r7K71A+zpuOAc2fI3IS2wm
         qo83L73gzbt6q7lfx0lh8BOrQZPQpNyt3prgwX/Q1QCzK3eGBRAmUEUYIK55RiozYGyR
         Fl3A==
X-Forwarded-Encrypted: i=1; AJvYcCWtLxoqM2BOlG2fwWKrtOyCA4vLqxz11lXpAtghoX3yrICAsGc3BZPcZrpqdlMMTd8vmjCQ3zSgG/uGIg==@linaro.org
X-Gm-Message-State: AOJu0YyLxdPHsPnCY/NOP2U5qnOgML86QEJ0A8EvSs3wJ6hfgRhzmAcs
	7iJm+cr1eOVXWaFOsfNz4aKzWIGiwpz72ee3eTIuAbKht2QXY5o3XI/uXykSEyIr5A==
X-Gm-Gg: ASbGncsiimGKgrpo7V62X1otzlIfTWtA/KkE7hlSV/GNbMImI+jWFanulNHLkQA5p5b
	WsSqp9K+oh21co1itz+Vf+fSCFxYTcGd1Q0LM8v1+CbRN5PD8jn/9dGBvK7YNOYw4sshqd768Lb
	MOphG2j84wyScMHDI2KO14Gtdcs0aQ6+Pz+CgYtrpzbawAYYJOWObGGDeh2kX3vNfI1qnjYG6XX
	lfefX3hUk8+ZZAG4bQSRWhyzyFfgMBngxk9T4TjqXoAYuaNQQEUU4U=
X-Google-Smtp-Source: AGHT+IGgrbQVdk/2k8ryRWS9HxyA+sh5LcHmOVIRwbYvPZqSLOeoonYWeClB9HtUkPgQEiQBvTpmKA==
X-Received: by 2002:a5d:47cb:0:b0:382:4f68:1f63 with SMTP id ffacd0b85a97d-385c6eb8478mr20884855f8f.7.1733145279747;
        Mon, 02 Dec 2024 05:14:39 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:39 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 33/54] target/ppc: Use env->fp_status in helper_compute_fprf functions
Date: Mon,  2 Dec 2024 13:13:26 +0000
Message-Id: <20241202131347.498124-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Uqh4tRia3Sn3

In the helper_compute_fprf functions, we pass a dummy float_status
in to the is_signaling_nan() function. This is unnecessary, because
we have convenient access to the CPU env pointer here and that
is already set up with the correct values for the snan_bit_is_one
and no_signaling_nans config settings. is_signaling_nan() doesn't
ever update the fp_status with any exception flags, so there is
no reason not to use env->fp_status here.

Use env->fp_status instead of the dummy fp_status.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/ppc/fpu_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 230466a87f3..d93cfed17b4 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -155,8 +155,7 @@ void helper_compute_fprf_##tp(CPUPPCState *env, tp arg)           \
     } else if (tp##_is_infinity(arg)) {                           \
         fprf = neg ? 0x09 << FPSCR_FPRF : 0x05 << FPSCR_FPRF;     \
     } else {                                                      \
-        float_status dummy = { };  /* snan_bit_is_one = 0 */      \
-        if (tp##_is_signaling_nan(arg, &dummy)) {                 \
+        if (tp##_is_signaling_nan(arg, &env->fp_status)) {        \
             fprf = 0x00 << FPSCR_FPRF;                            \
         } else {                                                  \
             fprf = 0x11 << FPSCR_FPRF;                            \
-- 
2.34.1
