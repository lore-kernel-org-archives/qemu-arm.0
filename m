Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5072672ejc;
        Thu, 31 Aug 2023 06:00:13 -0700 (PDT)
X-Received: by 2002:a05:6000:146:b0:313:f957:bf29 with SMTP id r6-20020a056000014600b00313f957bf29mr3960390wrx.65.1693486813412;
        Thu, 31 Aug 2023 06:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693486813; cv=none;
        d=google.com; s=arc-20160816;
        b=dafU347cQlvanHMXNQihkQU+F6Vuftq4XB1HDuUUZZd5IMvy8OIdFCLu9M/PedBmQb
         BK5/C5q6BfjjMvO5KcaHHvvGPpW5l6tPEUXkwSu6LiP+aCmPlMzvOxcX7OVhZB+8vXBC
         oGqqe3EqCMTBgk6ezoUcrSBI4mc4Dz/GGMTgkLA+zNoGV7BihJ+Px3iqcr+L6a0C0FrU
         bCVOfLrRE1otQpXMK2XAwTShw24ajDVqwen3rCXpoBAw2C/I5ttTnrqkCxjD4J0dfj4j
         tRgjODqLigYYMUsuhsh2cWa8aOCtJiv3sIbyszlZhxOZ1EjLPNmPYZhg3daetCGxk+TT
         RURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VP+M0BihzQYUg4SRwLkLGrk4ZyudSjdzOazRzuk1iZE=;
        fh=D11LPqsqtRG3OcfDKhwB9TsaMWxCXXI3v0uU7V7xNIk=;
        b=s44U/zIUDowZg7Ns2tTsBppuB16zeOrYnwVI+ucntDHM7+04zfy/6dBuG/vaz2p2cn
         9wK64y7il3z5/ZekeNXI4zJjHhsdgDeUdU1tb6tKRBXhVW2pXk2gEGyL4Zs/UxrU5blY
         xu56FkBoth6urh7DHFPYKUhp2PciJARQvSpegxCdxUzBvQZqqR7sJKZTTyj84gtyPRwS
         V0aoVmuS0t0Xzqf8LMdkoy7vUmx7ZuT3kIszREqhPTYdF/YHrWsiViA0CxoqY0nJkhLL
         KqtYPW29Iv6Ho+BV1IcGgnMR77+CDxsD2vaU64U8jj8eQ4iO2u/trhbzIe3mtaNVe68+
         8OQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=letVK4ht;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8-20020a05600c228800b003fbe4cecc3dsor538428wmf.5.2023.08.31.06.00.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 Aug 2023 06:00:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=letVK4ht;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693486813; x=1694091613; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VP+M0BihzQYUg4SRwLkLGrk4ZyudSjdzOazRzuk1iZE=;
        b=letVK4ht5FSOi1pm0BidPpk2NdVgAsp6Jy3y+iroKF2sfBf1lDsvnq2EhlQPoUDU72
         JLWKCThyuAZFEaqNfR1EI8eS8Pg0tM81K5oRCa9W8wgoUHvnqFI7grV2qbuu7jxOr1wx
         6fTx20AqApJRpa2Vjs/jP9kM7TLZzOvct2szMMdoPG5low1kGHgZRqa9e/jPi48Og/X2
         ztbxwmUuY1nCbr4Szo0FO/2NQjricqmDYTKFPkVL8c7lliyn0kYO7W1qqN8kloBriJVq
         LOz3U3EbHsBuBYD39NdYLdyFeIb08XrNzlfgkBaN6EjQAwzLCm6Su86736Lsz9vMhYMl
         t6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693486813; x=1694091613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VP+M0BihzQYUg4SRwLkLGrk4ZyudSjdzOazRzuk1iZE=;
        b=HNGrLkVTMCXClzcO/bSWsFYhUoNB8ahjmEpOIaIHZ1/pMK5a1QNRe5iKcU7rDM6z7M
         h4s1SpckwlPa9bBPvT8FkMYHgD7Jd56xIqmMn1itz1MetsIBgUCm+6x3fd8369HYna9P
         8E80wGO8qDkZwvnYK1E9KIxBIX1mjwOdxMdzZ0rp+lUiwr/J54bsIFFUw4gRhaMAiS+3
         wo3YM7QYomei2XkWRtuEIgV/yrulwJd4zkCkYWK/goJOH9sZInJkynpceOq4DHMRN8BS
         OCbSJkTQS5d9y/ntqJkMxV3fyFPeEi1UaX1I27bG6Li0RnX9xvB2PRlN/BiA2vxNXiED
         Wzqg==
X-Gm-Message-State: AOJu0Yy3StKhgbDgMq7lowuAAPb6n+mx+iK5fHZsUhu4Vtc/eaR2kEdx
	WxUwMgknKOg+NMtkbcKm+6G9wFzq
X-Google-Smtp-Source: AGHT+IFkLUG8FoqYQGLxIWmAujQUC1t2HyWpTmJZPehMql7lR3V8T4TK2NlQ8qw0KI6hEXg35E48Zw==
X-Received: by 2002:a5d:6888:0:b0:319:854f:7b02 with SMTP id h8-20020a5d6888000000b00319854f7b02mr4148884wru.51.1693486813078;
        Thu, 31 Aug 2023 06:00:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.187.199.245])
        by smtp.gmail.com with ESMTPSA id s16-20020adfecd0000000b0030ada01ca78sm2179819wro.10.2023.08.31.06.00.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 31 Aug 2023 06:00:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-block@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Sergio Lopez <slp@redhat.com>
Subject: [PULL 34/41] hw/i386: Rename 'hw/kvm/clock.h' -> 'hw/i386/kvm/clock.h'
Date: Thu, 31 Aug 2023 14:56:36 +0200
Message-ID: <20230831125646.67855-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zLuc0hovhpyE

kvmclock_create() is only implemented in hw/i386/kvm/clock.h.
Restrict the "hw/kvm/clock.h" header to i386 by moving it to
hw/i386/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230620083228.88796-3-philmd@linaro.org>
---
 {include/hw => hw/i386}/kvm/clock.h | 4 ++--
 hw/i386/kvm/clock.c                 | 2 +-
 hw/i386/microvm.c                   | 2 +-
 hw/i386/pc_piix.c                   | 2 +-
 hw/i386/pc_q35.c                    | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename {include/hw => hw/i386}/kvm/clock.h (85%)

diff --git a/include/hw/kvm/clock.h b/hw/i386/kvm/clock.h
similarity index 85%
rename from include/hw/kvm/clock.h
rename to hw/i386/kvm/clock.h
index 3efe0a871c..401c7e445b 100644
--- a/include/hw/kvm/clock.h
+++ b/hw/i386/kvm/clock.h
@@ -10,8 +10,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#ifndef HW_KVM_CLOCK_H
-#define HW_KVM_CLOCK_H
+#ifndef HW_I386_KVM_CLOCK_H
+#define HW_I386_KVM_CLOCK_H
 
 void kvmclock_create(bool create_always);
 
diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
index 0824c6d313..34348a3324 100644
--- a/hw/i386/kvm/clock.c
+++ b/hw/i386/kvm/clock.c
@@ -22,7 +22,7 @@
 #include "kvm/kvm_i386.h"
 #include "migration/vmstate.h"
 #include "hw/sysbus.h"
-#include "hw/kvm/clock.h"
+#include "hw/i386/kvm/clock.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 6b762bc18e..8deeb62774 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -32,7 +32,7 @@
 
 #include "hw/loader.h"
 #include "hw/irq.h"
-#include "hw/kvm/clock.h"
+#include "hw/i386/kvm/clock.h"
 #include "hw/i386/microvm.h"
 #include "hw/i386/x86.h"
 #include "target/i386/cpu.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 3de8e0d741..5cbad6ad84 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -46,7 +46,7 @@
 #include "hw/ide/piix.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
-#include "hw/kvm/clock.h"
+#include "hw/i386/kvm/clock.h"
 #include "hw/sysbus.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "exec/memory.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index a95c5d046e..0bd68690f5 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -35,7 +35,7 @@
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "sysemu/kvm.h"
-#include "hw/kvm/clock.h"
+#include "hw/i386/kvm/clock.h"
 #include "hw/pci-host/q35.h"
 #include "hw/pci/pcie_port.h"
 #include "hw/qdev-properties.h"
-- 
2.41.0
