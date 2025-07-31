Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66DDC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:24:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhakz-0000qY-US; Thu, 31 Jul 2025 17:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhaOb-0006X4-Mc
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:01:04 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uhaOZ-0003KB-IN
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:01:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so542846f8f.1
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753995657; x=1754600457; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Elw6f2Pih8wG1itR7wzgCuRHIQIDWp6WI/9tUgfxafo=;
 b=hcyNqiVjUA2eNdJsn4cqlDIVEYnno7dngNhWgb+P23TiSuK4/pMdRN4GlBkLvAN21k
 qnGaGcBrC9bvGHDu6gi/E6KkHrkEN9BWKgVdLS9t4ps5jCl9Og65yTnPZTOls4ULwdSo
 /ohls1kSWhSDP6YndCg1wHOkcFE9uRFUAAtpwBUai4BeO1fa2w1A0d772l0AzMnsx9sf
 0xFMzfAfxRWvLkT/n21d6kzrRARtKHOs8Vr/tP4PfHpKxEhRNXQFUtNTfUQA4K6DzXUc
 vqjkGy11s9AIewn6+2vaHwzP1PDvGKVkEjPtjOSp3lQLI+ClQxmZyuADKHgAjqMO6FCS
 ia5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753995657; x=1754600457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Elw6f2Pih8wG1itR7wzgCuRHIQIDWp6WI/9tUgfxafo=;
 b=KOR3X4IMGktpDTjnxLkMAkmbVQ/1ByN9Oq5sfecuchUbZUTSIcEFMZc6566e7Z5heh
 7nYTVB6P1RYoJU7xo2AMRbLC2uSP/kx3tvtTWcRUrc1ADjBH/wWswYhxfFUS2Xjf0bDi
 EK5MLk+MyLV3i/KntUl67I0CapE0SFcblvj3Z6sldSgGkHGm9t9jxIrJXFyP7RIs+6e1
 FGNvbyEe35PTCOxgeWtbictUGgbvU14PVZ4BbpLB4tpVQfq3uAq0Gyo7/5QyB2iCEDKq
 SsDTcwR8nfGWbIV06L2jNbaYJ2LmNOoGWX7M/TnoT+acwIrs30LduniTvdTRNbxQCeVY
 fYng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDRM7nimAD6bTyiK3Sm1ysP3chLKmJcqbeOu3HlIVmafxrwtjsr1/Twced/Y20JIMh73e4X+mv9g==@nongnu.org
X-Gm-Message-State: AOJu0Yx1+7k5fpT037/CeFyuJWAnnRO6nDvEGvWe/1zsBkAnCUIo6nZg
 2f2M24E2j0QfiQADwcSZCyL6g0BckPxmIVus7Ui6c8VoSTmBm3v1AHEy6FT2ipxHZ1Y=
X-Gm-Gg: ASbGnctqVcTvODQthjh8yagydH/u+zVJjHz+zER+lJkUze36v7wGTgrfQ/tZOCR9aK1
 ERD5Zw41JKFDWg+++9l+FrxCuNTkT94m18/vr8Bc5aR2WPzUdJe/kJzWDXiNdHmA7aeZiH6EkC2
 E4qrI5cRUILmBFPgTeJJVydt1y0nj98UFRWgLEqgfsoehI4z6NdMr0xKdq4GR7Dtb0wsD15Jmdh
 jKvXv321yx0N54rMUNq4GEdVYTwAhFekQN3WMoFWk4Uy4W6V4OIZoTRxlsYV650qJ2XYPYaWjzW
 fYC0cFxg30iQck8WDz+INn3bTgwWgiZAhq1osnCd6dhrSXEauyaZrZPt6ubSjI32AxVkERcN5jO
 D1dXp3PXdZfp+CbX/zcEgeqhEUAt8XaX3ylrpzOBHcxfd0FqtgHogujszqNHFzrELEQ==
X-Google-Smtp-Source: AGHT+IFW7Dsjkc3NWl92s114T1vbM6T6oQdmlUkHKmWpkQ3Vnfdd/IYjjOKfgCn2wB3XwvYCJbBeiQ==
X-Received: by 2002:a05:6000:3101:b0:3b7:6804:9362 with SMTP id
 ffacd0b85a97d-3b794fd7b4dmr6169503f8f.26.1753995657120; 
 Thu, 31 Jul 2025 14:00:57 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4532c4sm3522573f8f.36.2025.07.31.14.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:00:56 -0700 (PDT)
Message-ID: <8115cee2-7d58-4e9b-bf36-72b547f70e46@linaro.org>
Date: Thu, 31 Jul 2025 23:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/sd/sdcard: fix spi_cmd_SEND_CSD/CID state check
To: Guenter Roeck <linux@roeck-us.net>, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: qemu-block@nongnu.org, bmeng.cn@gmail.com, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20250724105807.697915-1-ben.dooks@codethink.co.uk>
 <893a7943-e5ac-4c42-b30f-1dfa262b923e@linaro.org>
 <7731f31b606442cab7a3f7b1c2cf6d6e@codethink.co.uk>
 <b89e76f3-9a9b-4d7f-aafd-2c00959c8321@roeck-us.net>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b89e76f3-9a9b-4d7f-aafd-2c00959c8321@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 29/7/25 18:35, Guenter Roeck wrote:
> On Tue, Jul 29, 2025 at 04:06:33PM +0100, Ben Dooks wrote:
>>
>>
>> On 2025-07-29 14:51, Philippe Mathieu-Daudé wrote:
>>> Hi Ben,
>>>
>>> On 24/7/25 12:58, Ben Dooks wrote:
>>>> The addition of specific handlers for mmc-spi for SEND_CSD and
>>>> SEND_CID has broken at least Linux and possibly also u-boot's
>>>> mmc-spi code.
>>>>
>>>> It looks like when adding the code, it is checking for these
>>>> commands to not be in sd_standby_state but the check looks to
>>>> have been accidentally reversed (see below)
>>>>
>>>>        if (sd->state != sd_standby_state) {
>>>>            return sd_invalid_state_for_cmd(sd, req);
>>>>        }
>>>>
>>>> Linux shows the following:
>>>>
>>>> [    0.293983] Waiting for root device /dev/mmcblk0...
>>>> [    1.363071] mmc0: error -38 whilst initialising SD card
>>>> [    2.418566] mmc0: error -38 whilst initialising SD card
>>>>
>>>> Fixes: da954d0e32444f122a4 ("hw/sd/sdcard: Add spi_cmd_SEND_CSD/CID
>>>> handlers (CMD9 & CMD10)")
>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>> ---
>>>>    hw/sd/sd.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
> ...
>>
>> ok, so what is the correct fix? the sd-spi has been broken for some time.

I couldn't figure yet the problem with SEND_CSD and SEND_CID
*not* being in sd_standby_state, but I figured what was missing
with R2 return in SEND_STATUS. I'll post the series ASAP.

About "broken for some time", I was only testing the SPI mode with
the Gumstix machines, but we removed their support in commit a2ccff4d2bc
("hw/arm: Remove 'connex' and 'verdex' machines").
For older SPI testing, see:
https://lore.kernel.org/qemu-devel/2b825be1-bc57-49c2-d1c9-be83577e8ce1@amsat.org/
> FWIW, I use the patch below on top of upstream qemu. I have no idea if it
> is correct, but it fixes the problem for me.
> 
> Guenter
> 
> ---
>  From 87a2004005eb47758c524b54dd3fbc68a00e317f Mon Sep 17 00:00:00 2001
> From: Guenter Roeck <linux@roeck-us.net>
> Date: Thu, 24 Oct 2024 12:16:44 -0700
> Subject: [PATCH] sd: Fix boot failures seen on sifive_u
> 
> sifive_u fails to boot from SD. This patch fixes the problem.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   hw/sd/sd.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index c275fdda2d..f5c44a4a86 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -1520,7 +1520,7 @@ static sd_rsp_type_t emmc_cmd_SEND_EXT_CSD(SDState *sd, SDRequest req)
>   /* CMD9 */
>   static sd_rsp_type_t spi_cmd_SEND_CSD(SDState *sd, SDRequest req)
>   {
> -    if (sd->state != sd_standby_state) {
> +    if (sd->state != sd_transfer_state) {
>           return sd_invalid_state_for_cmd(sd, req);
>       }
>       return sd_cmd_to_sendingdata(sd, req, sd_req_get_address(sd, req),
> @@ -1539,7 +1539,7 @@ static sd_rsp_type_t sd_cmd_SEND_CSD(SDState *sd, SDRequest req)
>   /* CMD10 */
>   static sd_rsp_type_t spi_cmd_SEND_CID(SDState *sd, SDRequest req)
>   {
> -    if (sd->state != sd_standby_state) {
> +    if (sd->state != sd_transfer_state) {
>           return sd_invalid_state_for_cmd(sd, req);
>       }
>       return sd_cmd_to_sendingdata(sd, req, sd_req_get_address(sd, req),
> @@ -1592,7 +1592,7 @@ static sd_rsp_type_t sd_cmd_SEND_STATUS(SDState *sd, SDRequest req)
>       }
>   
>       if (sd_is_spi(sd)) {
> -        return sd_r2_s;
> +        return sd_r1;
>       }
>   
>       return sd_req_rca_same(sd, req) ? sd_r1 : sd_r0;


