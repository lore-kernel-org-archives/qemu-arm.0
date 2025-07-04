Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1282923dyc;
        Fri, 4 Jul 2025 08:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5kqar/Gtqs08PSKpO8bLatPcr3D3efRTBOas/JLUVQBogYg40PiMf/pJ8pcjV1vXi1iEgcC+gO21B8Q==@linaro.org
X-Received: by 2002:ad4:5748:0:b0:6fa:fddf:7343 with SMTP id 6a1803df08f44-702c6d79d93mr41923966d6.23.1751642107223;
        Fri, 04 Jul 2025 08:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751642107; cv=none;
        d=google.com; s=arc-20240605;
        b=EMehh+6kLrxmp09UaiLPzcNdjCcBr2mMVaaGGHrxBUY9V4kR8y0C3A8LNSaLYga+lY
         357gbjwZm43K+NAi03c6/EbFLeS+3Ldexzw/ZcAzAcg2ZS2indGUBP0SucWGv/zIwVTp
         1QDe8YHpkEnPWMqCMutiw9XvpDMv2JW6n0yAc3iKHNLj6EQskxBelx/Cz2UkttfzRmed
         cI8RwXaM6+GuTcCkAzgyoNqNw43i4M75O4Cr7zzCDYXS4AHXWX5S71P7CxvpSvYaQpo9
         coS8luagW22nIYSjUQHaiUs0SnXwSArimltWk3o5lzUlfy5HuqejYjZl+AFmYPBmXGGx
         2FpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NElkJwQRf1CyYZ1pLfGMEkRff1YKnUUmnNhqdv4yZE4=;
        fh=O87NBvIRbE3AMlodacSo6A/Yolhc4t3klioFD6IIUTc=;
        b=b/0RazTkYVHhLVv/uhxNyyc0nvLBu6tZODILzn/llUHCtgXzHkc5tg7EUzHitxBolw
         2L/lzS6jzLUSke+kEqNGcGEh4VNSruFbPDmLMLHBTpc2g7x16iMX0UOwpc0143aYq8MF
         KCyE+4X78mxtksJAHDIA3IY9d1iTuG6Vd8GpLo0AjS25XkXJ2iC+hAT0Qyy5VkRzZinP
         fq/UXiP8QzzbcNdXERkOCchwYPHB0o/iXeIwxKn0zstpXvLQkjQk9jWTvmNKije9bYg6
         UK3cnIUXLPsS3Lj/z/QbpJ3AUzJv52FHYoVbCLQ+KkZpjipoU89CzIAEIM9Z2tzMGCao
         G1kA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OBKeMQIs;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d5dbebce8asor189313485a.15.2025.07.04.08.15.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 08:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OBKeMQIs;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751642106; x=1752246906; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NElkJwQRf1CyYZ1pLfGMEkRff1YKnUUmnNhqdv4yZE4=;
        b=OBKeMQIs3V8nVVI9qqJHfzej6/WNUTdNUJo8qpKHNIHdr7cWDjS1aL0XKm8zdfTex2
         d+PnMqEf9vj++TD8J+B8Y62hs8+jeAg2YW74bP7S1p71NVZBKFK8voFGbUi7Q3dS3BO/
         yiVqxTWCI8MoeZzn+MX5Yto7Ugg0V6T4vnNr2sbrFlJWsHBBp65guAveCl/R9RpwV1Oi
         ztuKtdHo1Ts9OyHiUmDKpkEmd7M1e3uAgWnkqBxIYzlTdL+7/1bKcP1IbC5eIkKRhHfa
         ScV2U0FKdutv2Fmx25Yd6rWl99LIzcGM3iGN8NDhoPt4hyfka/mOqmwuhPPTzS5OIxgy
         9ydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642106; x=1752246906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NElkJwQRf1CyYZ1pLfGMEkRff1YKnUUmnNhqdv4yZE4=;
        b=pd6UsZD+TGMpO6DEuxtd07xkM74JwHCJbT3aiPkrVhetzBmZPhdxx5/NxvOGTUZJEc
         2Y9ec1ToMpEeAvmSd3uxyjO/lUgD3d/iUL0cuW6PjM+D7kvdCzWmtSu6XYrC72Avr6Es
         2T5++caCBXIkNMgl4XEORi3RX2F5pmIK7Gd8oT5AJJNEBiNkTCsY3phhXdMPD5zgHeuo
         f/yZOHFYcaSZTqZSg+lhIPTfnwh1SWrXh9KbNuwe4gzxFeb8Hbmp5D7aNfLBNLbGLfFZ
         pDi8CPzoUzj5kVCCp/iRyvF5+ksybV+bvpOVuGLCPUKOZ6EhhVwFhXLOZanL3Fzd6J/4
         qveg==
X-Forwarded-Encrypted: i=1; AJvYcCWgo0HCL7ijVCOQZLC138ys6Oe7l4J7ie1l4NPsiHpA+bdVaYX4phzET05IiyJNwDpnK39/25yS3VJIVw==@linaro.org
X-Gm-Message-State: AOJu0YyVE9XqsVXeN5z/12Y1YWMrqFBxLxlOkP7JZ9knriEGR2oW94iK
	xOn2QJjDlXJ7eCi4YE3CpPQokOtH7OO3wLbH+URijGY5D6C7jZsqI1SblQ49CTdvTLHtYA==
X-Gm-Gg: ASbGnctSW9Ee4BvcyXDw/xT7+RFNcNBpjJpq29a9ewBOrsCAQ0x/eUIj+PuOHIi3AAN
	iR3h4VbdaHphoZtbG/NIlNDsSJ+5VyTpkC3kDpl2y/bwG587jmW7vIA8r6WcqHk2JKSyeW0BoFD
	s6JF5evCw8AWMBoCGhnJHriqEUZqSmso70p/SC0goUrWHyIA0lyX+y4MCMlT4VYWQX8eK7M5fRx
	HGJMNOjpBfel54xeXK5e5lIoj+x6Mmmqdb8M8fHwarMxsqE9FDmutPAuG3tRCJLEOUnYk6zXEI1
	Mrz6i8lRij31TQ9vN/NaJniNfDPg3rK6ERLN1btTTbt/qTx+q0Jx1cy1PpZYtEcrQAQ=
X-Google-Smtp-Source: AGHT+IHbzxQh2U+33z2cIAXvHE/qRdlCtc7FLiLSRjUktLxqC4c4FdKRLsSj1Z5+AZRfY8CCcMrguw==
X-Received: by 2002:a05:6214:1d0b:b0:6fa:d976:197e with SMTP id 6a1803df08f44-702c6d8c788mr38540696d6.33.1751642106295;
        Fri, 04 Jul 2025 08:15:06 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([189.110.24.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6039fsm13658666d6.111.2025.07.04.08.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:15:05 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [WIP-for-10.1 v2 1/5] target/arm: Add the MECEn SCR_EL3 bit
Date: Fri,  4 Jul 2025 15:14:27 +0000
Message-Id: <20250704151431.1033520-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704151431.1033520-1-gustavo.romero@linaro.org>
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aGXKdpIA1wsD

The MECEn bit in SCR_EL3 enables access to the EL2 MECID registers from
EL2, so add it to the SCR mask list to use it later on.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 302c24e232..8ce30ca857 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1683,6 +1683,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
 
 /* Return the current FPSCR value.  */
-- 
2.34.1
