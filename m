Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413211njb;
        Thu, 28 Nov 2024 02:43:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVrdOxKqfMwW85RfoiM3Rc00+ygWZJJlr3x5BF/R7JH9TQip2FNca9+8DD4oW2Cyfg+XPZykHeOK9r1fg==@linaro.org
X-Received: by 2002:a05:600c:1d8d:b0:426:6edf:6597 with SMTP id 5b1f17b1804b1-434a9dd02a5mr53138445e9.19.1732790615712;
        Thu, 28 Nov 2024 02:43:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790615; cv=none;
        d=google.com; s=arc-20240605;
        b=AoN7lK8ZUmOyn2zSpuxU3h3hVFaqLR8PNK1feYBdLIUsDzfvS+TUMNg9PbAFtAhi1U
         bsJBovuSb6r3BiwwSGPCH08zk/Ev2iT6LUbwEMFm6UNag3e5SRI5rRjyw2icxP/isM3t
         NwQbfXArZ0JVofamRdsFwJrhiGYaF5On+HvC6qXBqTvGGb5V4cSVUPd2wY+24CRl1uJI
         EBf3XTC6Cl769uOj2e/YuxPgU4Hxfi2G4dXdglwL75QJZAM2wVzGGvT0BcvP2fB6PSNc
         IyCaBYo3ZVFVKQg0YFQacJuxmqbi6gdqkDr2aRdw4AlYVrt0Z38tO2gAcJAKgkAGtHbP
         VcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F2oqqTya9ndnAhX2EgcTjocy//tVGNyIvLMPGaZkvBQ=;
        fh=8OnDNdd8YqM/PaqsNbKof1k4TgDaYUvyOx1P7b5LAk8=;
        b=VBkRBDNOxlsgejythCKsSG6VyltozqmWMMky1L4PfOf+8ilJm8PhSfwinuoV9iaJiE
         WDMlBQ6d7DDWzOelss3uAbFybipnlSyxIhYvttPRrUJArjnxL96QVloSmNS1dWjyHkcT
         HGBQkbMDZWPvdPiBJ+ZSOig3KI7W0cKZhXhNviOXgT/DN3jKcBCB/ODU4cPbKQW59fr+
         7WmZFHGC2A9pMK62g670JepURR+VT2r1Q+iM0BfZRuu+wodAHTrD+Dio49dpkPagb/Lq
         6PGjircKB4Cnl8g0kyAwCxPZan374BgwgAxlJgmz6WglR3Ndaew943nzHZD7NSsKtuzC
         /kOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eluXzAaU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b103fc2esor4875505e9.3.2024.11.28.02.43.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eluXzAaU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790615; x=1733395415; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2oqqTya9ndnAhX2EgcTjocy//tVGNyIvLMPGaZkvBQ=;
        b=eluXzAaUx68qBlsb6klcOX50KSTKJY8LAaCFiH7o+Vw+9wQC59gZoEzzekGVfZCOQ4
         QUf2G0M7DKLNDYPulloiEPqCSZLVcCMzURPtmNs3Wm5zLB2tRdqCRcs2Eub1JVlsIpIQ
         MfecPsX/ZN8OY1AUd0kzuZFoBe8qtWO4T8sp4tEQFrI/WRURQehly/zkw09iSCsTEHCc
         cWw+gFHowPAD50Q4JNp/LBN5Cr/7k6pMTHGuHT0zvSEEr0jrOllYXiX0tO5m+lFNFGKY
         wTku/499t63j66TyViChzhA/0fkVlefSpftYB2TjNXH4dnoY+e6kyHYYN1kesGOqV/t5
         Fvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790615; x=1733395415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2oqqTya9ndnAhX2EgcTjocy//tVGNyIvLMPGaZkvBQ=;
        b=Vxi9XnpJ4HbhoJ0VcQ1ZCOVzLVT5PU3805cIEd31duFkOhpiTpVi6kHGXZg5cKxjvr
         JmUn7gZ9MYpPDIxrDK2hgSYkA8ssfikl23ZB4cpa73Six+OzwbEgqFKlAVtRrhU48yJx
         LBAilIKjOWBik6ouNkDgzZMx/SRDqMK3R0vERBhbLe3HoDUadUfcN+t0/ccoa5QPn5+1
         +LLajSn4y7jGDskJSJM1O/QB6G05WJezWtwjh8nKQO9HiJTvyBKo5Lx6WsYp0uvMWpCj
         ROkjr5AzriIxo1zzSGN6s7T309JojsE6xWzyYo23BYrhMAIxd4xOUuWxkDh4jTGNLqDV
         lWOA==
X-Forwarded-Encrypted: i=1; AJvYcCXE2lqnCC0em6bJltqKM02Js7Ju7uhp9L6XaL2ZG1/oA38GX2g1ZdifDSP8xEVtvJumc5msD0jgs9MTYQ==@linaro.org
X-Gm-Message-State: AOJu0YznKzY+RRdqRyBe5Ln1QrRM9fDxaYdTbxmzmxwTZlAoru/1nKGJ
	+honVdcTPaXC7Yr5IdNXcI5HnDbhQxnvGPAVy0iGZTYTGecZM7FU0pDgG5o7jJje8A==
X-Gm-Gg: ASbGnctP4rPRzcZGcpiDegujHnkgxbjCDqxpAQk1l6GFF/fqzWxzN0vRvzlUj6o4ALv
	K+7E+Rcnx8itEXOjxCEdfXG460zsxStlD3uv8h6APDL1bgir2Mx3YjY3QJz4ESfahc8Ch3qC+p9
	W5uXnLQVgyPdwbbSIH9gkDV1Es9uMr0D/0wDnIqiE3GzROJ3WtuAXyWCmMXoql26v/RtAOsQm04
	JXMsU7s//bRoJWIiBYfllOUs4zRfQwhlWwVCW4uhvZ8JqcpEYZXHTM=
X-Google-Smtp-Source: AGHT+IEo+dfcu/Vo4YpEDMGS2gBKZqqG6BX3v7Ouawokf1TkgNmuIfcGW6fjcLGWf4H3GpgGyJk+WQ==
X-Received: by 2002:a05:6000:4708:b0:37d:4fe9:b6a4 with SMTP id ffacd0b85a97d-385c6edc3f2mr5257871f8f.50.1732790615204;
        Thu, 28 Nov 2024 02:43:35 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:34 -0800 (PST)
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
Subject: [PATCH for-10.0 22/25] target/xtensa: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:07 +0000
Message-Id: <20241128104310.3452934-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5I9kYdCnqwtG

Set the Float3NaNPropRule explicitly for xtensa, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/fpu_helper.c     | 2 ++
 fpu/softfloat-specialize.c.inc | 8 --------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index f2d212d05df..4b1b021d824 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -62,6 +62,8 @@ void xtensa_use_first_nan(CPUXtensaState *env, bool use_first)
     set_use_first_nan(use_first, &env->fp_status);
     set_float_2nan_prop_rule(use_first ? float_2nan_prop_ab : float_2nan_prop_ba,
                              &env->fp_status);
+    set_float_3nan_prop_rule(use_first ? float_3nan_prop_abc : float_3nan_prop_cba,
+                             &env->fp_status);
 }
 
 void HELPER(wur_fpu2k_fcr)(CPUXtensaState *env, uint32_t v)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 2d029de7baa..60de68012e1 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -502,15 +502,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     }
 
     if (rule == float_3nan_prop_none) {
-#if defined(TARGET_XTENSA)
-        if (status->use_first_nan) {
-            rule = float_3nan_prop_abc;
-        } else {
-            rule = float_3nan_prop_cba;
-        }
-#else
         rule = float_3nan_prop_abc;
-#endif
     }
 
     switch (rule) {
-- 
2.34.1
