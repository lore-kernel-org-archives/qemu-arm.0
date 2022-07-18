Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1220803lfp;
        Mon, 18 Jul 2022 03:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vukHgEGlJOr6oWiY+4TPvb1JnH6LPxBCkG4mSiGO9nzHhyfB8Oj2ZAS+vmLSxfBd7TERrS
X-Received: by 2002:a05:6214:d08:b0:472:fc88:ec with SMTP id 8-20020a0562140d0800b00472fc8800ecmr20126586qvh.129.1658140016981;
        Mon, 18 Jul 2022 03:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658140016; cv=none;
        d=google.com; s=arc-20160816;
        b=TZJilM7i9I8e5CqD1G7IVKFzmZXK+n7l82YJnrGC5J2Ah1OlkAHShjJCMBEznyJdrc
         7ZiNT3t/05Ch8Gk+j+hzNYtC5w49wWBVWIY5SU0vZcGD9QyA6VT4SaofGdldJJjhukiC
         PZTHPfBuYJlZsEkXm/CiaGcndN7DD3OnKjiO2gl5y6LLacz53RE7hlXF4zBcDl30/gUo
         4lb/y/D9CZKV43BUAXBwHBzBDSrwDPAbgEIMz+WQKTrjxL8mMZp4XYLyUXsE5hkUy9QL
         2VClUOYpR2F8EXKtb8GV2RLeVg/EQH6Ev0WwT7XVnCoDWgAGzUgwdTtYgUVVNapjJBy2
         cmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2tUT+0d1WdjMUQZAJ9HOOTxL9llIhzMEHmbM9BeTpUU=;
        b=KbAmlDFiTaAeNaiADWv23nymTMelOswYwdR9+5KP1P+Xef2w7YL0WLlFS6B1LyiCpv
         5vZKq7L84iHIfWL6LyYst3vSHVKKoNiIQDJ2W26+DuWnoUKGs0Kya+TCHd9yTASU/xhU
         uo4ve/HIbrWQUi7OekXNIAD7y9K6R4iHgOJYNAPUZ6RusqhtAki9AUgRqTJc/+pAc43/
         1wCNLNZIwyKkt7c9d1Ra3qpFuERI1d8VJV3vwXYlFFfMCAkYYDaLIv8DAFifZfwqx6lA
         x3+z3uJqX9zQTCd0+07R0ng8Kf2+raEytiw+rtRXVdBmuGUj5PlrnVoeAWwYIiQscatP
         5PrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=SifnCYZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020ac81e8e000000b0031eb572feaesi5586528qtm.710.2022.07.18.03.26.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=SifnCYZi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNxi-00062g-BU
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNwL-00060O-4n
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:25:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ben.dooks@sifive.com>)
 id 1oDNwJ-0000eZ-Ch
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:25:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r2so15333899wrs.3
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2tUT+0d1WdjMUQZAJ9HOOTxL9llIhzMEHmbM9BeTpUU=;
 b=SifnCYZiz0SwY43VlzWBGse0Smu+kqc7TyqVS0kVgQK+/lBrGQK1Z47oAjIUa6+PKW
 P5Skx7sn7wnP7UF6Ij7bUZZzlFK9ROanqM+4zJipzCeIy8a7TR4W3uauGSmZwhLOefXO
 TI7uDXS5gmhDwpGlBSZ6AJXVw4jB+bxpEOMNDRTkjhPTJ6NSNwZj4idhpi4o0GCOCekI
 hnmX1UifzmYo2ZQsO28bDuaDtL7L0nyJEvipL9q4huFUmYUHjLOyvVtFXtMSKrm42THK
 m87gLc/G/PWdPsEWw+CMOG4L5TEBn3XK5qtMHUrNsPm5d38qPl0KYkXeQy+8nVcTDtAg
 LzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2tUT+0d1WdjMUQZAJ9HOOTxL9llIhzMEHmbM9BeTpUU=;
 b=x0bBo+reDSHe9Dddo3lQ7q0k1vw9EyQAdLJaXNv9RJMLfgxO5PxBuCMN0zKNsxv2sI
 1RQax3jOuLlWd9UJAjswlezOBlaUMKcdf7LZNcMj0Z7d301OiAslRvnH5g7ynrHrY8bZ
 jX3gZN9ICqlZOhgLme/qD+lu5mbjhkTLrDRP3hzjkBVVgA2Sw8f8hQZUhd8jlS9Na6zT
 XW01Bid6kzzhQN0qsvplnddxplxSkYI7H75PVfLgkgzYeAORT1MdCqVx+RwyUNWK/oLQ
 Z7GB3hYUWYzcdziIlKAA3ay0jJnewGDbsQ72ajSaE8TPkmnZhQV9BMQKt5kw5syEju7p
 1SwQ==
X-Gm-Message-State: AJIora/vSI2rG5PQtnuO4vE/4PgnKOt0BkQSzIYi11XFRMJULgjX24nn
 /IyAqLdVIoQW56vXi8jXythvcA==
X-Received: by 2002:adf:cf0a:0:b0:21e:2970:bade with SMTP id
 o10-20020adfcf0a000000b0021e2970bademr190039wrj.455.1658139921689; 
 Mon, 18 Jul 2022 03:25:21 -0700 (PDT)
Received: from [10.35.4.171] ([167.98.27.226])
 by smtp.gmail.com with ESMTPSA id
 p129-20020a1c2987000000b003a2d47d3051sm16843208wmp.41.2022.07.18.03.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 03:25:21 -0700 (PDT)
Message-ID: <4e9c6fc7-54c9-9510-654f-4e41d849676e@sifive.com>
Date: Mon, 18 Jul 2022 11:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gpio: designware gpio driver
Content-Language: en-GB
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
References: <20220713172010.39163-1-ben.dooks@sifive.com>
 <d2b2a868-4e12-35f4-40e9-5e520e07cb3e@sifive.com>
 <CAFEAcA9qngx_1BzF+THHqpp4OyiSa+Do7hPKwqZ1v=0psGXrWw@mail.gmail.com>
From: Ben Dooks <ben.dooks@sifive.com>
In-Reply-To: <CAFEAcA9qngx_1BzF+THHqpp4OyiSa+Do7hPKwqZ1v=0psGXrWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ben.dooks@sifive.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8SKnlWrTYMCn

On 18/07/2022 11:15, Peter Maydell wrote:
> On Mon, 18 Jul 2022 at 11:05, Ben Dooks <ben.dooks@sifive.com> wrote:
>>
>> On 13/07/2022 18:20, Ben Dooks wrote:
>>> A model for the DesignWare GPIO (v1) block.
>>
>> Is there anyone else who should be reviewing these that
>> was missed off the original list? I'd like to get an idea
>> if there is any work to do. I've got a couple more drivers
>> to submit and was waiting on feedback from this before
>> getting these submitted.
> 
> 
> My overall feedback is: this isn't a pluggable device (PCI, etc),
> so what's it intended to be used by? Generally we don't take
> device models except when there's a board model that's using them.

I have a board file, but that's currently under NDA, so we're not
allowed to release it at the moment. However we've done a few drivers
which we'd like to get out of our development tree which other people
might find useful (GPIO, SPI, I2C).

-- 
Ben
