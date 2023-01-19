Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp433451ejc;
        Thu, 19 Jan 2023 07:56:49 -0800 (PST)
X-Received: by 2002:a05:600c:13c8:b0:3db:3e8:feca with SMTP id e8-20020a05600c13c800b003db03e8fecamr11219677wmg.15.1674143808931;
        Thu, 19 Jan 2023 07:56:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674143808; cv=none;
        d=google.com; s=arc-20160816;
        b=qkoWT8nuH1hXvVveCEZkjdJebrXVp7kmuNWwmfEeINdEXDgaR4jCY3DRg2nPdE6Izm
         65dCSTlZKEEm2Y3rBLP7ZyJt6aNGlIlk9bVUMKQjptKAznsegrODrn/3IrW22+va0i76
         ggR2vMgNtjHioMNGNPRRsmkW/kJ6LCy6yfkS940ihnP3xBXNK2iZhTXbbWzdznRvQrCn
         zAZea6JwWoxq3fm0AE4Vs8n2dcGI8OdJ9ZF52zDoM332kbwPT7hoHMhYBaRaZiXbXAPD
         /3yJC8h6Typ4H6ZcPyRLAXQpnHWpy2AHl4EqFEnpGRjhAmW3NR/2S5nsUj83ukYyY74N
         7nOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=RDIna7ij6Yf0MB04RDYvi8Fx5L9kaw5DJw8yW2vb+7k=;
        b=SVUU0W0icQ0Sp/XQyz2E6tqFCdr2vkUReeYuA/tIyxN7b8mqGsMfcfjJboaIb+OOx2
         sRFfMXHhMoIGriMutQCtglNSgVgFQaFbqcf1NrFI6OxN/0H/Q+1MHlHv/V7IPbIeARmp
         54pnZJgvglC+zOW63dVCYVhmoqUxwLiuySTLnZapNoaRTc1PoV/1WZy27d5CXSmtJDkw
         8KkGhd+//LZLxz5Sub88GEbnsalLGFkj4lpL4D7SQJS2RTSUeSMNMbVe8ExT0H0zlGkg
         4XRyDCWMN82vUGOgRZMtqsmw/zTWaBBQjCSVZXzu01vVqdeX1Iy/TRZlLXcEDo0sqGry
         ZXew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zQdin/zQ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k16-20020a7bc410000000b003d065dcae25sor1907393wmi.13.2023.01.19.07.56.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 07:56:48 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zQdin/zQ";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDIna7ij6Yf0MB04RDYvi8Fx5L9kaw5DJw8yW2vb+7k=;
        b=zQdin/zQCGIJIfDAibCSKu8mQ80KJpjd46fnMOUvDueccWY1VB6jTrtaYuSkaIMzFu
         qcMCVVPoOzI9Y2G7VKoDzUs0ip8gg/BaELPM4+rK5EV/HBjyM7xrEtatI2bNPSSdn7bK
         2Ts/V1rk+LjXwuD4whk2PKvyD9QCVfZEvLmcHv8oRk0b1uN+MtrMV9JGfsHdEEN4sHuF
         2x9a25DjFS8avkf7+1iUhMag0Mkg5uG3krEDqIYnJLgpD7mAaO5siaAm+EI1lgZnyIfO
         C0myedUfxRJwZAFZT+gHQ7sSSKD3d3ldCoXH4tzYWu1ykaeX9wccv8j3ZirwogLdk1fE
         f+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDIna7ij6Yf0MB04RDYvi8Fx5L9kaw5DJw8yW2vb+7k=;
        b=Xmml9xVfPQamVpe8SVvjkIQiFOGUo6jiWOpZBkl7MoVn9Popt7nqzFCanBRhetOESz
         M290DuTD5Otmbuaq/EgoPLUBW5wXMf+v/783deaqYDBd58BmbQckrPxHtX2x01vvyjyB
         EdyvyiJl/gXUFEhjVd7ltqtBn/uMtlFYx0XMjGmOc80ihHXJO9TRGr14N0l/2qaAUKaO
         LzZA5n/BYUGBLiIZMg0cqCKJUiqPUHpMHl+ZsX6YjOMpwj4/ONch4P+7lokGXAdN9CY/
         Y4fwTZFA/cF+LmmyliQwV28nCh0h/Yf0jzi/g0k9A0waCJoaVCig6Gu4pTPKZFK5B9l3
         jaGQ==
X-Gm-Message-State: AFqh2koKAgUiZ2VaeJAjEeiwt8vBlNHem5g5GJnpUvqTvBbZ209+Hohn
	S60YtfCuy3Z+8BRpd44tdZnh13OZ
X-Google-Smtp-Source: AMrXdXsDDrhPShVkdnN7O/JpBoVRBMZL/0Ezpo/cpyxujxJa2rg93DdK0wgwJP0l7Q+k6kB1SotQKw==
X-Received: by 2002:a05:600c:331d:b0:3d3:591a:bfda with SMTP id q29-20020a05600c331d00b003d3591abfdamr19289005wmp.27.1674143808709;
        Thu, 19 Jan 2023 07:56:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003db00747fdesm5307957wmo.15.2023.01.19.07.56.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jan 2023 07:56:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org
Subject: [PATCH] gitlab-ci: Check building KVM-only aarch64 target
Date: Thu, 19 Jan 2023 16:56:46 +0100
Message-Id: <20230119155646.50503-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: joQ0TOShYyAZ

gitlab-ci: Add KVM-only aarch64 cross-build job

Add a new job to cross-build the aarch64 target with
only the KVM accelerator enabled (in particular, no TCG).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20230118193518.26433-1-farosas@suse.de>
          target/arm: CONFIG_TCG=n part 1

Successful job:
  https://gitlab.com/philmd/qemu/-/jobs/3630178191
  Duration: 15 minutes 25 seconds
---
 .gitlab-ci.d/crossbuilds.yml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 8dbbb8f881..fc78d36b31 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -210,3 +210,12 @@ cross-arm64-xen-only:
     IMAGE: debian-arm64-cross
     ACCEL: xen
     EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+cross-arm64-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: arm64-debian-cross-container
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-xen --without-default-devices
-- 
2.38.1
