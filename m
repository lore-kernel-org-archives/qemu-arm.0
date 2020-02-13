Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp444421lfp;
        Thu, 13 Feb 2020 02:31:32 -0800 (PST)
X-Google-Smtp-Source: APXvYqwdDE4mPgtuMqQyHYVgi0TRyX7IhiWRSJ0iG6in07seMcnI0givDtqmIghzCjb7WilqV1aF
X-Received: by 2002:ad4:55e8:: with SMTP id bu8mr23672037qvb.61.1581589892060;
        Thu, 13 Feb 2020 02:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581589892; cv=none;
        d=google.com; s=arc-20160816;
        b=Fju8nDubniY2N7H1UdaSDOvR8l0FDhcSVNzPXJKgJ6oMiqkIjJPluZ4LzECszwUF7C
         vBooU9LDITyfYB3P4nbt2ylPDuDdY74oKujhhJoQSVGsWYTj/a9FYEntdMTzMdcPEH8Y
         FBzxqJtYZJuic5YOT62fxfS6H1Two7tGknnIz8iio0PaqQ53hyItz5PUuwCfVZLdqnhE
         +uUHwsEKtNZ9LPgOknuE8SuWjCVzPCb/C8cXoBi0Q7l7ErAKsQ7CK3SHxD67EiNBNNmZ
         V00FxvgPILNd3/z7CeBgvm1akZsai6VmKk1WDfO4+l8O3MEtdbAvD5/DT130C4COPHzo
         QTng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vPnIuKWia6CtJo/YREmFI/mm5v7pZMNAaOW40R6D2Ns=;
        b=Z/G9m9hiSy1GnO5C0Mcco/G0hfAsEli1um4nqJbqn9x/ZUPdvzMh2S4yCsXOFrjTQf
         g7DC9a0iapCcmQ1v4whoQ22Vzdfe7+v4xPCE0ZOLQ6hem44ka/F3lkYb6vRXqZ1Kx2ov
         QZnZVA4WbmpAObJP6S17O53sIzOwxhfGuopgFtoIz+4OSbsCn/SpZAzIDB9AMFDUsS6/
         IuRUJj2+eSipUIq/l5PUggn5GwpMOk91coG2T4/zZaU7RSng8RKdidzErQjK66F6jK7m
         JZZ/Iu4TdUFGiuE/bWAGNQgjHK3nVmBARcvCR0cF8HGHETeNRYoC3HCiwDisJoZujbob
         TAjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eVcpgn00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si970462qkg.169.2020.02.13.02.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 02:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eVcpgn00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2BmN-0003vy-Gf
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 05:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53138)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2BmE-0003to-By
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 05:31:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2BmD-0002Ko-26
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 05:31:22 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35584)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2BmC-0002KU-QX
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 05:31:20 -0500
Received: by mail-oi1-x243.google.com with SMTP id b18so5293049oie.2
 for <qemu-arm@nongnu.org>; Thu, 13 Feb 2020 02:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vPnIuKWia6CtJo/YREmFI/mm5v7pZMNAaOW40R6D2Ns=;
 b=eVcpgn00J+RsZe2gGNKpbbdSQkF1wuxmdlvxLdD3/IzWjF4VP2dg30aI96NOc+Dw2J
 xn6HCPxRDU3sTSSWgdxSIo7jEQ/RgOBlD4o8EHK2uqZ0WTzeOSnhZN0+IoIGlPIteEct
 92Tze59B05hWhuI1dY8z3/aXfA9u+ppEc6GZNc6ebO9sMJrTjyhjTemTqqjy3c0t5iLc
 1yVbCSec7loZpcESoILVGGz/AG9zFXVobXmXszNymM0/durYCNh1uj0rp7YJz+G2b6Rb
 q9AfFpelCGs9eg0pUNLqdjeQoZeAkv9shGIOYH0E5UEFms3PZdwcI6UJeLhFDOKvoaw/
 Ae5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPnIuKWia6CtJo/YREmFI/mm5v7pZMNAaOW40R6D2Ns=;
 b=GpnCXKoitkE1X0kflz7sU4RzAcLAnVqLp+rnxgkVw3NnvNcl1M//55r5tjC4oljIlE
 KdcyqejHxmA9Bbg0VvO24lW50SV5BLYAxHi62jsQMn40PPA1/J7xL7xcvybtkyWJcpka
 KfhY9bCYs+Q1P7LohNLa7btEirddqjC52Y1Pnj5lC1yf4K+dGn72Jwoo1ZMdGVXp0I+M
 1PaAXcQ36RaAXgk14xKVOqGN4Q4fySNGH7iE0cuUo8QcnIYl4DNCkKZEHlsCL5p2njI9
 qp/kwQvgapChw/7OBCFi92wlNJwNOlab8mSIThljuB4zmixqsekDKYqYezYrkXY10YfS
 frRQ==
X-Gm-Message-State: APjAAAWAwFf7wXJr0vWXipCEyJVl5yR7kqm8OU26MdiG3TqFAWPOIbLh
 bElPIZk+wUPmQDVUCiAV977RcosMsFnuI/Pi2jRa/w==
X-Received: by 2002:a05:6808:3b2:: with SMTP id
 n18mr2312819oie.146.1581589880051; 
 Thu, 13 Feb 2020 02:31:20 -0800 (PST)
MIME-Version: 1.0
References: <20200205110541.37811-2-gshan@redhat.com>
 <8dce7dbe-c6c1-122a-f960-0fc29257dd1c@redhat.com>
 <CAFEAcA-RiVfrFFkxppB=z8x76rjorF-5onyGwVAdsHY7W1U88g@mail.gmail.com>
 <21e4051a-4d06-03cb-6d8e-5331b5b570c4@redhat.com>
In-Reply-To: <21e4051a-4d06-03cb-6d8e-5331b5b570c4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 10:31:08 +0000
Message-ID: <CAFEAcA_zyMgG5SQpVCwUTx3CyU=S=enSZCLCU=2NurukHNM=AA@mail.gmail.com>
Subject: Re: [RESEND RFC PATCH v2 1/2] target/arm: Allow to inject SError
 interrupt
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Andrew Jones <drjones@redhat.com>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+P5uwCHkeKy

On Thu, 13 Feb 2020 at 03:49, Gavin Shan <gshan@redhat.com> wrote:
> On 2/12/20 10:34 PM, Peter Maydell wrote:
> > Yeah, this is on my list to look at; Richard Henderson also could
> > have a look at it. From a quick scan I suspect you may be missing
> > handling for AArch32.

> Yes, the functionality is only supported on aarch64 currently by intention
> because the next patch enables it on "max" and "host" CPU models and both
> of them are running in aarch64 mode.
>
> https://patchwork.kernel.org/patch/11366119/
>
> If you really want to get this supported for aarch32 either, I can do
> it. However, it seems there is a long list of aarch32 CPU models, defined
> in target/arm/cpu.c::arm_cpus. so which CPU models you prefer to see with
> this supported? I think we might choose one or two popular CPU models if
> you agree.

I don't think you should need to care about the CPU models.
We should implement SError (aka "asynchronous external
abort" in ARMv7 and earlier) generically for all CPUs. The
SError/async abort should be triggered by a qemu_irq line
inbound to the CPU (similar to FIQ and IRQ); the board can
choose to wire that up to something, or not, as it likes.

thanks
-- PMM
