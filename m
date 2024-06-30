Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004266njm;
        Sun, 30 Jun 2024 12:00:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpUOKpFY1fV3+R5cGv3neI7iKzYiRJ+LqEunkzWGfkEAWnVLM5lWYyRfxfvYHlXaplR7FowMw27NrYKiWxNx4tNTYdEd1C
X-Received: by 2002:a6b:ce01:0:b0:7eb:7887:a496 with SMTP id ca18e2360f4ac-7f62ee118a2mr450996739f.4.1719774055112;
        Sun, 30 Jun 2024 12:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774055; cv=none;
        d=google.com; s=arc-20160816;
        b=dwLfOWxrUWyHU0Al/VmTSdLR8kolSc5XMtuNmfsZynO3DpPZH2P0zd617+yiWNDPRb
         9EX9rp72PR0iYs6S8mh8bsgt6zdA6hzconaQdg/NDAHJJSRKmaXGJaAWZlZ7+/opAWB9
         1hE6I2aaOfHQS7FEwGubF9peK47iYiKSIK8mqP0a+jZMyO7CY5b0xH22jaALtWeHSeps
         EiXD6wz9KbuqaYllqpQ706ktoU2gptrb/aZAbSv0dPojbs0Nbsd8GnMGRIfZEGvUo3CQ
         ZF32bw+LxaG0/Wz0NexRG65LtGP+bbv3wvFD0deRuOBNF42ILvxsOuExojY/YhgGSgQS
         lDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FTAXIrXnB/PD2XabsVpOCoLz7F3reaebPtysv0EnFvo=;
        fh=72IGH6KR0FwGuHz77GMLUhkLFbskHpE6XnvYTnmyK24=;
        b=PPhPSi5jquJhncjxLWnfVvoYrWbCWyn0JuoHnLJjH8xuawZzpa5OckR03UaXOpsTZ+
         GTMOxizMgAvrJ1D3k/dZu4NFS9Dr29qeIjWvuErIxcTSgnFV3MOcmLNWyTjYh60696XC
         hWuIhRt6VzOmu648OSAaoeJqWiydOmvx7WcvJSq7qjLHq5Fdr3pJw4agfolFcaGeLoP3
         znrpaRYvZu5gPC9PG7zohEqUlFyI1d7RZlV5h4/yuqIUtj8+2sw/V5AsfMk7XRC0O5Vk
         IH9sDiegoDmANVGoOGI37JYf3YeplQi1DDzKMO9FpwC7GeiZLhbKboGOxOZtoeL3hqAq
         umKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BbzNKBMu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ca18e2360f4ac-7f454425ffesor368446339f.4.2024.06.30.12.00.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:00:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BbzNKBMu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774054; x=1720378854; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTAXIrXnB/PD2XabsVpOCoLz7F3reaebPtysv0EnFvo=;
        b=BbzNKBMuLDmXCErca4ktk4PWkr5qojMD5sPpKk/a0WfyqUHfgk+lhqYP7mobJhss7l
         PlHiz7dL4Vf6npr86EvwaAS8naF14zF1h9MLq5UYRnib5XTgm8J9R/4QxrP0eIpADYs0
         ywv/eFEHRkwB9Ak0D1jJTzlM8Zf95TeNSTc9HnU0m7J4zTiktsP8j810Hfx1gsQ27RmF
         wqmTLHwHWmjrMx9gBy7fuXTb3CPhq1y3mtxdOdUDTaeWojjANRYRdMDDFUC9mL/S1Nxm
         4hrWf+owM5fVDXkV30eIWz1EQwg2lRsO3DK7t0uTVbKIdxzlL8gTmx5OHXWWVPHqzO/Q
         XFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774054; x=1720378854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTAXIrXnB/PD2XabsVpOCoLz7F3reaebPtysv0EnFvo=;
        b=CNLeO+O4s5IWdEQ1RhE5O0/IbfW3+3ChA/J6U2BPg/MhxAJktOSph0pDUX2IMAbUui
         hzb0Q4hEC9UdjnwSpBuii6t4Un50zDVnClAG5N1qgTcxGugJ7m0bQBv+zw8KH325ysvK
         06xT9MN05Z2aIWlWPB28cFJ7Vt3FQp73Lg7LYlFIdKMQmOApVd0Pac7o3zeKGLHrBfe3
         MpCPerQflO7pa6SW0bNeSFHcuMhI72jErLbNohbiNO7z4UIiVsxJ2GJZHAs8HNzv1gwM
         3tC/1bscUG6G7AQnVTh3qrIxJ2C4cOFmGw3HU6+BCsBr2GJXBhB7AYeu8hZneqfux0XE
         2/GA==
X-Forwarded-Encrypted: i=1; AJvYcCWynOe+udMv4cocn3KsmmfVX3niaTj8qOsXZ2ejp+HeskLD/RKrGWGzAcAZEtoLsFPF0Wfn8Z8HHXt48DDGlger7dwewJWn
X-Gm-Message-State: AOJu0YyqXgdJOPfH0g9YAdLrdxDpeXbJx3GAFebZa3At5AnUSNwGT1NE
	aqnTa9l/Vatua+/akeUj7x2E7Oz8FKXOydoIwjHSfhA2TbON4CfD7e7DIkm755Nw4g==
X-Google-Smtp-Source: AGHT+IGeyG1uFDyEn4u8ALv9U6tD54FmsB7XnO/jbeP+xinE/zkVpczxZMsm3jzcIvwVlpbV2A1akg==
X-Received: by 2002:a6b:ce01:0:b0:7eb:7887:a496 with SMTP id ca18e2360f4ac-7f62ee118a2mr450992939f.4.1719774054553;
        Sun, 30 Jun 2024 12:00:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:00:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 02/14] tests/tcg: Adjust variable defintion from cc-option
Date: Sun, 30 Jun 2024 12:00:38 -0700
Message-Id: <20240630190050.160642-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KjeaxMldQK/A

Define the variable to the compiler flag used, not "y".
This avoids replication of the compiler flag itself.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/Makefile.target                 |  2 +-
 tests/tcg/aarch64/Makefile.softmmu-target |  2 +-
 tests/tcg/aarch64/Makefile.target         | 15 ++++++++-------
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index f21be50d3b..cb8cfeb6da 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -49,7 +49,7 @@ quiet-command = $(call quiet-@,$2,$3)$1
 
 cc-test = $(CC) -Werror $1 -c -o /dev/null -xc /dev/null >/dev/null 2>&1
 cc-option = if $(call cc-test, $1); then \
-    echo "$(TARGET_PREFIX)$1 detected" && echo "$(strip $2)=y" >&3; else \
+    echo "$(TARGET_PREFIX)$1 detected" && echo "$(strip $2)=$(strip $1)" >&3; else \
     echo "$(TARGET_PREFIX)$1 not detected"; fi
 
 # $1 = test name, $2 = cmd, $3 = desc
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 4b03ef602e..39d3f961c5 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -81,7 +81,7 @@ run-memory-replay: memory-replay run-memory-record
 EXTRA_RUNS+=run-memory-replay
 
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
-pauth-3: CFLAGS += -march=armv8.3-a
+pauth-3: CFLAGS += $(CROSS_CC_HAS_ARMV8_3)
 else
 pauth-3:
 	$(call skip-test, "BUILD of $@", "missing compiler support")
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 70d728ae9a..e6d5e008a8 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -32,17 +32,17 @@ config-cc.mak: Makefile
 
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
 AARCH64_TESTS += dcpop
-dcpop: CFLAGS += -march=armv8.2-a
+dcpop: CFLAGS += $(CROSS_CC_HAS_ARMV8_2)
 endif
 ifneq ($(CROSS_CC_HAS_ARMV8_5),)
 AARCH64_TESTS += dcpodp
-dcpodp: CFLAGS += -march=armv8.5-a
+dcpodp: CFLAGS += $(CROSS_CC_HAS_ARMV8_5)
 endif
 
 # Pauth Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
-pauth-%: CFLAGS += -march=armv8.3-a
+pauth-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_3)
 run-pauth-1: QEMU_OPTS += -cpu max
 run-pauth-2: QEMU_OPTS += -cpu max
 # Choose a cpu with FEAT_Pauth but without FEAT_FPAC for pauth-[45].
@@ -54,7 +54,7 @@ endif
 # bti-1 tests the elf notes, so we require special compiler support.
 ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
 AARCH64_TESTS += bti-1 bti-3
-bti-1 bti-3: CFLAGS += -fno-stack-protector -mbranch-protection=standard
+bti-1 bti-3: CFLAGS += -fno-stack-protector $(CROSS_CC_HAS_ARMV8_BTI)
 bti-1 bti-3: LDFLAGS += -nostdlib
 endif
 # bti-2 tests PROT_BTI, so no special compiler support required.
@@ -63,12 +63,13 @@ AARCH64_TESTS += bti-2
 # MTE Tests
 ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
 AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7
-mte-%: CFLAGS += -march=armv8.5-a+memtag
+mte-%: CFLAGS += $(CROSS_CC_HAS_ARMV8_MTE)
 endif
 
 # SME Tests
 ifneq ($(CROSS_AS_HAS_ARMV9_SME),)
 AARCH64_TESTS += sme-outprod1 sme-smopa-1 sme-smopa-2
+sme-outprod1 sme-smopa-1 sme-smopa-2: CFLAGS += $(CROSS_AS_HAS_ARMV9_SME)
 endif
 
 # System Registers Tests
@@ -98,7 +99,7 @@ TESTS += sha512-vector
 ifneq ($(CROSS_CC_HAS_SVE),)
 # SVE ioctl test
 AARCH64_TESTS += sve-ioctls
-sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
+sve-ioctls: CFLAGS += $(CROSS_CC_HAS_SVE)
 
 sha512-sve: CFLAGS=-O3 -march=armv8.1-a+sve
 sha512-sve: sha512.c
@@ -133,7 +134,7 @@ endif
 
 ifneq ($(CROSS_CC_HAS_SVE2),)
 AARCH64_TESTS += test-826
-test-826: CFLAGS+=-march=armv8.1-a+sve2
+test-826: CFLAGS += $(CROSS_CC_HAS_SVE2)
 endif
 
 TESTS += $(AARCH64_TESTS)
-- 
2.34.1
