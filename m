Received: by 10.28.173.206 with SMTP id w197csp311896wme;
        Thu, 11 Jan 2018 01:53:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBosSXRHfSWK7LbkSQx4nwOxHzU72wGPJy7t2WZxIJTTRcngk29zsWPfz8DNxnKsR6MKAYKK/
X-Received: by 10.98.20.20 with SMTP id 20mr6555059pfu.152.1515664405362;
        Thu, 11 Jan 2018 01:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515664405; cv=none;
        d=google.com; s=arc-20160816;
        b=anHeIdMln+1U9g/8uf2GS2osQVIYAP9RhQbZ8YenQ7+yb949PWJEib2SVAkxjxU6LA
         XRsWJujAwf9hd+d3KL9vZFPZO9qpZtyXFVTpM7qeIJvpJfg8CqTHmKusOL7FXXUCMNP6
         YTYu0l9/JtDNIPa4fsSnWp5vvXoOJY56XEabkgw7D93Vp9YVUjvYG66+z40Jy71cMmcc
         /hK9Ve3uDqC9YU/AyPDzNn489P8XWFGsdJd8EHAUv4zJxEW7t3+MvumU6yvLPhUnPoBD
         4oVXOSQ4by6uE07TVbkHrpTibfBPuvzcNH/VZTUdquKXijY6b1YKtayMbSLbuKizxsK8
         rokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Dfmj6r7YXJJVLwrplKWOMVMwQYZf7PSdUQiBBnuM4Zs=;
        b=mkB8DDtCdubFdXBRa7jHMX+NWRxjVL0fmueuHC4zGsvLRSigAQ179RS3qjNMLQi3jK
         5acX8K97psFNdYAd4aYf+BwGA+K5Yd4nwHseSpCuRe4fYjunYPE9W3jZUKnhvHqpk/lG
         HBMzaSvu5XMaF8/4BbeNY67jaMJmu8dc8m/96Z+5rXo++WgFpMSvQei1GhT0SM20r+su
         YHdI7jXty7qx/HY9BiqLJz+q0xA+IuUNKcZno1UUca4JeiWZinMYVkPMN7JRcudRdqld
         yFFj7rlAZWL76IsBy9WBtwEAVLEeUpuMhVEphDhWGnlSSS/OeqxDmnpSuNiDRiREZaGW
         aqIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuYim2d5;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g7si13657939plt.672.2018.01.11.01.53.25;
        Thu, 11 Jan 2018 01:53:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SuYim2d5;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754857AbeAKJxX (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 11 Jan 2018 04:53:23 -0500
Received: from mail-oi0-f49.google.com ([209.85.218.49]:37639 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754687AbeAKJxV (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 11 Jan 2018 04:53:21 -0500
Received: by mail-oi0-f49.google.com with SMTP id e144so1260088oib.4
        for <kvm@vger.kernel.org>; Thu, 11 Jan 2018 01:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Dfmj6r7YXJJVLwrplKWOMVMwQYZf7PSdUQiBBnuM4Zs=;
        b=SuYim2d5SBhgE74vRdbwsD8qS7++FhkD9D5N+qTjJzgjVboMdowXAuSy0UrI2HBmqk
         wW7Ftl2yVMEAy3YKmd4xp90xAikbOqytsyUZt/v68Hl9LEP2Frqiy5N2EHEISWF50lWK
         h6U0103Z9kk+iEjkQDgvUFiH/EEfdMZd5e5XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Dfmj6r7YXJJVLwrplKWOMVMwQYZf7PSdUQiBBnuM4Zs=;
        b=P4HzckhJ0qxIPNcC25MZmuTE56HKymVisEc4ECW/ShjxK+HNcJTriMRw9OqBZibVdT
         JEX1+px1CoT2Ct6crOE65Ri7217dxXxhGdIzC8yCGkJFLhlf3oSQTyt+Ojbmh0LDXNME
         jFoDCR6h0Cg7og0DGH30p8R3eSLKt5Xruk7lqKJlX1aH5BAYsp/6fspBuGu5xdETW2gK
         EA44Y3oWsRf+CUDx79NOdtYK9hlAjrGGNnqv/HuCTaKc3ztd8WU1OSEUtC6w7xU9iim3
         TClZtjy2D0LtzxEKFrbGDNZ1J3nUWYUIdv89/rCgXfTgq9wFjZWFCb1mrNU94t8rnfX3
         QB+g==
X-Gm-Message-State: AKwxytcXtmhSGH4t9lqah0m75L9RtxQ96Us8/onTkcaxrdYHY81ugciG
        wVeCAUE8wau+DPyAdIOuQsGtUzrj54uzWkEKbPMpLg==
X-Received: by 10.202.180.133 with SMTP id d127mr378355oif.328.1515664401204;
 Thu, 11 Jan 2018 01:53:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 01:53:00 -0800 (PST)
In-Reply-To: <558dc576-6d05-50d4-9f7c-73738e28ad26@huawei.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-6-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-RC6hUMR5jPrgOB7nkWjXaPxo6dYEXO=kgC=59k7EVrw@mail.gmail.com> <558dc576-6d05-50d4-9f7c-73738e28ad26@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 11 Jan 2018 09:53:00 +0000
Message-ID: <CAFEAcA-cAgB5TigMWUsnF74YrzWGToDht61HhOnGrSD1QBDNhg@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v14 5/9] target-arm: kvm64: inject synchronous
 External Abort
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Xu Wei <xuwei5@hisilicon.com>, qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: h2F7+f20q8Of

On 11 January 2018 at 05:59, gengdongjiu <gengdongjiu@huawei.com> wrote:
> Hi Peter.
>
> On 2018/1/10 1:30, Peter Maydell wrote:
>> On 28 December 2017 at 05:54, Dongjiu Geng <gengdongjiu@huawei.com> wrote:

>>> +
>>> +    /* This exception comes from lower or current exception level. */
>>> +    if ((cpsr & 0xf) == PSTATE_MODE_EL0t) {
>>
>> This looks like it'll be wrong for AArch32 guests (which you can
>> still have with KVM with a 64-bit host), and even for AArch32
>> userspace in a 64-bit guest. The correct way to find out what the
>> current EL is is to use arm_current_el().

>  sorry, in the OS(include guest OS), for software error recovery,
> we only support AArch64 kernel, not support AArch32
>  kernel or AArch32 user space.

Nope, you must handle AArch32 EL1 correctly in some way, even if that
is only "this guest CPU doesn't support RAS notification and we
will not notify it". And you must absolutely support AArch32 EL0,
that's a requirement for getting this merged. It's not difficult.

thanks
-- PMM
