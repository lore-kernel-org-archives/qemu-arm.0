Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2503784wrq;
        Thu, 14 Jun 2018 13:40:25 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK4Xw+ZcDhuro8dWZ4zBe1OGHJtoFczh2wqOCr8HNUtXxPPSdsaGpZAefoEiSliXCt3xbEc
X-Received: by 2002:a0c:b52c:: with SMTP id d44-v6mr3935563qve.34.1529008825165;
        Thu, 14 Jun 2018 13:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529008825; cv=none;
        d=google.com; s=arc-20160816;
        b=JNQABL4F0Fgi3FFcHATnDQUF8tMjocD1+Dx0ndAutPPK82PjcnEE3uDcOd98JufZo2
         v1hgl7Bw+V6drhqGCZ30y2fxKPt2csmN/cN93PbZis8mZh5opTe6qgYpc9bUM92qGcuz
         hzZTofBh/OQVCEzfyz7DfT7RdebogMUJQHNtb2IrYvMd1xoizfgCZcNV1AShm96N5I/v
         fSRoFMPBsxciTGiFJdK2NdH+efmrni7jUJBwVehnTEsrCRv7fCX5AwNbIqMbWiQ1OkpT
         J29v1pOrXfRY+ndedAHKjoShPnW/53x0gnihhKil1j5tz6culv3gB+w5Ku5FkLuxYz+L
         2Gng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=6XRtwPrXR/ImzfSsEBZPix7BlxcFgox7/UyClZOiCww=;
        b=Q6KnqY9TRRCxzdY+7HZ+fWqrpLvmmQWzypjnC/nAIo3boLvUoJdxTwkXAOUFF6q/C8
         Rh/jXktz7P/O+pw5SbN0HbYmeL0qtrH8kRHwWmgdiFBLWj8pZJWRWCebQJgqmcLhRBDb
         H7ih7n/VSnqFLCYwiuGZ7z9gqIFihdweQi+UA1vE7wefSvSHdxHnnPw4Z9+6NheMXrMQ
         TGb3E9DYd3+o+bQaCLSTXRWaqW9wx9l2/zFoSji9xAZrIXgaMk0r2/I/KiSak8w9jT1Q
         0jI1fxLG3bsO5htK1N1oz8TcVjqyOXe9rnG9RorIbbW+W//v+pW/LwjhIrM6LxxjUAQb
         ABNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id j10-v6si6487007qkh.150.2018.06.14.13.40.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2CBB40704B0;
	Thu, 14 Jun 2018 20:40:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11F4323151;
	Thu, 14 Jun 2018 20:40:20 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2 07/13] hw/misc/tz-mpc.c: Implement correct
 blocked-access behaviour
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20180604152941.20374-1-peter.maydell@linaro.org>
 <20180604152941.20374-8-peter.maydell@linaro.org>
Cc: patches@linaro.org, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a7777026-e81c-45c7-3920-66f4b7146b41@redhat.com>
Date: Thu, 14 Jun 2018 22:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180604152941.20374-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 14 Jun 2018 20:40:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 14 Jun 2018 20:40:24 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: bFVvjeNz2Mah

Hi Peter,
On 06/04/2018 05:29 PM, Peter Maydell wrote:
> The MPC is guest-configurable for whether blocked accesses:
>  * should be RAZ/WI or cause a bus error
>  * should generate an interrupt or not
> 
> Implement this behaviour in the blocked-access handlers.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/tz-mpc.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
> index 9db55e23daf..704bb3fb44d 100644
> --- a/hw/misc/tz-mpc.c
> +++ b/hw/misc/tz-mpc.c
> @@ -43,6 +43,9 @@ REG32(INT_EN, 0x28)
>      FIELD(INT_EN, IRQ, 0, 1)
>  REG32(INT_INFO1, 0x2c)
>  REG32(INT_INFO2, 0x30)
> +    FIELD(INT_INFO2, HMASTER, 0, 16)
> +    FIELD(INT_INFO2, HNONSEC, 16, 1)
> +    FIELD(INT_INFO2, CFG_NS, 17, 1)
>  REG32(INT_SET, 0x34)
>      FIELD(INT_SET, IRQ, 0, 1)
>  REG32(PIDR4, 0xfd0)
> @@ -266,6 +269,45 @@ static const MemoryRegionOps tz_mpc_reg_ops = {
>      .impl.max_access_size = 4,
>  };
>  
> +static inline bool tz_mpc_cfg_ns(TZMPC *s, hwaddr addr)
> +{
> +    /* Return the cfg_ns bit from the LUT for the specified address */
> +    hwaddr blknum = addr / s->blocksize;
> +    hwaddr blkword = blknum / 32;
> +    uint32_t blkbit = 1U << (blknum % 32);
> +
> +    /* This would imply the address was larger than the size we
> +     * defined this memory region to be, so it can't happen.
> +     */
> +    assert(blkword < s->blk_max);
> +    return s->blk_lut[blkword] & blkbit;
> +}
> +
> +static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs attrs)
> +{
> +    /* Handle a blocked transaction: raise IRQ, capture info, etc */
> +    if (!s->int_stat) {
> +        /* First blocked transfer: capture information into INT_INFO1 and
> +         * INT_INFO2. Subsequent transfers are still blocked but don't
> +         * capture information until the guest clears the interrupt.
> +         */
> +
> +        s->int_info1 = addr;
> +        s->int_info2 = 0;
> +        s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
> +                                  attrs.requester_id & 0xffff);
> +        s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
> +                                  ~attrs.secure);
> +        s->int_info2 = FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
> +                                  tz_mpc_cfg_ns(s, addr));
> +        s->int_stat |= R_INT_STAT_IRQ_MASK;
> +        tz_mpc_irq_update(s);
> +    }
> +
> +    /* Generate bus error if desired; otherwise RAZ/WI */
> +    return (s->ctrl & R_CTRL_SEC_RESP_MASK) ? MEMTX_ERROR : MEMTX_OK;
> +}
> +
>  /* Accesses only reach these read and write functions if the MPC is
>   * blocking them; non-blocked accesses go directly to the downstream
>   * memory region without passing through this code.
> @@ -274,19 +316,23 @@ static MemTxResult tz_mpc_mem_blocked_read(void *opaque, hwaddr addr,
>                                             uint64_t *pdata,
>                                             unsigned size, MemTxAttrs attrs)
>  {
> +    TZMPC *s = TZ_MPC(opaque);
> +
>      trace_tz_mpc_mem_blocked_read(addr, size, attrs.secure);
>  
>      *pdata = 0;
> -    return MEMTX_OK;
> +    return tz_mpc_handle_block(s, addr, attrs);
>  }
>  
>  static MemTxResult tz_mpc_mem_blocked_write(void *opaque, hwaddr addr,
>                                              uint64_t value,
>                                              unsigned size, MemTxAttrs attrs)
>  {
> +    TZMPC *s = TZ_MPC(opaque);
> +
>      trace_tz_mpc_mem_blocked_write(addr, value, size, attrs.secure);
>  
> -    return MEMTX_OK;
> +    return tz_mpc_handle_block(s, addr, attrs);
>  }
>  
>  static const MemoryRegionOps tz_mpc_mem_blocked_ops = {
> 

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

