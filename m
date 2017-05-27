Received: by 10.25.0.6 with SMTP id 6csp766083lfa;
        Sat, 27 May 2017 09:18:47 -0700 (PDT)
X-Received: by 10.157.25.170 with SMTP id k39mr3943691otk.96.1495901927857;
        Sat, 27 May 2017 09:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495901927; cv=none;
        d=google.com; s=arc-20160816;
        b=fG7v1piIOJKknybg3G8z3JBabqPkuyEl2G0ankTkuI2l77Ix+ZxwO8sqXqYZnKQl+7
         JmZIErE2VHmpgBTBp8043Vsy8us8+DJS/jdciFGB/AGgBjf5lqPqO4LOEK2KmOZzjU4o
         R3v23/MgJIHcNa/FkNTdi5pvv5bg1vWbET1GVNHvOivh2N+sZKNxOr/++lXt4HC9AWZ0
         SQVQyW/X2A3wXGQGuuZMUlZ+MV07J0T1c5enPL/8A/4o0gJ5mMmBnf59VZ690e5HjkIJ
         DZ5wVIRcuN8uicGxWwphgmyRjOnFzDu+lmi3SHnzlne9J97YNc3xizvBtKdkEgzJ6xoV
         DU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=wjBuKEZzU7ccGKXpm8Pl54S3KU6WaoUdkUFrVeWHnEA=;
        b=vTENozoKdnS9V9kbcRxhgCzhggbdQBpeTqfuzX9QIhJ7UeHWFbhTj6IXjLuyR269aI
         /kcs9o0KJzFv6e60LaqscqGBeKk4SSIbUv+hdScFoIjxo0nAXQRSsJQoxaDoynKxdwx5
         47dDsrMXHwZwttr7NIr8VuWwIXrcOMYxeT9HUpMg6EUYngJRJLvx7zrnnhm5/qimzP/k
         nT7UxoxVz5iQPvT+RCE10onrGPIGP2hIJQWe2LzCt1nhVEgm0byLBnZXbt2rJJ0A016i
         QEnWH3RJ78+dRG2ZNVBSBcGHhsvcKXtqXs+m8E0YOTdRMsiQjOR+0awL0Ib4m+7xJRoS
         2WxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com. [2607:f8b0:4003:c06::241])
        by mx.google.com with ESMTPS id h50si1801824otd.240.2017.05.27.09.18.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) client-ip=2607:f8b0:4003:c06::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:4003:c06::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-oi0-x241.google.com with SMTP id v80so6022500oie.2;
        Sat, 27 May 2017 09:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wjBuKEZzU7ccGKXpm8Pl54S3KU6WaoUdkUFrVeWHnEA=;
        b=Q33unQjSEOuE+OMQLmxKTxuGBeWzpHcC2d5LgctzwRFJvS99r/jJdaj4KhK4w767in
         HxGUBSt7QkPDBOlsE/2NlcGqsCkCKf2VWkeKqjXbYC6yAixhyl48Fr4poED4SOEZxfXr
         7tQ/K6qUrdotLuU3sN+UOtNESHfSuj+BOO7lh3FU3vAbUssP01NswuEnPVDPfcl8Z6/d
         WD4nNG5ZpJCRctNCQDYakSvd7tG+DiECd0mKMhU+RkDnMV4zplnlLFm+pmABmzTaL0h9
         UnRQMN7nDcqsG/nhqWJjS00opBO6UcRT+X+cHfhZbtwK0jMuwGAs8LIagCOt7x8aMlqT
         yMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=wjBuKEZzU7ccGKXpm8Pl54S3KU6WaoUdkUFrVeWHnEA=;
        b=H7w2Vf7IZZz14vNvIEyrjr6lToKWnBGBcjv9y+jeR7ov+T/D6/JoKhIFzKjB0OfO5w
         CcLXbDU7vQ4eKMjk5zATHX6QwreYDGN3jr61QxxlN4YSIeb6TZKr8AC5ozPTlty9fJdo
         K812y9Ernswrxvt0C2jCs3EntXxwY5RKXbVMtXXzBHY5ilTZ1XSk6uDhKIbvLjr9SS1o
         LB6Aa6UspUTCKE+0SDOOYJIzvRqKmbAuuchtl8K1n4LDaNDWS8QORfovmk4/eRsrbOTG
         lA2V5GDamx1oPUeouZClFAUqqBGGC/7JRmvLJ/uPxFYFBjOfOLJL2E54C5Wcq9lsqbxb
         7iSQ==
X-Gm-Message-State: AODbwcBMiOYlSrcZqrJy9A89j0q1/EOcEJptraM76WTyGIxwUXgVakt4
	Z8vOBxaCW3pptQ==
X-Received: by 10.157.47.70 with SMTP id h64mr3966978otb.23.1495901927377;
        Sat, 27 May 2017 09:18:47 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from yoga.attlocal.net (162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
        by smtp.gmail.com with ESMTPSA id i32sm1953113otd.43.2017.05.27.09.18.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 May 2017 09:18:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 12/24] docker: add extra libs to arm64 target to extend codebase coverage
Date: Sat, 27 May 2017 13:17:43 -0300
Message-Id: <20170527161755.7761-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170527161755.7761-1-f4bug@amsat.org>
References: <20170527161755.7761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vpEmZCx1dmjs

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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
