Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732377qvl;
        Sat, 22 Jan 2022 10:24:49 -0800 (PST)
X-Received: by 2002:a7b:cb83:: with SMTP id m3mr5382577wmi.150.1642875889471;
        Sat, 22 Jan 2022 10:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875889; cv=none;
        d=google.com; s=arc-20160816;
        b=UedKKQRrwxDq0roA3h/sCE/13YTRz579602CNe8qtebjaBP/3mkXMTVIf1PVvE9fGR
         ukOJZNdpNAp5qykrAiD+e4Vbk8Y2GdvQBqX1jDSXwropIIiPFIpm+ilsb5pbJwsD6OeM
         HHzv+tdcXuZ9eo/BEt/LiZm0PSF6BuqcuQop3AYV6E20zynPlj9XQqOp9fKso9p9siKB
         40YMXzy+/3waqxm8sdsdJywVwneJXXso1Z0uL6woyBO9X6ktkDv31fuMKA8oKgjfF2Pq
         mEU/08xNyQkpL+DLsm+3T3I0r0JDKNqPOy3ChO3xIQYNh/viYqpp9XjSuYmQrzzlgZ2i
         fFxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NxBpkMVebkfvJDaKJYbHagp3Kx3QPxuJ4FSTved8Gug=;
        b=A+ArmT7+/4BlPVr/Tu9Gt/NTqw5sIE6Sevqi3TT58RonT3HJfsMNU8h8HRroAg0+kw
         guFwi2KeedUeFk0TGXVzfZm28+0aqRputSsgmDABXAvcLrIHgEvCl10p5llpwFwDIy9I
         6WiElRcWveMVCkKeCoW8OpqwaXgV7bcClPeu28xYWW/S3io7zVhr6hxRFxLSWLMKZMZs
         8Xx5nsUQMND3W/mALtn2EhD2OhxVErA/Dv1r4ebTyghoXceCNyNZaOPs7HxXhjA6p0+0
         8i+wXfqlq0lajHJrj8hiVOjqod69aVFk90PQ88qn/Txcc7FP2fVqPiXXyI3f+ryHmA3J
         fOpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LO6JD28S;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w15sor381842wrq.57.2022.01.22.10.24.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LO6JD28S;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NxBpkMVebkfvJDaKJYbHagp3Kx3QPxuJ4FSTved8Gug=;
        b=LO6JD28SSRveVnVEfo4UpGmhleAw9kCGUklXWSWAgFkqsu0jt/qlOZ5BCFCqF2CJHI
         I9UyZWvQzzmeGFQzLHYhourEfjI8Nc7Y4SoYJw5mhMQNkyY3WGvakRI6fQha0QFEbx/+
         +8Hei9OocwARhVjS6T+pVXRPVwM2uk6ASPtPPH9jDMAE+d9AfSVc9BJHlulx/aU1XasW
         HGYbm3qJZyw/K0TSv+3LhNXTroukQuqWFTXwfxqh4cI3+zlxCp8dMd3qo/7Uhr3pZiR2
         WK/ggKFxdbtLjgvgfEH+rHHs9UHE7QV06M46EwNE8Cj17HvJrKdQymFIV3UDfcom6Fbu
         nB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NxBpkMVebkfvJDaKJYbHagp3Kx3QPxuJ4FSTved8Gug=;
        b=Mz46PCCaQAh7fQATCBAGwDPS2r3Hf5ypQrUcF7NLHpLU2JtqGuAzqEriJJ2NzeuIan
         un3dZcEgfgBAmruhCZ+n6GOjB8ydtSyOe05pHUxMgzBdCmY+IoXuEm3VQDAH/+CbQ9mZ
         AUpVLnEn86Fq7LB/32kovKWvZw46BKOvuzruwsKmyyYRCnP7LJ49lzaZjCzNHLLWF78M
         icjmOiGbOv32p69geieUIehTbzhADOldcEXeK5oYhepISugko1skOVAUafzcgCfKmFBb
         StNrnMcLW/nysHXRd0qbktax1XocrTe1qqF/GoR746odhGg7g9J6vel8PIWSAdyh9aMM
         GJEw==
X-Gm-Message-State: AOAM530PyN78pSkkv3sWUpnHW0fI2V/d4PfdS6KYKlWjcg1LFcPbsSK8
	GCELcobk3ETOqsRTOaRz3lYjuXIJ
X-Google-Smtp-Source: ABdhPJwE1hCRNxWPHu+QxeUccvBHfki0iMe7vAfrQHmiyhI6zBcCE0F7P9pCAou2WjBgoH889JjEkw==
X-Received: by 2002:a05:6000:1a8c:: with SMTP id f12mr8408980wry.352.1642875889199;
        Sat, 22 Jan 2022 10:24:49 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 04/14] hw/intc/arm_gicv3_its: Don't clear GITS_CREADR when GITS_CTLR.ENABLED is set
Date: Sat, 22 Jan 2022 18:24:34 +0000
Message-Id: <20220122182444.724087-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WuceRgi9iZ/t

The current ITS code clears GITS_CREADR when GITS_CTLR.ENABLED is set.
This is not correct -- guest code can validly clear ENABLED and then
set it again and expect the ITS to continue processing where it left
off. Remove the erroneous assignment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 67f12d98af3..1763ba4a671 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -853,7 +853,6 @@ static bool its_writel(GICv3ITSState *s, hwaddr offset,
             s->ctlr |= R_GITS_CTLR_ENABLED_MASK;
             extract_table_params(s);
             extract_cmdq_params(s);
-            s->creadr = 0;
             process_cmdq(s);
         } else {
             s->ctlr &= ~R_GITS_CTLR_ENABLED_MASK;
-- 
2.25.1
