Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413109njb;
        Thu, 28 Nov 2024 02:43:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqPL51TMM9HARAD+Rl0n+tXSNOVL9R6sHLasEWdm8Fkd3V1b3wF9WUmZ0eLhKB4f7OHUYaX7TFkz1WiQ==@linaro.org
X-Received: by 2002:a05:6000:2d0e:b0:382:4126:f182 with SMTP id ffacd0b85a97d-385c6ec01fcmr3691463f8f.25.1732790603517;
        Thu, 28 Nov 2024 02:43:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790603; cv=none;
        d=google.com; s=arc-20240605;
        b=P8jz8IWLg3xwe6Qpth5txP+TiOqKGwSGGWWPWa8B8tJKGlBOZC2kReikPUBcS1EFK2
         XurkWeqKvD4ZOKHEedZhPysy2xj5Z7psmpTIMwXJOcDZO0vkO718yGcOboOTkWA6pQZo
         fUvlyhm6dUeRzNPHCuPZH/xpql96GyU3YnI3t0gVihD7KaWQ3tau7S40rC6t1UrC4sdX
         TDDGg+JoLQ24jQXKSDM+6lfZ7xrlvjUPEvFVBmi8RyCekoArhoWm7XBpNOpSHx7h4meq
         aWcid9upQE9eRvBChtc47w4kaxM94QaXAXwfst1vJrt4CKwRtqQ3bXwWGflofvTiUe00
         rNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ek+hZskUnfXDQCh1OptQZbXmCqnBmww89XjzyzcdKGw=;
        fh=jowqdwROJg9RN4iBJiSlZqjiKsjXMUo5aiQFo87XN4c=;
        b=DWrbfNiLGK+DmQJ45l2Oit264NpL+XvYC5cVNdQpAQU/nxQBoge1h2R6E1o5C+qd2w
         U06FGu1ieFx2IsXHbRqde5HPCVCtk+AWYJUTETjlJ6kWhPfHqfFXlmBFxZJPA/HWOEl8
         E5kvN5jfofENjjqw3D/ZT5zlG1dPsr53LXiD4nUqgPfkfRBDay+bu5UYE7WlWLk1mCXh
         yPcMKFypKGBD6fPWdR7tRgELh6OE1Clq6c6oPptaQZT4xMWYJ4+N00tghbje1GTYOCet
         fuzuDNtiT5zWkQ7aDoewFbXLLK1YXb8XxDOu393X9+gDaCPt4Fy6a4gG43J5FbAGKQSu
         DERA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5GpV3ha;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10a1707sor4011245e9.11.2024.11.28.02.43.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5GpV3ha;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790603; x=1733395403; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek+hZskUnfXDQCh1OptQZbXmCqnBmww89XjzyzcdKGw=;
        b=y5GpV3haLn7UjlXa/rnUpnSVDObY2tP8KUVDJr2QqWAla8DhNB+XX9sCVW+98u+2So
         BcVIjb/Gb9t1EAswvwYE8Eq/IUsqL3bLQZ4YCBbPZEaVdPb1O//NF+PSW4qjdxreLF3N
         moq1+kLauNWgxvNeFQ+dXLV4YooN3On3C1x6UFg0dDuG+UImBs2jclhAZbI5rZI5270F
         SC7SInsieLIspxF7J3+ttOrm0udJu8bWjKtDO8yZ4a/i1y8mZt/Ybk3JiBWCzFV+SSXs
         y6Dow6HLtlelQEtwDJVEjjTl7vz1c8Srp8jxWui6LJuR0e2Iyn1pubOn/8z+tF2hiRiC
         ZfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790603; x=1733395403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ek+hZskUnfXDQCh1OptQZbXmCqnBmww89XjzyzcdKGw=;
        b=fXAcBwRIm0FoqgRiedhdnGssY8CVGRNUyizP/riZ8uNMsya79G0euIsdc5bzqtAPfa
         f1EqxKbJo8AK1V5+xsCsymIjsSIHNXKdq0o2/yF53hTKxiV8esRcmc+3ke1EM2RbEg9e
         HJbn/a8IuDT0eB/QwfeJz/pDaDtGaveOwQQXnPa2NzA+X07+jBFrDM6+fwl6AQIoijxW
         l8GWQChDT6utY6OP5Rw+wwZxNDKqk/i7yhPo8DyvxavtnAEoZTQpOi1bDDLQHsR6KBpc
         nMPNFV1eKTwaca5mvy2cKwSzlUlE77zUOBSjFj10JZqaL0MpOBJ9SQo/yPmmQSmuRfRR
         FXTg==
X-Forwarded-Encrypted: i=1; AJvYcCU4BnwoxE95jBMZwQ9ffeGHI60TSkHukPcJ1+YcVEG0MPDojfOles6MlmM4w6FRhVRLnRRQ5yMlioOr/A==@linaro.org
X-Gm-Message-State: AOJu0YyCe8QyvWRtV8pOZaYbTNHKTwd812W6vs8We2XgndBv/JL+UUdX
	SRBUvsJ79fP3MQjGyRvXboY3kQVx0+GdbnR4nFVliNx8W1ZQoqS+cHzL/C+J3B3+Jw==
X-Gm-Gg: ASbGncvBM9Afh/jEoeSzd0y+JzYEiRPpTxeVxudvw/xbNGSsDn76+yG72/ECkJ0DbZ4
	pC5YZmkd9Q1S3DK/qFYkK7ibHaW4qAgKAFr/QZslZofelPxAHi+pEur0A0Z4wG0ZLrJtmy1f1CM
	NnFhUi1rbXM/VBPaM8OWmhDdvnzLk4Da7kW+Cv85jQUmjxsy/1vh1U97gZGG+/cxbcbrUlyTok8
	+KN/Mgw54msWpP/9D4P46CqnfjTmR15vzOh2d6hhD/IZqcCN6UmC9c=
X-Google-Smtp-Source: AGHT+IEWAjOXb832xAkLwjb7/2TdWl3Q97ZUPXna3sU1PdKXSkDkT7jvbqX0c3gLPnpl2nRfuHRrow==
X-Received: by 2002:a05:6000:1846:b0:382:4d6e:9f3f with SMTP id ffacd0b85a97d-385c6ec0b9dmr5403598f8f.34.1732790602935;
        Thu, 28 Nov 2024 02:43:22 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:22 -0800 (PST)
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
Subject: [PATCH for-10.0 11/25] target/x86: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:56 +0000
Message-Id: <20241128104310.3452934-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: pxBc+q6RtDTn

Set the FloatInfZeroNaNRule explicitly for the x86 target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/i386/tcg/fpu_helper.c   | 7 +++++++
 fpu/softfloat-specialize.c.inc | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 53b49bb2977..e9de084a96d 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -173,6 +173,13 @@ void cpu_init_fp_statuses(CPUX86State *env)
      */
     set_float_2nan_prop_rule(float_2nan_prop_x87, &env->mmx_status);
     set_float_2nan_prop_rule(float_2nan_prop_x87, &env->sse_status);
+    /*
+     * Only SSE has multiply-add instructions.
+     * TODO: this might be wrong, as we never implemented any x86-specific
+     * handling for the NaN case for multiply-add. This needs to be checked
+     * against the manual.
+     */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->sse_status);
 }
 
 static inline uint8_t save_exception_flags(CPUX86State *env)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 3062d19402d..ad4f7096d09 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -490,7 +490,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
          * Temporarily fall back to ifdef ladder
          */
 #if defined(TARGET_HPPA) || \
-    defined(TARGET_I386) || defined(TARGET_LOONGARCH)
+    defined(TARGET_LOONGARCH)
         /*
          * For LoongArch systems that conform to IEEE754-2008, the (inf,zero,nan)
          * case sets InvalidOp and returns the input value 'c'
-- 
2.34.1
