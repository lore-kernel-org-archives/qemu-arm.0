Received: by 10.103.124.15 with SMTP id x15csp882684vsc;
        Sat, 20 May 2017 20:32:14 -0700 (PDT)
X-Received: by 10.157.8.182 with SMTP id 51mr7172888otf.39.1495337437019;
        Sat, 20 May 2017 20:30:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495337437; cv=none;
        d=google.com; s=arc-20160816;
        b=VKbGKmFCjHmPhSHLqk4nhTnxwk+b2k2Fajy0m/sgY+seDM82RTFKOXOqAUEjrc1Cdh
         ml7MNkYCvCB+equOi1QtCjiUc2GXdJ0+DMcid6+WvMaQmMGgBC7fLeLmJg6PDW7LJ4z/
         0FOaXZAdQJ/2JnuWKNHFems/Jt17bxPoxXD8Sw+Jn7icTgMOK20IE1zmKytvFsSFzVY5
         y9xMOahr/HqstAz7uW6TFrRkxsDvvV/L5/rZLWo7J3Nq/jM1WGX4RIbpQNMzlB9dRQBe
         AfiAksDNZRxNnZVu/xZ1EM0G+GTCEmg7L2FXuXd/12jX40kgZi6dZVzEU44mY8IYwvvr
         ep3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=O5Rw059r9uXmIRs0WZq1Gu7j19+ebN5qoS8aqiA5jlQ=;
        b=fK+7+m2qjtbNiIKVQLJDOUjbr6z1Ih86hPw37DDqURReTHOJFnnZ9OHR4k3CuNj1Wl
         BFGwOEqEZP4BOx+6dKnFaXGtgwE2DQA2OuSd5ZhT0CcZNOUXEffZQ7m7Pexhkroo4MUP
         xDzoEsUc6+hifwqMewskHX9RrOCJvat7aWWvl7BdqkQnXFgIjYJtv+w0m18jYyQYDz9y
         mtm+bqia866+tzjQLaH3KEtR6r4nwn2IFFfrfUQ8o5MY0/zayE+IlyNDdAQAwCO3WgTS
         3ok9UK4RqsLhK7X0iNEP+0DiqO0V2adtLn6ghwT+2X8giqjh4LnHC48gHHgZCSWJBZ/T
         JqUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com. [2607:f8b0:4003:c06::243])
        by mx.google.com with ESMTPS id y10si5777429oia.48.2017.05.20.20.30.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) client-ip=2607:f8b0:4003:c06::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x243.google.com with SMTP id m17so18049239oik.2;
        Sat, 20 May 2017 20:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O5Rw059r9uXmIRs0WZq1Gu7j19+ebN5qoS8aqiA5jlQ=;
        b=feTYjc7rA3y2l4MltS2FvTM0O/p38Q3e0Uzp5EK7wjNVK4ff0GPsxR/xoCxEsa+kdX
         kvfx+OW7f9jPVP/qnCHF7L1TQfOy68lbyUqLJG9IMABUf63H70AUMcGcoMh8wTz4UNue
         L0DUuz8QzKabsZiAgvOlTJ5abzoqTHsH6Q3QD+a5cbCKxeAowPnLxyTCU5eAZ8loFZ1J
         dcM3sA9Nqhs6U6CX6KT8Lc55Ldi1iDbRyNa4qtnPFQ07YZatqw51B8uHJx8+cxJRlk3E
         qniSzeSIBKzeSMkErrjnnDR4t/K92in0sV3SIuSiT/bV64XzdyINBQUsLI+muAV7u6NY
         UYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=O5Rw059r9uXmIRs0WZq1Gu7j19+ebN5qoS8aqiA5jlQ=;
        b=Qepv+yebDB3upNxJS9OhwdKAWAISz4eG8EkQKaDkznNyks8WYYyrpCxSbPCTuBKvZD
         ANSMOpz6up21aO+CdAQ6z7dqB7Jy1gSQy39qXgeJ3qo3uzJx9aK+yfzvxP1JeYutPPIP
         /LRvFp10iSyeWRvGe3pc95WGavg79Rc8BmouqY5s7MiAzQ+d/z8OtZU/KQHux7WjzGH+
         6rHBPEZoacSby/j+rWvi3UEdRAC8Ajr+YsJ8mSLZJFbuoEj0/4NbqyyQ7pjupssD2XW9
         dEV6bGZ0v+OnKsArVfnbYZXWF2nqAwaKgC4TjEP5UtXJyovVO1Cn0v3ztj01xOwS2PQn
         810g==
X-Gm-Message-State: AODbwcAGEAo+b/JhwGfEZCrID/x6jH0g5Hju+TL9PSkNJopUHBVdur0W
	e0xjc+OanQsrdg==
X-Received: by 10.157.6.80 with SMTP id 74mr9852605otn.93.1495337433138;
        Sat, 20 May 2017 20:30:33 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id u23sm6499219otg.31.2017.05.20.20.30.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 20 May 2017 20:30:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 12/24] docker: add extra libs to arm64 target to extend codebase coverage
Date: Sun, 21 May 2017 00:29:44 -0300
Message-Id: <20170521032956.27446-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170521032956.27446-1-f4bug@amsat.org>
References: <20170521032956.27446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pCUxz3QUPZn5

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-arm64-cross.docker | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index f3db7f4f55..45b891d57a 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -16,3 +16,14 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt-get install -y --no-install-recommends \
+        glusterfs-common:arm64 \
+        libbz2-dev:arm64 \
+        liblzo2-dev:arm64 \
+        libncursesw5-dev:arm64 \
+        libnfs-dev:arm64 \
+        librdmacm-dev:arm64 \
+        libsnappy-dev:arm64 \
+        libxen-dev:arm64
-- 
2.11.0
