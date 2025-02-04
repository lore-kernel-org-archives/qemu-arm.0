Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp183666njb;
        Tue, 4 Feb 2025 04:50:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1BYk0LzsdvrxW75Oq+ZMV1AMiKJOWaZddYAAPp22amyXm3tOvH6MV+10OMS1CRVQHvdwuR/9Gl2DaUg==@linaro.org
X-Received: by 2002:a05:600c:c17:b0:438:a290:3ce0 with SMTP id 5b1f17b1804b1-438dc3be2efmr228585845e9.8.1738673414679;
        Tue, 04 Feb 2025 04:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738673414; cv=none;
        d=google.com; s=arc-20240605;
        b=PN0ttb1mMAbMaerIciaUBXKJcwErzbkr1UMPW/C4f5n8r2+yfpWJNP3BFzkfLWIuqz
         +YH/2K86cEOQTxMuPcnYVL7lYhgR+YVd/UAQ6GVVyJ00x9eIlv2OLHwwyVlCs28UKPmb
         0NqDEeVCseNxUIkdOKdM+Yy1DB00olarXNVZG6+VcWKyEktckACXzzMwCyS/K8i8ZfZ0
         tsTqe/uOGTVK10JR7+mvzg6zrf0BVlit/5NJa0Ntm+1inpsMkLn2CX67FqpIAVB9EO6+
         nVL3ozDb3+es1XoEd76DuniLQcD+qpPMZ+SVDZP4aKoznXxWGWRXnp9i7vMPSg3MzKnP
         gxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TG5YvjSZwhc9TBWdlzGFshXDfcxcwdL+WhbKE+SqJUk=;
        fh=jZJO/mFlxg3m83DGNoqu8h3M6qggy4LIM4BNh0KHzUk=;
        b=ZKI585UVMDH01/9ROslRhf9ozT+OO38HrJodSvnDSmGTxp883Ho+tvxhylO2OAlnkf
         xZIaRcs+PnRnNE0zICenXqYk9mfPuLarWherN71gRndaLig9s2Oi1zRTRN4feabnGeya
         IzQcmD6JV8G4ydhvIou/+oqMhbc79H3TsIlYQmLS8ei9S4SoUeusEvwlaT4irXdiEVPE
         MqUU977gX9UXgjPzRciZwM7ffWn7GVIkwVmKhepnu/PzhMR7L2tnrxBtX4Q/x3Pg87GX
         2PvtHfUNXxZTAkGuAtIH4yf0Vq4q4Jb7hZ9BMSKBjXeCcmiRhbftZutNEFD1ezUUk71k
         FhHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYmD+pmt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e2468764sor50857445e9.11.2025.02.04.04.50.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 04:50:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYmD+pmt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738673414; x=1739278214; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG5YvjSZwhc9TBWdlzGFshXDfcxcwdL+WhbKE+SqJUk=;
        b=IYmD+pmtA/JnidvTTLQz8GOmSSZpkn3wDm7AshFmmKnC+cgsfaUsWg9ARcrxA5Azr+
         eR5Cnnfq5HfK83Ne8wnwdyzDyDKW4L6CvEBnd/0WcATbEzbf/Hhns0FJ4rmkOs15wI6V
         TANUOHy0aLgoIkcW3sYusssBgdPhC5lLRlkXevKrIJEI3JI72VSPyicLvfJL4EhKAmCi
         kozvvbD5S2TrSl3i25jOh0yqCDqglLLhvdpajiED96YriYT6GfxT6ZCxR1G82fvQ1v8i
         BEr0COfcOW7KHMUp56gWW7ILZ0FzNXWzN8tDC+dwOPPjkXNL346p88Am4KfISUCrTVui
         XxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673414; x=1739278214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG5YvjSZwhc9TBWdlzGFshXDfcxcwdL+WhbKE+SqJUk=;
        b=qFBlgMicYXMdo2m4q/QNMw+sjmBsu+Fn0pkHqp/CDjwOLT+nTr5YP6v7e22uvRrMbA
         l8mRxFuesfgX+gGdV6hy+mws++ZNvSDGtZRnbK/oDgS+85qT8Nb7EnSBM/s6wA1dAiaY
         Y7tAkUA4qORQxUC/tBymZ1jcRQRiZNyB7C/UN1v9I7brly2sgrUA5Tji0vb9IQcoK5zF
         ywQ6heFcV4PDchQueiVYbhf9Tr3MK8ol2OHAAnK0jt8kVXvNIWRdEiPoAWkFoRTTWvNV
         jGz4Eo9YQze0ro7zEbFNwq/ALXNY8/buVLGIeHFWvEZF4MH5vk1mlZejyAg8mLOjmsKc
         fKCA==
X-Forwarded-Encrypted: i=1; AJvYcCUFD3AewFsv52H8R8CebWdXG2ZCdkngLvh1dNXPGjTaAiVR3FDLpSJivWxOJ1w4GTooJqzhyxH/9POFrQ==@linaro.org
X-Gm-Message-State: AOJu0YyWz0VYb6AcCI4+brTUDZ564VmMyp8hVp/w66i6CES+H44k5yLm
	hxonxeqn9qtzR2SRb86HjoZXgZJNZKVnFL74AncrFr3s/RKp3aePp8USmpVR2iqAh4A9azw3Izf
	KADs=
X-Gm-Gg: ASbGnct8zXsEGhDIrrjWNPCYzhaCB71QVmikaqeCl7w4xG0X/LhcHUJBpnW+PJi2lvI
	eNJ+MRrLAMUqd4aC3BEyko4Ki9FOO8nh80ibIBfbLRmfXgU6vVWoTYKnaGHbHTIPB7AKllTOGc9
	JwDZKQTyCq00yAuYpITYjbT48Qt2DCKRKvIgeIKRRGapWm2Q4js6QdhvwDKZ0dWU5J5YmTO2Xcz
	fuolKGuefCSMhFc5gD7OYRKv9guTDwgUh1STIloCx7igvnyk9uKYH53xlUiJDW+5yoTy2EruFAK
	V4cea6gzRfPnRZq40Np2eA==
X-Google-Smtp-Source: AGHT+IHgLh+EWaE8oaEYxTNWnzFvvFosBsOIVVYVXWKquQnZ99/Ic74vCOlOuJYBN1p3txo2Tyoxqw==
X-Received: by 2002:a05:6000:1884:b0:388:e377:8a1b with SMTP id ffacd0b85a97d-38c51b60c11mr20563034f8f.28.1738673414159;
        Tue, 04 Feb 2025 04:50:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c122465sm15757919f8f.47.2025.02.04.04.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 04:50:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 2/9] target/arm: Don't apply CNTVOFF_EL2 for EL2_VIRT timer
Date: Tue,  4 Feb 2025 12:50:02 +0000
Message-Id: <20250204125009.2281315-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XLr01J1bPcDL

The CNTVOFF_EL2 offset register should only be applied for accessses
to CNTVCT_EL0 and for the EL1 virtual timer (CNTV_*).  We were
incorrectly applying it for the EL2 virtual timer (CNTHV_*).

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 049362a5500..ac8cb428925 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2604,7 +2604,6 @@ static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
 
     switch (timeridx) {
     case GTIMER_VIRT:
-    case GTIMER_HYPVIRT:
         offset = gt_virt_cnt_offset(env);
         break;
     case GTIMER_PHYS:
@@ -2624,7 +2623,6 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     switch (timeridx) {
     case GTIMER_VIRT:
-    case GTIMER_HYPVIRT:
         offset = gt_virt_cnt_offset(env);
         break;
     case GTIMER_PHYS:
-- 
2.34.1
