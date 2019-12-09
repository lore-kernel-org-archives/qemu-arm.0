Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4539535lff;
        Mon, 9 Dec 2019 07:36:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwtC1XRoUfzwBssbmyLrpPtKFdOJp1unfKgXv756PhgHxUMJ9j48xKtFkQVd8ltgH6Iy4Qo
X-Received: by 2002:a05:6808:618:: with SMTP id y24mr23700895oih.86.1575905804316;
        Mon, 09 Dec 2019 07:36:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575905804; cv=none;
        d=google.com; s=arc-20160816;
        b=FernLB41Y/6i8CW5qydZlx7un/K35DPzYR4rBEzyRIJOhDGhHxsbX4OMIDypbPRS42
         bn2pbBUHalqa7MfIcpgM0xlhoc7w/OdE0IBqBvCer5w62xKDXuI2qZk1QDo67kd6fSRo
         QyEVzGgj1NZVz4D2lZneXT+4l0hf71Jd0YwlxQf5+/xf2F4jcTThqGGpsnEXKlwoz5Sw
         cDLGWqR4s4e+a74wW1SYbN1asP6Tqso6XJpVpM8Wz6zdKPeyXPOGUA22++cbLXp1wSjl
         249hDb4QBvEB5S7TqXYaXsdlDEcFKKBm0e7g0My2Wn+u2oTC4mFVdGXp/3gVU8nkOO5z
         yzSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B/DiSn6IfMMoE4lSKlBr9f53VlL1HEB43qNwHBmaFqM=;
        b=InO2cH75/m7kCpF3v6T70JEC4YcGl2uwepuapbecFwyi3eShVGln0SKb2EF2rRnIkl
         VysFYD/SDlp6kBBjutwn08J7ah9dIinWW1lltmnnj9hbiwLODJSOYmg18nwb4mCFZg96
         9r+l5Nov5e/XeGdC50wZhfa1HTWhoEtaYG++uZFG4M5n5cLiUlU7RK2ZwuTooPan2RkK
         J2MI5qHn10a+6hlbIibsmlsdSavHRDhGG9Jlw6upZQokRRnqA2UYRmcTJV9fizFCeVlJ
         wZuRQxs0uvUD+N5KXoxAS1yg0Owech4xkHWtUOMFIN9Y0q/FGC5F9PKE950CMjEj1c1g
         zu4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGc6FIL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si11843953otr.178.2019.12.09.07.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 07:36:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGc6FIL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieL5X-0001Dp-88
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 10:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54770)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ieL5L-0001DG-Aw
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 10:36:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ieL5J-0003Eb-St
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 10:36:31 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ieL5J-0003EJ-Me
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 10:36:29 -0500
Received: by mail-ot1-x344.google.com with SMTP id o9so12540673ote.2
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2019 07:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B/DiSn6IfMMoE4lSKlBr9f53VlL1HEB43qNwHBmaFqM=;
 b=mGc6FIL1iPR4gvfsEiF+YLk/SoCjjcew12B9l16kkPcJHVwF0n50iXz+UC7h8uJe9V
 TCjBML3e+7g0BCeNp9A3gXcA4WjW8/eQHB7evaPX7fcMetpGYO+NverK9d/JGPB2oTE/
 K5mTITjl40RLnTfpAhuDl5ZAUuWX1FNAs1mIWw8hdVMiWGIGxJnAOLIqihU9uuIvyuIz
 KMs6XNL4p1lu4oD6p4m/bxHkv8O33n2Ak6twroeqFrN+GrWldt9BrQsLLZLeuR0Rqdzz
 TbZiunXtT4kWY3NG2cK9CNm9BikS+UEl2jQt+B1yJXEZwKcDLJtgWBV2RtRkfwp++1HN
 vBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/DiSn6IfMMoE4lSKlBr9f53VlL1HEB43qNwHBmaFqM=;
 b=LW2uZz3gMCjIPnId9t9pl7JASqFFtaBYAjt4DM8jQYbMTQxRRcBf8UXxrx01J7aeds
 ZFFMkvtbPTa1lEd20HC9XHmc3tnEaEho/aBmpKxzWAnDO6WPiXVgs87sUpbtDcJOulzU
 u9wwjIRtXiV352kgxm+fol3TZi31osoVjTxM67hzjgCGPd5wPKWNQq4Ni8mmJ/JfAj8d
 JewhywFSNYtaah7iGO91mm4EhuI6/AB6dKFHNqCMbX7XwzrJB7Gt4UHqz1Jv90PDP/am
 Pwh9Rgy95t0i3gedcAlTu/bv8PKkPxgqoRnuvzu95g/ZbSlGklz731ZHL65RWGVwlF9v
 d11w==
X-Gm-Message-State: APjAAAVBvmF0MzARW2HCY0sqzjkIkd/V1TR/Gtv8Zd04fKn5cOGHYIMA
 iSrFDoPtb1FS01zxKrC6m9+n4nr9NlLDttVxDeUeNg==
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr20302350otp.97.1575905788255; 
 Mon, 09 Dec 2019 07:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20191209152456.977399-1-daniel.thompson@linaro.org>
In-Reply-To: <20191209152456.977399-1-daniel.thompson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Dec 2019 15:36:17 +0000
Message-ID: <CAFEAcA-sgFKev2MiOjRAzuE0trNYQoNe6LOFLeghGm73N1h=SA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Second uart for normal-world
To: Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zB3PRe749sD8

On Mon, 9 Dec 2019 at 15:25, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> The virt machine can have two UARTs but the second UART is only
> registered when secure-mode support is enabled. Change the machine so
> this UART is always registered bringing the behaviour of the virt
> machine closer to x86 land, where VMs can be expected to support two
> UARTs. This approach is also similar to how a TZPC would typically
> make a UART inaccessible to normal world on physical hardware.
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>
> Notes:
>     It is difficult to add a UART without some kind of odd difference of
>     behaviour somewhere. As far as I could tell the choices are:
>
>     1. Move the secure UART from UART1 to UART2. This is a
>        not-backward-compatible difference of behaviour (will likely break
>        the command lines for existing users of the secure UART).
>
>     2. We tack the new UART on at the end, meaning UART1 will re-enumerates
>        as UART2 when secure mode is enabled/disabled. This is rather
>        surprising for users.
>
>     3. UART1 is registered and inaccessible when secure mode is not enabled
>        (e.g. user must provide a dummy -serial argument to skip the missing
>        UART)
>
>     4. Normal world can only use the second UART if there is no secure mode
>        support.
>
>     5. Don't support an extra UART ;-)
>
>     Of these I concluded that #4 was least worst! Ultimately it is should be
>     unsurprising for users because it is how most physical hardware works
>     (e.g. a trustzone controller is used to make an existing UART
>     inaccessible to normal world).

This change looks simple but it will break booting of UEFI
in the guest. Unfortunately UEFI enumerates UARTs in the guest
in the opposite order to the Linux kernel, so whichever way
round you put the extra UART something will get it wrong and
stop producing output where the user expects.

I think the conclusion I came to was that the only way to
avoid breaking existing command lines would be to only
create the second UART if the user explicitly asked for
it somehow. (Possibly just looking at "if there really is
a 2nd serial on the command line" with "if (serial_hd(1)"
would suffice, or perhaps not.)

You also need to do something to add the 2nd UART to the ACPI tables.

(Very out of date and broken patchset from last time I looked at this:
https://lists.gnu.org/archive/html/qemu-arm/2017-12/msg00063.html
)

thanks
-- PMM
