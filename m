Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp6266512lfq;
        Tue, 22 Dec 2020 22:26:18 -0800 (PST)
X-Received: by 2002:a37:4285:: with SMTP id p127mr9165347qka.501.1608704777859;
        Tue, 22 Dec 2020 22:26:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608704777; cv=none;
        d=google.com; s=arc-20160816;
        b=KPn8Od4UKn3E8HUfmNSB8fO0eM+VabmKKa1XE4Tup8UNpgoz3/ShDDfI+cxOB4zH6O
         BE3u7Ahk08cooW7YdKFpZMEhrR1dQLbqXotHfn6GPNw10rNngsF6uzHxnhW1FHX8c+Mp
         KfWC8Zxw/0A/+3UB+PIJIKGG3Pq0laqcYEihbzxCEQDmCpflh21lxMGDlJfrFdAU0bpM
         7GA1rtenAgPMtVaxmNKLQWADDKq61d6m51hV+b+8YAIuugHodslrkmYM1XKrTahvT8Hs
         9FppzXGHnH4e4AKRxTUiRQHix3ZWtZr6L0DyZli1degkDSnu1zrheyR9hYT3BNj9Aeld
         rZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3QG4Fqpu42Vyf/NIfwutbufDTylz0SgrZtIAjsTyZ6E=;
        b=kNuYGDyGSu7GFdzEO29bTmCfNb7GMaxqjLHx4TvaQY9vStURbiTCLNc0wLHE83SmnW
         GYimfUOhA0Z8mnHRA1JsDQ4F1mkDk/uP4EBUMF209ZKz88etnPq0g8lNMMhv/EFqWfs7
         /LPTsD2GW4yXfYCm8gPdshdJ9TTGvvR+DiOKKtXKINZzTnx7tC61tZL1HjLQu+1k9qtu
         SgbD8L/7vYJ7n38DKJHrEMGiUbKALF/zFX0yIqnnVQxp3VyOrlnqzMha3RHFhckbzoBa
         2F+w0AWVaj50AeHnCP/JD3rA9VdgQd7+dXT7qynHeYDm622O1pPI6SLwzHjQ8fVYu7H4
         9/8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLtbCz8k;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q62sor9954752qkf.166.2020.12.22.22.26.17
        (Google Transport Security);
        Tue, 22 Dec 2020 22:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLtbCz8k;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3QG4Fqpu42Vyf/NIfwutbufDTylz0SgrZtIAjsTyZ6E=;
        b=hLtbCz8khUVPHTVqrVTLcnGNmfHwQ19QM5R+S8snH8JxBH4cEGrQOT7Ry7xhCwEHKK
         x7sQYU3eWEeSghEd9ffM2ynfjAWS7s0qx79OCZMOP4sb5zLdpEhIe+QIjreNp5QrPpNz
         vSz6KhhH3XL3kwWHSbpjzoRRSfFd531zhcZ2/2d55hi5hIqH0o4fJcdQ+vGx6vBfRAkF
         hOGIzd7Kja+smgKCF04IEuRuF6u+k3nmupuu/rwJ9jvDsSh9V0UJy9jGTATVnUCFG6Qh
         ce/ktu1pTmkH/A4wqukyRvqfuOKOA/tAhLwcDDVh7KZ2+bvBhBAOK3P2TjtMkWCoLZyk
         mf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3QG4Fqpu42Vyf/NIfwutbufDTylz0SgrZtIAjsTyZ6E=;
        b=SHI/QN5L47JP/r0qHLExqHqm7/MIY5rhdEb1RRjGZXT3RenSk2SUUaurZyBSE6QRKz
         JNgBfH3g1663W7mcZm4lxDAptiDmRrleTiXEoTZUn+Xsk2ShW2xkR9c2KVCKgQ9NuZLV
         lMFGiF2fgYzwkssj/j0mwJ/hzq6cudY3bBP8U8PFjapZTxtAva/SA0mq7PovBT255sjw
         XTJ8H0F2TqkUjiG6J0bHFzO/8gtXLZBydGuUhcSmtK1tQOof4/bbx/HbaXY00I8EPKGL
         epKx6ESN62HHVxcgMy+rAkDTxEOkuHFtA6a6vcZApXzjt9WeMMpattpPns0Vt3nqwvZq
         ibag==
X-Gm-Message-State: AOAM5305vb+LqbQJJMPYN7YpKpDgjph2FqF2qPoVvOge+8w8UnLNJmo0
	A+nA4FCbDlorab2Js43bQMaWaypIrsU=
X-Google-Smtp-Source: ABdhPJyVbtkqZrflA/2W+3M7hnbO9zyz31JDmBFiMXbJij5/sq1wP8nykyzonCslpDMPg8FwWCtwVA==
X-Received: by 2002:a37:aec2:: with SMTP id x185mr25271357qke.64.1608704777506;
        Tue, 22 Dec 2020 22:26:17 -0800 (PST)
Return-Path: <bmeng.cn@gmail.com>
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com. [147.11.124.94])
        by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 22:26:17 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH v2 0/4] hw/arm: sabrelite: Improve emulation fidelity to allow booting upstream U-Boot
Date: Wed, 23 Dec 2020 14:26:03 +0800
Message-Id: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dgwKcnJdEUC5

From: Bin Meng <bin.meng@windriver.com>

At present the upstream U-Boot (as of today, v2021.01-rc3) does not
boot on QEMU sabrelite machine.

This fixes several issues to improve emulation fidelity of the i.MX6
sabrelite board. With this series, upstream U-Boot can boot to U-Boot
command shell. While we are here, add a target guide for this board
to help people run Linux kernel and U-Boot on QEMU.

Changes in v2:
- new patch: add sabrelite target guide

Bin Meng (4):
  hw/misc: imx6_ccm: Update PMU_MISC0 reset value
  hw/msic: imx6_ccm: Correct register value for silicon type
  hw/arm: sabrelite: Connect the Ethernet PHY at address 6
  docs/system: arm: Add sabrelite board description

 docs/system/arm/sabrelite.rst | 119 ++++++++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst    |   1 +
 hw/arm/sabrelite.c            |   4 ++
 hw/misc/imx6_ccm.c            |   4 +-
 4 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 docs/system/arm/sabrelite.rst

-- 
2.7.4
