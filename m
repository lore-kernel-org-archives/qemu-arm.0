Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp2001837ejb;
        Fri, 10 Feb 2023 08:12:15 -0800 (PST)
X-Google-Smtp-Source: AK7set8wM7VC5Zr9NKqKDEDNNsEPG2y/BWJ0oYV/D9OioXOJoMZzYJ3+rXGSxX33iOnqGRnqmsgk
X-Received: by 2002:a81:e504:0:b0:506:3b24:d064 with SMTP id s4-20020a81e504000000b005063b24d064mr9703506ywl.11.1676045535671;
        Fri, 10 Feb 2023 08:12:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676045535; cv=none;
        d=google.com; s=arc-20160816;
        b=k79pUIC+zDEFgmu7oA7Tb8pk8MoA4S72yAS51G/bgkrK0Ea08kFTGkBHGoL8FMSzmS
         FfjtvFqrPnY/f3hD9zhTBxZruhK/FjErckDZpA4Rf3rrx7b5N8JFBLFtp7au5XCXUuSs
         SZi1fPou2+sHEtZeVbZWyeGwTEQpkgJtZYEWnesJQ5klkxVdVEHF4FdrynwUdKEREepZ
         O2oEBCR6PmYGZL4L6e24IiKAia0+z//juPUgi0xZNLWU3vczUWYXoVL6tQ2y++03HgX4
         hLwhrb9o7LdrZE6nYfoPBuew1UKlTCI6l1zL3MRDfTxcKc5DRjo1Te0tC2yq2SydM0si
         V50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=qpfrdRiTrOFu+eePgIZ4zygNHcEjoi+61NFFXvwTwuQ=;
        b=TSQMvT3ujVOaJKmdyKIZUbk7+WfyiSlLTF1so7BE6dbKP6rPJREe6jI5Gwmep6Cg+X
         n8VovdhI+BbRngCiRepczHg5fAwpoFjyNPPebUWD+qGhSf8VUTeq1D450Gxv8K5VKmB7
         GBB6/yn1f2C0QTjfdVSvevNjHxsraKR4WMF7zwhvEf/uB5Uj/Yc43qTIHbrRbmeg4pE9
         5qO3RNQFHJWNgpjk9vbwN+KBZFSn73Shzde7KH0WZCaCcrfVGEJhQrFWldqq8cATQvZg
         D+1cTSS+U0sIdx1fBQIYtQRu0iaTu4ONiRWLYWeNQofZOjqRVtzh6wpbRu6ml1MW/MJ0
         t27g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qj6IHFHl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020ab0604d000000b006839d980019si1988576ual.109.2023.02.10.08.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 08:12:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qj6IHFHl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQW0C-0004OF-7a; Fri, 10 Feb 2023 11:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQW09-0004N6-1c
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:11:53 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQW07-0003ZF-4m
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:11:52 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso759497pjr.4
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676045509;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qpfrdRiTrOFu+eePgIZ4zygNHcEjoi+61NFFXvwTwuQ=;
 b=Qj6IHFHlX13hUqK/LMBNIr26+vW3qbJh8YkPn9njM3aTbrE6Fue5S57s5MJv7oWaCu
 JhUCSxhU9RscrwW5cVMQ0/McARpAq/bd9e7S85TFV1LRZLk73tWUrBiD5ck3tq9U5leb
 RKabkAk/qd2WLl/uwvcLaLS0pRbcAUsoio7UXWFPuEPh8uv+aHw8PM/Cz5GvXu8/nS8A
 fDYDBAvSR4oUQjVDfjONIG9DQigGGpplZThAsSt2us1XSZrMP8WcnDOM+0OMjOSHiK2C
 fmYxWDmsj4EhXdXpD/0oOWRbkA5fAZBTLmXHl72qkdqD0GsXV1eq0GIAJv64S+mp12zB
 mKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676045509;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qpfrdRiTrOFu+eePgIZ4zygNHcEjoi+61NFFXvwTwuQ=;
 b=BqcLHIhTl2z3lGUS+WSx523jjib7/ncZJWDA8g4DSDD2tERCGpTU1+DjuGXhS9sIYo
 91IirrBnLudA98An2W/Uf/NO3GNzzsfaG9Gduu+0pCX2mXg8vCM/WCOlc+zLxXFTpHkU
 nvU1ZUuFktuy4QyEk8uNQdVGRkxXZh9jXQOmxbKR/KSriPbG+bN8Jxa21vuBVm5E699O
 b6XRiWa+5KPAeiHyhw67HJUmHi+2+gtvQSN4eObyGhRJ67/vN5L+W28FyFHDTSOzOZ8e
 FsojNU7I9O7Gs6iZNym/ccC10znuhB5wFUce2tqmz8J36FKYfqFw5Oh3l8ByDkEiFHIT
 MYdg==
X-Gm-Message-State: AO0yUKXJE2cd+TIwsIXAq+qm3Twyf9XZ+9ckzb4KsPLTgjTtfPWc6BVK
 1snI0PodGQk/jEAIGX0OB5ckZAMlRwxDDMKm3j9yDQ==
X-Received: by 2002:a17:902:6b88:b0:199:1458:6c67 with SMTP id
 p8-20020a1709026b8800b0019914586c67mr4070222plk.28.1676045509070; Fri, 10 Feb
 2023 08:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20230207181933.1999817-1-smostafa@google.com>
In-Reply-To: <20230207181933.1999817-1-smostafa@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:11:37 +0000
Message-ID: <CAFEAcA_WW1_d3y6qE3G99cZKyPPwycKAbkGDM=5_6B9t1uDQ6Q@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/smmuv3: Add GBPA register
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ier4IN9NzkAY

On Tue, 7 Feb 2023 at 18:31, Mostafa Saleh <smostafa@google.com> wrote:
>
> GBPA register can be used to globally abort all
> transactions.
>
> It is described in the SMMU manual in "6.3.14 SMMU_GBPA".
> ABORT reset value is IMPLEMENTATION DEFINED, it is chosen to
> be zero(Do not abort incoming transactions).
>
> Other fields have default values of Use Incoming.
>
> If UPDATE is not set, the write is ignored. This is the only permitted
> behavior in SMMUv3.2 and later.(6.3.14.1 Update procedure)
>
> As this patch adds a new state to the SMMU (GBPA), it is added
> in a new subsection for forward migration compatibility.
> GBPA is only migrated when GBPA.ABORT is set from SW at the time of
> migration, to avoid inconsistencies where a qemu instance is aborting
> transactions and it is migrated to another older instance bypassing
> them.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>
> Changes in v3:
> - Remove migrate_gbpa property as it was unnecessary.
>
> Changes in v2:
> - GBPA is effective only when SMMU is not enabled.
> - Ignore GBPA write when UPDATE is not set.
> - Default value for SHCFG is "Use Incoming".
> - Support migration.
>
>  hw/arm/smmuv3-internal.h |  5 ++++
>  hw/arm/smmuv3.c          | 52 +++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/smmuv3.h  |  1 +
>  3 files changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index bce161870f..3ff704248d 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -79,6 +79,11 @@ REG32(CR0ACK,              0x24)
>  REG32(CR1,                 0x28)
>  REG32(CR2,                 0x2c)
>  REG32(STATUSR,             0x40)
> +REG32(GBPA,                0x44)
> +    FIELD(GBPA, SHCFG,        12, 2)
> +    FIELD(GBPA, ABORT,        20, 1)
> +    FIELD(GBPA, UPDATE,       31, 1)
> +
>  REG32(IRQ_CTRL,            0x50)
>      FIELD(IRQ_CTRL, GERROR_IRQEN,        0, 1)
>      FIELD(IRQ_CTRL, PRI_IRQEN,           1, 1)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 955b89c8d5..a184665181 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -285,6 +285,8 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->gerror = 0;
>      s->gerrorn = 0;
>      s->statusr = 0;
> +    /* Use incoming as other fields. */
> +    s->gbpa = FIELD_DP32(s->gbpa, GBPA, SHCFG, 1);
>  }
>
>  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
> @@ -659,7 +661,11 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>      qemu_mutex_lock(&s->mutex);
>
>      if (!smmu_enabled(s)) {
> -        status = SMMU_TRANS_DISABLE;
> +        if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
> +            status = SMMU_TRANS_ABORT;
> +        } else {
> +            status = SMMU_TRANS_DISABLE;
> +        }
>          goto epilogue;
>      }
>
> @@ -1170,6 +1176,16 @@ static MemTxResult smmu_writel(SMMUv3State *s, hwaddr offset,
>      case A_GERROR_IRQ_CFG2:
>          s->gerror_irq_cfg2 = data;
>          return MEMTX_OK;
> +    case A_GBPA:
> +        /*
> +         * If UPDATE is not set, the write is ignored. This is the only
> +         * permitted behavior in SMMUv3.2 and later.
> +         */
> +        if (data & R_GBPA_UPDATE_MASK) {
> +            /* Ignore update bit as write is synchronous. */
> +            s->gbpa = data & ~R_GBPA_UPDATE_MASK;
> +        }
> +        return MEMTX_OK;
>      case A_STRTAB_BASE: /* 64b */
>          s->strtab_base = deposit64(s->strtab_base, 0, 32, data);
>          return MEMTX_OK;
> @@ -1318,6 +1334,9 @@ static MemTxResult smmu_readl(SMMUv3State *s, hwaddr offset,
>      case A_STATUSR:
>          *data = s->statusr;
>          return MEMTX_OK;
> +    case A_GBPA:
> +        *data = s->gbpa;
> +        return MEMTX_OK;
>      case A_IRQ_CTRL:
>      case A_IRQ_CTRL_ACK:
>          *data = s->irq_ctrl;
> @@ -1482,6 +1501,33 @@ static const VMStateDescription vmstate_smmuv3_queue = {
>      },
>  };
>
> +static bool smmuv3_gbpa_needed(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +
> +    /*
> +     * Only migrate GBPA if ABORT set from SW to 1, which is different from
> +     * default behaviour. This allows maximum compatibility with old qemu
> +     * instances while being forward compatible.
> +     */
> +    if (FIELD_EX32(s->gbpa, GBPA, ABORT)) {
> +        return true;
> +    }

I think we should check the whole register against its reset value,
not just the ABORT bit. Otherwise if the guest writes the other fields
to non default values we won't migrate them. That doesn't change the
device behaviour now but it will have the weird effect that the guest
could write the register and then after a migration find it reading
back as a different value. Plus if in future we implement actual
functionality for any of the other fields then we'll want to know
what their true values written by the guest are.

Linux never changes any fields except ABORT so for the most interesting
guest it won't make a difference right now.

thanks
-- PMM
