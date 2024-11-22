Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5748555njc;
        Fri, 22 Nov 2024 14:52:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXV5PkC2P4CWuG7dSPTmMw/MIRagTTx6TzuExrHI05Y9Ny0nKJBZEl3KzuswCOLVNG+Js4XPAtBuF7P6A==@linaro.org
X-Received: by 2002:a17:902:fc8e:b0:20c:5404:ed69 with SMTP id d9443c01a7336-2129f6b22e1mr74928185ad.31.1732315922651;
        Fri, 22 Nov 2024 14:52:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732315922; cv=none;
        d=google.com; s=arc-20240605;
        b=ARU10cyHb9dOKoUce1IW36AdgXyFs8ho40yIHTD9LpR1XynY2C70OZcCOWGE9SzLBm
         0H8lLAOIzVqqIw9QXs7s5msXl1KUPleJM4d9OECCA5pcDDjkHMZW/pvTAZXf9K+kT0IO
         QjNsQpi0Oz7k/zdwUmxD1cWgmOj1IGqKDDzFIA4Y3nc8A1lVD5dhY5hhhm4qnXI3dCBZ
         mrlU5Jqv5K8JJZx8CyuxQY1AYI8PqxAAViOBb7BdJbVceL/ag6c5NEEzVbn9x4DLqkil
         ljFiGVZA37jpM48JA355/omx44zpM09c/ecfIu+KQNsdPgxX1ejmEVMT8bXhZvTtIhct
         CcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3RE9rF5AKD1oZJblYJ9hXth9MAj94ccpqKJC2kiz+iE=;
        fh=Yt2foXh83BTFC5ZHXCT3LBcfkmfMsnY8VufTbMXVySM=;
        b=dzL12pLc6zJmMKgeW2kKnpej4TEc53+IuG9N1lYVBvbb1x0DTRIUXupxiWvMVY93l5
         dfczZ4S3V6fgXhbjum4uZtzkkBpWGg+w4EJf68NUhaMxDxaxycTUP0vo9HB21QDjOzH7
         /kKLylWGvo2kQDUbBUERKUv5uWrhV6VQi7DH1S8AUx+qNNnVUmzplQ0sfdL17LKaHakf
         i+ytc9lERIR93N3HMyw8OSig1df0jEjOiw0u2fPKyiEcvhx0dF+V29vctuoSrT/iE3Jx
         9FqkGVjsSxUKLjx+QMgXI7Wi4iDmjOFSiSohvjMk+2kwjzefF7quVdU2/Wl4/UsHOqne
         ki9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaOYa0ed;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21492456344sor9923175ad.0.2024.11.22.14.52.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2024 14:52:02 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaOYa0ed;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732315922; x=1732920722; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3RE9rF5AKD1oZJblYJ9hXth9MAj94ccpqKJC2kiz+iE=;
        b=UaOYa0edShvDlfB/g0fwkqEbgbbOjKuWvlmAOpVciKzoFSK1McOL6RsxvGPjGE2x5d
         MQvbvtr71tGmOi24f04dXTCs20Ywvx/VBNhJXBJ8oJocE+eCb9Ojx9wfE8jzbeo2mU3L
         jxhaFJIlvddI6M0RuJ3aqcEX5b5YxSJErHFm8zyr1eC9DzjySt6+d7KvFxre7eRRBit2
         3y+00Y+zgsfc1mcIz0IDByPJJT3St5v6T5GPumUPGpSZkRMQfEpvUa2V06cjKgWuZZ20
         HLu4LKssO2eZRZF8oq0g8s+uTo39yNStrPvJf1Yq+2t8dJK3noKUsRrCLWfARI0VFxor
         tvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315922; x=1732920722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RE9rF5AKD1oZJblYJ9hXth9MAj94ccpqKJC2kiz+iE=;
        b=fBbcMGt2wE7krfUi2MAEVlzQY7wDjgzHGbNVLyN+Qmml1hjgF29m/2sQ82JP1L2QiE
         S6dWVCdcxrL1F9d5EF8aNs51MyabLfcoYhXtPGUVDD7lSAxoH6AM9vghyNbJxjcxuuR8
         tL4pZKgbjNaciifOz5DWSy3FV1oxiWZ8ZoKX1lWZ3qzZvDk0nRCW+5IQ+leOLxZgKEta
         /ve/OnM4s3PCcSkyFZ5R56e3Z70R47vP5golXiq9JISDGx/H9L4CPa/ROWalIuzRQbiQ
         JL34WM/O5gukpjXvo62dpO4VPQejW9vm/3Q2MBp+UqwLV5hdFPVJPsbFK0K8n9ca7j7o
         Scig==
X-Forwarded-Encrypted: i=1; AJvYcCWLSW7h+UyHK2yBB6CMKVBvljDJIXetjum6+NciJnvMw4GMd5iWrFds+Kf3MWyFeKYUpb7QLwSE2OQXuw==@linaro.org
X-Gm-Message-State: AOJu0Yzl2PlHnU8lgWroaBXdczKpUuDQzDIlHGaYntAYPGZoD7+rcqxT
	69IKY7yidt+/NUPSqGp9tNLYjn2llYZVtOHzQM5sBL7W9rwdwLthMK+0JBfZDrt8eA==
X-Gm-Gg: ASbGncuGuyB3uSTkQQlJV6Tz3l6GRGE4eZ+xmHWa5o9/tBPHg6WAt8Z76zPaPD9UeFP
	OoasiYsOkAuWqM6rClHi2YJ6Z3Q92pn9Op9CmbETOH6aBmya1gKmkANiFe9dohnAduvsQ5mXgnA
	stLRyh/x+6QYtx+5zWTEV48AGgO9ZCIUELxmcdxpVSwr0cDtnNBaOmN7ZrKf4RQISN4TAXFSLOg
	fJMTvsm+4akLSzoj+dajOsWCgbaoTqt4XiwBqWVhw30rPkyOy+FKby9q76Keb3Ffc5j68ebPF8R
	N35f42pv6919mw==
X-Google-Smtp-Source: AGHT+IF+uxbfiAc//ISdHz+mfT+Op/JpZhqM9YLIplb/JtdMLpTPYfOmx0XtRWSn+jco0UXLU2ToAA==
X-Received: by 2002:a17:903:2311:b0:20c:5e86:9b53 with SMTP id d9443c01a7336-2129f65e87dmr53602505ad.3.1732315922258;
        Fri, 22 Nov 2024 14:52:02 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc1539fsm21450335ad.192.2024.11.22.14.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:52:01 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	alex.bennee@linaro.org,
	Steven Lee <steven_lee@aspeedtech.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Troy Lee <leetroy@gmail.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 00/12] Minor fixes for Arm documentation
Date: Fri, 22 Nov 2024 14:50:37 -0800
Message-Id: <20241122225049.1617774-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: TIgZbaY5dvx/

Reviewed following things:
- system/arm/cpu-features (options)
- system/arm/virt (options)
- boards documented and listed with -machine help (arm and aarch64)
- grep object_class_property_set_description hw/arm: ensure all options are
  documented
- reviewed boards description
- reviewed all Arm features (FEAT_) from: https://developer.arm.com/documentation/109697/2024_09/Feature-descriptions/

The Arm section of the documentation is in very good shape, and this series only
has minors fixes.

Pierrick Bouvier (12):
  docs/system/arm/emulation: mention armv9
  docs/system/arm/emulation: fix typo in feature name
  docs/system/arm/emulation: add FEAT_SSBS2
  target/arm/tcg/: fix typo in FEAT name
  docs/system/arm/: add FEAT_MTE_ASYNC
  docs/system/arm/: add FEAT_DoubleLock
  docs/system/arm/fby35: update link to product page
  docs/system/arm/orangepi: update links
  docs/system/arm/fby35: document execute-in-place property
  docs/system/arm/xlnx-versal-virt: document ospi-flash property
  docs/system/arm/virt: document missing properties
  docs/system/arm/aspeed: add missing model supermicrox11spi-bmc

 docs/bypass-iommu.txt                |  2 ++
 docs/system/arm/aspeed.rst           |  7 ++++---
 docs/system/arm/emulation.rst        | 11 +++++++----
 docs/system/arm/fby35.rst            |  5 ++++-
 docs/system/arm/orangepi.rst         |  4 ++--
 docs/system/arm/virt.rst             | 15 +++++++++++++++
 docs/system/arm/xlnx-versal-virt.rst |  3 +++
 target/arm/tcg/cpu32.c               |  2 +-
 8 files changed, 38 insertions(+), 11 deletions(-)

-- 
2.39.5
