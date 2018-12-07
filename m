Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp242430wrt;
        Fri, 7 Dec 2018 01:08:05 -0800 (PST)
X-Received: by 2002:a65:448a:: with SMTP id l10mr1207487pgq.387.1544173685240;
        Fri, 07 Dec 2018 01:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544173685; cv=none;
        d=google.com; s=arc-20160816;
        b=Ml0bAkWSBz008bWsegTc/uvpdgdsQB49nFNkimXdip0egPTdAQDekl+XsRP1hQ8Tcz
         ACgJa/gIn++zU+xg+1q9zvQL/T4m5CHaTZfcSJq4S6vnII5hI43cEW9z0qkjmTzRM1oz
         XsdlVOl2mD8HVJxa2+z4nxpkgZqKsBjhl3KIytlxt7yAemgINEDFVR2i0a5zEwIhDbsD
         87BJF0WmcloyytFwD2WpXSefVspKpcd1LOoaf4yd1Sb2SAAyPw4vGkeIyb8RsOPNi9fy
         g80UrGUJgpOLI8ORKF8zulUD1cVTRu04hWWgYtguh4PiNpuL/Q0wNQA+ML7t4v81DDCH
         CRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=JRopU4J8VRu3UC7V4fJLRxQW4QXYNmOy8Bc1wmIb1ME=;
        b=KYi+iL4p5jrVXLcSkAUeLn0cAGiS0LHYJcLL+cu3K56Mo6Ntw0sW/zeaO41cA4yycn
         LtcGbDln1csOI/4eTwr8E+EKpEhD64wVRc8u1biIZ2xDhxuHHJ7hfakL/VFCoNclXuzd
         mTWSMbf18kLNW5OAHy2/NtVpThVYiHU6foCjDGznpAnaYcec+wtzVCGG7oiJqFh64Aq1
         HGp2xZxNCI8/kEZHARQXrTZvHovkTsp7pczPZoi+dSc6nPEUO7sxEtfeDZsjHHr9P9QL
         rZ+eQboXPNL1b4Xm2DR/McfTyV3QUnD0J8gfkePtSC+O7E+y7sX82uWSRIMswESt9gFZ
         tT4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=krgT9rRm;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g61sor4281307plb.5.2018.12.07.01.08.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 07 Dec 2018 01:08:05 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=krgT9rRm;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=JRopU4J8VRu3UC7V4fJLRxQW4QXYNmOy8Bc1wmIb1ME=;
        b=krgT9rRmdBAyQefB7HN8hJX+lfEKEjQWJeJWbL0Yfg1RCNWLbNAI6diAYJYymToqWc
         iQHJrnFp3908PRLKAUnyAY/h8eJqSfXeQA1Cl36xtrhLDLKJ4uJWefxUEJViCPaqMTwf
         ka7GpfxuHLgnXzq/H18mTgq+tH58bo0h36cOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JRopU4J8VRu3UC7V4fJLRxQW4QXYNmOy8Bc1wmIb1ME=;
        b=JdSwOYaEB2P0HN7qsvDioGdC9FI9l9Q/CTKcscjExrb4IXK71qyQjWNBPN8VsbKtDG
         rp+aYRgFOlzHDCv8ZAtZnm5b+dV3pvYp04gL1rPIJZHr1HpQZWi/GmhrbgkCFkBDFnnp
         IOIMrZs1x6GDo8idpqaYvobfu37ZR/lxetoiRj4RE1oaFowu5wb/pX3VDCk81rzt9yvX
         lGvGeO8KOm0mzYC4+J/LUNLDvWlSIe+D7LSMhFtjbqdVw2N/CEBFV05u1iYfPQ0XsqJV
         M+kU73O+21UWpJBSK4ZByligOo6MnjXR0tJs3Mzep3b/ABclu5g8KhttB9sBtR1O2INY
         CQkQ==
X-Gm-Message-State: AA+aEWZpnmSH8WtjMxXZbq/2EEEgSHR14mBlnaVS3sUXzRErSbQrPkkD
	ldDLpnG0CJDMteh2bLMZ/iaFjo50
X-Google-Smtp-Source: AFSGD/VR6MISZq6f1axMhdFrfDGQAST5OXR5hj5qPr1YDRxoOaGRJ0PieEROQa8w4fMzx4Qu5Lhv4g==
X-Received: by 2002:a17:902:2c03:: with SMTP id m3mr1325357plb.6.1544173684764;
        Fri, 07 Dec 2018 01:08:04 -0800 (PST)
Return-Path: <hongbo.zhang@linaro.org>
Received: from localhost.localdomain ([45.56.155.222])
        by smtp.gmail.com with ESMTPSA id k38sm3058432pgb.33.2018.12.07.01.08.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 01:08:03 -0800 (PST)
From: Hongbo Zhang <hongbo.zhang@linaro.org>
To: peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: ard.biesheuvel@linaro.org,
	leif.lindholm@linaro.org,
	radoslaw.biernacki@linaro.org,
	Hongbo Zhang <hongbo.zhang@linaro.org>
Subject: [PATCH v5 0/2] [PATCH v4] Add arm SBSA reference machine
Date: Fri,  7 Dec 2018 17:07:53 +0800
Message-Id: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: 0xufs+J7zOrV

For the Aarch64, there is one machine 'virt', it is primarily meant to
run on KVM and execute virtualization workloads, but we need an
environment as faithful as possible to physical hardware,  to support
firmware and OS development for pysical Aarch64 machines.

This machine comes with:
 - Re-designed memory map.
 - CPU cortex-a57.
 - EL2 and EL3 enabled.
 - GIC version 3.
 - System bus AHCI controller.
 - System bus XHCI controller(TBD).
 - CDROM and hard disc on AHCI bus.
 - E1000E ethernet card on PCIE bus.
 - VGA display adaptor on PCIE bus.
 - Only minimal device tree nodes.
And without:
 - virtio deivces.
 - fw_cfg device.
 - ACPI tables.

Arm Trusted Firmware and UEFI porting to this are done accordingly, and
it should supply ACPI tables to load OS, the minimal device tree nodes
supplied from this platform are only to pass the dynamic info reflecting
command line input to firmware, not for loading OS.

v5 changes:
 - removed more lines derived from virt.c
 - designed a new memory map
 - splitted former one patch into two for easier review
 - cancled previous EHCI and new HXCI coming later separately

V4 changes:
 - rebased to v3.0.0
 - removed timer, uart, rtc, *hci device tree nodes
   (others were removerd in v3)
 - other minore codes clean up, mainly unsed header files, comments etc.

V3 changes:
 - rename the platform 'sbsa-ref'
 - move all the codes to a separate file sbsa-ref.c
 - remove paravirtualized fw_cfg device
 - do not supply ACPI tables, since firmware will do it
 - supply only necessary DT nodes
 - and other minor code clean up

In the previous v4 cover letter,
https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg04282.html
I mentioned I had to revert two commits temperarily to run:
 Revert "target/arm: Implement new do_transaction_failed hook"
 Revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB"

Now the 1st one is fixed by Ard Biesheuvel in the edk2 side, and for
the 2nd one, a simple change in firmware side can fix it, so I won't
mention these issues in details in the cover letter any more.

I also put a branch here:
http://git.linaro.org/people/hongbo.zhang/qemu-enterprise.git/log/?h=sbsa-upstream-v5
with the last 3 workaroud we can test using legacy firmware
but gicv3 needs to be enabled in ATF:
http://git.linaro.org/people/hongbo.zhang/atf-sbsa.git/log/?h=sbsa_gicv3

Hongbo Zhang (2):
  hw/arm: Add arm SBSA reference machine, skeleton part
  hw/arm: add Arm SBSA reference machine, devices part

 hw/arm/Makefile.objs  |   2 +-
 hw/arm/sbsa-ref.c     | 698 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |   1 +
 3 files changed, 700 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/sbsa-ref.c

-- 
2.7.4
