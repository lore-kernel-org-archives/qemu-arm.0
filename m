Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1794286njc;
        Sat, 16 Nov 2024 14:18:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWv+01ALZLXsIU6yPpwHTCEeVtUEZCYl+YNi4yYMkEuLG7QJnfKhCcIQN50WzzSaiA07VhRgrrU+fOWGA==@linaro.org
X-Received: by 2002:a05:600c:4685:b0:431:47e7:9f45 with SMTP id 5b1f17b1804b1-432d9762455mr106097425e9.11.1731795481328;
        Sat, 16 Nov 2024 14:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731795481; cv=none;
        d=google.com; s=arc-20240605;
        b=HDvfTbVSZ7DyQlE4c86g/hBqn8ZvCd/2b2fV7bCaOkrKNhsKpRb/TSyvbCv4fyIxc0
         yahDVVv27L3wPrQX0w+B7JQHGm6le8+qAR6+LvyCp/tPBH/UWmBKo8u5K/oYKwAI77rp
         JajSaaZTjeVWRptEqY9ottgs/DTTNdevMgwsyoFU6d87Ezi9843L0r4cPnlh4FtR3B/h
         EnpGauUv8Vzzs3Yb5CReJy67GhHnDpV9EaUZu+k8XqCk+jqfGGlZxhIKl8rA+2B9nd6f
         27eSD6BFpudFCqOR7LL2ozi4dpdcrIvPXoLhr20mKd/mIUJKgNxa8XWyMh+Qu1cTsvCp
         btow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=90Z+uTvpepQAFzVHsVOwH1Xe3Nr8l4nE4g3HPoVibmQ=;
        fh=lXbN2OAkf9ZPCxIEcZHfFtkvQFEUCCNJtOnBHlI6SII=;
        b=cnsFsHODxzhzd223GjvzDsBjzdo+wyvwmhlmxkNcdwXGrpv51GpICrxQKGxvWTctQI
         LjVEu/U9bml7+jGMxWkirpXNWREhjlGSyQb6zN2MGTi0padzjA817/HUvoDChu2lx8jR
         iQ8EiBhYWwbuzebSOvFReRKrV1r0owPutePUXCMU+hHcW82m7dWOG1AkvZqHNemsgRTu
         TonJZQwVcC+D4/6p1nvBhnyeRBVDytiVDIKh6fgCATbJ3MK+wpl/nhVGMOxp2Q8y/pSS
         UR/qyMDtTryqOB9uNslFzUghIwXI0AEw7H6f8wpsCijuno+WZ0MfCTNpOdJCQ5eh06vy
         8n3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/EWG8bh";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432dfd4bfc1sor11611555e9.0.2024.11.16.14.18.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 16 Nov 2024 14:18:01 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/EWG8bh";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731795481; x=1732400281; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90Z+uTvpepQAFzVHsVOwH1Xe3Nr8l4nE4g3HPoVibmQ=;
        b=Y/EWG8bhxp4yUdYn5JueA6n7yKcqTl7Crg9LICw7a3GeszCgptXj4lGUYFHh2CirfL
         SrxTrN3W1gKxoBv9c14+5CBm8wUvHVnjSUcOFjVn/umpql5APwdThkSTxqHAT2lJXZQz
         i/GXXb+fWvNe5UyXRa8olSMfndU48F37WW/Ev/XYb1P1XD5O8gmJYfdfYYjtxIFTE3nB
         Ml3TnprR8wR+hiv01fNcW16NnDdhzQZJBChcSMk406Gnov2uEwKcFPiTG3PvScBeEonX
         Jh17Ek7DeTfPb4JGKse7+QV5oGZLP3fVRrIeDjI/i6sEtCM+06Ke0FrW2Ei4Ht2+sbnM
         yk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731795481; x=1732400281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90Z+uTvpepQAFzVHsVOwH1Xe3Nr8l4nE4g3HPoVibmQ=;
        b=SUkBuTHIdVvIAYdxhUh8x6N4A6dDVNp2LfBkmCrCzFSvrhBs+OP8omBDzebDDY+3qP
         nzEmJyFT1tGqjYBPfDaJlaLzZoEeiOB5xGt2W2cSpaujB1BfKQyhzbBdGaGT29JLK1iW
         60grpTEnn/tW6cCgLyhFip5eF0dBPqD+K2sHuMhtWvVuGBDQ5/WXoekHOANkQaFDzlta
         oyVHgj2Kj2AE0XH23d57vusEAtD4c8wgCT2rN/axx0zsfrioQeMwdP1x+cpd9pFm10Bw
         VF0FvZitxStW3iqNF65rXGp4SoYWwu4LAUzfE8FbsUQZYE7OXfq8wmkaVTDGbEz8MhV1
         8Z9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGeJAcvIQwzSkl0wu0WpVchpg9pwepCXfABJAbWul3flO8m98K4CF49ypXm8mHmodDYsnXVMotAehfcw==@linaro.org
X-Gm-Message-State: AOJu0YyPldq9aXvHAdZgAGJusv4OAWjj9Bck1VFkLcBo7ELmrVVuEVmG
	DyjnMpF9/0Jr9YyrGvXU4nPbw+O8boxsTWYmSPCGpcO+QVA0eQ2iPdRb8FKut7wSgA==
X-Google-Smtp-Source: AGHT+IE5Je1M/0sWbe3jl0H2L89jhWdgktlP6oktsPYUPJQBrF5vkAjkUnrY+zUFiUy0aJXZUd3HaA==
X-Received: by 2002:a05:600c:3c9e:b0:431:52da:9d89 with SMTP id 5b1f17b1804b1-432defc8b2bmr66927325e9.1.1731795480613;
        Sat, 16 Nov 2024 14:18:00 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-99.109.242.224.tellas.gr. [109.242.224.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da28b76fsm105752685e9.28.2024.11.16.14.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 14:18:00 -0800 (PST)
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
Subject: [PATCH v2] rust/pl011: Fix DeviceID reads
Date: Sun, 17 Nov 2024 00:17:56 +0200
Message-ID: <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: lV066+bddBAH

DeviceId, which maps the peripheral and PCell registers of a PL011
device, was not treating each register value as a 32 bit value.

Change DeviceId enum to return register values via constified getter
functions instead of leveraging the std::ops::Index<_> trait.

While at it, print errors when guest attempts to write to other RO
registers as well.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---

Notes:
    Changes from v1:
    
    - Print error when guest attempts to write to RO registers (Peter
      Maydell)
    
    Version 1:
     <20241116181549.3430225-1-manos.pitsidianakis@linaro.org/raw>

Interdiff against v1:
  diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
  index 98dd97dbfd..fc6f3f394d 100644
  --- a/rust/hw/char/pl011/src/device.rs
  +++ b/rust/hw/char/pl011/src/device.rs
  @@ -277,13 +277,15 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
           use RegisterOffset::*;
           let value: u32 = value as u32;
           match RegisterOffset::try_from(offset) {
  -            Ok(PeriphID0) | Ok(PeriphID1) | Ok(PeriphID2) | Ok(PeriphID3) | Ok(PCellID0)
  -            | Ok(PCellID1) | Ok(PCellID2) | Ok(PCellID3) => {
  -                // Ignore writes to read-only registers.
  -            }
  -            Err(_bad_offset) => {
  +            Err(_) => {
                   eprintln!("write bad offset {offset} value {value}");
               }
  +            Ok(
  +                dev_id @ (PeriphID0 | PeriphID1 | PeriphID2 | PeriphID3 | PCellID0 | PCellID1
  +                | PCellID2 | PCellID3),
  +            ) => {
  +                eprintln!("write bad offset {offset} at RO register {dev_id:?} value {value}");
  +            }
               Ok(DR) => {
                   // ??? Check if transmitter is enabled.
                   let ch: u8 = value as u8;
  @@ -303,7 +305,7 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                   self.receive_status_error_clear = 0.into();
               }
               Ok(FR) => {
  -                // flag writes are ignored
  +                eprintln!("write bad offset {offset} at RO register UARTFR value {value}");
               }
               Ok(ILPR) => {
                   self.ilpr = value;
  @@ -353,8 +355,12 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                   self.int_enabled = value;
                   self.update();
               }
  -            Ok(RIS) => {}
  -            Ok(MIS) => {}
  +            Ok(RIS) => {
  +                eprintln!("write bad offset {offset} at RO register UARTRIS value {value}");
  +            }
  +            Ok(MIS) => {
  +                eprintln!("write bad offset {offset} at RO register UARTMIS value {value}");
  +            }
               Ok(ICR) => {
                   self.int_level &= !value;
                   self.update();

 rust/hw/char/pl011/src/device.rs | 93 ++++++++++++++++++++++++--------
 rust/hw/char/pl011/src/lib.rs    | 22 +++++++-
 2 files changed, 93 insertions(+), 22 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 2a85960b81..fc6f3f394d 100644
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
@@ -236,9 +277,15 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
         use RegisterOffset::*;
         let value: u32 = value as u32;
         match RegisterOffset::try_from(offset) {
-            Err(_bad_offset) => {
+            Err(_) => {
                 eprintln!("write bad offset {offset} value {value}");
             }
+            Ok(
+                dev_id @ (PeriphID0 | PeriphID1 | PeriphID2 | PeriphID3 | PCellID0 | PCellID1
+                | PCellID2 | PCellID3),
+            ) => {
+                eprintln!("write bad offset {offset} at RO register {dev_id:?} value {value}");
+            }
             Ok(DR) => {
                 // ??? Check if transmitter is enabled.
                 let ch: u8 = value as u8;
@@ -258,7 +305,7 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                 self.receive_status_error_clear = 0.into();
             }
             Ok(FR) => {
-                // flag writes are ignored
+                eprintln!("write bad offset {offset} at RO register UARTFR value {value}");
             }
             Ok(ILPR) => {
                 self.ilpr = value;
@@ -308,8 +355,12 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                 self.int_enabled = value;
                 self.update();
             }
-            Ok(RIS) => {}
-            Ok(MIS) => {}
+            Ok(RIS) => {
+                eprintln!("write bad offset {offset} at RO register UARTRIS value {value}");
+            }
+            Ok(MIS) => {
+                eprintln!("write bad offset {offset} at RO register UARTMIS value {value}");
+            }
             Ok(ICR) => {
                 self.int_level &= !value;
                 self.update();
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
