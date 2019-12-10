Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5984643lff;
        Tue, 10 Dec 2019 07:48:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzH9oDF/YditmeDvI/Z+MLR8untFvmJW/iffJnpTBGZquMt1osjRpZmLaO78n95xVJYftdx
X-Received: by 2002:a0c:baa5:: with SMTP id x37mr28173987qvf.228.1575992895471;
        Tue, 10 Dec 2019 07:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575992895; cv=none;
        d=google.com; s=arc-20160816;
        b=oanavmzpOFwGmBg7EvGudz5gSKnjosWkGNcA3CuUIrwZCkiGtG/gOIG0K1MSE21pOs
         RYKKJSF7aONgPHjY8a9zpnDuBQdrVyyTCjFj9HoAlfRziJkY3vmwqZJJ/zY2oy6Sytlt
         MK3acWCS1wZE8BB9t+Imjvz5zym5hEaL3Z3KLylGZMehScyfYDmHV6jupmiq19gj4vQC
         9eq0UvaLUsuMmxiWgr9v0k84uc1xqPnD/wYzUJneQwOUtu0hgtzR7ANkH/ae3pnzjsWF
         QT5n/cUCzxhRu3MMe5Kpe9jn/jAcZbQOg84oAQulBRRhbVNU35JSqbHO74uYE3/O5J2X
         asKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XPpi0vWeudD6eliQvYxFheqKFj6RhBHkYhtXnEujgKU=;
        b=0NbR+oJhfgW59kxm2uTAZA3TTa+g2LxhQvSI7P4BMynfn6NelodtZvESd4CMzVBjYI
         9VVgw7mERXQfs7QsFxVGo0f4e/mz45VToC5y3xh4fnldjR3ngtyOmfkFiNaY96XfsVMn
         qssJw4HDub9a8w+WGXnBI6p30khTIG4BL0fxJ6HG+JYsGJHeplKa0lPKKgauw7yiHu27
         CFt8bH9mXztV0NaEJCTL0ALq8yqc35IH0vzhuJxSMiJd+e3/RgP3sm39TAbpE3U+qaYc
         j7yblCS78IE1qzKyWkMBtJpk4wEc8lg2mrWZQkeu3eBo/GxwSiYqf2Cp/mj0sZ2rbPnm
         T6FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZMctcl63;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si2137414qkk.147.2019.12.10.07.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 07:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZMctcl63;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iehkE-00051F-I6
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 10:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iehjs-00050n-Dz
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:47:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iehjr-0003rZ-Fw
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:47:52 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:38842)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iehjr-0003qC-A0
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 10:47:51 -0500
Received: by mail-oi1-x242.google.com with SMTP id b8so10206698oiy.5
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 07:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XPpi0vWeudD6eliQvYxFheqKFj6RhBHkYhtXnEujgKU=;
 b=ZMctcl6378t/GTgCTqQheHWa40RYt9BQRLQFkr3hs7KrhmWKUnIRwlRQ85I+g2sXKr
 8KNkl/UEDjq1vBZf3lN7J/cpPcgsYZqdhfb5sxgeu3mpTtHgGbeVaTWctrtSqvU1hUFu
 GSL/h4jvj/Lk0dhgVWk936q0Ggly9hj8G0R1rWdcg3uliWT2P0OSG1sAPS4LlQZUZ6zP
 9R2bLQXUkOVb1tAFtHP/6QcRHp+ynmfs+vxmSaG1elnh5EXKJ6lqXmS+Pai22xzoygWr
 shzMPwpfUYpiNCM1Ziy6FrIaEaTR5pjv0RWHNRqSNtSpinfumFMOL1UWGIpzI3e8d93h
 /HMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XPpi0vWeudD6eliQvYxFheqKFj6RhBHkYhtXnEujgKU=;
 b=JuOOj+FmRkJcHnBnKjeQTI85uxN1d5oVHyN5WlqdW0/XMOvkFhxJDzAzV9BegRQxrs
 ADrvPoumOHXa71detPE1QEhDTipkdbtbW/XBScyTBcYp08zRrsuM6DFKD1yIvz6VFwOb
 hFvYAD2twg66wEf3oVoRPr+i9kQqq6xeHJ50dTc5lcG26zU2V2z3N7DtGqIWkZOroCQt
 bBqmfjXkdBVbsMCqdYscCRtW9eIfHQDsAzat+ivD156b1vxd8iUY7Rn4wJquZ9xElp5s
 4GBZUj5I/Ig70W+/FPBVTdQ1GQ48YOxoR/65bYzF/ZD1BXh6z/AWD+2qykDN1u5v9+B/
 wzFw==
X-Gm-Message-State: APjAAAXj6OsDfNEr7kMHH0Z8x38/yyuwq+yZmpxkxEobGa8ex7lk3Lb7
 M0X2wMGrdl59zi0e7fmuC1hhKprdEF9ceylk7H497Q==
X-Received: by 2002:a05:6808:996:: with SMTP id
 a22mr4257367oic.146.1575992870184; 
 Tue, 10 Dec 2019 07:47:50 -0800 (PST)
MIME-Version: 1.0
References: <20191016143410.5023-1-drjones@redhat.com>
 <20191016143410.5023-3-drjones@redhat.com>
In-Reply-To: <20191016143410.5023-3-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2019 15:47:39 +0000
Message-ID: <CAFEAcA-a9O88EbKqSNxb_7GLVZzC+dx0daEWyAAe9SS4SRa1oQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] timer: arm: Introduce functions to get the host
 cntfrq
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, bijan.mottahedeh@oracle.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B4JmI4eTNfvO

On Wed, 16 Oct 2019 at 15:34, Andrew Jones <drjones@redhat.com> wrote:
>
> When acceleration like KVM is in use it's necessary to use the host's
> counter frequency when converting ticks to or from time units.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/qemu/timer.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/include/qemu/timer.h b/include/qemu/timer.h
> index 85bc6eb00b21..8941ddea8242 100644
> --- a/include/qemu/timer.h
> +++ b/include/qemu/timer.h
> @@ -1006,6 +1006,22 @@ static inline int64_t cpu_get_host_ticks(void)
>  }
>  #endif
>
> +#if defined(__aarch64__)
> +static inline uint32_t cpu_get_host_tick_frequency(void)
> +{
> +    uint64_t frq;
> +    asm volatile("mrs %0, cntfrq_el0" : "=r" (frq));
> +    return frq;
> +}
> +#elif defined(__arm__)
> +static inline uint32_t cpu_get_host_tick_frequency(void)
> +{
> +    uint32_t frq;
> +    asm volatile("mrc p15, 0, %0, c14, c0, 0" : "=r" (frq));
> +    return frq;
> +}
> +#endif

Don't we want to know what the guest counter frequency
is, not the host counter frequency? That is, I would have
expected that we get this value via doing a KVM ONE_REG ioctl
to ask the kernel what the guest cntfrq is. Are we using
the host value on the assumption that the guest might have
misprogrammed their copy of the register?

thanks
-- PMM
