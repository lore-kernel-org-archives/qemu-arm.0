Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp676549ejc;
        Wed, 25 Jan 2023 13:41:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvBv407mymvxUziWapkuoPkSrt1tETymyfHDFphH+GjN95Bev6PFZUFGihqLFRHexhWT8aQ
X-Received: by 2002:ac8:4787:0:b0:3a6:a43a:8ba9 with SMTP id k7-20020ac84787000000b003a6a43a8ba9mr46898599qtq.3.1674682913715;
        Wed, 25 Jan 2023 13:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674682913; cv=none;
        d=google.com; s=arc-20160816;
        b=b61k0agfVOksddofYNguVbf0dHvWmhnRU1xOAObWUNZpbb2lRZ5dIkk0miR4mQLVys
         xNZNiD28AvxzhjSd71KE2W0yHRoRhrCk2dyIqm8CE5axG5l3BqE4oteNJdt6ZZG9tOPc
         8C89FZIELhPEG+Y9f+tnnecTefgHdqNaYnmISxjw6QdL2mBat8l1smBnZjeeUlc4pAkY
         vk6qb+cJS9ht3CHekcqs8E9SMQ5XzoJCydNnaEhjRUfIDdxrCW/52dFCR3pyZygaUdFt
         5P4qJ8d9iB8M93jKbZtb8uPDtuvor+YteJUhw2p6wYRb5xUfbqeL5I6KY3y0oZaGXYW5
         jChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=pyR+r6gFzy58s4aG5oIC8LaBb5D4yQ1wncSI4S4T/PA=;
        b=rPuWGWoP9Qm4CibC09WqAu9HCXuVX84jNXCScfT9AFl3xIDzf96ZPW8BnZ5VUCWIy9
         JDI2ImFe7e4IcXj/E9kwNwAQfNnVaHBLAd6gp7Q6vyAG6bPMIW71HZTrvu0L8Fj0BTgK
         AbIUlGWwP9D3FiSAXHXmY0RYFYhCH4ywQ9wxC0Ic53LNKi4aGpDkcrWDIVgoB5O7lGRz
         Ox3lDwnutmidGeYLKcwUN/MPMjxnuUSb/kaoQL94fEC8ql+nBDSpV22PIx7ll4l0ASb4
         7WZfPTu0VfhlAhJ/UfMXBSRe4G/eAtefBm/7EWsTIzXYh58hTXI2C19v2z5pCkROwELf
         gv1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=dYw7jbf+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd11-20020a05622a418b00b003b68cf4ae53si4664044qtb.505.2023.01.25.13.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jan 2023 13:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=dYw7jbf+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKnWS-00005c-PW; Wed, 25 Jan 2023 16:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pKnWR-00005A-Uj; Wed, 25 Jan 2023 16:41:35 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pKnWQ-0005Mt-BX; Wed, 25 Jan 2023 16:41:35 -0500
Received: by mail-vs1-xe36.google.com with SMTP id k4so97148vsc.4;
 Wed, 25 Jan 2023 13:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pyR+r6gFzy58s4aG5oIC8LaBb5D4yQ1wncSI4S4T/PA=;
 b=dYw7jbf+lUNDnsZPokib1WxaNT4L38UW1DE19tm9XZfj6nwDtlK0eICtekTdC33QNB
 Ii0fqDLEpPnEw8PgH7m5PBkHabyDpAuEr67LWI/gK1ldqgachxc/TfrF+JWqh/RlX51g
 Sfp5RrLlGbRKXtTryjXw/8Ltf0i2CEBNgUJD5TF1H3L7UEdtlVaVN1S8KOgRVdvU1NDh
 PzSvOKN/zyC8SCtqRu9WrOhIMcZiefT3/JUD2qcrP4LZcuvtX2HkjQvyAqdcBpdoruVg
 phTsa74hE8T+4WcSWGexLQAGx3hcWH1yP20uCrXtPIPIJLOhJOwE/Fb29riv0gHoQ/NA
 06pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pyR+r6gFzy58s4aG5oIC8LaBb5D4yQ1wncSI4S4T/PA=;
 b=jteT7UA+4eQ8IauWfsLfq6VJcKfvIDZo/aKocaARwb2vF+4Y8e3X0QbX0jVMYcsbec
 5CtoTCnz3AtxBoflRt+AtaBLlX0uRo9o1jsiSrQcA13+0zbVXiEGhKlWMHEOsswx3Vj2
 IcW3Yq+74rEq9J30wc02xBA9BTXo50Ald/BedbW9u0tkB7SxxPpQ40+zOkzKV84WIeR9
 CfVZnv68wXGIaP5GI5sShEkAGGgdYVsVWXhGYgz7LaH52iEHsoiAlsRbkM+DApJUwAqQ
 yhkZLX1JaXzCq3pNaMc09VLDIzpbi09je4s77U3dq5akRSTQH7ccF/7QPAWrjmzb1g4k
 /4hw==
X-Gm-Message-State: AFqh2kosCbB6+0nf9a/USx5Mh9oJI+X7xcOZ6IYafdEWI5VJUx0iQq2i
 Zkgd6j3/hK8mOkLHxxRDZA==
X-Received: by 2002:a67:1d46:0:b0:3d0:ca43:4001 with SMTP id
 d67-20020a671d46000000b003d0ca434001mr19999097vsd.20.1674682892701; 
 Wed, 25 Jan 2023 13:41:32 -0800 (PST)
Received: from serve.minyard.net ([47.189.91.183])
 by smtp.gmail.com with ESMTPSA id
 w26-20020a05620a095a00b006fc3fa1f589sm4211708qkw.114.2023.01.25.13.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:41:32 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:7b7c:de0b:9a93:f5c2])
 by serve.minyard.net (Postfix) with ESMTPSA id 651D21800BF;
 Wed, 25 Jan 2023 21:41:31 +0000 (UTC)
Date: Wed, 25 Jan 2023 15:41:30 -0600
From: Corey Minyard <minyard@acm.org>
To: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v4 5/5] hw/nvram/eeprom_at24c: Make reset behavior more
 like hardware
Message-ID: <Y9GiCmi7GRW0e/dm@minyard.net>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-6-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118024214.14413-6-peter@pjd.dev>
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=tcminyard@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.091,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z5UuEkS1jDnK

On Tue, Jan 17, 2023 at 06:42:14PM -0800, Peter Delevoryas wrote:
> EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
> I would expect the I2C state machine to be reset to default values, but I
> wouldn't really expect the memory to change at all.

Yes, I agree, I was actually wondering about this reviewing earlier
changes.  Thanks for fixing this.

Reviewed-by: Corey Minyard <cminyard@mvista.com>

> 
> The current implementation of the at24c EEPROM resets its internal memory on
> reset. This matches the specification in docs/devel/reset.rst:
> 
>   Cold reset is supported by every resettable object. In QEMU, it means we reset
>   to the initial state corresponding to the start of QEMU; this might differ
>   from what is a real hardware cold reset. It differs from other resets (like
>   warm or bus resets) which may keep certain parts untouched.
> 
> But differs from my intuition. For example, if someone writes some information
> to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
> retain that information. It's very useful to be able to test things like this
> in QEMU as well, to verify software instrumentation like determining the cause
> of a reboot.
> 
> Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> index f8d751fa278d..5074776bff04 100644
> --- a/hw/nvram/eeprom_at24c.c
> +++ b/hw/nvram/eeprom_at24c.c
> @@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
>      }
>  
>      ee->mem = g_malloc0(ee->rsize);
> -
> -}
> -
> -static
> -void at24c_eeprom_reset(DeviceState *state)
> -{
> -    EEPROMState *ee = AT24C_EE(state);
> -
> -    ee->changed = false;
> -    ee->cur = 0;
> -    ee->haveaddr = 0;
> -
>      memset(ee->mem, 0, ee->rsize);
>  
>      if (ee->init_rom) {
> @@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
>      }
>  }
>  
> +static
> +void at24c_eeprom_reset(DeviceState *state)
> +{
> +    EEPROMState *ee = AT24C_EE(state);
> +
> +    ee->changed = false;
> +    ee->cur = 0;
> +    ee->haveaddr = 0;
> +}
> +
>  static Property at24c_eeprom_props[] = {
>      DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
>      DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
> -- 
> 2.39.0
> 
> 
