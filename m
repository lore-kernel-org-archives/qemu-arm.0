Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp543305lfl;
        Tue, 15 Feb 2022 11:38:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6lNECxsNFCquIq9SNrM1vwQFzgMXun0VUUqLzzlD8wVjrKLmFF1uUfL5XqqlpLDr19Wag
X-Received: by 2002:a81:c40c:: with SMTP id j12mr432110ywi.37.1644953890019;
        Tue, 15 Feb 2022 11:38:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644953890; cv=none;
        d=google.com; s=arc-20160816;
        b=h+SJBrTdO8LPTLfFIDxFpWKkBg6Mv7sAweeoOoKDd75Xc0y4VnMfuIIQIFAKtTEa4C
         Rw2xYc7ewp+WuuNr0vhtZ9yUBJX7r/nIu8tP2W20BU2xbP/13MHPDgmfCsqRWOh+V+G/
         JLEjTDur9G9neYdZOEKskW+8Cumfm42YbE5agIxTTFp1LQZhnxRCKevzm8SrldPVfExE
         4ZXKCe8mtblnLRZrv8jbYsWaUrrffLDKTn03ikb+/u0pZGu8g0HXLJxp5nubB49dH2Zo
         QDgmqKq4/vZAtcFudQD8/ShhMZ9pBCSb1VqHGJ16aQiCTOO74sH6s5Jnjj5030FfVi/3
         SQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RdilMSZ5G3Q8UmLpPWoOtg0YYs6Zcoyt8d2cNdM4CWI=;
        b=vXKOU1yNz/Kee0zr93oMcTUd+rI+EokbjmIHPBEG+Y1U8bxRk9JE3iuQBrOZGRGaHJ
         zrdrzgwKWUADegFg2z/SAg1JtlHOhCix69J08zHAALEuKXUY7NRJI2qUVdtLzItxGqU6
         NkNtKG+OBPVC212d6a+Zt/O/mYLtNkEEKW8naRlca1SDRdbW3tLTKX2fzcCCNBEsVnpw
         uLD3olGXO1h53LGZqwfVaXMftP0ln2hgfz6JrDXG+uSipPlxuJtqVttdJY1+DA1bEKCO
         KrSAPx18ae5COE3SyOoOdPht380reb2z0s1mxwzI//XCSKlK9GCHd1eXnZBwXn4VcCbh
         WyQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xrKqTA7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bd28si2545487ywb.394.2022.02.15.11.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Feb 2022 11:38:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xrKqTA7X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nK3eK-00010k-6D
	for alex.bennee@linaro.org; Tue, 15 Feb 2022 14:38:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK3UY-0007yU-CO
 for qemu-arm@nongnu.org; Tue, 15 Feb 2022 14:28:03 -0500
Received: from [2a00:1450:4864:20::430] (port=45591
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK3UW-0006Lp-7D
 for qemu-arm@nongnu.org; Tue, 15 Feb 2022 14:28:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id p9so13297052wra.12
 for <qemu-arm@nongnu.org>; Tue, 15 Feb 2022 11:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RdilMSZ5G3Q8UmLpPWoOtg0YYs6Zcoyt8d2cNdM4CWI=;
 b=xrKqTA7XAoAIFcFhicQoLKBkY2ypGMJE6hrsNeosZh2xCwsRs6tob9GLjq0g9FiGh8
 fpTbAFZBdUEnM2m7MYsGZeE5HpfvvzcQeDAxaGqvRw+xMrAbQQWx63a+4TnEziYdTR6j
 mfoYad3c922Z9+vGOWYRo4i2reDHGTERHDh8HFhYBbr5sKN5xuiEr7wzXh7vklAjF5C5
 E/Hmgn15JPRxBeCiW+XAApZ1ZsKLc6p0kBGOLYwNp4pHEcLjRrUzvctk9bXHsBkLAZXi
 yGRnq/3AcDenlEs3hA+qSiqZ5CON46UunLR03YZH/nr8czblCtbgUcKkz5yadpZOJ+ba
 4rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RdilMSZ5G3Q8UmLpPWoOtg0YYs6Zcoyt8d2cNdM4CWI=;
 b=2fXZqAj3ebv9/2ACoU45vyBYEXe3/+h7ixQ+AsSXhfBqlM1uFBJwk214ghzDoAKTIH
 GV8ewC7jsU4BDUzMZiXsuwUNUoC1byhmZ6aOlMP84BtyxcE70+v+KrqviT239fxV8v81
 sVoEln8/fta+fqFoKjQsyGohebeAPsXqZAEmTL55T5k5GzCrbxEyRQJ7HuIHTBjDEv+o
 1uJxGu7nyitxKlZPr8v3jUq/bxZMyJD7xaHfz0D/J5e6cJHlsQ7gEd+U2sGxmtK92bAM
 dNJemwilZnXpr6deRf5btl1Htjc3G4/oKfMOA2/PcTFBHJXuSPuYPZdxLscU9TzWAdS2
 ngAw==
X-Gm-Message-State: AOAM530s2vewKC+pgWsJG+ziwPZ89IUbTePG67fKEySBUkApzpDnKSlc
 IZJhGDaVtPeEJJhYrYVXqGwaULERZNOXwdm6yZOJkw==
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr348387wrs.295.1644953275419; 
 Tue, 15 Feb 2022 11:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20220203142320.33022-1-agraf@csgraf.de>
In-Reply-To: <20220203142320.33022-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 19:27:44 +0000
Message-ID: <CAFEAcA99M7M2vOiOZ+vYNorGyK3kvZ8AhYfZ2=FGzaqQgZRN+A@mail.gmail.com>
Subject: Re: [PATCH] hvf: arm: Add simple dirty bitmap tracking
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: blAAnZAtprC1

On Thu, 3 Feb 2022 at 14:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> The actual tracking of dirty bitmap updates is happening in architecture code.
> So far, the aarch64 hvf code has not updated QEMU's dirty bitmap at all. The
> net result of that is that the VGA device's framebuffer would not update.
>
> This patch adds simplistic dirty bitmap updates. Unfortunately hvf can only set
> permissions per full region, so we have to mark the complete region as dirty
> when only a single byte was modified inside.
>
> We also handle the write protect update logic before we handle any writes.
> This allows us to even handle non-ISV instructions on dirty logging enabled
> memory regions: Once we flip the region to writable again, we just rerun
> the trapping instruction.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/hvf/hvf.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0dc96560d3..92ad0d29c4 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1163,6 +1163,28 @@ int hvf_vcpu_exec(CPUState *cpu)
>              break;
>          }
>
> +        /*
> +         * Dirty log updates work without isv as well. We just run the write
> +         * again with write permissions set. So handle them before the assert.
> +         */

I'm not 100% sure, but I think that this check should come before
the "is this fault caused by a cache maintenance operation, if so
skip it" check, not after. Some cache operations (eg DC IVAC)
require write permission (as opposed to merely announcing themselves
in the syndrome WnR as writes), and we want to really execute them,
not skip them, if we're doing a cache op to RAM rather than to MMIO space.
(My somewhat shaky reading of the KVM kernel sources is that it
effectively does this too.)

> +        if (iswrite) {
> +            uint64_t gpa = hvf_exit->exception.physical_address;
> +            hvf_slot *slot = hvf_find_overlap_slot(gpa, 1);
> +
> +            if (slot && slot->flags & HVF_SLOT_LOG) {
> +                /*
> +                 * HVF can only set a full region's permissions, so let's just
> +                 * mark the full region as dirty.
> +                 */
> +                memory_region_set_dirty(slot->region, 0, slot->size);
> +                hv_vm_protect(slot->start, slot->size, HV_MEMORY_READ |
> +                              HV_MEMORY_WRITE | HV_MEMORY_EXEC);

This looks OK I think, but it is also not the same as the x86 hvf
code. There we have:

    if (write && slot) {
        if (slot->flags & HVF_SLOT_LOG) {
            memory_region_set_dirty(slot->region, gpa - slot->start, 1);
            hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
                          HV_MEMORY_READ | HV_MEMORY_WRITE);
        }
    }

which only marks 'dirty' the 1 byte at the address being accessed,
not the entire slot. Is that a bug in the x86 hvf code, or something
we should also be doing here ?

Also, when we initially set up slots, we pick the permissions like this:
    if (area->readonly ||
        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
        flags = HV_MEMORY_READ | HV_MEMORY_EXEC;
    } else {
        flags = HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC;
    }

Are we guaranteed that we never try to mark the non-writeable
(because readonly or romd) slots for dirty-logging, or do we need
to somehow track whether this is a read-only slot so we don't
incorrectly enable writes for it?

(It does make sense that dirty-logging on a read-only area is a bit
pointless, so maybe we do guarantee never to do it.)

> +
> +                /* Run the same instruction again, without write faulting */
> +                break;
> +            }
> +        }

thanks
-- PMM
