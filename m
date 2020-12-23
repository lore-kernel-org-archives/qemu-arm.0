Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp6266572lfq;
        Tue, 22 Dec 2020 22:26:24 -0800 (PST)
X-Received: by 2002:ac8:71c7:: with SMTP id i7mr23712629qtp.47.1608704784324;
        Tue, 22 Dec 2020 22:26:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608704784; cv=none;
        d=google.com; s=arc-20160816;
        b=fwADpEmQel7zvOsG7KEME13sygvAU9IeB8NBy4DMYRDW2Cvl2miVd2n54kFNoZjuMh
         cq88TaMlhJVqxdsRp3Q6B3ciQiN4xOkNwP4O4eXtKmBXks3mEnSXx9q5lzqCsJSyL3eP
         w6HRm4ZrXfdsc6pn/0kdmDyyqN0MXulM5OW7mk0OOHFMy/1pFa6YEF3/Nmzcactm4Iuq
         AyVXy902Z6gFBHQ4l3y+sKHwdZvKgq0xzGixZ5oS8ZHkSIiuWbvD5mwVt9cTj7ckZvKI
         19oRV/qF6IagtVVcoei4fSuD/E+S5bh10s/es9302LyvSAkIgolY7nLcOssOGPtMmSdA
         n3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=DCIWK+aD2rcUTLX8Xe1vpC8bvXJfU6/9urzDpXpoTaM=;
        b=mwFEOccgNozsH08x5qOX9aT/byGxFgaLxufzTol0NuewlTrJtQCyR9Fc0w+or8yhCK
         +OMIh84Z9bbeIe/yD0/Ey6JpwzRw40FNzIjdXM57DD2szSB6eSQhWIRSz8sjRVSpvBMr
         e9qCd7jsQoEKPYaQm6kpl81iJg1TP9g3g/+ZCoooVod0PdmbVIAHQQQ0S+MkfFwR7aRZ
         PcnMENlXi8iy59ca4JphU7mxPwhEhxaY6B3jToZea5cFBQmTk8fQepyCiUELAChZVFTB
         IPQMAzRB9X2wmPbAL14Nfyy/SWJtV5zThZOayDkNoH6K3s/nAdUwAIgpeQpv/yLq9mtb
         UKqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hTkXtHzc;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a188sor10288118qkd.173.2020.12.22.22.26.24
        (Google Transport Security);
        Tue, 22 Dec 2020 22:26:24 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hTkXtHzc;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DCIWK+aD2rcUTLX8Xe1vpC8bvXJfU6/9urzDpXpoTaM=;
        b=hTkXtHzcgqIcj1Sk2RhZbeu1WiCuNPJ8bzXLA6jWqxibRuMyiLsFp4xzjCmAnjrUdd
         FML7AqN1qgzFEA7H1bpHYYjvrMk953jls6TYeq7QVGV9OkMkZc71wTBE/3YsIDxBDeV/
         c7QE7Qk93EdvumGmldLRKxUHYTI4zcJaINZlUhMG0JyG38h+MucgQuTZDBbbjPiQ5c31
         Z3xhyK2qzysXnWITix3mEg/SoScOiM4Gy8lMpKrCvMowNRoAMmtf/W4FSa/89NvfAqj2
         3tVt44w96XFGe1NSA9cUz8VPquT9YqoofoJx/wL39hbev5sKe1NjvB7omHLYOQjc5ClK
         TUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DCIWK+aD2rcUTLX8Xe1vpC8bvXJfU6/9urzDpXpoTaM=;
        b=naMprRz9p0GGybospT5X208mCmRzMpoIg5Yp8aNFRJKxAAZgP5md9vz1REdyObGf5v
         as6CGlH9o8YVA2PTfSbsqKlHouVOLeW0Azui1iHszZqW/I3hCeXmUvSO4YHjCMtq2WeW
         a+eGOag6OiQrNQuBxDaHRh7T5Gv/tCv1YVxD3P3ZgVUzKICuZAYVZmhFn5LwMfrCKSu9
         nTHnOc8dCKIjQpibZtAKMJ0P4/UhqINf2HxqEnEPFOkBaTuffbpzG/6Bu5FihesfkuhZ
         eRujxZ+9jjCQFDrS6vNBn9zvrGRWhXP/pKzkm6w7ZsNgsRxMKH/K6n6IEsFoLrM5Rj3l
         DD0A==
X-Gm-Message-State: AOAM531F8ZyjRqnQ+Asbt0raOrwDp+UziCJ2bWcwsTAtGxgpkobF+WTs
	NgKGlq0olSLd+Gf60UYU3yU=
X-Google-Smtp-Source: ABdhPJz/yDowmIqzEiXwzLmWrq8V+Pp2snPybwU+AFYDi9hLGU55bXFh6hPKiBPa6qvMyiPQG0gLzw==
X-Received: by 2002:a37:b983:: with SMTP id j125mr13606637qkf.418.1608704784000;
        Tue, 22 Dec 2020 22:26:24 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com. [147.11.124.94])
        by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 22:26:23 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 2/4] hw/msic: imx6_ccm: Correct register value for silicon type
Date: Wed, 23 Dec 2020 14:26:05 +0800
Message-Id: <1608704767-9317-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
X-TUID: W1DqS/DkUFPT

From: Bin Meng <bin.meng@windriver.com>

Currently when U-Boot boots, it prints "??" for i.MX processor:

  CPU:   Freescale i.MX?? rev1.0 at 792 MHz

The register that was used to determine the silicon type is
undocumented in the latest IMX6DQRM (Rev. 6, 05/2020), but we
can refer to get_cpu_rev() in arch/arm/mach-imx/mx6/soc.c in
the U-Boot source codes that USB_ANALOG_DIGPROG is used.

Update its reset value to indicate i.MX6Q.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7e031b6..4c830fd 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -462,7 +462,7 @@ static void imx6_ccm_reset(DeviceState *dev)
     s->analog[USB_ANALOG_USB2_VBUS_DETECT] = 0x00000004;
     s->analog[USB_ANALOG_USB2_CHRG_DETECT] = 0x00000000;
     s->analog[USB_ANALOG_USB2_MISC] = 0x00000002;
-    s->analog[USB_ANALOG_DIGPROG] = 0x00000000;
+    s->analog[USB_ANALOG_DIGPROG] = 0x00630000;
 
     /* all PLLs need to be locked */
     s->analog[CCM_ANALOG_PLL_ARM]   |= CCM_ANALOG_PLL_LOCK;
-- 
2.7.4
