Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp1647926dye;
        Sat, 28 Jun 2025 12:57:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+kvN2ccDkcSYr3olS1oaxnZU6okmr1FuC4dNuksUP9mS6bPq4pNmO58v8CRozZi84lqY0OyHrgmAdNw==@linaro.org
X-Received: by 2002:a05:620a:8812:b0:7d0:9e4a:e42f with SMTP id af79cd13be357-7d44398924amr1194481685a.43.1751140663050;
        Sat, 28 Jun 2025 12:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751140663; cv=none;
        d=google.com; s=arc-20240605;
        b=LfRLHlDj2nYmulKJQihp0DNT2lICEi0Z+X9mQJiFSDuKnj+9tj7QR+DdqXdP/YtWEN
         Fekp6vvciUT3LA6753xJzpf2jgqZ97/ZwWOqiYNBIBNfeo+YcKwvqCrxMFxsCZ/fBY+u
         ZEVVmv5gstOPxeNBL3ME2H4Ta9AnleKq7vFV1hhMbp9AoWn5sSgx7BlGbxwg3U+0jBWj
         cnTU+dv3VZov+5H388rWRPV5xcIhPIb6D+3uIfwG9rPojGhlS3gWB/b5LwV2ieJRQurl
         /v+u35ADJS3JEU+gTi67kCfodco0aH6ALcvbNWesRBg97ORUU99r5Z4WHSnjcmXu3hmz
         lRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=2ptTNUf3MqV0dY0n+f5mCHE1pEKvGfWfAJOT7fbj05o=;
        fh=2WhcrjqVcKpXiTUwIQoDBZ4+VRzI69m805goONGQJmM=;
        b=NhX65F43umIPhGBg7BV13cFeyk2mbyIeV0Q7S6S3r85Hia3lDuou4ckDrKhWNx9aQK
         SiAirOftybzesIk7U7PDEBtCUuG3c9mLgRE16fBkPJkw3yFMrPjwsHM+unKjrZ1A3J8a
         t/UMSg8YfwEPErfnEQGZx7Frx8pqqzjlTI4axvvYcbIuWYBr8cO2ukVcZLie2S32Oc8t
         F1B+YvUMgHv8KbiCv5zZLzmZb9uyXVE1FpPJRdP8WRYvIu7HGPdCatY95ZwOTAtaeLqD
         BvUoa55i4f00fe6r9x30XE4lcP+/tCWynhyWT7N2qxYm4+JD0kKeE/9+1On31+usFy9v
         VI/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDd4QbVp;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id af79cd13be357-7d443186b59sor350042485a.4.2025.06.28.12.57.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 28 Jun 2025 12:57:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDd4QbVp;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751140662; x=1751745462; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ptTNUf3MqV0dY0n+f5mCHE1pEKvGfWfAJOT7fbj05o=;
        b=uDd4QbVp3ioo+p4w5vKngVn5f0/RNADm4PM0DR1ktQ4M4Bf0+royvjXHCS/R+ayyEc
         dcHMpzjobP6DkZPUOYeTRGxoIePyVWjRuJhlJMBsA2v+4yAknnpEsQwAsZp3/6tn1ZXW
         hHvLkMehI/FWsM83Byqb2rK4JYAZVFkyN173ftv6OM39RaIVqLN/Ii3Q87x69hspWIyO
         6pv2CN2JHpyY17omSney1Z8KH9QhpJFgZASzvROZajP2jvitd2ApXPj1WQdwK7UgcSL0
         AHNrQeT/25dn8p5oARJ1UXEOhWjhp4XzBjVXCeUTY2enaUxB+aDHR3pOrAY2nSx95ND9
         Tmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751140662; x=1751745462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ptTNUf3MqV0dY0n+f5mCHE1pEKvGfWfAJOT7fbj05o=;
        b=DtfL1VCUTUhUML40JrseEMCbN3LpYLlDP1bgGfc8bf2sk9jEUgtpikD9D2rK410PKl
         xYNPNqWbqgIrNC4/SD1dSZq3hBoeHeepRnrA8pGz3ImBxMVJIdhdTW29P8Zl6YFpTbRg
         7NL42CXihPk+3Y5bWhDW36x/tnDSYPCp42OfeEaQhWWazFaCZ3ufrwBEw3g5WowIV4SK
         Yn8o/l32ilJ87x41rK/9DwsV0SrNaTtIJxDQ+Smi/Ka+hpQiaIQBYyD4LjHZVu6PIKe5
         HRN/hCfZcPRIq8uo7Hseoa2tUVr9v7Ia3wzoMF2hGNumZp9DHVW8TJmBEfwCQKTTSCdo
         nGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUipgbbUWxF8rmgK6YMcVSvzJHO+Ov9nV8qeleyFByHASJl04ZoyUEOryVGpgsrN8HMtqajSR8pXxiHAA==@linaro.org
X-Gm-Message-State: AOJu0YwV5oL2kz+TotJ8FiJXKz/gwUHxLkgpptmPjseqmoRZeJ3tidQ3
	Z6cCj7a9Db+4cqi0Dqnzgz3jbGEO4kEbjitFsvuJo1HqHEz766NfqyhmAshhqaizBLvMbg==
X-Gm-Gg: ASbGnctYk2wrqKs0CMvMu2mskLv3w+OvNDoxdClCfUEkOs+lzbGyFxy7p+CoMrQTplw
	IBekXHeebVhqdTKMxEC3nvcjyb3yL9SmROJByXhFwQiJK3pw/tI2YkuQx2VIy8HdmFJgKsynN9A
	jpfzfMthVVojewStNeJJ9N2QBrm1uas6nYx6APNjQnV0EZ1FswY4pKS/APMUzmODbmGm+00XdCw
	aFnFzl5NOkolbVseK/YGrkBO7aDa1uOkRuvDtXqcZXQN9ZFDhIrXSVyhPX1nNsVSq9QGGslwyxV
	+R3FLSSXv1yJoojzrNEnTA4/XkBb3K7otI1AJwD/htKC71ZAn+kf7imGXE/iXKa7HDqUiXcq6LB
	OLg==
X-Google-Smtp-Source: AGHT+IGQX2xxBYGsEtonccz56QYgD19pU7I6oPxcweH7n31jdk4R9NOrLlWkDh7zMvsJ7ibe7k+wPw==
X-Received: by 2002:a05:620a:1a89:b0:7d3:db44:86c3 with SMTP id af79cd13be357-7d4439a6fe6mr1492007985a.54.1751140662573;
        Sat, 28 Jun 2025 12:57:42 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443136907sm334395585a.14.2025.06.28.12.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 12:57:42 -0700 (PDT)
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
Subject: [PATCH-for-10.1 v6 0/9] hw/arm: GIC 'its=off' ACPI table fixes
Date: Sat, 28 Jun 2025 19:57:13 +0000
Message-Id: <20250628195722.977078-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YcazdeW7wDO3

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

Since v4:
- Fixed/restored commit authorship and author tags (philmd)
- Factored out create_its_idmaps to clarify how ID ranges that
  go direct to ITS Group node are created (eauger)
- Addressed all remaining minor review comments (eauger)

Since v5:
- Use of "directed to" in comments and commit messages (eauger)
- Renaming of variables num_id_mappings, smmu_idmaps, and its_idmaps
  to make code clearer (eauger) 

v1: https://lists.gnu.org/archive/html/qemu-devel/2025-03/msg07080.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00495.html (Patches 6/14 -> 14/14 in the series)
v3: https://lists.gnu.org/archive/html/qemu-devel/2025-04/msg00567.html
v4: https://mail.gnu.org/archive/html/qemu-devel/2025-06/msg02583.html
v5: https://mail.gnu.org/archive/html/qemu-devel/2025-06/msg03793.html

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

 hw/arm/virt-acpi-build.c                  | 190 ++++++++++++++--------
 hw/arm/virt.c                             |  25 +--
 include/hw/intc/arm_gicv3_its_common.h    |   2 +-
 tests/data/acpi/aarch64/virt/APIC.its_off | Bin 0 -> 164 bytes
 tests/data/acpi/aarch64/virt/IORT.its_off | Bin 0 -> 172 bytes
 tests/qtest/bios-tables-test.c            |  21 +++
 6 files changed, 157 insertions(+), 81 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off

-- 
2.34.1
