Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp252940njc;
        Thu, 19 Jun 2025 06:14:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7Xu3wUzu/r9HaeaELDbY0VF/h8mpJlHRdDJKz6pt282YE2jZu1nG2SvjYAFVRI2u9J/3966AtmnuKjw==@linaro.org
X-Received: by 2002:a05:6000:250c:b0:3a5:2cca:6054 with SMTP id ffacd0b85a97d-3a572367c51mr18007258f8f.4.1750338856830;
        Thu, 19 Jun 2025 06:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750338856; cv=none;
        d=google.com; s=arc-20240605;
        b=c42f/kYL35dDBlVCUto6QDcq/GnthD6vQDBRbADNHgquCn/CTKFgo4AOpWjQiGkmtH
         bm372Ewj8czkbf7I0PDyGlHlJboIiUejD0E7lcj5RdCe0niaWJbEHRhf0mBNsBFuTumG
         JN6caCx82Sefi4XwufGqZOhLq09poWsLt4RNwaNA+6YXIEKPw3t8m0TqjwBMHld3WhcA
         FeX+JDsqZSL6dy20voZW8ELGW7MugQQWnj676LNUhY6P34Z5ScbiXNEYC9yt1/VokE9+
         +R2TqKuObLgPFfs36fHS++I7zTe9KidW6dNgwXaiuYuisf2oAQTRQHlz2ReMWmM8icCk
         LBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=t+CQZzgXVaIFNKsZoeAwh6dF99jW8fzr897tIFidOds=;
        fh=4Fw2E7eNxTAshikM/JIi8Q1oDrwShH6ZOejZnBGTWKs=;
        b=ODieB5RZgU0tqWGVTQ2Wf7w6ew8HJALxFUMxy6aGf5kcPZZedjWV1k74S4gNfM01D5
         EawOVyZMunDSE0hAj7upzPmB6ukQbRvDTOoXDH4Onqz1qzTQAVp8fcmhPRnI+kdcGjiR
         fRnGOhAPT4hF3oHIRl/0A+myklWb6nEs4BPEgM3UXBGpddNwgCf0WbcO/7eCpcR8aMfL
         8QJkGLiGEjBNu82IolSBBZ9HuaIIfuu7tn8zyb2SwJQJ8IzePLyndLa56v6ZiZHV8Lk3
         eiwYkET+lXfT2MMcjM8/DaT3Qoi5+R7KZxCa8QsrxToiKwJ84ATsk4DKjo6tocoaTrGY
         fY9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dBtcaU8t;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-45338132f46sor53743025e9.5.2025.06.19.06.14.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jun 2025 06:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dBtcaU8t;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750338856; x=1750943656; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+CQZzgXVaIFNKsZoeAwh6dF99jW8fzr897tIFidOds=;
        b=dBtcaU8t4jS1hFV9ngwxqPTFzwDka9dw/3HruhixAVfCOAKKB/9kpknIGghI+8GtDH
         oh8LR4qH86v5KulkkFgYWCcPrNttpA4BsedBPTt3EL1YYUqMihGNoAVtfaDjC+lPF2N2
         B/IVDAuVlh7QovZyF6G13HtEzm7PqTUaoCgnQ6oSdo0PtwMSIhNA4vqzXdn2RDqeBig4
         wJZFje/bPaLHf7aJ/oO/VwyzSK1S9Gpepi6KiBPVIdlYDaIB2nTnN4q3ivnqtDQSHoMH
         MO9o3v8GNxkG+7a/5S+3HqC8bE9KkNcxCcFFktwqgS0ngFhy0GnE1Q5M6pDgVjn6bDfI
         dT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338856; x=1750943656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+CQZzgXVaIFNKsZoeAwh6dF99jW8fzr897tIFidOds=;
        b=CBfiSeDacUuOuaO+gHixtx/u8CkGwyhS48FtcHLLOrplaG6jWKNOBy2vQqVv+efzNv
         F9xdib+mm4bUb45ypwFMp8E2hhw5URHDOlqI5uCJ4X7RJTQncSgb/tV9eCqpsfcrvFVs
         CRqgCVhwkWAOyxvEzh+XQ18LLAfheZRQ2Jz1dJD3KTU13djAvckJmmVqa6fPK1J5oxwx
         PLENWH35+RzXohV/MZftK3kJ/B3+d23ErHYrkkWAIyOibi5HiG3i7NrEVHNv92P5XVSU
         7NJNpW8KYmvClhtgM5yBNeQuf7o1yWg+oT5Ou5U/7FX78jbyiSuqSr0rfdRdOUX+L+PF
         cvRA==
X-Forwarded-Encrypted: i=1; AJvYcCUxQeY9D6EeXv1CIMvaLFsA3fPHXGpr32dnPQ6+jvDBmnFbZGswkGfKUdbwatB+cPt6ttOjeDXCyGaB5g==@linaro.org
X-Gm-Message-State: AOJu0YzuE5g98AUjoG1o1kxDuNPNCYb3L9Vha3FKNkTdgKQJHy5tCPgV
	F5AF4osjcCfHGoNSJt4pDJ4x+HcJV68vYGvI1f66bDvXDObLes7dR/Ez8mQZfAZ58c1Vhw==
X-Gm-Gg: ASbGncs0FI3a5N1GXoqqNvJTCbLpsE2aEB0qqwIkf405qMwmYf73CwJ7Nk1WdOnHkTI
	5fPftIrjPlFWrx9deRfYUdH2FB9cKf7VcUxa8XZ4g/fyFymIdsSvfnn/uCbS7+mo00yBnKmhtcb
	3Z6UWnBpNYUBz7lqwkHmvwZwh21h0Cto6rtGygdoz89kRm0cP5YbrLAkMGOM6a1QZnXrMZCDG0Q
	nioOMEpWp5NSg0aoLGsyxHNO+sYqaxXmd8K05UcQueMmkHXyELSWWoi8Hidcu+jxBd/e9VL8okj
	dEzNg/zlMTCvvLdaQmjuGJFgYmDy3Cs4htiGxW6WS36L1BdYBhc044Op5Hze2AsjGnUOqL0Hwsn
	KNr/BxoFLqFY3BCK39aSYC0p9fKDkYQlxbXqR7LAbFWsGNA4=
X-Google-Smtp-Source: AGHT+IHxWwthlICtEPbyo/liZr0Yr5cAjas25sh5+S0g5y1XPaawtH+KxbOYIqw/ohgJip5mJzHstg==
X-Received: by 2002:a05:600c:1e09:b0:43d:fa58:81d3 with SMTP id 5b1f17b1804b1-4533cac558emr191965565e9.32.1750338856135;
        Thu, 19 Jun 2025 06:14:16 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97ac0fsm29779685e9.3.2025.06.19.06.14.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 06:14:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 10/20] target/arm: Restrict system register properties to system binary
Date: Thu, 19 Jun 2025 15:13:09 +0200
Message-ID: <20250619131319.47301-11-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619131319.47301-1-philmd@linaro.org>
References: <20250619131319.47301-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oG0tY++B0fHS

Do not expose system-specific properties on user-mode binaries.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index eb0639de719..c99981d88f8 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1500,6 +1500,7 @@ static void arm_cpu_initfn(Object *obj)
  * 0 means "unset, use the default value". That default might vary depending
  * on the CPU type, and is set in the realize fn.
  */
+#ifndef CONFIG_USER_ONLY
 static const Property arm_cpu_gt_cntfrq_property =
             DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz, 0);
 
@@ -1509,7 +1510,6 @@ static const Property arm_cpu_reset_cbar_property =
 static const Property arm_cpu_reset_hivecs_property =
             DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
 
-#ifndef CONFIG_USER_ONLY
 static const Property arm_cpu_has_el2_property =
             DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
 
@@ -1532,6 +1532,7 @@ static const Property arm_cpu_has_neon_property =
 static const Property arm_cpu_has_dsp_property =
             DEFINE_PROP_BOOL("dsp", ARMCPU, has_dsp, true);
 
+#ifndef CONFIG_USER_ONLY
 static const Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
@@ -1544,6 +1545,7 @@ static const Property arm_cpu_pmsav7_dregion_property =
             DEFINE_PROP_UNSIGNED_NODEFAULT("pmsav7-dregion", ARMCPU,
                                            pmsav7_dregion,
                                            qdev_prop_uint32, uint32_t);
+#endif
 
 static bool arm_get_pmu(Object *obj, Error **errp)
 {
-- 
2.49.0
