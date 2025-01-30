Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp181829njb;
        Thu, 30 Jan 2025 10:23:18 -0800 (PST)
X-Received: by 2002:a05:6000:1fad:b0:38b:ed88:f045 with SMTP id ffacd0b85a97d-38c51b61164mr8307480f8f.33.1738261398199;
        Thu, 30 Jan 2025 10:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738261398; cv=none;
        d=google.com; s=arc-20240605;
        b=OzUzt9yqjfW5dYAgfP+e3nBxL0Jh+8k1uFhFm+o4AK8LNDxGY9Y2VoD/OygZ+n5hf2
         m0BqX9Ux7vrEIN3Uh86kCX0EapLGqBIxhYYUBXeAXLs4xXLEmtFlCCkQZ3TbynyZFBDx
         QGQ1+mLTbjDq+1SpzvbSJxRfXMHCz4/R/yb+t9FMbeDahEK3U0tIVRTuFHtePeDX8ylj
         y8PENo85Ap4Bnm8ahVJn4ZAOTmmaQgH8HwLGiABeIx8UhIhXJnpn6YXqydyacxOtd4ud
         plWUYeRCMR00EwEK3I7f17sMWFv/eu3TLmtMvhI8eACT9RVg47N1iOQ/iMVjO/0YV6V8
         XOtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g/yslxnxwmm+HysZz/dpCshf9VmwSsaLGb2pE27kvDY=;
        fh=RiJSNyFv98ecbYckNQx9NKP2dJchb+KjtIrNazRBKjc=;
        b=fokrg0c+u/rUsT6cdCBTHRF1T+iLHYuauE/WsLvfdTquxGcqu8wjCPn6W6gFS2JFaj
         ialpVwlw4MUmr5r77fFVjomsUv9P01N1K4rtIgtwDTDJi2BM0jjYx5SRn01eKvqz8wfO
         yLvJDwvN5DbOaS36vrFNfXNXcdgPVh1K6d/wooQRAKEkv7ocRhiUGjK0HXmwrgIe2LAF
         iu2fGROtov3urQ223T7JCqtm5QPnrAov5oEzFZ+UOSN0am4GH07d2syqccDnutYQ+lr7
         Y0ukEsAAEI/eK0k8TAEGx3t6qytkWK9eTv0O0FgeladO413EnqvcSJ8HnG5qqG4dK77W
         3g3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OauJ9aCX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38c5c0ff052sor641541f8f.3.2025.01.30.10.23.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Jan 2025 10:23:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OauJ9aCX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738261398; x=1738866198; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/yslxnxwmm+HysZz/dpCshf9VmwSsaLGb2pE27kvDY=;
        b=OauJ9aCXo1DRC8YOn17BRSf7gU74MYnvgHC/oKZthomQ38PeO/cykcRqUXOvYPG0TS
         pQ657TfULMINvM8aXVxOAxeFDleqBn36kY0tKsRn4O0cdoXsscoqppw8Qjn0tjawKKNp
         ozbS5XjmEXE3fAuOrqb9DQfZ5t8rYKxV16coDsfx9izpCHLneaD/exzISOsRQT0Nly4m
         v8VC9zs78unmrfDu7MoQb3k4yLNbyKAM/52R9cnJOexw9RYEZALTXz/E/HPNDVcCdoRC
         z2fgIsxrKF+YPgwzTlm6aqIn9CJIjIyJ/LaMxkYyB2atpLQpFk4/k+3z9PoaTmCB7Lhe
         UOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738261398; x=1738866198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/yslxnxwmm+HysZz/dpCshf9VmwSsaLGb2pE27kvDY=;
        b=H2pDumTN1ZOReHFViEglo2oXOHEWvcztTQf7qLpUIZ0l/jXznD4aZKbjm6FEGwCOPo
         Q85jbJHXp+A/nRxWmeb0xUycBdG0qZ1etehfCSombGd2AJoakVVURSABWY/6WOFmfZ07
         xoMz39OVNv9+2wUZg6gW8tzcaKrDcnHeDAm1TQs2AXO1laD565EK6jl0IQUwvJwp5Kck
         xHAz3hsjirbWR3gT9DxXBhAfzqmRRdIgnoAQFLgW2Rxvcsn4MHlf63W1PyQNj4eAEGo3
         jXbZd3KISbzr3DhCmaCOiNOOa4U4B8DO3cRa4RwoyDj2vbuVnBGcQC/aTy7L9ylJirQu
         eekg==
X-Gm-Message-State: AOJu0YxrMomsVqjd80tkQSvW+jk02n9KiEL2IRIuh9tqnwYWxbYp6N41
	NeMFiDSKOSCOSS8pBqHlFSGB91diisfTpA9pElaY8XowD7H787U0Vakc2H9poejADA==
X-Gm-Gg: ASbGnct2PN+1khyHXqiaUZmoPQ5XG4RanTxu/jOFa+tUpa1+BL2MDBir97mKNwsKpma
	EIj8Tsy4PKJ3xjzh//qoapko8r0heQ4mXMLnDOy3a817gjEzVfBHFplip0tmwuGNHMbIVXy3dZp
	4ZbdaUrvR56Wg+6r767FUjEBMRYKYHTuU85f1cTmvwtEinOJl4ltGDoY5EMTifEnQ7TsuULCoFx
	pKm0GUVN8zhFBMsUCSBFYoQPQLkmHXPI8+fiE8IaQqw/KTgFKKA+LRYFEOtJAQ/mg0m7MoVzGox
	wJsLROrkg5ruwNBYJJa72A==
X-Google-Smtp-Source: AGHT+IH+I7yo4Js2hImL1H05KRHZE/gUC0mEnMK4BeWT4jXxKMiariAVI/m730Pzby6oKJBa9crVaA==
X-Received: by 2002:a5d:5846:0:b0:385:f4db:e33b with SMTP id ffacd0b85a97d-38c51966b85mr8153358f8f.21.1738261397654;
        Thu, 30 Jan 2025 10:23:17 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm2634426f8f.23.2025.01.30.10.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 10:23:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 06/14] hw/intc/arm_gicv3_cpuif: Don't downgrade monitor traps for AArch32 EL3
Date: Thu, 30 Jan 2025 18:23:01 +0000
Message-Id: <20250130182309.717346-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130182309.717346-1-peter.maydell@linaro.org>
References: <20250130182309.717346-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: erGKbHqE3x+y

In the gicv3_{irq,fiq,irqfiq}_access() functions, there is a check
which downgrades a CP_ACCESS_TRAP_EL3 to CP_ACCESS_TRAP if EL3 is not
AArch64.  This has been there since the GIC was first implemented,
but it isn't right: if we are trapping because of SCR.IRQ or SCR.FIQ
then we definitely want to be going to EL3 (doing
AArch32.TakeMonitorTrapException() in pseudocode terms).  We might
want to not take a trap at all, but we don't ever want to go to the
default target EL, because that would mean, for instance, taking a
trap to Hyp mode if the trapped access was made from Hyp mode.

(This might have been an attempt to work around our failure to
properly implement Monitor Traps.)

Remove the bogus check.

Cc: qemu-stable@nongnu.org
Fixes: 359fbe65e01e ("hw/intc/arm_gicv3: Implement GICv3 CPU interface registers")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 9cad8313a3a..8a715b3510b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2300,9 +2300,6 @@ static CPAccessResult gicv3_irqfiq_access(CPUARMState *env,
         }
     }
 
-    if (r == CP_ACCESS_TRAP_EL3 && !arm_el_is_aa64(env, 3)) {
-        r = CP_ACCESS_TRAP;
-    }
     return r;
 }
 
@@ -2365,9 +2362,6 @@ static CPAccessResult gicv3_fiq_access(CPUARMState *env,
         }
     }
 
-    if (r == CP_ACCESS_TRAP_EL3 && !arm_el_is_aa64(env, 3)) {
-        r = CP_ACCESS_TRAP;
-    }
     return r;
 }
 
@@ -2404,9 +2398,6 @@ static CPAccessResult gicv3_irq_access(CPUARMState *env,
         }
     }
 
-    if (r == CP_ACCESS_TRAP_EL3 && !arm_el_is_aa64(env, 3)) {
-        r = CP_ACCESS_TRAP;
-    }
     return r;
 }
 
-- 
2.34.1
