Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413223njb;
        Thu, 28 Nov 2024 02:43:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXc0tQJCHrH/vgwRpIPFR+V6I5YZj6viHF2GygsXaV79VpM/BcDSsyRuh5EG/XI/5lEdLzCUj3YHBOYUw==@linaro.org
X-Received: by 2002:a05:6000:4009:b0:382:4f53:82b6 with SMTP id ffacd0b85a97d-385c6eb72afmr4987679f8f.15.1732790616519;
        Thu, 28 Nov 2024 02:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790616; cv=none;
        d=google.com; s=arc-20240605;
        b=CPqmdvwZXenKExaSQKmchVyKHlS0I+TzgetXakg+57ng86nZIuwHigEq+noqRzmR1D
         pY+J7PtEKaTY9NYY6Hz0BFEzziZIX7hKvEgFxMjFAgntWDSlFbpUKd8aDVBbZ4fDJgJF
         2ZzOJ/q7QMJA7yL0hf1nQHjYu8K535w73RLhUoWy5A1BiQmyEQCtozBoquX8jNzo/1RA
         2Ae+vSz2fSrI3t7y3XiqLJhfU5Mpf/2JExiM+ATdYggwJLRCskAIJAc+hhyKf7U7RR2J
         Z2qvluoffl2Jda4eL5EFsw9/oSSnJ2Z2J6EXjOqNr7DYlLJw7npqQp3zu0rzD2bz7oFJ
         Nw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eT1LXyat6VBXQfbf2ZEeygMBWdK2hSiibfIDvIYaJow=;
        fh=nANCXYyFoxPw25bnspg2gLXX5prGjTBYguNlXzPWGhE=;
        b=Sgno4BbCFd3sxVTGIwo+6pe6owDuxKhcMj51AgcFOzC9rWjatSNvrUnIqP6EyJ8em1
         IJKyUtjrRPYtODRPClREjiHP3VACWFRJZN5M9xNAYIGAAfLLOVuHkjlBK88cNRxORtWg
         8cfPVGPzZHtkbHHjWy60Ae47JpfiG2doL5ufvQjPb6Gp+3OqsDzBX29+ocFPvn0VRtIT
         ZNmFXoA+I5YH/eeBF+aWTpWVJzB3hyObs+3PuXTXY4xAo1bXApL35jQVtHpvnAqIsFDc
         XR2emEVUAFTegs0wm2tgZgG1jFcriKz6WH70Vdo7f06RkzHOGEduDqL86u2TuHT4g6jW
         gvRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jfbhg8I7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd5a8cfsor314726f8f.5.2024.11.28.02.43.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jfbhg8I7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790616; x=1733395416; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT1LXyat6VBXQfbf2ZEeygMBWdK2hSiibfIDvIYaJow=;
        b=Jfbhg8I7cFDkVmdWavSyTUGIvayG/D8HYOx0QV/L8j5LuOjZ9bmpKAFNtixUhWyDC+
         ekndiNuVEgtS15qFeRSbcyzg4kJyg0hmwqU7i/5Cnpjnfd98r5YM6VBtq7d94JALcTFg
         XfqueJEzD4FCrPX9rJetRIib1SE/PDK4eRBeXEE0TLAEc2H3dCCvNusZVc0uyKgOglVr
         zMepC19weUQ8yDfTjzmaKyQbVJCq1JzZcy8VPg+QS3+44rUpMifesSYxZwSGojQbFwlQ
         cIpWJA84TzeQ6IKErN8vQHG8U+15MM5gKDGTEIB/kla6FInd6Jlqbi10FfKvbc/jrNYX
         Rgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790616; x=1733395416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT1LXyat6VBXQfbf2ZEeygMBWdK2hSiibfIDvIYaJow=;
        b=peilgX7IbeuRzuob4VFMHHTP7ll0+9iJD1gec4PHJcOL/IyUUYSiBOlPVKY+RQn9Yi
         57z+11+tYdP7SBYiV5vhZc6kaHF/01DPt5aSwFpNyl4yZ5mp2xB15CsN4EG+e8ztxNzy
         WSDTOiYzjyDc2F0pVCVVW9zcUb8r1xPY3i6KRlnrDAd8O2Ygnh4eU5oiV3Pj/8e9h4nd
         uG9sxSsDSs68Mp70NbupDuuddfX6bC9RehaCVdaT3/mAZurCrNJly94zp6tCYzUnk9e/
         C8Elm0qCxMOrSWKnrF8M39f6chdBGhb1jph4wJuDnhsbIxk2Niu+SrkxUqz09jl09b93
         RlVA==
X-Forwarded-Encrypted: i=1; AJvYcCV0hKtnJ2wkO/Bb068eHMABBq2TOXg2Wi7yR4hBMw1t1Wp43BJm5aKpdGTOQADDfllmphZjiqvCP5VOig==@linaro.org
X-Gm-Message-State: AOJu0YxalpS6hczqe1ugpj6T8Eavu13T6Aj+ITuE/xdKGmjGqnBEuqTc
	Lw4Xm93nD+BfvKWsYzWY6NCdlA0QrwnxoeHHbv8tbatGJVnjRLYsOmZOXJ5f/owz4A==
X-Gm-Gg: ASbGncu+x5e8fWmkn1GbZioPk+BcdM+ZG60jxf1ur2puK+QuEC5B8mQNbGm9gvVZR4R
	eV2hoqF/CIOubeM5CfbghZDxkPqtuMjWe9L9RBuAMs8Y0leux1Vl6hkElJ9bRJKXnwNcuRmE5gg
	IH85h9BZtKwBFSdKx4x1084crsncoxQdJKIiAaAALrgtmftENybSzPeGmAsMknfPCXt8exwuimD
	Tq1erFFjMRn9tZHNJh1rtl79LCUAwu0OxZmfbX5OS5EzlSqcRFA+7g=
X-Google-Smtp-Source: AGHT+IFoK756JycdHDegIr7eJmXs59U3bbQb3x/KF12D+QOk4s7BgtVPWqKjS3obexchOJx8/9gF/A==
X-Received: by 2002:a05:6000:18a7:b0:382:4dad:3887 with SMTP id ffacd0b85a97d-385c6cca8eamr6108106f8f.3.1732790616027;
        Thu, 28 Nov 2024 02:43:36 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:35 -0800 (PST)
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
Subject: [PATCH for-10.0 23/25] target/i386: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:08 +0000
Message-Id: <20241128104310.3452934-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KMZSaiq+boIp

Set the Float3NaNPropRule explicitly for i386.  We had no
i386-specific behaviour in the old ifdef ladder, so we were using the
default "prefer a then b then c" fallback.  This is very likely wrong
for i386, but in this refactoring we don't want to make a behaviour
change, so we leave a TODO note.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index e9de084a96d..b62719dead1 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -180,6 +180,8 @@ void cpu_init_fp_statuses(CPUX86State *env)
      * against the manual.
      */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->sse_status);
+    /* Similarly the NaN propagation rule is likely wrong. */
+    set_float_3nan_prop_rule(float_3nan_prop_abc, &env->sse_status);
 }
 
 static inline uint8_t save_exception_flags(CPUX86State *env)
-- 
2.34.1
