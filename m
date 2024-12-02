Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802445njk;
        Mon, 2 Dec 2024 05:14:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVv8iXVEq5mvYmF4T3fkx1wgt6EVURHMCtbhJjoV2w9AGOa2WbX42TdfNc3vfuVopXJW3ZEUZhmoEn/kg==@linaro.org
X-Received: by 2002:a05:600c:3590:b0:431:5f8c:ccb9 with SMTP id 5b1f17b1804b1-434a9dcf254mr275356335e9.17.1733145286517;
        Mon, 02 Dec 2024 05:14:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145286; cv=none;
        d=google.com; s=arc-20240605;
        b=e8PThWxtndv1Evl3dvNsVUWXc/iS3LHCL60+k7BOmHD8g5QHn0As1cPPOR8AtE/N/K
         rYFuNWzocX+WMoMAFl404l5EJf/NrXz2FxN+COq1VmJZ2J4iw0a/oR554vxdkJOZnMhY
         b2AkAV+ZFG+vVp9pw6F8/+WtzEqASwHT/RHhq4cG1ToIZOq9JgCK4QusGlkN5KI/AviQ
         zUMTlINeOG11iREN3QgmEA+i3Lxj0PIfJ/Q9FkuXfsRnLF/SQshn1kyVFW6kTNgsQvLF
         3/UdE2W1a2s+/y4XyZcLrAfDJeYQa+n5LN/EGcMLS2z9fpiDhGYr1mZUYItU/F41c3yg
         pnaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=te7O3NG5V4E3qWDfy7w3qXeqH4l7GoDjlHVXASIpOuQ=;
        fh=D3W4WKDbaqq0NWJm0EXeHz6+B+Lz3v51rpPKIiA+Flc=;
        b=TLpdkwqvmtpz5P5Ul6pZJfvJ2z5NHPcZKKpBj6jiBHlne+pQcLGEerPvQR1/pfV+aT
         OpFjxtGNE/0Xk3oDHcKuRPeQukOYao6xx9OpBVg/jlB6GGQTdwbGhSohbtVRra6NDUyC
         tXFoLG7KXdueqsv58xdAkRSBpfi+F+LSIw4d6owhdn3a3hc1pUG6zlhPUW81ypelCodE
         m9xJ/X9eEUo68QHxv8FSLM8uX9Lr13jNJ2BPTbVUEMbqObnn1mrAw6brKa9CR54wGCY8
         lpXVN7F4U1T+mZsleeTzsbri8oRSma3yC3JDS/Wg1gLnLQLm20fU2NEiWNMzsjLeMr95
         rjgg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JuVM7+qA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b1044ee3sor43060535e9.2.2024.12.02.05.14.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:46 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JuVM7+qA;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145286; x=1733750086; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=te7O3NG5V4E3qWDfy7w3qXeqH4l7GoDjlHVXASIpOuQ=;
        b=JuVM7+qA8TghmY3MIOXIrkg5yGoI8bjdcuQvb8wewWRwC/iSIpwxWZqzmOmaFwYP15
         4Hm01DbXFnDdx7WvCnUMA8DyU8gXH7fD9c8sm6q/Zw/DTcN+fr7REiYzJR+KCr682sav
         LTHBi7McWJ7DkF6VKyVMhuYLATXrr/uX2fT3RwGGuGw18KtwqQecZrV932w31+sCQbRV
         dAmu1vBGj8wFTkf4tg5VbmWyW+nMNuMWbZgHm6QcTYwUAOaPrTPBhr858ZpsbJZf1YKS
         mIPbAgQNfhJpZcMWk4x7vl3bGAclows7vWx/waNnbFwTk9B5Uv6mPnhyG8z4gPCa1Q6N
         8ZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145286; x=1733750086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=te7O3NG5V4E3qWDfy7w3qXeqH4l7GoDjlHVXASIpOuQ=;
        b=F68KMjPU4nHuU7McDBQdPpINhk4pGpMldFoV+yWfn5LV0cdP8EHbhqVDtZp5Q1jhO3
         YO8S4xHZ+q0f4IIj1zDfl8fEorcG7yBc1ExsGV8wwftvss8R5JuVDYivAVPm5tOr1jQi
         mpS7+gmzSiX7Lapkdi9qFfzwybarCqUxaxit3ScCN2n0gFKVvBkkBqhcmXjBNnV4dTkD
         tiCGbnfPpkyBWTveRQbY5wl8z6i8/foUW1ZcVLPtMvMTRs06iPvHo9HboqIqm/dgZY2w
         61tost4VyRc1CVDs3lTGC+Og0Xtjh3cBRMG2Bm8P2p6SwFTHk6H+4dnzXHgwHF3SB+/U
         tOPg==
X-Forwarded-Encrypted: i=1; AJvYcCWhVSaA7Rr3JTuZwqzqSM7/tCoK9rlkM80TWaN430mQJL3pzNQke2F+iCq0QAs3gPUzzSWillXSSkAdCQ==@linaro.org
X-Gm-Message-State: AOJu0YxYGEVWYvQ2OX987zG+uuad4ezDdLpHlsCbz5I+pSkDJvF1TmgI
	kOs4NSwS36sq6y5f8+7Z7y6HpiUVfvVevzXVnomwiQuiLrIEGBptOIgVJsA10rQiZBBKumFWOQ4
	gRSk=
X-Gm-Gg: ASbGncv9YnZAKaNcdYPSLqncwrcavx6xwubWRkIwoP6wKGah64F7YXD1EmtkwAingRy
	y3SwRxxw/0F29hIhMRzkK2CknUQdAQ/fhTIZJRjW8CW1NzKm3GRMfmebTEq0N6lLXBs6/U6C+nU
	A9XgazJoPz6QA+OOXt+dZ0cSRBvo4Ad1HMfOzbw6pQz+7XjA/TyquXAF1UKGIfUdGG1zuoyxDMS
	k0ep8041uJC0/TX4P/BYyeGgRWnkJtj+4qA8FWS73I4W01uwUmvvDM=
X-Google-Smtp-Source: AGHT+IEf4KTr6rXhAChzMFWXIj3WaT/CW+XO0OVRZDhylwrcuGoh4UWwf4XfaI2ZSMeNI4wXvw5KjA==
X-Received: by 2002:a05:600c:5021:b0:434:9fac:b157 with SMTP id 5b1f17b1804b1-434a9dc37aamr253794695e9.13.1733145286002;
        Mon, 02 Dec 2024 05:14:46 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:45 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 40/54] target/arm: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:33 +0000
Message-Id: <20241202131347.498124-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fqv73vO8VQDx

Set the default NaN pattern explicitly for the arm target.
This includes setting it for the old linux-user nwfpe emulation.
For nwfpe, our default doesn't match the real kernel, but we
avoid making a behaviour change in this commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/arm/nwfpe/fpa11.c | 5 +++++
 target/arm/cpu.c             | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
index 8356beb52c6..0f1afbd91df 100644
--- a/linux-user/arm/nwfpe/fpa11.c
+++ b/linux-user/arm/nwfpe/fpa11.c
@@ -69,6 +69,11 @@ void resetFPA11(void)
    * this late date.
    */
   set_float_2nan_prop_rule(float_2nan_prop_s_ab, &fpa11->fp_status);
+  /*
+   * Use the same default NaN value as Arm VFP. This doesn't match
+   * the Linux kernel's nwfpe emulation, which uses an all-1s value.
+   */
+  set_float_default_nan_pattern(0b01000000, &fpa11->fp_status);
 }
 
 void SetRoundingMode(const unsigned int opcode)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index c81f6df3fca..4f7e18eb8e6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -179,6 +179,7 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
  *    the pseudocode function the arguments are in the order c, a, b.
  *  * 0 * Inf + NaN returns the default NaN if the input NaN is quiet,
  *    and the input NaN if it is signalling
+ *  * Default NaN has sign bit clear, msb frac bit set
  */
 static void arm_set_default_fp_behaviours(float_status *s)
 {
@@ -186,6 +187,7 @@ static void arm_set_default_fp_behaviours(float_status *s)
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, s);
     set_float_3nan_prop_rule(float_3nan_prop_s_cab, s);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, s);
+    set_float_default_nan_pattern(0b01000000, s);
 }
 
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
-- 
2.34.1
