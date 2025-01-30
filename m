Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181859njb;
        Thu, 30 Jan 2025 10:23:20 -0800 (PST)
X-Received: by 2002:a05:600c:3c98:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-438dc3c38dcmr78632555e9.17.1738261400401;
        Thu, 30 Jan 2025 10:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261400; cv=none;
        d=google.com; s=arc-20240605;
        b=Ik2oCSFm07zc+tZlQ/JvPvtLiAlGa2Aqrwi08SnFio8s6KKSyezb/i/Ho/fbEXtn1H
         ac1B7DU5L50WdqRtQn3SXa2RntRG2yR3rC1ThX/BqgDM16SPj36KHS00n5BmouvdlTwE
         LUA504vlTgcGIQsTOqngE2YryBM/yreMuS4SuGU9p5gkyQ12mDhgG/bbx/ep15dJM4ym
         GQWh8E2i3Lqmikm1ZC9rd0i0vArySWlU+uKQfdnwjVjSwRZOXg4pJLocpOdgT6nOFzLT
         UFNQyGJmBxi5yhgk3nh42TbK7OS3dfDKKH52RhP49fv3QpXpIL7Zdr2ZZyqgWujFUkV4
         JMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FfOY/642ADAin6VFxYNR1rJN6MAtVOu/6BLcp/293aA=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=Sm6wzwXqtVLbjmSgN/fWSln4/1YNFoP63yaQCQAz2Igo4MKYy3wHWGpJo7+mk0cUiu
         aaxfjMaHlgvEA5iN2G8K8p9Xui/0N3OhuBN6pqcf6VPIeH/XbwH8I0LCrg0YcFQ/qJSi
         YfMtMyb9e0FP6zAzK4An5dBGV/uu7rBMpANPu3wawHR55avlwgTi5JcgjngLvqI/yVpj
         jle+2QsRSNcF88qWIrgL63GcHhJ5oohyWQV8BIs6xWmTRjN5Fyt/6l9LEXSM5196924L
         AGt14PP/nNs2NmvjBWqfcpuZDAaF1kf1BlOS5uIEE0zTlSx4wwpOS9qX0Y81bRQA4s+x
         hT7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ss7qpKoz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0ebb65sor637573f8f.1.2025.01.30.10.23.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ss7qpKoz;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261400; x=1738866200; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfOY/642ADAin6VFxYNR1rJN6MAtVOu/6BLcp/293aA=;
        b=Ss7qpKozar8LY+yEYV7vNNU/KEYzm4LI/F1F7kntamFqFPuWyDceuXhulkq79ClVJT
         /XNzR6Levvevx764HGwbKA8UCGQ4dgm/amtpq3Uqx+sSvfSi1tVRio3bmyV3CUjOk2a2
         5C23mcEu2C5U5zAfg5qGvj3I3pydDmLrOs/JifPWVNUB3JTOOemHc2NikAEx/M/tGwVq
         gH1inoZ7OGvMgwD2lpeXL5UdVJPdTeJ7ClAzppnu5wOMASkPki7bBHttCb+J6mfdgESV
         mvthk6SAD4LKZ/kw3KmBJdPJ/N6bROjB7LxkuVQNWSkMLLYSj+PZpspkRpM4dfLXQRxK
         RCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261400; x=1738866200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfOY/642ADAin6VFxYNR1rJN6MAtVOu/6BLcp/293aA=;
        b=RtwiaY7zmagEr+tP/iMpcBP+wGK5XUa8cacmXK9NSaCA/xd2Cfkt4SHIQ1axUOAb80
         pUykQ6kO5QajirjCx3olbt0bylHbEbBl7IK/tx1mV6kOY7rrgZF8ylRUbl74TEahjpRe
         K0wX2Yfy+bcbAcnXYBAzwi2ng+RpUPPD4J7GGOLT2e3YpovJPQUZ4IjCzbG+9oaZojX5
         e1eYCCEYt9iZKBb4EUq24iHz0OgrNaVXz16oB6lKlfXA4vcZVk4M9IuOimwpGLofThJ9
         mhs2yX/oDkk+cMvL58PT6Py7kWtO1rgUlxJxhtiddfPqbYe4/OOWPUhY1jGefB6WEJ/m
         JNdw==
X-Gm-Message-State: AOJu0Yw4NVk2Kpzm/mMUqA7DgJv0+8vUxOT5OmzUWGArtRciu6WyreFz
	gvutai7Tj6wqCeUPBAXxTei27GwA85vtKxehJ+kSCkXPo3EWc19Vm5vrH50lcDLn9A==
X-Gm-Gg: ASbGncvDwBiZ5ntouv1hf1GoWXNgOAW9FNNJvxLZ8A+0GUHMZ6kCcxJ4mWu7oQ9SeTp
	xlta42/BERkhzdulp5RfoawFunQ5+rfMeMPFmK0obsQBnF7FEjP4lb4yQRdgEBv8t2U97579Ftk
	0YrvBaF/Q9PUxKRGEiGzSE7R/Z8+G2S1aLmrZ28uAqa+lmURi+GvV/s1uvbDLPYtcd3LMuWaIxn
	22kA4V0Cn78Gf8mDuukXzDua1tJ8ehXoqdTftssliLb2Lwq4RobKFff8dn0/nneP48fesQ+aSSW
	1V8rOXHhsESSaRHQ14M+wQ==
X-Google-Smtp-Source: AGHT+IGiuiMHrThD+uWTll5N2DRzacpqO1X8j2qlN8vV9ZDCgL/ut6vM/QMSQvs3Geru69+PmJUeug==
X-Received: by 2002:a05:6000:1866:b0:385:fdc2:1808 with SMTP id ffacd0b85a97d-38c52094219mr7873930f8f.40.1738261399765;
        Thu, 30 Jan 2025 10:23:19 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 08/14] hw/intc/arm_gicv3_cpuif(): Remove redundant tests of is_a64()
Date: Thu, 30 Jan 2025 18:23:03 +0000
Message-Id: <20250130182309.717346-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PhjyxT8QauvO

In the gicv3_{irq,fiq,irqfiq}_access() functions, in the
arm_current_el(env) == 3 case we do the following test:
    if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
        r = CP_ACCESS_TRAP_EL3;
    }

In this check, the "!is_a64(env)" is redundant, because if
we are at EL3 and in AArch64 then arm_is_el3_or_mon() will
return true and we will skip the if() body anyway.

Remove the unnecessary tests.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 8a715b3510b..7f1d071c198 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2291,7 +2291,7 @@ static CPAccessResult gicv3_irqfiq_access(CPUARMState *env,
             r = CP_ACCESS_TRAP_EL3;
             break;
         case 3:
-            if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
+            if (!arm_is_el3_or_mon(env)) {
                 r = CP_ACCESS_TRAP_EL3;
             }
             break;
@@ -2353,7 +2353,7 @@ static CPAccessResult gicv3_fiq_access(CPUARMState *env,
             r = CP_ACCESS_TRAP_EL3;
             break;
         case 3:
-            if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
+            if (!arm_is_el3_or_mon(env)) {
                 r = CP_ACCESS_TRAP_EL3;
             }
             break;
@@ -2389,7 +2389,7 @@ static CPAccessResult gicv3_irq_access(CPUARMState *env,
             r = CP_ACCESS_TRAP_EL3;
             break;
         case 3:
-            if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
+            if (!arm_is_el3_or_mon(env)) {
                 r = CP_ACCESS_TRAP_EL3;
             }
             break;
-- 
2.34.1
