Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp189305njb;
        Wed, 4 Sep 2024 09:15:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZdD1ySLRaDSEpZyrpEnm5JeyjH+Cm2/dbyGHJ4+K8qUwZ+YCCeNtj3WcywqkiwWAtZBpbmkaWlwntqQ==@linaro.org
X-Received: by 2002:a05:6512:3b11:b0:52c:e054:4149 with SMTP id 2adb3069b0e04-53546b052fdmr13468692e87.15.1725466554656;
        Wed, 04 Sep 2024 09:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725466554; cv=none;
        d=google.com; s=arc-20160816;
        b=CGzZANP1cWjSG1hf1qn3lUq1/xNyBw86lp5IGdSlGF1DAwR8pGNVJdFGb0WlnF8fJq
         DBr2Ak08itTRRb/QH66wvMNXKumAK+CxNPCLIvziDCceH7HDER/xjcXHSTpuORCQVFVF
         CBSnc2EXz8nOlFCdCxWiYuU9c49cICCDG9Bxf+6iOQ5EXW25SkE/6dxWSagKkdUSdVii
         C0klwNJ+VqPrlhR5LVaNN0+YmGgYDn66jJt5GIWzHJANOAYu9RfiCXMNHhgJn3kYNLoi
         WqEpC4W1W8Wycb3jF8z98WpY7A2Z74jiiq22Zx/7ALjWRdIiVihRtA2UgbRv2GEzvChK
         4wKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        fh=ggdTkuFT5Q6+ChVRtuVwpoWn3I8m/PF8FzN9FMMfTPI=;
        b=uM4n+AIJ552PJwaYmdeN9XfCs7+dhAHPRP+oRPqybkaq024rsm30rqb2BbQq2CQvwO
         5B3lnWvxAFeh6EKrhqtx16Y4qTp52ZH3rJaX+Fo/nCac4kr6TXBpU1hHvWHA3OoQW0je
         RvlFTyQRcrVOepjHHVfCV8LH2tBeDmLwa3+AtlNrC1j3LM5rodkQaMiR0z19883zEhaG
         Pu8JjDgbRHuydxDxSvBwvxtyUGTA2tWbjvGuybnyob5uABBcdOpsSS6bdbsyMppJw3lP
         t4L0j8jcbkxqMCMRZJLUlK5RForqVV/KDl3SHjk+4eNMwHg2IahhKFLuF2hluykX66Tg
         XDnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FW31PDQc;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-5354083e664sor4707822e87.31.2024.09.04.09.15.54
        (Google Transport Security);
        Wed, 04 Sep 2024 09:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FW31PDQc;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466554; x=1726071354; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        b=FW31PDQcBspGnIp7ianuUO71yCnja2YmYi7Naia/bTwsN91g/6LJDMOw+jF+s61ANa
         U3gmFATsrSA864J//FgeQGAKUUm+oKmMg4XFQSbxpZIEae88fRMX9qTxVyKELDL/0NHa
         0gr7xn13ac/YP8Q722bd3t6maIL4tduV/BdfMSRkp17RGjT4b1uhru17ST55l4S6ttCF
         hkbf/F/yiDpfTaRMP5A13yO03tt9BrMonl8zqaYoY85qvn4Mks/Yz4ahaYaDMo8QrRie
         8zKhPJ/xmm1XbhrBomr64QQ8hKuWBA4nJ0F9R61z5m1dAS9t4Unezp4FssiTN2ILdSsG
         E8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466554; x=1726071354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nym7Vpc1+HcpD0fJwqv749eMWZaaEovUQaBKn9/MOQM=;
        b=ZbukH0l2LcBc/Kws2wc4aoMrkHczVg8y0FSL5WDL/A66BhlSH+2ntnyOGZ+nGwhtZv
         dODJgfjPXN8TY2OywdyiaWr4OgRUg6kd6+5SpgK33CVp4ekzKSrcpPTscM1SyXzvVmNx
         uBIXrrDhB4cNW0zl7p3RJ6xytKOxWlJY1Fpq26kIG9W3H5fNNAyBqNzvPqe9zJbd9sIs
         UF3ko1vnjrfVTEP7oU00bQ9DtcE/HQ6eIBCH7gtaR4h5GGs4f1qVjnjhNKZFiOHw4ibp
         olJyyL/IDRHniZiv/z110DTeBJPC1L3LObjtPGM5zA7CjspP2PpVD1RMhqwD/tWRzH2f
         ejwA==
X-Forwarded-Encrypted: i=1; AJvYcCV3PfnIYAAPkgJxkaHzqwz99DWDZ9EHh8oPURR+2nOGmiadcR50LfjRthrl5qPC3llvjRJRVc87dCj41Q==@linaro.org, AJvYcCVa755cEBZuDu4KrwoSZ/V0MXeMJzOWhxvtv69U6Oop3hZ2VN0tO6ri+q/0wNsOSxn72IuEtHxlp4L0Cs1DIw==@linaro.org
X-Gm-Message-State: AOJu0YzsX5V4IEl/mSaEymPhSze6jyaVVfQIf5hPtBiiJDbnHXxo0ccb
	XO2Lg3F4RP+U6KUHFJljfcHlhQmXlwP3gQ2m1vEF7xyahuBM/EUH
X-Google-Smtp-Source: AGHT+IHdK+MGVaxZaTPG5mtVrOpYHs1uliw2A+U9Y8zDTRSlyKp4eJOx4pA7txuXly/nIFn97leCnQ==
X-Received: by 2002:a05:6512:39d4:b0:530:e228:7799 with SMTP id 2adb3069b0e04-53546bab2e9mr14075298e87.58.1725466553759;
        Wed, 04 Sep 2024 09:15:53 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53569eeb4d9sm143326e87.65.2024.09.04.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 09:15:52 -0700 (PDT)
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
Subject: [PULL v1 08/12] hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
Date: Wed,  4 Sep 2024 18:15:32 +0200
Message-ID: <20240904161537.664189-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: De5As53Qkf2c

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Rename xen_arm.c -> xen-pvh.c to better express that this
is a PVH machine and to align with x86 HVM and future PVH
machine filenames:
hw/i386/xen/xen-hvm.c
hw/i386/xen/xen-pvh.c (in preparation)

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/arm/meson.build              | 2 +-
 hw/arm/{xen_arm.c => xen-pvh.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/arm/{xen_arm.c => xen-pvh.c} (100%)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 074612b40c..4059d0be2e 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -61,7 +61,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-e
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 arm_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-stubs.c',
-  'xen_arm.c',
+  'xen-pvh.c',
 ))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen-pvh.c
similarity index 100%
rename from hw/arm/xen_arm.c
rename to hw/arm/xen-pvh.c
-- 
2.43.0
