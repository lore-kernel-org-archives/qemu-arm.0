Received: by 10.25.0.198 with SMTP id 189csp1568959lfa;
        Mon, 8 May 2017 15:18:31 -0700 (PDT)
X-Received: by 10.55.77.195 with SMTP id a186mr28972338qkb.296.1494281911768;
        Mon, 08 May 2017 15:18:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494281911; cv=none;
        d=google.com; s=arc-20160816;
        b=ZQhRuC1PUD1mqXo8ii5ThbcZ0EZ6fPUuJHXfpVvaKPREjHfroM2YpH3tceshHVjfer
         rIEA6LqK0YKHJtVyk3AMmWjT5y09pKZaVb4HkvNSEQCQJ2m/xuqRpUyzsgl17dc4vl/i
         nz0vEf8OUPBpw1ES/eqXeLKK5/MokZk81FkmXksLlT6TAJflEAMtiT/vwe39QEOoa0A0
         EpXUbTF4LtvVOMdfnyXexgc+4oA+hVXhLBtXvcq7OqSZaJZ7PNMJ7YWKqbdo/Pl/nQu8
         +2OtCC6+Pv/7mJuUB2pDR/OUOHBu0BHFJo2U8T/yaMeJx89pt3XdhkpZVFqaL4QoQjIz
         1U6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=+RJHEPBbf3hWEulznwHJKDW2qQFPd7ufWbSGlgpDm/A=;
        b=s2I/aq+1y7NgasmMkj6UFIDPOECnSHtSTtW2k8AgY2Vuva3OeymSFVX0CfYwGjGkGb
         m7TuoWpNSWY7qEj9i3AXVqv7dn9bSNhjIOsweKeemBHHFdROoYwQxexSaS7xl5iCBaMw
         TBa4W/MXwgXfc6vbQG1iC44cHCF9Nh/P/05FcMOGhAgvYFo0foer6ZEgp+UoNJ5Irfy+
         tZkvdSdhj5R1K1BoloQWlJEJL0+zTZIbXZV+47PXBYK+iryei5axfUKlrVW/kkSHSVla
         Tm3CWkfA09CZgmfdBMnjRbeFKBGkI4fB2wYB/W7aHDqAeJHcG3p4LJfsS7FpKQ3GFHCo
         0ZQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id t195si13792100qke.27.2017.05.08.15.18.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id o85so12156727qkh.0;
        Mon, 08 May 2017 15:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+RJHEPBbf3hWEulznwHJKDW2qQFPd7ufWbSGlgpDm/A=;
        b=XzXV1fFJ2d8IyqsanEds8Ejt81FQ72svn3vUQAilV+X5DxRFaR8NoW44pyMMvAuDqB
         HrOo607fihCPn3K11wa0mZUXRnx/0AeyjtGjRPkhtAPeltUh6ZzbR93RgorYPTvnkGbJ
         0NoYZ8+x/TlHJsAAz48nqtv6OR2kDTzl+NwOGM8xJHirdRvcnvY9qTICGz1ti74kvnBv
         C/WGJEtC4nZ5s2j33vy05z6bRJWF9FlvqcwQ7NLspS21D60ZBpDrJGl12vbX6VXOkXZ/
         4N5cOjCtw6TIt1+m/8MsgGWbswPWU/q8tPfaHideOGPNoDX15lBncFSEiuUX0yh8qyPs
         xWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=+RJHEPBbf3hWEulznwHJKDW2qQFPd7ufWbSGlgpDm/A=;
        b=MSz8px7uyPCFT7sKaPZo/ABcgNZcUsGj3PUMJGc9RIwp3ATeJhvuGwzfjG9du+q4a+
         SrgSQoO4fm0oytPqbezbMzDxEAmZF2y52Vg0TF4s4ulJqpfeN56Qg53G2BTc5cFvGg+s
         zdiHMNh7YjIUNH5noEPWmoMIUQn/9TXqu4yVdf/DCcm6Ll1xPGRK37idPNU49MEos2gy
         6ZK4qvU25NUU+YwD4A1275/44EZ8V5jatmE/byAFtfYvXwbnXCZGOVjEhHQuLnInIRg8
         AuRAXcn0Q220Ld3lBl4DGSX4e2gdSmHddwfE2vLxe1zGNW8zicKARsmd226Y5W6afxZu
         NI6w==
X-Gm-Message-State: AODbwcD+OPnn1B2tiExM7sZyVeSxvXm9ih/6PaxJZCCJ+Gwqt1PA9Gxy
	0IWNblMHLTRdGg==
X-Received: by 10.55.17.82 with SMTP id b79mr26376988qkh.18.1494281911421;
        Mon, 08 May 2017 15:18:31 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id k65sm10157286qkf.18.2017.05.08.15.18.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 08/21] docker: add extra libs to armhf target to extend codebase coverage
Date: Mon,  8 May 2017 19:17:46 -0300
Message-Id: <20170508221759.15616-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508221759.15616-1-f4bug@amsat.org>
References: <20170508221759.15616-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BFTmYRtr4Bca

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
