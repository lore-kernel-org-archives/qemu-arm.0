Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1497319lfm;
        Thu, 16 Jul 2020 06:38:04 -0700 (PDT)
X-Received: by 2002:adf:91e1:: with SMTP id 88mr4993260wri.89.1594906683919;
        Thu, 16 Jul 2020 06:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594906683; cv=none;
        d=google.com; s=arc-20160816;
        b=Gm67m389vBDQzhlmUOJsw8HigUFxkVHRAQ9HoC61dO/jMJOByfIvq/i0i/GlVX2eeO
         NMGGHnxgzhqBBWcPqMCnud3t/gLkfJDe/3zElnzjX3nvdCCL61R0DBFCczYe8bIIpdgq
         khquOA2Bxu2AW9V8LH1jXJsVdzWE16cXz0O7KcgVPAn2dwwnu6sa0XlvFlKaZR+PqvIY
         qPBovfT4ksUGhBicUGHFEOL7eTd7CYMEsqEE2ncY1Pqqdx9aDwDcUA5Ia+lOBfrwOH+k
         TP23cfErSrgjTwnZbZPJUegZQdzjtaFMHpLRoISyqWzVZ6HYhCKOn9POwSWOeJrcMg0o
         ENfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=kpchH1Ymxb7KdPCSvmu92LHERYgYPs9pq4bs9hihZrg=;
        b=UDJ3qJwxGrOGzFDt6Z71aLRnjYS3lBcSAlbdthyEdSsIDNWSv4qvtBCb8c3X/SQg64
         u3RRJcWUYIAykmWLA+INT8fuwCsmDGkFiKn7qML5pGtZw87ioVHYYw67lmamNISgn6d3
         p+NADAZM3hsfAoa+LbNA9oYL66GsaRzY+NpwMDfJdq1A/2jKsCsqCEu08BOg4SvQz1jN
         ViPb1OV9Tl4hRH7daeEIb7V+kXHMJU/3Mr1zkglAd5tInUeQ/HPwTIl/wa65dN7voq6S
         P0t67rdzdDYTRoQKpyHYHO4kfa3XUcwQ934I9bfHcID5rwjFuScpBvSaYIZ4kNx++uJ4
         EnQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mS+bEVjm;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e14sor3093250wrx.45.2020.07.16.06.38.03
        (Google Transport Security);
        Thu, 16 Jul 2020 06:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mS+bEVjm;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kpchH1Ymxb7KdPCSvmu92LHERYgYPs9pq4bs9hihZrg=;
        b=mS+bEVjmN+X5rISH59bOljcw7xb7iqIGNgrx9FQdy8J9GYbr0K49tdty4JTq/0bJkM
         GdKI+f6jkaWIn3nHXOws4O28tnuu4hpb8yI3gqBiHvNPYxIe/48xaUx7ea34zGudCThi
         vDVwO4vrDSYcVRi6RCaBrh2vGWNzhJAAd/28kUpBANbSiVhDgf+1oMm/oWuIX4W4YOk6
         c73+QMLvhXiqmMrNDGPVXdoRJ4yV7UN7/EB12NebRiJIH3x87zBpZPRZ8ep8UW7cu6DA
         QCAep9a9BPD4DCEvjIhmSsmggs0Z1xGyzr+ZrCgnaNvsKspIpnvxciFlzAOZQIYg5UBK
         KhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kpchH1Ymxb7KdPCSvmu92LHERYgYPs9pq4bs9hihZrg=;
        b=nijb2cKzb6aPSUvykMTO7kxEofffuJ+IY5yTJYmvkYf2BFwBkHDWENViKFXlf8gFmE
         v3QbEtx9IHjJayOI1g7ql946/J8aWHOjitRwpghUaqzjfbCfHp6GhpQfNwltMhHRzqhn
         SsXI2ScIu4pdHHjsYjHSnYPaP1v0KeNGL51lndegrPXi4e9xmN59XsYKHWFBDjELdJot
         /D+hrvPtcVeEPDyFhqDQL43hrSc6D+fGRqn+cxgswWbEkV8b2c83sFpknjrZKQEuFzAE
         O/CIjd5quMQgdM22m8mPBy8rSZPYsF37BNncNVnlbisW+MXlvDsNHyjqeMkW9KhvpGk4
         7n8g==
X-Gm-Message-State: AOAM533UifWYJZJnAMRTB7wTvU2a7yUewE0qhU0dJvxT6+rjKCHG01s0
	rptptlAlkuE9ZqrECnLDyYw=
X-Google-Smtp-Source: ABdhPJxxkvC7HpIIvV2DW3hKXwk1yp4Ew5I8mEjWSwCojGpRAIpbU7hcUUkTUjjIdMsKPMXNrAokWg==
X-Received: by 2002:adf:ff87:: with SMTP id j7mr5461505wrr.128.1594906683318;
        Thu, 16 Jul 2020 06:38:03 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
        by smtp.gmail.com with ESMTPSA id g144sm4889336wme.2.2020.07.16.06.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 06:38:02 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v8 08/18] hw/arm/allwinner: add SD/MMC host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
 <20200311221854.30370-9-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fb2469a5-6146-de4e-b07a-1c95e8d7e7c0@amsat.org>
Date: Thu, 16 Jul 2020 15:38:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311221854.30370-9-nieklinnenbank@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: qIZr/vFsVXv3

On 3/11/20 11:18 PM, Niek Linnenbank wrote:
> The Allwinner System on Chip families sun4i and above contain
> an integrated storage controller for Secure Digital (SD) and
> Multi Media Card (MMC) interfaces. This commit adds support
> for the Allwinner SD/MMC storage controller with the following
> emulated features:
> 
>  * DMA transfers
>  * Direct FIFO I/O
>  * Short/Long format command responses
>  * Auto-Stop command (CMD12)
>  * Insert & remove card detection
> 
> The following boards are extended with the SD host controller:
> 
>  * Cubieboard (hw/arm/cubieboard.c)
>  * Orange Pi PC (hw/arm/orangepi.c)
> 
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/arm/allwinner-a10.h   |   2 +
>  include/hw/arm/allwinner-h3.h    |   3 +
>  include/hw/sd/allwinner-sdhost.h | 135 +++++
>  hw/arm/allwinner-a10.c           |  11 +
>  hw/arm/allwinner-h3.c            |  15 +-
>  hw/arm/cubieboard.c              |  15 +
>  hw/arm/orangepi.c                |  16 +
>  hw/sd/allwinner-sdhost.c         | 854 +++++++++++++++++++++++++++++++
>  hw/arm/Kconfig                   |   1 +
>  hw/sd/Makefile.objs              |   1 +
>  hw/sd/trace-events               |   7 +
>  11 files changed, 1059 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/sd/allwinner-sdhost.h
>  create mode 100644 hw/sd/allwinner-sdhost.c
...

> +static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
> +                                      unsigned size)
> +{
> +    AwSdHostState *s = AW_SDHOST(opaque);
> +    uint32_t res = 0;
> +
> +    switch (offset) {
...

> +    case REG_SD_FIFO:      /* Read/Write FIFO */
> +        if (sdbus_data_ready(&s->sdbus)) {
> +            res = sdbus_read_data(&s->sdbus);
> +            res |= sdbus_read_data(&s->sdbus) << 8;
> +            res |= sdbus_read_data(&s->sdbus) << 16;
> +            res |= sdbus_read_data(&s->sdbus) << 24;

Also I'm a bit confused by the endianess here. Does the FIFO
uses a particular endianess?

> +            allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
> +            allwinner_sdhost_auto_stop(s);
> +            allwinner_sdhost_update_irq(s);
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: no data ready on SD bus\n",
> +                          __func__);
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
> +                      HWADDR_PRIx"\n", __func__, offset);
> +        res = 0;
> +        break;
> +    }
> +
> +    trace_allwinner_sdhost_read(offset, res, size);
> +    return res;
> +}
> +
> +static void allwinner_sdhost_write(void *opaque, hwaddr offset,
> +                                   uint64_t value, unsigned size)
> +{
> +    AwSdHostState *s = AW_SDHOST(opaque);
> +
> +    trace_allwinner_sdhost_write(offset, value, size);
> +
> +    switch (offset) {
...

> +    case REG_SD_FIFO:      /* Read/Write FIFO */
> +        sdbus_write_data(&s->sdbus, value & 0xff);
> +        sdbus_write_data(&s->sdbus, (value >> 8) & 0xff);
> +        sdbus_write_data(&s->sdbus, (value >> 16) & 0xff);
> +        sdbus_write_data(&s->sdbus, (value >> 24) & 0xff);
> +        allwinner_sdhost_update_transfer_cnt(s, sizeof(uint32_t));
> +        allwinner_sdhost_auto_stop(s);
> +        allwinner_sdhost_update_irq(s);
> +        break;
> +    case REG_SD_RES_CRC:   /* Response CRC from card/eMMC */
> +    case REG_SD_DATA7_CRC: /* CRC Data 7 from card/eMMC */
> +    case REG_SD_DATA6_CRC: /* CRC Data 6 from card/eMMC */
> +    case REG_SD_DATA5_CRC: /* CRC Data 5 from card/eMMC */
> +    case REG_SD_DATA4_CRC: /* CRC Data 4 from card/eMMC */
> +    case REG_SD_DATA3_CRC: /* CRC Data 3 from card/eMMC */
> +    case REG_SD_DATA2_CRC: /* CRC Data 2 from card/eMMC */
> +    case REG_SD_DATA1_CRC: /* CRC Data 1 from card/eMMC */
> +    case REG_SD_DATA0_CRC: /* CRC Data 0 from card/eMMC */
> +    case REG_SD_CRC_STA:   /* CRC status from card/eMMC in write operation */
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
> +                      HWADDR_PRIx"\n", __func__, offset);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps allwinner_sdhost_ops = {
> +    .read = allwinner_sdhost_read,
> +    .write = allwinner_sdhost_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,

Maybe this device is little endian only?

> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +    .impl.min_access_size = 4,
> +};
