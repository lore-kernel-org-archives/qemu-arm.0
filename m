Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1005424lfi;
        Fri, 3 Apr 2020 11:40:23 -0700 (PDT)
X-Google-Smtp-Source: APiQypLgqVtwGFoPhZYQLmhpGz6PszLmGxVGkEM6DX41b49z0Ooe5DACOGKHVrlBF1m7IrkeZ8to
X-Received: by 2002:a37:6411:: with SMTP id y17mr10685158qkb.437.1585939222888;
        Fri, 03 Apr 2020 11:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585939222; cv=none;
        d=google.com; s=arc-20160816;
        b=UeL5lAIphowbQodzRwDTizckjud31rGWjHTYPyqsMV0O4EY3IZCuO52QV2S9WUXCCG
         GOMuEhh3JX0B0B8H1blxdaTe3XnKKBrspBHtbU48pp5YcZthD7UJD+XEaZqfWdzyirqr
         RzHeFQMjx+5TUDoCZTQEA8ACMeVicPc3d7QKjK+2KxzLlFryXCCfkfILklsr3kO8mQXy
         Hlk4yl1DCM4VfNc0kY4jzY/e7Rw/AdlFcxQV/fVWtR4+c8o049ys05aYtFDfQ7s2vBR3
         JtheNvzFbv+YEFlPUMjq4znPLS3K+CloLIhyAwMWB5JIx/8fsOF8UCsSf9HXyBEVK33T
         xHvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=21IbM3UajX86HvbzjpQqc+UNfp75BVUQPThr9h3lp0k=;
        b=zLfHUvjH1t/6BMiby0OGWTsSpNBVr2FOTbKSbl9gZB8BK3tWk62MEvlqyzQMC91ywo
         G336akAVVnYN2zUlh0QE1K8MA25pZ2RmowrECnS9EM823ns8Y+lIY7UjN0zYVM1p7/p/
         m3rY5Z159OeEkxdW68DUaYPD6d5+/zY1FLUaCdDIymfv5EO/pAR527aCP3Nzdiu3SWbb
         Rymj79uUT6RnvTstIVzyxFo6E/wpEaW6ZLxnwng5MBugneM7x9e94FvM2CSxrIMvc//X
         lLF2DRc509aucIozhrThva8ua/gmWQXCe/6K4w01Gw+JDH5h9AHGfOLlFF/gXTr6hHwQ
         nZ6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xUQWgmmA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq5si5823313qvb.48.2020.04.03.11.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 11:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xUQWgmmA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKREs-0001MC-As
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 14:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jKREd-0001Il-2B
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 14:40:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jKREb-0003Yc-J3
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 14:40:06 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jKREb-0003Ur-5O
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 14:40:05 -0400
Received: by mail-ot1-x344.google.com with SMTP id a49so8276943otc.11
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2020 11:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=21IbM3UajX86HvbzjpQqc+UNfp75BVUQPThr9h3lp0k=;
 b=xUQWgmmAA4+X+RUYByPjTOkrrXkSTqMvo5HMy0aM4DqXG78OWBOSAVgVahRNmE0idx
 pUhcUUlgFQrP+gtcVtWR73vRO362hfWXbiFm7sUnIx+qc+b0RFo57/nEbGc4HLkohrJ5
 9GvajImseQAWsfvX31kAHNoeckBlSjAbada0VNuH4BGm3N1yYnKHT9ZnXh5Con20X7oi
 bLsfiukOAQ44HJGuHRhuI2OavSVCsMmcTe7J1Xu7FnDRG8CyEJBjANMFsCD+eeS9ADJR
 X41CzYlTguy01Y6iQm5ZOoaYxfDIdSi3KZ0QJ89VOClDOrWfP4i74MEMkvsYQo24uAQL
 2F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=21IbM3UajX86HvbzjpQqc+UNfp75BVUQPThr9h3lp0k=;
 b=XMtafqwF190EDcNfVKQ+3b4R39Y28A1QySzCzdPLAmuTjKcQsKuJ6cbkvMOFmKbzCO
 Q/dIhSYu3FqAIcpp8YkQvX/sHE6JWY3PvuRNNqTtmMJ0TfTYrpc8dRkzXsWIFMQWRF6Z
 OLkhp63JfQJZimlLQZqgSU5hygEGMXYvK00V5CWXuECI+6L/HTi4YdLQ1sld/PqGxJg7
 qdJQjEwkq/ZBo51Dnb/7M+c18tzle8n1Mrbd+bL7ppRbc27PBkB4QAHKTLrJmxGRMq5I
 yItPNyhd8jClTNJbbQzdx/FSpqNe8gmboeYden6ueOgP4TTz8NlUbkEafeUTNHmDJwfJ
 UEfQ==
X-Gm-Message-State: AGi0PubHTUofM4OLF0Gh0JULE2F2LKpWFwJhiZ70a0zZCpZ2TERkkEsP
 R0dy7N1ZkfQWjLu2WN7oI6HfrMuqOT+EbTz0xMbz9g==
X-Received: by 2002:a05:6830:11d5:: with SMTP id
 v21mr7696633otq.91.1585939204054; 
 Fri, 03 Apr 2020 11:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200402134721.27863-1-edgar.iglesias@gmail.com>
 <20200402134721.27863-6-edgar.iglesias@gmail.com>
In-Reply-To: <20200402134721.27863-6-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Apr 2020 19:39:52 +0100
Message-ID: <CAFEAcA99fjZwYJzhypCxyqDMN9NR-BEd8Q21R-5Ge3tv1EwEkQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] dma/xlnx-zdma: Reorg to fix CUR_DSCR
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d5NEMyW0qdZm

On Thu, 2 Apr 2020 at 14:46, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Reorganize the descriptor handling so that CUR_DSCR always
> points to the next descriptor to be processed.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---

This is just moved-code in this patch so I think it's
a separate issue, but it looks like you have an endianness
bug here:

> +static void zdma_update_descr_addr(XlnxZDMA *s, bool type,
> +                                   unsigned int basereg)
> +{
> +    uint64_t addr, next;
> +
> +    if (type == DTYPE_LINEAR) {
> +        addr = zdma_get_regaddr64(s, basereg);
> +        next = addr + sizeof(s->dsc_dst);
> +    } else {
> +        addr = zdma_get_regaddr64(s, basereg);
> +        addr += sizeof(s->dsc_dst);
> +        address_space_read(s->dma_as, addr, s->attr, (void *) &next, 8);

This reads 8 bytes into the uint64_t 'next', which means
that the value from C's point of view will be different
for big-endian and little-endian hosts. You probably wanted
address_space_ldq_le(), assuming the h/w always does
little-endian reads and that these get_regaddr64 and
put_regaddr64 functions work with host-endian integers.

There's a similar problem elsewhere in the device where
it does this:
    address_space_read(s->dma_as, addr, s->attr, buf, sizeof(XlnxZDMADescr));
and assumes the guest structure is the same layout and
endianness as the host struct XlnxDMADescr.

I'm not a huge fan of defining host C structs to match
guest data structures, but if you want to go that way
you ought to (a) be byteswapping the contents appropriately
and (b) have a compile-time assert that the size of the
struct is what you think it is and the compiler hasn't
inserted any helpful extra padding.

thanks
-- PMM
