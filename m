Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp274841lfp;
        Mon, 20 Jan 2020 06:37:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2SJ+Dw6O2t/qYXNMafrAwM4lGiLG9RJkNf5QAjGh4/SIWaKnu+62/GpYoUZ9AB//oyOAw
X-Received: by 2002:a37:6047:: with SMTP id u68mr48132376qkb.389.1579531035254;
        Mon, 20 Jan 2020 06:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579531035; cv=none;
        d=google.com; s=arc-20160816;
        b=bJIFS5ZfED41+QTh92aDIfGY1jsfo2hZ/Y1IxapOlEJ7aIeMElzjmkIe1WRIBl0Ome
         X9WPvYqffgr2ygeAKUPE4dAZAwpYqYkuHwSjRWuTAjoa2kN/DzQPgiUdz7LX6WOxYmON
         JscrDeG8GM/FKHpxN9TiKczkW0kIKtHWW7oFyC2/84d3fpZS778bC+BE+9NEU4fjORC4
         WFq8fqKzwp2QF2y3Nkf1bLNA+6FXQikvXT8exzTJva/f5ue05lUoKvzb3M/JY43pQoUz
         fX9noUL3FA7QSoGQlRi1HWMX9+yhOUH6b3yJY/mW2ohoTG9ScWzQqCofMVcoVx1L+lPe
         mKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=znlMZaoDSxa/NOLijW+/RJsZp6cxdD3KLBVjU0LI0cw=;
        b=u+L+B0cl5AAt71a/yzwbt35V9DhLxjrzIY4wf5tAvIxBvspwEr8+Ll8WBqaCvoiOPB
         I5W/teoGAc8K4T87IA2/UrGnjVonBQrHZCWW6Fx4EIgBuBnWSClggpNqQCkWVcgzwlEL
         XYbG2Lq4OYgmTc82Wt7fczvO8saR3tAanQtq1/rg9HdJIwz5rCiR7fZ1IYYB66d2Zlt0
         BRVc7Qdh4/md04c48ZmlLtguSDoTAs49Wjb2Bjdm+1jT1TzP04gcAloXJCxLDXmNCGa2
         h1Fwnc/Q1sjxTwXH3BOkHY3qugqa5EbVkl33EB4E6SuKGzT3rwutLIK4OAjlROwTFcwf
         KHGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SJmSOa2t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si20113265qtg.71.2020.01.20.06.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 06:37:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SJmSOa2t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itYAz-0002cr-VB
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 09:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1itY4Y-0004f2-NA
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:30:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1itY4X-0003yl-Lg
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:30:34 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45545)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1itY4X-0003wk-E2; Mon, 20 Jan 2020 09:30:33 -0500
Received: by mail-pf1-x444.google.com with SMTP id 2so15939963pfg.12;
 Mon, 20 Jan 2020 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=znlMZaoDSxa/NOLijW+/RJsZp6cxdD3KLBVjU0LI0cw=;
 b=SJmSOa2t4a2J6FLlQuA3+5mocrFAfVFGKJ6J/FXfsBV+/dhwbAqK9slwd7eUetCf5X
 hdYKMnKhMAlpKivQk2HIsDkj/FVGnYJvvAcHdqeEpW52XTpCqLS5J97dKS9xZewcn/S+
 Qou848fvJa4tYvmR1kPHCEBSUjo0uwdthxNdbrp9nlDtMHJlQ1kVpCYuL65/skqw5lRb
 MVcjhPIsBDpqbUvRqeQmUEBnx17yXr6/kvQKPFPVS1hdBZRANerMDo7FjBq2rrSmKSx2
 yhcSC+kxXh847MRhzhvWmu/pkW84h31wR8IEh13YUcYqjgPskGBREVJcIzW7mDWvP7D6
 6/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=znlMZaoDSxa/NOLijW+/RJsZp6cxdD3KLBVjU0LI0cw=;
 b=dLxW1oQSzgPk/s7nq+lWpvDGamQqL/Lv7CxONM2lrIPvxQ4zLQDY+bO/itqU73hSu8
 L32w5eKO9mr2bO6C7yvDuD3mIlZCTMOfiRgY7/69BFyvP7YigbBT053GLw8NiuXmY4om
 ppYQBPCdqWNtR0AFOHFqRpQs6Gyxdx+hF6U6DPcUbxvAn59jZVWd330qPmDXM6ymocsl
 9Fexccz6LfEAnIqoGuaB7HVLXgbHzqjDbb/NSVwq7JvsWRPA3po1/55+yhVum6CsJknT
 MOSBaHeh22PfZMKN6TRanvfaXco4hulKDIsnjq7lNN6IBm81LQmJC1M02Y8YCDLtNNq7
 t+ZQ==
X-Gm-Message-State: APjAAAUvYN2CSjyZYuiE034ZUfbfmRdtTQH0nx8GrhuhUra8+SkAQASf
 RD8P9IVMQhNsMJbTvmyJPHgmuQ+F
X-Received: by 2002:a63:d807:: with SMTP id b7mr62630742pgh.52.1579530631392; 
 Mon, 20 Jan 2020 06:30:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d14sm41400847pfq.117.2020.01.20.06.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 06:30:30 -0800 (PST)
Subject: Re: [PATCH v2 2/7] hw/arm/exynos4210: Fix DMA initialization
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-3-linux@roeck-us.net>
 <CAFEAcA8yH8deTL6PrX42Lh_TbR=gx4QbukuKUOo1XgLod=2ZXg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <526c74cf-bbaf-2c79-08ec-9472288aaa59@roeck-us.net>
Date: Mon, 20 Jan 2020 06:30:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8yH8deTL6PrX42Lh_TbR=gx4QbukuKUOo1XgLod=2ZXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JV8K/EVZWe5G

On 1/20/20 5:35 AM, Peter Maydell wrote:
> On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
[ ... ]
>> v2: Use interrupt combiner instead of connecting all events to a
>>      single interrupt. Limit number of events per DMA channel
>>      to 31 to meet qemu interrupt combiner limitations.
>>      [Not sure if "assert(s->num_lines < MAX_OR_LINES);" should be
>>       "assert(s->num_lines <= MAX_OR_LINES);"]
> 
> Yes, that looks like a bug in or-irq.c -- it should be using <=,
> so 32 is permissible.
> 
> As the comment in or-irq.h notes, we can safely simply bump the
> #define value without breaking anything if you need more input
> OR lines than 32.
> 

Yes, I noticed the comment, and I did that initially, but then
I noticed the complexity of actually doing it in the code
increasing it from 16 to 32, and decided I better leave it alone.
I'll add another patch fixing the check and use 32.

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 

Thanks,
Guenter
