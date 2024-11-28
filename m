Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413182njb;
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYYH+WaF4RAJs16qnQrutZ3tzcezpP8LcRqDc+IonWdB8kdAcmB4BjKwYg9q94ejpucIH8aRZsJUTX/g==@linaro.org
X-Received: by 2002:a05:6000:1fab:b0:381:c935:dec9 with SMTP id ffacd0b85a97d-385c6eb8172mr5458310f8f.12.1732790613147;
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790613; cv=none;
        d=google.com; s=arc-20240605;
        b=aO2HaEK4Ah8doW5LgGaEWYXnUa/pXWPz6tBE2GS4bkvtGbfHht81Hkf0Ue2uRkWFsJ
         2KGU2aHNjKPLe5uNqB6WnwJtIuuIpuNzQ9Igvayi4QtgEW6clUHJXoSIm3TVtMGoH4xL
         L+0Ix79kwb2MKQdmE2wBVC7okpZpiHms3bO6vQTiXig5k+3LXfv9fBKllbl87FfCEEh/
         q6Yg/55a8mWoOgyVA6WScRAneGNcZCDasevJB9HkXRAVBbYNo86nq3T9ja2AVF6kQC0T
         obAi0zTO8FsXKM06yNyM4CytSisFuhCyRTiZyINY6OyqGwsnB68Fa03lwuYuQSP0HIg3
         nSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gk3Ta1kp4SadfMQYiQE9XBmUhbOJYxUOTQDRYm9Ciy8=;
        fh=617oEOpYAtuDqcyJhKz7wZ5JlQ2FKgznP1Mnx9VPzLQ=;
        b=J5Sb6NWURdQhznH7Ar60Wa6MeCSn3AXKO4eLb9RRTnPh4wZC+5cgQWNuKBJBYFrKt6
         GKs83hWOZMawNiU+tJ8y+VhCHNrSuPEM4tPkXbmKo5QFHZlYEiCwhhoYFCcaM0xwitDP
         eIK4cN+78OeUzFmYJMK3lHjnQdSQnb6kVCGPJuTdQnNNowVtiWlaAkC2yl5GZSMv3cVo
         OBMprvfGl5KTIiuAKaanA8w8lnjzby0D67hjB74+v2gGAnUZK0sNa/mho5Xtz/Y3s1CW
         8GeSSPDBIzt8KfWww7Xmn1cjdl93HJP+I+CNdOWKco4kcLWGiWMBPIfb+xtUibpTR1ba
         sfcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ATcNS1h2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd350basor446969f8f.4.2024.11.28.02.43.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ATcNS1h2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790612; x=1733395412; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk3Ta1kp4SadfMQYiQE9XBmUhbOJYxUOTQDRYm9Ciy8=;
        b=ATcNS1h2KfHKxvcLw7GzMLglsq4Jt2fzEY8wCFo7x949p/dDyNDXp5Ka+OGl13/GWF
         no8HRhB6+41rQRBr1b/+sCluKKEbWX42Z75pYc5woLOy6+a/MbMD7LjVZt65Sizab571
         vx2c8MTIWDkI1B7XBymrzgtd/ax4CoHnwnndZ1qwXy9/JgWe32+AmkjYBoiYTGClJzQ8
         8wg3lKIAxxTWZBoXf2LnC69T+s7Q8ECUYUYENFWHYfiORhMIgHciTKfQaaItQvkt4ll0
         92rCqT/Ulo9ePSSW0YKT+WocXq5V+EW8kbVU6QsrloRlAse8HIFEinBetxnw/AXJSS1v
         cUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790612; x=1733395412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gk3Ta1kp4SadfMQYiQE9XBmUhbOJYxUOTQDRYm9Ciy8=;
        b=KAeksg6AW2GzSP50ESer9qy5dfXJ9/DMHoYdyAiNKSNkVGgbB8/lM4gTOf/JrVtyj/
         oCTkWqaFhm7EI8+fxkhIOPZ0RldSKMsG/RS2gL+ld3MVW2/Ofq6Aw5kC8xF+PHTFBS/v
         1qizz9YnLgg8W0Om1q8kbmuQER24QnygaLmLWAf6jgFrXQdKBLu944yWVWa1oTcJunde
         3R6l4nWi2EGtitJlQw7tVZoiksPNF/6zZ00j1nRf1PH5BPLEJ0pk5R+cyapM+c4z/Z+U
         AmFRT7/hmzeXpmr9OnjWsLy6E2WHoWJ5QyyUNv7Kij0Z28A18Ff8wKep9MVRMoTRAm7z
         qajw==
X-Forwarded-Encrypted: i=1; AJvYcCVdiV33eFYpSBSZxd5Ne0l9OwPeio1X6z2pa/SYKnjohbE+QMbaG3RqYDLcwoU7mdkCB/v7Fzid9wNyxg==@linaro.org
X-Gm-Message-State: AOJu0YxoYK8OUlV49qKX0jMvy0s8Rm1npVak+Knqc+C0b4XOQpUoD44w
	xEx56oicYj54TuOJvdb1X/9ucKZmFU+fCSP6QAPOlrKofymJUt/wIb8pNepPWcsT2g==
X-Gm-Gg: ASbGnctmh6UWlgKvmuhiTHN0dB8ONDzhll+O0ZPMTAQU+9fa1kAWvsjIm3uC6/oaSh3
	/pRjx4HfKVb7wqJpnBs6ojb0o5iNRCvvCufyylX1r5xgUFxRhOae7xtsq0/uts04+ezDI9UR5UJ
	p4xJ+KTN95hy0YfoZi3uCuqE0rsvuFpAR7jJ2Ezo7uY4ifmhZTNzv8fqVKpfrvOVkks7urCYlcv
	F87aF/EoScXD+627wisGcCkckgAVzWGfeBPLsMNShr+MMZLMGKTTaU=
X-Google-Smtp-Source: AGHT+IHf21opook/IKPYpyUU/oWLnaC969kFG9ZVqJdEGuQQfFX8DSROTP8X+3Z/bd3pBl5u/uc4aw==
X-Received: by 2002:a05:6000:2cc:b0:382:498a:9cec with SMTP id ffacd0b85a97d-385c6ebb90cmr5852564f8f.13.1732790612660;
        Thu, 28 Nov 2024 02:43:32 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:32 -0800 (PST)
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
Subject: [PATCH for-10.0 19/25] target/s390x: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:04 +0000
Message-Id: <20241128104310.3452934-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: EtyDguSL+EXE

Set the Float3NaNPropRule explicitly for s390x, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index d89ef62b38a..31b23ddb9bb 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -508,8 +508,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
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
