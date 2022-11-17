Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1171810ejx;
        Thu, 17 Nov 2022 03:16:31 -0800 (PST)
X-Received: by 2002:a05:600c:1c1f:b0:3cf:aa11:93a9 with SMTP id j31-20020a05600c1c1f00b003cfaa1193a9mr1355623wms.138.1668683791614;
        Thu, 17 Nov 2022 03:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668683791; cv=none;
        d=google.com; s=arc-20160816;
        b=kpNwnS0zjE17LXfY2ZlOd7v6/XKtJCE79ivLmkGcgRj92/VFooBGpK7sbYlZoMa370
         4sUwn2vjLXcrsmwDuOsdORhIZqDATzjGfzkKo9IOW6h9X6M8OVMsiyZqRRbiDp6qGszf
         nwqxgDOLc/vh2Zx3ZFVmGKd40eZKwc0RctXGjUox9b9aaUrWP7+qSIT8cqzH8wVQvC+H
         j7R5LWMatVJfFpJ1A1iNQ4WeC5e5cSyUnH2dxI6yqiWEqK/uriQ2pWFOnAhAQaXWW8/k
         1aya5bDlpJgI4YfaQBoNSDtLUytTdugogv0RayUwIpIYCUX0MOK761B4/qNuA3XrIGnh
         as6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=fzi4KYJh/qM2ppaYMaOLMZPqnWLshUFWMV6nz7L5wKg=;
        b=bji+6piINwHhjpgPv2GZqwVs3nBJKx06VtpTNDUhvwOZ56Ke+1pDydR0drcF44upCC
         FFy+MFSohtE/NbRgNEioKZOaw6ixvVr4Cj1GVoxNM6BLk1oJ7MWJp7YKcoj985IHz4q5
         7sCb00PnR1+wNpz6q8qo62bzuAfOsSnpInBUwfk6qm7p75+bXRRF02H51IKuO9dCAo/r
         /2vE2ky3ROTUV8Wae96QQ+yb1fsaHHi3haMboFe1z7e0694NFOrfH1lNuBRN89BuT2aH
         xh6F98mZDFZyjuepoCfF3kBzkux2BWz4Iszw35uPtDYU++sykEgsA1KMnN2r8Q8B5MlG
         Mzag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ti5j5fwT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t7-20020adfba47000000b0023678018f07sor413373wrg.76.2022.11.17.03.16.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 17 Nov 2022 03:16:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ti5j5fwT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fzi4KYJh/qM2ppaYMaOLMZPqnWLshUFWMV6nz7L5wKg=;
        b=ti5j5fwTtqWWItxhCUTVFwgAsrXmeM+uEpoTiAqHlzdMWUUteqqXjzZu40NlHs9bPz
         pCc7db2mVXnq6upuC8CzP9sBtCECSMLth478X4YKIP5aanRNy7NHd0H4g49/SiMle1Fw
         jmPzGI3aEFcC/7majFh+ZNUcCDV/l/f0JxqCmOXxhYIY72l4OHJ0ausWYTpfeWgYJD7A
         +jhzUJ2mksJkvz0gAiV3Y2pHb9Uxfb6bYkYngFKPDF+pJqpMuunR43c2lx/F8oDdhjXD
         BWBbzsXg72OBxF4cGvpLIZ4PNFyqNJg+vnZcxdSJ1rxZcx4Z6rSDlNw1hMvQwl7XaLc5
         jFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzi4KYJh/qM2ppaYMaOLMZPqnWLshUFWMV6nz7L5wKg=;
        b=Zkzofl/nLf91XG/ceHpxuRVOxb9VwUKFjTbPD1b34saxFlfBqRhzppsWmCGdwEitGo
         dBRIgn1ENBtGBSVRcxyj7AtodZJJHXJPSlJlCY5JH9xw9FyCss3YupgHWLI2L6o6F5Xq
         b2mmxGlIOzOzKAbRfwnDFpF6PByiLfsUXSxRi8kJajD9WHepJwBBeawGofRFRpwF929y
         yk7t8fz6yk3DihdUqkVBYymo0J+qxeKN2JyM0haGR/0F2Nyzn8Z/7dcTDX6QV/7ozGmy
         nz4wX7Pn/Jh6nnOP0t/Z6W1DPAXzX40J1mArWJGsenqqUgVVR7nKTTCFmP48hm01RJvM
         PA4A==
X-Gm-Message-State: ANoB5pkATy7/eBXaTjRYnjV6tiZ43tFEmHB0zpeH2ZDX5vyFtdl+W8lq
	O91Ww9miGnfpQLBGzymOF99FisgMzG42amh+
X-Google-Smtp-Source: AA0mqf7DcdEiu1BjgcBKZP3l6QzsIPjpG1Mh6uMlk3FaxiUAp5ZD51mQab6ZbOswOQmZcfugVx+E+w==
X-Received: by 2002:a5d:5144:0:b0:22d:d4c:e99c with SMTP id u4-20020a5d5144000000b0022d0d4ce99cmr1131147wrt.582.1668683791366;
        Thu, 17 Nov 2022 03:16:31 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id bg21-20020a05600c3c9500b003b497138093sm991144wmb.47.2022.11.17.03.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:16:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH for-7.2] tests/avocado/boot_linux.py: Bump aarch64 virt test timeout to 720s
Date: Thu, 17 Nov 2022 11:16:28 +0000
Message-Id: <20221117111628.911686-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kD18dSrc/JR2

The two tests
tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3

take quite a long time to run, and the current timeout of 240s
is not enough for the tests to complete on slow machines:
we've seen these tests time out in the gitlab CI in the
'avocado-system-alpine' CI job, for instance. The timeout
is also insufficient for running the test with a debug build
of QEMU: on my machine the tests take over 10 minutes to run
in that config.

Push the timeout up to 720s so that the test definitely has
enough time to complete.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 571d33882ae..32adae6ff6a 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -64,7 +64,7 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=machine:virt
     :avocado: tags=machine:gic-version=2
     """
-    timeout = 240
+    timeout = 720
 
     def add_common_args(self):
         self.vm.add_args('-bios',
-- 
2.25.1
