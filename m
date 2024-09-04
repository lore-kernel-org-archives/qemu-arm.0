Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp189245njb;
        Wed, 4 Sep 2024 09:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6p179uoHf1h3wYTku6YoPCeEBaD0aNmou/Xy5u5uXIoC7GsScoZ7cB1/VsRVr89ujKXjBn3QLVSF1vA==@linaro.org
X-Received: by 2002:a05:651c:4ca:b0:2f6:4f98:4f78 with SMTP id 38308e7fff4ca-2f64f985067mr29798251fa.10.1725466548881;
        Wed, 04 Sep 2024 09:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725466548; cv=none;
        d=google.com; s=arc-20160816;
        b=i+GJiAwkosViey1Iqz8VXGzqGa0w7vYDS0hZaukgH+W1eZD3DkIE85XWdFJjdTC9IX
         ZhcguVZg8IrrK7rcCcQnEWVTyHLvHWH00wJybLJuBr/QHtY1QhsSj7IXLrXr+GkJRRvu
         LeqW491SEf6l8vC09X/lB/2XpsLY0hX+u9xIiQJBzsTRLlcHXlastBRg89OGPv/F7uAd
         CaMiBNiwrgbsrhBKHQDARM6woSTbZXAu8q3YTvORjI1PccU0/QifmxE3kl0DqQvnUBxv
         v79Q25mfYWNh570UC0Vprf6pOYt+9yIsb+xvABF58IkTIu85DJ2/NLhZKNSpmjEGlnFQ
         vVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4UdvH3BfQ7ZFjeKvJ3vJphtRrv7BJb81oMyMgddOC7g=;
        fh=vQrqGlX6w34ygROxl3YrGY1rYF+3zrblW0A71c9SKrg=;
        b=UldamWElwtGTyV+t7Isnfw72b95WbiHXkX2zAO0nmYcPuyGyULrIuXG1uuVfau0xE0
         gC2pzsuq8bHBkQcMh171sIQViOmZYCJ6b1nMgmIc/XNNvhrF67yaC0assHdPORUA6xoI
         WbnkFHNCwVSS0XJvLs8vu/KLAF7/ooe6s2zcDYZakmXyM3VNt7W9wMKQ2JuxGmjuIxRO
         LD3ncXKyf5pEL+FEPHqkKkReaXVGAZmKSpi5n+p0URL//exBkedxy0sFRUilKSDyMtna
         KQ6Ne4mx7og91Q42F1y2dpJX6TE7Nn2Sm2Vh1DLkMjrzaTy/QRqkMMEH56fz2UYKWY6I
         t4ag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dJsDM+ig;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f65f18e83bsor2857461fa.4.2024.09.04.09.15.48
        (Google Transport Security);
        Wed, 04 Sep 2024 09:15:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dJsDM+ig;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466548; x=1726071348; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UdvH3BfQ7ZFjeKvJ3vJphtRrv7BJb81oMyMgddOC7g=;
        b=dJsDM+igq3MJYiiTpls9QCaa8XG7Via9Z+Os26y5IuTgHI4hbfaE1ps7xKIK3/Eoq7
         +fPZKF8uM2r8OE0YF2UiDu/KRIyd73h4gIMbUlf/nezigYvBMyklWfxZGqrPDnonfxYH
         2EJDpSdy0Ow+URVwmd1KWxnwS24Yx73lj4E2que7jKGcrUork1CzHI2oXfD0XYkWRyMz
         +7OSC026VPmcWcv+k6wYxsnVoG2pv4EO/Ym8UBLpxg3Pe2mu5EKBQzyrPyVXeqLRU4P6
         zQyhjiUo63iGm/+7mleQOQBiITJ9LExt/Oii4a4qACs4fI07pXT8OST5EA9P7fznYIzy
         DjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466548; x=1726071348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UdvH3BfQ7ZFjeKvJ3vJphtRrv7BJb81oMyMgddOC7g=;
        b=MuApxbRQCRiFFa740jKTW/5SxF0oWw00M1AjG2Op4CLFt43vKXIbzN3OcmOSjplYeQ
         LxvxPdhwhIi5QRYhDvaeHLbwijlB7GTDz00ZRcNnNbevfC7OL1npWmpYi6U4uqSobWKJ
         bo85e85/Ylk5gOiqCn7c2g2hn3yrj6lEtKigrtRobkQ3QdVNXf2M2uUK/o0gAI++R2wa
         B8YazsQV3QDPtOYvlCB9FLoB/WsBng0VnYTVqE7dc0JguIW5PZ4uybDlVlu+uz3OeSlP
         +rMCMBg5N8yO4R9HMNhHs1yQQJLrODTl6beseWpQiIl849NA72kAHkZ8yZlYeK8t0P3U
         a77w==
X-Forwarded-Encrypted: i=1; AJvYcCUwwrkKtcCS9Kl2Xw9GY12NnA+BybDtRTVopDay4LKtqMHV9QbovmI3dDBixgggK9lXmN1+qSsnEZDsL4soLQ==@linaro.org, AJvYcCXl0rjoR/nGOSsnP/i5CtvPXzmqXSUq1zVF6Qb3Pt5bBLI98EeA8vGkZpAglgbP7Y/7GqA9tclM9G69pA==@linaro.org
X-Gm-Message-State: AOJu0YyiXLpIMQYXRCimoxhNl9s1sg1s34cSsHvamXm7opuAOEgpp4ro
	hp6VszJ67b9XSyT+SyPY+boSSt67fRNmFIXYTcxsqtMPESzMuvJTk/2cH1wn
X-Google-Smtp-Source: AGHT+IE45vRxHAq5eEpoyZwDxuEOBpO1l1yUi0y7mTpVkk1pHSrAlDEkmoWFTNi0vvfiboSA/TFkcA==
X-Received: by 2002:a05:651c:1507:b0:2f5:104b:f2c with SMTP id 38308e7fff4ca-2f61e0b27f4mr114070401fa.39.1725466548140;
        Wed, 04 Sep 2024 09:15:48 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed192dsm26313971fa.7.2024.09.04.09.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:15:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org
Subject: [PULL v1 05/12] hw/arm: xenpvh: Remove double-negation in warning
Date: Wed,  4 Sep 2024 18:15:29 +0200
Message-ID: <20240904161537.664189-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DC4hRwSdDTlw

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/xen_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xen_arm.c b/hw/arm/xen_arm.c
index fda65d0d8d..16b3f00992 100644
--- a/hw/arm/xen_arm.c
+++ b/hw/arm/xen_arm.c
@@ -165,7 +165,7 @@ static void xen_arm_init(MachineState *machine)
     xam->state =  g_new0(XenIOState, 1);
 
     if (machine->ram_size == 0) {
-        warn_report("%s non-zero ram size not specified. QEMU machine started"
+        warn_report("%s: ram size not specified. QEMU machine started"
                     " without IOREQ (no emulated devices including virtio)",
                     MACHINE_CLASS(object_get_class(OBJECT(machine)))->desc);
         return;
-- 
2.43.0
