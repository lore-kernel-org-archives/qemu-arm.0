Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp178196lfg;
        Fri, 30 Apr 2021 07:41:38 -0700 (PDT)
X-Received: by 2002:a4a:c689:: with SMTP id m9mr4783560ooq.70.1619793698666;
        Fri, 30 Apr 2021 07:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619793698; cv=none;
        d=google.com; s=arc-20160816;
        b=CNHwTV+60F6gravJXb+yCao02wi6J2Zmu/yl8guk4xN7cKRu4BAG9iYOkOwG4aUUd7
         ADifNlL924ofrEucu5HvmS30T0XIXL1G1u0aRT9p3CAMdaQzvwFi46WqsOvM7DdZxo48
         RM7nec4k5mQ/OlNPjJjAJ1dxOeawP7y7pjKO4I4FquFRyUpI3yHuj3lf27lmCEUFpNuw
         aEGgHeVsC95BBtspBy59mUkIE+bS1BUTMnOcukIOERKoNwB5Vi5mGlMf9ZE4QlQQ/6qv
         f4NoqbUBpTE8sgqoN0aSm+M9JKe02Bpvj6SqXAUjAf5Ms87SMSJ7p4pGS+S/SbKsL87x
         Dw8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:dkim-signature;
        bh=eNTH4I8qBqt/u90sZvzopafrVlOwn/Hw03R4BYUX65g=;
        b=XRHlX9aZCl87+TsOtD7BaEzrngIp3NPVK2aFiUxi+YUHEd5UkT9t8wde6aPYbtVMqf
         Z2jv8fZH06RuKsBk3mqqKQQ2eIse9h1EMt3flQVX7E6DTAQq424P7GuaQ+wxlktbprE1
         BKC8CDOBa7YIKsjisb8TCsm470MPbTiBkL4q7fWWcvbUuodibgoaBLmEow7TESTwFU/0
         SueChW9zHjnY9aEq/Ifoi46oCkEa/qJg4F7KAWHVEpnq2lqM5Kc8l12pGjsw07IEwiPt
         ClFI86zrHNuz/foH2riF8DgrBig2MWqGOJGELgP+5+HTYmZsU+nvX1/OYqA7YlfrZzcQ
         LDFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UNjAC56R;
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com
Return-Path: <groeck7@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 186sor3309128oob.8.2021.04.30.07.41.38
        (Google Transport Security);
        Fri, 30 Apr 2021 07:41:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=UNjAC56R;
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eNTH4I8qBqt/u90sZvzopafrVlOwn/Hw03R4BYUX65g=;
        b=UNjAC56RqHknwaMiQn4m6Yeb9lwxSWZdKrX2NMq7LHCQppaZI9T3vQSIcbDHOp2/vA
         xLXPSFoILyGEckEvJcQEkXsRmy1Hvvc794yx+fjXDTTuMLu2PE+e1CU6ZmF+w3wbzIcS
         d16CFvaDEQV/WOqgOOTCnM6zbvQEFI0dRXoYE8UYuURaA1rHxIbjF4wN8RLRNvm3yHgC
         mE1DVhZ4FNtT30QymLYrsQqfrHPBfQtRkC4CVcjwUqnjHNhV7Q7fDa8cBG2vGzIicGAq
         BokO8QZ1MhnO5QifVx3KTpHfcEPEkRBTcLmKTHCyG0mnkRh2ZYYOQAz4cl8Ibg/OWh3q
         bZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=eNTH4I8qBqt/u90sZvzopafrVlOwn/Hw03R4BYUX65g=;
        b=qW2xM7Ee+Zj1oulseyLVJEtV77qWvYlp+mP7aas5TKXLfbYqxAU0V8+AsETZLImhYK
         mvAAfhyVkpT4BWPoWISL3sU86k52eKDYoTGvd9cj59HSbErTbqLr1ohFKIYL3u9YYERu
         QV0ZnoQ+VH96OOsThpT0reInPvAou4VDbLHO61jRlhY4bBnLy8mZVCtICkm9V0ql/dmW
         3RHipbK3aXvULflfxS23bGrmNFctdpHzhJiRMCBbydCy5cJoMfzX4fTz0B/yYaef9KPG
         SzqLYadIKr+XQMz70mH9JSfej1lLj5dM/xrQoh5apnTYWo+SL328ly1J3TahB4wu2bDR
         TVeg==
X-Gm-Message-State: AOAM530b2H/FWjA7vyPzRiycjEe2CqupRAbENvLfJtdb0sg/VHRUm+sg
	aK1tIlgwD0XYUDj3M40djjo=
X-Google-Smtp-Source: ABdhPJwrEf8Nq0QpfOz4T+zwemm1nmqwlkx/yzLtEeklQLs/6Wl1ZfRX0X9nKGNb1mdPIOB4zlIFfQ==
X-Received: by 2002:a4a:9706:: with SMTP id u6mr4725656ooi.84.1619793698214;
        Fri, 30 Apr 2021 07:41:38 -0700 (PDT)
Return-Path: <groeck7@gmail.com>
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a11sm819550oif.52.2021.04.30.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:41:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 30 Apr 2021 07:41:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
Message-ID: <20210430144136.GA2880420@roeck-us.net>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106063504.10841-4-bmeng.cn@gmail.com>
X-TUID: pm8baQaddtKV

Hi,

On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present, when booting U-Boot on QEMU sabrelite, we see:
> 
>   Net:   Board Net Initialization Failed
>   No ethernet found.
> 
> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
> board, the Ethernet PHY is at address 6. Adjust this by updating the
> "fec-phy-num" property of the fsl_imx6 SoC object.
> 
> With this change, U-Boot sees the PHY but complains MAC address:
> 
>   Net:   using phy at 6
>   FEC [PRIME]
>   Error: FEC address not set.
> 
> This is due to U-Boot tries to read the MAC address from the fuse,
> which QEMU does not have any valid content filled in. However this
> does not prevent the Ethernet from working in QEMU. We just need to
> set up the MAC address later in the U-Boot command shell, by:
> 
>   => setenv ethaddr 00:11:22:33:44:55
> 

With this patch in place, the standard Ethernet interface no longer works when
booting sabrelite Linux images directly (without u-boot) using the following
qemu command.
	qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
	...

The Ethernet interface still instantiates, but packet transfer to the host
no longer works. Reverting this patch fixes the problem for me.

Is there a qemu command line parameter that is now necessary to instantiate
the Ethernet interface when booting Linux ?

Thanks,
Guenter
