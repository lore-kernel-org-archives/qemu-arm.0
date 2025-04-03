Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4377239njd;
        Thu, 3 Apr 2025 13:41:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUe0/wRA0t51qCSeKjDh5rORohTt21i3H1WaiI7vMzM5dUHWC8p94S2I2jKlzG6Y0jhvpKfYh5aYW+WVQ==@linaro.org
X-Received: by 2002:a05:600c:1553:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43ecf8ecfabmr3493195e9.17.1743712879045;
        Thu, 03 Apr 2025 13:41:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712879; cv=none;
        d=google.com; s=arc-20240605;
        b=CgVAn0ebNl1Wyy39dHJANZLDMpOB6/3imGV2qqZXJI19qx5sEpANAEZwj4uIPXxOUh
         MMwiEYCPW4iwlKqoL50SePisgbnuG2kW6wDCMCQoOrS+37RJw7zGq2yMpTKY8XogV7Fu
         TkbELd5+2/zrCG6MITHwmrERaCcS3FzYJ9ytwVQ458QpIiWsTKhsgQ10htRQ0w4M473h
         C7eDYt8FcG0lTptunVS+297fzUAa07rP6l5K6zjDaW/VhRUjEmjJrhMfvDuw46jUxF1j
         urJO/ASCVCAk9/W2gVG5h4wagWfAAcq+/f4yoEELXZzzmsryPKqxLGUBwXCGQvSXZc6V
         jGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5zTfaj2srAh7NFFgFGPtQA78JVUrBzadEZv8Wvdm4mc=;
        fh=2RHDQoamj/Ois8vvI+g3Vcr2upy5YcMszyKjg/EGsms=;
        b=cb407YREHqTa95R9psCSY5f9BF0sFwoSc6/ql424RLn167icXYnf1lfHtag7uvcRWf
         roNgc2uX5E5ErAzNYb3J7DLSklo6a/PKrznNCR7A14Rw60+pLh2I+wou0j5QArtjR143
         roiYGKk6K/SiGaDxHmmc+AJTgf4HRvoBt3wNeD9amOTvKhtgEFtslaQWYDgcaSATivOk
         MzkpabKQYCXL9ua0kv9oJ7V8P8lUf8rjfy0AItSE1GHTupggUEfzj70BqM0F4ahrxSfu
         FyjQAZ9gZgxoJ62UoPWZ4U73JYcMgsWH7HJMQg+agM/+UiTC0wXafXy9M7B5xzIzjwvg
         IFRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHIVwNnA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec24ebdbbsor10959865e9.8.2025.04.03.13.41.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:41:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHIVwNnA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712878; x=1744317678; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zTfaj2srAh7NFFgFGPtQA78JVUrBzadEZv8Wvdm4mc=;
        b=KHIVwNnAZSCcx6xPkvn0dVaO0Q1fGHcIQzJTqI9JBrp8I/DFjuxzzzaM4MG9iaroec
         2QY3l7cLlWymI9eeBA1u5/d6pwUP0bgUt87ssFys13uzNqcwQKPFpOVBzc3W4YHKtSUp
         CY6in22wSvGE4UHHAh4OoxK/EOJ/TqSWl/dn0FB/n4jZw1m7rxZTWVU39dCxoNGWvK20
         9ERw2FgWk3Q06FdAfd9ysWJZAQxQFEaPiQC4Y4/8Kk4YoyVdU3Op4IolCHyNn1HmKUlM
         CMI8vf4RqkVtKn2FrBTHD6cQPM3eP+pIi032w1tz59pXHUB6fuMkgm2+Jc3tPcBS8bYp
         TpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712878; x=1744317678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zTfaj2srAh7NFFgFGPtQA78JVUrBzadEZv8Wvdm4mc=;
        b=fG/xvw1chdF5kHLYQp4r/JhwNMVqMPfDCgRw4/4V9TBGdbKjDbKxcPbgkEcpRRX1WJ
         S0VfXDr0s0m5wThySU2+/Jdl4fHWRe95rE5a2yc72e7JymfrFGmPmYM3NYKiLwhAh6DY
         QU3KyEkYgra2cepDtYL5X4uK2+mH0QTHdvJoNtvjK0tIdRjQYmzcMOcEdWcsqEHlHCM9
         r4UExuuYj+3j6LZkS9PZn4UQlMwGaiA3Axm8fBbC/6wpsEKPBqvKPViWypDWfYaYvz5c
         of/yiybKveIigQVgwP0KxRdw59o04hW+rhlZBx9YjTZk4KsbokTb18MUsuk1j8WHa1Lj
         Vn3g==
X-Forwarded-Encrypted: i=1; AJvYcCWmjc7PrikRaIl98spsBisuAP2m9M/5VG1e7gy9PVzG9CYx3wQ0/uKTT3aa+oD2xYMwjLeBNJ5tvqOQ7Q==@linaro.org
X-Gm-Message-State: AOJu0Yzd0SBQsf9z7TW4/tNB1oov8ERB4zVq9vjwQ3tVnmyPWdvi4y31
	sNzwceb5XsRPsbFKxm5tPUUUX/HSum7y3GZtR9LFGDvJi41XtS+KARilerg1q43V9DnYkJz24Nz
	sxQc=
X-Gm-Gg: ASbGncvGtVj5UEbItR/H0JtfLmr+7ly36v6pDUXp4vsLJo9Pr2DFLGQ+26NFpTIvNWY
	G30oMFjLSaYtOBc5FSFYLxtUz/lbJopnrK6pn65EjG4c/c2s8ntSVlQbKyoft2q4q+I45I2SEsG
	NmkJAUUzbmLPJNsMKk/i8TOUBIG8XwVwJMNfsl1UJMQZaZ3HFc54nVvZoNs8ZGgg0UBB8uhm+V5
	5mVrwBFy2W2jiesgdqilsT5kQMozXzCXmIor33TJNfUYkKLAOcOovF2zkjwHjEmuImsaPiv+NGM
	AD053cukuqrwpNLIhL02oVweT/nWm24WxJfFPKugsnFVONbMb23jxlZqbjc46hH48fbDbl+FhZ3
	xyednrmtqwEq8jO6PsjWhTqq9
X-Google-Smtp-Source: AGHT+IEYg7yqGL0lozy9IwxV5DIzu2vdi8h1OGoNyGieuji3bi43ZtlFeratq+5HGp/bvCBx8lgV4Q==
X-Received: by 2002:a05:600c:5011:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-43ecfa06fe8mr5687125e9.30.1743712878359;
        Thu, 03 Apr 2025 13:41:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020da49sm2607411f8f.80.2025.04.03.13.41.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:41:17 -0700 (PDT)
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
Subject: [PATCH-for-10.1 v3 9/9] qtest/bios-tables-test: Update aarch64/virt 'its_off' variant blobs
Date: Thu,  3 Apr 2025 22:40:29 +0200
Message-ID: <20250403204029.47958-10-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BGMhFEI2gDUy

Commit the blobs generated by tests/data/acpi/rebuild-expected-aml.sh.

Changes in the tables:

  @@ -1,32 +1,32 @@
   /*
    * Intel ACPI Component Architecture
    * AML/ASL+ Disassembler version 20240927 (64-bit version)
    * Copyright (c) 2000 - 2023 Intel Corporation
    *
    * Disassembly of tests/data/acpi/aarch64/virt/APIC.its_off
    *
    * ACPI Data Table [APIC]
    *
    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
    */

   [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Description Table (MADT)]
  -[004h 0004 004h]                Table Length : 000000B8
  +[004h 0004 004h]                Table Length : 000000A4
   [008h 0008 001h]                    Revision : 04
  -[009h 0009 001h]                    Checksum : A7
  +[009h 0009 001h]                    Checksum : EE
   [00Ah 0010 006h]                      Oem ID : "BOCHS "
   [010h 0016 008h]                Oem Table ID : "BXPC    "
   [018h 0024 004h]                Oem Revision : 00000001
   [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
   [020h 0032 004h]       Asl Compiler Revision : 00000001

   [024h 0036 004h]          Local Apic Address : 00000000
   [028h 0040 004h]       Flags (decoded below) : 00000000
                            PC-AT Compatibility : 0

   [02Ch 0044 001h]               Subtable Type : 0C [Generic Interrupt Distributor]
   [02Dh 0045 001h]                      Length : 18
   [02Eh 0046 002h]                    Reserved : 0000
   [030h 0048 004h]       Local GIC Hardware ID : 00000000
   [034h 0052 008h]                Base Address : 0000000008000000
   [03Ch 0060 004h]              Interrupt Base : 00000000
  @@ -49,37 +49,29 @@
   [06Ch 0108 008h]    Virtual GIC Base Address : 0000000000000000
   [074h 0116 008h] Hypervisor GIC Base Address : 0000000000000000
   [07Ch 0124 004h]       Virtual GIC Interrupt : 00000019
   [080h 0128 008h]  Redistributor Base Address : 0000000000000000
   [088h 0136 008h]                   ARM MPIDR : 0000000000000000
   [090h 0144 001h]            Efficiency Class : 00
   [091h 0145 001h]                    Reserved : 00
   [092h 0146 002h]      SPE Overflow Interrupt : 0000
   [094h 0148 002h]              TRBE Interrupt : 100E

   [094h 0148 001h]               Subtable Type : 0E [Generic Interrupt Redistributor]
   [095h 0149 001h]                      Length : 10
   [097h 0151 002h]                    Reserved : 0000
   [098h 0152 008h]                Base Address : 00000000080A0000
   [0A0h 0160 004h]                      Length : 00F60000

  -[0A4h 0164 001h]               Subtable Type : 0F [Generic Interrupt Translator]
  -[0A5h 0165 001h]                      Length : 14
  -[0A7h 0167 002h]                    Reserved : 0000
  -[0A8h 0168 004h]              Translation ID : 00000000
  -[0ACh 0172 008h]                Base Address : 0000000008080000
  -[0B4h 0180 004h]                    Reserved : 00000000
  +Raw Table Data: Length 164 (0xA4)

  -Raw Table Data: Length 184 (0xB8)
  -
  -    0000: 41 50 49 43 B8 00 00 00 04 A7 42 4F 43 48 53 20  // APIC......BOCHS
  +    0000: 41 50 49 43 A4 00 00 00 04 EE 42 4F 43 48 53 20  // APIC......BOCHS
       0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
       0020: 01 00 00 00 00 00 00 00 00 00 00 00 0C 18 00 00  // ................
       0030: 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00  // ................
       0040: 04 00 00 00 0B 50 00 00 00 00 00 00 00 00 00 00  // .....P..........
       0050: 01 00 00 00 00 00 00 00 17 00 00 00 00 00 00 00  // ................
       0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0070: 00 00 00 00 00 00 00 00 00 00 00 00 19 00 00 00  // ................
       0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0090: 00 00 00 00 0E 10 00 00 00 00 0A 08 00 00 00 00  // ................
  -    00A0: 00 00 F6 00 0F 14 00 00 00 00 00 00 00 00 08 08  // ................
  -    00B0: 00 00 00 00 00 00 00 00                          // ........
  +    00A0: 00 00 F6 00                                      // ....

   /*
    * Intel ACPI Component Architecture
    * AML/ASL+ Disassembler version 20240927 (64-bit version)
    * Copyright (c) 2000 - 2023 Intel Corporation
    *
    * Disassembly of tests/data/acpi/aarch64/virt/FACP
    *
    * ACPI Data Table [FACP]
    *
    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
    */

   [000h 0000 004h]                   Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
   [004h 0004 004h]                Table Length : 00000114
   [008h 0008 001h]                    Revision : 06
  -[009h 0009 001h]                    Checksum : 12
  +[009h 0009 001h]                    Checksum : 14
   [00Ah 0010 006h]                      Oem ID : "BOCHS "
   [010h 0016 008h]                Oem Table ID : "BXPC    "
   [018h 0024 004h]                Oem Revision : 00000001
   [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
   [020h 0032 004h]       Asl Compiler Revision : 00000001

   [024h 0036 004h]                FACS Address : 00000000
   [028h 0040 004h]                DSDT Address : 00000000
   [02Ch 0044 001h]                       Model : 00
   [02Dh 0045 001h]                  PM Profile : 00 [Unspecified]
   [02Eh 0046 002h]               SCI Interrupt : 0000
   [030h 0048 004h]            SMI Command Port : 00000000
   [034h 0052 001h]           ACPI Enable Value : 00
   [035h 0053 001h]          ACPI Disable Value : 00
   [036h 0054 001h]              S4BIOS Command : 00
   [037h 0055 001h]             P-State Control : 00
  @@ -82,35 +82,35 @@
                        Use Platform Timer (V4) : 0
                  RTC_STS valid on S4 wake (V4) : 0
                   Remote Power-on capable (V4) : 0
                    Use APIC Cluster Model (V4) : 0
        Use APIC Physical Destination Mode (V4) : 0
                          Hardware Reduced (V5) : 1
                         Low Power S0 Idle (V5) : 0

   [074h 0116 00Ch]              Reset Register : [Generic Address Structure]
   [074h 0116 001h]                    Space ID : 00 [SystemMemory]
   [075h 0117 001h]                   Bit Width : 00
   [076h 0118 001h]                  Bit Offset : 00
   [077h 0119 001h]        Encoded Access Width : 00 [Undefined/Legacy]
   [078h 0120 008h]                     Address : 0000000000000000

   [080h 0128 001h]        Value to cause reset : 00
  -[081h 0129 002h]   ARM Flags (decoded below) : 0003
  +[081h 0129 002h]   ARM Flags (decoded below) : 0001
                                 PSCI Compliant : 1
  -                       Must use HVC for PSCI : 1
  +                       Must use HVC for PSCI : 0

   [083h 0131 001h]         FADT Minor Revision : 03
   [084h 0132 008h]                FACS Address : 0000000000000000
   [08Ch 0140 008h]                DSDT Address : 0000000000000000
   [094h 0148 00Ch]            PM1A Event Block : [Generic Address Structure]
   [094h 0148 001h]                    Space ID : 00 [SystemMemory]
   [095h 0149 001h]                   Bit Width : 00
   [096h 0150 001h]                  Bit Offset : 00
   [097h 0151 001h]        Encoded Access Width : 00 [Undefined/Legacy]
   [098h 0152 008h]                     Address : 0000000000000000

   [0A0h 0160 00Ch]            PM1B Event Block : [Generic Address Structure]
   [0A0h 0160 001h]                    Space ID : 00 [SystemMemory]
   [0A1h 0161 001h]                   Bit Width : 00
   [0A2h 0162 001h]                  Bit Offset : 00
   [0A3h 0163 001h]        Encoded Access Width : 00 [Undefined/Legacy]
  @@ -164,34 +164,34 @@
   [0F5h 0245 001h]                   Bit Width : 00
   [0F6h 0246 001h]                  Bit Offset : 00
   [0F7h 0247 001h]        Encoded Access Width : 00 [Undefined/Legacy]
   [0F8h 0248 008h]                     Address : 0000000000000000

   [100h 0256 00Ch]       Sleep Status Register : [Generic Address Structure]
   [100h 0256 001h]                    Space ID : 00 [SystemMemory]
   [101h 0257 001h]                   Bit Width : 00
   [102h 0258 001h]                  Bit Offset : 00
   [103h 0259 001h]        Encoded Access Width : 00 [Undefined/Legacy]
   [104h 0260 008h]                     Address : 0000000000000000

   [10Ch 0268 008h]               Hypervisor ID : 00000000554D4551

   Raw Table Data: Length 276 (0x114)

  -    0000: 46 41 43 50 14 01 00 00 06 12 42 4F 43 48 53 20  // FACP......BOCHS
  +    0000: 46 41 43 50 14 01 00 00 06 14 42 4F 43 48 53 20  // FACP......BOCHS
       0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
       0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0070: 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
  -    0080: 00 03 00 03 00 00 00 00 00 00 00 00 00 00 00 00  // ................
  +    0080: 00 01 00 03 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
       0100: 00 00 00 00 00 00 00 00 00 00 00 00 51 45 4D 55  // ............QEMU
       0110: 00 00 00 00                                      // ....

  @@ -1,122 +1,111 @@
   /*
    * Intel ACPI Component Architecture
    * AML/ASL+ Disassembler version 20240927 (64-bit version)
    * Copyright (c) 2000 - 2023 Intel Corporation
    *
    * Disassembly of tests/data/acpi/aarch64/virt/IORT.its_off
    *
    * ACPI Data Table [IORT]
    *
    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
    */

   [000h 0000 004h]                   Signature : "IORT"    [IO Remapping Table]
  -[004h 0004 004h]                Table Length : 000000EC
  +[004h 0004 004h]                Table Length : 000000D4
   [008h 0008 001h]                    Revision : 03
  -[009h 0009 001h]                    Checksum : 57
  +[009h 0009 001h]                    Checksum : A3
   [00Ah 0010 006h]                      Oem ID : "BOCHS "
   [010h 0016 008h]                Oem Table ID : "BXPC    "
   [018h 0024 004h]                Oem Revision : 00000001
   [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
   [020h 0032 004h]       Asl Compiler Revision : 00000001

   [024h 0036 004h]                  Node Count : 00000003
   [028h 0040 004h]                 Node Offset : 00000030
   [02Ch 0044 004h]                    Reserved : 00000000

  -[030h 0048 001h]                        Type : 00
  -[031h 0049 002h]                      Length : 0018
  -[033h 0051 001h]                    Revision : 01
  +[030h 0048 001h]                        Type : 04
  +[031h 0049 002h]                      Length : 0058
  +[033h 0051 001h]                    Revision : 04
   [034h 0052 004h]                  Identifier : 00000000
  -[038h 0056 004h]               Mapping Count : 00000000
  -[03Ch 0060 004h]              Mapping Offset : 00000000
  +[038h 0056 004h]               Mapping Count : 00000001
  +[03Ch 0060 004h]              Mapping Offset : 00000044

  -[040h 0064 004h]                    ItsCount : 00000001
  -[044h 0068 004h]                 Identifiers : 00000000
  -
  -[048h 0072 001h]                        Type : 04
  -[049h 0073 002h]                      Length : 0058
  -[04Bh 0075 001h]                    Revision : 04
  -[04Ch 0076 004h]                  Identifier : 00000001
  -[050h 0080 004h]               Mapping Count : 00000001
  -[054h 0084 004h]              Mapping Offset : 00000044
  -
  -[058h 0088 008h]                Base Address : 0000000009050000
  -[060h 0096 004h]       Flags (decoded below) : 00000001
  +[040h 0064 008h]                Base Address : 0000000009050000
  +[048h 0072 004h]       Flags (decoded below) : 00000001
                                COHACC Override : 1
                                  HTTU Override : 0
                         Proximity Domain Valid : 0
                                 DeviceID Valid : 0
  -[064h 0100 004h]                    Reserved : 00000000
  -[068h 0104 008h]               VATOS Address : 0000000000000000
  -[070h 0112 004h]                       Model : 00000000
  -[074h 0116 004h]                  Event GSIV : 0000006A
  -[078h 0120 004h]                    PRI GSIV : 0000006B
  -[07Ch 0124 004h]                   GERR GSIV : 0000006D
  -[080h 0128 004h]                   Sync GSIV : 0000006C
  -[084h 0132 004h]            Proximity Domain : 00000000
  -[088h 0136 004h]     Device ID Mapping Index : 00000000
  +[04Ch 0076 004h]                    Reserved : 00000000
  +[050h 0080 008h]               VATOS Address : 0000000000000000
  +[058h 0088 004h]                       Model : 00000000
  +[05Ch 0092 004h]                  Event GSIV : 0000006A
  +[060h 0096 004h]                    PRI GSIV : 0000006B
  +[064h 0100 004h]                   GERR GSIV : 0000006D
  +[068h 0104 004h]                   Sync GSIV : 0000006C
  +[06Ch 0108 004h]            Proximity Domain : 00000000
  +[070h 0112 004h]     Device ID Mapping Index : 00000000

  -[08Ch 0140 004h]                  Input base : 00000000
  -[090h 0144 004h]                    ID Count : 0000FFFF
  -[094h 0148 004h]                 Output Base : 00000000
  -[098h 0152 004h]            Output Reference : 00000030
  -[09Ch 0156 004h]       Flags (decoded below) : 00000000
  +[074h 0116 004h]                  Input base : 00000000
  +[078h 0120 004h]                    ID Count : 0000FFFF
  +[07Ch 0124 004h]                 Output Base : 00000000
  +[080h 0128 004h]            Output Reference : 00000030
  +[084h 0132 004h]       Flags (decoded below) : 00000000
                                 Single Mapping : 0

  -[0A0h 0160 001h]                        Type : 02
  -[0A1h 0161 002h]                      Length : 004C
  -[0A3h 0163 001h]                    Revision : 03
  -[0A4h 0164 004h]                  Identifier : 00000002
  -[0A8h 0168 004h]               Mapping Count : 00000002
  -[0ACh 0172 004h]              Mapping Offset : 00000024
  +[088h 0136 001h]                        Type : 02
  +[089h 0137 002h]                      Length : 004C
  +[08Bh 0139 001h]                    Revision : 03
  +[08Ch 0140 004h]                  Identifier : 00000001
  +[090h 0144 004h]               Mapping Count : 00000002
  +[094h 0148 004h]              Mapping Offset : 00000024

  -[0B0h 0176 008h]           Memory Properties : [IORT Memory Access Properties]
  -[0B0h 0176 004h]             Cache Coherency : 00000001
  -[0B4h 0180 001h]       Hints (decoded below) : 00
  +[098h 0152 008h]           Memory Properties : [IORT Memory Access Properties]
  +[098h 0152 004h]             Cache Coherency : 00000001
  +[09Ch 0156 001h]       Hints (decoded below) : 00
                                      Transient : 0
                                 Write Allocate : 0
                                  Read Allocate : 0
                                       Override : 0
  -[0B5h 0181 002h]                    Reserved : 0000
  -[0B7h 0183 001h] Memory Flags (decoded below) : 03
  +[09Dh 0157 002h]                    Reserved : 0000
  +[09Fh 0159 001h] Memory Flags (decoded below) : 03
                                      Coherency : 1
                               Device Attribute : 1
                  Ensured Coherency of Accesses : 0
  -[0B8h 0184 004h]               ATS Attribute : 00000000
  -[0BCh 0188 004h]          PCI Segment Number : 00000000
  -[0C0h 0192 001h]           Memory Size Limit : 40
  -[0C1h 0193 002h]          PASID Capabilities : 0000
  -[0C3h 0195 001h]                    Reserved : 00
  +[0A0h 0160 004h]               ATS Attribute : 00000000
  +[0A4h 0164 004h]          PCI Segment Number : 00000000
  +[0A8h 0168 001h]           Memory Size Limit : 40
  +[0A9h 0169 002h]          PASID Capabilities : 0000
  +[0ABh 0171 001h]                    Reserved : 00

  -[0C4h 0196 004h]                  Input base : 00000000
  -[0C8h 0200 004h]                    ID Count : 000000FF
  -[0CCh 0204 004h]                 Output Base : 00000000
  -[0D0h 0208 004h]            Output Reference : 00000048
  -[0D4h 0212 004h]       Flags (decoded below) : 00000000
  +[0ACh 0172 004h]                  Input base : 00000000
  +[0B0h 0176 004h]                    ID Count : 000000FF
  +[0B4h 0180 004h]                 Output Base : 00000000
  +[0B8h 0184 004h]            Output Reference : 00000030
  +[0BCh 0188 004h]       Flags (decoded below) : 00000000
                                 Single Mapping : 0

  -[0D8h 0216 004h]                  Input base : 00000100
  -[0DCh 0220 004h]                    ID Count : 0000FEFF
  -[0E0h 0224 004h]                 Output Base : 00000100
  -[0E4h 0228 004h]            Output Reference : 00000030
  -[0E8h 0232 004h]       Flags (decoded below) : 00000000
  +[0C0h 0192 004h]                  Input base : 00000100
  +[0C4h 0196 004h]                    ID Count : 0000FEFF
  +[0C8h 0200 004h]                 Output Base : 00000100
  +[0CCh 0204 004h]            Output Reference : 00000030
  +[0D0h 0208 004h]       Flags (decoded below) : 00000000
                                 Single Mapping : 0

  -Raw Table Data: Length 236 (0xEC)
  +Raw Table Data: Length 212 (0xD4)

  -    0000: 49 4F 52 54 EC 00 00 00 03 57 42 4F 43 48 53 20  // IORT.....WBOCHS
  +    0000: 49 4F 52 54 D4 00 00 00 03 A3 42 4F 43 48 53 20  // IORT......BOCHS
       0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
       0020: 01 00 00 00 03 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
  -    0030: 00 18 00 01 00 00 00 00 00 00 00 00 00 00 00 00  // ................
  -    0040: 01 00 00 00 00 00 00 00 04 58 00 04 01 00 00 00  // .........X......
  -    0050: 01 00 00 00 44 00 00 00 00 00 05 09 00 00 00 00  // ....D...........
  -    0060: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
  -    0070: 00 00 00 00 6A 00 00 00 6B 00 00 00 6D 00 00 00  // ....j...k...m...
  -    0080: 6C 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // l...............
  -    0090: FF FF 00 00 00 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
  -    00A0: 02 4C 00 03 02 00 00 00 02 00 00 00 24 00 00 00  // .L..........$...
  -    00B0: 01 00 00 00 00 00 00 03 00 00 00 00 00 00 00 00  // ................
  -    00C0: 40 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // @...............
  -    00D0: 48 00 00 00 00 00 00 00 00 01 00 00 FF FE 00 00  // H...............
  -    00E0: 00 01 00 00 30 00 00 00 00 00 00 00              // ....0.......
  +    0030: 04 58 00 04 00 00 00 00 01 00 00 00 44 00 00 00  // .X..........D...
  +    0040: 00 00 05 09 00 00 00 00 01 00 00 00 00 00 00 00  // ................
  +    0050: 00 00 00 00 00 00 00 00 00 00 00 00 6A 00 00 00  // ............j...
  +    0060: 6B 00 00 00 6D 00 00 00 6C 00 00 00 00 00 00 00  // k...m...l.......
  +    0070: 00 00 00 00 00 00 00 00 FF FF 00 00 00 00 00 00  // ................
  +    0080: 30 00 00 00 00 00 00 00 02 4C 00 03 01 00 00 00  // 0........L......
  +    0090: 02 00 00 00 24 00 00 00 01 00 00 00 00 00 00 03  // ....$...........
  +    00A0: 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00  // ........@.......
  +    00B0: FF 00 00 00 00 00 00 00 30 00 00 00 00 00 00 00  // ........0.......
  +    00C0: 00 01 00 00 FF FE 00 00 00 01 00 00 30 00 00 00  // ............0...
  +    00D0: 00 00 00 00                                      // ....

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 184 -> 164 bytes
 tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 236 -> 212 bytes
 3 files changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 3421dd5adf3..dfb8523c8bf 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/APIC.its_off",
-"tests/data/acpi/aarch64/virt/FACP.its_off",
-"tests/data/acpi/aarch64/virt/IORT.its_off",
diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/aarch64/virt/APIC.its_off
index c37d05d6e05805304f10afe73eb7cb9100fcccfa..f24ac8fbff5261a52434abcfcff96dbdc7709de4 100644
GIT binary patch
delta 18
ZcmdnNxP+0*F~HM#2?GNI%e#qOvj8xy1yKM1

delta 39
jcmZ3&xPy_)F~HM#2Ll5G%kqg_vqbnsfJ`vp;DE6Jpmzmj

diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/aarch64/virt/IORT.its_off
index 0fceb820d509e852ca0849baf568a8e93e426738..25f64407c4aac11bda2d1ac24cd8999a1d84c80d 100644
GIT binary patch
delta 37
tcmaFEc!iP6(?2NW3IhWJ^WuqIYOE{~3@i*2eZv_UCoa`yG?;i%8UVn-3Gn~`

delta 61
zcmcb@_=b_o(?2NW4FdxMbNECqHCYA;21XzU4qzOX2nH6$iKgL<OcQ&x89gTMlm-Aj
CGzq}~

-- 
2.47.1
