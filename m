Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE50CA100D
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 18:09:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utVRO-00037J-DS; Tue, 02 Sep 2025 14:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utVRM-000351-6I
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 14:09:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utVRK-0005Zc-4R
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 14:09:07 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3cf991e8c82so3074216f8f.3
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 11:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756836544; x=1757441344; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3BqXHVrMYsu40em3jPwo0FH0WNRZiKK6ehvIv2eqeJQ=;
 b=Ox2zy0FmVr0gj7Sq/N1BPyWPUta4UzsRUrG3kfXIwMZve9yOCWjhGmshqF0qUenLlE
 vmidTHmJcPiC8CUJ16oecyN+i7kPFsxxlhJgA1zIgADFUxfvDb3FTxKe7GSBJHHKcMp2
 CjUFBTGKNNDKSZd76h3sgLDUY7Pdit8HlcbjIigSI0InCuXXLAlmblEAFFPvwqVZG2pn
 CTQ5VJojEJhvHbnExxXLqmHnHqJtsSTkcp404Ac7lHJnREUK1tPQoY5wlPYwnwTYB0Wr
 SkNjFgA0c/Has8Kiiw2wl93q2A2613mUYFCMSdNqUatwQllUeHq1hia+br9d6o+0eMLE
 d7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756836544; x=1757441344;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3BqXHVrMYsu40em3jPwo0FH0WNRZiKK6ehvIv2eqeJQ=;
 b=j9TaElw+2TjE84za0sLJv1sdzLHjSm2WdRBmrb0pW669PTSi/EXeE1QfzOLPOrv8EN
 7ZhZb3D9Q23+MqFORxxZRguuxxv2msd9zqbNDhkMeiaUBqgWEmSYqjxrm9fmUVpIpRIn
 UtxOO04A6m9ZXd2AZSYTUUnsvknMjI8v6kfZMPeEDc9MxQG3A7gjxxSviMKxs00p2ati
 H0P8xhha1G43pOOjlZwYrrtj5X/CBRWRPk6zHws8a2ihDM1aL70hKlZJlcrRmu52GLQL
 rgGQIz/jUwO98Qzw6/UWhO6vtJu5OaI0O7lyMvdddXOzkIimnzq0S2tOQ3f91fBr6wgk
 wGOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJMss3Noxu0kYlBz/nFv3d/qRgsFgwgbinkvs40Fxwz9R/GWaBkkxzKsL8VmuTTQWZzI6WZYTZBQ==@nongnu.org
X-Gm-Message-State: AOJu0YyTOZ8pePzfrpEYL2ULZoxDeabX1CJVo9K/PlPLVOvf+6IlC6Q5
 sMJe8nOKtBAQ0XTDMPw/xN2YAMZR1e0iacbNMKiweqFIxccEY5c4iKBKU5W4YX1Rs5c=
X-Gm-Gg: ASbGnctiT3MDnHuD7KzYtmjpXr9nV6vQj/8msr3A2ACsFKI6xilMtmMgD/v5xC1UykM
 dVjViPpWJltcEygXYVgsf8lZENwjJI5C3j1P0FRMoNzX4DFhZg73+Du6jJYQfWeOo18QmVKciMj
 c01YkriEFTpQBf8OPC6jo/mt7/OvZoioulMbLUdIdCA6G4+C59V4yqBmhd1rLpcHon6B0+ewtkB
 vIf9I3gc6VgNcx+DA/dl8X8M7N55xa2kgCpy1j1rvNf5Vrk98TY0MeGszxNkcl01LMftLtQ5QX/
 vnjQcpTrmGPSX7Em0QKpuUkomkoUDZcz8wGyOSCM8I+1Krb21W88sNyHidFq31NbFdoCFCk01iC
 xPkfB0M601O3rMtC5iQfVCBgsO2qPZHolTsPzOYJiWKrpdibeWq9D1Sv3yFv+uC1ve4bqKYrbj1
 RmhI0wEu3R78s=
X-Google-Smtp-Source: AGHT+IES/SlQgOzI3NRsrt1bRYwnDsQi/YFSysS6reUQ1bhtVjaQR3GqAQ1XT9dTTOvacmw0gr80vg==
X-Received: by 2002:a05:6000:26c4:b0:3ca:4e3:6ea6 with SMTP id
 ffacd0b85a97d-3d1dee6d7e9mr10886328f8f.46.1756836543524; 
 Tue, 02 Sep 2025 11:09:03 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d48760d1c9sm13087384f8f.17.2025.09.02.11.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 11:09:03 -0700 (PDT)
Message-ID: <b672f2c8-8298-45ba-8989-fc830914e61b@linaro.org>
Date: Tue, 2 Sep 2025 20:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sd/sdcard: Fix size check for backing block image,
 part II
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?=
 <jlu@pengutronix.de>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>
References: <9f7fc688-7676-49ff-8f86-fac347f70f05@siemens.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9f7fc688-7676-49ff-8f86-fac347f70f05@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Jan,

On 2/9/25 19:47, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> There was another mistake in the size check which 8c81d38ea5ae now
> revealed: alignment rules depend on the size of the image. Up to and
> include 2GB, the power-of-2 rule applies. For larger images, multiples
> of 512 sectors must be used. Fix the check accordingly.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> 
> Not fully tested yet, but as staging is broken right now, I wanted to
> provide this already for early feedback.
> 
>   hw/sd/sd.c | 48 ++++++++++++++++++++++++++++++------------------
>   1 file changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 2d34781fe4..0f33784bd0 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2759,6 +2759,26 @@ static void sd_instance_finalize(Object *obj)
>       timer_free(sd->ocr_power_timer);
>   }
>   
> +static void blk_size_error(int64_t blk_size, int64_t blk_size_aligned,
> +                           const char *rule, Error **errp)
> +{
> +    char *blk_size_str;
> +
> +    blk_size_str = size_to_str(blk_size);
> +    error_setg(errp, "Invalid SD card size: %s", blk_size_str);
> +    g_free(blk_size_str);
> +
> +    blk_size_str = size_to_str(blk_size_aligned);
> +    error_append_hint(errp,
> +                      "SD card size has to be %s, e.g. %s.\n"
> +                      "You can resize disk images with"
> +                      " 'qemu-img resize <imagefile> <new-size>'\n"
> +                      "(note that this will lose data if you make the"
> +                      " image smaller than it currently is).\n",
> +                      rule, blk_size_str);
> +    g_free(blk_size_str);
> +}
> +
>   static void sd_realize(DeviceState *dev, Error **errp)
>   {
>       SDState *sd = SDMMC_COMMON(dev);
> @@ -2782,24 +2802,16 @@ static void sd_realize(DeviceState *dev, Error **errp)
>           }
>   
>           blk_size = blk_getlength(sd->blk) - sd->boot_part_size * 2;
> -        if (blk_size > 0 && !is_power_of_2(blk_size)) {
> -            int64_t blk_size_aligned = pow2ceil(blk_size);
> -            char *blk_size_str;
> -
> -            blk_size_str = size_to_str(blk_size);
> -            error_setg(errp, "Invalid SD card size: %s", blk_size_str);
> -            g_free(blk_size_str);
> -
> -            blk_size_str = size_to_str(blk_size_aligned);
> -            error_append_hint(errp,
> -                              "SD card size has to be a power of 2, e.g. %s.\n"
> -                              "You can resize disk images with"
> -                              " 'qemu-img resize <imagefile> <new-size>'\n"
> -                              "(note that this will lose data if you make the"
> -                              " image smaller than it currently is).\n",
> -                              blk_size_str);

First, no rush, your previous patch didn't make it to master
(CI failing) ;)

Again, this painful restriction is due to CVE-2020-13253. Per
merge commit 3a9163af4e3:

     Fix CVE-2020-13253

     By using invalidated address, guest can do out-of-bounds accesses.
     These patches fix the issue by only allowing SD card image sizes
     power of 2, and not switching to SEND_DATA state when the address
     is invalid (out of range).

     This issue was found using QEMU fuzzing mode (using
     --enable-fuzzing, see docs/devel/fuzzing.txt) and reported by
     Alexander Bulekov.

     Reproducer:
       https://bugs.launchpad.net/qemu/+bug/1880822/comments/1


Reproducer being:

---
#!/bin/sh

cat << EOF > inp
outl 0xcf8 0x80001810
outl 0xcfc 0xe1068000
outl 0xcf8 0x80001814
outl 0xcf8 0x80001804
outw 0xcfc 0x7
outl 0xcf8 0x8000fa20
write 0xe106802c 0x1 0x6d
write 0xe106800f 0x1 0xf7
write 0xe106800a 0x6 0x9b4b9b5a9b69
write 0xe1068028 0x3 0x6d6d6d
write 0xe106800f 0x1 0x02
write 0xe1068005 0xb 0x055cfbffffff000000ff03
write 0xe106800c 0x1d 
0x050bc6c6c6c6c6c6c6c6762e4c5e0bc603040000000000e10200110000
write 0xe1068003 0xd 0x2b6de02c3a6de02c496de02c58
EOF

../bin/qemu-system-x86_64 -qtest stdio -enable-kvm -monitor none \
      -serial none -M pc-q35-5.0 -device sdhci-pci,sd-spec-version=3 \
      -device sd-card,drive=mydrive -nographic \
      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive < inp
---

I guess remembering we fixed this one then another path was fuzzed,
so we audited and realized restricting to ^2 was the safest option.

I'm not against unrestricting the model, but I don't want we raise new
CVEs. Users adapted truncating their images to pow2 and accepted the
downside.

I'll run some tests, but it might take some time.

Thanks for working on this fix so quickly,

Phil.

> -            g_free(blk_size_str);
> -
> +        if (blk_size > 0 && blk_size <= SDSC_MAX_CAPACITY &&
> +            !is_power_of_2(blk_size)) {
> +            blk_size_error(blk_size, pow2ceil(blk_size), "a power of 2", errp);
> +            return;
> +        } else if (blk_size > SDSC_MAX_CAPACITY &&
> +            blk_size % (1 << HWBLOCK_SHIFT) != 0) {
> +            int64_t blk_size_aligned =
> +                ((blk_size >> HWBLOCK_SHIFT) + 1) << HWBLOCK_SHIFT;
> +            blk_size_error(blk_size, blk_size_aligned, "multiples of 512",
> +                           errp);
>               return;
>           }
>   

