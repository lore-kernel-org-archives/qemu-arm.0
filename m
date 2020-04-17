Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp485094lfm;
        Fri, 17 Apr 2020 06:37:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKDr7fryVKb0JaCDgJliDrbfWh0O/6BhSwI3U34cdy3jWTJDL4CBecnwaSMVD+dZh1UyURA
X-Received: by 2002:a05:620a:c89:: with SMTP id q9mr3060713qki.375.1587130665781;
        Fri, 17 Apr 2020 06:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587130665; cv=none;
        d=google.com; s=arc-20160816;
        b=yzkmlrWHM1qCdRsWBAu03pz99FD1JZyAGxR67wEESxvMcMNm12kixislBYjqfMQ3P+
         xs28bASX4s+zktlMrT6ydNegKJpGeiP9P9fpY7qkPCPL4cZJc2K48jmI4L1H54fi4LoN
         XMzNuzxp5vyx5k86b028POIejRf1M95MSs2teZnKZIIBR0UfOZtvjeoeEV0HiCRFaF/z
         Qb5DVL4/l6VKHFr1u0cqsLzl+DOgibalsyxK7zt6G3SuN1gUK8VjcZ8GXDWU26i3JGtT
         77ozKWpAYH2GstHi2eq3S/PFR1YlaG8uoHFvKkjUwrT2kRgE0/GEBxgrpJteBylWxkg9
         W2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mF6t6DrxG448bVneKOHPIF3gBskDqsvioWPmNHSo5OY=;
        b=sIT29XENKzmZwnjEvasxPC6e01qnKBlSbBPh+RtURtPupSpjXyvcPVT2fLpyJxBBwp
         R008cRFL1UvYR/XTJec52677wNbuG0ZT4nGu8IFgnKylLTEVvhSqNnBF+xUKadimYRGu
         Frc2nI+W2nriOubiwJGLEZ41b59aw0SNgSHqFN9l9NlZnPMy3Z+CUKsQmiM3IDuG53YV
         esBgrqOaFW8/gFTCfH2ufjPRC0kNgkI/C3YjcZYQtbV1ZYzn+iiosa3mCqJJH3rpc6oK
         YOa1Za94HxLqFLgaNGVYH/EIc36onki5Tm9KYQK937liBQhd51mKApPEWhgUQULJH6j+
         33Pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lwgerN1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si2434884qve.58.2020.04.17.06.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 06:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lwgerN1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPRBh-00074b-8W
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 09:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPRBW-0006za-0A
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 09:37:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPRBU-0001ta-Td
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 09:37:33 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33261)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPRBU-0001st-Ko
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 09:37:32 -0400
Received: by mail-oi1-x241.google.com with SMTP id m14so2099582oic.0
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2020 06:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mF6t6DrxG448bVneKOHPIF3gBskDqsvioWPmNHSo5OY=;
 b=lwgerN1qaufyGsE408recmf6KgtQlJhLlMhRDWET9+ATM32r1dPzC4OKp4g3sWqRfF
 Dt/m2g/t5wuomW4h2UQ3AP3TIoLoqROepB77u33V++hCnVlLK8Zm/0hWVOYrE4gCXIJ5
 ALWYwZlrY55VQtNPP3nP2FGU5Is7JkBaCYaRF4+GkJLXFPMyKLxf+qNqWqYgRu2BPYoL
 CqKmRRgghADYljMEXRVu6EDWUxDDkg3Wb5ldMHw1eM8m+x5wuhJIPd3OOh3s4ltMo6hL
 ScLMbQ0zGjhlVHfvpqTHubEleosPb9sImyl+v4XKWNhPvgz7F1NfsX+yRkgBLohmzp3P
 KZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mF6t6DrxG448bVneKOHPIF3gBskDqsvioWPmNHSo5OY=;
 b=pFA/KWJ00HV+/3cC9K4VbDwg+TjP09x35qDdpLhP6ShTNamr25doDc/aZVh/MFvMia
 p0TPjuIeSS5lGdF1vQFWZ98B4CkUJxbm9NXXuVSX95bdHvTEZwQ4YrWRAVuWokK7DASa
 Gg2bAeXsnsbuXFXnJMEjDxBYBBh+CTDC+eDN1NrO2gUx5JXWkdCHwSLzsp7+PTppUtf7
 iQtz9ozsOFGqmfHdukzfhgzImVrA7ShSOvxOnSIDmMIqfOIYAqC/bqpCyCpwObE8fKYN
 nei532d6bt60OwkS8la6q4Cv+3zBrMf4Lk9VtU+tEmZ8nbgOgHKcr/9uwuh1qMIunB9g
 W/qg==
X-Gm-Message-State: AGi0PuawA3lpeyyieAmz/XSvIlpOxgHUg6I+ffxv392Gaxyqvn7V7a0Z
 R+IcO/7K9N/Rigat+lmQBeJ7doVJU89RkIx6KrkjMQ==
X-Received: by 2002:aca:3a8a:: with SMTP id h132mr2047132oia.146.1587130651702; 
 Fri, 17 Apr 2020 06:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200416090247.353414-1-rfried.dev@gmail.com>
In-Reply-To: <20200416090247.353414-1-rfried.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 14:37:20 +0100
Message-ID: <CAFEAcA8kZw_xd-Snogxavyxpo5nyjoExV6DPfyTa3=4RqpTJVA@mail.gmail.com>
Subject: Re: [PATCH] Cadence: gem: fix wraparound in 64bit descriptors
To: Ramon Fried <rfried.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Up1A5jPM18ni

On Thu, 16 Apr 2020 at 10:02, Ramon Fried <rfried.dev@gmail.com> wrote:
>
> Wraparound of TX descriptor cyclic buffer only updated
> the low 32 bits of the descriptor.
> Fix that by checking if we're working with 64bit descriptors.
>
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>  hw/net/cadence_gem.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 51ec5a072d..b8ae21cc0d 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1238,7 +1238,14 @@ static void gem_transmit(CadenceGEMState *s)
>              /* read next descriptor */
>              if (tx_desc_get_wrap(desc)) {
>                  tx_desc_set_last(desc);
> -                packet_desc_addr = s->regs[GEM_TXQBASE];
> +
> +            if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
> +                packet_desc_addr = s->regs[GEM_TBQPH];
> +                packet_desc_addr <<= 32;
> +            } else {
> +                packet_desc_addr = 0;
> +            }
> +                packet_desc_addr |= s->regs[GEM_TXQBASE];

The indentation seems to be off here.

You could write this as:

    packet_desc_addr = s->regs[GEM_TXQBASE];
    if (s->regs[GEM_DMACFG] & GEM_DMACFG_ADDR_64B) {
        packet_desc_addr |= (uint64_t)s->regs[GEM_TBQPH] << 32;
    }

which ends up as the same thing but matches the code used
in tx_desc_get_buffer() to assemble an address that's
32 or 64 bits depending on the ADDR_64B flag.

>              } else {
>                  packet_desc_addr += 4 * gem_get_desc_len(s, false);
>              }
> --
> 2.26.0

thanks
-- PMM
