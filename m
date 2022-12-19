Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3270774ejb;
        Sun, 18 Dec 2022 23:12:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5h459Mh68Mvc3Hb+woQdErVhqSquYI/D56Kmx6L8G0C2ushtBsxM1aDzBn59xIRGG3lYl+
X-Received: by 2002:a05:622a:a14:b0:3a6:8b16:1c5a with SMTP id bv20-20020a05622a0a1400b003a68b161c5amr64385170qtb.9.1671433924388;
        Sun, 18 Dec 2022 23:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671433924; cv=none;
        d=google.com; s=arc-20160816;
        b=uKkby+BICSt628Bfrd+nWAggGwNnq14qiqOi186K5LRfsaNIsz0MMJUcOqrY/SnhH/
         JEyBfYcx+mG2JVaZtqbvL37gEt2wGmWMWw7as+Jzi4ACTf7r6xnqTHOLXcy+yhXCRiIV
         xX+Uz1yh5WA2S9y3aE8vVEtLcdeOx7ZJiseJYrdnWSuOhRImK8+gPMEM1iwjcQm/6dgD
         ci11ij9ZQ6USlLu+cDrjmj9c07+tggDQlfqfF3mjhUfSMsEGAvARhu1H/UOg+1gEEh3f
         70N6T3HaLvtxPMzPiO3CcGR5Pwdq/cC/p/N2/OEGmmUILS/7rtoW0YWKxfkyfcn9uspR
         ASpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=H5I31qkZ7p1489OZgspN+JeWeaY8KJiMv52GUO7JOAg=;
        b=rPVekQXukBA5V/49Afzx7Px4c9JCg5l8Fp8ANgCK6BE7SyTnNjBN2JCJcZEAwem41F
         AbR/++lTsurD9C/nKH25bP0hTXsyPTu0eEcXj7TncGiTv08Cm2M2zJlYp/8sSvyqkjz+
         kJeYChzeftkVnZSnn29aFcc7xIb4Xh9NTtfBKlycVObMobZtGZAOhBY3whccLGVQjw+b
         yA8s8uoLGooRkcqc8koXPeS+VUSg70Znv8VEUqEjKyVAroTPXEsh/tp80hFLDEm/iFmH
         bGE6vI5KGnTAb8wshcHAnMh3r5FaHgxVfK25Jma7bwd+o4oF0MMgM08iIp/OG6O9q3KB
         oPFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea62ilnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bx9-20020a05622a090900b003a526ac912csi3929367qtb.294.2022.12.18.23.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 23:12:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ea62ilnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7AJJ-000382-En; Mon, 19 Dec 2022 02:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7AJH-00037h-Qe
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 02:11:39 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7AJF-0000Uo-NL
 for qemu-arm@nongnu.org; Mon, 19 Dec 2022 02:11:39 -0500
Received: by mail-wr1-x435.google.com with SMTP id a17so6506734wrt.11
 for <qemu-arm@nongnu.org>; Sun, 18 Dec 2022 23:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H5I31qkZ7p1489OZgspN+JeWeaY8KJiMv52GUO7JOAg=;
 b=Ea62ilntYbyzrjakcr+sK14GeEG/RTqCWydosGTv1BE4dMM8Db63NgkAGxH0EdZz0j
 9HYMSqYc+jdPyJy/R+p/L7qCD+6FG9t9Hd6LSPE5SFdd7xJziyzwaBz8Ik2tfKVuMkr3
 +pY195bbgp6xiKCIjWBhGszu5j1Q/4U5YvP9wQkFRNAENbJ6W5vOnjDakd7i7QARXwXl
 x23Op33PUm9nhPGtH5yCcgMZj/aH24dkaSnS7XgfKRmgIJCAoCBpEKqEnpyzDdPpunhz
 GXVTc3gPat7WbHbPBjoJZmAEZDRfPbl7tp5P8qKhkPCBTU2vARkK3H8icxkCyB+YKtR3
 pJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5I31qkZ7p1489OZgspN+JeWeaY8KJiMv52GUO7JOAg=;
 b=TDUR8mZZszz5zZ5oOI4CovTH8QB9tVgspPPTwEk+yAmVY8hT+2WbY/KX6pI1i0SJF2
 LK2M1RoQreyKwSEbjJbLU584qdaVS9kKOs/rWRXetJfapnwjLao3wBx01ipt1Dt1uqWN
 5IzPvKbTYA37/JaeSDyilJ6HqHvkvKBAa7shQWJkwX0Sp4MJ/Kd+Ab3b2GaDbKb4OgGP
 eTg70D37MJ9bldd4ynmdxKvtWIwKfxdowh04thiLk7tzOERIC0YjdVTFoCBUCdZIXZOL
 kc4Nk2IiHickzZJv+7VhejB36BZXFad29AEyANrSdR7xyIb84FQMvwJYBAjeA41mhrbC
 GRsw==
X-Gm-Message-State: ANoB5pn2hPFNjXwIf3hDvHjkyhbac45No21ljucwog/oYWgn58OBlbZ5
 FATWMFJnTArDDRo+mlm7yT1cHg==
X-Received: by 2002:adf:f4cc:0:b0:242:7214:55e4 with SMTP id
 h12-20020adff4cc000000b00242721455e4mr25473275wrp.46.1671433895621; 
 Sun, 18 Dec 2022 23:11:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d59c5000000b00241fea203b6sm9061008wry.87.2022.12.18.23.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 23:11:35 -0800 (PST)
Message-ID: <11d8c4e0-c516-ed28-2df3-d613111ad53c@linaro.org>
Date: Mon, 19 Dec 2022 08:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 0/7] Enable Cubieboard A10 boot SPL from SD card
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <e05afcc8-8d86-b942-6702-8ba4887c44db@linaro.org>
 <CABtshVRUevNjOucUwtKW-sccUAADRe-9JBbYHd8UMGf0YPJXSw@mail.gmail.com>
 <CABtshVSY+UxMEfh_=NCw9ws0VrEnjkgzoMspg4wfG9Jr_ZZc=w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABtshVSY+UxMEfh_=NCw9ws0VrEnjkgzoMspg4wfG9Jr_ZZc=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: K0WGC0O87Q53

On 18/12/22 23:57, Strahinja Jankovic wrote:
> Hi,
> 
> I just looked around a bit more. Would OpenWrt image be acceptable?

Sure.

> It looks like there are releases for cubieboard that are kept for a
> longer time, and I just checked that they work properly, so I could
> add them to the acceptance test.
> 
> Best regards,
> Strahinja
> 
> On Sun, Dec 18, 2022 at 11:34 PM Strahinja Jankovic
> <strahinjapjankovic@gmail.com> wrote:
>>
>> Hi,
>>
>>
>> On Sun, Dec 18, 2022 at 11:17 PM Philippe Mathieu-Daudé
>> <philmd@linaro.org> wrote:
>>>
>>> On 18/12/22 22:19, Strahinja Jankovic wrote:
>>>> This patch series adds missing Allwinner A10 modules needed for
>>>> successful SPL boot:
>>>> - Clock controller module
>>>> - DRAM controller
>>>> - I2C0 controller (added also for Allwinner H3 since it is the same)
>>>> - AXP-209 connected to I2C0 bus
>>>>
>>>> It also updates Allwinner A10 emulation so SPL is copied from attached
>>>> SD card if `-kernel` parameter is not passed when starting QEMU
>>>> (approach adapted from Allwinner H3 implementation).
>>>>
>>>> Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
>>>> Yocto image built for Cubieboard.
>>>> Example usage for Armbian image:
>>>> qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img
>>>
>>> As a follow-up, could you add a test similar to
>>> test_arm_orangepi_bionic_20_08() in tests/avocado/boot_linux_console.py?
>>>
>>> This test could be refactored as do_test_arm_allwinner_armbian(), called
>>> for orangepi and cubieboard with the corresponding url / hash.
>>
>> I was planning to do it (I already have a patch for cubieboard), but
>> there is a problem with finding a stable-enough image for cubieboard
>> for automated testing.
>> Unfortunately, Cubieboard does not have supported Armbian images as
>> OrangePi-PC has (it only has weekly builds).

Developers shouldn't worry about that but focus on the testing. The
QEMU project doesn't have dedicated sysadmin / storage, but if it had
it should be their problem, not yours. Meanwhile such a test is still
useful. Artifacts come with their hash, so can be uploaded elsewhere
later.

>> From the images that can
>> be found on archive.armbian.com, there is only one bionic image
>> (21.02) and it won't boot because it hangs due to the musb issue (I
>> tried both with my patches and without, by extracting
>> kernel/dtb/initrd).

Similar approach:
https://lore.kernel.org/qemu-devel/20201018205551.1537927-4-f4bug@amsat.org/

>> Other images are focal, but for some reason, in
>> those images it is impossible to interrupt U-Boot (tested with 21.08),
>> so I could not append to bootcmd to make boot process more verbose and
>> easier to monitor for automated testing.
>>
>> That is why, for now, I would suggest not updating the SPL/SD boot
>> test for Cubieboard.

Niek can tell how many times his tests catched regressions for his
OrangePi machine; I remember at least 3 occasions :)

Regards,

Phil.
