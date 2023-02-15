Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp449911ejb;
        Wed, 15 Feb 2023 04:26:45 -0800 (PST)
X-Google-Smtp-Source: AK7set9jWktmsIoY5CRFckZt7pOrfH/49a7cESwT7hJ/LMxnBY9TWBevuvUjNjZYTGVCAY3kGDj4
X-Received: by 2002:ad4:5bc4:0:b0:56e:a96b:a3a1 with SMTP id t4-20020ad45bc4000000b0056ea96ba3a1mr3276234qvt.7.1676464005349;
        Wed, 15 Feb 2023 04:26:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676464005; cv=none;
        d=google.com; s=arc-20160816;
        b=kEVJHTmJGYRSJIhqVLjtvUCpinwmT/u7GcYoaLUU67hXbjNOuvmACtHWHGUZyX8LYr
         x9POdkeH4Xbne+Nfo2FoV9qCd8Vo618ojDWzsC+imvRpbYT08VtSsHmHdVhtagP1Avy0
         lAdOEH57nPQOrt3DgQwfEY0rcVDupNbyB3eU+h4qPXrYPnM/PwJethwsnpa9Pgw3yYp8
         zW5TIYHG8tEAtkTCzre6x7g6MbqrOtJLB0AXm5+WOlakwGOtQcRTLAx/ReY+nhMHW1nl
         x6lWCA2wRaEot2RV+XLAoO76EO0xhVVqAHo9aa1QZXX/wfiBS84MCBHe94PndTiLR7vW
         h82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=chFpY3FBQGCkJqBCbn5NUw29hFUIadEOUtzuP/37mOk=;
        b=v063Tj5M+kW1B7EygJSFATJg5VXtUclypoYcuRpPP/fltIWXZLBdtQQdQE9YSVuf7b
         pX4OHUkqSU9eoWBGOiKUhBwPBiN85r8oqxOS1roRe1tYQkcWL84KRcRhgCX4cPUTvpvO
         479DVz3X6TKkcKbpE6pQNFf4Dlj7rmwmC5Fd+6X5G/RpIKg1rmc7u1eZbDD4RNR8cW+r
         yB9+Pd4J8wgWL02l7BgD0gujea0dYreIUl6ylJ4yxfT+rNuJ7FNHxOXNqRHzX4mdm6Zs
         EckDNcckUxoRd3FC2OCddVwGRBY1/YwykNV6LJXlS9Y7lZ/nsYvSEvNquPfr+SMPKnaL
         rYeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a0SFadMf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a0cda92000000b0056eafb9d585si7293653qvj.6.2023.02.15.04.26.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 04:26:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a0SFadMf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGrp-0002fN-JF; Wed, 15 Feb 2023 07:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSGrn-0002ew-1U
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:26:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSGrl-0005wm-AO
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:26:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id o15so15653130wrc.9
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 04:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=chFpY3FBQGCkJqBCbn5NUw29hFUIadEOUtzuP/37mOk=;
 b=a0SFadMfnu40+n8hrdRAfJhDNp18gTKn5JnJ930HZM3xgLw7QcHR02NRQX2FU5WZDP
 OpD43duZlenygcI4bgEY1qO0xzaAW1ku5UnkR9W3oDNOUCNCE2vMNHBXIh0dl8kNpn1x
 yEG3EH5BcOcsPE+I2Cu6XUScr8EJ4cSvRReZEp+mNVeIJTTISr5sL8tbBi59udIQTPjz
 h6ovPgN0Y2icVerukL6hqLtsKHmJBzvf+an50fwlOkEAyLcizS7AWqOMKu3iegRxQpDE
 vcTgtgi/Gg6HyEeLRYZJVoPnwDoMZuOHZrjGVY9fcKaROiJVsTAbpRZJ6wOn09+KoWnM
 ZVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=chFpY3FBQGCkJqBCbn5NUw29hFUIadEOUtzuP/37mOk=;
 b=B+aS/selPRQSneb3nQgKOeQUb7OzWpGLcuYJJktQqch45IIxMZQdzJfaOJz89ACRBX
 wfBSRt8XHW+5K5lObmH2SLFI2edTRR+4F1Ti68VfDTUrHLxmkUyKaUlLHpVb3M2KlBmz
 yHFsKgxWo/4RzgsI2kdjgcbWRb5eahsdpMxkZwXTfxs40IWu2/YoVhq2jOIZjlyJyTG0
 OCzqs3RyI2YjUx0aB+S0JJFCM3KLVQnregKh6wJykfARJy58ZBscsCq2lJz6IJzvwQuF
 L0wR26dJQxvYJ9gKfLw0TyNd/sJ4LFH0JjAU1Lcvm48g5OWt5A4cy553mDw33JWLqmjY
 FWTQ==
X-Gm-Message-State: AO0yUKVe5Ri4OZ3vV3fwibexz99gQjCuuDX6C4+xnE8FZiinjacge7Pp
 K3WeMC7bXZAEnkhSzj9uo8Zk2w==
X-Received: by 2002:adf:db49:0:b0:2c5:51d7:f821 with SMTP id
 f9-20020adfdb49000000b002c551d7f821mr1255234wrj.61.1676463987763; 
 Wed, 15 Feb 2023 04:26:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b16-20020adfe650000000b002c5534db60bsm9213204wrn.71.2023.02.15.04.26.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 04:26:27 -0800 (PST)
Message-ID: <38d7b71e-4908-6cc2-0e4f-a08d3a11cdf7@linaro.org>
Date: Wed, 15 Feb 2023 13:26:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 3/8] hw/misc: add a toy i2c echo device
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Klaus Jensen <k.jensen@samsung.com>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-4-clg@kaod.org>
 <e268d089-259f-07f2-6429-9eff461992f4@linaro.org>
 <32521fbd-df47-6c7d-d515-4da185e6acfa@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <32521fbd-df47-6c7d-d515-4da185e6acfa@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /M+WaD30cRGQ

On 15/2/23 12:09, Cédric Le Goater wrote:
> On 2/15/23 11:55, Philippe Mathieu-Daudé wrote:
>> On 14/2/23 18:18, Cédric Le Goater wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Add an example I2C device to demonstrate how a slave may master the bus
>>> and send data asynchronously to another slave.
>>
>> What a rebellion...
>>
>>> The device will echo whatever it is sent to the device identified by the
>>> first byte received.
>>>
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> [ clg: - Changed to build to use CONFIG_ASPEED_SOC since only supported
>>>           on such SoCs
>>>         - folded in these fixes :
>>>              
>>> https://lore.kernel.org/qemu-devel/Y3yMKAhOkYGtnkOp@cormorant.local/
>>> ]
>>> Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/misc/i2c-echo.c  | 156 ++++++++++++++++++++++++++++++++++++++++++++
>>>   hw/misc/meson.build |   2 +
>>>   2 files changed, 158 insertions(+)
>>>   create mode 100644 hw/misc/i2c-echo.c
>>
>>
>>> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
>>> index 448e14b531..3eb1bda710 100644
>>> --- a/hw/misc/meson.build
>>> +++ b/hw/misc/meson.build
>>> @@ -129,6 +129,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: 
>>> files('nrf51_rng.c'))
>>>   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: 
>>> files('grlib_ahb_apb_pnp.c'))
>>> +softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('i2c-echo.c'))
>>
>> s/CONFIG_ASPEED_SOC/CONFIG_I2C/ since this is a generic device.
> 
> even if only supported by the Aspeed SoC ? I am OK with both.

Any machine exposing an i2c bus can use this device, isn't it?

   -device i2c-echo,bus=bus69,address=0x42 ...
