Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413143njb;
        Thu, 28 Nov 2024 02:43:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUfdlVomb9xFba8/+MsVlyEE4sMih9Z4d0ABx0tEmMZCvYa7PovmNRWDaIoJ5NDPQJQkkmeRmRLDfWkOQ==@linaro.org
X-Received: by 2002:a05:6000:4020:b0:382:6f3:a20f with SMTP id ffacd0b85a97d-385c6eb7c84mr4831303f8f.11.1732790607804;
        Thu, 28 Nov 2024 02:43:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790607; cv=none;
        d=google.com; s=arc-20240605;
        b=dQs6TElSGkw5ELsbK8qb6qnwy7UKri7Mx8Gi8Du6GkgjwgwpqXzg7oVzTpZiSQjZoX
         GlKD/jyfAHeqbCC215Gymv8gIChcmDZD772o/w+zzlJFgSb2nyKQr0hRDl0EPV7QmHHy
         fsQM5t+cWBwiKqV1ViGeIvwiHq3neUEYpY10TmhkJQUaLb6+KCTsY4aYRm2dIIUIvQuA
         g3UILewKaBrs/QNYL0RezHAiyDNAIt5RBgRwwc9JxJfLzUuvjMiyp6Ki8PnO/fS4ai0l
         IqsxX/n7Cetfm1WrwdnUm29Y+dACFXuxNg+p8OuXrugqY0hz938vwd052FpzGbGwHYB2
         2OKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bWS/GNsFs6Pu4pBOarLJaqHWrc7CmHsdY5ILX0uFeec=;
        fh=vKPabNFQtZksCw8Gx7MZGyYcGdbqbRY0PxguIOkfCnc=;
        b=b3Sw9Siq+k34TggJDArBrHDwruhaCcFFjylcPurgwChd9WN0YqlI8Rt5nLvmhDk16A
         Hzsl2IrGgZjJAEL1up3mxbcYoV18b34RHaNQdfkXAC/+eiW1TWBu11OlQqIvRiQw0X55
         aYJV7lGvgvgc9rkj9P+EOqel38hK3a05eSsq+9QSsUNwJYAqiciUGUMLqALuHxz0anB4
         ohUx8tmS6A0wjf0iKP+7JJbZgBn5Zlsp892fGd/rMbORyQGd3UVAhymuyf26YU7qs4Db
         PvZdoTePqLokgutaxn7hKqpcRfAXzAM3E1VwQztM3A9NzADofDDIc8/W4mQBj1c6GPjg
         Pp7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uoRGOTBp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ccd752e7sor276242f8f.7.2024.11.28.02.43.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uoRGOTBp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790607; x=1733395407; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWS/GNsFs6Pu4pBOarLJaqHWrc7CmHsdY5ILX0uFeec=;
        b=uoRGOTBpzIDe5xexsYbQT0Q3xD6AlBxnEFQ0crr12a0qjcVpg8dgEsrKcgHHPan867
         3Ai0IE5TRSi1UufApjkhLpb363qyKrioWikdRvt+STBvSgIcBHHyvs00mQWSgiFQV/XS
         k4w8eUr1QhpUrB1scSNtIR4Va1ViwMcBaNqmpZT+kb78mubkmp+O9but30MNw+PC4wXH
         E2oiAlBHgs4tMQHh2A4C0ZSlrBbN8fAdnqqlrFx6QNuXS0l4IdOhAb1H80bpSoeFYk0F
         ku4V7em1KJQxzTkqfdjYCJ89q9xgl0l79St/UPykE/il4HgioNu7X7Vvln+oSgKI0t+a
         j5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790607; x=1733395407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWS/GNsFs6Pu4pBOarLJaqHWrc7CmHsdY5ILX0uFeec=;
        b=Zlomm7mvgcimZb2Cni91M0Mtd9gfiJG8Bqg/QqmwocE/rDQbkIxKO8GYuPkD7krqBX
         fYok/Cw6LtFLejJ/4H+kGnDfRRCjASaLqWdkT9gbCjzaGTU9azmZVkgYoH8hhWv9QkSp
         Lbek6zfzQi395EJxUF8jOOJxnhwHn40wJ1+kTRf2hnIDL+S2VBow22jT3Nh3Sc9qQPdn
         cMdHWoKozA48vNbSEgd/+TfnN1vlezEF5teAliFOafMc/psFy1Eyj1HvC3ZNYyMDW/mh
         YV+XqBqi7fqus0XrdIIfmtErj8SxJvRn6/+W8Fwk9iCSLHRKrPryn1f/MZDXoP2fmYH9
         xV/g==
X-Forwarded-Encrypted: i=1; AJvYcCU36Ci8XKRAQNcJBOo9oueO4UbRw9aYMgyscF4qXfafHvxfgumVlLVyUR5EWPb9PQxk6grjm0UOUmDgdA==@linaro.org
X-Gm-Message-State: AOJu0Yxfd1wXawRv/CmBEbmmOgaI+QP/zCLqTzM+5mc4vEp8/mO9MoXq
	DasybBjGLGFuhezOIs5g1+KsDjGd86I0X7Zf6AtOVDALgNs7eCfzuKW2oQiyPAGsbw==
X-Gm-Gg: ASbGncvz2XRhkJTc+HxGJ0K8KTHXCLAFliGnStXJK+XYWeqHYUhgOtGA1Kz9ryrIOm1
	2P54iiuED30n+KIaKtYyuc1MsRsY5eLnpb5DuuTslFhMPKNvMLb6yDb+iVBPQpjSs0FKKbdhtM+
	s+3YcO9Lw5RWyMVd12V6mp7Wm2IrkmUEJaZ0c9SqhQ4fTSJ/alQR8fKra8XVpH++7dPpSq5vGCi
	6u5NBQxA+CPSznp6QqKwJK5veBJuKXdGah9n9cuXDazA+cV/bxfwY0=
X-Google-Smtp-Source: AGHT+IGyNWzgLyZWnKL8/dUfy9pyTYenNBT+T45tCtsyt5xK6UxFlG0jFs6wCg5GyXMMCyWimSPO1g==
X-Received: by 2002:a05:6000:1fad:b0:382:4b83:d4c0 with SMTP id ffacd0b85a97d-385c6eb7aacmr5799987f8f.3.1732790607241;
        Thu, 28 Nov 2024 02:43:27 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:26 -0800 (PST)
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
Subject: [PATCH for-10.0 16/25] target/arm: Set Float3NaNPropRule explicitly
Date: Thu, 28 Nov 2024 10:43:01 +0000
Message-Id: <20241128104310.3452934-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: O9MOLUPSiquX

Set the Float3NaNPropRule explicitly for Arm, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c               | 5 +++++
 fpu/softfloat-specialize.c.inc | 8 +-------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ead39793985..c81f6df3fca 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -173,6 +173,10 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
  *  * tininess-before-rounding
  *  * 2-input NaN propagation prefers SNaN over QNaN, and then
  *    operand A over operand B (see FPProcessNaNs() pseudocode)
+ *  * 3-input NaN propagation prefers SNaN over QNaN, and then
+ *    operand C over A over B (see FPProcessNaNs3() pseudocode,
+ *    but note that for QEMU muladd is a * b + c, whereas for
+ *    the pseudocode function the arguments are in the order c, a, b.
  *  * 0 * Inf + NaN returns the default NaN if the input NaN is quiet,
  *    and the input NaN if it is signalling
  */
@@ -180,6 +184,7 @@ static void arm_set_default_fp_behaviours(float_status *s)
 {
     set_float_detect_tininess(float_tininess_before_rounding, s);
     set_float_2nan_prop_rule(float_2nan_prop_s_ab, s);
+    set_float_3nan_prop_rule(float_3nan_prop_s_cab, s);
     set_float_infzeronan_rule(float_infzeronan_dnan_if_qnan, s);
 }
 
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index d7c0c90ea65..9b5243c9529 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -502,13 +502,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     }
 
     if (rule == float_3nan_prop_none) {
-#if defined(TARGET_ARM)
-        /*
-         * This looks different from the ARM ARM pseudocode, because the ARM ARM
-         * puts the operands to a fused mac operation (a*b)+c in the order c,a,b
-         */
-        rule = float_3nan_prop_s_cab;
-#elif defined(TARGET_MIPS)
+#if defined(TARGET_MIPS)
         if (snan_bit_is_one(status)) {
             rule = float_3nan_prop_s_abc;
         } else {
-- 
2.34.1
