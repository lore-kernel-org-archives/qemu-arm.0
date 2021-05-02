Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1466300lfg;
        Sat, 1 May 2021 18:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywUlRV7+Auwf2OGFsW2kFO1T55Z8DzX5ilJlYCg/9R8HW2+aDpWBNIlDIOlQ40qvLkC5Fb
X-Received: by 2002:a05:6e02:4c4:: with SMTP id f4mr10142864ils.272.1619919460283;
        Sat, 01 May 2021 18:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619919460; cv=none;
        d=google.com; s=arc-20160816;
        b=k2bnu4TeuAFsUAQHrGFktT8W+Q6g7mEx5Q4jZ9lvwFJnaBVG1GD/+EkckY/NlWHrKh
         DTvD9hZ95pWd9htzywx8EBxxfeZp5AEUycKe8x10gQslA4moqMqjEfNWQIF5O75vfw8L
         lYoWI0TvDfX7D8CvzKvwJXx+QmVk8g5/xXTdtmcmTj/H8fR8+j3Z0jfUrxfVU2Ghs5JP
         7F8AXZi3wTAt96wgJtak3EmIzXA9rgUR3TArzHWk2bQ6fmnOY2oJA4SHtr0ezOB0KnHd
         pUHxV0GurgfVDBXXIV5oJvY7GcP3JHKr2OVe3nDr/wpeh28nHyscIuPvAshfLP18VcwF
         BIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r4Bb6ht523fYKvsoJ8f1qXnQ3naMVzUj5D8CubvOgrc=;
        b=GmI73GYFWACse/UbLTykf+yWELhRKGSJ81FSUNfCo1fwcdUqlnN6OGYcRTOdgRHI1F
         X77wBXtwi/0MHeTEsM4Mg8U4jKcaPqKI7xfsDwpveyZww/BHhjKDWGMaD3h14rTgZcHv
         RzEr8i3yXbiBFflWO+lGLIGOiusrz+/jnpG+/Et9QgooF+tduAR10wPXB1arWLSF4qw/
         ovjOO5jjW8OEmqN3Ipoe8snKpUQTKAXeB0Q1eucoRJpJ3VFCm4RBa3Y/4boRyv0ULZca
         DkxCe27MC7NJCHwliods+LlmKtFMmx2GKYBUvGZlzPGV3at0+bS1tKaZZsnw/kgq92mx
         IUNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KlwCcrQz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si7428320jap.52.2021.05.01.18.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 May 2021 18:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KlwCcrQz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ld13D-0001iR-JD
	for alex.bennee@linaro.org; Sat, 01 May 2021 21:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ld134-0001iH-Ea; Sat, 01 May 2021 21:37:30 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f]:43539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1ld132-0005Ct-CF; Sat, 01 May 2021 21:37:30 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 p6-20020a4adc060000b02901f9a8fc324fso481723oov.10; 
 Sat, 01 May 2021 18:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r4Bb6ht523fYKvsoJ8f1qXnQ3naMVzUj5D8CubvOgrc=;
 b=KlwCcrQz/vKrlGDb6QtxsAbOjmpjU0ygAorvY3MRagg06V9OJvAm8+r2TadhrsVSX0
 40PnUs2qOwPlHbEReahrR50dhtjnbU9Kn8jke/aLVtwQdT3YdbgENGcHbS0ozFePnqH3
 y/FWQY01vEoAEegAzBoT4gYP15D0dSCeT1KFq2l28nZzEFQw0CMmAvDMFXkt3Gh04krs
 enbDPCHnjZkejc5257/aGIOskaq/WUZ7Q95fdD+b0zTKc6U6toErvIkR1FWwo68YTRzY
 hcUNnjcvm9Ziy+mWrBrjJO4PJIMi6PWzutf7SfqMd8Mzs8a/jo51jspF4G+jXQ3p6VrJ
 Hb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r4Bb6ht523fYKvsoJ8f1qXnQ3naMVzUj5D8CubvOgrc=;
 b=AWfdPUlDHS3vy9uSFsZrYWiZtwjOzMP7fCE4iA4u1SKpXdVD8SJ1XIIZxH8PiVNCxv
 HHxhA2vzQC2+vZF0Nje9Sv8IVOpiOkHcpqSyUymgkEpwr5x1Np6oxQ8T8OTduOW4dMWx
 MHpe5b5dbhZDQKO5x2nPADDzI4PXd7wWwo1gWq7D9GHY6Qk7ydpr7yVmIqKTtcTcoOxj
 aABZg4CRyaPwnGf4ec0CVT8IiQGih+WQ98ORqnzvOGZyrWU5YaKmktsnSZ6OUjx5rH2+
 ccFMETdDPXVbOnLDKlmKteNsb2WGYsqbNsXgGMYM5jBE6dg7tzc2g8JNJivPQkH7VoAl
 1kIA==
X-Gm-Message-State: AOAM533EmEMD96BXrRoxvsd4P+R4F3P38M48To8aSWFC+Yb5p1ZgZ3qZ
 f5zaDJ1+Bp84GVACNY5KqFSEAv2My88=
X-Received: by 2002:a4a:5242:: with SMTP id d63mr5621608oob.93.1619919446484; 
 Sat, 01 May 2021 18:37:26 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id j11sm1818484ooo.45.2021.05.01.18.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 18:37:25 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
 <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
 <6f92b247-cc78-1e26-5809-2ae4809be5c6@amsat.org>
 <b94a7a17-75bb-5b8d-adf4-ab2ff33c0553@roeck-us.net>
 <CAEUhbmVxBiYo_=Xx4w=4d2Y+DYHuHzKFahbUG-7qFS4THFqAkg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <72bc74d2-053f-b0ab-b90d-391f777dfce3@roeck-us.net>
Date: Sat, 1 May 2021 18:37:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVxBiYo_=Xx4w=4d2Y+DYHuHzKFahbUG-7qFS4THFqAkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VrKhjdwmHsu0

On 5/1/21 5:24 PM, Bin Meng wrote:
> On Sun, May 2, 2021 at 7:21 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 5/1/21 2:40 PM, Philippe Mathieu-Daudé wrote:
>>> On 5/1/21 10:12 PM, Guenter Roeck wrote:
>>>> On 4/30/21 9:28 PM, Bin Meng wrote:
>>>>> On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
>>>>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>>>>
>>>>>>> At present, when booting U-Boot on QEMU sabrelite, we see:
>>>>>>>
>>>>>>>   Net:   Board Net Initialization Failed
>>>>>>>   No ethernet found.
>>>>>>>
>>>>>>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
>>>>>>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
>>>>>>> board, the Ethernet PHY is at address 6. Adjust this by updating the
>>>>>>> "fec-phy-num" property of the fsl_imx6 SoC object.
>>>>>>>
>>>>>>> With this change, U-Boot sees the PHY but complains MAC address:
>>>>>>>
>>>>>>>   Net:   using phy at 6
>>>>>>>   FEC [PRIME]
>>>>>>>   Error: FEC address not set.
>>>>>>>
>>>>>>> This is due to U-Boot tries to read the MAC address from the fuse,
>>>>>>> which QEMU does not have any valid content filled in. However this
>>>>>>> does not prevent the Ethernet from working in QEMU. We just need to
>>>>>>> set up the MAC address later in the U-Boot command shell, by:
>>>>>>>
>>>>>>>   => setenv ethaddr 00:11:22:33:44:55
>>>>>>>
>>>>>>
>>>>>> With this patch in place, the standard Ethernet interface no longer works when
>>>>>> booting sabrelite Linux images directly (without u-boot) using the following
>>>>>> qemu command.
>>>>>>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>>>>>>         ...
>>>>>>
>>>>>> The Ethernet interface still instantiates, but packet transfer to the host
>>>>>> no longer works. Reverting this patch fixes the problem for me.
>>>>>>
>>>>>> Is there a qemu command line parameter that is now necessary to instantiate
>>>>>> the Ethernet interface when booting Linux ?
>>>>>
>>>>> Enabling "guest_errors" shows that Linux kernel fec driver is trying
>>>>> to read PHY at address 0, which is not what we want.
>>>>>
>>>>> [imx.fec.phy]imx_phy_read: Bad phy num 0
>>>>>
>>>>> The device tree blob of the sabrelite does not contain a node for the
>>>>> ethernet phy specifying phy address, so I suspect Linux kernel driver
>>>>> is using default phy address 0 instead.
>>>>>
>>>>> Could you please test on a real hardware to see what happens?
>>>>>
>>>>
>>>> The problem is that qemu returns 0 when the OS tries to read from a
>>>> non-existing PHY. Linux expects it to return 0xffff, and believes that
>>>> a PHY is there if 0 is returned.
>>>
>>> Correct.
>>>
>>
>> I'll send a patch. Next question is why the Ethernet interfaces on mcimx6ul-evk
>> and mcimx7d-sabre don't work. I either get no connectivity at all (similar to
>> the above) or something like
>>
>> fec 2188000.ethernet eth1: Unable to connect to phy
>> ifconfig: SIOCSIFFLAGS: No such device
>>
>> Any idea ?
> 
> I don't see these 2 are supported targets of QEMU:
> https://wiki.qemu.org/Documentation/Platforms/ARM
> 

Reality says otherwise.

$ qemu-system-arm --version
QEMU emulator version 6.0.0 (v6.0.0-25-geac5bb0cc1-dirty)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
$ qemu-system-arm -M ? | grep mcim
mcimx6ul-evk         Freescale i.MX6UL Evaluation Kit (Cortex A7)
mcimx7d-sabre        Freescale i.MX7 DUAL SABRE (Cortex A7)

Guenter
