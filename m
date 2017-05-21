Received: by 10.25.0.6 with SMTP id 6csp871685lfa;
        Sat, 20 May 2017 20:30:29 -0700 (PDT)
X-Received: by 10.157.20.182 with SMTP id d51mr9239544ote.238.1495337429564;
        Sat, 20 May 2017 20:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495337429; cv=none;
        d=google.com; s=arc-20160816;
        b=kgnCXA5YBxEgwCDRJqazFhlSjKHBX62gy9HqKBcOfWW2Ha4rvA4l6IbD/wQQ9Uk0Af
         tZd46zcKNlav0ZeADuIuINsqUHdDsy1jgRk4tRVRw8o48Mrk/Z0+6jsSnVeM8CT7FmeY
         N0SeeF03kPDziO178T2qbOB0oeXkV3q8JCBOW754e/Jfyj5BV72tP8E0wqRLrIvFXfC3
         zGgVLSC4wmi5k5lu+8/2GFR7k60zpEUxEHp7mZEJOwh9oCm+aRzd8cHEH13ifKJODZrD
         iPOUQwaRe/jpJv5GorN/NzHCRtWILM/lwVWfXVJOalI9Je+S37DwlfyrnoVAOtCl38B1
         mymg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=BoVGRIHpzUQ4I2bSoTA0I0RghcLov/f9taBy/QCa1LU=;
        b=UD7kXj9on3B+1MKwKAfGxKDqjww+947H/xuQR1OvzZ6YjFmymHdThAKW8bVXO0JzTn
         m0bHzew0e2M5TOr/7k3pEOYAJ9kurbctGWvIwQeSe8+eaVOufgIebmCcKKDbagUUFm5Z
         6SHnF3BVakPzmw9N36P1e7Kf58lxvtQDgOA3Mzo4Byqa6IQbSVpnM3x2Kb4AogzuVM/w
         y7KK9Y64bix7SNGO2QFyaDR34DVHf+A9v58OSxbb/Mwvwd7OOWmAOQnpSfbn06zBhhiQ
         +EHlDQqLjdTeUfdq4BZIAyEq2PZvSVc2JKrprCJ1p0Z/dyMR4izohGi3KqYxNBXfdlhV
         Rw8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com. [2607:f8b0:4003:c06::243])
        by mx.google.com with ESMTPS id a24si5696622ote.254.2017.05.20.20.30.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) client-ip=2607:f8b0:4003:c06::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x243.google.com with SMTP id w138so18047588oiw.3;
        Sat, 20 May 2017 20:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BoVGRIHpzUQ4I2bSoTA0I0RghcLov/f9taBy/QCa1LU=;
        b=tU6G5mX6/0F25jh//Yg5k0I1bz3HRZ2unSHhCUu6hEZZbCXU0xWfYCVn13ykQxniYI
         u95QkPtgcCbC7qWatwSgRtNQwGj313gdZRf9BsSw4Jq63qu7PYXdbzx/eYZ4VnjhVOMd
         D5DYT10zlg5/ZG4yvai9rVtUlxdjGcYjh0wyWO4Us5x8dDXJt2u/KKX0fr5UZGIjrsQt
         WUxUvkUl5lqrw7LoxualLyC0rv2SQ6aCkG2GScabeCayCgib8MtTt40PiwjD0t+JTnXe
         DfotwFlXlzIinZirHAT6Dt5dyTOTt6KZ3yBN3EowjfErBfqF0oEUZdToF6vkNi8vVLvb
         2MwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BoVGRIHpzUQ4I2bSoTA0I0RghcLov/f9taBy/QCa1LU=;
        b=Iv+J468aYTCvKxWZWbJKyZOX2NO2vzO6qY0tp75yQrY7mOTdGjmP7Y+5LXgZZcA++Q
         kWKB6gGSuma0YBRZ+olQjSuAO8+E2aFRQUHtAOhUZWn9aXLYDT2jUQHYWdlctSVwdhz9
         l7jI7afM0O6ftb6qP7JnSPPfQ40uaC2WLQzltj8IjTSQLQ2foWknrm7eyxZEYquf7evy
         8w5cHelh3eUeiuVSofLwxm1T3cvMcb9x9kI3yiknSeEm71tr7Kfyy2K2guIYTyXzGUyX
         /bjyTtddJzIDilmokHK3iT0OP+EqKdtaz4jcmjN8yeTkWSncmMJNaP8vkK006B/1VzIk
         C0Dw==
X-Gm-Message-State: AODbwcA4TLLmqRXW4CAC1ZSTy1BpWv3YdeiycxHbnID0aRS30XGXe0Cm
	NMmlStRsq5o8jg==
X-Received: by 10.157.20.182 with SMTP id d51mr9239539ote.238.1495337429229;
        Sat, 20 May 2017 20:30:29 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id u23sm6499219otg.31.2017.05.20.20.30.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 09/24] docker: use eatmydata in debian armhf image
Date: Sun, 21 May 2017 00:29:41 -0300
Message-Id: <20170521032956.27446-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170521032956.27446-1-f4bug@amsat.org>
References: <20170521032956.27446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z0AYKyenjRty

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-armhf-cross.docker | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index 668d60aeb3..ba8d5a5167 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -8,8 +8,11 @@ FROM qemu:debian
 # Add the foreign architecture we want and install dependencies
 RUN dpkg --add-architecture armhf
 RUN apt update
-RUN apt install -yy crossbuild-essential-armhf
-RUN apt-get build-dep -yy -a armhf qemu
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        crossbuild-essential-armhf
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get build-dep -yy -a armhf qemu
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
-- 
2.11.0
