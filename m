Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1115090njl;
        Mon, 16 Sep 2024 07:36:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMEBv5m8i3wrWJ1VIxRuQKCdpj0Ng26GOJjXzCzUAPqENL/4sUp8W6TwxDIySjXLJuEpxQnINSdRPK+g==@linaro.org
X-Received: by 2002:a05:6a00:4b16:b0:704:2563:5079 with SMTP id d2e1a72fcca58-71926211ddemr21663199b3a.27.1726497398310;
        Mon, 16 Sep 2024 07:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726497398; cv=none;
        d=google.com; s=arc-20160816;
        b=FDZBfDt5TEske3EE4LF9n/Q2tx2bpYd1/xXArAsQd5pLpP6pe3VQHvp0R8/RK5fp5d
         j7IT8PBpZ0RUvMApfO8maaV2BJBoLiMgxHHp/iLbR6vJIxkVvpyiEEv6OJlXKxV5bAVy
         hZgdtPe/IRa3OxIvA3Oo+12VYXBVpM0CAelVwQjt5imkE35E0lIRNzRtXaaL1sYCljx2
         U7UfGhJACASdw1xGo3sALtfu0AjXtwmc9JN8UE6bz8Kv8kNuadr1VbDYpq/hcLmv+F4Y
         DUclpe7+EPGqAe+sGcFgqwEnmIqlb6wgaOh8iCGAUg57iWHDz9c37L/pw9VGlsc3ma+H
         hp3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:dkim-signature;
        bh=AtE4KFL4y1KfM1a2ncZGv55A5+sOsr5snpgdop7oRcs=;
        fh=4m/+bxIAd9v1x5kOx5D3kaNmLxJ6iey30a9+ikZXs8Q=;
        b=moe6aosForMBXCFLzlwBbcuxtn6iMeMbb1YUyX/9GU73M8jDlymTYooBIhakJwUQmM
         iq+GRKIUtA0mygle/Lj7HbxjkPixNWxGyPupzyck++0HAvv2UaskBX2yh7cNi2BB++00
         2QvXGBL2rhiCzAYutxQ2FpgBLix4RN8bwf/B+OmCjFB2xx3DshzSgv7K+rtRj9rf6AQ4
         wPad7tInjubXPf1dfZHun3765mNMGNw54AOPl8gYNuHBwL1m2UayWz4fr/QXGhLE3A/3
         5cEQBiqdKy6E/vjYzmdAsENbjB5wMJ149BMP4XTuUgkpnpHSLwfR0YwQ29/elb0FuZ8d
         s1Uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltkDx+m3;
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <groeck7@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944b8ad3esor3693142b3a.7.2024.09.16.07.36.38
        (Google Transport Security);
        Mon, 16 Sep 2024 07:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltkDx+m3;
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726497398; x=1727102198; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AtE4KFL4y1KfM1a2ncZGv55A5+sOsr5snpgdop7oRcs=;
        b=ltkDx+m3FYmzEt8p40Okk/W5r3Qq1eZrRIpnQbTfQRKR4XzhYkq8dAzOzJNER8Y8k0
         IAJMF7nefb9iaypy0O3XQ2p2p5yGbQ0O4tU9Hzx3h9GNapSenzFgKEIUMRqo17CYTpu3
         v4h3O4TAChnvzYCjIdyxqTHRx5glVZamdnT6kuBV9Fzs6KRn06rHMXOxZw3ssV1W/IPh
         EfraURln67ZKw1opEgymF85EQMd5a9/KGEsbsK/0FljaskzJRK7WigoIAFrjPewsWx2+
         FqEmFD6bzl5wIgNjGDfoidVW/tcVQeH9Q87AueWhEjMuQ+W6i+5FJM7GmkTN1XXZH8nN
         A/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726497398; x=1727102198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtE4KFL4y1KfM1a2ncZGv55A5+sOsr5snpgdop7oRcs=;
        b=QlT8Ti3ZfReWjocMNjuDz016oq9zG5hceYySsmbLOkwGnT4dtur9nIFmWWhNoH1UiE
         /9WaKSVV4qw/I7sDmiQ5yM2/OXtBL62gp++5tJlnuLLkojqrYFBe4dqRFl4azq3jkE3+
         j3HFrXYGZfbXiZkOp6N7fYlq+/UaZJ363d9jpkDbBLjSL4VHSG1d2kSK2X/UMnNb43F3
         5ijGlkm0jA7rW7Z+uq59U8XYI05IaaYon+wLsBFyMrFpDNIzrnJXX8NVqhnp9Iymj9bB
         Mw+vgKzXt/S+E/5FTle4KbZhc/JxCoemFeY4oPJqgO5+3RuAyHPaS+gpJlfPY+InATwe
         9Jjw==
X-Forwarded-Encrypted: i=1; AJvYcCUtjPKk5KaMyPNzBz6wCadkip+GlJW25OqtaB39AoGM1ixKAFa4ae5amU0+NR3FuoqS+9ZT+giPI9gHqg==@linaro.org, AJvYcCXjlCOTCMN5CRQIC18chR9ny9MCFang+uwy/dy7Y2doq0pZMkIVcxEQK7wDBLDF4sUnSFGoqXpFhUGfTb79wA==@linaro.org
X-Gm-Message-State: AOJu0Ywyigtxy3HXIvEa+Rtc3/WGmoRDHIfN1b1YQBUyneGwHBgJ7m13
	F8y2KGHbmiVQvLdPkGPeZImogy/B8WMUTKrwjx9EQiCYADFSs2Mi
X-Google-Smtp-Source: AGHT+IFkOVZtQSoiD//8lhJKMKuosi37oEAlzkBFnxoEx6SRmqLEXDgjUsBuVIWoUvX+CCBQPVXXrA==
X-Received: by 2002:a05:6a00:1248:b0:70e:8d38:2845 with SMTP id d2e1a72fcca58-71926065599mr22642749b3a.1.1726497397562;
        Mon, 16 Sep 2024 07:36:37 -0700 (PDT)
Return-Path: <groeck7@gmail.com>
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944abaa98sm3762765b3a.68.2024.09.16.07.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 07:36:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c7400c06-07fd-43ac-a032-cd8bc6487116@roeck-us.net>
Date: Mon, 16 Sep 2024 07:36:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qemu emulation for USB ports of Allwinner H3
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <85f61ad3-da14-43f7-983c-62053ce0cfa6@roeck-us.net>
 <xgwmp3mjq2vhhwgbkbjr76o3yejkbm2ke7ybfes7xbafmpha53@pihh3myr7h7o>
 <CAPan3WoqwDaDt8W8vZ7RatL_mjnY_aCA0=REQq=B7ZEebhYAig@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAPan3WoqwDaDt8W8vZ7RatL_mjnY_aCA0=REQq=B7ZEebhYAig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gtSCpqfLmqfJ

On 9/13/24 15:20, Niek Linnenbank wrote:
> Hello Guenter, Gerd,
> 
> Thanks for bringing up the question. To be honest I do not know a lot about USB internals.
> When adding the orangepi-pc board emulation, it seemed fairly easy to add it, but apart from a few basic tests, I did not use the USB functionality extensively.
> 
> I do own the actual Orange Pi PC board hardware, so I downloaded the 'Orangepipc_2.0.8_ubuntu_bionic_server_linux5.4.65.7z' image from the official page to test:
> http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-PC.html <http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/service-and-support/Orange-Pi-PC.html>
> 
> After booting that image from an SD card with a serial console, this is the output from the same 'lsusb' command:
> 
> root@orangepipc:~# lsusb
> Bus 008 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 007 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> root@orangepipc:~# uname -a
> Linux orangepipc 5.4.65-sunxi #2.0.8 SMP Mon Oct 26 10:20:38 CST 2020 armv7l armv7l armv7l GNU/Linux
> root@orangepipc:~# cat /etc/lsb-release
> DISTRIB_ID=Ubuntu
> DISTRIB_RELEASE=18.04
> DISTRIB_CODENAME=bionic
> DISTRIB_DESCRIPTION="Ubuntu 18.04.5 LTS"
> 
> It does look like the same output compared to what we see under Qemu. But I'm not very sure if this confirms we are emulating correctly or not.
> 

Yes, I found that as well, and Gerd has reported the same. The main difference,
as far as I can see, is that the host sees different register contents.
I am not sure if that is worth fixing. Either case it is not my highest priority.

Thanks,
Guenter

> Regards,
> Niek
> 
> On Mon, Sep 9, 2024 at 11:33 AM Gerd Hoffmann <kraxel@redhat.com <mailto:kraxel@redhat.com>> wrote:
> 
>     On Sun, Sep 08, 2024 at 11:36:18AM GMT, Guenter Roeck wrote:
>      > Hi,
>      >
>      > the Allwinner H3 USB port qemu emulation creates separate USB ports
>      > for its EHCI and OHCI controllers, resulting in a total of 8 USB ports.
>      > From the orangepi-pc emulation:
>      >
>      > # lsusb
>      > Bus 005 Device 001: ID 1d6b:0002
>      > Bus 003 Device 001: ID 1d6b:0002
>      > Bus 001 Device 001: ID 1d6b:0002
>      > Bus 008 Device 001: ID 1d6b:0002
>      > Bus 006 Device 001: ID 1d6b:0001
>      > Bus 004 Device 001: ID 1d6b:0001
>      > Bus 002 Device 001: ID 1d6b:0002
>      > Bus 009 Device 001: ID 1d6b:0001
>      > Bus 007 Device 001: ID 1d6b:0001
>      >
>      > The SoC supports EHCI companion interfaces, and my understanding is that
>      > it only has four physical USB ports. Does the real hardware instantiate
>      > separate EHCI and OHCI interfaces (for a total of 8 USB ports), or does it
>      > use the companion functionality ?
> 
>     Well, on the guest side you'll see 8 ports even when using the companion
>     functionality.  Each physical usb port has one ehci port (used when you
>     plug in usb 2.0+ devices) and one ohci port (used when you plug in usb
>     1.1 devices).
> 
>     The main difference is on the qemu backend side.  When using the
>     companion functionality you have a single qemu usb bus accepting both
>     1.1 and 2.0+ devices.  When not using the companion functionality you
>     have one usb bus accepting 2.0+ devices and another usb bus accepting
>     usb 1.1 devices ...
> 
>     The guest-visible difference is an per-port bit in ehci registers which
>     controls whenever ehci or the companion manages the device plugged in.
>     This bit exists for backward compatibility (guests without ehci driver
>     can manage all devices via ohci, with usb 2.0+ devices being downgraded
>     to 1.1 compatibility mode then).
> 
>      > If the real hardware only instantiates four USB ports (or, in other words,
>      > if it utilizes EHCI companion functionality), would it make sense to
>      > reflect that in qemu ?
> 
>     Yes.
> 
>     take care,
>        Gerd
> 
> 
> 
> -- 
> Niek Linnenbank
> 
