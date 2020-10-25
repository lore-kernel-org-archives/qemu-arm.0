Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2041617lfa;
        Sun, 25 Oct 2020 05:12:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0ngg6DbnM0ojv7AhSNjgEmr0Md8/WMxFTxOTIHdFPOoOZKOTK2inim2C2oqcG9B0AQBtT
X-Received: by 2002:a05:620a:2107:: with SMTP id l7mr12184933qkl.249.1603627930283;
        Sun, 25 Oct 2020 05:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603627930; cv=none;
        d=google.com; s=arc-20160816;
        b=CIJRhI/JShnilQ/1iPNvfDgAaHB7SNmx4Wv24gXRNiDXk109Cx63xg9UVLx2YZoVfW
         A1LyazPQzbI+TVzGy53iJXmhXpGWagKD5c6v4cBiqIujH4mL74UkkJ3VZfEB86DFjIyT
         gBGAyftjKD5vNwRvJ57lV2ec5PMi0fmZoJACYHe+CLW3+Dykb9/HShba92mMFCcMDX7M
         ffxH4DFzeOmhJj0P8m+i9X/CveAaT9c7d/BAA3zQf81mi+GwHFci1uV8QqYIV6JeJBPj
         p9b/mcZ1G1ThHiHpF7VNCykiBWkqDQDiZwKRTQ7L3/kEoYbd5hFdhGYIco9GFnE64JFO
         y67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=8HeZ9OLUzJALMf3SRUnPIM3RgxdtwqEFyk8bGSySriM=;
        b=LFMZkgcl0/aayGEGWRX+Bou1OtKayARDtYrpeymr9Sgv+5+/fSsg3eN+59xRIt6rJ/
         6EgnSTiPBGsGukAkogRHp2f4JAEKu9jCveoKeUDEj3vlVdCbKjVP2q8faZZ0i7/+/75y
         irzUH8Ljrmi3onp+XnCsSzxkt9cBRLZM1vrjWCorDoblPaCL0OA11LUCYjxidOCdf4p9
         VmQC6KQi4Np0t+sporTugrioiDoM50dXshupIcHsHrFOoPpQXxlSdSQpjaHPns9c5z17
         kibj7buKW+2Vzb67BvGhgx1tgsEZJzS7vEPDvsMzQfWUtO7tOKH9EnIZiU3bOVQyel/8
         QRrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bsgUJt9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24si4077235qka.362.2020.10.25.05.12.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Oct 2020 05:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bsgUJt9h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kWesb-00033R-Nk
	for alex.bennee@linaro.org; Sun, 25 Oct 2020 08:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWesT-00033F-Df; Sun, 25 Oct 2020 08:12:01 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWesR-0004cZ-Np; Sun, 25 Oct 2020 08:12:01 -0400
Received: by mail-wr1-x443.google.com with SMTP id h5so9364596wrv.7;
 Sun, 25 Oct 2020 05:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8HeZ9OLUzJALMf3SRUnPIM3RgxdtwqEFyk8bGSySriM=;
 b=bsgUJt9hr/9KEfUTqjNYVod3kTFDDrhYAxBoC2Sfgh/5tpxrpChWuWDKr+9w7TLK9B
 2C9SsuvJKo1WWTQ3O64Avb3Wgj4qxnLRPslut3R/h4os4k9urH+PulREN7UTUKs5VOAa
 xf784K5nRip9pioHC+4JX4+4u+iXXVDs3OblO1qaJRiWk+zNIfX3MYJ2nk5AjmuCGxcP
 dTdjH1AZcEBiw1joFGCNNojnVBSRRXmWUOhNDCMrzLw3CyCLcJ6Va1A2vhaQmpnW5AKk
 XHy2iAEu57wr7pRcEmrkAagvC+kiOnNJuaEN83znBAfSfI8aLYDtPIAH8cuHGfuieONK
 2pxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8HeZ9OLUzJALMf3SRUnPIM3RgxdtwqEFyk8bGSySriM=;
 b=kXr0PRR/+N91syKbmTqPyTQoswwvDaZFPZElQECqsBTchtbkAQUgY9JsAdvzv60C8W
 JXOlS87/Ig2mMpeS63Vd9OKWxh4AzWdWeOQ6xZzX8BUCyXU9p9hJh+R9Fvf41SEP0x5E
 +0jC5TAbB1fEFeB/W4yjdAyhQmDSAgqXxdgPThIQx+ti/W/QGUtrUw/O/TccSO/YQOE2
 JEE/3j9p5tm998Z7djBK7yv1g1pgi5kkbDDDenfpW8kRh+f/6XmtKl3gm0byJnRkdfCE
 43ql1lNKM4PdogJ2becgVbKJx2v7W7sSN4SGQnGy+SglyGI7GQnlxg9/PDjfDf4z2JG0
 7SmQ==
X-Gm-Message-State: AOAM531sDuDwVX1GDVQczv09s3mNmUBovkQOgZ+77U/6rAkjdXaTY8uw
 Zkyv8J9xRmBlLtcK51FpY6xXM3XTUNg=
X-Received: by 2002:adf:f103:: with SMTP id r3mr13494344wro.153.1603627917479; 
 Sun, 25 Oct 2020 05:11:57 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id b5sm16505796wrs.97.2020.10.25.05.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Oct 2020 05:11:56 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: expand Orange Pi PC SD images for
 NetBSD, Armbian above nearest power of two
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>
References: <20201024215200.494209-1-nieklinnenbank@gmail.com>
 <fd949ad0-f7fd-561e-33d8-57133a9afd31@amsat.org>
Message-ID: <3bb92403-f955-d887-a301-1ff38259b49f@amsat.org>
Date: Sun, 25 Oct 2020 13:11:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <fd949ad0-f7fd-561e-33d8-57133a9afd31@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lngN8AE66m/Q

On 10/25/20 2:31 AM, Philippe Mathieu-Daudé wrote:
> Hi Niek,
> 
> On 10/24/20 11:52 PM, Niek Linnenbank wrote:
>> The acceptance tests for the Orange Pi PC need to expand the SD card 
>> images
>> to a size which is a power of two. As Qemu uses the size of the SD 
>> image file
>> as well for the size of the emulated SD card, this can sometimes give 
>> problems
>> for guests that assume a certain minimum size of the SD card.
>>
>> This commit resolves the following acceptance test error for the 
>> NetBSD 9.0 test
>> of the Orange Pi PC by increasing the size of the expanded SD card 
>> image to two times
>> the nearest power of two:
>>
>>     (5/5) 
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9: 
>> |console: U-Boot SPL 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000)
>>    console: DRAM: 1024 MiB
>>    console: Failed to set core voltage! Can't set CPU frequency
>>    /console: Trying to boot from MMC1
>>    console: U-Boot 2020.01+dfsg-1 (Jan 08 2020 - 08:19:44 +0000) 
>> Allwinner Technology
>>    ...
>>    console: Starting kernel ...
>>    console: [   1.0000000] NetBSD/evbarm (fdt) booting ...
>>    ...
>>    console: [   1.3300167] sdmmc0: SD card status: 4-bit, C0
>>    console: [   1.3300167] ld0 at sdmmc0: 
>> <0xaa:0x5859:QEMU!:0x01:0xdeadbeef:0x062>
> 
> The test has this comment:
> 
>     # This test download a 304MB compressed image and expand it to 2GB
> 
> Once uncompressed the image is ~1.2GB before rounding to 2GB.
> 
>>    console: [   1.3430678] ld0: 1024 MB, 1040 cyl, 32 head, 63 sec, 
>> 512 bytes/sect x 2097152 sectors
> 
> Why the card appears as 1GB??     ^^^^^^^
> 
> Can you try reverting commit 6d2d4069c47?
> ("sd: Correct the maximum size of a Standard Capacity SD Memory Card")

Now I remember, I hit the similar problem 2 years ago :S

See the description of the C_SIZE field in CSD register:

   "To indicate 2 GByte card, BLOCK_LEN shall be 1024 bytes."

This model uses a fixed BLOCK_LEN = 512 bytes.

> 
>>    console: [   1.4102580] ld0: 4-bit width, High-Speed/SDR25, 50.000 MHz
>>    console: [   2.0674392] WARNING: 4 errors while detecting hardware; 
>> check system log.
>>    console: [   2.0674392] boot device: ld0
>>    console: [   2.0775401] root on ld0a dumps on ld0b
>>    console: [   2.0977679] vfs_mountroot: can't open root device
>>    console: [   2.0977679] cannot mount root, error = 6
>>    INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: 
>> Timeout reached.
>>
>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> Based-on: ("[RFC PATCH 0/4] tests/acceptance: Test U-Boot/Linux from 
>> Armbian 20.08 on Orange Pi PC")
>> ---
>>   tests/acceptance/boot_linux_console.py | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
