Received: by 10.25.0.198 with SMTP id 189csp1568978lfa;
        Mon, 8 May 2017 15:18:34 -0700 (PDT)
X-Received: by 10.200.58.130 with SMTP id x2mr8243100qte.110.1494281914310;
        Mon, 08 May 2017 15:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494281914; cv=none;
        d=google.com; s=arc-20160816;
        b=qI5IwsjvnBDHEV8HGHGPjHTi7CPBL/aZ1JvSOWXx2tQpj8sARuNAwGmgMtNXFZpglG
         eaXZYzIanuW6tQ+njTMWu69MouYvtyxOEbFMP5JHbKKz/HO57P27x+kiDncgvblF2P0t
         WHhuaskTSiwjk5VNK6njGthhGKb/QHRFl5DD4wUapE3Gxvt+tDvSVqNisGv/Tc9KNu/K
         joKyzh/hz+rjfAtV2MKs/j2SGhvljVvpf0ouqx43MwYHr6NJ4aDpN8Y3/aT/G0w8Cf13
         w0EAotQ92z8ZoldvjnYkG+L8JLWszcZBBDPyXHngXzBtgZ55ogJ0pdjCBZ4NwpZ45o9p
         Xt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature
         :arc-authentication-results;
        bh=6km89AiHl3JfdFR5TGGovBpzp5wFub7X26Epj0KFw1Q=;
        b=vPSYrD+fhxfmtEd1jAcXgg87dLCuDJ0pVKA0ZAsH5l/f9ksWDL5icskWyjvWpa1+aY
         3Yi1KfeQpx2gaHWL1UH/S/rFTBGCc2lswa/o3pPc/ZL7iBscWyslcC+GYYgrdzqe5B1K
         iklIGRyuwVog/0cKnRsA6VtKNnAMtufGvP7isx1NJK/OWHMgUs3MsofOdEiF2K0+xs0J
         wTak4udyjUVdmBgvgiEdLMYhx/8WuJCnvHnDiuwgv9j2xNvMuMcvbb/Me5eq7w8khXuo
         xSpHUHIyvsUofNXTmf8s91rAm/YhOgJ/lpEd0dnfOcBGoMIlM9ziXJ4f+D87ETQGPwwo
         aDng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id t55si12162357qte.124.2017.05.08.15.18.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id u75so12127246qka.1;
        Mon, 08 May 2017 15:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6km89AiHl3JfdFR5TGGovBpzp5wFub7X26Epj0KFw1Q=;
        b=b644taacTYDv8VKrWulrzFtd+Hjlm78SPIBPLpsyrFY0MM5bMTl28jeMmN7w+OoCkN
         cy8dN+lSx1dngxZpyTe/qdDaqvZf42fnrd9Eac6xVWnGFKkqjSkhJTt4rxkfHgs6zBCp
         AbRQLXUf6d9qeP3bQLppBW/paPWTT41tCT+aD+gSFAdZcdvaUkAzpPY6/rhNGe4Tw0UC
         97TWJ3qXd6+IVt/BFr5oltk8lnkMMiDCMrrDWZLQzdW+jIgJG/UB5tNFVI3QKKlHXU7q
         NP0f3E+hCtmEs6vL6qGj9lpRb3YzS65UMCo45uQVECFOsSIrPanIrQ/j7SKK5S7stzV4
         Hn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=6km89AiHl3JfdFR5TGGovBpzp5wFub7X26Epj0KFw1Q=;
        b=QGYr3iWU/hPKv588O/C1Qd8981LWJGa4p6bv30typWLxII5zoNEexjd1DENt0JG6gA
         6XF2N+U30WeHj24cug/mguCAgOJqu3sfeYdRuFUwDxBbdz/iAgzpB2i8ISN4Q8mZaiAn
         hekonOjNdXTj2ksbrvLSn03W9e3EY8R7HzfkfESOWiOhjlGreZO73ph1iI/EtWU5uxIV
         leTR+jOO7W8Hcja5vjrwbVB/aEa3anPHdUUtPrTWQWWYObqpx1I1fuJvpe5vvMDZ0HpV
         HYaFKV5trP1eEQaStKPGxzUDoSOaqabhr2/Uf2qW3wNgFFPB+KV88sPUZz4j1YCZoxKH
         m3bA==
X-Gm-Message-State: AODbwcBT2zTrAQnRWBIZwA+a00457NrAZxcU3GnPms7Z1rQ2nbb9ewMz
	potll7XQZq3YUDe8Lp2NoQ==
X-Received: by 10.55.79.211 with SMTP id d202mr25505241qkb.298.1494281913977;
        Mon, 08 May 2017 15:18:33 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id k65sm10157286qkf.18.2017.05.08.15.18.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 May 2017 15:18:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 09/21] docker: add extra libs to arm64 target to extend codebase coverage
Date: Mon,  8 May 2017 19:17:47 -0300
Message-Id: <20170508221759.15616-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508221759.15616-1-f4bug@amsat.org>
References: <20170508221759.15616-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mV3BN4c0CJdn

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/debian-arm64-cross.docker | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-arm64-cross.docker b/tests/docker/dockerfiles/debian-arm64-cross.docker
index 12b30aae54..5e0036917b 100644
--- a/tests/docker/dockerfiles/debian-arm64-cross.docker
+++ b/tests/docker/dockerfiles/debian-arm64-cross.docker
@@ -14,4 +14,10 @@ RUN dpkg --add-architecture arm64 && \
 # Specify the cross prefix for this image (see tests/docker/common.rc)
 ENV QEMU_CONFIGURE_OPTS --cross-prefix=aarch64-linux-gnu-
 
-RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get build-dep -yy -a arm64 qemu
+RUN DEBIAN_FRONTEND=noninteractive eatmydata apt-get build-dep -yy -a arm64 qemu && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt-get install -y --no-install-recommends \
+        glusterfs-common:arm64 \
+        libncursesw5-dev:arm64 libnfs-dev:arm64 \
+        libbz2-dev:arm64 liblzo2-dev:arm64 \
+        libsnappy-dev:arm64 librdmacm-dev:arm64 \
+        libxen-dev:arm64
-- 
2.11.0
