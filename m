Received: by 10.223.159.74 with SMTP id f10csp2709277wrg;
        Fri, 22 Dec 2017 12:59:54 -0800 (PST)
X-Google-Smtp-Source: ACJfBovqevKd4sTfc3atQD/bHFFQHLxAS2LbHgm8+47nDdrNtG3mr9mI6w+x4ucDPsKPQmO3KbZ3
X-Received: by 10.37.78.67 with SMTP id c64mr11486661ybb.289.1513976394529;
        Fri, 22 Dec 2017 12:59:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513976394; cv=none;
        d=google.com; s=arc-20160816;
        b=KtM3EpIaKkXXqvD030qxc23hEz4IvidXHEG/P5nZak59QeaIc6akxgJcD8uVvkyXIg
         wleNFPf0XQQjfDJfbPHar/MO+/gxgX1VaIOgiEshQ1e487k0t41tdCbYRUksMnaxT3q6
         XPy4LT34wekwAK5QTuzzyXxJ/gxCPITsQH6o0Xdws76Mb6bkc7Wy38x76/dd2BGthJb0
         dJ6dHr4rh88fwGvnxd6//ZV4TEmGU2C7zlw7q8MMWPQHOvX5Oc0pyY9/3pGcYk6MYe51
         bK/7JVAvLq2aRGOTJWvHX4gXc/HLzu7XzXSMWuwv3IcDGqA0SoPZ6BzTK2O3e8HVPrF7
         1kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zJUcQGs+ruiMXsOhPkuDcKbnvEKK5r82yTZYIHGE1Yw=;
        b=TjXseimr1Rd2JJ51GXLG1NKB5Gtaow4tudWJ4fKox/243HCGoivixIqIuKP/Z7VT91
         /BoN4K/DsVDb3lX/mW/+eNKXa/TuEMxeFfZsxEhGWWvfU14FI9NmSLodjp+Teoh1bJxL
         pRaFnHP1waxpJ1/mWN/+reb/xcW4HVVIqZSYNGY9LLk60kug2PR2UhPan69VJ31pHxUs
         GefEXcAayDwLQ6hZMLnyKvNejXnVxpmUEGwXCmAZP6K0GckdcgXb7lGBqshDdhKxb5Hf
         kr6IFyKwab9G08r+y6Esx7TA1MjWphO9W6QHVr1Ns/O+Jt8eeFS32S7fc5t3hmrtxi/N
         yypA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VpMilG7C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g20si21367ybe.528.2017.12.22.12.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Dec 2017 12:59:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VpMilG7C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eSUQ6-0001qq-2E
	for alex.bennee@linaro.org; Fri, 22 Dec 2017 15:59:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eSUPg-0001hV-IK
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 15:59:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eSUPf-0004kp-PX
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 15:59:28 -0500
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:40280)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eSUPd-0004in-Ci; Fri, 22 Dec 2017 15:59:25 -0500
Received: by mail-wm0-x243.google.com with SMTP id f206so23673560wmf.5;
	Fri, 22 Dec 2017 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=zJUcQGs+ruiMXsOhPkuDcKbnvEKK5r82yTZYIHGE1Yw=;
	b=VpMilG7CLsRsZglWV3FEgNaBjEz+eq7uEQoNT2muK/tsOVbQiwGHVtOx31yC/NHhxI
	h+mA882LtgUvMExSK0Ac8CgK4YUYokyoW4gXVOAGWWdbmYzeC9Y7A9Ttf6/rpbL1EP78
	68DuI0Rpn5MgN7BGgOohppFr8/XYn9/XDj3uIBZwxztCP23crUaTdd3mZUBuuKtjRara
	Xews0TqxTPBozsv6uwKE+9cYt+lGqUVDTESQpOGP0bf7gLSmy9mG387TGVyL4GkbICPJ
	eCfdsL2OZdamYDEmwqXwe4KXJj4nuz2MYqxcqvX6n1TtOQaWavIwPJg66BRdY6A9Wzq5
	Ih+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=zJUcQGs+ruiMXsOhPkuDcKbnvEKK5r82yTZYIHGE1Yw=;
	b=thNx4DtX+I4kF1fYF+S1UQqPGrqefFgvEKOCkcUFBlTGTjZdJIl/UtrOMB8NMcLFn4
	ZdU2CYlMaKacFeDTbhNo4bInfsUSRMKBSZqmZQ0CzSctv5qkGpPuv8DDyqowqTDdnWkn
	BUHpV+uIO8mh/pkJHAXEXJsyAIknfv6SW6EXOZQErYX64e/JcakLw5zEtnx8v70Pcxpw
	X1BPqMDLPU/O3agznMewl9vfMUY6F4E4C4MSpPbEd8yaJ1s0RiJEcA8KKZbxHa3CZb/p
	V5nIm8kDBRQst9bSfgdhz0AFF/pZpyrwYmjUbCQSZsmVx6GwS8z8lU+h6unYAx+DBIMT
	Hsjg==
X-Gm-Message-State: AKGB3mLXbqIHh90sAA4cE8YTRqJmUpyMrubBlEPW1m7LIRlGWX/WD+dw
	DA6KA7qEHBwR77hlidugt38zuui7WB85XMGSI8w=
X-Received: by 10.28.152.85 with SMTP id a82mr5288253wme.16.1513976364077;
	Fri, 22 Dec 2017 12:59:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 22 Dec 2017 12:58:53 -0800 (PST)
In-Reply-To: <87a7yah5ea.fsf@dusky.pond.sub.org>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
	<CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
	<87a7yah5ea.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 22 Dec 2017 12:58:53 -0800
X-Google-Sender-Auth: Ynerlr-hRCktSNHZPb-Z-vF_tPc
Message-ID: <CAKmqyKO5sKdiZJ65teDxa16PCE71WCLay7cOAQJQdyS-EVNOJg@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IAOwAfUFAJzZ

On Fri, Dec 22, 2017 at 12:30 PM, Markus Armbruster <armbru@redhat.com> wrote:
> Alistair Francis <alistair.francis@xilinx.com> writes:
>
>> On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
>>> On 22.12.2017 16:37, Markus Armbruster wrote:
>>>> Second thoughts...
>>>>
>>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>> [...]
>>>>>  #include "qemu/osdep.h"
>>>>> +#include "qemu/error-report.h"
>>>>>  #include "qapi/error.h"
>>>>>  #include "qemu-common.h"
>>>>>  #include "cpu.h"
>>>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>>>      /* TODO: update clocks */
>>>>>
>>>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>>>> -                        __func__);
>>>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>>>> +                     __func__);
>>>>>  }
>>>>
>>>> This one's different: we neither exit() nor return a "failed" status to
>>>> the caller.
>>>>
>>>> We get here when the guest writes something funny to a certain
>>>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>>>> a user error.  I doubt it should be reported with error_report().
>>>> Peter, do we have a canonical way to report or log  guest misbehavior?
>>>
>>> qemu_log_mask(LOG_GUEST_ERROR, ...) ?
>>
>> That seems like the best option to me.
>
> Suggest:
>
> 1. Keep converting fatal errors (the ones that exit())
>
> 2. Keep converting recoverable errors (the ones that return failure)
>
> 3. You can leave the prints that are neither alone.  You can also
>    convert to logging or tracing, as appropriate, but that requires
>    understanding the code.
>
> Makes sense?

Does this apply to new patches after this series or to this series as
well? The series is mostly just mechanical find/replace. I really
don't want to have to dig through every patch to figure out what to
change/not change.

Alistair

>
