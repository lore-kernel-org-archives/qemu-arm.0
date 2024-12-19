Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1853463njk;
        Thu, 19 Dec 2024 10:32:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5OrQV2t7rbubftwbaeUMbNl22OL4lYePXPRPkYNMIbbYYZG2jz0gzGWcRtkmEQUhQZ+tUzsztdnAaMQ==@linaro.org
X-Received: by 2002:a05:6a21:2d07:b0:1e2:5cf:c8d6 with SMTP id adf61e73a8af0-1e5e080ba76mr151223637.36.1734633137352;
        Thu, 19 Dec 2024 10:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734633137; cv=none;
        d=google.com; s=arc-20240605;
        b=MLaQIosaN7csMrN4gN4DUsMRaXZFT2vUkgePMTaEHgEfmK56MphGcjh1gghfvvJ5RI
         I+v+z5eZc0f+400vbUAvUUzBR6kWSJF5imsxGwNbpKMvs2totYmKyRuPLs8qFzPwHuOS
         GmBSDXMPX4hHWZ6Ic4GDXSRMqMn3mjO1H2135XXomY+oRMQyf8d1/8NzCiw1Gn5+LNeU
         2Wj8dUi6M69D+UnIkRSrI5fDi0oi9/hiO4v5r+M68+Nfg7+MhuPb8g2FK0OuzTMz1chH
         zHRrafCVNNpT6K18Sa3jgmimJ1/ZCkoz+361sJ2b6teottsa6+fjyqASVAymfgeHIetF
         7Hyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VrAuDbFs90HcBriKC3fRwSGZ9LUrKAcdlzz9HBsoE2g=;
        fh=mGt7dSZuieYl6QBkG7TGlHYCRp7UsQ59jTvNIT25X8U=;
        b=L/edYdiJTiTj/2E6BvxjDE0VEQxUA67m7+al2/69H+8bdiLJ2+88RzIlS9/6xJgtsm
         BjJJLGX4ffENCTn1w0pjLazx6joYZPJmONGuq8SCZigJrn0RUbzqXzSZcN08sYMgvsgC
         YW4ZsF4g5+Uz0OGEMMaloc+YrtDMYe7nYq8kXLrYgub1d2yGeqN3bxdcyv6eiw6QVkH7
         ZfR1NC6c7b77c0JxgPkH22hnbMjZZBWYrczAwYbOcF8TdG51Mq6FXyzCKLWTWMnzRxZ7
         CW+ZKyt0WXJCb80irSPOnubaqlcNNudSdFFJ060Mml1aqdwYWmIKVMz/Qi4PYcWyrjfY
         CKXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRyJk+a+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72aad6e4cecsor1059960b3a.0.2024.12.19.10.32.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Dec 2024 10:32:17 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRyJk+a+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734633137; x=1735237937; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrAuDbFs90HcBriKC3fRwSGZ9LUrKAcdlzz9HBsoE2g=;
        b=SRyJk+a+AEZkswm4YCGZPKIRQ+z6pEQb7L68eyKlYxjsJ3AtW0av0XBaUor7hfyMg6
         6JG1ph/5FKtcIFrAEywS79aQBi7tgsS3DRKmJGNC2EZdtA5e06hxwuLXUYCd/Lv/dSOs
         fXjPXIDvMwGOUsHyllrJTu1rlDXtcsvs7uNUu5YpwqUKvBOUNG5pOJ6B7+osQXbx8SCh
         Sek64rPX5TCGKqUzPGIPrdkQvQyGrBlAqt2uO2+yOgXnizvsGUX4BUHUvgsdr/MOiBDE
         XE4frxlDGZWwCudjJQlGu1fcR4C6z13GRMC50R16aiQpgdz0VLgAJIhoXuvWRXGC33/e
         rB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734633137; x=1735237937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrAuDbFs90HcBriKC3fRwSGZ9LUrKAcdlzz9HBsoE2g=;
        b=DqFG++PLxLrfWT180B7gnaCGn9tCsYYKPzVIEx2scO/3voPpRDAvgfzlYXOOeeY9TS
         3bCDSS8IRqzTPccapQK7n3eEuYbEGy18lgs00nWJfB5kd2YSEA0Lr5FsFQ6fY0VHAuVq
         7uLpcS8t2SUUhmS+7nFQrz042skijKdX6jSWaG/6l1FKCOKub5sYtdbCxM0HadXoe4Bo
         uZUuYGfLXKp1Takjr8W6dYBjZyLk5/tMXoQCq/Zbe+MlG3rDWnazQSQEktGORxJgYftr
         BUPVsb4FZx5zcYF09HMFEz0RUpGqCxLe3Cbvb9dGNyLk/HH7f6QMx3xt9c4SkKggonrj
         B9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUpHguEED2F0gAGilhsO5dcpPutpCgWQ58dAACttBx3Brx0JgwdBuHOLtEkkkQWx1+bWCZS+PSEeyuO9Q==@linaro.org
X-Gm-Message-State: AOJu0Ywzwfs8QPc7DU2omLuvlPmu6p1VS/3qDhyTAO64PbumK6wif+hp
	r2TONoefD2+uVG9kCitGths4+45YdBcPWnk0zzHKIlcNVuu9x36R/RMvaprrkeILLg==
X-Gm-Gg: ASbGncs6jzhsT1MoakqQfuFcWDU1D3qV0cpebemlivtVj5RcLMSad8bRFgV4Q0JCLkJ
	fBWcMVvKPl+TXHUMxjYXJuYVOeeRNYxRFfibEE2oMbHRftWsT9GVDtIVapJgbUOQhX0PCmzfZAI
	UyCGalKAMBuePprOfpWvfmVz5lpzEl/9HrqPtQLiPqFXtet6tqnRbUtImF5CKaHZy9B1D5dZz3K
	Zrcd1GOf67hT8NXrPWi0XQGHK7V7H752PSIudf1LfP1UiE+bMUxGSUN
X-Google-Smtp-Source: AGHT+IErQi05wuFbtGW97Qfm0HdyAPfmS5ZIe6ijwUVMBvi4kz/COnJBsO0HHGKLbBRPi5jPh0/OtQ==
X-Received: by 2002:a05:6a00:2189:b0:725:f212:12e5 with SMTP id d2e1a72fcca58-72abb5dcc67mr762718b3a.24.1734633136923;
        Thu, 19 Dec 2024 10:32:16 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90b302sm1624733b3a.175.2024.12.19.10.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 10:32:16 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	alex.bennee@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 3/3] docs/system/arm/virt: mention specific migration information
Date: Thu, 19 Dec 2024 10:32:11 -0800
Message-Id: <20241219183211.3493974-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: zEEogX7uPdR6

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/system/arm/virt.rst | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index d25275c27ce..9f1457cf9a2 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -17,9 +17,17 @@ to have the same behaviour as that of previous QEMU releases, so
 that VM migration will work between QEMU versions. For instance the
 ``virt-5.0`` machine type will behave like the ``virt`` machine from
 the QEMU 5.0 release, and migration should work between ``virt-5.0``
-of the 5.0 release and ``virt-5.0`` of the 5.1 release. Migration
-is not guaranteed to work between different QEMU releases for
-the non-versioned ``virt`` machine type.
+of the 5.0 release and ``virt-5.0`` of the 5.1 release.
+
+When saving a VM using the ``virt`` model, the snapshot is automatically set to
+target the latest ``virt`` versioned model. When loading the VM with a more
+recent QEMU version, you'll need to set machine model to match the version of
+your snapshot. When loading it, QEMU will return an error with the expected
+``virt`` version you should set, so you don't need to record it.
+
+VM migration is not guaranteed when using ``-cpu max``, as features supported
+may change between QEMU versions. To ensure your VM can be migrated, it is
+recommended to use another cpu model instead.
 
 Supported devices
 """""""""""""""""
-- 
2.39.5
