Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5197976njc;
        Tue, 27 May 2025 18:48:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcIUulhVh/R3TTv1A31WBqFSA8EohzkXFNC7RHVPvv+1PLPxV81Tqk6em3PIBhaRuXqvm5A7hxvxNLXA==@linaro.org
X-Received: by 2002:a05:6102:3f50:b0:4e2:bae4:200 with SMTP id ada2fe7eead31-4e4241acf01mr12558350137.17.1748396881620;
        Tue, 27 May 2025 18:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748396881; cv=none;
        d=google.com; s=arc-20240605;
        b=gPldwM8fB6Px//Ha4TzLLaWOIDnNYLfeQRJ+pin2NQa6t9mEk+yPZEYTinxwJOmEcA
         vr0JxjJuEd6M8rhhrD2cIvyYfhYoCiEuNdDxjbAw7JrJINvB2wR7UI85UPZqVXquC8qa
         PXOyjHwanBrnTGl4Dxoi8/9uVB2jgpXqmJLiqh8XdqDYh4DAgtMY/SUqcqxdtOXJlanZ
         iC7kpGcAcebQtCwRsx5PgmD7mcUoJxcpZ+vPTiT4XnhLoY2253+iiC1RmYYVnS57568G
         RH2lg47Oa2xOcyaF1dCKaJY9wYKj5rfqoqprZBmImcHTYJlx42DEQ9XUIWSBCqYNllLw
         00jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=5Jh3LV0P6chBScb3dqZwjbGR8+3MCbXx1b+bmGLLAUA=;
        fh=Stgoi/zalPCJl4/Q08mHkUE4Y5tbOVbUq7pi3rcPJqA=;
        b=YR3GrtV8rGyRfywYOr7KqgAbilojwurLx0u0iinGGmlqZ/IVenu4R3cPnUCttOBV/L
         FOIag8grUOmPs9n8ALNjlSnShvO1GbMPwcfUomgHEJ3BTS5smPoscpJAzxcUzZir21n9
         OzIU/pIm+D78RhpOf11eRS32CDWMZRePZo8r8UhytUTiDOoSrUcBLQFIt8a1QJd0g7N6
         VARdzGEkHtKoqGe8AVfVyG4xp/3hvtEzEY3V6uPCi5RtFxIQA7frPsqGiUBgvYiAUsgJ
         fE40uQyYr+jUXc+eX42ig9/G8RrGtMwPoILBw3jJSOwFdtEiRfnHV/30yOhKYbv5ZyOD
         i6Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PlvmZ/5T";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 71dfb90a1353d-52f47c9bb4fsor645577e0c.2.2025.05.27.18.48.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 18:48:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="PlvmZ/5T";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748396881; x=1749001681; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jh3LV0P6chBScb3dqZwjbGR8+3MCbXx1b+bmGLLAUA=;
        b=PlvmZ/5T16+mc1yNDhaiEt+pFPHPN8bHsMzGwF3k2nf/nn/TMxg1d36Xl+F1S5jH/N
         Q55Oa1z8AFx8cmZa++n9QaoHEmTvyrSZuQw+c4jJbMKhOTvW/fEvWaRguyyGeb7Y162A
         ZX8Ah3h4tU+gR/ZURCWOZDs7u6KVAGCjsYCOKnqGayDHIke7hzCEg2pJcuYrDbU8VLG6
         4fyYi97mHaELJrxnfjNKl8jxWwjBa1xKWrKePxahcbuf2G+y/cten/9xZwpeTzKZvrUW
         xuRk1pxhVlX5k/BlRkKPvCHdbb0NXCQjgcvSVXNmVZPZanv+b0axm2Oskj+q5dUEe1FE
         ZD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748396881; x=1749001681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Jh3LV0P6chBScb3dqZwjbGR8+3MCbXx1b+bmGLLAUA=;
        b=nQ09IEvkEWQxz5mSkI6bhtCEyATsF/TnSBflb9w9mVXG9elkAmLy5cUiyqucBztPs7
         HDIud7p94S2Vhs1jnE53WDcW9mENNo+QnM0OPQK15h5/fiJfgYym2RlHeRxvF2VlkWdq
         bPvsE44khSCRBIw0JPnXdrLOn6xmLNLR1b+Iqk64Uc7EXsgU3/H0EAlhjyr1DPmU6Umr
         Ix91eEg9n98bATleEREtFm5bcgdg51Cghi0z6numG059Gvie0viOFrMLtl5c7/fTFq2/
         mzQOyWzpO5s8WeDD6J0fa/D5x/4LssT25dzJXnm9eX6bJ4qwQJx41z+XoxZ6BhsPjtYD
         +MMA==
X-Forwarded-Encrypted: i=1; AJvYcCVHE6bcnCs031hhZ4v29NtGwG3qso1N7RTsYWG0AiQwBUeBnHxw9XkwUq3wD3b1WoQTjY+0c0jBPjSBLw==@linaro.org
X-Gm-Message-State: AOJu0YyuOAHHQyG7BIMp466oXwyHUffgiFm0NfmjmeX8TZqpLj9BrWhw
	6U+xJdk13oW4ZCMbi4sircV3wKRfu9wUNq5AxCCoLH6/PkqKPwDT/z91mVkRVFzY0ujckw==
X-Gm-Gg: ASbGnctAQLX8YtsQb5+eXVoaojoisO3YE+NzJhEOGQeYGktMf7xOhq9XiGfmnNM5kl1
	EooeB8/9uMZxPhJbEwjV5rzpbKt/OpTZNu4GUcdfQklE87WjPEXc5xhVdniThIVQGUTCsfRobAm
	R0lV7vQuzi4HjiaMAxOS7SEfAoUYMUQ2jOmvYssSS5BlPF60gNDOWVCuyYaGmhs62btVkzwNPCh
	RG0nOrrtsvI8dJP9CRqm+ei/ALXufaWHoikawpNbtRxS0iGDTaMsf3Zte+CYbea7uC31+jbWywt
	b9zdckfdo4t6ozA0Bb/3YUneXrgvqsCAHYBEdgJGJZAWWSFsH1FPrHvltt9UVVBl9YLo0/ipIre
	nYLYZnm507cLyWqKW3QQV/A==
X-Google-Smtp-Source: AGHT+IFvnvy+3yHGfVkH7k9UWYyCF2Rink6hR2FqEopqvNUXmxwDcU85Flb2k0l7fQy3Lj35iabhTA==
X-Received: by 2002:a05:6122:82a6:b0:520:5185:1c31 with SMTP id 71dfb90a1353d-52f2c590417mr12109463e0c.9.1748396881160;
        Tue, 27 May 2025 18:48:01 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066945964sm145921e0c.31.2025.05.27.18.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 18:48:00 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: thuth@redhat.com,
	alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH] tests/functional/test_aarch64_hotplug_pci: Update images
Date: Wed, 28 May 2025 01:47:37 +0000
Message-Id: <20250528014737.1630668-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u24vT9gpNKGC

The current links for the Linux and initrd.gz images are not truly
immutable, so let's change them to point to immutable versions, to avoid
having to keep updating their SHAs.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/test_aarch64_hotplug_pci.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
index fa1bb62c8f..2cf5c28b9f 100755
--- a/tests/functional/test_aarch64_hotplug_pci.py
+++ b/tests/functional/test_aarch64_hotplug_pci.py
@@ -19,13 +19,13 @@ class HotplugPCI(LinuxKernelTest):
 
     ASSET_KERNEL = Asset(
         ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
-         'current/images/netboot/debian-installer/arm64/linux'),
-        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
+         '20230607+deb12u11/images/netboot/debian-installer/arm64/linux'),
+         'd92a60392ce1e379ca198a1a820899f8f0d39a62d047c41ab79492f81541a9d9')
 
     ASSET_INITRD = Asset(
         ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
-         'current/images/netboot/debian-installer/arm64/initrd.gz'),
-        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
+         '20230607+deb12u11/images/netboot/debian-installer/arm64/initrd.gz'),
+         '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
 
     def test_hotplug_pci(self):
 
-- 
2.34.1
