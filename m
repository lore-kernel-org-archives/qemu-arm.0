Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp768363njh;
        Mon, 12 Aug 2024 06:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2LyoASri1xBZygF7KovrckgyGXddwAvJHc7X/siwelX6MT68tBwyVKUC9FdvvRgjsfbwuBsM5xcHVcdD+lx4a+pSPvtGn
X-Received: by 2002:a2e:a550:0:b0:2ef:208f:9ec0 with SMTP id 38308e7fff4ca-2f2b714d4acmr2185491fa.14.1723467986577;
        Mon, 12 Aug 2024 06:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723467986; cv=none;
        d=google.com; s=arc-20160816;
        b=DjCiT7eatWeZPcPAuh1mQhq+A9SNH1NuckAGCDOUw45rnRQMsSKv/WYJ9o/sjLpgPL
         uJRWVW5cHw0VLOljJ78NSJ3xc0b4XGbWtHFT2aWLQyqbAfNPQxGinxUGjG5ImfPgILN/
         x0kUIec8dzTteraqGJ9OxuDiZ0RkYvVc9uSKoS93pNNwfd2J2Czc9n0orm6akEGA8tq8
         hfZgRYMxJYwtVrNuS3pK41nUsFpVexSL8Xrz2W71wyMBgjgw2df0/GJfs1j6wYrxbu5y
         xRFJFZYs6g3VRVHIRKEGQJe+DaLpoGRCLocMxMVz0vy+jitqA4y6nJlOx0zmKEzK619O
         41OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KTEAe/pOjkrnvyxDHYihrpK7ln2+IQNSmZ/kBKccldI=;
        fh=6R6BkcmDQCMJliYwtU2UkIXTyVZWgrIA6WEuR7IoFlI=;
        b=CpwwOcrk305U1ValzAUWcZvpXnLz4nnovxE79O2uyRaYMy9uCAKTiiS+ywdX/iR83T
         IlULTnxD6x93Td7y07iMEGE3/5G6QUISWaBmo4ChV+byayXmqZJOl9V2oxidlQiJdUFJ
         ZpHFJKQsiYmqTntj8eDIizSSHmkSitj+bqxQAfRdgeyy71CYYqhbN/+G3gddhSUlrkyr
         LmgjgiWFb3wL4B1L6tx2rHvz1qowKjVlaUwwe/7UiFu/a7W2q58hXSTclMHG185GOOWG
         gub1RUBV+ByrLwV7OYvF4qmvlVzxzprDZ41FUHUR1HFJbZlfUaSW3QimJ3pOSXgpJKTQ
         ZpXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6uwk63T;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2f2a294c394sor7444981fa.3.2024.08.12.06.06.26
        (Google Transport Security);
        Mon, 12 Aug 2024 06:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=U6uwk63T;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467986; x=1724072786; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTEAe/pOjkrnvyxDHYihrpK7ln2+IQNSmZ/kBKccldI=;
        b=U6uwk63TsJePVPaXJszFDf3CPuS9N3RFX1rhmT25/eLy2tN396OiKLx0BFIF0R1bDF
         VYTUVBFg680LXFuCDHIqFtUod87oO0XCkpBuCBXwmdzwXITE9fP3o3iueqB5K2t4Wr9t
         NqxDcRhr7vXshkIaMw+a1c1UzZy5kVoXxm/H/DiW59KJJoYHWv7+qsOp2n7ZtI4f6wkZ
         INxYDX5SFX4M7wPM6gGQYymnP5lKnipX3MHtmgblqyz4bWc57Gk8Shka2kX2d0D4OrXT
         KRXJ0Dg4/pYJp5EmM5GgoRIwnnlJLVlLhpj4tI81kW8zkqxwEXLamMKLxj97Xk6tJBKA
         AyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467986; x=1724072786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTEAe/pOjkrnvyxDHYihrpK7ln2+IQNSmZ/kBKccldI=;
        b=Jv3f7nMkRMXdXnaql90xNZjbb4NKv7gdphAz5Zp2yyRQ/zyV6mpHz3u45EoSLWIHg6
         lLPrgsmdXQLey6FjN+aXBgqr90URtPqDxkZZPwqM8Ub2ihH5G0h+zJU+xfBEXO2lwIn9
         YdUT4c8LQzEOskPBM5iWKUXe9/YXVy0UlJxF+w3nhHgY2QWaKrHs7ProPWzDUqetepmt
         RPtXbLr6WuT/QhH/3iiz8Xb35H5KNTTuzyzKC1Rhsd7G71G+7/dFDg4iNWvirDxXGnYD
         n+lDXnFgwO70HMQ0M6jLP92gVSnhhgjotjLPHB3kqWGwBRu9CLxqECvGXM62/JhTVE/Y
         YETw==
X-Forwarded-Encrypted: i=1; AJvYcCUFJ4Z+4inALqTzjRzTBTp4QKqLjMgIFsqOJY2McnunoEnLdopVXfT5rqLtF9d3nK2SP1liuqpdxBi0ejI3+mZIEDRxeLCxekxThdA8k/MzwX1MO/XKdecmhMjgQ9znbNQ=
X-Gm-Message-State: AOJu0YxUxhhYifs1pFweoh44Zf0O1Kexp8FyyWWRsXGwfMjTJrtodx9i
	eHKOgq1btidst/bbObrzPvEXoZrGT/swvT3JAQ3u8pPP4o97393+
X-Google-Smtp-Source: AGHT+IH0EXdKyQvoxf37ygreO5y2jLBKuw9Hze8ISbhMj2e1iAgBShVHSABDPv6QJ/gpCgSqjwyxEQ==
X-Received: by 2002:a05:651c:507:b0:2ef:2c86:4d43 with SMTP id 38308e7fff4ca-2f2b714656amr1654731fa.3.1723467985346;
        Mon, 12 Aug 2024 06:06:25 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f2920525b7sm8607681fa.121.2024.08.12.06.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 06:06:24 -0700 (PDT)
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
Subject: [PATCH v1 06/10] hw/arm: xenpvh: Rename xen_arm.c -> xen-pvh.c
Date: Mon, 12 Aug 2024 15:06:01 +0200
Message-ID: <20240812130606.90410-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8dwgzGyWSqZo

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Rename xen_arm.c -> xen-pvh.c to better express that this
is a PVH machine and to align with x86 HVM and future PVH
machine filenames:
hw/i386/xen/xen-hvm.c
hw/i386/xen/xen-pvh.c (in preparation)

No functional changes.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/meson.build              | 2 +-
 hw/arm/{xen_arm.c => xen-pvh.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/arm/{xen_arm.c => xen-pvh.c} (100%)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 0c07ab522f..769fe9ec1a 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -59,7 +59,7 @@ arm_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 arm_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
-arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen_arm.c'))
+arm_ss.add(when: 'CONFIG_XEN', if_true: files('xen-pvh.c'))
 
 system_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 system_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
diff --git a/hw/arm/xen_arm.c b/hw/arm/xen-pvh.c
similarity index 100%
rename from hw/arm/xen_arm.c
rename to hw/arm/xen-pvh.c
-- 
2.43.0
