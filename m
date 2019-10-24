Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2374483wrq;
        Thu, 24 Oct 2019 06:47:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkEf1/KwY6WXCiSrGOpRNW6MUjZOnuZXRtxjGc/z7ECQ5iWD953X1wSDvqkanDlKN9lBfu
X-Received: by 2002:aed:22c1:: with SMTP id q1mr1695484qtc.337.1571924850031;
        Thu, 24 Oct 2019 06:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571924850; cv=none;
        d=google.com; s=arc-20160816;
        b=G2O7YzKwhH8n7K4S6nnQRIj2NfM41Cj7MT4AyRfygWGVvN0s13W/FvT3KmLljsU6Ei
         gemyi/WLI9S0Kbt1GtRiZcvd+xqqbXrSJGB6sR+xiAxf2Q/v9Xj+tu81BVnukoW0IEA9
         A3ogb2MkDL6nlMvJeWXWCURxozeYt/K2fHffltlVDtLWA3QU88ZUuUZGE1grqDAjpSb2
         wmJPShOFch6iwOOGy3sEXpYAz69SYkHYFy46w5IUr33kZmgDWOZpp1qaDpY9iYxdsq/1
         fpew/rbEV5kAzilDKkSFRWrFGleYC5q8EeV/xKxZyzXXaayvKBws1v92psA8c/E+dDjK
         P5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=e0UbnJ+yzB1G3ORMCib7xkuHeRJ1ILE6xP/Kp8yAg0c=;
        b=L++w0eWGE541YVU/NrWUrc98g/FIZ/eAhc9Jc4Hm9+OGpDiwd+MiJhKZEHHYGy4bNZ
         yf30YZ349QjU0r0fKzBmvw5s10yhkcrqAuRdwBxVTO0ei/ZsSkhy8qSR8tSsHOTGxpxG
         HrL8hrgOn6raV4hx2raHhtkgIGo0ufOm0y7ZH/pAC7+CkgWpm3zLZlJ0eMh0MroBUhir
         5aK9cnmC2LPvoKejbeixhLz7jyiebB33jysrBKFVuZ9eX+0uEPuEji5WxMD0UnUI9h6K
         9HSPaaNuCSL9SZfH/MvdhxG4QN3uIP8ZkURhPSjTDDFm9WZ9eBWU7iy2PHqpN6edWtjg
         PLpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dudvNZjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 55si17155319qts.279.2019.10.24.06.47.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 06:47:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dudvNZjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNdSa-0008Bf-JP
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 09:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iNdIe-00080P-8U
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 09:37:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iNdIb-0004ND-MY
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 09:37:11 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39107)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iNdIb-0004Md-Dk; Thu, 24 Oct 2019 09:37:09 -0400
Received: by mail-wr1-x442.google.com with SMTP id a11so10043063wra.6;
 Thu, 24 Oct 2019 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e0UbnJ+yzB1G3ORMCib7xkuHeRJ1ILE6xP/Kp8yAg0c=;
 b=dudvNZjP6toM3VR0VGvj7/ZLBmQ/eHnnfy8Q3lLo623rT+cW5EI2TW5VJc01nAKLoa
 SqK6JAxxrt/xKhn2MnH5kkZdfCLntllzC8zyqmYvgGkXMV6axg7N8cof+3XQ7p/q3j/K
 bQWOCqtqpYJBC32fvWmZfun6DlPo2c3jlmqAWNPT7Ys2aiZO9oCvBfDL7VslSC3gv7jz
 maTzs6MGLUUBYNy6rkO6z4cUhuEzlMaA962F8bqc8wReW01VqQmmDrRvndLN6OtUIUuf
 qDbOT6fZ6bK7DELkWK4a196QxXzXc0/bROBUhQfcAiJ6TOqS9/HI8CPmUGEjdoeXNy+B
 Bbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e0UbnJ+yzB1G3ORMCib7xkuHeRJ1ILE6xP/Kp8yAg0c=;
 b=PxO/CqUSsSHmnQP0TvcYh5jk2ysPJ3sEkFGcy4kc5lwJDYeulCm9OfwDDi8qbR6VEi
 gV4j7+37ntbhbKEsfDgyI1T+Lv92HTUuJ8u9FADdgUg4K2lqEbDLQ8asKsWmAELHF5f0
 kr3EFH9Ai2tI9FCori18ogmKDkcI5QBIKtCJ6CBy65h74Ygd40H5JZqwMLyOmEYfcbhA
 4CvmCwcwpwSwuJZlkdANjLchMNLypnfimwAxFK/5VTcXHvZ3Tro4KzLz+G5vhYzUcUN8
 leZsiO7vwgqdXasw1LQKucaGWDXkz+cI+MDda0CszffSv3i/J2wtmQ/uUFbV83EUVApi
 v8Nw==
X-Gm-Message-State: APjAAAWu4KbLr1qoHyo+ZyxPd5RM9fHkvaY09cdh53xh1v5EV5LWPrbA
 1+jHbukAnCJQ6sEPTlvlnfc=
X-Received: by 2002:a5d:6585:: with SMTP id q5mr4252448wru.74.1571924227985;
 Thu, 24 Oct 2019 06:37:07 -0700 (PDT)
Received: from [192.168.1.115] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id s26sm2687945wmh.23.2019.10.24.06.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 06:37:07 -0700 (PDT)
Subject: Re: [PATCH v3 11/16] hw/arm/raspi: Use -smp cores=<N> option to
 restrict enabled cores
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
 <20191019234715.25750-12-f4bug@amsat.org>
 <CAFEAcA_w1zW4ewY-ts=yJbKFNRVhOjXuAtj9_0rt4EvD3qkm3Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cc387b5c-e7a9-9340-2cc7-130f36eb6773@amsat.org>
Date: Thu, 24 Oct 2019 15:37:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_w1zW4ewY-ts=yJbKFNRVhOjXuAtj9_0rt4EvD3qkm3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Rob Herring <robh@kernel.org>, Matthias Brugger <mbrugger@suse.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F06mtX2w1A4l

On 10/24/19 3:23 PM, Peter Maydell wrote:
> On Sun, 20 Oct 2019 at 00:47, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> The abstract TYPE_BCM283X device provides a 'enabled-cpus' property
>> to restrict the number of cores powered on reset. This because on
>> real hardware the GPU is responsible of starting the cores and keep
>> them spinning until the Linux kernel is ready to use them.
>> When using the -kernel paramenter, QEMU does this by installing the
>> 'raspi_smpboot' code when arm_boot_info::write_board_setup() is
>> called. This is a special feature to help the Linux kernel, and can
>> only be used with a Linux kernel.
>>
>> Even if loaded with the -kernel option, U-boot is not Linux, thus
>> is not recognized as it and the raspi_smpboot code is not installed.
>>
>> Upon introduction of this machine in commit 1df7d1f9303, the -smp <N>
>> option allowd to limit the number of cores powered on reset.
>> Unfortunately later commit 72649619341 added a check which made this
>> feature unusable:
>>
>>    $ qemu-system-aarch64 -M raspi3 -smp 1
>>    qemu-system-aarch64: Invalid SMP CPUs 1. The min CPUs supported by machine 'raspi3' is 4
>>
>> Fortunately, the -smp option allow various kind of CPU topology:
>>
>>    -smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]
>>             set the number of CPUs to 'n' [default=1]
>>             maxcpus= maximum number of total cpus, including
>>             offline CPUs for hotplug, etc
>>             cores= number of CPU cores on one socket (for PC, it's on one die)
>>             threads= number of threads on one CPU core
>>             dies= number of CPU dies on one socket (for PC only)
>>             sockets= number of discrete sockets in the system
>>
>> Let's use the 'cores' argument to specify the number of cores powered
>> at reset to restore this feature, and allow to boot U-boot.
> 
>  From the help message quoted, 'cores' is about NUMA topology,
> it's nothing to do with "how many cores do we have powerd on
> on reset". We should definitely not be borrowing it for
> an unrelated purpose.

Yes, I was not sure. Is -smp only about NUMA topology?

Should I try adding another argument, such 'online_cpus_mask'?

>> We can now run U-boot using:
>>
>>    $ qemu-system-aarch64 -M raspi3 -smp 4,cores=1 ...
> 
> Either:
>   (a) we need to support "act like the firmware/GPU" for
> booting guest binaries on this board, in the same way that our PSCI
> support is effectively emulating firmware-level facilities
>   (b) the u-boot binary should be provided to QEMU in the
> right image format to use the kernel boot ABI

Well, u-boot is in the same format than the /boot/bootcode.bin 
closed-source firmware provided by the Raspberry Pi foundation. This is 
the format the GPU firmware understand when loading it on the 1st ARM core.

I'll see what I can do (ab)using the -bios parameter.

>   (c) u-boot could be wrapped in a small guest binary that
> deals with handling all the secondary cores
> 
> I'm not really a huge fan of (a) because we already have a
> huge pile of random weird ways of loading guest images
> that are undocumented, behave differently from board to
> board or architecture to architecture, etc. I'm not too
> keen on making that swamp worse, even though there's an
> argument that the right UI for a raspi board model is to
> provide the same "load an ELF file" handling that the real
> hardware does for ELF files via the GPU/firmware combo.

This patch doesn't modify hw/arm/boot.c and reuse -smp features,
it didn't seemed too invasive. Anyway I'll look for another path.

Thanks,

Phil.
