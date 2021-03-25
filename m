Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp30308lfg;
        Wed, 24 Mar 2021 20:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoVDWhY8JlEjugB3xTMVcVm6PZ1ENQ9ly6a0ydN4VYlXL9lwFa/kMl2n3TgUPiMr41O5hK
X-Received: by 2002:a05:6e02:1069:: with SMTP id q9mr5279040ilj.97.1616643709154;
        Wed, 24 Mar 2021 20:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616643709; cv=none;
        d=google.com; s=arc-20160816;
        b=c45TQWDb0nkqPxCf5YIdaFCEg8imuC8Wa5pZ5qXbkxxt3NbQc65654yDlbaylWwVbt
         PuBvj4HISyc8Nz3yLwMVnOyoXPrkxAl89DK4GTVnld6IEtmZ6O0zXgwfnFVxA5/QCBBj
         FZyTg3ev3fEX9MrPjvoBruSRbQsjGHxRG5mJWhqn+Zf6ZghdaCSQnauKuh/F5Ri0VDmt
         QrtVmtvcX2OYLbFN3V6HnOZp+JyXo9O8bWx2C04tVDQoXmwb4Iv2piKyvIot3eq9B1ZQ
         wbFVn+FEWijP6KIvVxtOHKoJVqqgvhFveAMUukD9yy5Lin4k9ap9DXedEcHF+VxXX90R
         t+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5zYOilNafpGjI+lqRigyHSHNHkMxteQH+UEtE2QTtM=;
        b=veehlQZqXOlTcS3raG7d7qJekB2pqjVvVx9D11XLfvrVgdHOAZ+q0p9x4JF13a62i7
         YBF2OhJAofZ+kJvxaNdN7NVqhqXpIlB0jJDTs2vnmjYN+btX2q2CDpaGN26dbr6rfuML
         CZayifdneRTbe+wUbw93dlxPOhEIs6bX1fzR7wjLt9JXzjT7n4Qe2rQ1HlsGcP8yMD1m
         LiC1Uh+K26/J9w0txokQawEiHfzKaqx57xqX+uVXzhnseY6XkEI0YJTAXHvVmaiJDybY
         Qo3Vj/VjF6qbsYTrv+3JGsOVWW1350A6gKAa4Mlv6ZsYJl4cpP8zr7Rcbq+bOOW6BlEx
         t/9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ij0l8gIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si3452784jat.112.2021.03.24.20.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 20:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=ij0l8gIS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPGsW-0001Ll-9A
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 23:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lPGrL-0001In-HZ; Wed, 24 Mar 2021 23:40:35 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lPGrI-000654-Vw; Wed, 24 Mar 2021 23:40:35 -0400
Received: by mail-qt1-x82d.google.com with SMTP id i19so750986qtv.7;
 Wed, 24 Mar 2021 20:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N5zYOilNafpGjI+lqRigyHSHNHkMxteQH+UEtE2QTtM=;
 b=ij0l8gISnKh+fgL9AbQGh9R18RHISvJtR301+belTH+NByVg5xYG8zQlPnzbGGyh2k
 6S6GwHq9OYCRGf1W+GpA6FGyv1CcRb2vSw4Cq4Q5SgEWIFzMT7ZnIZppi2mibazu2a3y
 7R3lTld/gcu5tRggWMw1pUvxl/s3fujSdZBUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N5zYOilNafpGjI+lqRigyHSHNHkMxteQH+UEtE2QTtM=;
 b=kTBDqAxH7An26f3y0XpGk7LSr11QN97rLTvknU5Mkogiz6OMm3GuRilm4Lqwb99c8t
 R9chfDiM2b2o3lePTOy1i1VEQBgIsPosTZorl7Uk9f2f7EyHHbl9FF/bp3BvU7G+61PK
 lXeN0ThFyUd04B12idlFlSF+bHjGCiHMdjbC8fSOlVqFL8yi8Hvpl+88l97EAm2+ksz/
 5XKldc8vJ3g8Fpwou4yEJbqz8etsavy9GGE0JsOdCWozianzuocAGRchm+goWde3CQf/
 2lm3lW6Pmeu8Hw8yzHOPRpiMHXqnkSoeGKKdiOLT34PU86VzU5mNdHl+JcKujiqnJcyk
 CPZA==
X-Gm-Message-State: AOAM530Hy/xEaMjCZuLexhVE+oXYgSdFgnIWu8x6VOHTC4qWRTsY6slI
 4YOkjCtyT3FAWtskp1G5U4M1IxlKg2bLWTLp8yw=
X-Received: by 2002:ac8:6f02:: with SMTP id g2mr5923978qtv.385.1616643631415; 
 Wed, 24 Mar 2021 20:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
 <20210324223846.17407-3-klaus@linux.vnet.ibm.com>
In-Reply-To: <20210324223846.17407-3-klaus@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 25 Mar 2021 03:40:18 +0000
Message-ID: <CACPK8XcZDyip9s+xN+HP5_Z7S_v8zY6tGRVbD83uaCT=kfprWw@mail.gmail.com>
Subject: Re: [PATCH 2/3] aspeed: Add Scater-Gather support for HACE Hash
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XByENPJTqIDK

On Wed, 24 Mar 2021 at 22:39, Klaus Heinrich Kiwi
<klaus@linux.vnet.ibm.com> wrote:
>
> Complement the Aspeed HACE support with Scatter-Gather hash support for
> sha256 and sha512. Scatter-Gather is only supported on AST2600-series.

Please update the documentation at docs/system/arm/aspeed.rst too.

>
> Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
> ---
>  hw/misc/aspeed_hace.c         | 127 ++++++++++++++++++++++++++++++++--
>  include/hw/misc/aspeed_hace.h |   6 ++
>  2 files changed, 127 insertions(+), 6 deletions(-)
>
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 93313d2b80..8a37b1d961 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -57,6 +57,10 @@
>  /* Other cmd bits */
>  #define  HASH_IRQ_EN                    BIT(9)
>  #define  HASH_SG_EN                     BIT(18)
> +/* Scatter-gather data list */
> +#define  SG_LIST_LAST                   BIT(31)
> +#define  SG_LIST_LEN_MASK               0x7fffffff
> +#define  SG_LIST_ADDR_MASK              0x7ffffff8  /* 8-byte aligned */
>
>  static const struct {
>      uint32_t mask;
> @@ -129,6 +133,117 @@ static int do_hash_operation(AspeedHACEState *s, int algo)
>      return 0;
>  }
>
> +static int do_hash_sg_operation(AspeedHACEState *s, int algo)
> +{
> +    uint32_t src, dest, reqSize;
> +    hwaddr len;
> +    const size_t reqLen = sizeof(struct aspeed_sg_list);

It would be more descriptive to use this sizeof where you need it,
instead of assigning to a constant.

> +    struct iovec iov[ASPEED_HACE_MAX_SG];
> +    unsigned int i = 0;
> +    unsigned int isLast = 0;

This sounds like it's a boolean.

> +    uint8_t *digestBuf = NULL;
> +    size_t digestLen = 0, size = 0;
> +    struct aspeed_sg_list *sgList;
> +    int rc;

This needs some work to match qemu coding style.

> +
> +    reqSize = s->regs[R_HASH_SRC_LEN];
> +    dest = s->regs[R_HASH_DEST];
> +
> +    while (!isLast && i < ASPEED_HACE_MAX_SG) {
> +        src = s->regs[R_HASH_SRC] + (i * reqLen);
> +        len = reqLen;
> +        sgList = (struct aspeed_sg_list *) address_space_map(&s->dram_as,

You can remove this cast as the function returns a void pointer.

> +                                                                     src,
> +                                                         (hwaddr *) &len,

You can remove this cast as the variable is already a hwaddr type.

> +                                                                   false,
> +                                                 MEMTXATTRS_UNSPECIFIED);

In the direct access code, we use address_space_map to save copying
the memory contents that is to be hashed. That's not the case for the
scatter gather list.

Instead of creating mappings to read the sg list, you could load the
addr, len pairs using address_space_ldl_le. This would give you the
pointer to create mappings for.

> +        if (!sgList) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +             "%s: failed to map dram for SG Array entry '%u' for address '0x%0x'\n",
> +             __func__, i, src);
> +            rc = -EACCES;
> +            goto cleanup;
> +        }
> +        if (len != reqLen)
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +             "%s:  Warning: dram map for SG array entry '%u' requested size '%lu' != mapped size '%lu'\n",
> +             __func__, i, reqLen, len);
> +
> +        isLast = sgList->len & SG_LIST_LAST;

You could drop the isLast variable, and perform this test at the
bottom of the while loop:

if (sgList->len & SG_LIST_LAST)
   break;

> +
> +        iov[i].iov_len = (hwaddr) (sgList->len & SG_LIST_LEN_MASK);
> +        iov[i].iov_base = address_space_map(&s->dram_as,
> +                            sgList->phy_addr & SG_LIST_ADDR_MASK,
> +                            &iov[i].iov_len, false,
> +                            MEMTXATTRS_UNSPECIFIED);
> +        if (!iov[i].iov_base) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +             "%s: failed to map dram for SG array entry '%u' for region '0x%x', len '%u'\n",
> +             __func__, i, sgList->phy_addr & SG_LIST_ADDR_MASK,
> +             sgList->len & SG_LIST_LEN_MASK);
> +            rc = -EACCES;
> +            goto cleanup;
> +        }
> +        if (iov[i].iov_len != (sgList->len & SG_LIST_LEN_MASK))
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +             "%s:  Warning: dram map for SG region entry %u requested size %u != mapped size %lu\n",
> +             __func__, i, (sgList->len & SG_LIST_LEN_MASK), iov[i].iov_len);
> +
> +
> +        address_space_unmap(&s->dram_as, (void *) sgList, len, false,
> +                            len);
> +        size += iov[i].iov_len;
> +        i++;
> +    }
> +
> +    if (!isLast) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                     "%s: Error: Exhausted maximum of '%u' SG array entries\n",
> +                     __func__, ASPEED_HACE_MAX_SG);
> +        rc = -ENOTSUP;
> +        goto cleanup;
> +    }
> +
> +    if (size != reqSize)
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +         "%s: Warning: requested SG total size %u != actual size %lu\n",
> +         __func__, reqSize, size);
> +
> +    rc = qcrypto_hash_bytesv(algo, iov, i, &digestBuf, &digestLen,
> +                            &error_fatal);
> +    if (rc < 0) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n",
> +                      __func__);
> +        goto cleanup;
> +    }
> +
> +    rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
> +                             digestBuf, digestLen);
> +    if (rc)
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: address space write failed\n", __func__);
> +    g_free(digestBuf);
> +
> +cleanup:
> +
> +    for (; i > 0; i--) {
> +        address_space_unmap(&s->dram_as, iov[i - 1].iov_base,
> +                            iov[i - 1].iov_len, false,
> +                            iov[i - 1].iov_len);
> +    }
> +
> +    /*
> +     * Set status bits to indicate completion. Testing shows hardware sets
> +     * these irrespective of HASH_IRQ_EN.

This is the same comment from the direct method. Have you confirmed
this is true on hardware?

> +     */
> +    if (!rc) {
> +        s->regs[R_STATUS] |= HASH_IRQ;
> +    }
> +
> +    return rc;
> +}
> +
> +
>
>  static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> @@ -187,11 +302,6 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                            "%s: HMAC engine command mode %"PRIx64" not implemented",
>                            __func__, (data & HASH_HMAC_MASK) >> 8);
>          }
> -        if (data & HASH_SG_EN) {
> -            qemu_log_mask(LOG_UNIMP,
> -                          "%s: Hash scatter gather mode not implemented",
> -                          __func__);
> -        }
>          if (data & BIT(1)) {
>              qemu_log_mask(LOG_UNIMP,
>                            "%s: Cascaded mode not implemented",
> @@ -204,7 +314,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                          __func__, data & ahc->hash_mask);
>                  break;
>          }
> -        do_hash_operation(s, algo);
> +        if (data & HASH_SG_EN) {
> +            s->regs[(R_HASH_SRC >> 2)] &= 0x7FFFFFF8;

This is setting (0x20 / 4) >> 2 == 2, which is Crypto Data
Destination. I suspect you wanted R_HASH_SRC, so you can omit the
right shift.

However I suggest you check that hardware masks the register when the
write occurs, and if it does, implement that in the write callback for
R_HASH_SRC. That way a guest code doing a read-write will see the
correct thing.

> +            do_hash_sg_operation(s, algo);
> +        } else {
> +            do_hash_operation(s, algo);
> +        }
>
>          if (data & HASH_IRQ_EN) {
>              qemu_irq_raise(s->irq);
> diff --git a/include/hw/misc/aspeed_hace.h b/include/hw/misc/aspeed_hace.h
> index 94d5ada95f..ead46afda9 100644
> --- a/include/hw/misc/aspeed_hace.h
> +++ b/include/hw/misc/aspeed_hace.h
> @@ -40,4 +40,10 @@ struct AspeedHACEClass {
>      uint32_t hash_mask;
>  };
>
> +#define ASPEED_HACE_MAX_SG      256
> +struct aspeed_sg_list {
> +        uint32_t len;
> +        uint32_t phy_addr;

Does "phy" mean physical? If so, we could call it phys_addr to avoid
confusion with the addresses of PHYs.

Alternatively, call it 'addr'.

> +} __attribute__ ((__packed__));
> +
>  #endif /* _ASPEED_HACE_H_ */
> --
> 2.25.1
>
