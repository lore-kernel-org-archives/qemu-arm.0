Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9250CD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:29:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtWL-0002jn-4Q; Fri, 15 May 2026 10:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtW1-0002Sy-Db
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:27:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtVz-0001qL-1u
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:27:49 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so83810285e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855265; x=1779460065; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oFRYnpHIGA/dJ+CK69/soRvPFnE1TnXVCnnM1+SY7jM=;
 b=sebA+gJtGxvoISdKdd1bOm33xPYbuVaAWj27szbMfYOHEnI8zcxK32Xlq/Xjgt/kKz
 bje+UAtSWpqPaTR4Q/4t99YrAWPO1wnOZC8QDo6umL4LrRN66vwuwGpi8jmnFq/HoHp3
 Av+biY1wblgsUg1NEHZhcgb6JHDGOCBk6rQE9N6pDQGDnfIrXjJSf0KbjJLokLrKiQ+7
 oHeFXL5R+Qj2bGoOvpHiE/7BXJBAjHYONlQULrw+yknSwbJHMFZuYu+NCR9jMxwsiqjZ
 IdImKe6jBATFi69bMbEPAMLrNfLOE41kGf2L8jWmRKxysYt0ZC6Dxrb1Y5dI0kjLarvU
 iXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855265; x=1779460065;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFRYnpHIGA/dJ+CK69/soRvPFnE1TnXVCnnM1+SY7jM=;
 b=euLhOeBs0eW7xN3rPSdnGxe+YaxQx3YK7T/nwRTrW6uDAhqGcWuAN4AokVBC7xg1QJ
 NEteZOz9tbZIBxx/JpA24CKOINP6Y5gKgtda7nlsD9HYQFs6l6+dGRbCaEgQz9l800oD
 AoCg9uDyQ5oqYb19OIbo/r9iPgmmHgp93u7Tpk456n+0xIs11FOP66sj8ZIWm0j+tYZ0
 5BvdFZNzbNqVhQd59utNqyP0xJqAaMrqQgLd3Zab732XlJcJuTwbZzPT1eRTwwX9V/wr
 FVfjuVaXZh1WiDyGSiIkAVfoCJ0STJ7vO6gSv7N3tLNSoI95icSEHefhceplneBRSu32
 92rw==
X-Forwarded-Encrypted: i=1;
 AFNElJ955Iwqiv0uOZtBWIVqYpIOwmNshwzU3wATsN8MqeG5FURPNALpEBk2mdZyPf7PtQhSV5y8EUMkzg==@nongnu.org
X-Gm-Message-State: AOJu0YyVjfE0Cbc9D3KuEMf17IzkoeD35x4hFU6Ol6iujCmVKWe6pp0a
 9nCNQGlTgPwi4r1HqReNDV2oSWdBNaNtpmbCkq8c3lD7TsR78Jn/tvsGOwLwGs6m4Cc=
X-Gm-Gg: Acq92OFAsK6j9Ulb8r14kyEndnv++IEEzKbtUor5/iJ2jc0QRvTf58+2sKTs+/gKcvT
 XEHIsKq3uq5hZhPbXTIGww9o1S8m0OCKj7IWpVGp766k/ckMhcmsyPHj82AewoDUqy830/QtiQS
 hoJLgBj3VgzZtF9ZGj5z1SK77ziv2s1u9ykN9lTsVgWu4o+PCccpY5smJRxFoL7/f8e9/W3mMFp
 USz63PH+rV/G7de9l+bUDppNhP3PDMCjqirFbZUZr/pCvZF1CcoI+eTxmLdKyd5Nr5JOMgcH0jG
 GeW+JvIGrtXrQfvgf52Vl9kWybS6sEvwyGJE+aoH1/ll9JCZr77rZMBN5dddA8hdmCG9pEHNmLL
 YU6rF7aLb/mWPPUL7DJsxFSiox3bWrtXQj2401zz72ZTLCcTsMlEW5BjGLp6sFPXbp7Fc0DWQ1o
 HpqeRlcJmMg0y0gG0AZrCXd7KO4fH0WISkVhtQJVUSIFW2SErbE0f5nFPG/TmbL5qjHg==
X-Received: by 2002:a05:600c:608b:b0:488:8bdd:cfcc with SMTP id
 5b1f17b1804b1-48fe5ea04cemr59055745e9.0.1778855265519; 
 Fri, 15 May 2026 07:27:45 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fea529727sm34800575e9.1.2026.05.15.07.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 07:27:44 -0700 (PDT)
Message-ID: <ec819fc6-b5b1-4803-92de-c7a87596f20e@linaro.org>
Date: Fri, 15 May 2026 16:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/20] target/arm: Restrict IDAU interface to TCG
 namespace
Content-Language: en-US
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-11-philmd@linaro.org>
 <CAAjaMXYJr7Xg+0xSVNaxkG+5ykzJCL=uNwpmeN=GYbbGd34ZjQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAjaMXYJr7Xg+0xSVNaxkG+5ykzJCL=uNwpmeN=GYbbGd34ZjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 15/5/26 16:23, Manos Pitsidianakis wrote:
> On Fri, May 15, 2026 at 5:11 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Emphasis the IDAU interface is restricted to TCG by
> 
> Emphasis?

Emphasize!

> 
>> moving the header under target/arm/tcg/. Move the
>> definition to cpu-v7m.c which also contains v7/v8
>> hardware (NVIC), keeping only CPU types in cpu32.c.
>>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> 
>>   include/hw/arm/armv7m.h     |  2 +-
>>   include/hw/misc/tz-msc.h    |  2 +-
>>   target/arm/{ => tcg}/idau.h |  4 ++--
>>   hw/arm/armv7m.c             |  2 +-
>>   target/arm/cpu.c            |  2 +-
>>   target/arm/ptw.c            |  2 +-
>>   target/arm/tcg/cpu-v7m.c    | 11 +++++++++++
>>   target/arm/tcg/cpu32.c      |  8 --------
>>   8 files changed, 18 insertions(+), 15 deletions(-)
>>   rename target/arm/{ => tcg}/idau.h (97%)


