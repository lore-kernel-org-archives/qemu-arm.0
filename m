Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1303654lfg;
        Sat, 1 May 2021 13:12:06 -0700 (PDT)
X-Received: by 2002:aca:4acf:: with SMTP id x198mr2036654oia.111.1619899926718;
        Sat, 01 May 2021 13:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619899926; cv=none;
        d=google.com; s=arc-20160816;
        b=O67WyO5dC9x2wNeZ9oDHgUhvAKPnKwMZxk49HnNsR4hzn+ZizwzAt+HpO23IQs3hUp
         dd+AcOgD8GHY5RbA9wWtjuqrb+dGVHcFpxx1loayAZXtp1sNSuUQPfhhteLWBvbXvWU4
         bawi6/ypq48zYfqC20VLPzsnD+fAipqRMSW5/R6f5cEobIrGjFvfYX1+K4/FydtGGP5Y
         e88lZzAt32cxCYJyhvZmIaFFZ427x5bDXFt0fcdj4qMJACzYLmahDcsd8GEE0FhP/EVE
         TALsyRRh6jTAeOqG0rlrS4mulMnuMic7xvUI+b0DL4Pa9nd7Ft4FlWyNtOuXa3UkyGAU
         N6Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:from:references:cc:to:sender
         :dkim-signature;
        bh=wUTupG1ciOFu3wWEybiL9ryNjvgtT6aHKOAzGYFRyMw=;
        b=yJfhDnqaz1DOib/XKiPu7DldQmcPAkae0zdudNBRDSNf2nOBo874lMV7ya6ljWujIq
         kx9fnGJoDeYRio1I2q+ly3LeGmSKen0j+DjAaOq2mCNIPfczLRIALuZZM0G6vKoclT7V
         JLhdJjYonx1o6xoQQ9VgNsTXjERas2KIKg4FouxhvkEymMAKGAy3SQ7Pk93eq0j/M/Lp
         MqXQ5KHOSbBNWYdHZOnNXaBBf9+whGGcspraAKIa6jx3imjSsi0usOEXgofCuiaRIVag
         1U4kZWrZ4Aio6Jf4g8/PhLx+GUzLL8hMEymMTtAIDprmHiKm0elzmYS4nhRQPLfbhOiL
         naBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IP31ftSy;
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com
Return-Path: <groeck7@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e13sor1909017oth.66.2021.05.01.13.12.06
        (Google Transport Security);
        Sat, 01 May 2021 13:12:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IP31ftSy;
       spf=pass (google.com: domain of groeck7@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=groeck7@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wUTupG1ciOFu3wWEybiL9ryNjvgtT6aHKOAzGYFRyMw=;
        b=IP31ftSyRABTKjhWgAp/tRSg6Ci5mXQT3AGkvQ5NOaaYkVQ+fE7QAZVcT+6hfCcK79
         WRERFOAAxSwt/2nzM7udbl3bTR0q4v/+XMeKHk9z/c6xg/4jkKPFtWZBLZdBzvrN2uQq
         2xrNjxafZpaF5z21rkaKUjuDmOccEw7Zz1Fjd2lb42z/892gM3yoqx4byvfrCYMVIB9M
         WIbK+HT+tUryDSzv80ly6ib1UClN3ONVfiY+XZCrgtfK+hez5cfBoHZRfXYPH7CRkUU7
         4xRNyPIwxNcfgog4Br7JlX2xgm64V2IFl1T8Vmbihj33N+VgqyI75usoMgycdgfYrikL
         PVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wUTupG1ciOFu3wWEybiL9ryNjvgtT6aHKOAzGYFRyMw=;
        b=M1K1JV/2M1+ISImNXPkITSih0KRDLvJ3u2tYz3CrN9yfkbgd6urP30FbfU7Xr/WOTF
         ZgMureMZgQ6h5k+3IBE9nTy4Ed2feoo219nUOR7XSnZ0NMjUQ/+st0KrpDyv/BAaznCi
         FS2NbUY3ZVH26wCz2mbOL29H4azIhj9NRYtBRXUKhIGqiI/iBzFm6lKpHyy3pyuvV+8c
         1/V9wGbMnvkWPBurxyzDdLwAE1bIatiD1CCWJ6Z5Up7Gbd7+Uqb8pM/qs+0KErYCXgTL
         aVkPAtSTSCqNDEQzZhvswuBNNG68IXcVt1neBiMayr2RDgOuSidSdW/ySGgDqp0ShI7z
         f4Uw==
X-Gm-Message-State: AOAM532VOBKQrUsLDYY9hzxLwkV7dIeDrs6B/6sW7BlgH17cX01G7uBu
	+uW/rgE7TeY0h1lpax0NBxc=
X-Google-Smtp-Source: ABdhPJwONXFZ+Mwlfc9TD3iI8bzpCB/LtIpd9+Eig7O77Vv4w6Sul9HdeurkekD2j9EibrJI+mJm2Q==
X-Received: by 2002:a9d:a4e:: with SMTP id 72mr8716338otg.229.1619899926174;
        Sat, 01 May 2021 13:12:06 -0700 (PDT)
Return-Path: <groeck7@gmail.com>
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i9sm1594595oog.17.2021.05.01.13.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 May 2021 13:12:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
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
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
Message-ID: <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
Date: Sat, 1 May 2021 13:12:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: CtybW1edOZBr

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

The problem is that qemu returns 0 when the OS tries to read from a
non-existing PHY. Linux expects it to return 0xffff, and believes that
a PHY is there if 0 is returned. This helps:

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index f03450c028..3c90c38e26 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -285,7 +285,7 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
     if (phy != s->phy_num) {
         qemu_log_mask(LOG_GUEST_ERROR, "[%s.phy]%s: Bad phy num %u\n",
                       TYPE_IMX_FEC, __func__, phy);
-        return 0;
+        return 0xffff;
     }

Note that this is not really a guest error; any OS can and likely
will scan the MII bus for connected phy chips.

Guenter
