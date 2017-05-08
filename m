Received: by 10.25.0.198 with SMTP id 189csp1568946lfa;
        Mon, 8 May 2017 15:18:29 -0700 (PDT)
X-Received: by 10.237.34.22 with SMTP id n22mr55483595qtc.164.1494281909334;
        Mon, 08 May 2017 15:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494281909; cv=none;
        d=google.com; s=arc-20160816;
        b=1HRiaNDif4johjG6GM0gEEqlpfT5aNzW1NRbdL8wsZRUA2LfiHa60n/NP1Qilg4PV+
         +mMEONtO9Fy7AoFKDA1m8tR7rnNk2LT8XClNECr5pDk7NeXk4+kMsCU0AL2xi6jq/F/t
         HqnnIKOuoW6Jhh4qXrqIFsrtDKAZmGxLAndKLcpr0T8vaKV5snDQga2tGu0dO2bDZLjU
         4JuWPE0+ME3+v4QpK06HyJfBSTDilUwDnY8UacyTxLaMm4ltKHNb0Wcmib1rYg01KJSq
         ikHBWePhwlR5bZVDbt7yAyFqsYLjEJfEyqay9DFDCUjzovTqx50+EIEO4QcZ3pPxc101
         GRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=6w2ku+MG7w++xWzrVbIV2SrVTp4bQ15NBhbfJi0V2Uo=;
        b=WtJUFkHNfgbX0xbpK15E+odQ1OWfS2cN3E68yrK2hmVXOAMrojqUomwLNLZNTKTUA5
         dTqr9o55mBE46vw7XbZ40IFqWWsnBNXyvoEBOi9O2WWmm58iK0200fRwCwxKR5SCtYdd
         1F67nYV6Y7RBuZ9KKXcL0w+3EXdM5RcKIpAGQE2tcyFFitNblMyncUFur0rpCuvplhhQ
         vdSnPN4cAmlaylwNTXpWr4jovB4J3J3MZJfUXiWqb2x/QT51evwveXC7USXMcGWCtRnZ
         0NT5cw/Vda7jO7LV/SWU/3x0Y2WtFOWrbRoTi1B24O/nb8WKaXvSWfbpImdvHx+qA1fh
         Tnwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com. [2607:f8b0:400d:c0d::244])
        by mx.google.com with ESMTPS id d143si13616808qke.153.2017.05.08.15.18.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) client-ip=2607:f8b0:400d:c0d::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::244 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x244.google.com with SMTP id j13so11477423qta.3;
        Mon, 08 May 2017 15:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6w2ku+MG7w++xWzrVbIV2SrVTp4bQ15NBhbfJi0V2Uo=;
        b=jXzflijv0WZCjbVbWgTQZRCXaTEmqGncSYxFhT8lPrpmJAJ5G/fZKU0Dre02v36nPZ
         O4087WDJs0SSC4YQryOrrrvYa0zxSSCVKueAGvgmWCb52VKM5SFrk2xyvxMOFq8qWI0e
         xM3doLRod2vPVB7vxud63dwxikSqCr1frkTr30KoXYe3BAmrpkX6hk46ZMyR/8WGIaaH
         L0Z/CdrpCx+Xu/n5bcxWvm6I9HlzuDHHQ0rykGUJNEtJKAFvJCuaH40DSyeRnCzFKSXE
         bMgyTEJDledoOAcFZNZ42namsgO8TVTkJ+SGKemFDdFh4CdU12fFRDBpHLSMBz4B5CqV
         yYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6w2ku+MG7w++xWzrVbIV2SrVTp4bQ15NBhbfJi0V2Uo=;
        b=qC2p0rzEiusxI+BuWVZb0S6MEPqkpjUQFgUb071Byv4HrOamBvBgfsTCK811/hqeKv
         0s4H69MgI/VMUELZRDEViQWP9+an9gpvkH7ExMraKVuF4KrenyWNnhKiXoX/v9VLCEkD
         hgiCNEJ0wukNU3vAWrlqx6EVKqS36ZbsiZw4D4xLFKtNtBJpJ5f91dj+fT2f3UQYM7T0
         E8vdEgaggK9a6GoA4QiqkslDCYBHY8mzicAukkUl/h7n+bbFHdUagvxv20N7S5Gl5hyf
         NA0OpMGVpcKCfmx66HZjiHIKC2REPaJlcbvGCv9Mue/ttJeDoXOPEsJwl2aGa8bmRDFG
         w3cQ==
X-Gm-Message-State: AODbwcCmBRWoZTfa8KsWraqNw0uav222nurykUxUUpQLbqjPo2X/oGMT
	E0/YDY3X20UGQQ==
X-Received: by 10.237.34.154 with SMTP id p26mr7029055qtc.47.1494281909015;
        Mon, 08 May 2017 15:18:29 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id k65sm10157286qkf.18.2017.05.08.15.18.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 07/21] docker: compact debian arm64
Date: Mon,  8 May 2017 19:17:45 -0300
Message-Id: <20170508221759.15616-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508221759.15616-1-f4bug@amsat.org>
References: <20170508221759.15616-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EKiPsmYdh8gl

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-arm64-cross.docker | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 592b5d7055..12b30aae54 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -6,10 +6,12 @@
 FROM qemu:debian
 
 # Add the foreign architecture we want and install dependencies
-RUN dpkg --add-architecture arm64
-RUN apt update
-RUN apt install -yy crossbuild-essential-arm64
-RUN apt-get build-dep -yy -a arm64 qemu
+RUN dpkg --add-architecture arm64 && \
+    apt-get update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt-get install -y --no-install-recommends \
+        crossbuild-essential-arm64
 
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
+
+RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get build-dep -yy -a arm64 qemu
-- 
2.11.0
