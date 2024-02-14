Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp755645eje;
        Wed, 14 Feb 2024 04:42:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtxrZAU+CCeh9+EehdAj0BhFMFpFCw8o1cHSZsJNQf1a539fCdRdUsdagSmgh6Lz0X/V9Qy2uTi02Rc7fG1J/xbTB9Zvg8
X-Google-Smtp-Source: AGHT+IFb+duSe1xqIVGfkG0d+Nd8XiG96WYR3ZODPJiA1dMN95Z2VEVxnEFuCdF6EvJ84f+EAhpq
X-Received: by 2002:a25:838f:0:b0:dc2:1f53:3a4f with SMTP id t15-20020a25838f000000b00dc21f533a4fmr2050262ybk.5.1707914538745;
        Wed, 14 Feb 2024 04:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707914538; cv=none;
        d=google.com; s=arc-20160816;
        b=iqy7IuJ0O9Fh2DKRmv/GpYVCXN5zmC+qL0+t50xVe/BgBIWliya2dQegOq+472oHQ/
         2kgftIlQUx2qjlGA8icrbpfmzOad3Ce211XaywsSGuGjVHDRhTXcaD+eo8Abs6u2Kgdi
         oG45ZkD4eduTTFnKBUWykfQCGNzBg1gWnNPdlqtMnIRzwuTjLAiwSIhFG4cQZbVwTHDq
         n8NPyUkr6jN25xmjzKyBMZ+4xWCWxZVab/o/Z1baGwuXLNW6HVxiew9hUbnLd4Fj9DSL
         O/hU0k1eJAFe/R7Y3pd7vRykT8LdaiQppzQlTauiVOMJB9xb6zu/LjLuR1jP2qPCRU+3
         vTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=gQ7NMN0JmRsMHDSzbG4bmaTxNKg4lkiE2p2DvKpoXIY=;
        fh=4zT726EUsT92vPCYRxeNeg16HCQBV59NkVs3CuR+YD4=;
        b=cG18yTQLl6DDO2ssyucYXIMSPJ+xfpvbtmCCvQObx/bi3RB5sTZ2wNCG2eXCK42JLm
         BBCqIE9YSEb4HDCYN0JyrcVrcQK8BwR7NuAt+sMdu1uU8LqeCNWgRqxRsksfjwxKVqob
         K5NipwSi3m95WL5bthmr/XCesqLgpLYXnPHiVzRjwYh8ZvzeXN15VfnluN/oOOL9BK5Z
         yLBCrouMcWnaDKVWnuFrMgpO8es6q1wi2yq2zJv5QrkHxpKfd72KoEq3VYpWxBfZPukz
         i/RGFjH8Vi/zeeILhy+kolvRD5eTMECdBWbrN/yZs1x7Z7cfO11wsPaZbWjj3HmdOhWL
         RnDQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
X-Forwarded-Encrypted: i=1; AJvYcCVXejzoFppAe2jhrgB1ljXIpBkPKsWuxRh8M8SO3fdkg6G1szCR89MNDcW/++J64X7e9VajMGF3vmIlOc/egAVd7TDlKuM4
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26-20020a05620a159a00b00785d5fd03a9si7397008qkk.93.2024.02.14.04.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Feb 2024 04:42:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raEac-0002bY-PN; Wed, 14 Feb 2024 07:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel@zonque.org>)
 id 1raBFa-0004Ko-CJ; Wed, 14 Feb 2024 04:08:18 -0500
Received: from mail.bugwerft.de ([46.23.86.59])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <daniel@zonque.org>)
 id 1raBFU-0002XS-VU; Wed, 14 Feb 2024 04:08:18 -0500
Received: from [192.168.178.97] (pd95ef237.dip0.t-ipconnect.de [217.94.242.55])
 by mail.bugwerft.de (Postfix) with ESMTPSA id A3818281529;
 Wed, 14 Feb 2024 09:08:06 +0000 (UTC)
Message-ID: <6e97c51e-44bb-4edb-9dbb-1bbc0524b812@zonque.org>
Date: Wed, 14 Feb 2024 10:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Stefan Lehner <stefan-lehner@aon.at>
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
From: Daniel Mack <daniel@zonque.org>
In-Reply-To: <fbab8e59-6d2d-4193-a5ca-9fea3c524229@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=46.23.86.59; envelope-from=daniel@zonque.org;
 helo=mail.bugwerft.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 14 Feb 2024 07:42:13 -0500
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
X-TUID: 0gxCbvQgwdbA

On 2/13/24 21:11, Arnd Bergmann wrote:
> On Tue, Feb 13, 2024, at 16:36, Guenter Roeck wrote:
>> On Tue, Feb 13, 2024 at 03:14:21PM +0000, Peter Maydell wrote:
>>> On Mon, 12 Feb 2024 at 14:36, Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 2/12/24 04:32, Peter Maydell wrote:
>>>>> The machines I have in mind are:
>>>>>
>>>>> PXA2xx machines:
>>>>>
>>>>> akita                Sharp SL-C1000 (Akita) PDA (PXA270)
>>>>> borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
>>>>> connex               Gumstix Connex (PXA255)
>>>>> mainstone            Mainstone II (PXA27x)
>>>>> spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
>>>>> terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
>>>>> tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
>>>>> verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
>>>>> z2                   Zipit Z2 (PXA27x)
>>>>>
>>>> I test akita, borzoi, spitz, and terrier. Upstream Linux removed support
>>>> for mainstone, tosa, and z2 from the Linux kernel as of version 6.0, so
> 
> It was 6.3 (about one year ago).
> 
>>>> I am no longer testing those.
>>>>
>>>> I never managed to boot connex or verdex.
> 
> I kept specifically the pxa boards that would be sensible to port
> to devicetree because they had qemu support. gumstix verdex is the
> one with the most RAM out of those; spitz, sharpsl and their
> variants are the ones that some of us still have around.
> 
> Robert had working devicetree support for some machines out of tree
> that he has not submitted, and presumably not worked on since.
> 
> Unless someone starts working on converting the remaining
> pxa board files to DT, we can probably remove them after the
> next LTS kernel a year from now.

I agree. Once the machines are removed, people who were actively using
them would be incentivized to work on a DT port. That's not very
complicated to do when you have the hardware to test, but almost
impossible if you don't.


Best regards,
Daniel


