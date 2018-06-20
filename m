Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp761743wrq;
        Wed, 20 Jun 2018 06:20:34 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKYN40j28gRr5uaUqFH1X9BcLzQiW5E51XUKxivO2M4jDdA8/9Wo7VIRlzlPdXgrSZKUkvQ
X-Received: by 2002:a1c:b7d4:: with SMTP id h203-v6mr1689702wmf.161.1529500834778;
        Wed, 20 Jun 2018 06:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500834; cv=none;
        d=google.com; s=arc-20160816;
        b=ItYV4cAahvdC6uC4309z6EWHhY6+3trp2ueZ1cAgAMNZfIZs1diKP82AeQkVmRd5Td
         eM41hTqrhQ8IM2nleRYjHDZN1nG3P0mQrElimiMIS3t7kipeD+GKxuNmWkqUO9oUW17l
         EP/PN2perR7OCp6e+0qmxYIMYWreOPAm7HHMC/WJx2F0XthKsM42OIoRwCPH3x66R2h0
         YiCF+NsVac2mXgKHeOnEH8Z1fVMMdLEo2ncAHQvozLVG3PNUP0B2n2jlF4gs/rofZPr1
         tGR54wCiY0qK2dtkIm/28z/Buhnq13iDLTyzDte7D11Xa5xPN6cjbO8P/3TMo9PCIgwo
         z2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:arc-authentication-results;
        bh=DFmOThUPt+yWCIMEwBDH7ZssmlcirMfqiq6VpQhdqQU=;
        b=cF9lYv6787tNhgtPf1MoEjh4OEHi86HEQTqbj5trRSW5Y5sYnRZJnIMsFaUvUKvuQg
         gRZojTF3xNQpgVY0c4hlcLBXuZGIAjT9otRnC3MPDSQGdh9ozh2s6TlrbtuNS5J+AtpC
         Ii27dGovX5g9UjSgFApYQlmEuMyW+t3PYL1OTNbQK+F++O6bW5mSS6y6kNUpSO+dpxK/
         sJ21TKolsYg+CrsFVcv7ispwNQaJHSvBW5qe9hNEU//1oeAr3ugIPrkApLUfAU75yqJI
         hiHiQEGutWsFFhCFuuIL6mqE/Sdy843uqXL1KvXtx0GY/kvFI3JmJZIhU5e0iN6BmvHy
         SyAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id x16-v6si26724wrp.90.2018.06.20.06.20.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jun 2018 06:20:34 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fVd2H-0001YQ-PU; Wed, 20 Jun 2018 14:20:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 0/8] arm: implement TZ MPC
Date: Wed, 20 Jun 2018 14:20:24 +0100
Message-Id: <20180620132032.28865-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1LYI2QL42tGn

Hi; this is v3 of my iommu patchset. All the IOMMU stuff is now
in master, so the remaining part is just implementing and using
the Trustzone Memory Protection Controller in the mps2-an505.

Changes from v2 to v3 (all fairly minor):
 * add new variable to clarify sense of LUT bits
 * only autoinc the IDX register if CTRL.AUTOINC is set
 * NS accesses should see IDregs only
   (The datasheet is unclear on the exact behaviour on an
   NS access to a non-ID register, so I've made a best guess
   and had them RAZ/WI. This behaviour is not reachable for
   the mps2-an505 anyway, so it doesn't really matter.)

Patches still needing review: 2, 4, 5

thanks
-- PMM

Peter Maydell (8):
  hw/misc/tz-mpc.c: Implement the Arm TrustZone Memory Protection
    Controller
  hw/misc/tz-mpc.c: Implement registers
  hw/misc/tz-mpc.c: Implement correct blocked-access behaviour
  hw/misc/tz_mpc.c: Honour the BLK_LUT settings in translate
  hw/misc/iotkit-secctl.c: Implement SECMPCINTSTATUS
  hw/arm/iotkit: Instantiate MPC
  hw/arm/iotkit: Wire up MPC interrupt lines
  hw/arm/mps2-tz.c: Instantiate MPCs

 hw/misc/Makefile.objs           |   1 +
 include/hw/arm/iotkit.h         |   8 +
 include/hw/misc/iotkit-secctl.h |   8 +
 include/hw/misc/tz-mpc.h        |  80 ++++
 hw/arm/iotkit.c                 | 112 +++++-
 hw/arm/mps2-tz.c                |  71 ++--
 hw/misc/iotkit-secctl.c         |  38 +-
 hw/misc/tz-mpc.c                | 628 ++++++++++++++++++++++++++++++++
 MAINTAINERS                     |   2 +
 default-configs/arm-softmmu.mak |   1 +
 hw/misc/trace-events            |   8 +
 11 files changed, 917 insertions(+), 40 deletions(-)
 create mode 100644 include/hw/misc/tz-mpc.h
 create mode 100644 hw/misc/tz-mpc.c

-- 
2.17.1
