Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183749njb;
        Tue, 4 Feb 2025 04:50:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyA/I63zedeA+Qbgm/jwdUvmaQdUKtorJa1+JTQ4ISg866BLkMVi97AKxGIu4lL8aGy29nwY62+4juPg==@linaro.org
X-Received: by 2002:a05:600c:19ce:b0:438:a313:cda9 with SMTP id 5b1f17b1804b1-43905f8db74mr22362275e9.10.1738673421141;
        Tue, 04 Feb 2025 04:50:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673421; cv=none;
        d=google.com; s=arc-20240605;
        b=FrTEpmH80EsS4wWooLjokD3fJE4U38lDHTRLXvKd6/mOmbpnJB9JEEy9tswY60lMSG
         DeTetMiMbX2zIiz8BrczcnRDPJqwRIohbnb2K5O0G84R1y2MT+b9YbnjPwi7NnkHZEP1
         9mTn0UF20bfOgbGEa0TroycKbnDwqfL0ZiMtQQkxcBPs9oePIci+C36+eaiK5gneOzAQ
         b8lU0WbW4v97dMNKuukBCuF/vIFqR79kjuaBFDpwoOM2Wg3886+c1Tam8/5qhkwviSmI
         OCUwWHqWaHIZmLVO8HPmIxPoP2zglE/tpabP+dUNV5UC0PavXPv1KWq2vO+uEBzjfeq7
         WllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vewycir3LsXYBCZZr4GGAFtxfOcg8znbIbn2DHI7Kek=;
        fh=Ok8bEqS7B7v5R7q+0b4kc4ne0r3GkvBpvRwSNoBh+3A=;
        b=IvCgq//4YtyuxZEjSdEufDVjfDjRkuwl14yjipFsBnZNXIJWm+0GNRTW3SlUGccyx3
         VmxzB9ITOYH5wlRS/SpUkZT81zrZ27ImFzwfm5Y49ldbPmcx1KkYyOF9euGt9sOi3rRh
         +djZDeESCQexfOugeDmpbAng3otDFcCCaXP5aOhW/tjkFVM9Y1ir6t585PsIUiDzRsj3
         ANdGnFKxBO1qS9GPnHHsWAC8CFzwQY+VjiB+zq0IpjkKvmuyTw6xeIBH2oph4i7HY5lH
         CoHjrIZ/YOG5gqNbLRyDzYb5fapOGxcCvkVWQz4Ae6HXkoHNzWhDXOYS2S2MctIUYM3u
         lEnw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWZEp2df;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4390a953397sor911855e9.5.2025.02.04.04.50.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWZEp2df;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673420; x=1739278220; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vewycir3LsXYBCZZr4GGAFtxfOcg8znbIbn2DHI7Kek=;
        b=TWZEp2dfrHZWvJXf1jMJyX1fBn1TFGBjALCUojCskSv0ABIbqGJRspXlVYCZIn9+tI
         2+QwkDBor5307oWCHc6iCAwOOKvM5sbtnZgHCOqMTqhunPWTwhVomYC840DGcrxY4HMb
         5J/ZGRh2NFygilGJRW+eged6yHloOAysyRBe2yuGXvhqEJd2FsFJ1i1mjDT7aNJT7+qr
         i7UaUYxPJSd4FAy8qpbeWrJO+RyVossbqb45irvusJetPQYM30K/Eh1XU7XPwGMITp34
         sZxe4uropH2Yt73dEJE/xkVQNGpuBD0yYWxfBbSdvWcLFsfXwQ/5i6UGPAchGuEZ7rhk
         PUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673420; x=1739278220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vewycir3LsXYBCZZr4GGAFtxfOcg8znbIbn2DHI7Kek=;
        b=ZWGf1lVnb76Kh+D7iydsRFRCXlZdp3ua+UAtnkktnr3m+pqjObODs+hyQTty11bnIb
         Wrpeyt8GCubhsn9ObTwAVRo1O2pqzGR6gsVrHC759G/YlvzoAvquNB9LZai4FQe56Qpu
         QWhSvpMAywGIg8g6KOCHbAmKyRJeaCndV4AaQ50W2FjdIKnI7Xy/4I7L5JyqYX1YxYud
         mfThYSWMx8slRNMpJYy65K/N3VQAfFaCItRbF9qhTH3FSZow0WTxOGT6wtXpzOmDMy+o
         3wcliT2oeol2Uq6PXIhTsbjzEg2n1ZJ2xY21zcofDvjsLg6oHWeHg08nqwwz/9baBONX
         82Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXjmH3g3YBLzumHjCyLe1y9ttKLG0vmMALa8x71gyOb/a3PZkYv3JrMWf0O1VpDPzYcHvMGy5Q4leOZTg==@linaro.org
X-Gm-Message-State: AOJu0YymqZg8l3CDc/tPGsKxqeTXWeqrw7dRpjQnlSkpSMv4kCv/F/sg
	pOTaZDdNV4XiZotd2IL8fmy2DnIfyg1CjjwQ/8t+TUQFthf9BjDjDYCdNb2bACpBsA==
X-Gm-Gg: ASbGnctpVEiGayLW/HrZHxfbrJ8WwCTZuVp7TQDnfSZDdQ9VHlilzUt6T8Qan8cMr3x
	sBoSXIqUYrs1PNYtzuzLgZpJO/DLBiaqT2LlAaj6fsSNgiwJVgnc++fLKQXkHCCjz+kz/ma0uzb
	3Epoox0U/WV++frqd6I91k/W/3gvUGrrNQrr/bQKpTPMgbn90MsfNPcyhOU0Cb2t+/f59XaWC0+
	m5LGRguXoI/fjeEdn6nQbl9LKAVU3W4eQL20JA0cau5pxgR4rIUGUVFr5wK1mMQux1nOWrxu1Xz
	mnOZAzvb3SB9hPGDEMPtCQ==
X-Google-Smtp-Source: AGHT+IHl/OfJHZjDcYYCYWFSB8H18IO+6VB+QVpj1HwxaW8VSj4pss5fGQbNvQ24hIUQxGay3pEDKg==
X-Received: by 2002:adf:f54f:0:b0:385:e328:8908 with SMTP id ffacd0b85a97d-38da53d130emr1928487f8f.29.1738673420572;
        Tue, 04 Feb 2025 04:50:20 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 9/9] hw/arm: enable secure EL2 timers for sbsa machine
Date: Tue,  4 Feb 2025 12:50:09 +0000
Message-Id: <20250204125009.2281315-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +TOULZ5lgrb6

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 6183111f2de..d69e7aaa95e 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -484,6 +484,8 @@ static void create_gic(SBSAMachineState *sms, MemoryRegion *mem)
             [GTIMER_HYP]  = ARCH_TIMER_NS_EL2_IRQ,
             [GTIMER_SEC]  = ARCH_TIMER_S_EL1_IRQ,
             [GTIMER_HYPVIRT] = ARCH_TIMER_NS_EL2_VIRT_IRQ,
+            [GTIMER_S_EL2_PHYS] = ARCH_TIMER_S_EL2_IRQ,
+            [GTIMER_S_EL2_VIRT] = ARCH_TIMER_S_EL2_VIRT_IRQ,
         };
 
         for (irq = 0; irq < ARRAY_SIZE(timer_irq); irq++) {
-- 
2.34.1
