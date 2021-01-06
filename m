Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp600437lfq;
        Tue, 5 Jan 2021 22:35:22 -0800 (PST)
X-Received: by 2002:a17:902:8216:b029:dc:1e79:e74c with SMTP id x22-20020a1709028216b02900dc1e79e74cmr3020388pln.5.1609914921960;
        Tue, 05 Jan 2021 22:35:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609914921; cv=none;
        d=google.com; s=arc-20160816;
        b=ti8DeILbve6FKUHi2sAQ01P1zC9JGw52CAsHyrsFc2sM6vLI5OKtsmA2XkU4Ye0OfQ
         5yy4QY5QEx/wOH4noBrYdFCh0w+TO2C23G8t2WuN5JcrtvEORqJhaHZl8Ja2NwOiA2/o
         6hYqQl9jzs3kXDtAqKJccTMzqmyq9a84m1fO1+quD3Lpk02CJ0/eazwX4q7pGlqdI7K1
         k2rxDFEVAiy8s7QUnEuxScwCPhdUBeNf+BLg5p7Qu2OUOqA0t5OaHVjxqTd+wR8hgeEe
         dO9m4qPPlmJrJxngTZLzvToLrLDUd8vAbH6RxCbKsiedEdJ0cr2f4LnwnU9bT68an5h5
         jocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vUQGbC64bDqMXxpl/W2K5oV7pP0S99JpmeJuH9H8/cc=;
        b=wNJ56sz0csAKas84SMdSVbvivkSQzvRZ6Ll2AtvdCFle7qm5KJ8nMFmBDWhyQnjAoO
         18GiimYyd34DL+APOtu6QWvPPobummCwS4lRT/HSAd0UjNHM5ZY8DnTAkvOkkeZti/mm
         3CLDttV7cwM6EvLaLimZZ6gua1udtSoDpP3kNQUZzB+YMuo/lLqp0lE1U9aNP3w++Y/P
         mpvBNXOU6Jg8Xfme080fsxdolc5hJO9NhyqhZ+hOIN4Nbz0wRwiCiDq3rqdmHp1E9seS
         YeK2WT8ZGtS8gbtWTOISUxeFXgwiKWn8uH8O9J8ldU62BiXAG3trnt/iZzUeLP2W7IIY
         lGqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="kYw4/eTB";
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h5sor629756pfq.50.2021.01.05.22.35.21
        (Google Transport Security);
        Tue, 05 Jan 2021 22:35:21 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="kYw4/eTB";
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vUQGbC64bDqMXxpl/W2K5oV7pP0S99JpmeJuH9H8/cc=;
        b=kYw4/eTB1G6lMgphoYcEdTkE6Y3XhuX7y2Gv1Z79nxdeYmFTIvUx208b6pzhS/G4bM
         K04OygNhrCQ2C6yl/tMkHS5JJVpYjAlP1WmcGP1SSRb0uiGyZi1lS9KtnXMDWQUzC4/p
         xd5ThvHyjBDpLuQALbQdmF2M97VmVQ1HRQz+UmA0oHlLNh7ExzsiNbcSoe4RjN9Kbx7H
         BEUm8sahraxA0dYKZkr+qKxMous7CkYtur+it0qG4PxNQKq3Zi759JkV+426ihXaVvf9
         53J0AaGH7GF1APxwJoQKDV+z4NrI7RrYvBhTsnI2vIAn4v79XvzdJQd1CZa0+lnT56QO
         j10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vUQGbC64bDqMXxpl/W2K5oV7pP0S99JpmeJuH9H8/cc=;
        b=s8Bz4ZXUjDkslfSZDh8RZjQ+d4sCNJT1OprFl9ewP9UIOBj8KLjddkZPR7ZwR4AYAH
         KurBUlQw1+VeBaceq9KMDptTEvfiAtpD7acFcIacv2FL+FaJpi7+6vP59LSWUEaSGJmP
         7tO0eSzBP2HP53FgLNjLn92yqntnnN2yVAe+EwodAXHKWMh0J5HJJ5uGZLLR9BJ8wQWy
         CdMZavy6mNAQKuPb6ENLHN+1Ib5CB1A87WCcnr/DX6MKeN0zGrjwK/ikeW/QB3knwNqz
         GWTFNrKsGhtstATwu61R++rD5OxGNbljr0+RpxUIhpxVbmZz3ueEiXXJF39qpwK4QQmw
         B5ww==
X-Gm-Message-State: AOAM532myWlxAAMb/hF4saEoSsRWLQYOfAZFzxo925NTM/ETtkrl92RW
	9Lod63qSloV1bplbQaipX1xckFF88fw=
X-Google-Smtp-Source: ABdhPJzor6mekBld2kLIpXbxd8gS8ZKt2oH2WYSIzudsMYA3FcnH49deBSZ2z2x5vGQH1RzhRWQL0w==
X-Received: by 2002:a05:6a00:14d1:b029:19d:d135:bacf with SMTP id w17-20020a056a0014d1b029019dd135bacfmr2459792pfu.12.1609914921290;
        Tue, 05 Jan 2021 22:35:21 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 22:35:20 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 2/4] hw/msic: imx6_ccm: Correct register value for silicon type
Date: Wed,  6 Jan 2021 14:35:02 +0800
Message-Id: <20210106063504.10841-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2qNkFdTlio56

From: Bin Meng <bin.meng@windriver.com>

Currently when U-Boot boots, it prints "??" for i.MX processor:

  CPU:   Freescale i.MX?? rev1.0 at 792 MHz

The register that was used to determine the silicon type is
undocumented in the latest IMX6DQRM (Rev. 6, 05/2020), but we
can refer to get_cpu_rev() in arch/arm/mach-imx/mx6/soc.c in
the U-Boot source codes that USB_ANALOG_DIGPROG is used.

Update its reset value to indicate i.MX6Q.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v1)

 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index 7e031b6775..4c830fd89a 100644
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
2.25.1
