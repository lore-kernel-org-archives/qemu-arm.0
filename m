Received: by 10.25.159.19 with SMTP id i19csp3654486lfe;
        Thu, 21 Jan 2016 03:18:55 -0800 (PST)
X-Received: by 10.60.58.200 with SMTP id t8mr33289744oeq.0.1453375135298;
        Thu, 21 Jan 2016 03:18:55 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com. [2607:f8b0:4003:c06::244])
        by mx.google.com with ESMTPS id v8si737880oia.61.2016.01.21.03.18.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jan 2016 03:18:55 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) client-ip=2607:f8b0:4003:c06::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:4003:c06::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-oi0-x244.google.com with SMTP id a202so1908101oib.3;
        Thu, 21 Jan 2016 03:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=5BI3Ie+P8WLmVQgcCyGQnqQDIzdWHh65kHvSGO1EMps=;
        b=J3Ujzfa0nuQHe0CBFmkMMG6zl0r3SorxMBLZ6Jz74mk/WMwblIazW2QNOtfSWLpfsv
         g8/7TEVZHBBgkrCeGE/P+OALUZuoK6IABh1ZSCe95emeEX7tTtF9iaGNf7GWl3qYfNzb
         LDOWTKh4kdeEVf5Y7q73oBnpRHAJDwDYp2D/W496qGo+roheu7T0n7AjtsVqLJh/ooHh
         Uh+XVmtdzHEdnILgcEjTUWI/1V3+wkEKqn9IsakG9Q+8aVa7+k3a2kgwCY1+5aJMDb5b
         21jNDS3iKuPlsa5JQwyXrldeBOEcF6DUv0l2aIpdUQvG0+xaJ9evhgoZHwlWlwtnX1Wt
         bHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5BI3Ie+P8WLmVQgcCyGQnqQDIzdWHh65kHvSGO1EMps=;
        b=NUrQlJPggVUGp1729Z4qRfoUItIrqOIzuIJq1aIiigKROQsVUPesubGyiX2HyVIr3J
         eZVeqt6PvBa1X0I+mhS+Xnl5bZXZgSg2IjFTilefJ/cZOeCPKbpAj/3l/8cIOzKgEHK6
         IY04qXmS1elGwjtnKTyGTddnx9vtJX9ErKJvkIfvOfv52SseKEnX2MhJ7TqbxbqxLqHM
         Rfb+TBFINkqTJ3LGiVW2+E4GKA9M9bY6gXiq5IUD5vUAcuNYTjOBlqz1wS5caAHfEVVb
         yK+0VgEGp1p/kG6R64X3ICkgah+4Q8/drsIGTJIT+heN5RpnRJQYNyvWx2BREE9yB8qy
         htUA==
X-Gm-Message-State: ALoCoQmj69pfjX1PRJyK3AaexyPR+r235svyH/HE0xvH+GLX9dQezne0QzlmdqCJTmQnw5qU+YXs1L0jyxVu4x2CW2dFSUAMLQ==
X-Received: by 10.202.232.84 with SMTP id f81mr30630534oih.103.1453375135018;
        Thu, 21 Jan 2016 03:18:55 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id a1sm336049obt.0.2016.01.21.03.18.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 03:18:54 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 0/3] target-arm: Add a few more S2 MMU input checks
Date: Thu, 21 Jan 2016 12:18:25 +0100
Message-Id: <1453375108-25229-1-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
X-TUID: 5eyDPW/FsD0N

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This adds the inputsize > pamax check and also fixes the
startlevel checks to apply to the 64bit translations.

Comments welcome!

Cheers,
Edgar

v1 -> v2:
* inputsize > pmax check only applies to AArch64
* Fix commit message typo < should be >

Edgar E. Iglesias (3):
  target-arm: Apply S2 MMU startlevel table size check to AArch64
  target-arm: Make pamax an argument to check_s2_startlevel
  target-arm: Implement the S2 MMU inputsize > pamax check

 target-arm/helper.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

-- 
1.9.1
