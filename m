Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4459491lfg;
        Thu, 27 Feb 2020 05:36:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqxFBP1ms2nznUPQ3F8B+pGKiQggvWo4qYr38TJVDtJhRy6QvlVYXuNoanc96BWdCcSpKcVu
X-Received: by 2002:aed:2e02:: with SMTP id j2mr4828631qtd.370.1582810563016;
        Thu, 27 Feb 2020 05:36:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582810563; cv=none;
        d=google.com; s=arc-20160816;
        b=KDPj+MPUK3UCT/fxhBDukf2mco4wabBn8hD2fjQevx735VbUurGk1nyH52pOw85sc8
         gat5x1jGk/B8asq+qKQBcJa0v16wSPzLYdUfyj5MlZP1+An1JR2JdKS/svlgdD3d5gok
         /N8H2Or/Df9YrzQzkD8nK/oosC3rxHoOGfoZsWqV4GYwVE1cmpAp6hac1MKQisIJ6mZc
         J6ECOPmiQpIbTt5EuKQDapfybLIKGrLCwgFfXX2nRGYBLQbAy/Z24QpJ3nm2+nnQC0by
         8JdfOfyuUnMH6/U12WQgQoXByJhLOtNaPWxa2t7XU0fBIw54zXG46reyFC1M+5yPwVri
         u1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lCEUskl4uu1OGcqBGj7gYZfwAshd8p11GbZWLvHd+/A=;
        b=b9UjXiwG5xkKWNKpVc2bwqP88RCvPuDLX2EzOGvrIUoLpsw5xKTq0OHpPeyKSlPcCb
         3AXXxs24uZjObUqM+2xefcEtSwfRYIfiDj9qaQZBaj62XBM8KbVaF7TKAkOJ1rhohvuV
         6ROdABuzIh0ETVxw7SMRx50aBY78YgHt68FypWvfPKtdzt9GQtla4z5Bj6/7luayXFvY
         DoR80o6VkpgKVXa06O3MPxHDR+oxbqm/ZaY+HMr/IXDPiUP/LxqXlkZzgTbzrmB2c2lf
         BOjybJrrhdk0yy6rlEOwqnlOxFGvgQQ3o4ocLbS/n7CKtskbYOO3McA+LxYbc0J+B22v
         lN/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DKpDfYCT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si1410595qtp.161.2020.02.27.05.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 05:36:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DKpDfYCT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7JKc-0001bd-FH
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 08:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7JKL-0001Sb-Kp
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:35:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7JKK-0008PO-Hz
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:35:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58287
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7JKK-0008PA-Cy
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 08:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582810543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCEUskl4uu1OGcqBGj7gYZfwAshd8p11GbZWLvHd+/A=;
 b=DKpDfYCTrd3laIQARObOTq0LhCtMatRShr7B5ot/AJVb6VGBfnJpvyFdr+ws1nXVoF3oLO
 //q2gZHBcYlV4GHBLuy/pSNlUJFYaZzfbU220E/3qLtKComdEOjFRuiA6Z1H2DBS4MT+Ek
 QoI9haHJ4PkddTWrqPoT5BJX8nzU120=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-Hwsat_36Pae8JUmA0HZSWQ-1; Thu, 27 Feb 2020 08:35:42 -0500
X-MC-Unique: Hwsat_36Pae8JUmA0HZSWQ-1
Received: by mail-wr1-f69.google.com with SMTP id p8so1321034wrw.5
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2020 05:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lCEUskl4uu1OGcqBGj7gYZfwAshd8p11GbZWLvHd+/A=;
 b=WzRS4tRHUcwMarVnzG8GBTS09NIgVqf0blTV90GgtFerQb9PxdlgHEvOc6DVsWzism
 MqG0kKTd7DwfWbBm8C0M2Um2owaXt9vaiZorHSru0t/2y05pRQgowYbwX7LVHKUlDB1Q
 VSowfgmnjgA9EOdua5B/DOejXGrXgGTeRfnCE4QcVkWmMExzCHUivBwxZfZE2QXB8WeJ
 3Om3wUgAbe+4ACnSVyOeYvFm/qWEH4O4EPHPLpueKKgkVPKzdvqBTU9KBneKAs18CCVY
 oCHxJ+vCK7HCt+lWrqAhi/4jCu8L7VKyHg8053Q4E+gBT1JI2xZmvQB0O98gtNqCZpNi
 T48g==
X-Gm-Message-State: APjAAAVg2GFC4JROuZqY5OE1tdIL6cSRu5JE8e/gq6P192t7uw2Yp36+
 bY+fzKmsjwc/Rdg6R8ix3R6d7mPkZNEG5spIOnnUAZ8w2iCL5z6qFP6wEH3oeGfm9MGZj+nyY0S
 6uy3Qc/kaZN3/
X-Received: by 2002:adf:f611:: with SMTP id t17mr5273783wrp.38.1582810541070; 
 Thu, 27 Feb 2020 05:35:41 -0800 (PST)
X-Received: by 2002:adf:f611:: with SMTP id t17mr5273771wrp.38.1582810540829; 
 Thu, 27 Feb 2020 05:35:40 -0800 (PST)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id a9sm8595625wrn.3.2020.02.27.05.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 05:35:40 -0800 (PST)
Subject: Re: [PATCH 2/2] hw/arm/armv7m: Downgrade CPU reset handler priority
To: Peter Maydell <peter.maydell@linaro.org>,
 Stephanos Ioannidis <root@stephanos.io>
References: <20200227112617.66044-1-root@stephanos.io>
 <20200227112617.66044-2-root@stephanos.io>
 <CAFEAcA9qbndHqoW1oaUAKMZY5hNYjP+mMt-K_WqoT9Z=Q=ct7g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e1813f57-57ac-e6ad-d119-dd6c2cdc90e1@redhat.com>
Date: Thu, 27 Feb 2020 14:35:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qbndHqoW1oaUAKMZY5hNYjP+mMt-K_WqoT9Z=Q=ct7g@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /9cok2Bj9u2j

On 2/27/20 1:13 PM, Peter Maydell wrote:
> On Thu, 27 Feb 2020 at 11:27, Stephanos Ioannidis <root@stephanos.io> wrote:
>>
>> The ARMv7-M CPU reset handler, which loads the initial SP and PC
>> register values from the vector table, is currently executed before
>> the ROM reset handler (rom_reset), and this causes the devices that
>> alias low memory region (e.g. STM32F405 that aliases the flash memory
>> located at 0x8000000 to 0x0) to load an invalid reset vector of 0 when
>> the kernel image is linked to be loaded at the high memory address.
>>
>> For instance, it is norm for the STM32F405 firmware ELF image to have
>> the text and rodata sections linked at 0x8000000, as this facilitates
>> proper image loading by the firmware burning utility, and the processor
>> can execute in place from the high flash memory address region as well.
>>
>> In order to resolve this issue, this commit downgrades the ARMCPU reset
>> handler invocation priority level to -1 such that it is always executed
>> after the ROM reset handler, which has a priority level of 0.
> 
> 
> I think we should be able to do this with the new 3-phase
> reset API : the rom loader reset should happen in phase 2,
> and the Arm CPU should only load the new PC and SP in
> phase 3. It's on my todo list to write some code for this
> to see if this theory works out.
> 
> I'd prefer it if we do it that way, or alternatively find
> out for certain that that approach does not work, before
> we add a reset-priority concept to the reset APIs.

Agreed.

> 
> (In particular, this use of qemu_register_reset to arrange for
> the CPU to be reset should ideally go away in favour of having
> the CPU reset handled by the SoC which owns the CPU, so it's
> not a good long-term way to look at trying to fix ordering issues.)

It would be nice to get ride of qemu_register_reset with the reset API :)

> 
> thanks
> -- PMM
> 

