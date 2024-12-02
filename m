Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802318njk;
        Mon, 2 Dec 2024 05:14:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU6BjpkE4+r725JmVlq+tUXv4CGloF9MrxU5Wi5S2ovlWEc4VVuEn0DYAiFGO41k85D6ps1NmfVC6G1pw==@linaro.org
X-Received: by 2002:a05:6000:787:b0:385:f64e:f177 with SMTP id ffacd0b85a97d-385f64ef2b9mr2126825f8f.11.1733145277423;
        Mon, 02 Dec 2024 05:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145277; cv=none;
        d=google.com; s=arc-20240605;
        b=T12F6mn+O+horzpUH0kezUTHXGaw0iVJVi+FPCnQiOHocKK71Gl5VezKkoLL1RFtj0
         6042Lj0VFwe3En1be+/MGLLtNe5ZYJlowmVAeRk2NTeK6NdMZOpeHHv2FGgXKj+NGKOz
         QH9Z99ffSTEmTzxk8K17UoiG0gCGLckE0xaayhGgDySOsPuWs8K1FAUDOt8T7ypqAuze
         DPYtKmrhK2pJKx9A4/3Tvu8p9oAVsaFnVXE3zoybAUM9vQc0xKpkZWZ2ILZDpZIZKrmy
         70nYX9nBKi8cSAdllZGLoCl1JutemfHnp7zHeMpsVnBlgCBRdDCosHlVkKbwtlbYTGbG
         Mlaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qFtiFfBBznBZexAeUlFNfBbsHlolyVwbUxMya82sU1M=;
        fh=M9hh42wLM0mxzEGti7c7j204xjKN+RK4vXTQWVb4ByQ=;
        b=SWuBesQwVKBWYDtbmTouVD+SuuC6gJcyo+6PS+xjoqOYcJ4+Z4UqnOhff/wjBVSsJN
         bpytAkFF9DVr2ALZZfJB8D6FGnbUDXTCo5SEr64/kMc0bKzmJl6Y/KJWL3YSmCVUGlA4
         uMHpgDOOB87uFHKe5OmmatQ0RD4yWg+3RTbxEkwBRfs6/J3JcM1Pjch8k6hob0Xql3m/
         hVyiBedLCRcZtIwOdH0705Wj/URadLG5OJJp5umN7B/JiA5MPv2u3KSNzhFZuv3G+O69
         56m47BvyQCs6s/v4cb9PnsthJqCqkFmDkm1V6WihTdjD3jI87jE7iw94kEUkaxPO7Gxb
         s3ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c62N0jqP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385f020e70csor614854f8f.0.2024.12.02.05.14.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c62N0jqP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145277; x=1733750077; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFtiFfBBznBZexAeUlFNfBbsHlolyVwbUxMya82sU1M=;
        b=c62N0jqPVNEWUWaek3iYdsgi25KBaLVPCcLB5TE7MD8ZmH4ccsFmBWsoUP4oncBZGl
         XHV+aWqPAS/8QHXEfooyv+sfXNuJpRejGz7PljvKMeckvgNQ2VUbCoPdH08Qz6kF3ZHH
         zqUnJi5YM90I2vAE5rOF1S8aeoQTG0i3g5DUiVuQgFZD56+phVQhwyXQTUV+GOUN0srs
         qktSehCfj03B7T0Wtc+v54oQZhyE58Wfl7hsOJ34wvolVKFa/VX2T9D3jd5I5xKc0ALR
         fycwoBGvgbgXgd2/LZlEhN8DE2lWgrAGwYzGGtBGWHbjZTfbKJgPPoXzDS1dSd9vL0Gu
         9zCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145277; x=1733750077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFtiFfBBznBZexAeUlFNfBbsHlolyVwbUxMya82sU1M=;
        b=jB8atWP8V/w89cYaI0P0mnM3O5xczmnH/bY76FEWJpogBSBJLLKY5UqYHqDPJCBVb5
         SY9iWb1gJNjQ3bEPfUHHVmM9hwDb/KhwcFUxtpn+Hr+FFhfFY0nbipjvn6I0XWpjYP6l
         Xi3SqIeEXmCMgNgDj8k7Jjcw85DnTf7pEmEq74tCm81KX0himo5aY8cP8fBO4x46VOaT
         /VsPUxkmqmhgXRgMjsdkBlklS9cDRqwv+4qIJC6n8r693F8SSg6txq90Y4RoG0VFHE3j
         RU8Ht98I7f7yLhACOcMIYIRr1CRIH+EPef3jjOEl1DzH89M/yBiS0qWNpi3OQEnKQ/cX
         je/g==
X-Forwarded-Encrypted: i=1; AJvYcCULC+1gC+OP+TRo/w3D/16cdS7UToL27hLyEVyC9Dbn7S0xYk/B1YcQHMELZUA2bULiFyzRxUro0fmx4w==@linaro.org
X-Gm-Message-State: AOJu0Yw2+WB+eobTONsnObbN/Nhu8eruEkrch1IwBG6+VEy3x5T4Nm7X
	w1Gf/XigYcoiwJbzjAwDScZ2uVHO5tnoMOyXVjb5oCU4ItHJ8L8OfNXD9B78jMlV9Q==
X-Gm-Gg: ASbGncsiMfbRYw3i4L/LUnwf7eaG2Po9mj/pYtJqOn1XgyM4F3sbE3Z6ItbrHE23Hv2
	egqNpUqUox1F3H3ehijTvtErd2C6zD+ig9RyDZcf4+yS3qgAwEgQLuIZktcU1JbohH6FIo/2TwG
	KECZHrkc62M51BLuL/PiGX+mCvlrsLonCFSXm+dRBGDdQzwTcMMeYZQbqINBoKNPVN/OhyvBkMa
	MXy36dosgo6QOCUbZeJeqTs52yTAvxZ/Vh+JC96HBpoeO50qE45vU8=
X-Google-Smtp-Source: AGHT+IGjX11e3JO3ZTyjG7BP/tYm806Bq6OhPURR2FI+K91cwS7FWrHu5iiVUqs5CI0AS29PsM5q0A==
X-Received: by 2002:a5d:64ed:0:b0:382:444f:4eb0 with SMTP id ffacd0b85a97d-385cbd7c36fmr16352829f8f.13.1733145276812;
        Mon, 02 Dec 2024 05:14:36 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:36 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 30/54] target/m68k: In frem helper, initialize local float_status from env->fp_status
Date: Mon,  2 Dec 2024 13:13:23 +0000
Message-Id: <20241202131347.498124-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vonYGBbU9xlj

In the frem helper, we have a local float_status because we want to
execute the floatx80_div() with a custom rounding mode.  Instead of
zero-initializing the local float_status and then having to set it up
with the m68k standard behaviour (including the NaN propagation rule
and copying the rounding precision from env->fp_status), initialize
it as a complete copy of env->fp_status. This will avoid our having
to add new code in this function for every new config knob we add
to fp_status.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/fpu_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index a605162b71f..e3f4a188501 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -615,15 +615,13 @@ void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 
     fp_rem = floatx80_rem(val1->d, val0->d, &env->fp_status);
     if (!floatx80_is_any_nan(fp_rem)) {
-        float_status fp_status = { };
+        /* Use local temporary fp_status to set different rounding mode */
+        float_status fp_status = env->fp_status;
         uint32_t quotient;
         int sign;
 
         /* Calculate quotient directly using round to nearest mode */
-        set_float_2nan_prop_rule(float_2nan_prop_ab, &fp_status);
         set_float_rounding_mode(float_round_nearest_even, &fp_status);
-        set_floatx80_rounding_precision(
-            get_floatx80_rounding_precision(&env->fp_status), &fp_status);
         fp_quot.d = floatx80_div(val1->d, val0->d, &fp_status);
 
         sign = extractFloatx80Sign(fp_quot.d);
-- 
2.34.1
