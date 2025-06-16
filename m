Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1851625njc;
        Mon, 16 Jun 2025 06:20:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8lC9BE4QpohaHFLAWBiwLlGTp2ioZTWBe9kB7qMMozFJuIDQ14rrIZZ6IfBz5FgWdCIq1F6HofbIWEg==@linaro.org
X-Received: by 2002:a17:903:1b0b:b0:234:a139:11fb with SMTP id d9443c01a7336-2366b1221e8mr132371575ad.27.1750080030979;
        Mon, 16 Jun 2025 06:20:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750080030; cv=none;
        d=google.com; s=arc-20240605;
        b=AFsJvOab0toIYuIFr5XG3rOe04OcWkwA141oowdjAWjyqGP/XlNLvTpqgMN8CD2XXX
         +BeIU5dwVQIUeN8lvzO/vIBCq+2wKiRgoZLdjEkeI01gx6wdWWv2tMXRW4ZcjntDDtCb
         Mhpesz5nLrP6PY8uN3rgm0nQ6VUr8PibHq7OpB3qf1vR+FsNVYii0oLo5RhSW9htkNP1
         LnRwwo6hajm8niARiZ0teD5tQIKST/OTjoZ44S7Qd/BS6wzW9UodanMA1S4qcpwL2WNm
         zz10kWlKYI7yoMBAmk3dRWocE62QzH6FBwucK6Pto/52d0qp5bLrBWFl6fQxu5/ijpkU
         ZKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BjZboSZZUhHnL3j3LLICgav2KEwJ5awXyYH+Nvj74ZU=;
        fh=Nd/0EAz0hFKaFKuJqLinXuZEF/80EWjLDbZLeX6lJpg=;
        b=V6woWUwEyGRqLWkuo8tc+jP71YQE8M0MeKePkkOC/etksK3ab6J80xXjptqknuB+Cm
         xDPOLO3rh57bNe0jV7rFNKX3Amv1vpLbPGAOaOcE9nACM6CvIk2SIrE7YMxBJPKsXCKo
         JeHM/XR/AsMr/lHARb6hFw9aP4287Oz2GCG004SHXuw0PbcxMjVHctwSbArNF7fI8jSm
         uTI2rx9hAwF0TgZXkwpSm8bwFdDvkF627ZDWq4hHnM8GNTh7RoyCfBnyAqJlhzGBe06R
         ZQar0qR5mCg465Tk+3KWA+wPTqhBQW477bNu+mxrAATWDBf6rVuSxOKW/W/dw0ZZm/AX
         nWPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KjlCK96z;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-2364e624c04sor56284425ad.5.2025.06.16.06.20.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Jun 2025 06:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KjlCK96z;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750080030; x=1750684830; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjZboSZZUhHnL3j3LLICgav2KEwJ5awXyYH+Nvj74ZU=;
        b=KjlCK96ztOYExKgszcBbsfBYCYd0vaJnyszHFaWqAWdqlM2siZNIEyJzU61cY2nZKw
         lTc+N7P2yMzS9SGHujw1n81E5JSz97Hfux7lMDs3PIcp0ayY1jRYR51c+e30FxGCJ0fd
         NGy7eg+3oyDfL7PlhiMKD/5LxvHjP//WZQQB4SJh+eLSFr4rwOBdFmUua6vyzx8e0nqF
         062AdW/HMyPXk3r/D6q7hLG6E4cBH7oZVDZUv4fO9K5ElQiHqcJBxJbAguJFfhl3wmW3
         Tr+ItlUtXQ546CbbwryKKL5mYFKgL06VKdx1EoAixypi/fLp4zk13+GbxtQ8vO3prdMx
         vR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080030; x=1750684830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjZboSZZUhHnL3j3LLICgav2KEwJ5awXyYH+Nvj74ZU=;
        b=fmtBiLWfnEBRgiGojkWoWYG/8OwJXlittuvhpErLcD8Z1lnC7DWLqdAGHDJsUHHcmv
         lWD02bEt6ujfNSa+cVTx/LoUrZ4Bp2tFVhD7LLr184WFxGTle/rML8QsiftpMP9X7En8
         CCSvQxEmrmEhl2s79/o9oyJNE1DUr6cf/uwPJgfARec12oZM+D570XziK0ke6LVaQdB5
         IqeZfuZeEB4cW6iWIWQMovNZAKGT5PHBjkR6OUSIji/IFL8tv/qCvHKSKIWUtl2TXYWr
         0c9tLl6eIWQxCs0znsuZUy44hKmMqqtwLNfQu+PciQXacYigrRIC0ts88p53g6FGfK+F
         7HHw==
X-Forwarded-Encrypted: i=1; AJvYcCX5cypBiSLFy10iDFLPP/qLTAqQ6D7ZI59l/r3uTXIsQpLAma+iDUhyv8PXDLps9dFjAmBjwYoLPULKGQ==@linaro.org
X-Gm-Message-State: AOJu0Yx6KM9RfNI8lEcsO4u9bHZow68442IbZdpgumq8KEGtOWWGhj5a
	F1jrw6Cu64DjSVv+PlAuVcf2exSctOuiJoW0YNSWPojYnkH+3xpk7tVssMg0zPKeluTw4w==
X-Gm-Gg: ASbGncsf8xUl/ic95Tq3pyLqRsKeT9KjncBeraWeU6+SfLCzKzYJ8al4zzZCO4U2vgL
	/NJfzL4Uva5RRFmBOoARtx90zvTuwpIhcLvKlsUg8qsMe125m5T66vLmsGlxS8HKle8yuhgLtRw
	X1/7STI1WY27ecoStLZ6kYDg/zHUJ0i5pWVHLQy2hAIMtG4wPTJUpjKRj3aUwHSpDRQHBrRWxGL
	KUiz4UQBdU0A6Vw9Xmj/6aUd715wg72Slc8q39H3oljq48fk2RPE3V/WZbIQMoocrSuXouPoimd
	ghY47p3BGSzbjz2R44605Ev3kar9S3JTYhBhSd26P/ub7fbA1UMpIYlGmnxQV96193LGANuFQs9
	O5A==
X-Google-Smtp-Source: AGHT+IGuIytyjHH6fj9DGmgh59cLftfhnKHQpWpRoYSkbYAeY3EfMYvTFQwzSfW+Y5RdR7QsGZeDsw==
X-Received: by 2002:a17:902:ccd1:b0:234:d2fb:2d0e with SMTP id d9443c01a7336-2366afbc226mr170542005ad.10.1750080030337;
        Mon, 16 Jun 2025 06:20:30 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.60.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm60848405ad.131.2025.06.16.06.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:30 -0700 (PDT)
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
Subject: [PATCH v4 6/8] qtest/bios-tables-test: Add blobs for its=off test on aarch64
Date: Mon, 16 Jun 2025 13:18:22 +0000
Message-Id: <20250616131824.425315-7-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616131824.425315-1-gustavo.romero@linaro.org>
References: <20250616131824.425315-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PwhQ1FGE7xKi

Add blobs for test_acpi_aarch64_virt_tcg_its_off(), which introduces a
new variant, .its_off, that requires variations of the MADT and IORT
tables.

MADT (aka APIC) diff:

+[000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
+[004h 0004   4]                 Table Length : 000000B8
+[008h 0008   1]                     Revision : 04
+[009h 0009   1]                     Checksum : C1
+[00Ah 0010   6]                       Oem ID : "BOCHS "
+[010h 0016   8]                 Oem Table ID : "BXPC    "
+[018h 0024   4]                 Oem Revision : 00000001
+[01Ch 0028   4]              Asl Compiler ID : "BXPC"
+[020h 0032   4]        Asl Compiler Revision : 00000001
+
+[024h 0036   4]           Local Apic Address : 00000000
+[028h 0040   4]        Flags (decoded below) : 00000000
+                         PC-AT Compatibility : 0
+
+[02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
+[02Dh 0045   1]                       Length : 18
+[02Eh 0046   2]                     Reserved : 0000
+[030h 0048   4]        Local GIC Hardware ID : 00000000
+[034h 0052   8]                 Base Address : 0000000008000000
+[03Ch 0060   4]               Interrupt Base : 00000000
+[040h 0064   1]                      Version : 03
+[041h 0065   3]                     Reserved : 000000
+
+[044h 0068   1]                Subtable Type : 0B [Generic Interrupt Controller]
+[045h 0069   1]                       Length : 50
+[046h 0070   2]                     Reserved : 0000
+[048h 0072   4]         CPU Interface Number : 00000000
+[04Ch 0076   4]                Processor UID : 00000000
+[050h 0080   4]        Flags (decoded below) : 00000001
+                           Processor Enabled : 1
+          Performance Interrupt Trigger Mode : 0
+          Virtual GIC Interrupt Trigger Mode : 0
+[054h 0084   4]     Parking Protocol Version : 00000000
+[058h 0088   4]        Performance Interrupt : 00000017
+[05Ch 0092   8]               Parked Address : 0000000000000000
+[064h 0100   8]                 Base Address : 0000000000000000
+[06Ch 0108   8]     Virtual GIC Base Address : 0000000000000000
+[074h 0116   8]  Hypervisor GIC Base Address : 0000000000000000
+[07Ch 0124   4]        Virtual GIC Interrupt : 00000000
+[080h 0128   8]   Redistributor Base Address : 0000000000000000
+[088h 0136   8]                    ARM MPIDR : 0000000000000000
+[090h 0144   1]             Efficiency Class : 00
+[091h 0145   1]                     Reserved : 00
+[092h 0146   2]       SPE Overflow Interrupt : 0000
+
+[094h 0148   1]                Subtable Type : 0E [Generic Interrupt Redistributor]
+[095h 0149   1]                       Length : 10
+[096h 0150   2]                     Reserved : 0000
+[098h 0152   8]                 Base Address : 00000000080A0000
+[0A0h 0160   4]                       Length : 00F60000
+
+[0A4h 0164   1]                Subtable Type : 0F [Generic Interrupt Translator]
+[0A5h 0165   1]                       Length : 14
+[0A6h 0166   2]                     Reserved : 0000
+[0A8h 0168   4]               Translation ID : 00000000
+[0ACh 0172   8]                 Base Address : 0000000008080000
+[0B4h 0180   4]                     Reserved : 00000000

IORT diff:

+[000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
+[004h 0004   4]                 Table Length : 000000EC
+[008h 0008   1]                     Revision : 03
+[009h 0009   1]                     Checksum : 57
+[00Ah 0010   6]                       Oem ID : "BOCHS "
+[010h 0016   8]                 Oem Table ID : "BXPC    "
+[018h 0024   4]                 Oem Revision : 00000001
+[01Ch 0028   4]              Asl Compiler ID : "BXPC"
+[020h 0032   4]        Asl Compiler Revision : 00000001
+
+[024h 0036   4]                   Node Count : 00000003
+[028h 0040   4]                  Node Offset : 00000030
+[02Ch 0044   4]                     Reserved : 00000000
+
+[030h 0048   1]                         Type : 00
+[031h 0049   2]                       Length : 0018
+[033h 0051   1]                     Revision : 01
+[034h 0052   4]                     Reserved : 00000000
+[038h 0056   4]                Mapping Count : 00000000
+[03Ch 0060   4]               Mapping Offset : 00000000
+
+[040h 0064   4]                     ItsCount : 00000001
+[044h 0068   4]                  Identifiers : 00000000
+
+[048h 0072   1]                         Type : 04
+[049h 0073   2]                       Length : 0058
+[04Bh 0075   1]                     Revision : 04
+[04Ch 0076   4]                     Reserved : 00000001
+[050h 0080   4]                Mapping Count : 00000001
+[054h 0084   4]               Mapping Offset : 00000044
+
+[058h 0088   8]                 Base Address : 0000000009050000
+[060h 0096   4]        Flags (decoded below) : 00000001
+                             COHACC Override : 1
+                               HTTU Override : 0
+                      Proximity Domain Valid : 0
+[064h 0100   4]                     Reserved : 00000000
+[068h 0104   8]                VATOS Address : 0000000000000000
+[070h 0112   4]                        Model : 00000000
+[074h 0116   4]                   Event GSIV : 0000006A
+[078h 0120   4]                     PRI GSIV : 0000006B
+[07Ch 0124   4]                    GERR GSIV : 0000006D
+[080h 0128   4]                    Sync GSIV : 0000006C
+[084h 0132   4]             Proximity Domain : 00000000
+[088h 0136   4]      Device ID Mapping Index : 00000000
+
+[08Ch 0140   4]                   Input base : 00000000
+[090h 0144   4]                     ID Count : 0000FFFF
+[094h 0148   4]                  Output Base : 00000000
+[098h 0152   4]             Output Reference : 00000030
+[09Ch 0156   4]        Flags (decoded below) : 00000000
+                              Single Mapping : 0
+
+[0A0h 0160   1]                         Type : 02
+[0A1h 0161   2]                       Length : 004C
+[0A3h 0163   1]                     Revision : 03
+[0A4h 0164   4]                     Reserved : 00000002
+[0A8h 0168   4]                Mapping Count : 00000002
+[0ACh 0172   4]               Mapping Offset : 00000024
+
+[0B0h 0176   8]            Memory Properties : [IORT Memory Access Properties]
+[0B0h 0176   4]              Cache Coherency : 00000001
+[0B4h 0180   1]        Hints (decoded below) : 00
+                                   Transient : 0
+                              Write Allocate : 0
+                               Read Allocate : 0
+                                    Override : 0
+[0B5h 0181   2]                     Reserved : 0000
+[0B7h 0183   1] Memory Flags (decoded below) : 03
+                                   Coherency : 1
+                            Device Attribute : 1
+[0B8h 0184   4]                ATS Attribute : 00000000
+[0BCh 0188   4]           PCI Segment Number : 00000000
+[0C0h 0192   1]            Memory Size Limit : 40
+[0C1h 0193   3]                     Reserved : 000000
+
+[0C4h 0196   4]                   Input base : 00000000
+[0C8h 0200   4]                     ID Count : 000000FF
+[0CCh 0204   4]                  Output Base : 00000000
+[0D0h 0208   4]             Output Reference : 00000048
+[0D4h 0212   4]        Flags (decoded below) : 00000000
+                              Single Mapping : 0
+
+[0D8h 0216   4]                   Input base : 00000100
+[0DCh 0220   4]                     ID Count : 0000FEFF
+[0E0h 0224   4]                  Output Base : 00000100
+[0E4h 0228   4]             Output Reference : 00000030
+[0E8h 0232   4]        Flags (decoded below) : 00000000
+                              Single Mapping : 0

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 0 -> 184 bytes
 tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 0 -> 236 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 3 files changed, 2 deletions(-)
 create mode 100644 tests/data/acpi/aarch64/virt/APIC.its_off
 create mode 100644 tests/data/acpi/aarch64/virt/IORT.its_off

diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/aarch64/virt/APIC.its_off
new file mode 100644
index 0000000000000000000000000000000000000000..37d82e970b1331cb5b259f0bd2d3654bacb2d623
GIT binary patch
literal 184
zcmZ<^@O0k6z`($A(8=G~BUr&HBEVSz2pEB4AU24G0Uik$i-7~iVg@p}17JJ`2AFzr
Zgb>LrJ^_#xE~p*f82CkCMsUFG1ppOZ2>}2A

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/aarch64/virt/IORT.its_off
new file mode 100644
index 0000000000000000000000000000000000000000..0fceb820d509e852ca0849baf568a8e93e426738
GIT binary patch
literal 236
zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=RgMkDCNC*yK9F_<M77!bR
zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@
R!2`+%Dg6Hr$N|zYvjDIZ5CH%H

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a88198d5c2..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/APIC.its_off",
-"tests/data/acpi/aarch64/virt/IORT.its_off",
-- 
2.34.1
