Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4184812njd;
        Thu, 3 Apr 2025 08:18:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/cSgnLUUaINBhYme5Rt12EbwK8d9I5R0agMjJBWdyN0XA//iQ5VWVEh9CN33OTD+K5x6ck/EzVJ4u4w==@linaro.org
X-Received: by 2002:a05:600c:3c9a:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-43eb5c18448mr55497895e9.6.1743693513463;
        Thu, 03 Apr 2025 08:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693513; cv=none;
        d=google.com; s=arc-20240605;
        b=SkFR0qU1tLV26jFpswyczNnMBLSP9Zw4HyA44+1dMf4yquyJdv04qVyWHkrs2N4qH+
         c6lamwRIbGrd+XiAHYu+vJZmlcC8UsmJqep7bje9CEP9iHorOkFcf/H61kv+Ke4Wjmsn
         jHXoGZc7AZK5oWjTg7rw+6738ni8/LYqWpVp9MBly+HWkGESYyozN0JVOPopVpPuVMcQ
         Tjdeec/By9fBmz6rxVi6esmpgHmJzOXR04ggLAkM2FbPm1GgK7zk/FaKq0OgM7pxR6Es
         KuaW1zp0/Sc9XaUMpaqtICrYYUVqEI5WOkNmbumGv96hmKKz1GVTaIrNgkGHNqTG8bE9
         lGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=nk7HkSl6ytbVk4kl2foDviXAGWH6GjCYLhLVx8jvfi4=;
        fh=3YK621noR+tbjRkZj61V3nc1BcDK7q+YTVWHpvIyn/A=;
        b=ZVcPpbWRPplcgg3Kd68Ahm6oPFl/C6F2esS+hLmqoyrBGBCCfeTsf6y49DczUWqkSc
         vMzhuCp7CNBXAxSmeDH0DuJ4c9TE6hi3SDedOTNjzj13s3pq/cYC9Uz2Gz6NUd7dhsOm
         DfxhKCBS7tSCJb4Dpa3/CX0LBjJ7gXJIjyFocm77TlsHzA1a7i0ScFysqp8W3vlXgRmy
         iHb1mLh3P0bmZWYRHJztYq2oLrbizpAaOa9gcy+7BcE1mk2iJDIkN3AJ4mqP7YfN17ZG
         y9Z9cY8ZyPkTsPxPQFFkbzZzkqewj9xvKoi+cupSfZKL8lIwS28sDKHpCLYvL6PiYpKu
         Vzng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opP68IEM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec24ebdbbsor8532385e9.8.2025.04.03.08.18.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:18:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=opP68IEM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693513; x=1744298313; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nk7HkSl6ytbVk4kl2foDviXAGWH6GjCYLhLVx8jvfi4=;
        b=opP68IEMTsCw5oZSoF1nIk2wfncrMVT+fkXw0Sq1eIpTJ0YjXvUOuQF48FrH7f0AgQ
         y+4meu3rikk+qqC29sfH0zaFoA+RR1ktq6AKStwk+2BhgR3zObFtjlTheY5rViwaqYAg
         ePtgQ7OU7jkfgkg8CppNE/M/pQ7LB/JsUQWp5Xppdw6UtDJK6m6NlHtMQ6zYNxt1oDT0
         ngVGw1a/3X4sjPFjmfPbI+Bs1g7aSTxBMm2b3+YC6sNwmB2viQtJldRm5jOo0c7QcKW5
         4okeln+Yf+2yivFC139Iz3WYZq99l79ZxLPBvg10wk+RRVOZyUTbPHw/TZlBStySVZ/A
         wEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693513; x=1744298313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nk7HkSl6ytbVk4kl2foDviXAGWH6GjCYLhLVx8jvfi4=;
        b=Dr0+aKHj4/W07HGGwBmx2ez//LSDevIIktok/YVIpKIXEqOQy8cDXAfFt8EtHAs19Y
         t65X/dvOorbGfu2OsixrpRUBuB+1XMnd4mYm1LIy8EqiWBOtJiubU7DoM26290M7t7q5
         jsvvt7HrxbJzGUWyaH9Oih+nDINXbz/WTduIEF/VpnDQwY++Hebu0yuG3XSSJ62Ua/Y+
         F8lSJ0V5c5xmiE/p7Ky/FwuWC1lYzN9FEMEI+vr7JQk/h0pA4e0J4RJYEep0oWyw9LLH
         iIKM/bd17krytr3X9VOs4sI5W9knX68i02WexIuCpWmT/3j5adMEwo69JDIOx2x8b9Zo
         gplA==
X-Forwarded-Encrypted: i=1; AJvYcCU0RiMWdgBwxVYXhR3y5ofbE2iPO735bJ+TVOgxT5mtsVsRFRKpBKNwdtYJaO+BB0TQ2fwqCdIdwPqjrA==@linaro.org
X-Gm-Message-State: AOJu0YwFFisMYCSO0N4T5dLGPSo6BCBLua/gv+RdjY+l0Up2DgL0UAOZ
	G2XaEi2kphlgjXXqfPHjV7rwYfo4MNfre7lcW4qmqgqJ8N5Tqf3FUHJvlaaaGljiWA==
X-Gm-Gg: ASbGnctXGbbtOplQTFmieYV1tRGy46OJYs33zJvljTviVmP0ijaCkinpd/zdweYly/n
	3L8INR/io1yxhZpedfKp7u08KR6oqkWUvocmSAJJOobndaa/Ojn41rHl95dW1c7YInxuMtKrzkF
	72E0gMDEv1jPp86yKm3+8Po+qfLNYNG4Slq2RzgzHM+7ZqO4O7PIpgAKNHf7yd0xYniq5jW3aOD
	4Fofv3M5z9PNx296qZO5cGYwT//XA59xjz99OWlRERI/bUgeBMu6L+Bx+21icNzED7dVGlU/Ucb
	9kUAb3XNQ4Wi/jRlxuGc3nlFB3ceDheQAPFpy8co91c7RziEocZo53I0+bdkc9w5R8KoDlCyk2z
	Jag7Wd3Yn2yj4UBaE6lk=
X-Google-Smtp-Source: AGHT+IEbJTCBFrbSyXuSCuQB8JSMdT9Rr0TuWMBudPsTzJaJXw7BLufu4Oeg1Yocmd8P5m1fXjju0g==
X-Received: by 2002:a5d:6d8a:0:b0:391:4835:d888 with SMTP id ffacd0b85a97d-39c297e526amr5638439f8f.42.1743693512823;
        Thu, 03 Apr 2025 08:18:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm2074928f8f.60.2025.04.03.08.18.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:18:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0 v2 00/14] hw/arm: Tests & ACPI tables fixes for 10.0
Date: Thu,  3 Apr 2025 17:18:15 +0200
Message-ID: <20250403151829.44858-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 6nkP3b0SB1Oy

Hi,

I tried to gather all the hw/arm/-related patches for
the GitLab issues tagged for 10.0.

First, trivial ones fixing / disabling broken tests;
then disable the VMapple machine (not sure about it);
finally fix ACPI tables for '-M its=off' CLI option.

While polishing the series, I noticed MST mentioning
the ACPI changes are likely too late:
https://lore.kernel.org/qemu-devel/20250403100406-mutt-send-email-mst@kernel.org/
I'll defer that jugement to Alex :)

Regards,

Phil.

Philippe Mathieu-Daudé (13):
  tests/functional: Add a decorator for skipping tests on particular OS
  tests/functional: Skip aarch64_replay test on macOS
  tests/qtest: Skip Aarch64 VMapple machine
  hw/arm: Do not build VMapple machine by default
  hw/arm/virt: Remove pointless VirtMachineState::tcg_its field
  hw/intc/gicv3_its: Do not check its_class_name() for NULL
  hw/arm/virt: Simplify create_its()
  hw/arm/virt-acpi: Factor its_enabled() helper out
  qtest/bios-tables-test: Add test for -M virt,its=off
  qtest/bios-tables-test: Whitelist aarch64/virt 'its_off' variant blobs
  hw/arm/virt-acpi: Always build IORT table (even with GIC ITS disabled)
  hw/arm/virt-acpi: Do not advertise disabled GIC ITS
  qtest/bios-tables-test: Update aarch64/virt 'its_off' variant blobs

Pierrick Bouvier (1):
  tests/functional/test_aarch64_rme_virt: fix sporadic failure

 configs/devices/aarch64-softmmu/default.mak |   1 +
 include/hw/arm/virt.h                       |   1 -
 include/hw/intc/arm_gicv3_its_common.h      |   2 +-
 hw/arm/virt-acpi-build.c                    |  48 ++++++++++++--------
 hw/arm/virt.c                               |  23 +++-------
 tests/qtest/bios-tables-test.c              |  22 +++++++++
 tests/qtest/libqtest.c                      |   1 +
 tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 164 bytes
 tests/data/acpi/aarch64/virt/FACP.its_off   | Bin 0 -> 276 bytes
 tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 212 bytes
 tests/functional/qemu_test/__init__.py      |   2 +-
 tests/functional/qemu_test/decorators.py    |  15 +++++-
 tests/functional/test_aarch64_replay.py     |   4 +-
 tests/functional/test_aarch64_rme_virt.py   |   4 +-
 14 files changed, 82 insertions(+), 41 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/FACP.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off

-- 
2.47.1
