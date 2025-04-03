Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4376857njd;
        Thu, 3 Apr 2025 13:40:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURwGyEcvMyf/b9BmIkT+hze5dtYEwl+lNF8Mwc+eGwAWnXJw3Imk8N8BM5WMjyOyXWj7dBIAg3kpMtrg==@linaro.org
X-Received: by 2002:a05:600c:4513:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43ed0b5e246mr1702625e9.2.1743712832561;
        Thu, 03 Apr 2025 13:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712832; cv=none;
        d=google.com; s=arc-20240605;
        b=UGcpKPdOX0lGtUGYnBWvKMC/vJDKK3ruIccm6jucPzRDzKYlW8Hgqwxzh4r+vtS/Bi
         1wy9DhDfIET/1g4aWC5bPOuwGFDUtJfgf6Y1rG4fvM6Y2TF48ZFsmsjpQq/KaRnDly5c
         tsTBRfoZJOQmPDv0tJEXP6mR7Sqd7e/UprxA7leamRfLflPRn+iZG9KYumPjUMTGrROO
         KrYIRPJsXQRE0V2OlYneKi9lRHLxVzSDBofIlbvX3QqStct01EI7o/Z6NFlNWGmN45Bb
         XcOGx5x5XtXTN3A+uMsFV2jo1FY8MVbj/Lsdj6S2ghqrFdYWtAtO1vZpl06BdyKa+xOT
         OPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Pxply8yIkySJTvDNIEdcC/CzMn2EFpNjcgIvnBNgm5s=;
        fh=EkYFb6cPD5vbLdGl1L3Ui2u53JRTj/rqbP/EZu0+6pE=;
        b=AOGmkSBAWtBTySXKClBZycS21u2dtT3XY1THYEotc0XJ3C28GYAeWV+WFCscTInCOq
         HMsCrB6t7Yv7xJCOAx+LwcGWMDw6LUBPdoTMNSZLZZ4rrU3tQGK+H7CP9FFAL6wMKK4W
         MNo8N6yTgkHTXR3/SdDLTasMrjK58u2FNMuwhbjd4LQKOK3jU+EFAZjSK89yjhy2VzYo
         vvSme9v9ttcONHMM46Amic57NhcEzgkVu2ejA2A1kjlfD40BAvDANHCWUhEenbm0Z3uA
         pQSISsn5yP1xJZAt4PBr4WqRKWAoiG4gxi5cZT5nukrhweiACZO+YLwOgO2WulVReGgZ
         Z+vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YDLpQKID;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec34a9345sor9923645e9.3.2025.04.03.13.40.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YDLpQKID;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712832; x=1744317632; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pxply8yIkySJTvDNIEdcC/CzMn2EFpNjcgIvnBNgm5s=;
        b=YDLpQKIDIs3QgSw+NMmwo0mPCtFZRp6g4qMhYm3KKhjRRstyCKcax/HDMOlI96CxFL
         TRRyFX5IDAKcXNnEuhrtdJDRYeWF/zoXjT1OZwahBBG64XmiNYe380S7OQogRm1gAHrG
         9wTKPaa94WYoNP4ng6g4tL+8C3FchMkl7rLsFze4JQ3MQ96/d90EvLYm0yKun0aZriNC
         sf9m8Mm2qq0kqUCdH0F6mzLbe/5T1ZkNkwc0glv1eyTPldaU4SqYZd/CS29ZrsLKMCX4
         8TnAtkrEri98Wq7AVBohmJrVi4Slo91qWgLMuA3I20iEdEkJzyO6eyj6ER+6T5AKOGDn
         sviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712832; x=1744317632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pxply8yIkySJTvDNIEdcC/CzMn2EFpNjcgIvnBNgm5s=;
        b=AGg3udNRGCtTLbudUvOnOX66zQDKazynAgEiTrPhLBHO76/YZm8IIhrqsMm1sni8tQ
         LCDaInAQt5zoGdmth5aSW+D5TNhT1FZDVqN+9OTiKYlsM8fSG6je1sqAMN5X0YG9ify2
         PmlQNPa69FKncCsl2LQPIHH5vo8kbYdTAQlPcR1d45AyO+mpFtY5mCG7JvGhdrbRtJ7s
         iS4zWxSYaPS0l2Kt8nDlcESXxHd2fD3GSqLLMjSvbdl0L9wC5jITR56vnTL8xm/dcNiQ
         +a/u+pJ4XyZgzo410HrVdN5To7c2tYyIm3zGlXF9c3h1e2+fGZq5IAlI1zMePhbpkw8y
         0dFA==
X-Forwarded-Encrypted: i=1; AJvYcCXzg6ASMRE7USmfnBY0dqIEMdeNKNDoMg8pL7hkzzs/Yqd6v49K+t4yXmXr4gYJ8rGzML7KK3K3oVULjg==@linaro.org
X-Gm-Message-State: AOJu0Yy0ZOoi0fpDmD2yFc+QzLExsu9aAKqzHmJL9LJwJFdYSb6LmIZQ
	QcDBNkxoIsh9Yj9zvlTuSYNmLIOhPDu29Ko/RSCr0Lxw3Lernk6zMgDJVOFQ2f0ysA==
X-Gm-Gg: ASbGncsaNwM5FSvebTYOnvglmSXUFIUsj/ECIHKoodNOoFzNb8a46vIudyUsKbB4Z8n
	zCnsknbuzpq8Z+FOoSv3kEPmMe2h+JqFK4vPbKaiig4ib3URH5JutsiMHcJyq1SgR5aQBn+hR3f
	So2cBB2aou5YU3Zvt7+LZfZayqqChK5rPUFNYiZF5dRYgzWE7bI35GlGHhYcD+zk7AM2BE8Y4Ps
	BJkVlGGp88mlBDUIomeMpgwK8Yxd9gRIcpqvkd6pAkLZVxdenQ0271pDmT4pQsWjO1DoORFhJ6x
	ET/CANwY2l84UPhv+TxexuYvTtee53ex/t4DYoTnfDk5f/y+dRQNs91pshXeQvArJp93NSUxWLA
	KnIV96e4inMH1Ct4FDpiov80y
X-Google-Smtp-Source: AGHT+IEKRM+FhD1Ucca4TbxYi2jjwLUiasMIXpkB19F4cdRVuiVoRIDblnHtZtj9Vm1gZoe4WdThGQ==
X-Received: by 2002:a05:6000:186e:b0:391:304f:34e7 with SMTP id ffacd0b85a97d-39d0de61c1amr174803f8f.44.1743712832023;
        Thu, 03 Apr 2025 13:40:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b18easm30640115e9.38.2025.04.03.13.40.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:40:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Udo Steinberg <udo@hypervisor.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v3 0/9] hw/arm: GIC ITS=off ACPI tables fixes
Date: Thu,  3 Apr 2025 22:40:20 +0200
Message-ID: <20250403204029.47958-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 3xYWrk60GEPj

Since v2:
- Fixed no_tcg_its inverted logic (rth)

Fix ACPI tables for '-M its=off' CLI option.

Regards,

Phil.

Philippe Mathieu-Daudé (9):
  hw/arm/virt: Remove pointless VirtMachineState::tcg_its field
  hw/intc/gicv3_its: Do not check its_class_name() for NULL
  hw/arm/virt: Simplify create_its()
  hw/arm/virt-acpi: Factor its_enabled() helper out
  qtest/bios-tables-test: Add test for -M virt,its=off
  qtest/bios-tables-test: Whitelist aarch64/virt 'its_off' variant blobs
  hw/arm/virt-acpi: Always build IORT table (even with GIC ITS disabled)
  hw/arm/virt-acpi: Do not advertise disabled GIC ITS
  qtest/bios-tables-test: Update aarch64/virt 'its_off' variant blobs

 include/hw/arm/virt.h                     |   1 -
 include/hw/intc/arm_gicv3_its_common.h    |   2 +-
 hw/arm/virt-acpi-build.c                  |  48 +++++++++++++---------
 hw/arm/virt.c                             |  23 ++++-------
 tests/qtest/bios-tables-test.c            |  22 ++++++++++
 tests/data/acpi/aarch64/virt/APIC.its_off | Bin 0 -> 164 bytes
 tests/data/acpi/aarch64/virt/FACP.its_off | Bin 0 -> 276 bytes
 tests/data/acpi/aarch64/virt/IORT.its_off | Bin 0 -> 212 bytes
 8 files changed, 59 insertions(+), 37 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off

-- 
2.47.1
