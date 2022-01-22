Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732372qvl;
        Sat, 22 Jan 2022 10:24:48 -0800 (PST)
X-Received: by 2002:a05:6000:50b:: with SMTP id a11mr7857150wrf.387.1642875888703;
        Sat, 22 Jan 2022 10:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875888; cv=none;
        d=google.com; s=arc-20160816;
        b=Wrd1bkJZRwpAUh5eRWBJTaRa4PsfrOLJB2QkGmQqg+V9RjIUGQ3NdhRonvxfL0yiB3
         NV88BfHV6TLpt0FmhN3p3ptxRwIewKO5DgKZWNcqUuNsbusoLIdNjMdjgVrF4QrPBPiX
         HWLTVOyH03c2yx8TJCV3x1apBQZejt7OqyeOTFLYVTrSzA1nAx4eCo/1LWfQgZOT8G7U
         Np+dolbez1qw4EOlR8hOBtkgnuezGEATDChlO2YTSniXn7X8ban5k/WvCy/db4N1MsrN
         mCG1m2SZndo1ItgVFF+pDpc3cpqNYrKvcC4uf1GQze4GW2ou0KiRlB96N+8x8eX9YaqD
         hR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=B8JHQV9Rxu6y5Kq3DIwbkwHmKbpxctF1sxkGjMJbHmw=;
        b=vlLYHe0W0p7WKOeeqRrKCPohXnqWH3tdBL8q82y6cPOOjDl/s279m3kO4D2y68FdTm
         MRZj8rmApLUHll5eUfj1sqy4MaosEMutkLumI/08qUU8/rqJhRDh2AGAstsYlWPC2wKI
         EjkJHhytk08UfbYFJLSee0PXVj4ffFMZnZFIgflrnKHjN1e5887MwC+iglZo//EiXNLF
         uN+H4AI2MU+aiHcZg104p19LEhU6L62F6NqNR3x6J8QqpXCRO/uvCwrs5pK9oXTjuA26
         p8UeP89JqIie4SrKTsIhbzGM/aLay3GYW9sdfMhI4CkfWtPIPqJfEflP4ZNbDsXHvHZ5
         dO6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePem3qcN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m7sor2348396wms.29.2022.01.22.10.24.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ePem3qcN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B8JHQV9Rxu6y5Kq3DIwbkwHmKbpxctF1sxkGjMJbHmw=;
        b=ePem3qcNADxccA6TrK7qqEZNXQY/UIXXaSvT+S11T+ltaOwP0uSn3P48ciswyTWDhk
         EjhQIByp5abFpx4f1JzJZaXCm3MTxChQOlbeGSOhmhzi+b/qakdrs93RbnOh4az5YRR5
         IeKuFqsd+3jd/FYTy8rODnczwGvHG0dW8iGnE6pg3t7yH+YFQ+fkbXB9zT9e6qu/Ybv7
         UVwVucPlBKYMQE7HLkB6V13NO9ZdtgREes7wZcTl12LZeONmM0zJqtOrezLgEM46AuGR
         VRF9l4dx0g3fEsdYrLJJs7nGI6h1CT/Vi0ZMFork0Jkn/zCGPsTUuPlIomSmstyHPx65
         1GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B8JHQV9Rxu6y5Kq3DIwbkwHmKbpxctF1sxkGjMJbHmw=;
        b=RsMosya6nlDu8UKcb799ezsdvG+3kEn72AIBp93hfJtU1TdmvZLrwUckywEL8YIBwb
         ZUMNDXpfHSfOgoprNkQL5wfmrpsPycBtExBKqfrvnlVzDG/n1uTyu/2dq+D0zKz46clR
         lvVDqEgljpWCZeB6CBiDIVWd6MOR3/Uhk34pVlH2bUMHxpFxs4Ddkh2n3W0l4my0HegE
         5jFd2+iXskcrH2safmPNKv9HacGIfOrLwHfiBnk0hNbW8cWnqtxXBySfGi0WUx2xih36
         g2ssX4+z7S4Mje5nvj4vHpU0hLeaQfaImP3fXTkKeF/NVwPt44VEU9lzzyGliLFmzLDv
         f1oQ==
X-Gm-Message-State: AOAM532lbsxDxx2BJDxRIZQvdbt/m9F/V3viVSxvJ9/ZmkSGLgG+RYgj
	hZIVD2IGFQmfvyPHoLa3XLTkXzHY
X-Google-Smtp-Source: ABdhPJzuU4vHBLMLf8ckvtJYW7efh51THXD8c+sVd4BRBpBwR4L3xx4q922A7OPuv0Xqy501RduOPQ==
X-Received: by 2002:a05:600c:4e05:: with SMTP id b5mr5355919wmq.51.1642875888339;
        Sat, 22 Jan 2022 10:24:48 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 03/14] hw/intc/arm_gicv3: Initialise dma_as in GIC, not ITS
Date: Sat, 22 Jan 2022 18:24:33 +0000
Message-Id: <20220122182444.724087-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wha0M7UEaaGY

In our implementation, all ITSes connected to a GIC share a single
AddressSpace, which we keep in the GICv3State::dma_as field and
initialized based on the GIC's 'sysmem' property. The right place
to set it up by calling address_space_init() is therefore in the
GIC's realize method, not the ITS's realize.

This fixes a theoretical bug where QEMU hangs on startup if the board
model creates two ITSes connected to the same GIC -- we would call
address_space_init() twice on the same AddressSpace*, which creates
an infinite loop in the QTAILQ that softmmu/memory.c uses to store
its list of AddressSpaces and causes any subsequent attempt to
iterate through that list to loop forever.  There aren't any board
models like that in the tree at the moment, though.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 5 +++++
 hw/intc/arm_gicv3_its.c    | 3 ---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 9884d2e39b9..579aa0cb9ed 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -357,6 +357,11 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    if (s->lpi_enable) {
+        address_space_init(&s->dma_as, s->dma,
+                           "gicv3-its-sysmem");
+    }
+
     s->cpu = g_new0(GICv3CPUState, s->num_cpu);
 
     for (i = 0; i < s->num_cpu; i++) {
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6d2549e64b1..67f12d98af3 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1194,9 +1194,6 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
 
     gicv3_its_init_mmio(s, &gicv3_its_control_ops, &gicv3_its_translation_ops);
 
-    address_space_init(&s->gicv3->dma_as, s->gicv3->dma,
-                       "gicv3-its-sysmem");
-
     /* set the ITS default features supported */
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL, 1);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, ITT_ENTRY_SIZE,
-- 
2.25.1
