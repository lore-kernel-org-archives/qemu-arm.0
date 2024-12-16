Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2204971njb;
        Mon, 16 Dec 2024 06:19:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFiRBplEOUOGsN/w1hDo0XL2XC+7ZEZmxYJvMJkhI8JcRnnsqYygMB86qfd+DpRzX8Ri9yUcMah4woTA==@linaro.org
X-Received: by 2002:a05:6a00:3c81:b0:728:e969:d4ba with SMTP id d2e1a72fcca58-7290c268828mr18520660b3a.22.1734358744224;
        Mon, 16 Dec 2024 06:19:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734358744; cv=none;
        d=google.com; s=arc-20240605;
        b=jY0ktug7FcyMcQOYzXPElnYAl3xD5nb0x0KBFyPtNH/fe1E6Z0kM4lcMw+V5pCuwL5
         TZYr8dtpmvsjZnVi0GLvsFsvbfGi7qk7FYvzzIaUJUoVYFBCuYTJMqjsGm0TI8hH0tqU
         YNbKDDaYO2WJMnWjFKgrHqzyuO+YC00yadYbtSZE74inYfWIYNmnuweirWpaP1fnMGxN
         qCDqp+yCB6G1ot8HadsUeEipw3nmU2HIxWkRIS9a2kEe+mdDofLWL49sjVq4G9KdDm7D
         TwWrItMuqjT2LfNXM/dcqmkdSAHJtB2ZAfZRWGTyeNblgCcG5VaCzPZk9qkyz4yBui5T
         z8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0HQZLxuE4WkAz/upxnqd/naLC4R7g7qP4fmEdN0Xxm8=;
        fh=umBGLbsfK7QsKACvrXWlVjYNOk0niHL1QefS9BOFOsY=;
        b=f+058W4kVK4pG93hvEDtd62YegF3fWkui6mKr39IPq7ZHPn+SzmQXNJVQ8VcZj95Pt
         PDFFAzDDPNCh9YkFl8p1LagBlx+plS4VZSqvmy/aBrOKtfqyww5y8AdEgumb8mw9AR6W
         pbk4uGun+FrUNUKKmZDoUJiyN4AXu3C9fK8Djoe/Pr3FJdIUVsnZ79W4kcSbWE+QPZcU
         tI1Mexz5m5r6HeqC5dWMm9ZjwhiR2MeiNn/o+x2UlFXSicPCxR/6ah23IQInp/m+SC/u
         eG4/zyprStatFLebflnMpWc18dogK/4GR+wA+ccvG74SW5ZgNvfGh8hOhLfBhOm2RBNO
         wInA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MqVO/IFX";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72918ac96e4sor2206771b3a.2.2024.12.16.06.19.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Dec 2024 06:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MqVO/IFX";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358744; x=1734963544; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HQZLxuE4WkAz/upxnqd/naLC4R7g7qP4fmEdN0Xxm8=;
        b=MqVO/IFXlUdzXhyTL1eqHW7RT1HBMIRHJreAamIzhstPXIzF58ox7Cs56K6wRDfF2p
         6fdenhNBYZlJddOWPZT63FKcjdtbYHtKHLBIBfx7p0lyEU+M1mTuetbqsjbANFVOl8Px
         MjxLhlaXO1tvvesR34NMH1uwpJH6zaYoX6FcCqa/xsbDZEWqS2TeX8TjV4q0iWID0Ldq
         hj7E9FlufJb0orQ75oFj9N4i4S9nF5vxCiHFOVhrNelkLpTcRNAKR+ACoHg0hKMd5ry9
         aqw6G1FfXKTkTI4jFSJ5FrBQfcDQsZDN3weq7AoD5XV8+Ug3AFpqIpvSM8Jx27V7GCFP
         WP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358744; x=1734963544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HQZLxuE4WkAz/upxnqd/naLC4R7g7qP4fmEdN0Xxm8=;
        b=egQwPO3qFiDRRQk5Igb4dKDJ1J6kiLVIbQhk8kWXGMF9K1mVdJQ3/uN3Cu+7qHKem5
         1JAcyVu8c9To9OYXvaS35gVPe01pan44uDb8nna4zZQFxJ936KDS6PEnVc9wOomrS+hl
         Km1mzMDDR3jrFcU1Z1ZckVuxEfos+1TYOqRY8pQS54zOevyp3Nw//l4c194LfRiuNzl9
         BJzcTu6G9gnd/hHPhoM5uk3d2VaTF3qsHnK1EWxZeEtnKJGXWW/1tbVfQHV7JKfU5pyv
         knMcBE6z47F0c5jc1Rb2h3vFRfpz1yzs0aQJBWV7Ap+it74n7iUE+v5mixlnicXzlSTA
         nn2g==
X-Forwarded-Encrypted: i=1; AJvYcCVqdfvQgYMciRAedNhQ9oNuG8XkWokYq4bJFZ/9lb2PMkLt3J7kvauobA7XuqjEbqMPTp2SRv4N9C2lxg==@linaro.org
X-Gm-Message-State: AOJu0YweFHSWIhXxAx8btaLseH1R/AY0FCq4TEvLi5DQ+g98gxX/cHs4
	Q7nnUfa0LeLSGl8yZAje/uHyvlqpMt/c8iCSSCgPbmMG7zewFNEzFMypc5w+IyGIuQ==
X-Gm-Gg: ASbGncutZkJbnxec8dPbQhHXNh3/7oRvVizlPM0As9gBUZSfpdzFU2BZoNTK/Gzv75v
	fGfp4I0WvISl6KnzIYuPiy1jxuOePfK+g+09cXL1UQA4XXwwCfzfqOMGyfVthe9+lsZWtT+imjm
	IsNIJIukjW9xZ5vmrE9+MAbeoaYXQIJLvQDGiHW8DPLMpyPmPkm4JDu7mH+WDlYkCNyyOYEh5CT
	yclT0qWGIokZqRSB7WhltdJ/o3Ujw3uS+mIKw1IWtP2Sye28VUlFDmgIQkXGVY=
X-Google-Smtp-Source: AGHT+IHRWlwIJ6YYbgzPlkrSZls2CmBKN59/V5uHJeQwJs/LetMVl3O2riyc8t5uS1xEqQMhJPFkbw==
X-Received: by 2002:a05:6a20:6a11:b0:1e1:a211:bb4b with SMTP id adf61e73a8af0-1e1dfdda89dmr23782802637.31.1734358743818;
        Mon, 16 Dec 2024 06:19:03 -0800 (PST)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([177.189.100.90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bad8acsm4948815b3a.146.2024.12.16.06.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:19:03 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	philmd@linaro.org,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	armbru@redhat.com
Cc: gustavo.romero@linaro.org
Subject: [PATCH v3 4/7] hw/misc/ivshmem: Rename ivshmem to ivshmem-pci
Date: Mon, 16 Dec 2024 14:18:15 +0000
Message-Id: <20241216141818.111255-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216141818.111255-1-gustavo.romero@linaro.org>
References: <20241216141818.111255-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: k2dI1yeor03e

Because now there is also an MMIO ivshmem device (ivshmem-flat.c), and
ivshmem.c is a PCI specific implementation, rename it to ivshmem-pci.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231127052024.435743-5-gustavo.romero@linaro.org>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/misc/{ivshmem.c => ivshmem-pci.c} | 0
 hw/misc/meson.build                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/misc/{ivshmem.c => ivshmem-pci.c} (100%)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem-pci.c
similarity index 100%
rename from hw/misc/ivshmem.c
rename to hw/misc/ivshmem-pci.c
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 7a16ddb1dc..55f493521b 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -38,7 +38,7 @@ system_ss.add(when: 'CONFIG_SIFIVE_U_PRCI', if_true: files('sifive_u_prci.c'))
 subdir('macio')
 
 # ivshmem devices
-system_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
+system_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem-pci.c'))
 system_ss.add(when: 'CONFIG_IVSHMEM_FLAT_DEVICE', if_true: files('ivshmem-flat.c'))
 
 system_ss.add(when: 'CONFIG_ALLWINNER_SRAMC', if_true: files('allwinner-sramc.c'))
-- 
2.34.1
