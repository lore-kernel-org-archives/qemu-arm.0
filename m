Received: by 10.25.0.198 with SMTP id 189csp1568929lfa;
        Mon, 8 May 2017 15:18:26 -0700 (PDT)
X-Received: by 10.55.90.2 with SMTP id o2mr29031743qkb.251.1494281906858;
        Mon, 08 May 2017 15:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494281906; cv=none;
        d=google.com; s=arc-20160816;
        b=QvkxZmx19QYOImmcOsNIHNEE+K4Puq9MQt0bshAlFwhS+YmW8uS4JjPjMWi6yw75Bx
         FXCE03d7jL4k13KAQEfnAUOGp+YsasLJy6YC3IpXFTwVqEbkpR4xBZRgSDAcOUHNhHtD
         lZr9gLkFyIO0l64K7TvmYoF3AzBQ5pAug+wkHL+nNqMBRS0TDankamIKg9PB2S3xS3+m
         Sbcyl2zm8X42/TQKBhSq47QLfW4jx230rBooGttUP1qr8yMgxvF4tLEU12RZy7keRQwe
         74y2/Dh72jancTtLjhM50SeCVmCiuPj3/059FqaraEvcn8Kb03lds5pAnxygYwNSqttd
         VipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=OWQ21K7rPF2QixI26gHJN2iZ/ErYgXaZUgsuB2jgmF0=;
        b=SxFu15Wg0Msrc0IXu1oabVcd8WW3q9/htSHSDFW59QSEgxzpcIvU4JWa6HYv7d7b4b
         d3wUJQOFsZlhx21LUmWZFSUz4h6RaFj19zYV/vmdNU7HYVcdDQTzg15XIDJPRM3Zj5bY
         T1ovfmgCMbzneewXhePaAKAlRXM7i6nsTzAeZHIHCugw0068RdCX6oTcP42q9tldUtRg
         VkO2ARyrjeiELqhydvIzEnEHPqP6+jpfvGtddyaBQEos4i8UA33nw24uAfUSrkE6jkWL
         RNGmmKtBD0mD3kLek9bRMw5kwHr8zDBioBV2MT30L42oEjwxvuUQTi0mmIbOLErAztqu
         8m9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id h132si14744822qka.56.2017.05.08.15.18.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id a46so11472141qte.0;
        Mon, 08 May 2017 15:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OWQ21K7rPF2QixI26gHJN2iZ/ErYgXaZUgsuB2jgmF0=;
        b=e4IhsxXWWvFxTUfSZHlzs3pvfMOjcUvOGCZObdXb5uModJr/iKdezpt3iDpWkFtIpt
         qjw/y4SfCPkiydKbaHpL6ejgV63y4ncjLYtsE8vsjDfHJ6tidrFSr2hXahenrt4o9qSF
         Al6i/+V8FAcxE16eaaV2sN60g/ZCVLMaaDVO5Z1jxdZ0NgLwHsKOaqRlH71AbSeFUcf4
         M1Cf7zfEvmHYtV7AODmHUw3J0YQgtW696MNSEDhcz7bMj6q5Ae/JTCuBmLQS89Uh+XzH
         fwb/JAIShcW7HjOhYC9c7kBOkJSjvQKKnPq8CkWFLkB47qWNmnKIq7YUhLGQtbXZ+IHv
         r1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=OWQ21K7rPF2QixI26gHJN2iZ/ErYgXaZUgsuB2jgmF0=;
        b=Utl/7oVplzGzCgksjuMr0RWKuCngsBp9uwhhXCnFgDC96+4aLiGBGWFanoWIXkdJ5R
         +bAU5tyGa0jg5egyxPNSy9mdpIpSCRVxzvGYOpW3TpN0lQ2NKAhQd9CBZ1UEIxb1bK3V
         AUBXQ6CZulzfmscfKj5+mypXOxV20oc3eRtRH/R2gLwiNf3HX4FizRCGKVzi3yGvqtfj
         E5uqI3cxkAewO80wcRmVmScY9PCT/EQsHqETq3OZRCFRCENyB3zznQuDKBMhUjuv/RMZ
         KihlMSthS5+iTyrjufe5sUj5GZluF/b6wTf+fJ6KY2NVgCg1734NLXUgdeY01X04rRcE
         sOCw==
X-Gm-Message-State: AODbwcCTbP1Kerdu2lsknBU+C4/1eQo+24Vya1ST264/A1r39Dl41Xmo
	n6gKKMlMz9dR8g==
X-Received: by 10.200.55.193 with SMTP id e1mr8827798qtc.198.1494281906462;
        Mon, 08 May 2017 15:18:26 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id k65sm10157286qkf.18.2017.05.08.15.18.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:25 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 06/21] docker: compact debian armhf
Date: Mon,  8 May 2017 19:17:44 -0300
Message-Id: <20170508221759.15616-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508221759.15616-1-f4bug@amsat.org>
References: <20170508221759.15616-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lFLG/eK0v/io

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-armhf-cross.docker | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 668d60aeb3..533e525971 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -6,10 +6,12 @@
 FROM qemu:debian
 
 # Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture armhf
-RUN apt update
-RUN apt install -yy crossbuild-essential-armhf
-RUN apt-get build-dep -yy -a armhf qemu
+RUN dpkg --add-architecture armhf && \
+    apt-get update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt-get install -y --no-install-recommends \
+        crossbuild-essential-armhf
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get build-dep -yy -a armhf qemu
-- 
2.11.0
