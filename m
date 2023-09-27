Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1788933ejc;
        Wed, 27 Sep 2023 05:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2CLuzKqQ2fDVA2U9dNo4MfpUtAL3Y+mYDhnaLR2AFmZrX7sAti/+YYQlIRIEWMWp+PtBJ
X-Received: by 2002:a05:6000:c4:b0:31f:fb63:12d8 with SMTP id q4-20020a05600000c400b0031ffb6312d8mr1447306wrx.44.1695816058050;
        Wed, 27 Sep 2023 05:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695816058; cv=none;
        d=google.com; s=arc-20160816;
        b=s05AO8B01oPD2YDXF1uRec9wayEExzF4VpB3Ar4jFiJkeMqS436mTjDsZqIb44XsuQ
         lOZZnOQAr2BNWDgxrE2wlmhjngQ/32orURmTF/gXX0zheMOHmmPPTeRb7fExQG1WpJ2W
         hWv+LTBOveXOcpdZwXuQJtC2Ucs1/JGmYUXUAMr2ibiAP5RainXlEsUL96NJV/BzkxpL
         bU/VWShD5KV+bVKTCgGhWa7NmVpltJYGA4G7v12H2A5onIjbv4d9Gn7YM+VTqW2h3333
         /cbLGrYgq8rwPxJDRUB0ezAVOgG0ro5BROl13ZHyA0Umau7waZDRR6J8ha0FnuNPKKZi
         wGmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=iUXuL1T4ajKEyLEloLTjxBBlWLhMaY5DmmvPBV1I4pU=;
        fh=a9pXnRicFU9JFo/ksBX40ryG6nFk9S4SZtN74pEc6GU=;
        b=VU0KAiuQP70Ccvy7gBbB/T06b0rRFCet4t7mQHYDjKJPEjymgB8K7hDdxodPxb8qE1
         0vBCMVHGgZ7Ly5kxDCWmiKktWgUfaGwpqO+xNCnoJ21b+BRtNt/NIeOprPY6d/xPxjMY
         94lQNywYshBiBYURBo1LVmFt4YBlac8n945Ptsmpv2BUbvqvXaULXOKE+6rC2B0LsfPz
         9pFcqlQZA/qPQ06Re515UWzb7zz8l5lqbmBGdWUyIYz40Kr7XtYhpXjxsHM0UTnohnNS
         wrzAjMHuzQWCdfGqA2oPNXCVVZLbs8J/JBdDH3vx9pe021r14E3pEEPfOolGsK244O2P
         mv7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from muminek.juszkiewicz.com.pl (muminek.juszkiewicz.com.pl. [213.251.184.221])
        by mx.google.com with ESMTPS id v5-20020a5d43c5000000b0031967784162si7439195wrr.207.2023.09.27.05.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:00:58 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) client-ip=213.251.184.221;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning marcin.juszkiewicz@linaro.org does not designate 213.251.184.221 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id D8A8126024A;
	Wed, 27 Sep 2023 14:00:56 +0200 (CEST)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id NvP-tYy6OUEv; Wed, 27 Sep 2023 14:00:55 +0200 (CEST)
Received: from applejack.lan (83.11.3.58.ipv4.supernova.orange.pl [83.11.3.58])
	by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6EA0D26005A;
	Wed, 27 Sep 2023 14:00:54 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 0/1] tests/avocado: update firmware to enable OpenBSD test on sbsa-ref
Date: Wed, 27 Sep 2023 14:00:49 +0200
Message-ID: <20230927120050.210187-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 94pb30lLpAQo

I noticed that neither OpenBSD nor FreeBSD ran properly so this change
adds OpenBSD into testing. Instead of adding tests on all cpu cores I
decided to go with small set:

- Cortex-A57  as it is the oldest
- Neoverse-N1 as it is the default one
- max         as this one was broken in past

There was a lot of going on in firmware space for SBSA Reference
Platform recently. Updates prebuilt firmware images got new stuff:
- Neoverse V1/N2 cpu support
- non-secure EL2 virtual timer
- XHCI controller in DSDT

With those changes we can now run OpenBSD as part of sbsa-ref tests.

Changes since v1:
- added OpenBSD test
- decided to not run Neoverse-V1 tests

Marcin Juszkiewicz (1):
  tests/avocado: update firmware to enable OpenBSD test on sbsa-ref

 tests/avocado/machine_aarch64_sbsaref.py | 68 ++++++++++++++++++++----
 1 file changed, 58 insertions(+), 10 deletions(-)

-- 
2.41.0
