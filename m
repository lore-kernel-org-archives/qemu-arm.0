Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4876748njc;
        Tue, 27 May 2025 08:02:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuojvDnDGZZsnc6qs2Wp3Q8dHgXm9HxUwWPGzFAOMPV5zOoO4vgUx4YaP68A73DgZ9HggMIld992lROA==@linaro.org
X-Received: by 2002:a05:620a:f13:b0:7cd:565b:dbd6 with SMTP id af79cd13be357-7ceecbd6c54mr2117801685a.25.1748358170496;
        Tue, 27 May 2025 08:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748358170; cv=none;
        d=google.com; s=arc-20240605;
        b=Fn0pUyzWiAC4T0uuRQtoiPlsVDorjNxGus8Bekk/tfyBnI9Y+pW4Y9W66bbkicnPBB
         IoHlqAJ6ot+XRbvimWvHsgvb5WbnWFgwfh1DHRXe3zWbCUs079Erf/LEie9Q7SI9Cnp2
         zJGg2B40T//rerUuQJeZ+wuNeXCGTf6S77CinxJgljHZYJdvhtWg93rGDCZY0JK0ceT7
         LqcyklVTqOyk3lf2JfZxhZvfEl0z3SbFFy9X1dv4tyxIjQ2UvY9fm1/AFkk5e5lt7tnf
         yQbVwXFDJY4L/6WKC1BK3VFgrgmdhtkl/7R6KodjP4sC9ueD+RYtoxCE25rQZu3OQJgj
         DTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=agFWYYCKCVq6mVFbehNZ8ax/fZ1A0ibvbnP/23upHzI=;
        fh=AVlUxirwdCQX7HpgphAotxL62VYbAsE2q0XEmOBmlSQ=;
        b=IjhQ7FNicX5gKEXs+M072eUJZ2/Ml5II5FGDR7EdjKEdTd6Mlog5QmY54t0Q4LTShM
         bppGvQ5mjc3AH0EVj+zZXW4t3umBB79yAxuWVgtNehBZqFU8iE6WvqhZoH/ZKywiQe07
         wHzcMkCQFUVctQESPfks+X8rEvbbhWoUBeqYqI9a0oRpm0LVZtpy08EK3c8ZxiDXUmvv
         icpYzQ9gm8AGCbUXbw88TEdK7KpQzRbLZ5/2Ibq3/ttLfHMyff95OeEKfeQlc14Rq1Uh
         XhyMTTZjnC/ugFpugaNQ/6bjrwgWoaIkn2XWAoB5yH8+fZVr6ETnKVln859qoP834RmM
         WeKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVrDU6tQ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id ada2fe7eead31-4e459f8b622sor546976137.13.2025.05.27.08.02.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 08:02:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVrDU6tQ;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748358170; x=1748962970; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agFWYYCKCVq6mVFbehNZ8ax/fZ1A0ibvbnP/23upHzI=;
        b=SVrDU6tQxU9hgpFu9FYhIwkZCkad+7uV7FRC4mkmsiaohEyegPYzTGgepe8P0tpV1Q
         WOYIrGMMRy0RH2mhKox4nHWWkbcC9mUZiMIV/trfSQtHgs+OFqQURNg94W0w6ajUJm6H
         B/z7NgiTeMfKD9o7FKXAJjW/ZHTRwS/1v2hfAQM8EGnxmZnnWNkkhOlgtdXisiMLg9GS
         m/LXNUPfxmmx2c5AHl7V8/b0v3OG3JVOIAlO636lDeDltstP9f6OeSnBpgRqY8HJmSDO
         Dk6PrHMibPCDsCWMD11UOAZbOFMBzDQd0O5Cug6eUrBRRvJduK2Firck7RVQvD+bJ1jj
         lglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358170; x=1748962970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agFWYYCKCVq6mVFbehNZ8ax/fZ1A0ibvbnP/23upHzI=;
        b=iVNYX+6DeQRuH8Tmf8PzlldRXL2mB+29dCV8ILP3DgAKx/aLkuMhfS/wwmGlwc2wSB
         szTh9Hdc93lu+YrmgG5Lk/IEihRquV5wgn0wk3Np1sJKIg366dz9Su+zwu72GZirGIUB
         2OdFGHTsAgfU3MoOc7y80cdgsbJ3hr8Xo+TwP4OOCI0sBcAQ5NU3USv+/XicEBe/vpdr
         6sUCBqHF3PGcuwzYV2g4ioHys5UG1BKpMM2ME8R4syasKW3ExxSa2yv6j07UeXECEi5a
         43/jHrOlUcrwB7L8plIqBR/Lg1uiu4yXI7Ot2eWComWFymqJf6N9QxeiyyCv3LPbFEur
         pIpA==
X-Forwarded-Encrypted: i=1; AJvYcCW327HuknzFR6gJDlUQEyIHx311qE2EyaNAdPILLdabhAop+u1g/Q32zz9gsHfjX3pNozEWp4HwBjc1VA==@linaro.org
X-Gm-Message-State: AOJu0YxxF8Dj2DAWlHxwr/llqxL29783vddnGaVs5Arb6gTCpxfJIME5
	H9l7ga7qNMWX3T9ZdhCR7QCtoDac214MF2Om9y6Nr9QB1eut34b5LRQ60WzsRtSiacFcDQ==
X-Gm-Gg: ASbGncuPwmdD5rUy6NRUAgt+7mQ9fsKJr3SZCwQJrdAp9sWywblOLO65kwBnm3VQuS8
	WN3OKR//DEzgyX5JRny8ArTVVWmmXySdYR3T6PEeSSdlTNRqL7YgXhZfZVmaWmsUSk61K7FP+yy
	2dNLLiUQs0OqRtollw/B8MInuTWJkCdXMvyYjf9tZuxnsxGr2vWhJkO0KC5FFbF4ev3nzIB3MzQ
	WzbMU+HuifBTtYtJgXDg8m2s4e4sD0ayRFGYeqdJyFfh49BBQTZ4LX7F50a2HitmEMzaCopdfin
	R3uU4Rsf8Y859d25LBu3YoY5FOj35JxE956Sp1mc6jYX/7lBJ8jLT8H/yup8WZ7RNFAHJBFqyrl
	k8KkyW2yPM4Awb7QdjsTZag==
X-Google-Smtp-Source: AGHT+IFZ72oGyj6zqgb1m6S3CDOn0dykaUi1s3nbhFSi839o4SCP7fdLWsZJM+ZNdDJjfzgl9obcHg==
X-Received: by 2002:a05:6102:370b:b0:4af:c519:4e7f with SMTP id ada2fe7eead31-4e4241af472mr9779721137.18.1748358169635;
        Tue, 27 May 2025 08:02:49 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e51e94c9c2sm2189649137.23.2025.05.27.08.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:02:48 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH 1/2] tests/functional/test_aarch64_hotplug_pci: Update SHA
Date: Tue, 27 May 2025 15:02:28 +0000
Message-Id: <20250527150229.1617074-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527150229.1617074-1-gustavo.romero@linaro.org>
References: <20250527150229.1617074-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: z05cfiSI/9x0

Update SHA for 'linux' and 'initrd.gz' images.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/test_aarch64_hotplug_pci.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
index fa1bb62c8f..bb2c121503 100755
--- a/tests/functional/test_aarch64_hotplug_pci.py
+++ b/tests/functional/test_aarch64_hotplug_pci.py
@@ -20,12 +20,12 @@ class HotplugPCI(LinuxKernelTest):
     ASSET_KERNEL = Asset(
         ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
          'current/images/netboot/debian-installer/arm64/linux'),
-        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
+         'd92a60392ce1e379ca198a1a820899f8f0d39a62d047c41ab79492f81541a9d9')
 
     ASSET_INITRD = Asset(
         ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
          'current/images/netboot/debian-installer/arm64/initrd.gz'),
-        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
+        '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
 
     def test_hotplug_pci(self):
 
-- 
2.34.1
