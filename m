Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1043491lfg;
        Sat, 1 May 2021 06:12:14 -0700 (PDT)
X-Received: by 2002:a9d:77c7:: with SMTP id w7mr7742161otl.131.1619874734541;
        Sat, 01 May 2021 06:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619874734; cv=none;
        d=google.com; s=arc-20160816;
        b=zh23PVs8wXzsEB8Ya6dpWxjrjUuuQ+a0Yn+PlhfYDuPRQM7uqKQuNbGEQDtNIyQFLg
         6ERLkNMRdoDeVNX6WR8z6uXm80JAN7Z1U/RFSRgjbk8JCsuAKI5FuS33fbn2n8FMjZE3
         KXbI6GDam9VR+dRRMCLYLE9O1dgV0QHf2tolCkGmM11JHrYtU6fFYkmOl/ACe8y22v8M
         IM6Xsk8woNzNMeq3ER3VZHI3St+8vNK227PG+V+zOlh9z+7e7rDSkp+mO2Vu/pGioQqX
         B+lMyGeq28lb9zKp3F7VlDo8wA9L2ycRaBg4EBXfIRzSEWYC5elWtLP/+nfAe/JCE5Nd
         Ml/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=8MiVVkIZNW/ltqxDo5KpIq5+cCUCDJhuFtfHkkPt4Iw=;
        b=KABlvJ1ym006v0t03hT3+P4J2z5mn4v/rhRfZh8bGfVQV3q56Ik2VgYT97hAs6ipDX
         dvXYJiJAWEIIeziDUs4vqgEM4s/49vKPwi7dlfYYlxZk4n2TRGlTjLevkK9cLnWtMqJa
         vmSEYxnAmKqNww6oWLMN3aCZiXOpG/ZvxKNNsfwYh608GbHcDQBvsL/uCZ0g5XGnDC8I
         Dt+hBJAyyDltwLWGLQCxtANiXjBUWXUL3BcL7lkJfGOt4eZevGMoy8kuJE2cY6Vw076R
         PjgMAwR+TJw54lV16n5/GKEp/LAo803GUPZ6n2C5Y3ivwVh1FXWCCvstwdAR5NHpaksu
         OkXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="j5l6L/0Z";
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com
Return-Path: <groeck7@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k30sor154946otj.154.2021.05.01.06.12.14
        (Google Transport Security);
        Sat, 01 May 2021 06:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="j5l6L/0Z";
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8MiVVkIZNW/ltqxDo5KpIq5+cCUCDJhuFtfHkkPt4Iw=;
        b=j5l6L/0Za9rNlEDBDJE5g2NOtDcOPY+s2Mu3uW1G5DYTM5QYaPUQx9HMO4OGzD4eAb
         ZOPRNvDGAZ5KsKLFLu6BbwTa8x83d6MEwR8F52hgr8ix05AXoDM9KfrF+3KMPWng27w1
         d58pd/jiN02ljsHHJkSXLKMjNH0R94a3X8y95tJS9rncHZuAgWnHAVQutH9HsR3NIY2M
         xAYXPVbzCyyo0gBBPmqWZkK+tycnFmBvDrVnvg9YGpOhjpE1xmvOTwp0qVyGgwbsBlRx
         5vQAnEfQiTv/0sl9eJ+1CNMr9xcg51C2zcF8D7phrnER0DNjQwIPXbu/sJH01aOCB7Yf
         Mhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8MiVVkIZNW/ltqxDo5KpIq5+cCUCDJhuFtfHkkPt4Iw=;
        b=Vw/B3KnbGx2vB87RnYydFoyfJjYIWY5FJNMFE289DIREfCuhdeRlOSTRq+NHqtrwM/
         0KTXVv2JgrGaHnLWZkSSZzyL5N4DcJVpSbbcH5a0kBxf9833yecQcbdLPfr4qzeNlTFr
         mayAl5rwg+0Ia4RDZRcoCYsmR34T/wKH93O7iaYrJy3SICFaVKtuE8WwJWNWEq2dYpub
         rhkvsPWwbaleY/x/u7GePt4UBg5v58yv46+nG4qSvc1dJ2mHxKCEprvdzlGkvvSP/2gs
         h5ZAcUMS3T+LM2Er5O4yQhWxZv1VDJbJsyMAPxwx9XzJTb4mGdGscQB8/LDIE6yIZDJs
         NElg==
X-Gm-Message-State: AOAM532i32lkLF95lXlV5jSmtFNLH/YbOKn45C2mzp9NAGjklAQ+PV+b
	0ttJh5Tpb7/TFwP3jHnuuWg=
X-Google-Smtp-Source: ABdhPJyvpDTnjkPP0oggjVJWAblGQLBtFnf+wyw/4gxTp49rCSMI+7nmoTd72NnN4EgGefjzRSJhQg==
X-Received: by 2002:a9d:5a4:: with SMTP id 33mr7491285otd.328.1619874734130;
        Sat, 01 May 2021 06:12:14 -0700 (PDT)
Return-Path: <groeck7@gmail.com>
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id y8sm1472460oie.28.2021.05.01.06.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 May 2021 06:12:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm
 <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c57026be-01fb-41ad-b7c2-093a3704bf16@roeck-us.net>
Date: Sat, 1 May 2021 06:12:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: p3+hw7W6oFQL

On 4/30/21 9:28 PM, Bin Meng wrote:
> On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> Hi,
>>
>> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> At present, when booting U-Boot on QEMU sabrelite, we see:
>>>
>>>   Net:   Board Net Initialization Failed
>>>   No ethernet found.
>>>
>>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
>>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
>>> board, the Ethernet PHY is at address 6. Adjust this by updating the
>>> "fec-phy-num" property of the fsl_imx6 SoC object.
>>>
>>> With this change, U-Boot sees the PHY but complains MAC address:
>>>
>>>   Net:   using phy at 6
>>>   FEC [PRIME]
>>>   Error: FEC address not set.
>>>
>>> This is due to U-Boot tries to read the MAC address from the fuse,
>>> which QEMU does not have any valid content filled in. However this
>>> does not prevent the Ethernet from working in QEMU. We just need to
>>> set up the MAC address later in the U-Boot command shell, by:
>>>
>>>   => setenv ethaddr 00:11:22:33:44:55
>>>
>>
>> With this patch in place, the standard Ethernet interface no longer works when
>> booting sabrelite Linux images directly (without u-boot) using the following
>> qemu command.
>>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>>         ...
>>
>> The Ethernet interface still instantiates, but packet transfer to the host
>> no longer works. Reverting this patch fixes the problem for me.
>>
>> Is there a qemu command line parameter that is now necessary to instantiate
>> the Ethernet interface when booting Linux ?
> 
> Enabling "guest_errors" shows that Linux kernel fec driver is trying
> to read PHY at address 0, which is not what we want.
> 
> [imx.fec.phy]imx_phy_read: Bad phy num 0
> 
> The device tree blob of the sabrelite does not contain a node for the
> ethernet phy specifying phy address, so I suspect Linux kernel driver
> is using default phy address 0 instead.
> 
> Could you please test on a real hardware to see what happens?
> 

I don't have access to real hardware, sorry.

Guenter
