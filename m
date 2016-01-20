Received: by 10.25.159.19 with SMTP id i19csp3124233lfe;
        Wed, 20 Jan 2016 05:49:44 -0800 (PST)
X-Received: by 10.60.60.3 with SMTP id d3mr27644333oer.24.1453297784177;
        Wed, 20 Jan 2016 05:49:44 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com. [2607:f8b0:4003:c06::244])
        by mx.google.com with ESMTPS id a10si37633595oif.141.2016.01.20.05.49.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2016 05:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) client-ip=2607:f8b0:4003:c06::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x244.google.com with SMTP id x140so476718oif.1;
        Wed, 20 Jan 2016 05:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=FY19Kv4lnyr8MXRryKZbUC4tnK6D1meQHzsYG6+YP0Q=;
        b=hbD0ibOZxRB62hov3aubcnbU6HEf3QX4xV3i/jq7Ao3mCR+yDHC2+jb4tKLA4OccGK
         6yGVSL9KDbG3T5tUSwKnArDKbwO5dKo7eXGqOgUU0/RR/6gS0f1D/qKVMSyoEriJMspX
         5YJdBwd9tC49dtozkGXGMmDLSvD3z+nQssXVoB8x7HHrJPf8iSi+nBFVoTgkF56Tpyuh
         86MSgBbKubWkUyORkRRDW5ahJ4XQkPrbXyQpc4R5269i4iNuzq36SCSdcHZendTsLElj
         mkJ/749hMpuls+VWqEjvys6plUqWjLBGR5JS8kNJfVh1NHrvN3aVU2S494vP9142Q8FO
         st0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FY19Kv4lnyr8MXRryKZbUC4tnK6D1meQHzsYG6+YP0Q=;
        b=MVeC48cNYR1T/rVqHx2O1+mSxgQWlNyG2aK6xWjAw9SNfPJmgyylcZYxpfW7F3Ju5M
         6n0ufP2Rkst0+71V0z+qbYejzWPyL6NMECB6V5ZXB7WmMCNGlcT5o9XeO3hpEIxOcrKF
         PHWlNvqrEZnMxM8LGos5ptEzTrD6zGFyA4a7O6pCLCMBgeoo9CVK767yMIJQhE0zTsky
         XqPwEbeOAc5BHEzgVKgyDo14C7SMqe0t21TQBBmJStdqEP9KZJAlr6+47sV5U5grHu31
         t5Lxdulp79ve4r0gXsO8TD2ZNAgPFRn19TMhV5qodVpbr/atMNEjSAUNhBPHpwd10tKo
         20Dg==
X-Gm-Message-State: ALoCoQk+eM5N2thvIjbq4TcdUGony/FfyiiR2EKCfUKDtdOJqejUcOUCcOGqqYwRSMmMk0zg66p880KRim4phQ0x2JxN3Jz1Hg==
X-Received: by 10.202.215.195 with SMTP id o186mr28082210oig.87.1453297783840;
        Wed, 20 Jan 2016 05:49:43 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id a65sm18188570oib.23.2016.01.20.05.49.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 05:49:43 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 0/3] target-arm: Add a few more S2 MMU input checks
Date: Wed, 20 Jan 2016 14:49:37 +0100
Message-Id: <1453297780-12514-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
X-TUID: BS7lMiAkgLD0

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the inputsize < pamax check and also fixes the
startlevel checks to apply to the 64bit translations.

Comments welcome!

Cheers,
Edgar

Edgar E. Iglesias (3):
  target-arm: Apply S2 MMU startlevel table size check to AArch64
  target-arm: Make pamax an argument to check_s2_startlevel
  target-arm: Implement the S2 MMU inputsize < pamax check

 target-arm/helper.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

-- 
1.9.1
