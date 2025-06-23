Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2567086dyb;
        Mon, 23 Jun 2025 06:58:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOT68Ma6vJFmU/RByp2MqyYuu9tsgMrBaPU5Jp6xQhDqJUuMvtPEMmmDjxNVNUEmI11s1g1Z9p+xdkyw==@linaro.org
X-Received: by 2002:a05:6a20:7485:b0:21f:563e:b7e8 with SMTP id adf61e73a8af0-22026e65dd7mr20497768637.4.1750687102962;
        Mon, 23 Jun 2025 06:58:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750687102; cv=none;
        d=google.com; s=arc-20240605;
        b=Ps44iSKn84jM9Gm7sQRP05ClheDf+4HrBGdI6ayLgvUQAPN6Epcg1MiUHDDmS0MCxi
         WtmmCeDe7DfcAdO0HOgvpURR9emmIoaY9iXJ3mWGeNlqmuJqCJsoCxO/L9yuwyC8ZGLg
         Jsoie7RbahQfVfnneeNA2EI43MiTyj0pY2CEgtoGNEjNn2fgm1l6b0aNU4bVNqvnw6HS
         15Sv5HWrxdRpkmVuxWM5SRn3LVdnXJ7MMMUSFtRL5o/pT1l0UskIhpt0nTda/Camglon
         CqFpHmN4eEhTeas/mioNMMRrnCjNS8W5EnlHBF17UKUKvxf1Ks0itGQ/Nvz5EivNLgtQ
         kn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=FjqjwOShSvL5ZiDHvWdQfdLkebsd1QtRSET7cdjduQM=;
        fh=nvx6nsRgdLL32jX6dZIu4t1NFwEfSZ3+Fei3qzH+J08=;
        b=lgITwo7nEi9sXjr2zY22ppq3BI0oj7qq0nze7es9/O90pEtJAQthUKkLQ7HW2RP8KO
         NDgmHv24ESSeQkSLzPoHJLupmgF9Zi1mdmS/ovYyQxNg0bqDYwgrK7jiiwsmAQEkwImE
         qpnfFU9WIZGYFADJ1mgb0+NELWiXMNXZg+9gh4QPguZ23+8+k+q48SrYr9dMfsm4xTDU
         67RhZvCW8vAHJUwRCUxXudBE5oGomRsKvsUbIDelvz7KOOl9AvSB0sHKPEmqWoNeZhJ2
         mkcSuEmHWcjfa4TB8YrHDmD4ouffJrcPG6DJGtXituB+3USQhd//dfMigs0+mbmjNvgj
         Mkzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EahVt/KL";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a475de2sor4059626b3a.1.2025.06.23.06.58.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 06:58:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="EahVt/KL";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750687102; x=1751291902; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjqjwOShSvL5ZiDHvWdQfdLkebsd1QtRSET7cdjduQM=;
        b=EahVt/KLQkLHrAVlMH6HV/z+2fMADWFgkZCH27KsI30mgOKb4FAPC56T9yaqafr1QX
         15hOUbXhLozLD4AWDGjvTyKrZSeCQHKelGHL2EBfvEISn2AeWGXhemqsrsDbcgMIYBff
         /Ciso2Y3uAxikIFN7XtpcNbfVzjqI5bN+5vdRAPu+1/H5Y92b5O+VuKljgzKJYBaXOlc
         55ysl1Vd6N5JIhPGTo7w2n750zsY1+JvPkpXrpaLSEzN0/zM573tqn0YTkw64DfAlgnA
         Hgg5MfsRtRylAxcryaEkpIJqHBV9o05j5gLQFmiaeWkdIzV1ZR1gET65nVZzGVDNTXho
         1fSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687102; x=1751291902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjqjwOShSvL5ZiDHvWdQfdLkebsd1QtRSET7cdjduQM=;
        b=aZuPagsYj+HVmxNqEM5IMZP9NHsiOdDICGSNFCoky1J+js81F/wH3SSShBUcfbjOnI
         MqOD63fGw4kI6EKcSokmzimGZTpj7BeA7uCYPJGij70nfyZB1WuKaKhAEbufdxxvt1Vy
         MNKSugeN0Ftvn5VxIVHF51P7FqCfTtRIFq7iLY+MsKr6SRby12LNrr3RzAIydk1v3l45
         i5ZtF0DAoq3nxrYfqY9/QbIHkN9r8euB76gxBFFXRWPWZ4JO3M3Rn5DB5DSrBZ/mJDA4
         NRVy63vP0/mkcllfh7WibMAP5qbKBlUcKvZiVOqJgaBkwqUoj5XspDv4QAja2qxueXZP
         4Q6A==
X-Forwarded-Encrypted: i=1; AJvYcCUYc4O+ZrbGh4V7amtkWR6CI9vRdcEWhJmqO3gO9F3UJOvoXvnElBo6ZmPBmTo0KtGcsn8bW25Covpvbw==@linaro.org
X-Gm-Message-State: AOJu0YxdlZbsJrJmMPJM7OIB77cxwKeuoD+wvKOkNL2dyJ17TYPmCWbN
	B+7esWUkrDU4RFzu3rco1wcEmPLwIrRbMh8Wf2WpBi4RMPS3QAOrU812qztNREmxJQhbJA==
X-Gm-Gg: ASbGncuLcaVPzRtewdY8zxGEpuDz42ZSkGiYwyHJvmyDcVsq+uPc+ojvM2k+tsGsP8c
	o9dfegeJf8VCV+3i8gp2EnFcX3D/noIcXjUdQ+wxSbnPypkjy8BB6vYW87L0Tjf+lDyJMAgtcf5
	RXFRAy5upYjSQksHaKI1tznub+NYEBZ/72Ml8WfU3NmKF5oJnQuZ29K/zZTQrKAMlTyA+rl/Dfj
	uOwnsRUZUra4PpWaDyugJgfn169BROVnEFxkU0ZX/al5ccNX8PVPQCwHZ2V993Z2CTra55mF2Zy
	cntTl/ePUPo2TOkG9JmwjmW8RSX3mAyOoAPDjgwQHNipz8DhDR/yvKMkp74w/zjGoyM=
X-Google-Smtp-Source: AGHT+IHaA3Yci2lOBcHNqVah8h5dJVMn2TwdFADEDLj0ezLFm7ojgfI/ihv3C+IjezMknXl6Qtfe3g==
X-Received: by 2002:a05:6a21:6daa:b0:216:5f67:98f7 with SMTP id adf61e73a8af0-22026fb9b57mr16047428637.33.1750687102509;
        Mon, 23 Jun 2025 06:58:22 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f119eb64sm8063490a12.31.2025.06.23.06.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:58:21 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com,
	philmd@linaro.org,
	mst@redhat.com
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	udo@hypervisor.org,
	ajones@ventanamicro.com,
	peter.maydell@linaro.org,
	imammedo@redhat.com,
	anisinha@redhat.com
Subject: [PATCH-for-10.1 v5 0/9] hw/arm: GIC 'its=off' ACPI table fixes
Date: Mon, 23 Jun 2025 13:57:40 +0000
Message-Id: <20250623135749.691137-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: igkfFA0MzMJs

Since v3:
- Fixed remappings in the IORT table when ITS is no present
- Rebased on master and resoled conflics, like no more "no_its"
  flag in VirtMachineClass
- Dropped patch 1/9 because we actually want the instance flags,
  not only the class flags, and the instance flags are the ones
  to be used often when deciding about the presence/absence of a
  machine feature, instead of the negated class flags ("no_*")
- Adapted the other patches that depended on 1/9
- Dropped patch 4/9 in favor of using the instance flag for
  checking if ITS is on or off
- Simplified VM options for the new "its=off" test

Since v4:
- Fixed/restored commit authorship and author tags (philmd)
- Factored out create_its_idmaps to clarify how ID ranges that
  go direct to ITS Group node are created (eauger)
- Addressed all remaining minor review comments (eauger)


v1: https://lists.gnu.org/archive/html/qemu-devel/2025-03/msg07080.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00495.html (Patches 6/14 -> 14/14 in the series)
v3: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00567.html
v4: https://mail.gnu.org/archive/html/qemu-devel/2025-06/msg02583.html

Fix ACPI tables for '-M its=off' CLI option and resolve the issue:

https://gitlab.com/qemu-project/qemu/-/issues/2886

Cheers,
Gustavo

Gustavo Romero (6):
  hw/arm/virt: Simplify logic for setting instance's 'tcg_its' variable
  hw/arm/virt-acpi-build: Improve comment in build_iort
  hw/arm/virt-acpi-build: Factor out create_its_idmaps
  qtest/bios-tables-test: Add blobs for its=off test on aarch64
  hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off
  qtest/bios-tables-test: Update blobs for its=off test on aarch64

Philippe Mathieu-Daudé (3):
  hw/intc/gicv3_its: Do not check its_class_name()
  hw/arm/virt: Simplify create_its()
  qtest/bios-tables-test: Add test for when ITS is off on aarch64

 hw/arm/virt-acpi-build.c                  | 169 ++++++++++++++--------
 hw/arm/virt.c                             |  25 ++--
 include/hw/intc/arm_gicv3_its_common.h    |   2 +-
 tests/data/acpi/aarch64/virt/APIC.its_off | Bin 0 -> 164 bytes
 tests/data/acpi/aarch64/virt/IORT.its_off | Bin 0 -> 172 bytes
 tests/qtest/bios-tables-test.c            |  21 +++
 6 files changed, 143 insertions(+), 74 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off

-- 
2.34.1
