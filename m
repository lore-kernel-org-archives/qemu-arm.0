Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2629154njc;
        Mon, 18 Nov 2024 06:45:30 -0800 (PST)
X-Received: by 2002:a05:600c:1f0b:b0:431:44f6:566f with SMTP id 5b1f17b1804b1-432df72a4f1mr110129575e9.13.1731941130315;
        Mon, 18 Nov 2024 06:45:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731941130; cv=none;
        d=google.com; s=arc-20240605;
        b=OzSRyHetZyCm3Pka8y6I4dpWQu/BpDOaB97Acrjk74MTrNReBiz+UErL3BMO3aZ1wZ
         tzkT8lETzrS6/bORuoY2NjdjhyQv+sc6hmpBE5/Sqwikq3la1tBgTIoL2Vvdppst1UOq
         ohqOmtJJDNJCy+tEqizjmveTeblgxR+wCMh6Rs36FtlSfok7x8JrsbDSAKPsvXhKuQav
         eKSkxJFUE6VHw1zrYBOH9LUf3TCl5aiguytUkSIi2Q39x8ZlhI+Q/2LlCEh9S8vub0l+
         FbfCKdsmkO0bJdiEQ2XwFgLmqspL6PkCmf6IiFxixYZRh/9FwjirJv1ZwV6JNmDKgmvL
         /6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=zzNa8BCet9g0X/2JC9+/b/B7NG4WB9hplgL/Waii00w=;
        fh=+0Isu18w2FGh9TD3gdhaac3Rimpf1WRrckihR+gY0D8=;
        b=iM/gdni0ne6dl3412k+LeZHrbQKl0ag8d0D5fBvYW8scYogEhK9RRhH8I6bdEx1PKM
         w16g4tXLkg2yCVlqgLvqTe1BuzSC8JL90ZJ6E/z34A0voifUREVSXtrgMxSch5ii3zAB
         hyL1n46/JfaUEN6EQbeugID7i7h8ewx0mMEMNv10nG+DklOIDxrwMr4DjCQOLAJ4iot8
         XBepfctirt0ituznuG2eHko1mpsyWvWzWrZsBKi8va+VBcfOn5jyPNY5WkOZ6V/xc8uT
         uKRQbEjTpyMXkfobidWnGQlSBoQdMUWSMrOLuSW9S5vdKPgixdaqWe2Qv1LTB/XG3tar
         S6Ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvcBYOzL;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432db2324absor36177115e9.10.2024.11.18.06.45.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 06:45:30 -0800 (PST)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TvcBYOzL;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731941129; x=1732545929; darn=linaro.org;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzNa8BCet9g0X/2JC9+/b/B7NG4WB9hplgL/Waii00w=;
        b=TvcBYOzLCwbpZiwO1kzvEDsMjAOMOAHeP/XUd+lh90wbTIAZy3ABNYoBLwab4K4AFQ
         c0z6v6GzO8Yq2mt9UZxv0kRzss68/yfFG/OgcD4+GbiISOfsY+L6UZCmftZR6wc66WtX
         ncSPE+3tXDQgBti0F1D23TC7fMtkbI77QiRaq822qfjvx+62u9hUFCMmRQvkCJ75scl+
         5qLRECQvqcG6WB6ngKCww5qswcTGiRJErvHwhotzc+vH8TyMrdcGniflwze7eIbJQ4zc
         xsJCn45zNKcxkNLgXlrhL8hrMw6XueT2Wbk+63+Avv5S0ZEYvHEQOJsrn7sYAlBvUeqt
         ezXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731941129; x=1732545929;
        h=mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzNa8BCet9g0X/2JC9+/b/B7NG4WB9hplgL/Waii00w=;
        b=Ec8z6/ufe92chzAo24k99SCRHf0Z/vQPp6sCTovjXGL7dX7VYd2lgMZBm2tWn4SNVy
         48gret8tmkeVlygnFb7uMWutn7Lq99Q2KImSYRtkPuTEN+BrnP4gf74JGtn4Q1ncPi1d
         0+JBa5ws8CnvZDUDQwQOIgsSKi4noA5hxpEUm3Ma0LDiTozi1mriKvmgswRD0p5lG/AC
         cHzfA5wGzZwWqe4FPNcNScdXlvROPGT+WLBAjBGMvH1ArGbCphv2vAQPERxYPmQHBOHJ
         vEzIWS4lIkNT1QK1fEAACpKD7/C6M35fmaPz28z7NYY6WX7RWKzn5NAg5E+Vo5KUBuT2
         Lw2g==
X-Gm-Message-State: AOJu0YzX8iS4gnkLEBDFOjHPeWwUFBhhRsf0rDhjULhebwhl8lcL30yL
	++lljP5dvg/8hpFXpRHrEDsvPUnid52mQ6EsgD8QI0mMLweTXZ+uFom1wcIeV9IPOYt+XE3VX1Q
	B/rGfeg==
X-Google-Smtp-Source: AGHT+IGnzwQGIip59tD7WbJ1YQt4Xk4B6C7Hc/MeQBM6wNjkLbj9xshgfQpd1rT1o32h3b932pZrQw==
X-Received: by 2002:a05:600c:4505:b0:431:1868:417f with SMTP id 5b1f17b1804b1-432df74be9amr123890195e9.17.1731941129482;
        Mon, 18 Nov 2024 06:45:29 -0800 (PST)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli-email.org (adsl-123.37.6.2.tellas.gr. [37.6.2.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-382444fa548sm4400011f8f.86.2024.11.18.06.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:45:29 -0800 (PST)
Date: Mon, 18 Nov 2024 16:39:59 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-rust@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
Bcc: 
Subject: Re: [PATCH v3] rust/pl011: Fix DeviceID reads
User-Agent: meli 0.8.7
References: <20241117161039.3758840-1-manos.pitsidianakis@linaro.org> <875xoku5vd.fsf@draig.linaro.org>
In-Reply-To: <875xoku5vd.fsf@draig.linaro.org>
Message-ID: <n5ibr.51opa2z9dha@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-TUID: Un7AffWmpxlx

On Mon, 18 Nov 2024 13:40, Alex Bennée <alex.bennee@linaro.org> wrote:
>Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:
>
>> DeviceId, which maps the peripheral and PCell registers of a PL011
>> device, was not treating each register value as a 32 bit value.
>>
>> Change DeviceId enum to return register values via constified getter
>> functions instead of leveraging the std::ops::Index<_> trait.
>>
>> While at it, print errors when guest attempts to write to other RO
>> registers as well.
>>
>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> ---
>>
>> Notes:
>>     Changes from v2:
>>     
>>     - Group invalid write case matches (Paolo)
>>     - Reduce register getter line count to aid review (Peter Maydell)
>>     
><snip>
>> diff --git a/rust/hw/char/pl011/src/device.rs b/rust/hw/char/pl011/src/device.rs
>> index 2a85960b81..f1d959ca28 100644
>> --- a/rust/hw/char/pl011/src/device.rs
>> +++ b/rust/hw/char/pl011/src/device.rs
>> @@ -5,7 +5,7 @@
>>  use core::ptr::{addr_of, addr_of_mut, NonNull};
>>  use std::{
>>      ffi::CStr,
>> -    os::raw::{c_int, c_uchar, c_uint, c_void},
>> +    os::raw::{c_int, c_uint, c_void},
>>  };
>>  
>>  use qemu_api::{
>> @@ -32,6 +32,7 @@
>>  /// QEMU sourced constant.
>>  pub const PL011_FIFO_DEPTH: usize = 16_usize;
>>  
>> +/// State enum that represents the values of the peripheral and PCell registers of a PL011 device.
>>  #[derive(Clone, Copy, Debug)]
>>  enum DeviceId {
>>      #[allow(dead_code)]
>> @@ -39,20 +40,51 @@ enum DeviceId {
>>      Luminary,
>>  }
>>  
>> -impl std::ops::Index<hwaddr> for DeviceId {
>> -    type Output = c_uchar;
>> +macro_rules! pcell_reg_getter {
>> +    ($($(#[$attrs:meta])* fn $getter_fn:ident -> $value:literal),*$(,)?) => {
>> +        $($(#[$attrs])* const fn $getter_fn(self) -> u64 { $value })*
>> +    };
>> +}
>>  
>> -    fn index(&self, idx: hwaddr) -> &Self::Output {
>> -        match self {
>> -            Self::Arm => &Self::PL011_ID_ARM[idx as usize],
>> -            Self::Luminary => &Self::PL011_ID_LUMINARY[idx as usize],
>> -        }
>> -    }
>> +macro_rules! periph_reg_getter {
>> +    ($($(#[$attrs:meta])* fn $getter_fn:ident -> { Arm => $arm:literal, Luminary => $lum:literal$(,)?}),*$(,)?) => {
>> +        $(
>> +            $(#[$attrs])*
>> +            const fn $getter_fn(self) -> u64 {
>> +                (match self {
>> +                    Self::Arm => $arm,
>> +                    Self::Luminary => $lum,
>> +                }) as u64
>> +            }
>> +        )*
>> +    };
>>  }
>>  
>>  impl DeviceId {
>> -    const PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
>> -    const PL011_ID_LUMINARY: [c_uchar; 8] = [0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1];
>> +    /// Value of `UARTPeriphID0` register, which contains the `PartNumber0` value.
>> +    const fn uart_periph_id0(self) -> u64 {
>> +        0x11
>> +    }
>> +
>> +    periph_reg_getter! {
>> +        /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
>> +        fn uart_periph_id1 -> { Arm => 0x10, Luminary => 0x00 },
>> +        /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
>> +        fn uart_periph_id2 -> { Arm => 0x14, Luminary => 0x18 },
>> +        /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
>> +        fn uart_periph_id3 -> { Arm => 0x0, Luminary => 0x1 }
>> +    }
>> +
>> +    pcell_reg_getter! {
>> +        /// Value of `UARTPCellID0` register.
>> +        fn uart_pcell_id0 -> 0x0d,
>> +        /// Value of `UARTPCellID1` register.
>> +        fn uart_pcell_id1 -> 0xf0,
>> +        /// Value of `UARTPCellID2` register.
>> +        fn uart_pcell_id2 -> 0x05,
>> +        /// Value of `UARTPCellID3` register.
>> +        fn uart_pcell_id3 -> 0xb1,
>> +    }
>
>I share the concern that this is quite a verbose way of handling a
>fairly simple set of read-only constants. Is the end result really
>folded away to a simple const lookup?

Yep, const fns are evaluated at compile time. Alternatively we just 
could remove the DeviceID struct and inline everything in the read() 
method.

>
>Perhaps this comes down to unfamiliarity with the way macros are working
>here but in general macros should be eliding boilerplate to allow us to
>concisely represent the relevant data and functionality. Here it adds an
>additional indirection when reading the code just to see what is going
>on.

Well in the previous patch versions the concern was that it was 
"verbose". But even if the registers are available as memory mapped in 
the device it's the wrong abstraction to use here; this is a higher 
level language than C and using indices is a "when you have a hammer 
everything looks like a nail" situation.

We have different programming paradigms in Rust, allowing as to have 
documented code (via rustdoc), so either we take advantage of Rust or we 
don't.

>
>>  }
>>  
>>  #[repr(C)]
>> @@ -182,9 +214,14 @@ pub fn read(&mut self, offset: hwaddr, _size: c_uint) -> std::ops::ControlFlow<u
>>          use RegisterOffset::*;
>>  
>>          std::ops::ControlFlow::Break(match RegisterOffset::try_from(offset) {
>> -            Err(v) if (0x3f8..0x400).contains(&v) => {
>> -                u64::from(self.device_id[(offset - 0xfe0) >> 2])
>> -            }
>> +            Ok(PeriphID0) => self.device_id.uart_periph_id0(),
>> +            Ok(PeriphID1) => self.device_id.uart_periph_id1(),
>> +            Ok(PeriphID2) => self.device_id.uart_periph_id2(),
>> +            Ok(PeriphID3) => self.device_id.uart_periph_id3(),
>> +            Ok(PCellID0) => self.device_id.uart_pcell_id0(),
>> +            Ok(PCellID1) => self.device_id.uart_pcell_id1(),
>> +            Ok(PCellID2) => self.device_id.uart_pcell_id2(),
>> +            Ok(PCellID3) => self.device_id.uart_pcell_id3(),
>>              Err(_) => {
>>                  // qemu_log_mask(LOG_GUEST_ERROR, "pl011_read: Bad offset 0x%x\n", (int)offset);
>>                  0
>> @@ -236,9 +273,15 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
>>          use RegisterOffset::*;
>>          let value: u32 = value as u32;
>>          match RegisterOffset::try_from(offset) {
>> -            Err(_bad_offset) => {
>> +            Err(_) => {
>>                  eprintln!("write bad offset {offset} value {value}");
>>              }
>> +            Ok(
>> +                dev_id @ (PeriphID0 | PeriphID1 | PeriphID2 | PeriphID3 | PCellID0 | PCellID1
>> +                | PCellID2 | PCellID3 | FR | RIS | MIS),
>> +            ) => {
>
>This is a nice improvement in conciseness over the separate legs removed bellow.
>
>> +                eprintln!("write bad offset {offset} at RO register {dev_id:?} value {value}");
>> +            }
>
>Is a binding for qemu_log and friends on the todo list?

I had sent patches on a previous patch series that only some patches of 
them were picked up for merging, I plan to send a new revision soon

>
>>              Ok(DR) => {
>>                  // ??? Check if transmitter is enabled.
>>                  let ch: u8 = value as u8;
>> @@ -257,9 +300,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
>>              Ok(RSR) => {
>>                  self.receive_status_error_clear = 0.into();
>>              }
>> -            Ok(FR) => {
>> -                // flag writes are ignored
>> -            }
>>              Ok(ILPR) => {
>>                  self.ilpr = value;
>>              }
>> @@ -308,8 +348,6 @@ pub fn write(&mut self, offset: hwaddr, value: u64) {
>>                  self.int_enabled = value;
>>                  self.update();
>>              }
>> -            Ok(RIS) => {}
>> -            Ok(MIS) => {}
>>              Ok(ICR) => {
>>                  self.int_level &= !value;
>>                  self.update();
>> diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
>> index cd0a49acb9..1f305aa13f 100644
>> --- a/rust/hw/char/pl011/src/lib.rs
>> +++ b/rust/hw/char/pl011/src/lib.rs
>> @@ -111,6 +111,22 @@ pub enum RegisterOffset {
>>      /// DMA control Register
>>      #[doc(alias = "UARTDMACR")]
>>      DMACR = 0x048,
>> +    #[doc(alias = "UARTPeriphID0")]
>> +    PeriphID0 = 0xFE0,
>> +    #[doc(alias = "UARTPeriphID1")]
>> +    PeriphID1 = 0xFE4,
>> +    #[doc(alias = "UARTPeriphID2")]
>> +    PeriphID2 = 0xFE8,
>> +    #[doc(alias = "UARTPeriphID3")]
>> +    PeriphID3 = 0xFEC,
>> +    #[doc(alias = "UARTPCellID0")]
>> +    PCellID0 = 0xFF0,
>> +    #[doc(alias = "UARTPCellID1")]
>> +    PCellID1 = 0xFF4,
>> +    #[doc(alias = "UARTPCellID2")]
>> +    PCellID2 = 0xFF8,
>> +    #[doc(alias = "UARTPCellID3")]
>> +    PCellID3 = 0xFFC,
>
>Why do we have specific doc aliases rather than just naming the
>registers with the full name?

Because prefix enum variants with the same prefix is an anti-pattern in 
idiomatic Rust.

>
>>      ///// Reserved, offsets `0x04C` to `0x07C`.
>>      //Reserved = 0x04C,
>>  }
>> @@ -137,7 +153,11 @@ const fn _assert_exhaustive(val: RegisterOffset) {
>>                  }
>>              }
>>          }
>> -        case! { DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR }
>> +        case! {
>> +            DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR,
>> +            PeriphID0, PeriphID1, PeriphID2, PeriphID3,
>> +            PCellID0, PCellID1, PCellID2, PCellID3,
>> +        }
>>      }
>>  }
>>  
>>
>> base-commit: 43f2def68476697deb0d119cbae51b20019c6c86
>
>-- 
>Alex Bennée
>Virtualisation Tech Lead @ Linaro
