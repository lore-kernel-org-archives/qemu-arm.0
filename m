Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1616764ejn;
        Fri, 28 Oct 2022 15:43:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5gr+G55Y7fyt3DtRN+WABlPC3jSZOZYV/dTgB8mFO1PiGEi6Ujl9Fj3US3B2zYFuY8qNKi
X-Received: by 2002:a05:620a:254c:b0:6ca:332c:a9d7 with SMTP id s12-20020a05620a254c00b006ca332ca9d7mr1272024qko.109.1666996999305;
        Fri, 28 Oct 2022 15:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666996999; cv=none;
        d=google.com; s=arc-20160816;
        b=jCp/FrOwng4fd0rgMPRmnfNMtT9hapkxoLNBihgMnzO2hHYYr0EmOCI2puJ/av/hEq
         jmKg9C+wZ0dPC5YU++HHFT+yShhrZFcLHAw9Lf58n/jwnYGUD9XeZs/CKIuM5/rcmgCY
         oUtulBqLR8M5B6OBmIczXaSyuA4dWwu124qyba28lAIxKEoy+5Vxdubh7FKJ1s7NGy+6
         LheIRzI0EGm5vdEMZMR7jT1nWvCODpeorMN1tptuRscXbOlA+41Fcf8pR5jhKMOaICMG
         4G1tZ9GTMooyxJrkV7aInL4Aw4rt1kF7hisvmECB4e6bHoI483Enn6xUKAJBdB0x8rhJ
         c5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mJG2HOMAn9LR3eZyn335ww8Ncjg04oaUSVCh5X8a8M0=;
        b=hSB98S5AnF1kjwMyqS3pUYrai9A6BlNZgHFZInKU7VDBRxNekoudBKvtQ6LUSD47zP
         CK51JRvSlvz1q3MAz/YN9dyKhTJ7sc8qrFweR9vnimZj8SxMdTct51q6R7owoyUyeloi
         qQrU5v8mTLHuxRerCu1Dco/8f6bb02JJXngqNMnBrG/Dyn15dLyYtsVwfuywV/INaH8C
         +mz1KCSKaYnPWR3xVkgzKg51rm9hz9CHsO7io3S3bq8mFeDQmVNh6Pmjs+iC94J+1deB
         jfwLeCNplUE3ugq3c8YNznuM9JkUvcWiGjY8eV8xpRDhnRAbhBtArgfLxDHy/QIGHISh
         Qovg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=biE2vnNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020ac87048000000b0039b3098b32asi4135424qtm.165.2022.10.28.15.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 15:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=biE2vnNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooY3o-0004do-D2; Fri, 28 Oct 2022 18:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooY3m-0004cK-BY
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 18:42:42 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooY3k-0000Bc-JR
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 18:42:42 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bk15so8286894wrb.13
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 15:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mJG2HOMAn9LR3eZyn335ww8Ncjg04oaUSVCh5X8a8M0=;
 b=biE2vnNER7YZd2JVPqQpS/1KJlVVbmJpJD8MK5BacqZI3I64a6adL7ZARr8kMd8Tv7
 2a1Vm4EZOYfdKrTbYDctukLuDdnIaCS0GyCZQaRcMOG6a0LO3vnG5ErctuSEVVWWJcrY
 rFk1HEFcVTL7Iv5NAdumkkAC+TdXj2QQUyVrFJpxhM01YM+fLX5dSXEVtZnwxHu8Qb9d
 G6hmt4bI+wYjoeGNzibe68W99GI+7VKfrQU7JYZLagtvbCIjAKPYFI/dsZPX0UCn1zA/
 j4IOsfXNg6kxHochEsTxSxt0lZLSksaAYVDnTfg/KquT/4/0c7xKp0vJspRP3P509A4v
 vo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mJG2HOMAn9LR3eZyn335ww8Ncjg04oaUSVCh5X8a8M0=;
 b=yPseqP/wluWMk/sxhefTWOJ+SknXPPHuPDE9jieK9Kt+yZfWykNbdTGwRyKNf62Dfv
 uHj/Bj6sFW15D35Nm977QIGJrTSCvNWBScxQJXw9uqUbppK3p4/6lgU32XbSS+/kLkf1
 LjkXBuK5ZcOFBtKj5VKpBRsy83/LbMPV5WXt6xWhxIlSUOoVR9U/+dUh6xmjGp4LB2ME
 8P5tiBtpvRoOQYdD/K00A1w8Ruy9Y86wBcuU2zyOVF3b8gqMaOF1KQxTFM5pW9/LqHT/
 NtIxGu3wzs9dlXLvN7vGztmjN3WVR8dk6atIYO9nTQZ/0mmgZqNVKXsEFd/Cdz0NL60/
 /CtQ==
X-Gm-Message-State: ACrzQf2trVxalbK8WiBln0UfhWZI1OCcGLV1an+crzetfu6dgsB9wf7t
 666Ae3XcTNsMcxyTqyHwdIrI3w==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id
 p7-20020a5d59a7000000b00230365201aamr820808wrr.308.1666996959108; 
 Fri, 28 Oct 2022 15:42:39 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b003cf5ec79bf9sm3010552wmq.40.2022.10.28.15.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 15:42:38 -0700 (PDT)
Message-ID: <202ae9ed-c1d1-ea57-6c50-b9c24f12dd5e@linaro.org>
Date: Sat, 29 Oct 2022 00:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v4 5/7] hw/ppc/e500: Implement pflash handling
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-6-shentey@gmail.com>
 <eea963b8-f6d9-b345-376e-7fd6dad73cd4@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <eea963b8-f6d9-b345-376e-7fd6dad73cd4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: egE25Bmf6lRw

On 28/10/22 17:09, Daniel Henrique Barboza wrote:
> Bernhard,
> 
> The 32 builds aren't fancying this patch. The issue is down there:
> 
> On 10/18/22 18:01, Bernhard Beschow wrote:
>> Allows e500 boards to have their root file system reside on flash using
>> only builtin devices located in the eLBC memory region.
>>
>> Note that the flash memory area is only created when a -pflash 
>> argument is
>> given, and that the size is determined by the given file. The idea is to
>> put users into control.
>>
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   docs/system/ppc/ppce500.rst | 16 ++++++++
>>   hw/ppc/Kconfig              |  1 +
>>   hw/ppc/e500.c               | 79 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 96 insertions(+)

>> @@ -1024,6 +1061,48 @@ void ppce500_init(MachineState *machine)
>>                                   pmc->platform_bus_base,
>>                                   &pms->pbus_dev->mmio);
>> +    dinfo = drive_get(IF_PFLASH, 0, 0);
>> +    if (dinfo) {
>> +        BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
>> +        BlockDriverState *bs = blk_bs(blk);
>> +        uint64_t size = bdrv_getlength(bs);
>> +        uint64_t mmio_size = pms->pbus_dev->mmio.size;
> 
> ^ here. The issue is that on a 32 bit system it is not possible to cast the
> Int128 type to uint64_t:
> 
> FAILED: libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o
> 3746cc -m32 -Ilibqemu-ppc64-softmmu.fa.p -I. -I.. -Itarget/ppc 
> -I../target/ppc -I../dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader 
> -I/usr/include/pixman-1 -I/usr/include/glib-2.0 
> -I/usr/lib/glib-2.0/include -I/usr/include/sysprof-4 
> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g 
> -isystem /builds/danielhb/qemu/linux-headers -isystem linux-headers 
> -iquote . -iquote /builds/danielhb/qemu -iquote 
> /builds/danielhb/qemu/include -iquote /builds/danielhb/qemu/tcg/i386 
> -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE 
> -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes 
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes 
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration 
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k 
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs 
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2 
> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi 
> -fstack-protector-strong -fPIE -isystem../linux-headers 
> -isystemlinux-headers -DNEED_CPU_H 
> '-DCONFIG_TARGET="ppc64-softmmu-config-target.h"' 
> '-DCONFIG_DEVICES="ppc64-softmmu-config-devices.h"' -MD -MQ 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o -MF 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o.d -o 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o -c ../hw/ppc/e500.c
> 3747../hw/ppc/e500.c: In function 'ppce500_init':
> 3748../hw/ppc/e500.c:1069:30: error: incompatible types when 
> initializing type 'uint64_t' {aka 'long long unsigned int'} using type 
> 'Int128'
> 3749 1069 |         uint64_t mmio_size = pms->pbus_dev->mmio.size;
> 3750      |                              ^~~
> 3751[3207/5331] Compiling C object 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_mpc8544_guts.c.o
> 
> 
> What I did to solve the problem is this:
> 
> 
> +         uint64_t mmio_size = int128_get64(pms->pbus_dev->mmio.size); >
> This will get the lower 64 bits and return an uint64_t.
> 
> Note that this function will assert if mmio.size is bigger than 
> UINT64_MAX, but
> since you're doing an error(1) on the "if size > mmio_size" conditional, 
> this
> assert() is not introducing a new side effect. We'll just fail earlier with
> a different error message.

Simply use:

   memory_region_size(pms->pbus_dev->mmio);

