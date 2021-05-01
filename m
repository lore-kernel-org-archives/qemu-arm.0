Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1396106lfg;
        Sat, 1 May 2021 16:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLADlUZOQWbKuO9bsK6JOCMmhk+5xH+sQh3s792Q62oPbomuRZH3rgyxj1Oe+8JO6XInnk
X-Received: by 2002:a92:ab01:: with SMTP id v1mr10183523ilh.190.1619911307667;
        Sat, 01 May 2021 16:21:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619911307; cv=none;
        d=google.com; s=arc-20160816;
        b=BNMpMomqd2WJ4FpIU+h1+udJBIVM3b84WuqPyOMxgR6GUe/cfLnU0Wjy45M//TQPOf
         sZsRtusEs/txd5CNQNeqWczFiws0Ny7za1ksAAso9Na2PHZazE+5djgrA++avr2t8R3o
         dyuQZu/0okUilw+LpmOjtliN2sgr0MG/iTU8E49eFT3eM37KagEVdA0URdDWeQ0UWV5O
         tTuZtDNe7o6kK2oey9CaY6C4gY4dzi4ITrHw0CEoWzOjLMUTvUFLXEXMIIqkGS6rZf0h
         4O6ZgBUBx3Wpe8Pe/1td4j2IA+3IWQe+lgP0evOKNNQ1nR9YoctK0TAUHcokMKWxKtXR
         3Hmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ofcb8erxXMbqbw4t8bE3Q5QTMBAUM4Y6QKhiNapXvPE=;
        b=KeLCv6fOlL2NPFpRRJPK1EzwdSNjXBlYLFlWD39saajfwUem43qlJlqhkYNrM90G/i
         bUxIkDCSZKtbwINBw3GnSKaqMeSxPlHf3/O/2bragUY1ArAYcNgItL6VE4N67mhI0ssC
         aOLkQ8BlVCe0o9p7dSQ7BRnAgymONOfPQJHcGsWFPqfF9N8oQaF36Wq0raSbbN/16sXn
         UKdN8Gbel9YD8j9Mw+GP9Rq81eCbYtLlUqNX9iScYvB4UDnZbQtBGxygeo4zkJ4qSETy
         EsaLF2rc+E9V2K0kiQCiPHiECMotYxLAkoKuB0V3wdMpOOvZAIflvcbhrYP0huqdWHpL
         XqLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pa3uvnDJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22si6016139jam.75.2021.05.01.16.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 May 2021 16:21:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pa3uvnDJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcyvj-0003rc-2C
	for alex.bennee@linaro.org; Sat, 01 May 2021 19:21:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lcyvO-0003qz-Mx; Sat, 01 May 2021 19:21:26 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:33723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1lcyvM-0000fL-BT; Sat, 01 May 2021 19:21:25 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 92-20020a9d02e50000b029028fcc3d2c9eso1903214otl.0; 
 Sat, 01 May 2021 16:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ofcb8erxXMbqbw4t8bE3Q5QTMBAUM4Y6QKhiNapXvPE=;
 b=Pa3uvnDJYldfTBZymH0Q5+dMkpQ/sKyw6alFELr31H6gBrir2zATqzbDbXfOtJG4qo
 bmyQ7fV86KTr76Q1xmIEwE5yJdevRPUQQ3raDtH6M1Aa5kjOIb4AL8z3QWeu+ku/0OKn
 Q5uSCqCbBzDF07LQeeiCuPVvCHA+9v3T3gznxpsh7sE+1VXKwyPKcG+OuBWi4NMPPrjU
 jXBdAMGpWowmmXbYIC0JkU1TDmgRn3Ep0Xp3Ejk/mdAxds+4FBjkajvGqsv5n14M5aJb
 06tNmHmwbLEu51xxdwvJlWL/iZMI7G9ZvuQBYyZLKRtZEbUW/Ha40BLt+YuNXoHldJqw
 v47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ofcb8erxXMbqbw4t8bE3Q5QTMBAUM4Y6QKhiNapXvPE=;
 b=crUMyY/LuQsqsoXkVfapOkQ5oHaxUljDJvpRtZFZBmt+IjEHNJNuZO2Y/7PgihX2Yw
 15r0TOj15vYr9unPCjtvr/cIfv3R63rRms/+k8nfOqs8YPA/O1IKhpVqt/4lzWSwCxCa
 h96OMpIXF9HRnElZ867/rApRSdMzF6VpeqwCvn6VyepfYwB0vibYA8Undx6AYf6d6Ys6
 RpV6Wjfp8pWjOCi4Z9ZsoW9RWZ6ev2LW4FdsAwO9UVmaRMG+bC9EhzslUEh7TFcrmgux
 oK8YMY+Z911V7ZG8pOkEpz1TYeG26B2cBbMZKUi2QQlDMMowTOX9xmB80RrcjKf2SsqP
 qB4g==
X-Gm-Message-State: AOAM530zozIffuqScgJ0O4an9cKsZvPoycrNnwU6dFFTzidVY0rsX2mD
 rRqWOuox2F8NRqP44ib2fg9yAdmRf/s=
X-Received: by 2002:a05:6830:1b61:: with SMTP id
 d1mr6501632ote.171.1619911282579; 
 Sat, 01 May 2021 16:21:22 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id d12sm1708276ook.1.2021.05.01.16.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 May 2021 16:21:22 -0700 (PDT)
Subject: Re: [PATCH v3 3/4] hw/arm: sabrelite: Connect the Ethernet PHY at
 address 6
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
 <20210106063504.10841-4-bmeng.cn@gmail.com>
 <20210430144136.GA2880420@roeck-us.net>
 <CAEUhbmUTLecMcr0=vmBeYJZeK6CdZY4SZcYiOu0E9AawY41+Cg@mail.gmail.com>
 <72acebfa-be17-cca5-ce6a-443ef4d23fce@roeck-us.net>
 <6f92b247-cc78-1e26-5809-2ae4809be5c6@amsat.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b94a7a17-75bb-5b8d-adf4-ab2ff33c0553@roeck-us.net>
Date: Sat, 1 May 2021 16:21:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6f92b247-cc78-1e26-5809-2ae4809be5c6@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N1MQxqSU/9ZU

On 5/1/21 2:40 PM, Philippe Mathieu-Daudé wrote:
> On 5/1/21 10:12 PM, Guenter Roeck wrote:
>> On 4/30/21 9:28 PM, Bin Meng wrote:
>>> On Fri, Apr 30, 2021 at 10:41 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On Wed, Jan 06, 2021 at 02:35:03PM +0800, Bin Meng wrote:
>>>>> From: Bin Meng <bin.meng@windriver.com>
>>>>>
>>>>> At present, when booting U-Boot on QEMU sabrelite, we see:
>>>>>
>>>>>   Net:   Board Net Initialization Failed
>>>>>   No ethernet found.
>>>>>
>>>>> U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
>>>>> U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
>>>>> board, the Ethernet PHY is at address 6. Adjust this by updating the
>>>>> "fec-phy-num" property of the fsl_imx6 SoC object.
>>>>>
>>>>> With this change, U-Boot sees the PHY but complains MAC address:
>>>>>
>>>>>   Net:   using phy at 6
>>>>>   FEC [PRIME]
>>>>>   Error: FEC address not set.
>>>>>
>>>>> This is due to U-Boot tries to read the MAC address from the fuse,
>>>>> which QEMU does not have any valid content filled in. However this
>>>>> does not prevent the Ethernet from working in QEMU. We just need to
>>>>> set up the MAC address later in the U-Boot command shell, by:
>>>>>
>>>>>   => setenv ethaddr 00:11:22:33:44:55
>>>>>
>>>>
>>>> With this patch in place, the standard Ethernet interface no longer works when
>>>> booting sabrelite Linux images directly (without u-boot) using the following
>>>> qemu command.
>>>>         qemu-system-arm -M sabrelite -kernel arch/arm/boot/zImage
>>>>         ...
>>>>
>>>> The Ethernet interface still instantiates, but packet transfer to the host
>>>> no longer works. Reverting this patch fixes the problem for me.
>>>>
>>>> Is there a qemu command line parameter that is now necessary to instantiate
>>>> the Ethernet interface when booting Linux ?
>>>
>>> Enabling "guest_errors" shows that Linux kernel fec driver is trying
>>> to read PHY at address 0, which is not what we want.
>>>
>>> [imx.fec.phy]imx_phy_read: Bad phy num 0
>>>
>>> The device tree blob of the sabrelite does not contain a node for the
>>> ethernet phy specifying phy address, so I suspect Linux kernel driver
>>> is using default phy address 0 instead.
>>>
>>> Could you please test on a real hardware to see what happens?
>>>
>>
>> The problem is that qemu returns 0 when the OS tries to read from a
>> non-existing PHY. Linux expects it to return 0xffff, and believes that
>> a PHY is there if 0 is returned.
> 
> Correct.
> 

I'll send a patch. Next question is why the Ethernet interfaces on mcimx6ul-evk
and mcimx7d-sabre don't work. I either get no connectivity at all (similar to
the above) or something like

fec 2188000.ethernet eth1: Unable to connect to phy
ifconfig: SIOCSIFFLAGS: No such device

Any idea ?

Thanks,
Guenter
