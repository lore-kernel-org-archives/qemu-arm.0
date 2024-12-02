Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802630njk;
        Mon, 2 Dec 2024 05:14:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW2AhOgN05/hiFRYsiX36ZmACejv+w1olipqvHg2AJarpJPDeEFR6oRWRXi/B1cMq5+hHrEKLTE0toMqA==@linaro.org
X-Received: by 2002:a05:600c:5246:b0:434:a196:636e with SMTP id 5b1f17b1804b1-434a9dbf3a5mr239482365e9.10.1733145295181;
        Mon, 02 Dec 2024 05:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145295; cv=none;
        d=google.com; s=arc-20240605;
        b=Kgy00UKs1FtgdOhpUcbiGqDBYsvWZkSbSnJjeTRSrvz0qGX7Cj3gzlv5jZxYMscss5
         cIFrhUDgIDPk1TNVa06wNGE3pI4PbsjkqA+viHFZef9TcXJRMKojhYujjo4P59Qp/VOQ
         /9xNVn1YaCXV4VGwSJ9anLo3JZJMJMI+M8RDQJX1+/n7YcQbbdXwMRm6mlhd0yOMpI4D
         1kF3BWN6lOBPnUt1EnvP3D7VOiAtgqt4uymHSzYe68OsjvT7UJjmxnf+85T9HqqBLFcY
         uR+brZMG/OzVWHEU84vIknBiNl22xawFj0Qg/nQHGsXCjCM/vLctni+JeGQRYTudPxxN
         5WyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GcCmSt30lYdPKkQM5ubQPjbLlX8F5CbU10wVOuOifdc=;
        fh=dMlPYOosljpe0J2ikGlPBFCktN/xm+ChYy+Q+B2I8+c=;
        b=W3WYujZ8aSRmvrb+4HtAZ0Nuzj4QiDZE9T1T8CR0+LEtSfG0rcwlbCFJSBPNpW1IQ/
         eCReRbpvhq5LMXS71wj1YF3cpXe4pocL2m+k4VYVKvSGF1hFP4TmwtKvIibpHZPk93vS
         mLaf7HTtId0N+G3jCVgFt7V+tzzl88/eCWkRMoGuuQXaNEDnQOwf+8oW9w4Cx+QSCm0x
         jL4JbuEX97/kuwQuD0xwFEO5u1nVEsDLdX5Cu5wOYS2qRfREMfRHOVTV1iWbYLrPyhb6
         0Vj4E8U+/evZwjzlTLSC2ImOMbPSN45imbPI8GozD3SWAgRf0fGWzJeRpCX8TVGCymvD
         uZUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pmuWa57+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b1044f3dsor35081865e9.3.2024.12.02.05.14.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pmuWa57+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145295; x=1733750095; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcCmSt30lYdPKkQM5ubQPjbLlX8F5CbU10wVOuOifdc=;
        b=pmuWa57+K5phQ99OLC+5/H4wAndpPSxbhTs4hX+83lWeDyiNFpTMbtLLfBnVBpNCdT
         1i16f3BllIuCb38TFhLFz6knxbMUP4MonQ2T+gJ6azpSbThb9ZEbguO/m8SiDVFu0k/I
         XDQxSWNWxs7+L1K7aAiFQ3+W09f9ff0DBaDTFEClwd1pMHmbxF0rgGQpLuIm2MRy1Gxt
         RgWrdNENC7Si6B4bkmneEyXTEyiZYKx7Ze6PiojMAB1rK7591dmDaC1FVq+xwHbXeErr
         YHXZyCG7VMV9FVAgd9x5WnA5xQSychofRC11wPOg60SWEJvQE6NLH7RfuxhRN/yhnOjq
         NEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145295; x=1733750095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GcCmSt30lYdPKkQM5ubQPjbLlX8F5CbU10wVOuOifdc=;
        b=PxR3rlkN3p4FTU+m8OuDYF12VyeUPgCcJfEvEpdSnTe/+O5n6OtNlsG4g6sUow+Lb7
         2sMTxlWaS0PJvga3CPe1hNP03tyqu9xmLR07PHLajQENt4Ncb9aF9/N6Vc3HiqSQnZNA
         9WfqG1+OIvwSMrx+r4iki9d1Ad2dtLV0IhPOe7AwDLvWqxs3DlyjXs631CrRYb8ZtK/z
         ijLUoZXH2Wid/QRMA0dRKXi2lYrEZKbZ+wD1+OoeACl4CkMUOQqLSBO3DM/egweSoJQF
         Sx11+FFTAfDMHdQR+PIwhzgw3XuDuujAIAnhHzFwD6YMxtwB6UzQjGxohuy8Ek7dXmkC
         CT0A==
X-Forwarded-Encrypted: i=1; AJvYcCVgoYXMOfL9w6FIt4UbopHuNJtBL3K+wJjwSOV56Nmmo8gEU8pimGdO3aRYQPgHspugeLzMHGYG52uOdA==@linaro.org
X-Gm-Message-State: AOJu0Ywx6jyUayijcSC4idNG2JtD1KK9hcA2GUikkxwp2nV9xSWwwjT7
	hz6xccox/fd3lCo07gTYTpH6DnstwyHnitTXSONkFI2SnccrukOyDW1QZsf17lOjVw==
X-Gm-Gg: ASbGnctfpCB62tfBOW9sh61ieSr4BQqGYCTXf/Pc/F/chjhCdt/0cptcTOYZvWL2EWM
	YOCcaOBOsY9nV6iyw4BtTACJ0jD8oqGqMfNMv4mikLSgkwvx/Un9XONlvTYxg72wCU5JWInbf35
	sagoc6yr7dQWBLHupmCDuN78fn1SOp6E6HxUrh75wsLYoavDoIS4k9Y/CJfiHMTAOGHN9/kFd3F
	1yQtTU702QJLliiEWMBPTMSI68FzNbPc1qjmHVlLGyK0UH6YeMl46E=
X-Google-Smtp-Source: AGHT+IEMWA8R+sjb0UDNLKxMw0MrwaLmHVv03KFNhEwVlZ/CFQlwS2cTAsuf1zTSP6YRWuLQN4g/Sw==
X-Received: by 2002:a5d:47a7:0:b0:382:4f34:ef7f with SMTP id ffacd0b85a97d-385c6ec1011mr18645015f8f.31.1733145294496;
        Mon, 02 Dec 2024 05:14:54 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:54 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 48/54] target/s390x: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:41 +0000
Message-Id: <20241202131347.498124-49-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: AHXJUxol9K14

Set the default NaN pattern explicitly for s390x.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/s390x/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index e74055bad79..adb27504ad5 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -209,6 +209,8 @@ static void s390_cpu_reset_hold(Object *obj, ResetType type)
         set_float_3nan_prop_rule(float_3nan_prop_s_abc, &env->fpu_status);
         set_float_infzeronan_rule(float_infzeronan_dnan_always,
                                   &env->fpu_status);
+        /* Default NaN value: sign bit clear, frac msb set */
+        set_float_default_nan_pattern(0b01000000, &env->fpu_status);
        /* fall through */
     case RESET_TYPE_S390_CPU_NORMAL:
         env->psw.mask &= ~PSW_MASK_RI;
-- 
2.34.1
