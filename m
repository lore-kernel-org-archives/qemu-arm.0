Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCFC1098780
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 12:55:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZO6-0006pw-Mo; Fri, 20 Mar 2026 08:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w3ZO4-0006pa-0p
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 08:55:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w3ZO1-0003J2-1V
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 08:55:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43b41b545d9so2320885f8f.2
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011323; x=1774616123; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cjzLpWaX1RSzTF69D9WopUqnyrOvZsQaWGiSp8qfcRc=;
 b=MyCSeeCrQWHcwvOhseW+5UtgQ4OmJUwJQkaZl3pvPe39LH8tChbi0pcZsjAQqiIhrQ
 pxvts8gYF8bi9YD7B5qrfQzbyaOGRp3iGAQ5cLLSsdqjPL+GDvZTlYzzKfAWQNQumTny
 spKnFDcyVXtb5zwQZNyn/wHeUEvrxu2wDK+sNZrHl2iryzZujRCr2+cv5D8YTqWc5BGP
 NO8sz3UClSzf4NRQ4RtG5EPNnFx+H/0Fs9THqd6ANbYDBO65wNnbA1PhAEldonOyb0nW
 74nJr9aXYlPu/9+bbF5I603aLfE28od0Pk8uFJ2If5vKsqri/1eQFjpOECHDZosBCRrg
 5ULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011323; x=1774616123;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cjzLpWaX1RSzTF69D9WopUqnyrOvZsQaWGiSp8qfcRc=;
 b=K/g8AgZm2VmpvMejWbYZKUsJAYzQN4afCX47OmyX5OnT/YchCGJX8HcwFBo8DH0XeB
 d6hZ+f4STfaolZu1eGqfyVtTbVUOj03E8ceIN3p/jq30u5ONGfn+Lc3+TSgj8//2AjVS
 1oqVqkCIYuA4fCtBQw/QQwmJY4Up8UI+OszBhCC5DyTQTGKpNGxv+K5jEz3onVWUmiKf
 hHnrMa4fy4WGk3ylxaA40IR0Or9irWgaizFxGmC2kaujyuOwli9Q34LToff/OiXNpmOW
 tjcLEnttVdRvZNJgyRRixgBnfohcHpU32xKKjkocHJqX8k3ZXs159QpsgA03TQ77L9o/
 AO1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUK+FKursJdVAi1yvbMZ1a7BNv1ApY4Xy3X8FeErYtcGya1AQ8wkiSVW2SeS7YMY8UIW4FeaFyB2Q==@nongnu.org
X-Gm-Message-State: AOJu0YzxBdDzROmcPjTYgULybC/Ewbox4HL+5V6/3vSifExwW1TXg/gB
 dBHQA+uyasLtMKthBj2MNgzEI7rS5kQqYobxUtOrIaYMrl7tDE9nzrh1bbgXbydJ9mU=
X-Gm-Gg: ATEYQzwi0AVCvM+5Ahsn2hpdNv+q1JJKj+GD1GRQlW7isYcTx2px6NiDzY6JwNzmXlz
 a0McgGiSYhfCEEfQis/Vfbkur+ztvc8/b3jGi+KiHwZTRkIxGpw9XAfZ/kjLNsD94N0iVsPzXiZ
 Zl/jsmt39V8JNb3dpBerWZGGh8OijYTxhS4bH/Bj7b74/S+g69MfoE2e0CM5/tkvmQACPdjwVza
 RLjSi1RY5sSE7Qa3LMi6fiDOpVdQMuiIwa7aIjgPa8RGpsEDRZGns1CwyEpojCJ/dvB2/NTrHPB
 alTn9CTzjSeDlPNbyl4wgSXWWf7zPPxHUVuQvy5/CdF/fp42bM3mBoY+UMK+jfT4hQwjPt22jcJ
 ++UZAZYMyAo+AP+/CV5z8pL7zdSF/QiuqKVgi/fMzFC5YkA47crprB5qOr2xxa2AIoaP129T/le
 Y0eZ3iTYn5/PrDh9TDFU9rNaLj9LTK0UH3ilP3NzKIvXay6X7TtSperrpwmpzoJvClXQ==
X-Received: by 2002:a05:6000:290b:b0:439:c6d9:7fc with SMTP id
 ffacd0b85a97d-43b64264b1dmr5353488f8f.25.1774011323197; 
 Fri, 20 Mar 2026 05:55:23 -0700 (PDT)
Received: from [192.168.69.206] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64703343sm5699428f8f.19.2026.03.20.05.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2026 05:55:22 -0700 (PDT)
Message-ID: <fae7bc44-9b6d-4ec9-b375-845bff594d1a@linaro.org>
Date: Fri, 20 Mar 2026 13:55:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.0?] configs/targets: Restrict the legacy
 ldst_phys() API on ARM / Aarch64
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org
References: <20260319104414.66367-1-philmd@linaro.org>
 <CAFEAcA9kmZp-ExsV-8k7fZ1nsGOyvnPZQ9tD1hrCTihxy=uRpQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9kmZp-ExsV-8k7fZ1nsGOyvnPZQ9tD1hrCTihxy=uRpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/3/26 11:28, Peter Maydell wrote:
> On Thu, 19 Mar 2026 at 10:44, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Commit d751921cffd ("hw/arm/omap1: Remove omap_badwidth_*
>> implementations") removed the last use of the legacy ldst_phys()
>> API. Set the TARGET_NOT_USING_LEGACY_LDST_PHYS_API variable to
>> hide the legacy API to the ARM / Aarch64 binaries, avoiding further
>> API uses to creep in.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   configs/targets/aarch64-softmmu.mak | 1 +
>>   configs/targets/arm-softmmu.mak     | 1 +
>>   2 files changed, 2 insertions(+)
> 
> We might as well take this now, it's pretty safe.

Thank you, appreciated!

> Applied to target-arm.next, thanks.
> 
> -- PMM


