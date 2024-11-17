Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2120550njc;
        Sun, 17 Nov 2024 08:10:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWipmkdAMcubB4qaif5A3J1ahrBMLC1dd45BNAqRWCM0cMJ+VHFoaTyhFHdIeuaIY7OVJZ2cqzwLnJPeQ==@linaro.org
X-Received: by 2002:a05:6000:a0a:b0:381:f443:21bf with SMTP id ffacd0b85a97d-38225901b26mr7586984f8f.2.1731859842185;
        Sun, 17 Nov 2024 08:10:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731859842; cv=none;
        d=google.com; s=arc-20240605;
        b=QWGGBDWNGjHuAFZbBZ0Zo3htaGBAk8mlQwuGqL10TSVCPumLWMZ8w1aHWgbWSb2Gsi
         bBblaxIHme+ifen10ztiuUKJc22JP2jdiwY2a/a052W0FOFfFizzKeEDeWI+s2Hpp/J8
         Z/ExCJUAcaqLZjp8BPV9rtkA00bC440poAWbQ/EsP23gvScAlDzIp4fwnMef6grjILbg
         UAP3ToFMZ5L8GPudXOar7PAaTOez+ljQDuztayk+ZkBp3UvOUpIfC/x+dpzRcRvvtvxi
         cpLnsBIJTXna0oJsCwsGkG2vd4F3mnhg7mGaV6syFVMkXaDfeMUT8qyUhIbTxf98mRQw
         2dOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=GikP/iJqDN/uA4pIDU3RA3esUPeMcwTG8y/JwFqz7k4=;
        fh=B4inn5OsgX49tXvrB7gqa0MkW/0cIVqrvTJMFA/Z4rw=;
        b=hPxAqotDgf8i9lcD512Bu3m8pXuf5oxTLmjFKUIdU3sDtwdVcyqlUwD8XOJG21pejG
         rs9AtXPAxOPG0BPSuBS/RpJZV+MTiQOy/2d/VwDB6aX56DAXyEb3x83TyyyKwsIw/rH0
         KstrVpENMIGrw4LB9VphquhGiohb578TLZ3dU4QFYKpEQRrF3bbvD7660GzJ7oobIswa
         3jmYywt9AqdZOp/ovUVHp3mKqCfs3ieMwxQ0a+S+1iH4GZO9bl8Yn3ql4G6TjbRWnIfO
         wUFnaHlZoBdb12PkYG59XJYdJBtMN74CnJM7c8SKSgdCVw+6haSDsdVnrKLc/2jYS30u
         9geQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBhB2rPN;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3821ad4af42sor2312286f8f.0.2024.11.17.08.10.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 17 Nov 2024 08:10:42 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBhB2rPN;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731859841; x=1732464641; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GikP/iJqDN/uA4pIDU3RA3esUPeMcwTG8y/JwFqz7k4=;
        b=ZBhB2rPNvAw/wIII9NsNXokfvlzA5qshXfzAU+iSA64IjTkG8XuRAQKkHKDC3srMqR
         Fj/+12pbj7zclS9mdqlfdo5vYXz4p8eNuYWUyx4qgLZhtLe4U9rojFUchO3cKicCKXHd
         jc/oklhw9Sr+HeqAw3t57CJF7FI3tkptwHI5EXlcO/yzbofDWAbHQ8jw3X9gPVFb9upe
         Wu43s1mGGuaD84/Y4KtqgBZBv+n69hpMe98+tM3YWSe98tuKxRch9a4JYGv72NRUSk8N
         6ExBLWDV76mZAPCdPlgemdZh8j7ppuvFHYcb6yCcnUHcGiCzu7KNl9rc60Hp44C7CAkw
         mu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731859841; x=1732464641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GikP/iJqDN/uA4pIDU3RA3esUPeMcwTG8y/JwFqz7k4=;
        b=lGD/wbGHhRSSiAw4YOuwhjwR/DI4qxuILvtU9R1ebw7zddTgY2mkyq9yanojdxemyc
         F8lyR3WzXIna0j5Ea0+kRfgXUlzT+mjDbrXCPMnmALf4iF0E/ewxn9KO6Qi34UI5ciMn
         sTWa2OshtD2uosi4E3f82Byz300FwGBg028kGe0LjRYMhJBlAGx37IUSOvlPYoRMcjNv
         7MfuwIvmg+gbepnurbfMiN6RQh3mN0TUhHi8i828kdtpfp3hXts1Fu158s5jmrk7wP/v
         RRJu7fH/Lw4GwWdhWZVL6uAxiw8vq+cYAGVhe4sx6ZvCEDORf3oRgSfiWXPk2LadFPcL
         cTAw==
X-Forwarded-Encrypted: i=1; AJvYcCVHQrwDuWmQ8PSsocl0uLouoKul+ATSa1n+Qk6SkfG903GbZ1aA9rd9YCka6RxmW6boXuJ+oZXw8ezMPg==@linaro.org
X-Gm-Message-State: AOJu0YwPj+OtcXDUCqwibSpxRb4e/+iu9ZhdvzREnBmup16OKrjJlIIc
	Bn1VeWdcyefq501BabFqyconWAsHT48QFRgcluJCjqxsaNtXfuW05InPJXjvUty6KQ==
X-Google-Smtp-Source: AGHT+IFx8mitUN5+hjy8LV0JyN3UBFS9MIJ93hNT1dJ8Jy/uDEaUfuQTXR9XLYpPJ50FIFzxfXOHOA==
X-Received: by 2002:a05:600c:1e89:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-432df78e296mr76171445e9.24.1731859841438;
        Sun, 17 Nov 2024 08:10:41 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from localhost.localdomain (adsl-123.37.6.2.tellas.gr. [37.6.2.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab721d7sm126147905e9.9.2024.11.17.08.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 08:10:41 -0800 (PST)
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
Subject: [PATCH v3] rust/pl011: Fix DeviceID reads
Date: Sun, 17 Nov 2024 18:10:36 +0200
Message-ID: <20241117161039.3758840-1-manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
X-TUID: TsJhVjVdFYZ/

DeviceId, which maps the peripheral and PCell registers of a PL011
device, was not treating each register value as a 32 bit value.

Change DeviceId enum to return register values via constified getter
functions instead of leveraging the std::ops::Index<_> trait.

While at it, print errors when guest attempts to write to other RO
registers as well.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---

Notes:
    Changes from v2:
    
    - Group invalid write case matches (Paolo)
    - Reduce register getter line count to aid review (Peter Maydell)
    
    v1 -> v2:
    
    - Print error when guest attempts to write to RO registers (Peter
      Maydell)
    
    Version 1:
     <20241116181549.3430225-1-manos.pitsidianakis@linaro.org>
    Version 2:
     <20241116221757.3501603-1-manos.pitsidianakis@linaro.org>

Interdiff against v2:
  diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
  index fc6f3f394d..f1d959ca28 100644
  --- a/rust/hw/char/pl011/src/device.rs
  +++ b/rust/hw/char/pl011/src/device.rs
  @@ -40,54 +40,50 @@ enum DeviceId {
       Luminary,
   }
   
  +macro_rules! pcell_reg_getter {
  +    ($($(#[$attrs:meta])* fn $getter_fn:ident -> $value:literal),*$(,)?) => {
  +        $($(#[$attrs])* const fn $getter_fn(self) -> u64 { $value })*
  +    };
  +}
  +
  +macro_rules! periph_reg_getter {
  +    ($($(#[$attrs:meta])* fn $getter_fn:ident -> { Arm => $arm:literal, Luminary => $lum:literal$(,)?}),*$(,)?) => {
  +        $(
  +            $(#[$attrs])*
  +            const fn $getter_fn(self) -> u64 {
  +                (match self {
  +                    Self::Arm => $arm,
  +                    Self::Luminary => $lum,
  +                }) as u64
  +            }
  +        )*
  +    };
  +}
  +
   impl DeviceId {
       /// Value of `UARTPeriphID0` register, which contains the `PartNumber0` value.
       const fn uart_periph_id0(self) -> u64 {
           0x11
       }
   
  -    /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
  -    const fn uart_periph_id1(self) -> u64 {
  -        (match self {
  -            Self::Arm => 0x10,
  -            Self::Luminary => 0x00,
  -        }) as u64
  +    periph_reg_getter! {
  +        /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
  +        fn uart_periph_id1 -> { Arm => 0x10, Luminary => 0x00 },
  +        /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
  +        fn uart_periph_id2 -> { Arm => 0x14, Luminary => 0x18 },
  +        /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
  +        fn uart_periph_id3 -> { Arm => 0x0, Luminary => 0x1 }
       }
   
  -    /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
  -    const fn uart_periph_id2(self) -> u64 {
  -        (match self {
  -            Self::Arm => 0x14,
  -            Self::Luminary => 0x18,
  -        }) as u64
  -    }
  -
  -    /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
  -    const fn uart_periph_id3(self) -> u64 {
  -        (match self {
  -            Self::Arm => 0x0,
  -            Self::Luminary => 0x1,
  -        }) as u64
  -    }
  -
  -    /// Value of `UARTPCellID0` register.
  -    const fn uart_pcell_id0(self) -> u64 {
  -        0x0d
  -    }
  -
  -    /// Value of `UARTPCellID1` register.
  -    const fn uart_pcell_id1(self) -> u64 {
  -        0xf0
  -    }
  -
  -    /// Value of `UARTPCellID2` register.
  -    const fn uart_pcell_id2(self) -> u64 {
  -        0x05
  -    }
  -
  -    /// Value of `UARTPCellID3` register.
  -    const fn uart_pcell_id3(self) -> u64 {
  -        0xb1
  +    pcell_reg_getter! {
  +        /// Value of `UARTPCellID0` register.
  +        fn uart_pcell_id0 -> 0x0d,
  +        /// Value of `UARTPCellID1` register.
  +        fn uart_pcell_id1 -> 0xf0,
  +        /// Value of `UARTPCellID2` register.
  +        fn uart_pcell_id2 -> 0x05,
  +        /// Value of `UARTPCellID3` register.
  +        fn uart_pcell_id3 -> 0xb1,
       }
   }
   
  @@ -282,7 +278,7 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
               }
               Ok(
                   dev_id @ (PeriphID0 | PeriphID1 | PeriphID2 | PeriphID3 | PCellID0 | PCellID1
  -                | PCellID2 | PCellID3),
  +                | PCellID2 | PCellID3 | FR | RIS | MIS),
               ) => {
                   eprintln!("write bad offset {offset} at RO register {dev_id:?} value {value}");
               }
  @@ -304,9 +300,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
               Ok(RSR) => {
                   self.receive_status_error_clear = 0.into();
               }
  -            Ok(FR) => {
  -                eprintln!("write bad offset {offset} at RO register UARTFR value {value}");
  -            }
               Ok(ILPR) => {
                   self.ilpr = value;
               }
  @@ -355,12 +348,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                   self.int_enabled = value;
                   self.update();
               }
  -            Ok(RIS) => {
  -                eprintln!("write bad offset {offset} at RO register UARTRIS value {value}");
  -            }
  -            Ok(MIS) => {
  -                eprintln!("write bad offset {offset} at RO register UARTMIS value {value}");
  -            }
               Ok(ICR) => {
                   self.int_level &= !value;
                   self.update();

 rust/hw/char/pl011/src/device.rs | 78 ++++++++++++++++++++++++--------
 rust/hw/char/pl011/src/lib.rs    | 22 ++++++++-
 2 files changed, 79 insertions(+), 21 deletions(-)

diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
index 2a85960b81..f1d959ca28 100644
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
@@ -39,20 +40,51 @@ enum DeviceId {
     Luminary,
 }
 
-impl std::ops::Index<hwaddr> for DeviceId {
-    type Output = c_uchar;
+macro_rules! pcell_reg_getter {
+    ($($(#[$attrs:meta])* fn $getter_fn:ident -> $value:literal),*$(,)?) => {
+        $($(#[$attrs])* const fn $getter_fn(self) -> u64 { $value })*
+    };
+}
 
-    fn index(&self, idx: hwaddr) -> &Self::Output {
-        match self {
-            Self::Arm => &Self::PL011_ID_ARM[idx as usize],
-            Self::Luminary => &Self::PL011_ID_LUMINARY[idx as usize],
-        }
-    }
+macro_rules! periph_reg_getter {
+    ($($(#[$attrs:meta])* fn $getter_fn:ident -> { Arm => $arm:literal, Luminary => $lum:literal$(,)?}),*$(,)?) => {
+        $(
+            $(#[$attrs])*
+            const fn $getter_fn(self) -> u64 {
+                (match self {
+                    Self::Arm => $arm,
+                    Self::Luminary => $lum,
+                }) as u64
+            }
+        )*
+    };
 }
 
 impl DeviceId {
-    const PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
-    const PL011_ID_LUMINARY: [c_uchar; 8] = [0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1];
+    /// Value of `UARTPeriphID0` register, which contains the `PartNumber0` value.
+    const fn uart_periph_id0(self) -> u64 {
+        0x11
+    }
+
+    periph_reg_getter! {
+        /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
+        fn uart_periph_id1 -> { Arm => 0x10, Luminary => 0x00 },
+        /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
+        fn uart_periph_id2 -> { Arm => 0x14, Luminary => 0x18 },
+        /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
+        fn uart_periph_id3 -> { Arm => 0x0, Luminary => 0x1 }
+    }
+
+    pcell_reg_getter! {
+        /// Value of `UARTPCellID0` register.
+        fn uart_pcell_id0 -> 0x0d,
+        /// Value of `UARTPCellID1` register.
+        fn uart_pcell_id1 -> 0xf0,
+        /// Value of `UARTPCellID2` register.
+        fn uart_pcell_id2 -> 0x05,
+        /// Value of `UARTPCellID3` register.
+        fn uart_pcell_id3 -> 0xb1,
+    }
 }
 
 #[repr(C)]
@@ -182,9 +214,14 @@ pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u
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
@@ -236,9 +273,15 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
         use RegisterOffset::*;
         let value: u32 = value as u32;
         match RegisterOffset::try_from(offset) {
-            Err(_bad_offset) => {
+            Err(_) => {
                 eprintln!("write bad offset {offset} value {value}");
             }
+            Ok(
+                dev_id @ (PeriphID0 | PeriphID1 | PeriphID2 | PeriphID3 | PCellID0 | PCellID1
+                | PCellID2 | PCellID3 | FR | RIS | MIS),
+            ) => {
+                eprintln!("write bad offset {offset} at RO register {dev_id:?} value {value}");
+            }
             Ok(DR) => {
                 // ??? Check if transmitter is enabled.
                 let ch: u8 = value as u8;
@@ -257,9 +300,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
             Ok(RSR) => {
                 self.receive_status_error_clear = 0.into();
             }
-            Ok(FR) => {
-                // flag writes are ignored
-            }
             Ok(ILPR) => {
                 self.ilpr = value;
             }
@@ -308,8 +348,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
                 self.int_enabled = value;
                 self.update();
             }
-            Ok(RIS) => {}
-            Ok(MIS) => {}
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
