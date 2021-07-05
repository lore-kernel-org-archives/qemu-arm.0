Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1298030lfk;
        Mon, 5 Jul 2021 07:55:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU/8tzH5PejWCfKjlBAuXNI/X1Bj0v4ELDn3+p9eEyW1WgdgU/WkXGRb+K037S4n/r6Szq
X-Received: by 2002:a05:6638:4199:: with SMTP id az25mr12636881jab.92.1625496920391;
        Mon, 05 Jul 2021 07:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625496920; cv=none;
        d=google.com; s=arc-20160816;
        b=0kvQSZlAKtquZ25/jfFa2vbZCAI9Q6BplV22YVBAcgcyo/YIzrgIozwNLLSyu8KBFX
         6E5tOoCNs+emPuRhIHQQbkB/Hq3nEtvN6XlsvnFfHlIvb4VqBMzlK+np6wj0QQTB23/6
         1grdna0mv1zGVdRCDaeTV4y7HvfxkLZd9t5KLjC4h+7liUbUY2l4FCyjWjc8omQX8ELe
         +/WlV6KUByMg63byjWiEJGqnwEAwR0I9jEh5yVpOa7g4UXLrhGzOqkCu1pGPBDc22hIZ
         ECQoYEzJYB9ySJs09JpiXuz/8/o8B28lyNRYTeyYCd2vIOKOXDCv2lGsmK24zCBC/mfm
         /7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mC62o+nN3O268cbYbKjrXdyM/wNQNYWzNHZH7mE/ZUg=;
        b=gm1BReItA+8Wn5qiKj9087b4GlkRdR2dZGJ34HkHCUfqgza7PnYTJ5cSHU1Ar/Z2Sn
         M9r6zWnQSRjp1oYvxIwKCA8miNSo3UJpSqs9iBQVLe8ps4p5BbVhHX0WbpfWY2dva0ea
         3jGtvWbORY9CVMbwSTmIEP4SE0TVC+C1PghL5xYOdyweBT+LSLAshfvSxcUVzo58gvJ6
         AAUFAOZmcYtJLdQBmg/FPtymGSqZ1eWAAvCHZNKKaZYAUYtF3laRb9qSOW/OSECGMCxS
         hjT3+uabWzTKnVspGg5cRMpzNAj6CUpySOUCH6Y6lk9reFzreLbuYb322XvzESO0S6ux
         dWyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GbsfF2FI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si12249704ilu.98.2021.07.05.07.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 07:55:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GbsfF2FI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0Q0F-00071e-LG
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 10:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Pzy-0006xe-Lk
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 10:55:02 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0Pzv-0004J0-8t
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 10:55:02 -0400
Received: by mail-ej1-x633.google.com with SMTP id bu12so29496075ejb.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 07:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mC62o+nN3O268cbYbKjrXdyM/wNQNYWzNHZH7mE/ZUg=;
 b=GbsfF2FIVZV9dMKCeVJcVG7pN+5Gbg5aHrmz6YH6Uw3W/tb8/a2m4sE93iWVL4cz3Z
 YJj6AdXr/CTNGv/cHuLEUkcUb9G64QdrXrd8OqicimPVHy6dzeuMaMW9ZlGjIeEMh7NV
 9BoR5LA3ILx6o6IoOqr6ds6AOQwPkBNNmpC+NrgCW/Pk+SQLN+tllME/STng+ptiHdwg
 cD2AJvXWbZ2XrRv/t3zDak/koCjaVQQsArtnXlTrUatbZ+9KfVZY3AAobsVzlZyPA55a
 SdNQe5nXDvaKevQm0X8RaoIrYXhAaqIbs9Rkkbki5+1Q3CrO/LUc7sAZfQ1Oqce0Jhdw
 SPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mC62o+nN3O268cbYbKjrXdyM/wNQNYWzNHZH7mE/ZUg=;
 b=tJM82Zc28g9YNF7/D6HqZSwva3qL0bI2s4Z9mzcwc+l43Mi/ZU0ZOT7pLd7BEUZmh4
 F/YsmXk6jUIzAas1YtgAAnv6UM1fdGotjs6N/N+7ZUFov7T20vlXT+DwtU3F97u7ECIU
 neyi4I83GPqAyD3CWCWDNkGHUIqysGC2F8Z4hW7TXTyGCVLu6g0XwSl/Ko25YDdoj/3w
 +eZi+jXtthliAM4HIBU5D5oB6VTEGKcM5PcbgR8SLPkUhf3/h9R9BbkHF6zoj26RXVfx
 EbG/KB3fr8jLjULU1kgZD5HA2vbmohNdfWdFF8BlEOOo9qy+4XM/vB6xt9Pb1hBFDVYT
 o4QQ==
X-Gm-Message-State: AOAM532C5GDVmXD6HKMlfdSexubnthlsqU2/SpdtmPnS5Nhk/J0Y6KCU
 NYphS2w8U/DABS0AwgaBM75gHs4a7AMuBYxC1DuRZA==
X-Received: by 2002:a17:906:491a:: with SMTP id
 b26mr7200286ejq.85.1625496897471; 
 Mon, 05 Jul 2021 07:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
In-Reply-To: <20210630153156.9421-5-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 15:54:19 +0100
Message-ID: <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1aJBum6Oq2Pk

On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Added ITS command queue handling for MAPTI,MAPI commands,handled ITS
> translation which triggers an LPI via INT command as well as write
> to GITS_TRANSLATER register,defined enum to differentiate between ITS
> command interrupt trigger and GITS_TRANSLATER based interrupt trigger.
> Each of these commands make use of other functionalities implemented to
> get device table entry,collection table entry or interrupt translation
> table entry required for their processing.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---

> +static MemTxResult process_mapti(GICv3ITSState *s, uint64_t value,
> +                                 uint32_t offset, bool ignore_pInt)
> +{
> +    AddressSpace *as = &s->gicv3->dma_as;
> +    uint32_t devid, eventid;
> +    uint32_t pIntid = 0;
> +    uint32_t max_eventid, max_Intid;
> +    bool dte_valid;
> +    MemTxResult res = MEMTX_OK;
> +    uint16_t icid = 0;
> +    uint64_t dte = 0;
> +    IteEntry ite;
> +    uint32_t int_spurious = INTID_SPURIOUS;
> +    uint64_t idbits;
> +
> +    devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    eventid = (value & EVENTID_MASK);
> +
> +    if (!ignore_pInt) {
> +        pIntid = ((value & pINTID_MASK) >> pINTID_SHIFT);
> +    }
> +
> +    offset += NUM_BYTES_IN_DW;
> +    value = address_space_ldq_le(as, s->cq.base_addr + offset,
> +                                 MEMTXATTRS_UNSPECIFIED, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +
> +    icid = value & ICID_MASK;
> +
> +    dte = get_dte(s, devid, &res);
> +
> +    if (res != MEMTX_OK) {
> +        return res;
> +    }
> +    dte_valid = dte & TABLE_ENTRY_VALID_MASK;
> +
> +    max_eventid = (1UL << (((dte >> 1U) & SIZE_MASK) + 1));
> +
> +    if (!ignore_pInt) {
> +        idbits = MIN(FIELD_EX64(s->gicv3->cpu->gicr_propbaser, GICR_PROPBASER,
> +                                IDBITS), GICD_TYPER_IDBITS);

I missed this the first time around, but I don't think this is right.
Different CPUs could have different GICR_PROPBASER values, so checking
against just one of them is wrong. The pseudocode only tests LPIOutOfRange()
which is documented as testing "larger than GICD_TYPER.IDbits or not in
the LPI range and not 1023". So I don't think we should be looking
at the GICR_PROPBASER field here.

More generally, "s->gicv3->cpu->something" is usually going to be
wrong, because it is implicitly looking at CPU 0; often either there
should be something else telling is which CPU to use (as in
&s->gicv3->cpu[rdbase] where the CTE told us which redistributor),
or we might need to operate on all CPUs/redistributors. The only
exception is where we can guarantee that all the CPUs are the same
(eg when looking at GICR_TYPER.PLPIS.)

thanks
-- PMM
