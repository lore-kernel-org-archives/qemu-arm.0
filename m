Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732423qvl;
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
X-Received: by 2002:a05:600c:3510:: with SMTP id h16mr5305128wmq.162.1642875892870;
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875892; cv=none;
        d=google.com; s=arc-20160816;
        b=O+YJ6G1WoRnJ5iuOL6HgST+ZaHdihHf9K9suH/ev32LtHZsSBXBosMG3XQ1QwxSnwh
         4FP4h7X42zg78rrV6jHNmJTyK2lAm7MSBdZhaMJEdxT6pcdPcV83z1ItMOeqbIeOXGVX
         13O+/HQGE4hyLnzpraGhwq7XgeE+IcDMyR6NuSlrPOzCU2wKL9WbGamksvMSGbVe96yc
         QFE43PzvhJs0nMrOjP47eLTXbnJoagq3A0ywQQGU3Kzb5uIhavmMI3xvrj+PNOSTuW1b
         4WUXl/JaiHDC+WODzmzKIZz53Yav0oOiYcmieUMNS6kkbbyiMOZ+qDG6z5fmprOzlDV9
         GXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2LzeMToaOEGCiel3HQIJUA2eQNzHpTQ/lZbs+RZvo48=;
        b=KMLH2ueKRAMIswYbYcUoHs3DLu0z+mGIKam5mo18IGEeVqEpihTgPXx7Lj/qp+CJGq
         a8WXZQOKzPiL9pNJ1GsMHXILF+HZXXCjoUuQJ4ZtQCksceIlLoM5A4d2Vk43ij12f2jS
         ilicatbnRT8gszjTZBT3K9B8IJwyKc0Jb0R1VJKOkHROpLdvErxao3oQGrqKULdY9omx
         HYF4JWUrjoXbKKaKFFgCp2J1crhuiLlfePdu9NGfSmxxZr922Lz5s+3Ixgj2BBCq9RHb
         Qw0hRAk3drzrFDYYNGOYCprAKgxa96utm9cm5hFmSX4I98j1NigifM9laVSacPNWgRsi
         knpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F9FABkkn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m26sor5602215wrh.15.2022.01.22.10.24.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F9FABkkn;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LzeMToaOEGCiel3HQIJUA2eQNzHpTQ/lZbs+RZvo48=;
        b=F9FABkkn2BchsatkG3FrRyqG73hQL/0/SsZYGCR/MLdt2U09yRUHlvqJVKcWeYhlJ/
         IADCV6+PnJB4pvuoVrqecVb6SMCt8Sh6cGk0znGnMSNtuLWY7Mvt2kc1QrTk4EkCVD7O
         umUxqCKyeKBLzsmITftezRFYu3UTh7W2nPkxcAY2M8k5A2Wb6eLjwDvOkFUtm4tmyWjm
         oJEV7EGVMB+zXHNDM9v4EjDnRHZ6oMxkOGLkfRqkqWs8aVnu51O9oG5xWTP8u5bT3MPI
         p0tJEJmkOXI4VlblxrW0g+hJJlQgLJgWEiMTRgCNtueSJqryrLDrDPxM1xMf9mCIRr88
         3aQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LzeMToaOEGCiel3HQIJUA2eQNzHpTQ/lZbs+RZvo48=;
        b=vUvDvwN4IqGpdcJi2TXrozlPftP5hBn2jpYzTkMtOjWeOBOEoqDiLf3VCOX44/fiA1
         JRxGRiUZwFNJElHIm0qauLaZjcj0+1ppOWCypYyjLm0l1K6B85UdBZ42Cxz97qFj5N4V
         vMY968DStm3qu2So9DeMJpzc5W6Qn1UgjridbAsJELNxZUE4SPHHgsYcfrj5Nd6X5FTL
         zixPuNNQTkk8nR2kAGHMjxMVteuvmJ7ih951zts57ht9ujIjCawgpsawy59/+TMACJHX
         x2LW1GSTG1iI8aqVV5fXRu5MrBPI4EvNcvMBam1afUoA+yq0fxVVXkFWv9wX1PbdfY4V
         YDxA==
X-Gm-Message-State: AOAM532vA/62/NteQRkG0H9/Cniq63934LWTACA3cA0md3hsP1Zb00HG
	n2QF1gM7FnbH7I2Z+n/wOtFJByYF
X-Google-Smtp-Source: ABdhPJyXVYQ+xT/Hd75htYRxGm4MnCRqXoxHsR4ahmKHPdSA/KO0Hmv+0C8i7vFXmhaAjCYZrLAfWQ==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr8184908wrm.311.1642875892581;
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 09/14] hw/intc/arm_gicv3: Set GICR_CTLR.CES if LPIs are supported
Date: Sat, 22 Jan 2022 18:24:39 +0000
Message-Id: <20220122182444.724087-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FWA7LNiV197U

The GICR_CTLR.CES bit is a read-only bit which is set to 1 to indicate
that the GICR_CTLR.EnableLPIs bit can be written to 0 to disable
LPIs (as opposed to allowing LPIs to be enabled but not subsequently
disabled). Our implementation permits this, so advertise it
by setting CES to 1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h   | 1 +
 hw/intc/arm_gicv3_common.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 5394266aaf4..a316f6c58a5 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -110,6 +110,7 @@
 #define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
 
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
+#define GICR_CTLR_CES                (1U << 1)
 #define GICR_CTLR_RWP                (1U << 3)
 #define GICR_CTLR_DPG0               (1U << 24)
 #define GICR_CTLR_DPG1NS             (1U << 25)
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 579aa0cb9ed..4ca5ae9bc56 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -429,6 +429,10 @@ static void arm_gicv3_common_reset(DeviceState *dev)
 
         cs->level = 0;
         cs->gicr_ctlr = 0;
+        if (s->lpi_enable) {
+            /* Our implementation supports clearing GICR_CTLR.EnableLPIs */
+            cs->gicr_ctlr |= GICR_CTLR_CES;
+        }
         cs->gicr_statusr[GICV3_S] = 0;
         cs->gicr_statusr[GICV3_NS] = 0;
         cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
-- 
2.25.1
