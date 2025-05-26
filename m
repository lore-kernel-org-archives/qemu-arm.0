Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3992573njc;
        Sun, 25 May 2025 22:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTIURwrinu6gU9iIb6Mt+2OLpplzDqUBW1xRqdf3thsImGnaHqvi8J/130Qe1ggidR6DbDlk0yMCgO3w==@linaro.org
X-Received: by 2002:a05:6102:3590:b0:4db:154e:ad1d with SMTP id ada2fe7eead31-4e42406ace7mr6478592137.2.1748237533517;
        Sun, 25 May 2025 22:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748237533; cv=none;
        d=google.com; s=arc-20240605;
        b=RCtV67+MhjRxPt4dg/gfCnJt5/iueB3K7fM/WdyeNapNjEOC8Ze2+Xt4rUjyVLNWF5
         Zn+Qm70BiQ7JMZFTfrHbWXvE7TMx0n8w6Z7E2Ep5WqHQWZaqAQg4oozsa9irhxKvmo+q
         e4xWNjimRAbmbeFQzt/L4fgbPjtY9+njCJEmUDQM0blI2W5q+kM6nMo8x9LP9nav+sdB
         psTszD8EA92OMKygSu1X/pRC3PlL4AiLEyYM+EYw4XwqY5RAC2/hDDjairn8G3kU7fu4
         63MQiIbusZbB+TKIwwxw6ihkTNA1OORJnuTqPU4SPruoSgXwTryRbV5MpUHzJBMnZ2Mh
         OSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qOCs6sIHFoENBFWNyjNWt4Qbm+G3lxVEjRLR6eqMmps=;
        fh=RVHvlu9JZC0Df8P5m02/nTPN3N0rvCpka4eRLaZOax4=;
        b=C9qCKVQaymnKZZqS2rvhXUpbQ0LlE5+Ug4IEUrW4yIfkoSAPPSrN5FoktP8VDxTUFj
         DXoFLiRUklvmrfir9jOQItHBzCIv8L89ROkPm1XX2hyZN5dDhmnaP11Kv2pTmcAUqP6/
         fw+dQ5upbRH8M4JmEdyBxW1eEdgQ/G39OW5KjxnAlmFvp+apPfIQuXZrDjCrnvVEWfgt
         aDC5Rp4v6eqCfLeM7XEANpWNjVu8Zxeus5spimtAPBjYkH0nKtwGSJyWR31lQd5uy/VX
         ODoyMQLmQMzA5bqUjYZH2Opf3lQLOi+8vAC3wETHxTDjcju/cgF9XSUJqq2/sQZG+AyW
         7lxQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqAHsWbh;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ada2fe7eead31-4e455ac167fsor357756137.5.2025.05.25.22.32.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 22:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wqAHsWbh;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748237533; x=1748842333; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOCs6sIHFoENBFWNyjNWt4Qbm+G3lxVEjRLR6eqMmps=;
        b=wqAHsWbh8Wn62g2gmEBbsFHhDhJ/fppD2JUcsLCJVHVMxipf7wPcC2l1FTDsJhfRwA
         Y6YBFMZQWGsDJ/Fmo9FH+KDTyZtIoZ0bwCiMJirrHguvJGVYYohvxJHLPX5PW7sImmB7
         RrZova2fsKaJAjavspA5bRbCRtqNyaI2+62bdoSVwOwTp58bBUI6ncd6Vd+hf8ozWtol
         87ULb0fKtTtMtynErCSxEw868nYY0pLgF4llVms1Lr0n3Jzbbmh+XCw0jSlLy1umjy9m
         v5MYZN4Agu3u3Aaei3c0hDmXR+ipJ2ObS7jBG6W+vQZsgh7802tOTyCUmFiS0BXMXRNK
         GkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748237533; x=1748842333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOCs6sIHFoENBFWNyjNWt4Qbm+G3lxVEjRLR6eqMmps=;
        b=K5L3ewGpzJ1vTvwrMtVDb6Pp7TeH4JelE04ubNrQY+BB14vBHkJG1v5icDIimeHZ0e
         CqNDh9g7k4ZISY5AEpXwPUMeo7qJyG7IXNmGhSJ2aLB83270+vGoo0XO/VlibF8OsB/l
         0XxqKbYZ2b61ODnCGAlRlRZ2yRY/tfylyPSfDIu8ZmYXBpKAUzZtnZsiY5f+dPKDxqGT
         y42TrQhozTCmOrxtfKBjn5C3ifK/n9FZq97yA6tm65E3zBpwiITJZEi1xJr/jem0jF1X
         Z3zJ3/p4hTV209lAXt2Ns95t+LwGSObSzmgthKBeRQ3bGRBTrniERx3HwQ/HaYyPtffc
         R3cg==
X-Forwarded-Encrypted: i=1; AJvYcCXjryrO0NwO9dz4VNarlMmsHG8EC1nxi5B0vSVATcnRkqyIZTmZRz3wQKL/pgSFi2epFxTG1BEz0vQc6A==@linaro.org
X-Gm-Message-State: AOJu0YwbIbwiyrPWppQWC+OO88a9TKJfnrzg9yTAZvTO6pWHHQDxy6+D
	B0by1AkkLt7VTORkUyWh/8lw+zUlEBYwyfKTuJADJ/iaUBUIcTIHwxW1kjbwa9MnctI70Q==
X-Gm-Gg: ASbGncsuh55GN7EO0r3QdsVgR4iKUjJQkTVGTkMnD1I3kw0nIJ8MNKnK6JChm9vy4+w
	0sy+UguGdawNTWPo+NFf3qbnswTDLN3myUKkn+Njo/KeABPOWL2TR6Boz917hrRdw8pG25e6r9/
	NgkxlDNgEsH5/wYImCQPrTv7jZPeVu5zWSHu/+vaFqX7yNZTHusaK1NiTWihUS0kFu78KOiA/QK
	kZni5gRCsNZQjlkMyxMca/CyM8jHExWoZQhjs/iOr7nsNXlCscfe4X6G4nxlksT6Alh+HWYbEI+
	RJTamE1MrWqy/f+wPl4y5Wt26bKZdNn6j6UjRg7hUeYFfaTiwZyFf0cghV0dd24WqdCMalCbUM2
	w3MWo98fHsdAVQprPenoT1g==
X-Google-Smtp-Source: AGHT+IFT2zT3HAIPKWzDmM1J5YoKESeOMuAwH5LxDKXRnJmFa6uv20iY/UesUdYTxqQ2LSEJW3lJqQ==
X-Received: by 2002:a05:6102:3a08:b0:4bb:c24b:b658 with SMTP id ada2fe7eead31-4e424164587mr5887613137.18.1748237533030;
        Sun, 25 May 2025 22:32:13 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. (200-100-75-183.dial-up.telesp.net.br. [200.100.75.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e454da4378sm784310137.17.2025.05.25.22.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 22:32:12 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org,
	eric.auger@redhat.com
Cc: qemu-arm@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org,
	alex.bennee@linaro.org,
	mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH 5/5] qtest/bios-tables-test: Update aarch64/virt 'acpipcihp' variant blob
Date: Mon, 26 May 2025 05:31:23 +0000
Message-Id: <20250526053123.1434204-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526053123.1434204-1-gustavo.romero@linaro.org>
References: <20250526053123.1434204-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: trHR1wKtjO0H

Update the .acpipcihp blob variant for the aarch64 'virt' machine. Since
this is a new blob, the diff is large and not particularly useful, so
below is the diff against the base DSDT blob with ACPI PCI off.

Main changes include:

a) The _OSC method, which now allows the platform to control PCIe
   hotplug (masking Local0 against 0x1E), whereas previously it was
   controlled by the OS;
b) New regions in _SB.PCI0 to handle bus selection and device ejection;
c) Addition of a PDSM method (invoked by _DSM);
d) A new device PHPR, which reserves the memory regions used by QEMU's
   acpi-pci-hotplug mechanism;
e) A new event in the GED device used to notify PCI device hotplug and
   unplug.

DSDT diff against base aarch64/virt machine with acpi-pcihp=off:

 DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\_SB)
     {
         Device (C000)
         {
             Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
             Name (_UID, Zero)  // _UID: Unique ID
         }

@@ -1795,33 +1795,33 @@
                     0x0000008000000000, // Range Minimum
                     0x000000FFFFFFFFFF, // Range Maximum
                     0x0000000000000000, // Translation Offset
                     0x0000008000000000, // Length
                     ,, , AddressRangeMemory, TypeStatic)
             })
             Name (SUPP, Zero)
             Name (CTRL, Zero)
             Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
             {
                 CreateDWordField (Arg3, Zero, CDW1)
                 If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                 {
                     CreateDWordField (Arg3, 0x04, CDW2)
                     CreateDWordField (Arg3, 0x08, CDW3)
                     Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
-                    Local0 &= 0x1F
+                    Local0 &= 0x1E
                     If ((Arg1 != One))
                     {
                         CDW1 |= 0x08
                     }

                     If ((CDW3 != Local0))
                     {
                         CDW1 |= 0x10
                     }

                     CDW3 = Local0
                 }
                 Else
                 {
                     CDW1 |= 0x04
                 }
@@ -1852,53 +1852,217 @@
             {
                 Name (_HID, "PNP0C02" /* PNP Motherboard Resources */)  // _HID: Hardware ID
                 Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                 {
                     QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                         0x0000000000000000, // Granularity
                         0x0000004010000000, // Range Minimum
                         0x000000401FFFFFFF, // Range Maximum
                         0x0000000000000000, // Translation Offset
                         0x0000000010000000, // Length
                         ,, , AddressRangeMemory, TypeStatic)
                 })
             }
         }
     }

+    Scope (_SB.PCI0)
+    {
+        OperationRegion (PCST, SystemMemory, 0x090C0000, 0x08)
+        Field (PCST, DWordAcc, NoLock, WriteAsZeros)
+        {
+            PCIU,   32,
+            PCID,   32
+        }
+
+        OperationRegion (SEJ, SystemMemory, 0x090C0008, 0x04)
+        Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
+        {
+            B0EJ,   32
+        }
+
+        OperationRegion (BNMR, SystemMemory, 0x090C0010, 0x08)
+        Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
+        {
+            BNUM,   32,
+            PIDX,   32
+        }
+
+        Mutex (BLCK, 0x00)
+        Method (PCEJ, 2, NotSerialized)
+        {
+            Acquire (BLCK, 0xFFFF)
+            BNUM = Arg0
+            B0EJ = (One << Arg1)
+            Release (BLCK)
+            Return (Zero)
+        }
+
+        Method (AIDX, 2, NotSerialized)
+        {
+            Acquire (BLCK, 0xFFFF)
+            BNUM = Arg0
+            PIDX = (One << Arg1)
+            Local0 = PIDX /* \_SB_.PCI0.PIDX */
+            Release (BLCK)
+            Return (Local0)
+        }
+
+        Method (PDSM, 5, Serialized)
+        {
+            If ((Arg2 == Zero))
+            {
+                Local0 = Buffer (One)
+                    {
+                         0x00                                             // .
+                    }
+                If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+                {
+                    Return (Local0)
+                }
+
+                If ((Arg1 < 0x02))
+                {
+                    Return (Local0)
+                }
+
+                Local1 = Zero
+                Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
+                    ))
+                If (!((Local2 == Zero) | (Local2 == 0xFFFFFFFF)))
+                {
+                    Local1 |= One
+                    Local1 |= (One << 0x07)
+                }
+
+                Local0 [Zero] = Local1
+                Return (Local0)
+            }
+
+            If ((Arg2 == 0x07))
+            {
+                Local2 = AIDX (DerefOf (Arg4 [Zero]), DerefOf (Arg4 [One]
+                    ))
+                Local0 = Package (0x02) {}
+                If (!((Local2 == Zero) || (Local2 == 0xFFFFFFFF)))
+                {
+                    Local0 [Zero] = Local2
+                    Local0 [One] = ""
+                }
+
+                Return (Local0)
+            }
+        }
+    }
+
+    Scope (\_SB.PCI0)
+    {
+        Method (EDSM, 5, Serialized)
+        {
+            If ((Arg2 == Zero))
+            {
+                Local0 = Buffer (One)
+                    {
+                         0x00                                             // .
+                    }
+                If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
+                {
+                    Return (Local0)
+                }
+
+                If ((Arg1 < 0x02))
+                {
+                    Return (Local0)
+                }
+
+                Local0 [Zero] = 0x81
+                Return (Local0)
+            }
+
+            If ((Arg2 == 0x07))
+            {
+                Local0 = Package (0x02)
+                    {
+                        Zero,
+                        ""
+                    }
+                Local1 = DerefOf (Arg4 [Zero])
+                Local0 [Zero] = Local1
+                Return (Local0)
+            }
+        }
+
+        Device (PHPR)
+        {
+            Name (_HID, "PNP0A06" /* Generic Container Device */)  // _HID: Hardware ID
+            Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
+            Name (_STA, 0x0B)  // _STA: Status
+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                IO (Decode16,
+                    0x0000,             // Range Minimum
+                    0x0000,             // Range Maximum
+                    0x01,               // Alignment
+                    0x00,               // Length
+                    )
+            })
+        }
+
+        Device (S00)
+        {
+            Name (_ADR, Zero)  // _ADR: Address
+        }
+
+        Device (S08)
+        {
+            Name (_ADR, 0x00010000)  // _ADR: Address
+        }
+
+        Method (PCNT, 0, NotSerialized)
+        {
+        }
+    }
+
     Scope (\_SB)
     {
         Device (\_SB.GED)
         {
             Name (_HID, "ACPI0013" /* Generic Event Device */)  // _HID: Hardware ID
             Name (_UID, "GED")  // _UID: Unique ID
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
             {
                 Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                 {
                     0x00000029,
                 }
             })
             OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
             Field (EREG, DWordAcc, NoLock, WriteAsZeros)
             {
                 ESEL,   32
             }

             Method (_EVT, 1, Serialized)  // _EVT: Event
             {
                 Local0 = ESEL /* \_SB_.GED_.ESEL */
                 If (((Local0 & 0x02) == 0x02))
                 {
                     Notify (PWRB, 0x80) // Status Change
                 }
+
+                If (((Local0 & 0x10) == 0x10))
+                {
+                    Acquire (\_SB.PCI0.BLCK, 0xFFFF)
+                    \_SB.PCI0.PCNT ()
+                    Release (\_SB.PCI0.BLCK)
+                }
             }
         }

         Device (PWRB)
         {
             Name (_HID, "PNP0C0C" /* Power Button Device */)  // _HID: Hardware ID
             Name (_UID, Zero)  // _UID: Unique ID
         }
     }
 }

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/data/acpi/aarch64/virt/DSDT.acpipcihp | Bin 0 -> 5993 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 2 files changed, 1 deletion(-)

diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpipcihp b/tests/data/acpi/aarch64/virt/DSDT.acpipcihp
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..1ee2699d03dd24b7f56dc6e9f88334ab5aeb3d9f 100644
GIT binary patch
literal 5993
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
Gs{aE@PSiaB

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dc3ab24d05..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
-- 
2.34.1
