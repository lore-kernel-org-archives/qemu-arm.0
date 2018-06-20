Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp899254wrq;
        Wed, 20 Jun 2018 08:28:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ1H3alwGjjf6UpxF8Fxmhvkg11jsCANrzI3TklcZRo4WcfJ3F4DbfYqiwYL+e/dq3nWegL
X-Received: by 2002:ac8:2752:: with SMTP id h18-v6mr19815777qth.187.1529508521250;
        Wed, 20 Jun 2018 08:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529508521; cv=none;
        d=google.com; s=arc-20160816;
        b=rgE48hxcaKoP2ZOJDUlhvUOGadpBaDxS+UEbI7srogUOCOT21va9/mSa+a9dQRlNUu
         vIkPBgQUyU/xQpKRy13uxJcLgZUZmLs31XevwOrZAJxPharZOUXwfLiU6sLa+2VpoyYl
         W/o+mkbqX68sQ/tReXTr/+MdPVrLBieUjxeoMsTrwU/3hWqN/lEal0pR/lVuutVDOkzQ
         lgBCcOmiTr6uDqpGGmeDQsOroFVWktKQJKwN2QHS6Kg4lfB1+ju6lHZmvDUQQpzDumEu
         Vqo1GrBZCFB0fF2iul3cl/X/otk/AOqrFrOX8VQL3K5Y5I7/jRiCC8KWWPeK3Iq5o39T
         nAeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=zeAaUJsfcM2p694UrXkSkvgeKyhmvik9mO5cgmX08O4=;
        b=YrGsQwytBD4SD1YwMfkTyB6xfQaqA6ost1n4sU2PflEgTe1juN9luJGUKydH5zRNnF
         sKu6rgxQd2Nzgr/P1RWN/jyPB0+vidbYyTb+efe3eX0ZgjrINbLpH7ShI6dI+4844Cmf
         a2/go5vM86FO5I7pCQXyLHpZbT5iK6+69GU07DeSgn+3xv/71EgCS7R6hqAkRiFDg/yt
         AstpykEM9lI7NH3sPQBRSVsr+5+GxChzRXFbXzXQ2M9zVfbnyS48f1l/OAfZOaFZnxw1
         BJH1R0ZgrKTGKyMAHBxZAOnxd85weH1ncWRdkNs6DT/Vlw5dcmZsUVCZapxJ4yixpUVL
         l3qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id i65-v6si2499563qkf.384.2018.06.20.08.28.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 08:28:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABB6F8163C40;
	Wed, 20 Jun 2018 15:28:40 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com [10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B089D111E40F;
	Wed, 20 Jun 2018 15:28:39 +0000 (UTC)
Subject: Re: [PATCH v3 4/8] hw/misc/tz_mpc.c: Honour the BLK_LUT settings in
 translate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20180620132032.28865-1-peter.maydell@linaro.org>
 <20180620132032.28865-5-peter.maydell@linaro.org>
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <365ecc27-d270-cfe4-9b9e-d1adb0718621@redhat.com>
Date: Wed, 20 Jun 2018 17:28:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180620132032.28865-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 20 Jun 2018 15:28:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 20 Jun 2018 15:28:40 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: yidgkoihnQz3

Hi Peter,

On 06/20/2018 03:20 PM, Peter Maydell wrote:
> The final part of the Memory Protection Controller we need to
> implement is actually using the BLK_LUT data programmed by the
> guest to determine whether to block the transaction or not.
> 
> Since this means we now change transaction mappings when
> the guest writes to BLK_LUT, we must also call the IOMMU
> notifiers at that point.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  hw/misc/tz-mpc.c     | 53 ++++++++++++++++++++++++++++++++++++++++++--
>  hw/misc/trace-events |  1 +
>  2 files changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
> index fded5922a21..8316079b4bf 100644
> --- a/hw/misc/tz-mpc.c
> +++ b/hw/misc/tz-mpc.c
> @@ -72,6 +72,53 @@ static void tz_mpc_irq_update(TZMPC *s)
>      qemu_set_irq(s->irq, s->int_stat && s->int_en);
>  }
>  
> +static void tz_mpc_iommu_notify(TZMPC *s, uint32_t lutidx,
> +                                uint32_t oldlut, uint32_t newlut)
> +{
> +    /* Called when the LUT word at lutidx has changed from oldlut to newlut;
> +     * must call the IOMMU notifiers for the changed blocks.
> +     */
> +    IOMMUTLBEntry entry = {
> +        .addr_mask = s->blocksize - 1,
> +    };
> +    hwaddr addr = lutidx * s->blocksize * 32;
> +    int i;
> +
> +    for (i = 0; i < 32; i++, addr += s->blocksize) {
> +        bool block_is_ns;
> +
> +        if (!((oldlut ^ newlut) & (1 << i))) {
> +            continue;
> +        }
> +        /* This changes the mappings for both the S and the NS space,
> +         * so we need to do four notifies: an UNMAP then a MAP for each.
> +         */
> +        block_is_ns = newlut & (1 << i);
> +
> +        trace_tz_mpc_iommu_notify(addr);
> +        entry.iova = addr;
> +        entry.translated_addr = addr;
> +
> +        entry.perm = IOMMU_NONE;
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
> +
> +        entry.perm = IOMMU_RW;
> +        if (block_is_ns) {
> +            entry.target_as = &s->blocked_io_as;
> +        } else {
> +            entry.target_as = &s->downstream_as;
> +        }
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
> +        if (block_is_ns) {
> +            entry.target_as = &s->downstream_as;
> +        } else {
> +            entry.target_as = &s->blocked_io_as;
> +        }
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
> +    }
> +}
> +
>  static void tz_mpc_autoinc_idx(TZMPC *s, unsigned access_size)
>  {
>      /* Auto-increment BLK_IDX if necessary */
> @@ -237,6 +284,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
>          s->blk_idx = value % s->blk_max;
>          break;
>      case A_BLK_LUT:
> +        tz_mpc_iommu_notify(s, s->blk_idx, s->blk_lut[s->blk_idx], value);
>          s->blk_lut[s->blk_idx] = value;
>          tz_mpc_autoinc_idx(s, size);
>          break;
> @@ -383,9 +431,10 @@ static IOMMUTLBEntry tz_mpc_translate(IOMMUMemoryRegion *iommu,
>      /* Look at the per-block configuration for this address, and
>       * return a TLB entry directing the transaction at either
>       * downstream_as or blocked_io_as, as appropriate.
> -     * For the moment, always permit accesses.
> +     * If the LUT cfg_ns bit is 1, only non-secure transactions
> +     * may pass. If the bit is 0, only secure transactions may pass.
>       */
> -    ok = true;
> +    ok = tz_mpc_cfg_ns(s, addr) == (iommu_idx == IOMMU_IDX_NS);
>  
>      trace_tz_mpc_translate(addr, flags,
>                             iommu_idx == IOMMU_IDX_S ? "S" : "NS",
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 72bf9d57000..c956e1419b7 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -90,6 +90,7 @@ tz_mpc_reg_write(uint32_t offset, uint64_t data, unsigned size) "TZ MPC regs wri
>  tz_mpc_mem_blocked_read(uint64_t addr, unsigned size, bool secure) "TZ MPC blocked read: offset 0x%" PRIx64 " size %u secure %d"
>  tz_mpc_mem_blocked_write(uint64_t addr, uint64_t data, unsigned size, bool secure) "TZ MPC blocked write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
>  tz_mpc_translate(uint64_t addr, int flags, const char *idx, const char *res) "TZ MPC translate: addr 0x%" PRIx64 " flags 0x%x iommu_idx %s: %s"
> +tz_mpc_iommu_notify(uint64_t addr) "TZ MPC iommu: notifying UNMAP/MAP for 0x%" PRIx64
>  
>  # hw/misc/tz-ppc.c
>  tz_ppc_reset(void) "TZ PPC: reset"
> 
