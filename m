Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1713405njc;
        Sat, 16 Nov 2024 10:15:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXs2i2QlnhGRjgwRHBOw46Sr+pTG0piseAEWurJxE7rPvwAgnw8JtrpMyom+MAYK+mdZVntb6wCgxRW8g==@linaro.org
X-Received: by 2002:a17:907:7f23:b0:a9e:f28c:374a with SMTP id a640c23a62f3a-aa4834544a3mr528310766b.32.1731780952714;
        Sat, 16 Nov 2024 10:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731780952; cv=none;
        d=google.com; s=arc-20240605;
        b=d5DaWhMENPeFAb8iR2cftjqnbSo6QTw4Opi8YXRl4X5U3SZPvOJ0crj0OYy400vHwt
         i9RukbJpvYW+BEI0cUPl4ogBGqT5Bj0EyGHXpx0ZWgLtndw7wdP37SDt/MMb9uLTTioQ
         lXBFi1dg0jWC+3ArITHkMYYTtHNCrd4aNA8/uTrNnsUCsWexqUVByAVhmtZ0oWcXFIp7
         /+dc91TjHn4CekT1jZnAHTHtf9o6NlVUNEDMyuntITWN03z0HiLV9OGwNxhfK2ls7iJs
         YJcp0AitfvtFV85KUIbUqYrZWI9rpqZvdC3xbwUXMQwcyyxK+Qq+W2i+hemfL1GF0NEV
         7UNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=q6tr4L5Awk6MF5nkShlTZsV/p9lj5pTzBeIQEchqGPY=;
        fh=hvyrtWtYr45gg0LR9Lufu+jIpW29BHGNrpInu/17ang=;
        b=kAKpvEOQ1GFywsNeKm0f+ISJ05tUULaETa3rzD/03AHWZw2rG2mEuMV7oc8nPuQj6+
         YruTP4kmn2tSkzCEdNLOcjH3rur5v0cqkU3Bkujj9Po1scWiS6ERHtlmRfrIKDioKj+M
         V8OcW7lJhLUZT0n/eAGB0VfsHNFCBFqUE7ArT7bamz1SeOXy3xeSRhIiFOaC0yLf44IH
         EUtgLUKI/HHCeRaHA1GDN0NS3L04wcMpvbto/DkZvCWQOV+COXb/1q+loNOZJ9jCg1fq
         V55frjhVWkIRDNzG+12cr7/zDPsPMKqH7RxpwQnh+fq/mEupkb0Jr9r8BwgJOvOZOBcQ
         92qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HM8oLDc5;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa20df56fd2sor250206266b.8.2024.11.16.10.15.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 16 Nov 2024 10:15:52 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HM8oLDc5;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731780952; x=1732385752; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q6tr4L5Awk6MF5nkShlTZsV/p9lj5pTzBeIQEchqGPY=;
        b=HM8oLDc50RZ1t2gfpDbqFtb1PKcUcVXE/FDAsLcDyuWQjZGzfZtXfBfMOwpa0xyj9a
         OI71x4+AU9JBmQlpaH5lYQfG3I8vSylMNe1ywkkA1TAeU//zl4C24e6gv7L2/F7RUZNO
         sAydauIwpBIGPYaOQ4MfM7fzczN6NP3S3Gqzrt/+eo+s2nyH0K6kdxYMTNbKvF80hW0h
         KEE1eMGBdsxRkXoF0o2XoSU0aSwnit2W0tJNXefSHwGgWzPdpq3zrK8E5bNQrMp0ZX8Y
         O8Fp9nAVXz/2gi/gcES3+hrWhXMZR4ITt9sCwXyRTVzXnP/U+KNws4xA7jffoTuhhnoy
         vBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731780952; x=1732385752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6tr4L5Awk6MF5nkShlTZsV/p9lj5pTzBeIQEchqGPY=;
        b=sC3q+DTp2eG+is8MgpR8+BywnLrih/4rL9k+h0eu+pmbwzNyUsSJZzB8Ab/NOq9zbO
         9C+mAwV1MjMI4QLOEGvYhJabl6upJOMBdIxXT42hkXXfsflFWeoPyELvRU5D1JPVYEgP
         abTl0HC6Uzv0VHZ+IbOSUi03cqE51BKy5qwRDDcKl41umIGoHYQheYS4QnDBmg8dDJ7i
         xU2OLHQ5MO7ufCQY4/abx0GBxLwauEPKjlZS53MXUQYGGlGZDzG1wiqm5AdRLIiEnKGu
         F0S+UXrxiNzEynJvNpR763RFHCMYTPlRYQTT9ylb8Z2YpnbkbGQgFDETX8iKaa2Gx0tp
         oVIA==
X-Forwarded-Encrypted: i=1; AJvYcCUJmvY3Ud9dRZ94pyCGdkNCQp1tziBe5FEoh2l9effwbAqJLMuJ4i4BqNJrI3w0LfBJgvBTxVLF+tVLUQ==@linaro.org
X-Gm-Message-State: AOJu0YwzCuwEGuA2w0RUKUPvA0/dmUubtOVAN/2MPQMDZsrLg8z/4n+N
	3oS30Lq3RamTpzcRyhnQOUfiPxR5Kit7ejxPvKk8I9fD2fWaa4yQYm7PIzeH263Brw==
X-Google-Smtp-Source: AGHT+IFQHfHmFdH8kcxV7YarABAGbtbo1ZDIj3wmKqiWDqSgoUYUTwslymTqBxEUcp7Vj8TlZ3eouw==
X-Received: by 2002:a17:907:a4b:b0:aa1:e04f:e37f with SMTP id a640c23a62f3a-aa4833e9adamr558597966b.6.1731780952164;
        Sat, 16 Nov 2024 10:15:52 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-27.37.6.161.tellas.gr. [37.6.161.27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df508f8sm337078666b.63.2024.11.16.10.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 10:15:51 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-rust@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v1] rust/pl011: Fix DeviceID reads
Date: Sat, 16 Nov 2024 20:15:47 +0200
Message-ID: <20241116181549.3430225-1-manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: zuQw/TJVp+wJ

DeviceId, which maps the peripheral and PCell registers of a PL011
device, was not treating each register value as a 32 bit value.

Change DeviceId enum to return register values via constified getter
functions instead of leveraging the std::ops::Index<_> trait.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 rust/hw/char/pl011/src/device.rs | 79 +++++++++++++++++++++++++-------
 rust/hw/char/pl011/src/lib.rs    | 22 ++++++++-
 2 files changed, 83 insertions(+), 18 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 2a85960b81..98dd97dbfd 100644
--- a/rust/hw/char/pl011/src/device.rs
+++ b/rust/hw/char/pl011/src/device.rs
@@ -5,7 +5,7 @@
 use core::ptr::{addr_of, addr_of_mut, NonNull};
 use std::{
     ffi::CStr,
-    os::raw::{c_int, c_uchar, c_uint, c_void},
+    os::raw::{c_int, c_uint, c_void},
 };
 
 use qemu_api::{
@@ -32,6 +32,7 @@
 /// QEMU sourced constant.
 pub const PL011_FIFO_DEPTH: usize = 16_usize;
 
+/// State enum that represents the values of the peripheral and PCell registers of a PL011 device.
 #[derive(Clone, Copy, Debug)]
 enum DeviceId {
     #[allow(dead_code)]
@@ -39,20 +40,55 @@ enum DeviceId {
     Luminary,
 }
 
-impl std::ops::Index<hwaddr> for DeviceId {
-    type Output = c_uchar;
-
-    fn index(&self, idx: hwaddr) -> &Self::Output {
-        match self {
-            Self::Arm => &Self::PL011_ID_ARM[idx as usize],
-            Self::Luminary => &Self::PL011_ID_LUMINARY[idx as usize],
-        }
-    }
-}
-
 impl DeviceId {
-    const PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
-    const PL011_ID_LUMINARY: [c_uchar; 8] = [0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1];
+    /// Value of `UARTPeriphID0` register, which contains the `PartNumber0` value.
+    const fn uart_periph_id0(self) -> u64 {
+        0x11
+    }
+
+    /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
+    const fn uart_periph_id1(self) -> u64 {
+        (match self {
+            Self::Arm => 0x10,
+            Self::Luminary => 0x00,
+        }) as u64
+    }
+
+    /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
+    const fn uart_periph_id2(self) -> u64 {
+        (match self {
+            Self::Arm => 0x14,
+            Self::Luminary => 0x18,
+        }) as u64
+    }
+
+    /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
+    const fn uart_periph_id3(self) -> u64 {
+        (match self {
+            Self::Arm => 0x0,
+            Self::Luminary => 0x1,
+        }) as u64
+    }
+
+    /// Value of `UARTPCellID0` register.
+    const fn uart_pcell_id0(self) -> u64 {
+        0x0d
+    }
+
+    /// Value of `UARTPCellID1` register.
+    const fn uart_pcell_id1(self) -> u64 {
+        0xf0
+    }
+
+    /// Value of `UARTPCellID2` register.
+    const fn uart_pcell_id2(self) -> u64 {
+        0x05
+    }
+
+    /// Value of `UARTPCellID3` register.
+    const fn uart_pcell_id3(self) -> u64 {
+        0xb1
+    }
 }
 
 #[repr(C)]
@@ -182,9 +218,14 @@ pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u
         use RegisterOffset::*;
 
         std::ops::ControlFlow::Break(match RegisterOffset::try_from(offset) {
-            Err(v) if (0x3f8..0x400).contains(&v) => {
-                u64::from(self.device_id[(offset - 0xfe0) >> 2])
-            }
+            Ok(PeriphID0) => self.device_id.uart_periph_id0(),
+            Ok(PeriphID1) => self.device_id.uart_periph_id1(),
+            Ok(PeriphID2) => self.device_id.uart_periph_id2(),
+            Ok(PeriphID3) => self.device_id.uart_periph_id3(),
+            Ok(PCellID0) => self.device_id.uart_pcell_id0(),
+            Ok(PCellID1) => self.device_id.uart_pcell_id1(),
+            Ok(PCellID2) => self.device_id.uart_pcell_id2(),
+            Ok(PCellID3) => self.device_id.uart_pcell_id3(),
             Err(_) => {
                 // qemu_log_mask(LOG_GUEST_ERROR, "pl011_read: Bad offset 0x%x\n", (int)offset);
                 0
@@ -236,6 +277,10 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
         use RegisterOffset::*;
         let value: u32 = value as u32;
         match RegisterOffset::try_from(offset) {
+            Ok(PeriphID0) | Ok(PeriphID1) | Ok(PeriphID2) | Ok(PeriphID3) | Ok(PCellID0)
+            | Ok(PCellID1) | Ok(PCellID2) | Ok(PCellID3) => {
+                // Ignore writes to read-only registers.
+            }
             Err(_bad_offset) => {
                 eprintln!("write bad offset {offset} value {value}");
             }
diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
index cd0a49acb9..1f305aa13f 100644
--- a/rust/hw/char/pl011/src/lib.rs
+++ b/rust/hw/char/pl011/src/lib.rs
@@ -111,6 +111,22 @@ pub enum RegisterOffset {
     /// DMA control Register
     #[doc(alias = "UARTDMACR")]
     DMACR = 0x048,
+    #[doc(alias = "UARTPeriphID0")]
+    PeriphID0 = 0xFE0,
+    #[doc(alias = "UARTPeriphID1")]
+    PeriphID1 = 0xFE4,
+    #[doc(alias = "UARTPeriphID2")]
+    PeriphID2 = 0xFE8,
+    #[doc(alias = "UARTPeriphID3")]
+    PeriphID3 = 0xFEC,
+    #[doc(alias = "UARTPCellID0")]
+    PCellID0 = 0xFF0,
+    #[doc(alias = "UARTPCellID1")]
+    PCellID1 = 0xFF4,
+    #[doc(alias = "UARTPCellID2")]
+    PCellID2 = 0xFF8,
+    #[doc(alias = "UARTPCellID3")]
+    PCellID3 = 0xFFC,
     ///// Reserved, offsets `0x04C` to `0x07C`.
     //Reserved = 0x04C,
 }
@@ -137,7 +153,11 @@ const fn _assert_exhaustive(val: RegisterOffset) {
                 }
             }
         }
-        case! { DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR }
+        case! {
+            DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR,
+            PeriphID0, PeriphID1, PeriphID2, PeriphID3,
+            PCellID0, PCellID1, PCellID2, PCellID3,
+        }
     }
 }
 

base-commit: 43f2def68476697deb0d119cbae51b20019c6c86
-- 
γαῖα πυρί μιχθήτω
