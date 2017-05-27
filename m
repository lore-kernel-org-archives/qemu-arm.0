Received: by 10.25.0.6 with SMTP id 6csp766073lfa;
        Sat, 27 May 2017 09:18:44 -0700 (PDT)
X-Received: by 10.157.23.10 with SMTP id i10mr3321590ota.221.1495901924507;
        Sat, 27 May 2017 09:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495901924; cv=none;
        d=google.com; s=arc-20160816;
        b=P5cu5r2D2cI0tgZ/meZBsOUGkM+JnGy8UwJO7ZxBbUmuLV0gz4UtHbiRw0zbIP9qfE
         WXdLMGzr5lWrxpD9Rvr5K6XWBp6CkoubKvw+2iNJjQ9JpU+FC1oy/OETS7DFyrcJ+cR7
         7clrXCjpYzr+1dtMPeXPkUkNpBneZiuKDdFSFvgmi1prGCVVXTbpTn3nQD5CaAErkpJh
         40jqTlkal4yo8pMMcjxUbIO32P3GvNO+qHkTEriFQFJ67m13+0gdZRbCzKxGp+8a6fVu
         JaHoGaGf3+pQ5pIF1FkRN9gzNRe6BHuJcbdFYRY+epmGBmnm/F+jXXnLe6/flQ5p9Vd7
         KpZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=IkSRrsQnhJCWBzt8g6nuTGt+TAdaHWR1pI+cLextw8E=;
        b=bSei3UylRqqfGrKxiJzbgiUKOljEWvcxGze0VfyMR8eJxqL0bvU8rCr9oFIANaXIsZ
         3MlV6VBen5+33hIRxWppDCtCDyU7SUukVrpntqF+O1BvX20BHQI2S0Lt0gMA0ZU/Vv0q
         y3+Ar9ViYZluDCUME3JOyxwKlHiI1Qnzk0HKL4ZM7/7Ts5PTgnAndctOXI7FoXQLxPW5
         YnQJtKV002un8eVgbGa5IxYKxhWFHaHjweocPHfhZFsI1UjZKcDhhDbQGzKKh+u6SkK4
         fMmFj1IRzSpvT3J4wT2QSlOQJssjNj0oNOPEBnigQlzSGD/pyzZOlcyL4AaNRr9crDpo
         jSCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com. [2607:f8b0:4003:c06::241])
        by mx.google.com with ESMTPS id h38si1658219otb.40.2017.05.27.09.18.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) client-ip=2607:f8b0:4003:c06::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x241.google.com with SMTP id v80so6022358oie.2;
        Sat, 27 May 2017 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IkSRrsQnhJCWBzt8g6nuTGt+TAdaHWR1pI+cLextw8E=;
        b=SJrQdpC6BCPJ9Mg3HCsMANyHtS+IiItOz8FCnk30K+Df2XxbUcNus5TPkiOjhMzDCR
         zYG/Eu/skA2ojzdxoyB1o3+BVFx/T/dPt/14lS09xSlhjRBr8a/7LSDlOHNebauU+Zwt
         T6zt3e3qgldL10bycPhPL401DPD0znjjGBko72yQ1k/fuuSf3B6kkYB/t8/dqgO2n5S0
         4aDQ3LxV4nbnL7PQjznOt77mesLA7w8n834TLvMBqkxpxsjCE0XsG6CyEu56BToeRlsJ
         3Xk4brX6pv5VPeHnrHe+2XC2yeH8DdJgl2ZWxYdxjfTX32kypa9G2UWSz6R/Rw+UeU/a
         VhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IkSRrsQnhJCWBzt8g6nuTGt+TAdaHWR1pI+cLextw8E=;
        b=uGDJcjIxCyhaFSKn8OYYPRIMj2WntC2bMUTy/1tyxBpk5JWdAMt8opRdbwzqdwSwTF
         NKGmTPM2ULDkKn946v9MCFuIXQtsaKGWXJ6ks/fR0Exa8KUaO4uQshEzxd82ivLgDO3R
         0M1oTeO/I1eQwPOvl4u+soyX35hJJZ9eS3/7LlHuqNQUrgvVfMAdvzijm+JmCJFRpR+S
         yba/yrf7wn3jwNI+OFqGOCkGIPqgrrT2SyzBlq3nwhK4CBCRizKZY/HTKV7rc2zMzW+A
         mH7zvGsWz8UvvL2NzN+6TR69PjoWJCoW9uZgvgH30vN9bHqFge+rQQFpsbaiKqsmXdy1
         PoIw==
X-Gm-Message-State: AODbwcDXYKpFabUi7J3nCTe4HkWsEkEekSS0vF8sRIxamTZUXV9kdFor
	Y0+TmcdtNhFBXw==
X-Received: by 10.157.46.169 with SMTP id w38mr1325494ota.78.1495901924010;
        Sat, 27 May 2017 09:18:44 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id i32sm1953113otd.43.2017.05.27.09.18.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:18:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 10/24] docker: use eatmydata in debian arm64 image
Date: Sat, 27 May 2017 13:17:41 -0300
Message-Id: <20170527161755.7761-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170527161755.7761-1-f4bug@amsat.org>
References: <20170527161755.7761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xau8Os5gd/fW

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
