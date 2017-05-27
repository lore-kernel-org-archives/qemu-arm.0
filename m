Received: by 10.25.0.6 with SMTP id 6csp766079lfa;
        Sat, 27 May 2017 09:18:46 -0700 (PDT)
X-Received: by 10.202.108.15 with SMTP id h15mr3076723oic.3.1495901926349;
        Sat, 27 May 2017 09:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495901926; cv=none;
        d=google.com; s=arc-20160816;
        b=jhWFgrGD/a1jZm9qOAKjOwcqx+Fs4rh9vKV9AATZLi2lAAorHz+4E6aqpmpJnjpc5d
         TTNizVM1KnuIZcqlyRWvfB1gVhYMluc3meOPCAUjtJyvZtYX2KCKbdb61NkwLfKHh5bh
         3712NSaQx0qbsoB5Zq0BK51PqxDmgmZmJfgylcyar7VuD9Plt86tRx3HBi01jw5wWS5T
         JQ/6/aa6qCPleI3yuq679crLt2qzkmMopjAwD2XFX/iJfLH6fhyblwnRggWqHxoOMOHB
         DasdA3SdI0m1H7pB8lZtAK2nrov7gj6L2CxOnnA9wgUTgpO92sx3YQAq8FNXnKB93STw
         xo1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=0cVv2qLYfQ6NyoPESo20qxxLLIpdfhIZxhlh1XqTQmM=;
        b=cvwYMmHhTykTyJa1baD65CV+5QiXYUG82M8hWs6DpN+ESyWpuOsmYGcdzUzOWAysfi
         kd7RxztXG7/hxL76YlJ6qySWeNmpwLi0sE3C77EqFqAGw24PuM/dbBVUBpk10FVzmlEX
         XBrO7Sa3LAuSsP6WMjlGo3fd6b9YYb+0VWv8WoOPR4NsQCkjulvfeRHDcQvkfIbgvzT0
         F32SwfqCp7rWYr1tRbJkPaRpkL4bnxe2Z+lBAxXAezFFOCDdF+76RC8J88GuP9BirQ6j
         tLPzc+6PN+CKr73JruiM3ypatpLe8iSu3FFmYH6HcH6akSEybzGB73GFvf/An57sYIgc
         PfbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com. [2607:f8b0:4003:c06::244])
        by mx.google.com with ESMTPS id w197si1709448oif.291.2017.05.27.09.18.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) client-ip=2607:f8b0:4003:c06::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x244.google.com with SMTP id w138so6020338oiw.3;
        Sat, 27 May 2017 09:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0cVv2qLYfQ6NyoPESo20qxxLLIpdfhIZxhlh1XqTQmM=;
        b=MMY1FisIlcvbrt4rRdPHnOKT1WcZqgS8WPIu8efOK56i1GaFfJDU/8EB9SJEDLzoBY
         Yj4w1tqFV8hoo52rJMzKuXpO5FaUdV5Vikq1CxTg20oTHIaqft7Hp8J93RniLdMfh1O6
         LvBfJVn1h5T7SeggP0f8Vjci/LbYvhiXTF9xTbmi/+C2KVgz5XSiLRnyPKwNonddcYnu
         ga8N/YnUbRPTGYTJ721t0DIErcf1I7eSpQ/kZvVOhaJH5B+p6uqnbmpCMQih1tAjct/J
         fCK/bzJh8HgJYj9vAQfZACEIU9FKBZmd5dNqPkCathqYid2jUEGOEtm0d461CMo8vFx9
         KcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=0cVv2qLYfQ6NyoPESo20qxxLLIpdfhIZxhlh1XqTQmM=;
        b=h9lkq1w3PlMRwg6tBfcgbBGdzwj+TUuy2Hmu8AJwBH/Ja+gMC5yS3dJihAPf1cWX/T
         9xHuxx2yQ9+j//yPmKPTUM0cGg+Q8Sdb5LXZPcAcHmTv98zTCiXw/kHHj+We56qa+PV+
         JbfuU0d3Hjlqootn1jj+LmjmYAQoGKbHsOKjYc5ClEug/JEGUMdIhNrQq/KjDXS7xldV
         BGBkHd9+f5DiDhJtbhxCabA0IdCxB9Gt5e61HPfWJWT9cuQLtNSRkP3Oua+0JblnudSv
         HlfOuVe21MuiTMbhquSbTlmRy0qr4rs9E9JlOcsqd0xe71KPAaTZ6WkI9JIPqea/VE5t
         9f5Q==
X-Gm-Message-State: AODbwcBf06dkKPm8rWWU7P9AXU9BE0w20PjNX9M/tPQ3GmRdtfrq2vIb
	qFVP//LNKYSXFQ==
X-Received: by 10.157.26.13 with SMTP id a13mr4198366ote.212.1495901925847;
        Sat, 27 May 2017 09:18:45 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id i32sm1953113otd.43.2017.05.27.09.18.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:18:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 11/24] docker: add extra libs to armhf target to extend codebase coverage
Date: Sat, 27 May 2017 13:17:42 -0300
Message-Id: <20170527161755.7761-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170527161755.7761-1-f4bug@amsat.org>
References: <20170527161755.7761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KKKJNHRr6WH1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-armhf-cross.docker | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-armhf-cross.docker b/tests/docker/dockerfiles/debian-armhf-cross.docker
index ba8d5a5167..e67dfdccc5 100644
--- a/tests/docker/dockerfiles/debian-armhf-cross.docker
+++ b/tests/docker/dockerfiles/debian-armhf-cross.docker
@@ -16,3 +16,14 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=arm-linux-gnueabihf-
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        glusterfs-common:armhf \
+        libbz2-dev:armhf \
+        liblzo2-dev:armhf \
+        libncursesw5-dev:armhf \
+        libnfs-dev:armhf \
+        librdmacm-dev:armhf \
+        libsnappy-dev:armhf \
+        libxen-dev:armhf
-- 
2.11.0
