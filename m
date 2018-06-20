Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp896629wrq;
        Wed, 20 Jun 2018 08:26:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIWP5M91S767CXZn/a6F378nvIrORcQLNUQTHoOKTKMTfxN3Z0ytj8SttQlkx6BCO1Oh08o
X-Received: by 2002:ac8:2acb:: with SMTP id c11-v6mr19757053qta.147.1529508367648;
        Wed, 20 Jun 2018 08:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529508367; cv=none;
        d=google.com; s=arc-20160816;
        b=IKx1yWgCr0OujVczNo+G/sa8oN5aU87EZxbrNpY3QZOZ78tQuWMnR0AxvwZ23znIPX
         Aju2Yfywh5wHJWx4cdm3SFCmOJApedYfcGRD4SNmCiC1X+YUm4GppEw5riwMwk/TkNRm
         03xxwZxloVlJ4pFVyjgHtjVgpKj1hBgZ/nBsCw217S2HeSwTOXAtz50jx3SDzPMtTxrT
         xbRdYgI5PWZGChjVDl6iJdtMuXUoc324bEbOXNauDpnPMgZsppBnsovnZ1j9GbbpCc9l
         qLubko2NDKXc9wMqw7wXqxjTpmQrgmyR8R2AY+pQody3ONkv7GJQIfgVuBHOhk1guOUD
         M0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=1qvpPNLSJIb4xcsatmMkSZ2R8DI/HnjwS/gq4HmElMc=;
        b=KuhvJpoyzT4KEQt6lnnc9zSebHmgbWk5B1n59zDMaT6KpuMIgiPDAjQZb1sQQBTD/w
         CXmRPZQJxF4HSWe0maoroY+yXqgaMXmLEjqyUBymM/Nc44mPJ6cmA2epu7bkzctAahvb
         sHeYd1VFF0TiXPGY/Ub38ZWza2acCOZ2UAMuWprG39DOT8bboUl3Fs0oq+dFa4Q1ua67
         /nnvfN7EwbDRfARX9WFzxDnJv2Txpvi617iRW4aG00kW6yAsQfzo+CXPA5EqCngJzxWR
         zStNOdEpQ43e4U3qW/a5qCk/QIjnFs+szjB+HAmYI4qUDE/hcYJltah7zw7r8SpV3Yj/
         KzWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id r139-v6si1833918qke.356.2018.06.20.08.26.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jun 2018 08:26:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBD0A40201A2;
	Wed, 20 Jun 2018 15:26:06 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-106.ams2.redhat.com [10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 096C01C589;
	Wed, 20 Jun 2018 15:26:05 +0000 (UTC)
Subject: Re: [PATCH v3 2/8] hw/misc/tz-mpc.c: Implement registers
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20180620132032.28865-1-peter.maydell@linaro.org>
 <20180620132032.28865-3-peter.maydell@linaro.org>
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8ba4603d-8b79-ccef-907b-98254ccd7e71@redhat.com>
Date: Wed, 20 Jun 2018 17:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180620132032.28865-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 20 Jun 2018 15:26:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 20 Jun 2018 15:26:07 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: Oat/Y95fCPOF

Hi Peter,

On 06/20/2018 03:20 PM, Peter Maydell wrote:
> Implement the missing registers for the TZ MPC.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/tz-mpc.h |  10 +++
>  hw/misc/tz-mpc.c         | 142 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 148 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/misc/tz-mpc.h b/include/hw/misc/tz-mpc.h
> index d1a65fd9a38..6f15945410d 100644
> --- a/include/hw/misc/tz-mpc.h
> +++ b/include/hw/misc/tz-mpc.h
> @@ -48,6 +48,16 @@ struct TZMPC {
>  
>      /*< public >*/
>  
> +    /* State */
> +    uint32_t ctrl;
> +    uint32_t blk_idx;
> +    uint32_t int_stat;
> +    uint32_t int_en;
> +    uint32_t int_info1;
> +    uint32_t int_info2;
> +
> +    uint32_t *blk_lut;
> +
>      qemu_irq irq;
>  
>      /* Properties */
> diff --git a/hw/misc/tz-mpc.c b/hw/misc/tz-mpc.c
> index 569bccfda7a..e5b91bf81a3 100644
> --- a/hw/misc/tz-mpc.c
> +++ b/hw/misc/tz-mpc.c
> @@ -28,16 +28,23 @@ enum {
>  
>  /* Config registers */
>  REG32(CTRL, 0x00)
> +    FIELD(CTRL, SEC_RESP, 4, 1)
> +    FIELD(CTRL, AUTOINC, 8, 1)
> +    FIELD(CTRL, LOCKDOWN, 31, 1)
>  REG32(BLK_MAX, 0x10)
>  REG32(BLK_CFG, 0x14)
>  REG32(BLK_IDX, 0x18)
>  REG32(BLK_LUT, 0x1c)
>  REG32(INT_STAT, 0x20)
> +    FIELD(INT_STAT, IRQ, 0, 1)
>  REG32(INT_CLEAR, 0x24)
> +    FIELD(INT_CLEAR, IRQ, 0, 1)
>  REG32(INT_EN, 0x28)
> +    FIELD(INT_EN, IRQ, 0, 1)
>  REG32(INT_INFO1, 0x2c)
>  REG32(INT_INFO2, 0x30)
>  REG32(INT_SET, 0x34)
> +    FIELD(INT_SET, IRQ, 0, 1)
>  REG32(PIDR4, 0xfd0)
>  REG32(PIDR5, 0xfd4)
>  REG32(PIDR6, 0xfd8)
> @@ -57,10 +64,25 @@ static const uint8_t tz_mpc_idregs[] = {
>      0x0d, 0xf0, 0x05, 0xb1,
>  };
>  
> +static void tz_mpc_irq_update(TZMPC *s)
> +{
> +    qemu_set_irq(s->irq, s->int_stat && s->int_en);
> +}
> +
> +static void tz_mpc_autoinc_idx(TZMPC *s, unsigned access_size)
> +{
> +    /* Auto-increment BLK_IDX if necessary */
> +    if (access_size == 4 && (s->ctrl & R_CTRL_AUTOINC_MASK)) {
> +        s->blk_idx++;
> +        s->blk_idx %= s->blk_max;
> +    }
> +}
> +
>  static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
>                                     uint64_t *pdata,
>                                     unsigned size, MemTxAttrs attrs)
>  {
> +    TZMPC *s = TZ_MPC(opaque);
>      uint64_t r;
>      uint32_t offset = addr & ~0x3;
>  
> @@ -74,6 +96,38 @@ static MemTxResult tz_mpc_reg_read(void *opaque, hwaddr addr,
>      }
>  
>      switch (offset) {
> +    case A_CTRL:
> +        r = s->ctrl;
> +        break;
> +    case A_BLK_MAX:
> +        r = s->blk_max;
> +        break;
> +    case A_BLK_CFG:
> +        /* We are never in "init in progress state", so this just indicates
> +         * the block size. s->blocksize == (1 << BLK_CFG + 5), so
> +         * BLK_CFG == ctz32(s->blocksize) - 5
> +         */
> +        r = ctz32(s->blocksize) - 5;
> +        break;
> +    case A_BLK_IDX:
> +        r = s->blk_idx;
> +        break;
> +    case A_BLK_LUT:
> +        r = s->blk_lut[s->blk_idx];
> +        tz_mpc_autoinc_idx(s, size);
> +        break;
> +    case A_INT_STAT:
> +        r = s->int_stat;
> +        break;
> +    case A_INT_EN:
> +        r = s->int_en;
> +        break;
> +    case A_INT_INFO1:
> +        r = s->int_info1;
> +        break;
> +    case A_INT_INFO2:
> +        r = s->int_info2;
> +        break;
>      case A_PIDR4:
>      case A_PIDR5:
>      case A_PIDR6:
> @@ -120,6 +174,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
>                                      uint64_t value,
>                                      unsigned size, MemTxAttrs attrs)
>  {
> +    TZMPC *s = TZ_MPC(opaque);
>      uint32_t offset = addr & ~0x3;
>  
>      trace_tz_mpc_reg_write(addr, value, size);
> @@ -127,7 +182,7 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
>      if (!attrs.secure && offset < A_PIDR4) {
>          /* NS accesses can only see the ID registers */
When reading
"Identification registers can be read by any type of access." I
understand all others can only be read by secure accesses. So I would
have expected the same check on read side.

Besides

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "TZ MPC register read: NS access to offset 0x%x\n",
> +                      "TZ MPC register write: NS access to offset 0x%x\n",
>                        offset);
>          return MEMTX_OK;
>      }
> @@ -140,9 +195,15 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
>          uint32_t oldval;
>  
>          switch (offset) {
> -            /* As we add support for registers which need expansions
> -             * other than zeroes we'll fill in cases here.
> -             */
> +        case A_CTRL:
> +            oldval = s->ctrl;
> +            break;
> +        case A_BLK_IDX:
> +            oldval = s->blk_idx;
> +            break;
> +        case A_BLK_LUT:
> +            oldval = s->blk_lut[s->blk_idx];
> +            break;
>          default:
>              oldval = 0;
>              break;
> @@ -150,7 +211,48 @@ static MemTxResult tz_mpc_reg_write(void *opaque, hwaddr addr,
>          value = deposit32(oldval, (addr & 3) * 8, size * 8, value);
>      }
>  
> +    if ((s->ctrl & R_CTRL_LOCKDOWN_MASK) &&
> +        (offset == A_CTRL || offset == A_BLK_LUT || offset == A_INT_EN)) {
> +        /* Lockdown mode makes these three registers read-only, and
> +         * the only way out of it is to reset the device.
> +         */
> +        qemu_log_mask(LOG_GUEST_ERROR, "TZ MPC register write to offset 0x%x "
> +                      "while MPC is in lockdown mode\n", offset);
> +        return MEMTX_OK;
> +    }
> +
>      switch (offset) {
> +    case A_CTRL:
> +        /* We don't implement the 'data gating' feature so all other bits
> +         * are reserved and we make them RAZ/WI.
> +         */
> +        s->ctrl = value & (R_CTRL_SEC_RESP_MASK |
> +                           R_CTRL_AUTOINC_MASK |
> +                           R_CTRL_LOCKDOWN_MASK);
> +        break;
> +    case A_BLK_IDX:
> +        s->blk_idx = value % s->blk_max;
> +        break;
> +    case A_BLK_LUT:
> +        s->blk_lut[s->blk_idx] = value;
> +        tz_mpc_autoinc_idx(s, size);
> +        break;
> +    case A_INT_CLEAR:
> +        if (value & R_INT_CLEAR_IRQ_MASK) {
> +            s->int_stat = 0;
> +            tz_mpc_irq_update(s);
> +        }
> +        break;
> +    case A_INT_EN:
> +        s->int_en = value & R_INT_EN_IRQ_MASK;
> +        tz_mpc_irq_update(s);
> +        break;
> +    case A_INT_SET:
> +        if (value & R_INT_SET_IRQ_MASK) {
> +            s->int_stat = R_INT_STAT_IRQ_MASK;
> +            tz_mpc_irq_update(s);
> +        }
> +        break;
>      case A_PIDR4:
>      case A_PIDR5:
>      case A_PIDR6:
> @@ -266,6 +368,16 @@ static int tz_mpc_num_indexes(IOMMUMemoryRegion *iommu)
>  
>  static void tz_mpc_reset(DeviceState *dev)
>  {
> +    TZMPC *s = TZ_MPC(dev);
> +
> +    s->ctrl = 0x00000100;
> +    s->blk_idx = 0;
> +    s->int_stat = 0;
> +    s->int_en = 1;
> +    s->int_info1 = 0;
> +    s->int_info2 = 0;
> +
> +    memset(s->blk_lut, 0, s->blk_max * sizeof(uint32_t));
>  }
>  
>  static void tz_mpc_init(Object *obj)
> @@ -339,13 +451,35 @@ static void tz_mpc_realize(DeviceState *dev, Error **errp)
>                         "tz-mpc-downstream");
>      address_space_init(&s->blocked_io_as, &s->blocked_io,
>                         "tz-mpc-blocked-io");
> +
> +    s->blk_lut = g_new(uint32_t, s->blk_max);
> +}
> +
> +static int tz_mpc_post_load(void *opaque, int version_id)
> +{
> +    TZMPC *s = TZ_MPC(opaque);
> +
> +    /* Check the incoming data doesn't point blk_idx off the end of blk_lut. */
> +    if (s->blk_idx >= s->blk_max) {
> +        return -1;
> +    }
> +    return 0;
>  }
>  
>  static const VMStateDescription tz_mpc_vmstate = {
>      .name = "tz-mpc",
>      .version_id = 1,
>      .minimum_version_id = 1,
> +    .post_load = tz_mpc_post_load,
>      .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(ctrl, TZMPC),
> +        VMSTATE_UINT32(blk_idx, TZMPC),
> +        VMSTATE_UINT32(int_stat, TZMPC),
> +        VMSTATE_UINT32(int_en, TZMPC),
> +        VMSTATE_UINT32(int_info1, TZMPC),
> +        VMSTATE_UINT32(int_info2, TZMPC),
> +        VMSTATE_VARRAY_UINT32(blk_lut, TZMPC, blk_max,
> +                              0, vmstate_info_uint32, uint32_t),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> 
