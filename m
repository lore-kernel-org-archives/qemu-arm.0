Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp526995wrq;
        Fri, 15 Jun 2018 00:31:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIyVNje+T2Ths72U23AJCOhJ5TzYC+Z7F7jU3zgJNwsAzGm/H9EjQlo79029WDot0gPvrNF
X-Received: by 2002:a37:19e3:: with SMTP id 96-v6mr388007qkz.427.1529047883453;
        Fri, 15 Jun 2018 00:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529047883; cv=none;
        d=google.com; s=arc-20160816;
        b=DIsEOnmOZItel5kXThr4S/WRAer6lTuveEUEc0NL+/gHtWNLO+4wghN5/H0NZsc8dO
         XqsFyqNtPtzKQ59//5+cwMtAD5wm4EYRfrR7t4h6KmGdAZNrWfT89mR9ACSKnnYLAxp+
         S+yxUShQReyvNmcqWfzxCBdC20ifG+lXkdtCeJZ1YMPMwAE5UN1dtUQDM26BGHr74Gov
         mGAmxt6a7ousB71kK6jqsf+jsqLXBk2qhF22tn+5j8dM0Zs9DoSyvdUfdz9OegegCHjZ
         C68wdVsU1DBVjnxx9kW8tWLbbqqIdnsi494cxMeIx7+Jbn8RSbpfoJwYW3D0FbiBNjeM
         NtHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=QldiG2kwGkrAAUP/alD7kCL6S2OpXvB4QkLirw/9ZIg=;
        b=JgH0f+1nCAU3BZu16kz2ZRsUk4aBoTV1PvGHNlrlJ4lchN4LesRAMFkxbh0xDi5TTy
         RUFdJX5h/3iA62G6EPaZgVult+ursG6uoYC4S1OAQKt3YnoDkUxMZMFIk743PtqVjbwh
         O93UjSh0OghocApAMDJfonBp7USN6Ijh4xEAq1UVRz/NylVs/+4EEdtBuX7B4lFp2SMm
         UBI83TkOmLahbOisFFHwhI9OsMjWbMn0JE6LK9m5JIubZOKmE5WpFBGaatlbNk6Qio72
         ynH7ORGXE0mhpy21H4cmMpW9OGykXWAwuFdM5u6H2FXJ8vCUEz3eI21hR6JoHZ6sKjv9
         xTew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id f190-v6si680616qka.21.2018.06.15.00.31.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jun 2018 00:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCFCE818BAFD;
	Fri, 15 Jun 2018 07:31:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2821D63A74;
	Fri, 15 Jun 2018 07:31:19 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 08/13] hw/misc/tz_mpc.c: Honour the
 BLK_LUT settings in translate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-9-peter.maydell@linaro.org>
Cc: patches@linaro.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <64ff124d-fe34-75eb-e9e6-7c419827ee3c@redhat.com>
Date: Fri, 15 Jun 2018 09:31:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180604152941.20374-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 15 Jun 2018 07:31:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 15 Jun 2018 07:31:22 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: oMFlZFRw1LMU

Hi Peter,

On 06/04/2018 05:29 PM, Peter Maydell wrote:
> The final part of the Memory Protection Controller we need to
> implement is actually using the BLK_LUT data programmed by the
> guest to determine whether to block the transaction or not.
> 
> Since this means we now change transaction mappings when
> the guest writes to BLK_LUT, we must also call the IOMMU
> notifiers at that point.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/tz-mpc.c     | 50 ++++++++++++++++++++++++++++++++++++++++++--
>  hw/misc/trace-events |  1 +
>  2 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
> index 704bb3fb44d..7a6117c90b3 100644
> --- a/hw/misc/tz-mpc.c
> +++ b/hw/misc/tz-mpc.c
> @@ -72,6 +72,50 @@ static void tz_mpc_irq_update(TZMPC *s)
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
> +        if (!((oldlut ^ newlut) & (1 << i))) {
> +            continue;
> +        }
> +        /* This changes the mappings for both the S and the NS space,
> +         * so we need to do four notifies: an UNMAP then a MAP for each.
> +         */
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

> +        if (newlut & (1 << i)) {
Add a comment saying the block is configured as non-secure?
> +            entry.target_as = &s->blocked_io_as;
> +        } else {
> +            entry.target_as = &s->downstream_as;
so this disallows any secure access to non secure blocks. I have a
reduced knowledge of TZ but I would have thought that a secure access
would have sufficient priviledge to access NS memory?

Thanks

Eric
> +        }
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_S, entry);
> +        if (newlut & (1 << i)) {
> +            entry.target_as = &s->downstream_as;
> +        } else {
> +            entry.target_as = &s->blocked_io_as;
> +        }
> +        memory_region_notify_iommu(&s->upstream, IOMMU_IDX_NS, entry);
> +    }
> +}
> +
>  static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
>                                     uint64_t *pdata,
>                                     unsigned size, MemTxAttrs attrs)
> @@ -213,6 +257,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
>          s->blk_idx = value % s->blk_max;
>          break;
>      case A_BLK_LUT:
> +        tz_mpc_iommu_notify(s, s->blk_idx, s->blk_lut[s->blk_idx], value);
>          s->blk_lut[s->blk_idx] = value;
>          if (size == 4) {
>              s->blk_idx++;
> @@ -362,9 +407,10 @@ static IOMMUTLBEntry tz_mpc_translate(IOMMUMemoryRegion *iommu,
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
