Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732394qvl;
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
X-Received: by 2002:adf:e9ce:: with SMTP id l14mr5997134wrn.616.1642875890778;
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875890; cv=none;
        d=google.com; s=arc-20160816;
        b=hPPM4Tbsi9amfRY4tWzs51MYwj59hKW6f5kKIA42L3pH+pCKzIgrLWIDriZfHryGAf
         XQVzsg8y2RW1Qqfv+mcB9B1/fD62F5z5vBB7lHStiYIPERPQeff7WK915qU6DV1tQmFE
         H9aiZoXlzdaavNTpgQjnn4MyX1nUPG1T1Xv5TYF1t7IWkHlrfZbrG8Hh0tuHfiTAG0HR
         DtiTjgEmCXgkc1SyNVtP0m2tfYCAzYS/fDzdCbTPvXmpZbvx/ts5UG1TtLqKMjkutfXk
         ZSc/fM7gO383LiDce+g68ILko5GvTYbCXbdckoNixBleYyclcsLPgpUiqNa3bF0+r5+V
         hJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=21JlFmTfghwTaDwa5naHNdk9BldcI4QKiETubeObcCA=;
        b=RgcLQ9YMzD0qBTz96YTufF3XkdmfCb6cQGlG0kIJzr+JDsEPczglEmgWnfsa+O+lj0
         +KXYvaIWGPESQC1iSEUQh3HIa/s7S7Wm9/aqFZIvyKTxjPAwRbfRCbwEBWHuxeoIQ2/0
         N9wnE9YRAu+AWsA873NKACyo90cAQg2fdicXDyU2bnjFkBbBDsuPwXvHL+BnY5rJCmzJ
         85yGeEu5z1WQ7/49sHivhsAa2+y4q0bw/CS7wUl08TfH5+Sjg2TvKcQhIvyfDiQC4JDe
         0NXBz8WfYFBL6vqBxHiD1tQP4dw8YdAR7m7iUzfW6FEVDB4xdhgdnM0pLyMFJ7pQFda1
         PKcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RjIERdbB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o10sor5545895wri.72.2022.01.22.10.24.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RjIERdbB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=21JlFmTfghwTaDwa5naHNdk9BldcI4QKiETubeObcCA=;
        b=RjIERdbBOmYJ+5UjdZoszVefR4dYrTxt9tsJc+4N1sANqWijAhWCBlzkbYY4W/t9K+
         x1C9sZeomMXEgkwjxL8EPquh2gHXCLaARh49vR6FH67L9swhBPGmzR7esTduSpSQtQZm
         fDvYpeYGPHh46l5hqHhvJXRVUU7EtzPQICOGbUINaMEl2osggsVTPy6Ffsfj0vWm1Xz9
         IgiDKrmHoF3TlbvKmHyr0rk/VvTBd7CVHDSaYQAZeCwaIx8IrW4dEHOxat2bCLLSxdsZ
         ueVFveNAlD86jVsiYAygWjRMMqLJqCNZIF3Lf3Q+LPAxyo5B5VPPaC/gLbCD8AvLJt/9
         Ixow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=21JlFmTfghwTaDwa5naHNdk9BldcI4QKiETubeObcCA=;
        b=mBpvjbI11paIslLTEZSE2/lbTcWu49OszwSWcSaa7MRg/Snazd/fHa0ql+/nt54iZe
         686gD0+sBkIxnz2/jvYgjsMaj4v05ixl06easM9Ol+krHOvwrljMeVWdzeiHUPjuzJ1Q
         gTmHScOvK8wRlLm2TnMH7ePjECdvn0QY98O+/+WE6Efpe0VMzarCHLZONk8nLr4TSafb
         52u0jgTTLHapw4EuGx9As4iBhbBXNmvKUSl2q3N5Q6Qd4huSWFDWZplBXldNU6fdAGA7
         xVzK5Mtnn8d/TNBcDCiRmhTxN+9SAuTFlMMKRQykKNDEEauIO48T2dnhNnOSIsxlnXvI
         8WIA==
X-Gm-Message-State: AOAM531FGEQ6M7mztbLrOmA5/9OebrMsdaxtLsp7NUi3Sb9XbF/3zTHC
	b1SPFxBfpJlI+gX5o/zgBfI4SgL8
X-Google-Smtp-Source: ABdhPJynVpAQgzKp6fvszgdjoqizMkFKHxnIOSJOQ646U6rtNPaFLW8KL5A7mOEyy0c9UQ9iZDQXmg==
X-Received: by 2002:adf:c843:: with SMTP id e3mr8587182wrh.38.1642875890510;
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 06/14] hw/intc/arm_gicv3: Honour GICD_CTLR.EnableGrp1NS for LPIs
Date: Sat, 22 Jan 2022 18:24:36 +0000
Message-Id: <20220122182444.724087-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WzN1mL36hTYI

The GICD_CTLR distributor register has enable bits which control
whether the different interrupt groups (Group 0, Non-secure Group 1
and Secure Group 1) are forwarded to the CPU.  We get this right for
traditional interrupts, but forgot to account for it when adding
LPIs.  LPIs are always Group 1 NS and if the EnableGrp1NS bit is not
set we must not forward them to the CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 715df5421dd..6d3c8ee231c 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -166,6 +166,7 @@ static void gicv3_redist_update_noirqset(GICv3CPUState *cs)
     }
 
     if ((cs->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) && cs->gic->lpi_enable &&
+        (cs->gic->gicd_ctlr & GICD_CTLR_EN_GRP1NS) &&
         (cs->hpplpi.prio != 0xff)) {
         if (irqbetter(cs, cs->hpplpi.irq, cs->hpplpi.prio)) {
             cs->hppi.irq = cs->hpplpi.irq;
-- 
2.25.1
