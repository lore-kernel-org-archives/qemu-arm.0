Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1761828njc;
        Sat, 16 Nov 2024 12:24:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlr44HoWaA4TYf2P+u7RvbHYjCvhCKDxyPohxAX5Rk4gWfVae1MSJKewoi06hrrWY2Q693uXmz8VTBRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHiSWTkJN1U2i+IMOpL9Fm69Igbtq8WHXtpz0+CHiI9kGo9ktLAujyKfUsIQf8Da+fJ/X7/
X-Received: by 2002:a05:6214:2d46:b0:6d3:4055:e92c with SMTP id 6a1803df08f44-6d3fb7b0183mr94408836d6.8.1731788680892;
        Sat, 16 Nov 2024 12:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731788680; cv=none;
        d=google.com; s=arc-20240605;
        b=bwb/YY6a4pNi2e8D71conJIdnwqn8pn+eugv9rTYXBv5ZeJRkDANDzke+Q+vPveIHY
         IUoziKCSuIc/saZIjKqPrIahg5g2378cdLAsxLsvCLJuXTG3XPs+VXzZ2WKJ2hny5UOn
         wK6lpWrdm6c7bQ/fo0MxuIGpDeVAKxQ4KSoKYXGJ/6CAzkbaGjTGQnxUYR2wJTf4M+Up
         dxGIyJJfgWa48hlyThZkm+yaUpUpaaEJ/t9HnpnJ9KThf8trpFeNpaqypPqGNJGqlkED
         mns0lmSL3Pm7t67+bt6s6/p3PlbkLVi44OLYpzc4Z114WppNQSVnRsIOIWQGlwUMZ7Ub
         SInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=vobj0J68tgiXeoIbnC4J5t+3FC7RRd0R9SA6PR/izsA=;
        fh=IkIbr6jPAAZ1eFytWjUzuvzu8SxY3b+zlWWxQPqmRX0=;
        b=AVZSVUvkvImZ6xIUQYZf/QGGSrgC/wWgzqV4YYCZ++CsaVf11EsQNS3/q1QWKp8gFU
         zSDBKt61P6NxHWIUR2b27qEfUEhlV6YJ2h3FzsJlaI1zL4rPrFnEFSl4AnWBdwnPwTe+
         EDBe+VXUqtTJhzUtPRWXfE72iD0RvabKxTntm6aqt+WiI0FBbZqp5cPzo+mx3hqTMd4e
         /ttMOjDUkRb4PrD2N0SQfI5NxZYyM3ZZxzbIxQrBuKTC/aqoolyM8mBTD01mu5/7SWK5
         IK4RCKx1eS+fbmbh6vuElbkROsW55Oujkdnp8FEIPl6UKlftztP2CHeDMqYN6vfd7fyO
         /zmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fQWgy73s;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d40db72506si25510646d6.97.2024.11.16.12.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 12:24:40 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fQWgy73s;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731788680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vobj0J68tgiXeoIbnC4J5t+3FC7RRd0R9SA6PR/izsA=;
	b=fQWgy73sMrTQsJ4VpD+hIISyyNP5yc/eYjETKFzVNrZN49+J0PNLdaAmn9vUTO8Gw6ESn5
	RRAL0AmUBNC04WEI6ecLWnBl0TXYy8EBnS+YXhkS8ReKrv7gK4cxhjpOtQckkJqdTSCUQa
	s8zoCjPvaW++VIAtohu9Y5YtrMZdKCU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-LBRjLYYZNz2g0omflWlaBA-1; Sat, 16 Nov 2024 15:24:39 -0500
X-MC-Unique: LBRjLYYZNz2g0omflWlaBA-1
X-Mimecast-MFC-AGG-ID: LBRjLYYZNz2g0omflWlaBA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-431604a3b47so20992625e9.3
        for <alex.bennee@linaro.org>; Sat, 16 Nov 2024 12:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731788678; x=1732393478;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vobj0J68tgiXeoIbnC4J5t+3FC7RRd0R9SA6PR/izsA=;
        b=PXCfoRQ7wjNB/P1Zt/9bNKOSiSr90EEZu7x1aTw/pTW0kGFplbM67qJYfgj1j1wY+C
         AX4cEkPVz7icDxj4TXQdepCIFRmEsMOuXKlNEHc7PmVOBhzj5H9udQHS+QpnHzqoY9GP
         WRy4IyYWKEzXl/nOAseA6tswY7dhnsbBzCfgGId02cYbjNC/jIHc7P0wfKQeI1FCZ1mG
         uM4gOQ3TgckPP/+rzdWJw1ZSx/noaI83kIE+GGkVjdiLzQmgfSCzbe6tQxYcKf5R9qCH
         rM2sN2G5teO/AmVJAhXiKBUW2kmg+NOVaWjwuej1YtGprqAUfyN6KbZSV0QZ5PRsIv69
         SaEA==
X-Forwarded-Encrypted: i=1; AJvYcCWqJoHi6sgg7fdEvPtlxvOIljOJDmGH1IIY43ZeW2gn+ENFxodlmgIb+M/GLpm/mxqQRshKY+NPORrQ5A==@linaro.org
X-Gm-Message-State: AOJu0Yz+/wM7guwoiVZN/fSDzXNMsbO0LHcIJHwFx6cbeOOw+Gt7/der
	M9i7HB7Pv0DpiOClQVQE47yzimAtQ+t938RA3WDsdXx2f868T7gqTibY2PV+36Z+2o6eFUsB7HO
	gXAqKAyo8knKwLYvWUv+3Xed1yqBDLnPtJNTJtT4wQV4gWlOaclavWA==
X-Received: by 2002:a05:600c:4e8b:b0:431:4f29:4a98 with SMTP id 5b1f17b1804b1-432df77c605mr57609695e9.20.1731788678333;
        Sat, 16 Nov 2024 12:24:38 -0800 (PST)
X-Received: by 2002:a05:600c:4e8b:b0:431:4f29:4a98 with SMTP id 5b1f17b1804b1-432df77c605mr57609605e9.20.1731788677992;
        Sat, 16 Nov 2024 12:24:37 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.47] ([151.49.84.243])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-432da265ca8sm101716385e9.14.2024.11.16.12.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 12:24:37 -0800 (PST)
Message-ID: <7d835e14-c3d4-4aba-b4a9-eeb06f56fdde@redhat.com>
Date: Sat, 16 Nov 2024 21:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] rust/pl011: Fix DeviceID reads
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-rust@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20241116181549.3430225-1-manos.pitsidianakis@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20241116181549.3430225-1-manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qnrqw7iZOaI6J2fkhE5zguitldu1Mv8jKZ0V0_-qFuA_1731788678
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: wwndv3D1Iq8j

On 11/16/24 19:15, Manos Pitsidianakis wrote:
>   impl DeviceId {
> -    const PL011_ID_ARM: [c_uchar; 8] = [0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1];
> -    const PL011_ID_LUMINARY: [c_uchar; 8] = [0x11, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1];
> +    /// Value of `UARTPeriphID0` register, which contains the `PartNumber0` value.
> +    const fn uart_periph_id0(self) -> u64 {
> +        0x11
> +    }
> +
> +    /// Value of `UARTPeriphID1` register, which contains the `Designer0` and `PartNumber1` values.
> +    const fn uart_periph_id1(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x10,
> +            Self::Luminary => 0x00,
> +        }) as u64
> +    }
> 
> +
> +    /// Value of `UARTPeriphID2` register, which contains the `Revision` and `Designer1` values.
> +    const fn uart_periph_id2(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x14,
> +            Self::Luminary => 0x18,
> +        }) as u64
> +    }
> +
> +    /// Value of `UARTPeriphID3` register, which contains the `Configuration` value.
> +    const fn uart_periph_id3(self) -> u64 {
> +        (match self {
> +            Self::Arm => 0x0,
> +            Self::Luminary => 0x1,
> +        }) as u64
> +    }

If I understand correctly, these are two reasons why you did not go with 
the simple adjustment to the Err(v) pattern:

* the separate registers match the datasheet more

* given the bug that you are fixing in the write function, you want to 
avoid duplicating "Err(v) if (0xfe0..=0xffc).contains(&v)" between read 
and write; instead, you rely on exhaustive enums for error checking.

I wonder if we can keep these improvements while making the 
implementation a bit more concise...  The eight const getter functions 
are quite verbose, and having the device type match inside each function 
is repetitive and hard to verify.  Maybe something like

     const UART_PCELL_ID: [u8; 4] = [0x0d, 0xf0, 0x05, 0xb1];
     const ARM_UART_PERIPH_ID: [u8; 4] = [0x11, 0x10, 0x14, 0x00];
     const LUMINARY_UART_PERIPH_ID: [u8; 4] = [0x11, 0x00, 0x18, 0x01];

     /// Value of `UARTPeriphID0` through `UARTPeriphID3` registers
     const fn uart_periph_id(&self, idx: usize) -> u8 {
         match self {
             Self::Arm => ARM_UART_PERIPH_ID,
             Self::Luminary => LUMINARY_UART_PERIPH_ID,
         }[idx]
     }

     /// Value of `UARTPCellID0` through `UARTPCellID3` registers
     const fn uart_pcell_id(idx: usize) -> u8 {
         Self::UART_PCELL_ID[idx]
     }

could be the best of both worlds?

>           match RegisterOffset::try_from(offset) {
> +            Ok(PeriphID0) | Ok(PeriphID1) | Ok(PeriphID2) | Ok(PeriphID3) | Ok(PCellID0)
> +            | Ok(PCellID1) | Ok(PCellID2) | Ok(PCellID3) => {
> +                // Ignore writes to read-only registers.
> +            }

This is indeed an improvement over the patches that Junjie and I had 
sent, because the writes would have gone down the eprintln! path.

Thanks,

Paolo

>               Err(_bad_offset) => {
>                   eprintln!("write bad offset {offset} value {value}");
>               }
> diff --git a/rust/hw/char/pl011/src/lib.rs b/rust/hw/char/pl011/src/lib.rs
> index cd0a49acb9..1f305aa13f 100644
> --- a/rust/hw/char/pl011/src/lib.rs
> +++ b/rust/hw/char/pl011/src/lib.rs
> @@ -111,6 +111,22 @@ pub enum RegisterOffset {
>       /// DMA control Register
>       #[doc(alias = "UARTDMACR")]
>       DMACR = 0x048,
> +    #[doc(alias = "UARTPeriphID0")]
> +    PeriphID0 = 0xFE0,
> +    #[doc(alias = "UARTPeriphID1")]
> +    PeriphID1 = 0xFE4,
> +    #[doc(alias = "UARTPeriphID2")]
> +    PeriphID2 = 0xFE8,
> +    #[doc(alias = "UARTPeriphID3")]
> +    PeriphID3 = 0xFEC,
> +    #[doc(alias = "UARTPCellID0")]
> +    PCellID0 = 0xFF0,
> +    #[doc(alias = "UARTPCellID1")]
> +    PCellID1 = 0xFF4,
> +    #[doc(alias = "UARTPCellID2")]
> +    PCellID2 = 0xFF8,
> +    #[doc(alias = "UARTPCellID3")]
> +    PCellID3 = 0xFFC,
>       ///// Reserved, offsets `0x04C` to `0x07C`.
>       //Reserved = 0x04C,
>   }
> @@ -137,7 +153,11 @@ const fn _assert_exhaustive(val: RegisterOffset) {
>                   }
>               }
>           }
> -        case! { DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR }
> +        case! {
> +            DR, RSR, FR, FBRD, ILPR, IBRD, LCR_H, CR, FLS, IMSC, RIS, MIS, ICR, DMACR,
> +            PeriphID0, PeriphID1, PeriphID2, PeriphID3,
> +            PCellID0, PCellID1, PCellID2, PCellID3,
> +        }
>       }
>   }
>   
> 
> base-commit: 43f2def68476697deb0d119cbae51b20019c6c86
