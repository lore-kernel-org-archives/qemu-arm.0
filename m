Received: by 10.25.0.198 with SMTP id 189csp1191517lfa;
        Sun, 7 May 2017 21:58:15 -0700 (PDT)
X-Received: by 10.237.57.41 with SMTP id l38mr2331077qte.5.1494219494960;
        Sun, 07 May 2017 21:58:14 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id e123si11204889qkd.202.2017.05.07.21.58.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 May 2017 21:58:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id o85so8681362qkh.0;
        Sun, 07 May 2017 21:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+RJHEPBbf3hWEulznwHJKDW2qQFPd7ufWbSGlgpDm/A=;
        b=OkkvQDPRliPxUGDXEdGEapdGb+4AVWwEEYUU3LL+c1NVrSCBbS1z0olal5Nw2Z8jwf
         RUYk+2LnyRe5uIcsTBSweWIMbGLoC6AgpG7JLlAa/k51RZIGPTp1ovhi5W9UJI6FnFhL
         ZqutCqC2quiR/gBb34FuhnEXYKbCm0JsjYIoqCjStRETdmsbetRw3F3c7n0iCg6ZdrOj
         CGgZy898gN3gYOAqqupbhWRZOuK/MY1Syx9CK2XH9GgK7tAS8gb6tlDA9gQCaVLIejqQ
         W6rSjOl5dWVmIgnB/vcA652JPDQrfKkLHtGKrp69oSYXYtOxj/k3XccKbKoBpghtDPSy
         3h7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=+RJHEPBbf3hWEulznwHJKDW2qQFPd7ufWbSGlgpDm/A=;
        b=iDzWM3w2e5md1sB9svb6upyu4w5Q2qHGJWygNm6WUIW/bEUAhtHq92eVrcOF+jDbKr
         EtTcP6cig3891EuXppRA5/KlWQBKf5yufSDoqnwJVLP3Y+u3upj+l0+uCCkjSfIgb6aa
         iNjusFXIqmbykvzVsSYSUXaRaWpU8NC/QTErS3jxSKxA/GEX7wyjYPKceG4wBaba4rMz
         jS8qquYToIW+8X58JmnJwqGVuHP1WRNU9hIBfHaUaxrnE6JDn3fAemTnpRobMHLGwOq7
         BGKNAp8rzjPqa1wdj2c/cQTPwbxeTC5GomGnxJGCsR3q1TWUp2Gn0MeBQHTs88YxVz6Z
         z1bA==
X-Gm-Message-State: AN3rC/5u/xWxKGS+Zf0yMXCg9kjU+43hlAxYRymBv9O9oG0BcNmSu0yZ
	7kghVVdyGFXYnA==
X-Received: by 10.55.31.38 with SMTP id f38mr22402295qkf.267.1494219494651;
        Sun, 07 May 2017 21:58:14 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id m188sm4358549qkc.5.2017.05.07.21.58.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 May 2017 21:58:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 07/23] docker: add extra libs to armhf target to extend codebase coverage
Date: Mon,  8 May 2017 01:56:59 -0300
Message-Id: <20170508045715.21770-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508045715.21770-1-f4bug@amsat.org>
References: <20170508045715.21770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: etDVhSWCdtd2

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-armhf-cross.docker | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 533e525971..01d9fcb7f2 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -14,4 +14,10 @@ RUN dpkg --add-architecture armhf && \
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
 
-RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get build-dep -yy -a armhf qemu
+RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get build-dep -yy -a armhf qemu && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt-get install -y --no-install-recommends \
+        glusterfs-common:armhf \
+        libncursesw5-dev:armhf libnfs-dev:armhf \
+        libbz2-dev:armhf liblzo2-dev:armhf \
+        libsnappy-dev:armhf librdmacm-dev:armhf \
+        libxen-dev:armhf
-- 
2.11.0
