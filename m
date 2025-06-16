Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1851362njc;
        Mon, 16 Jun 2025 06:20:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpBFXZul47rAXsh9mLooQispYkJaHxo7RHYW417ppEKhK50fFbNduFsnsBcdOVZA9sIoiHWhffwH2ttA==@linaro.org
X-Received: by 2002:a17:903:120a:b0:234:a139:120b with SMTP id d9443c01a7336-2366afd3a19mr143920005ad.11.1750080009531;
        Mon, 16 Jun 2025 06:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080009; cv=none;
        d=google.com; s=arc-20240605;
        b=DgNqOF7h//fP6K6M314cxHkcFmhxDQo0LZTn1N1JINJYkrToIaj3IufCw7/ZmyHXD7
         v9doGZMUB/DPeZY1mbR/Xnt2mdjEku/KOwJse9L0AMI2J1UhWKBuOX7D6fFN6vYYvB8Z
         pBEicIzf1fMSs5FEi1Rb0kpC/OFb8S1KDVWOtJ3kUuicJ/+tDEdLZRERONtVOo5/QtVV
         MwKUugGVdvYlRB2Jvth11U7Vw9icrcVSFhZXI6zKs6c63MPKd8XdxyYyFeBDLJwakPQZ
         pUl+B+6Man7v9718biqs0Zr7qK6gfQFq96MvIEncS7wR2hvxJVZjOoL+XDQjm7482TB/
         RNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=uNf7y+/6ofYgMvYReSu8/5GsERjzD0pnv5R83eoQckY=;
        fh=a4a+oeWZGwQL+r+qA6ZSH0B7be+zsBphDXWD5gTVjA4=;
        b=dOxB3qJ0zebR9eGN2utrpxaMn/Jq68aVG50R0OMeAOn+D7HAYLcqntCFYSHhda1Oqc
         NskXJ4JW3Pu+ETztyokgRAqZCw6ybfpc7vnloBi+dbqbygiFqbXxRSeywwkHtAD4Hl5X
         pqmSm2OKGg8e/FfWhkbrnQgktuogKYSxqX99XETxQKTWIaS9x92T+JvQgnvRwAoQoHsF
         LH7u9RG09gEGm9x/1SFJaAm1hW3flsUOAJGqGSNb2lF8osM5RpfAH1SFMTfhHlPpQRwj
         aO7UMrz316AlvKQUZ/JCB5aGvdbQegqYrxUCfeFCRF7hDmQT7yV/wQtXrKjUskrCJHhn
         Nnmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSubR1Zn;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2364e642cfesor74846205ad.8.2025.06.16.06.20.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eSubR1Zn;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080009; x=1750684809; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uNf7y+/6ofYgMvYReSu8/5GsERjzD0pnv5R83eoQckY=;
        b=eSubR1ZnY+8+YnJrKkm4NhBUR34+zPq4b+7wnhO+gx9LCbhSBcGJWAR7Td/pWTq2ls
         QSketUH7QMhBP0nYv/kDiZjm1nI8sGRFYHHECOYbddMTnmoJLumKY7RV4NHTO8+PkWKq
         /fz0TUt9Hn2wbD+qCfZixHSFTPPa5Z/2yu08QbveaFp1Bg6/Z5mcuXvAe6D1Me4H6xsu
         2KpLQXATGRZzLITfUJuAhukJb6+7P2P6nUSIccXWfGq9kg3F7DzLlA+Mw8Fkzum+fDo9
         ucdIhF5lzY484ceKG2PjxxseoHDZ+5apnYrOPkeJyOeW51J2d0MOciJLJUNiBZHHaxKV
         DDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080009; x=1750684809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNf7y+/6ofYgMvYReSu8/5GsERjzD0pnv5R83eoQckY=;
        b=gY9gfssORmGxO7r1sMQfHOL0PAiY7+gwq3znbvJQHtV5mH+q9u+ZFqUEt3fomDnfAh
         8zYzaWy4swymQz/u/EyxNmVwO/ZcPeb4qm/BujpGZ1rPpli1rK+5bNZdirujPHLQN32e
         FGYRlo4HHVoOvNFApwY5OLbcC6seFFC0Ux6iVRT3r7FRRMy0KkUW0tS5o4uKP5aZ3di0
         4aSjvjnJEdSPnf4c6Nf1xtkigk/iIkwRzeXU+xQ1QLjP+encxsjFv4fSh+ED4c0ju2GH
         GMPDzAK3M2SCVmzQRsP9DPPheXQbMBxU2/cBXym5L4JOqtgMdXHhMan6H9f9lElaMmT4
         V+0w==
X-Forwarded-Encrypted: i=1; AJvYcCV6NEpQHWyIgtplodabDBlp1b3koTI1gAqnQKxz52kUF5ZX+bynQ3HzJn/vOSq3D2CYQ96ySqB0Uzisqw==@linaro.org
X-Gm-Message-State: AOJu0Yy/7Y/zr/ApwRWUiO19ElxkrMKB4bzluwLVJD/cGTC9mST4mWB7
	W9xfIf6vJV9CDb6HkaPwIXaPxlbYvOYvth5ClXu7DN98ANfKDxINMB4qqtd6vI2wHzuQJg==
X-Gm-Gg: ASbGncuUJ+E/XmREKnRXDnuNUu2NGytI1/m69oOt/575sVMn+engHlmQPy7MLCWf2ZR
	39GPmop+NbcfaefIAhuvk8ANOP8JLscQ2cL5v8k0fHjyoKaAPej7/TrQ/nM2tspzMEdUPY3um2s
	o6vFbKdUZrla/XypFMt4Zd6msr8gLP+7RePBoFwj/UhD3p5M1vw+Dz07YNJvTlDgm52t+tOGexf
	/ZA6WJuotwUQ9O9R/RZ1BjbOnzmZnxUfMQMeWRrX7YMZqX5702PX9qtcpHGmPw0xQCTUf+U0gvU
	mSPXgtYC5m/fxQqtDRNeyBKiRxXIR4CPJXxsplaGzRbXhTP2k5tP34Cp8AyG5B2KeSI=
X-Google-Smtp-Source: AGHT+IGPR+J8JnQD02BCUXxj6XnYAMDJIcL+Ov/45yfP7Qaz1djmpYnFDujB8TZCPuhD7veCK3Ii4A==
X-Received: by 2002:a17:903:2ac7:b0:235:2403:77b6 with SMTP id d9443c01a7336-2366b149bccmr143751185ad.37.1750080009039;
        Mon, 16 Jun 2025 06:20:09 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm60848405ad.131.2025.06.16.06.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:08 -0700 (PDT)
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
Subject: [PATCH-for-10.1 v4 0/8] hw/arm: GIC 'its=off' ACPI table fixes
Date: Mon, 16 Jun 2025 13:18:16 +0000
Message-Id: <20250616131824.425315-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: btqHRxkUekdh

Since v2:
- Fixed no_tcg_its inverted logic (rth)

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

v1: https://lists.gnu.org/archive/html/qemu-devel/2025-03/msg07080.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00495.html (Patches 6/14 -> 14/14 in the series)
v3: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00567.html

Fix ACPI tables for '-M its=off' CLI option and resolve the issue:

https://gitlab.com/qemu-project/qemu/-/issues/2886

Cheers,
Gustavo

Gustavo Romero (7):
  hw/intc/gicv3_its: Do not check its_class_name()
  hw/arm/virt: Simplify logic for setting instance's 'tcg_its' variable
  hw/arm/virt: Simplify create_its()
  hw/arm/virt-acpi-build: Fix comment in build_iort
  qtest/bios-tables-test: Add blobs for its=off test on aarch64
  hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off
  qtest/bios-tables-test: Update blobs for its=off test on aarch64

Philippe Mathieu-Daudé (1):
  qtest/bios-tables-test: Add test for when ITS is off on aarch64

 hw/arm/virt-acpi-build.c                  | 134 +++++++++++++---------
 hw/arm/virt.c                             |  25 ++--
 include/hw/intc/arm_gicv3_its_common.h    |   2 +-
 tests/data/acpi/aarch64/virt/APIC.its_off | Bin 0 -> 164 bytes
 tests/data/acpi/aarch64/virt/IORT.its_off | Bin 0 -> 172 bytes
 tests/qtest/bios-tables-test.c            |  21 ++++
 6 files changed, 113 insertions(+), 69 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off

-- 
2.34.1
