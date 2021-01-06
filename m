Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp600390lfq;
        Tue, 5 Jan 2021 22:35:16 -0800 (PST)
X-Received: by 2002:a63:745a:: with SMTP id e26mr2911838pgn.321.1609914916118;
        Tue, 05 Jan 2021 22:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609914916; cv=none;
        d=google.com; s=arc-20160816;
        b=wIlLatxXZLBRrJS7Wyl0c12IYigQGzbdJs40t5SSJ9AIcv56aHZsKwLj4pIC4Dr+5R
         tIIZA5h6D/H4XsQSaTiKu3uv7/ujwjyYspzBmUDoSYcBnWKQgdQAkmUnvYs4RjkEkuKV
         /bNDbpnN6S8HikjkhTCZj9Tlyi3DCr+emVUgFCDZuFNQab5i/z9HheIiIPQYNfhG9Htx
         XuVW3VJE28/joD9nlH6czdU1zn2R9rJOoKDN1uXOc1TuIptNON028fNqvJ4l5PYYtvUF
         5ZD42uw+ezzS8JEnQ7x1HqRBHrYjec4bAMvGF0MyMgkpN2gHbRBY/NggKX3DzTdVcYCL
         fEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=rLgYDF/7oFhtxXtNL3KpSkY7bc4IwwkgKlQx9pF1SDA=;
        b=GL07RMHdNyQkbxHDTYZ70k4u7btbwbDHV6bgudM42Hw4zlqeAFarzeO1d5cljW8vm9
         XWKl+/HpTDrfZvv/ol0Y31gW8HovhO0FF5bEIz3KzV6yHP5B15M3d3XP4LEautfVBayc
         P4zgONT8vOK41mqnFPKe1uomWD2BshvPW8cfpEyGC98zJ/GLhcgpUi0t6DRPYhzZan1x
         SEJLXWru4hI/dFkCWxEogKe+6k5F7D5MMmp0RQMQm18XoJKsgPPLHTMM0eRxHnwRY1Ho
         5cFEk1ecLwGh4bxDiR7kIpeFECEiqNqoId7SRw8eS47ClzC0ge4zM6DyB+STfLlZHgWt
         lhbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jtx43lVg;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ha18sor779561pjb.17.2021.01.05.22.35.15
        (Google Transport Security);
        Tue, 05 Jan 2021 22:35:16 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jtx43lVg;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rLgYDF/7oFhtxXtNL3KpSkY7bc4IwwkgKlQx9pF1SDA=;
        b=Jtx43lVg2e+9H9KQvq/4g+s6bHrXknYf4lXNZgvYuitJKxVLUXCKl8IoVCJ0sU9TT9
         YFGI93mE6u6uT2ngnJaUGoE9r6Eyz80vZNQSXjOPJ7ehRj/7pquOk2cz801p11Z+x9HC
         54e7Ej4ShwNGFPburn76ot83xPCCew3Ls5gkNySwYDJzXYcYliku14NNTUfE3rOVraYH
         Ai1bgRIoanwwqmi/HLsHyaasMLmqoW4NHekFPOUDlLLKM0tvH/otX0hIMs0yc6sk0AlQ
         OJ3ZQ/4DwWuWSiaU4QJGrcUgnLaxIQKDgqg1YC6ogKYqb/B3OKhJwNUOtW9iGz71nDmV
         t4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rLgYDF/7oFhtxXtNL3KpSkY7bc4IwwkgKlQx9pF1SDA=;
        b=s7yVPo8LGzlzCvChq/dxMVlZ76JKwIlRWCGZ3CVNENpkPhnOlb24Bdn8/hULrimwhn
         sty7ACahjJdNYnA6hT1GMI5dz1CQ/B7qhn/b8oJl2Sm4baHF9rlQG4u5jIZxDTMeFa0u
         yozLCJDp2UHJVy3LyhxsB/AZDSFkFRdliEM50WgMheqpdXFc+h74ah/lxx02xbmjMWNj
         ptJg0uElv7RDH0k+2t1QYiknfOnhvKV2gQfhGgeN3InwngG2XtcPcZPEZvHkZ8XQzwR7
         8GRm6fbNs7PwEpQ/I86Vena3xYSxl4LgFbHx1uyRnewudp6yXrcOwwtV5FEyDQ6Kvnau
         LMYA==
X-Gm-Message-State: AOAM5312LqHLOxf1BFZ057gsElAFlTUiJTSOarIBuITrdF3V/qtnYVpd
	uaPJGcxvjqsHtyDAzGKlXC5IhVAlIeo=
X-Google-Smtp-Source: ABdhPJwU6wVXN0TfF7oZcQvpiDBg7zVbYfp/0RIEUzC2GPfoChodKmvnGCr4dLtn+WAU+uGK/043iA==
X-Received: by 2002:a17:90a:eacf:: with SMTP id ev15mr2941548pjb.174.1609914915478;
        Tue, 05 Jan 2021 22:35:15 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com. [144.168.56.201])
        by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 22:35:15 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v3 0/4] hw/arm: sabrelite: Improve emulation fidelity to allow booting upstream U-Boot
Date: Wed,  6 Jan 2021 14:35:00 +0800
Message-Id: <20210106063504.10841-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lEL2RBoh/MiA

From: Bin Meng <bin.meng@windriver.com>


At present the upstream U-Boot (as of today, v2021.01-rc3) does not
boot on QEMU sabrelite machine.

This fixes several issues to improve emulation fidelity of the i.MX6
sabrelite board. With this series, upstream U-Boot can boot to U-Boot
command shell. While we are here, add a target guide for this board
to help people run Linux kernel and U-Boot on QEMU.

Changes in v3:
- correct 2 typos in sabrelite.rst

Changes in v2:
- new patch: add sabrelite target guide

Bin Meng (4):
  hw/misc: imx6_ccm: Update PMU_MISC0 reset value
  hw/msic: imx6_ccm: Correct register value for silicon type
  hw/arm: sabrelite: Connect the Ethernet PHY at address 6
  docs/system: arm: Add sabrelite board description

 docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   1 +
 hw/arm/sabrelite.c            |   4 ++
 hw/misc/imx6_ccm.c            |   4 +-
 4 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 docs/system/arm/sabrelite.rst

-- 
2.25.1
