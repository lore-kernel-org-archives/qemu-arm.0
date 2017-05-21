Received: by 10.103.124.15 with SMTP id x15csp882736vsc;
        Sat, 20 May 2017 20:32:30 -0700 (PDT)
X-Received: by 10.202.104.156 with SMTP id o28mr8212618oik.114.1495337430833;
        Sat, 20 May 2017 20:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495337430; cv=none;
        d=google.com; s=arc-20160816;
        b=z9/oBwOJyDt9O4NaRsvDzWMj7KyuxOk7A3ypt1QNZ+HA3FSzej1hvSJukcDg8S2bv7
         sQSGQyGjlKAf6yH5vzOb5sLvLT9hpLhCTIy6JXvpuKrtl4qatD4y1Uf9X4ruxb1JpPMT
         lGkfZiSmUDsjYFHj2q5OrqszrRXaOQwFowjXxMYJFGMB7Vi0aI/+u4x0ArO4J9QnE88x
         1hqCL0XEBtqPZdHyJ7iVOWyXlIrv+FCQUZn5b/Ennz0PPM5Q8saxxL7Hp31/YsrSAoE+
         pTH5BnjwVeO8uPs14n9jGhUdKtHMqyZNXezY/W7tOUttWeJVozubKYOkzWkT/Y5tPkGH
         XeRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=SSt+e4xTPrTDTy9a2i+BKmXQfJEN+TQTbRk59Y5x3VA=;
        b=eizwUvYPUGsvX0bmtP8ebn9D4i0jAUDWVSs0wv5wpYU2udnz09DAzop3k2KNkQDp9T
         4Wk9HgK0wsJxaDpIt551c3E5Ag+yEJUIGVj23dPUEsiSpk6NeK+0A7MFsdmtaCGTnCx8
         o+nEzUcybFtTDkNhLk0JODsszuhuY17UWwbmpYPn/LnoTB+r1827mRDS8ZYlY9j+EELm
         vEcaolIINToZ59BmP2GI9qzoUI+arLa20PSh8b8GAlrMRbnokgVzJ263e7CyXhVnorzB
         3ZoExocpXe5RITAF78iNO6AxsPRcDIzzfiOrbB2zc0Y726m2nBwfI3a+EKolMV+HoJrV
         ng8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com. [2607:f8b0:4003:c06::241])
        by mx.google.com with ESMTPS id m73si4139541oik.53.2017.05.20.20.30.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) client-ip=2607:f8b0:4003:c06::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x241.google.com with SMTP id w138so18047637oiw.3;
        Sat, 20 May 2017 20:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SSt+e4xTPrTDTy9a2i+BKmXQfJEN+TQTbRk59Y5x3VA=;
        b=GqzZAjpEKyDeFMtY1uMeFos2qlblLS6NuS9zF7uktRTtFh4uHFGTRs/immZi6Ogywd
         3MYRy5jfiVMUNc8N7fYS7JSBhbrTUgSjGCqqgWy75X6ECRdGypvOgcK7etrjjtXQCFXL
         973jNcEbykfq/DUeVm91uLIT5l4blc72T0DizzGrYJMc/S5Gu5V1EI+V+RAgjeUSJyt4
         m7O/FVJYelgjkCriXZqIqoKJYnz8g8LwT2iKc4QY55wvPCGk6KBSWG6ZItMDcpECp1Hb
         ZzPl7pAwGKvgx6GFWDIibFXKJGK5Rc7SNzk7AOe9DvTODrO4mj6dT7HNBadE54Ggcry9
         D+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=SSt+e4xTPrTDTy9a2i+BKmXQfJEN+TQTbRk59Y5x3VA=;
        b=ZMevlrX4LepyaBeuiDY9TSD+rZpYQAS9H6imk7r3i7di601fQdCJN+p8VK1adtbOjU
         GDC0Ah5A8zjbUYu8zYOK5A/Xf53kv/yNLUzpZCIVfP/hKOPEs3aJNHheMGWe1UlwmqB2
         97xOhi/rXIiXpfsFDSkIURPnlVkBziF4g8CA/413MQ0eI+j58oVkZt5N5kIprSV5G0aL
         I3Z5MCWZH7+g3riaWeDJOA/KfvQfC+TKV+5d9cgOnPC/xLW6ZYmZra6Ysw6IZ6R8Rr0H
         Tsrx5ESF9jWGQLaaqBhWxml1ZBiPpJANUM3+U7vGH/K3urNW9rTe5HlMj7XFEX7Bk7UN
         wycw==
X-Gm-Message-State: AODbwcDEH7HhTFbNumIEd6fx1pMF2MrKDGgiLymMX/+ZMlJt6jd2UdJB
	+p6pRfViA7q/EA==
X-Received: by 10.157.37.172 with SMTP id q41mr8440216ota.213.1495337430487;
        Sat, 20 May 2017 20:30:30 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id u23sm6499219otg.31.2017.05.20.20.30.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 10/24] docker: use eatmydata in debian arm64 image
Date: Sun, 21 May 2017 00:29:42 -0300
Message-Id: <20170521032956.27446-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170521032956.27446-1-f4bug@amsat.org>
References: <20170521032956.27446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: naO/7i2PVqpy

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-arm64-cross.docker | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 592b5d7055..f3db7f4f55 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -8,8 +8,11 @@ FROM qemu:debian
 # Add the foreign architecture we want and install dependencies
 RUN dpkg --add-architecture arm64
 RUN apt update
-RUN apt install -yy crossbuild-essential-arm64
-RUN apt-get build-dep -yy -a arm64 qemu
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        crossbuild-essential-arm64
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get build-dep -yy -a arm64 qemu
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
-- 
2.11.0
