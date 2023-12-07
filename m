Received: by 2002:a17:906:fa94:b0:a1c:d2de:9065 with SMTP id lt20csp1924518ejb;
        Thu, 7 Dec 2023 13:57:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUf7Zd92jvSxywtE7hBFHo5PjaGbemOCHXor9ToPhJDeqpcN+45KtXaAjdmUq2ZT/aKH7T
X-Received: by 2002:a05:622a:38a:b0:425:4043:18a0 with SMTP id j10-20020a05622a038a00b00425404318a0mr4319298qtx.83.1701986253955;
        Thu, 07 Dec 2023 13:57:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701986253; cv=none;
        d=google.com; s=arc-20160816;
        b=lq8k2cuLWRL7hODJsa/ENYNpIXh6FF725HZ3sGFSFVfJ2qmixTYHOkP3gxzomO3kM0
         Ar2+vFZGGa1oG6PAEy6e2ZnIcqkNSJKEQHPyh7011aHVn7CFjJDb5Zf3sWjw1wRbRlpS
         TJ0824Spu3o6MhpXoKUlUxSLSALMTQgMJO0vqwEpjH6fD4SDgsZZRmC45nHDXHuoKUye
         b4XvWaoQ5hmFMw+5j0xilx+/RAUhSXWTsuxw6yMG5FpHm0rCHtiwVst7Gy2z8zXyElnV
         RFh6HipGIoqmcnqPhx1bSaVGu/5UdGq2DBAA4W4OIjKe/2f7pAghHSyzSkwv1Co6jxNu
         RoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:reply-to:message-id:subject
         :mime-version:date:from;
        bh=6FGtvOmTwqcOxIMi8CohXf99JxkbR7jfgK1A6bsmEL8=;
        fh=khUezUY/JNW/BZIO0F66rH03qTDpfe26zpWBFwOyzg8=;
        b=rVTQWirEe9wCtf9GU2rSxinmbktY4XvgY4V7gmlfdWAOH8xoZkMByzEleLb8twKm6x
         8b4AaoGdaZImox8tkEAfS2eN7rlvF7l1pTFvVPRDn0m2xIEHkQOyBw5pZ4oDpC0pSHlc
         DwnN0Srw5svc0Ah2QP2boSJJuw1NXzT9gLY+n7Zi3+zH8au4owiy4slpHuLJyDx/rgR5
         nTguoyjku+Y/7DexoFojKjMPDPnYAcoZ1S4wFjmZ8Qq8D+PvpIw8MejpvAb0Jr+0PBhk
         3Xtk0ppVIio/qHkuEvUH4AusWE3bWTMIRr3jjrsMfCBf3Fhuyp51mHQcZ6Hu6Nam9lQF
         /mPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of outgoing@sr.ht designates 173.195.146.151 as permitted sender) smtp.mailfrom=outgoing@sr.ht;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <outgoing@sr.ht>
Received: from mail-b.sr.ht (mail-b.sr.ht. [173.195.146.151])
        by mx.google.com with ESMTPS id bb16-20020a05622a1b1000b0042586bb534esi739061qtb.37.2023.12.07.13.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:57:33 -0800 (PST)
Received-SPF: pass (google.com: domain of outgoing@sr.ht designates 173.195.146.151 as permitted sender) client-ip=173.195.146.151;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of outgoing@sr.ht designates 173.195.146.151 as permitted sender) smtp.mailfrom=outgoing@sr.ht;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
	by mail-b.sr.ht (Postfix) with ESMTPSA id 2A03E11EFBC;
	Thu,  7 Dec 2023 21:57:33 +0000 (UTC)
From: ~inesvarhol <inesvarhol@git.sr.ht>
Date: Thu, 07 Dec 2023 21:57:32 +0000
MIME-Version: 1.0
Subject:
 [PATCH qemu v2 0/2] hw/arm: Add minimal support for the B-L475E-IOT01A board
Message-ID: <170198625302.23093.6056065304261752852-0@git.sr.ht>
X-Mailer: git.sr.ht
Reply-to: ~inesvarhol <inesvarhol@proton.me>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alistair@alistair23.me, philmd@linaro.org,
 peter.maydell@linaro.org, alex.bennee@linaro.org,
 ines.varhol@telecom-paris.fr, arnaud.minier@telecom-paris.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 69XdIVg8nrhP

This patch adds a new STM32L4x5 SoC, it is necessary to add support for
the B-L475E-IOT01A board.
The implementation is derived from the STM32F405 SoC and NetduinoPlus2
board.
The implementation contains no peripherals, only memory regions are
implemented.

Changes from v1 to v2:
Thank you Alistair and Alex for your comments on the license.
Just to be safe I changed the MIT license to GPL.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>

In=C3=A8s Varhol (2):
  hw/arm: Add minimal support for the STM32L4x5 SoC
  hw/arm: Add minimal support for the B-L475E-IOT01A board

 MAINTAINERS                             |  15 ++
 configs/devices/arm-softmmu/default.mak |   1 +
 hw/arm/Kconfig                          |  11 +
 hw/arm/b-l475e-iot01a.c                 |  79 +++++++
 hw/arm/meson.build                      |   2 +
 hw/arm/stm32l4x5_soc.c                  | 277 ++++++++++++++++++++++++
 include/hw/arm/stm32l4x5_soc.h          |  68 ++++++
 7 files changed, 453 insertions(+)
 create mode 100644 hw/arm/b-l475e-iot01a.c
 create mode 100644 hw/arm/stm32l4x5_soc.c
 create mode 100644 include/hw/arm/stm32l4x5_soc.h

--=20
2.38.5
