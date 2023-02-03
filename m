Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1383038ejb;
        Fri, 3 Feb 2023 05:22:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8tkx9SGS3h2utwsL01MJ4MMUpILzIRSqvMlAa2dnkGhGJIq78j84YPJGMNCmC32KVOnSql
X-Received: by 2002:a05:6214:1d23:b0:537:7ba3:95a0 with SMTP id f3-20020a0562141d2300b005377ba395a0mr20430823qvd.23.1675430531867;
        Fri, 03 Feb 2023 05:22:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675430531; cv=none;
        d=google.com; s=arc-20160816;
        b=OvFcljemXEkxDvp3pvCftuXwOf3SchpOoH8iv4U+ObUnmSDRhLUgerT5Feck2ogJkF
         XyURkRVihJe+wtwnh0BFfOdPwNj9KqVShyFvwMiFWavQGVnG1HpJOf3G5QhVFGz5/Brc
         JYMbWTwvJbKthU2MexlMjJlX1bhl81HAVby2kttx3KJwj4i6Ro70HCZRBwAUjcNiGM76
         kD69PpDwZf0s894EPBGt/GH14uAizcuo0nQUm2rFwERZEVHfbByybdQqH5rGF1rEcEJU
         8QgmLHGonF7eYhhdb+nubiQhHP4/VtNXPpXw9qv78W4RsEugS/yUbGZva+xBf9iifObW
         hDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CpZS5HDgmyID7QFWK/03F9lO4wDky8dioQ8x5b7gaT0=;
        b=EPcAqSsuO3gsWidoIB493rTx1gOqZrtQ46Itfmn+Gd0q/G3FACRmQ3j2Rojtrku2Gy
         XeyDkYWGsUFik3m5MkmIpkWxlLGp+mayYmMIc9o2bOwAAeDmVTQbD6MmGL8JIq6ynSB3
         9BaXJuMbI7aZVcnYRz4x9sNvRMNJrW22W7zCoaCigfDUdLDPoF7+t9A0ZHZfxlt6Jt0R
         O8k95EZFScUx/kTU5ZF+DtXZhfcUa98NaPXOzfekgs1/5FSxd8QSQXptw8w9JeKt+WlY
         d5pmXnJ8M5EUjfejUFp9RfbPiiy9WZEmik4brCFOLh/2CICCqPVoJltWoFCkgVr8yi2C
         +/DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LNHlewlW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5-20020a05622a034500b003b86b161420si1900022qtw.94.2023.02.03.05.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 05:22:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LNHlewlW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNw0s-0005kN-Ra; Fri, 03 Feb 2023 08:22:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNw0Q-0005VR-3V
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 08:21:35 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNw0O-0006id-9h
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 08:21:29 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6011368wma.1
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 05:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CpZS5HDgmyID7QFWK/03F9lO4wDky8dioQ8x5b7gaT0=;
 b=LNHlewlW94yP04LvoStVzSv64q1KyfyUGzq/wlCjbq9pt51erBffu2V3ml+pbnJxIR
 kCHeXLDGczqIUbnJl7bCghEtgwQdu+8S4wKTpBW6tYtYCK7P4HbuFt0O7UQZXejLuq7G
 StRaZg4nwAPepMcZm+pnXvm7C7nQG+sV0xEvVTY87ylDXqcJr1WGxD80+M2m/cSqVCkg
 1Ivy4ZY6FC8QMBHzqy6OazN1F/T2sWGl6LrcVOE8q9OigvL50gudyS2vPEysO8z0cZ0O
 u2ndjngIIIEqCuZOL31Ukvfdephpt70RJEFI2UP7VVVWWsDL/CTHkt3V8ISQxsq7vzLU
 ip5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CpZS5HDgmyID7QFWK/03F9lO4wDky8dioQ8x5b7gaT0=;
 b=j49oZWt+v8vNr2766na0lLQh920XJQqNt3tWcSSXxv0FYYCJFEvPZ1EuFHHJb9VqBG
 Zon2RVO05rdGw7717MjzJh65J+iQMK6R2B4mNpPDboN+QeaL8KI8ovLU0dB+69mRJJrj
 BZN0rLXquBMhZHnppybgzCZ29e7jblvBELTzDYo9Lc/0LXYsSOegksWOF3hWqC7YAbpX
 PjA37xVSmXUnwwl9WAHLIF9OnZwfnC4F9t83tW21qADGvAxO8gwKXGQNDq/brmRC3wg1
 scYQXUvePk9qSw5zLQP0jpRK5FNbgnVrK8QIUKmABwqo0tj3+Gl03WRbAHJ7jQs1tMtd
 U9aQ==
X-Gm-Message-State: AO0yUKXUXIiy63rQmDdA6UNsw3ToLLSeB9mWVhaO9+ZbKCzu9zbqhNhz
 yldOM5JQR0GDIEeZDWzAjVqH2w==
X-Received: by 2002:a05:600c:44c8:b0:3dc:45a7:2b8a with SMTP id
 f8-20020a05600c44c800b003dc45a72b8amr9487287wmo.10.1675430485209; 
 Fri, 03 Feb 2023 05:21:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s24-20020a05600c319800b003dfe5190376sm2263075wmp.35.2023.02.03.05.21.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 05:21:24 -0800 (PST)
Message-ID: <075577d7-d5c4-393b-9d0d-2aab32abe957@linaro.org>
Date: Fri, 3 Feb 2023 14:21:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/9] hw/display/sm501: QOM-alias 'dma-offset' property in
 chipset object
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-7-philmd@linaro.org>
 <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: +PKxBqod6JFv

On 3/2/23 14:05, BALATON Zoltan wrote:
> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>> No need to use an intermediate 'dma-offset' property in the
>> chipset object. Alias the property, so when the machine (here
>> r2d-plus) sets the value on the chipset, it is propagated to
>> the OHCI object.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/display/sm501.c | 22 +++++++++++-----------
>> hw/sh4/r2d.c       |  2 +-
>> 2 files changed, 12 insertions(+), 12 deletions(-)
> 
> It does not seem to be any simpler by the number of lines but maybe a 
> bit cleaner.

Well it also moves to the "Embed QOM objects" pattern which Peter prefers.
Note this device doesn't implement unrealize().

> I wonder if it would worth renaming the property to 
> dma-offset to match that of ohci so it's less confusing what it refers 
> to. It's only used by r2d and this patch already changing that so would 
> be an easy change.

We can't because TYPE_PCI_SM501 is user-creatable, so we need to
go thru the whole deprecation process and we don't have any API to
deprecate QOM properties yet.

I'll add these comments to the description.
