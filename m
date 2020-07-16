Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1482770lfm;
        Thu, 16 Jul 2020 06:23:00 -0700 (PDT)
X-Received: by 2002:a5d:4b84:: with SMTP id b4mr5303100wrt.334.1594905780660;
        Thu, 16 Jul 2020 06:23:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594905780; cv=none;
        d=google.com; s=arc-20160816;
        b=woXW1nLr/HO+hGO1SU2f/HpwG1AelOGCnBroB+9QNL/mh6FkZEnQhaWwivan/xRIrh
         feH4uBacUXq9ceJvobrAZaPnnzXPEO9fDEtcfSY9W+ismedjDhUO9PMIWGcZn0b1nC5z
         7X4oJ+FBUBBKbbYl1am/9fzm5rjF3iP+xQmnyEPi/jqgbdtFT7tE7lAcfsva5oOILcWe
         oP667zUQ2wQ9nZQ4Znxt5IZCKgPdtsqfFpIj0xlzOe2evq+tW8ed0SMJZiT52MbbXbsf
         /uOvzCAoSXAYQk+AXu719cjuPlsoYuBdoYKrZimdATDyyskGabQhO7g7hhtQwCgZ34Ck
         ooeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :sender:dkim-signature;
        bh=f8kTRj9f/lKZV3whiDWS/qsQN7HcFp/YvD+z4gzOGw8=;
        b=hRupPJxOJ0N7GiYFQnVFDusN28Pn39mXWjG7KrvsmB0ymV5f1DiN/TgJGytQjbOmI/
         P/Do9TF+wSIuUGUAL6WMcWltuwRFr7gXsjZQNDZn7LQyc0XEV8TFyD+mW2LXlV0y6Fzq
         wX9hk3rFgM97PhGXfG7Uut/StLwv1kXWMAacKbx5FJAj9hs0+zmgVwGMCSHIXmxlBQxI
         vHCd2WJ52gff1taPrClpLBqcyDcxN68RVUwr97ejlxmqmne8f5hctxY15Fzx2p9nLCd3
         vhUgw2qDd128h4HrE6UhZvlXi9V7qJu1hIjicj3Sc3bs/MCujRXfOCFatbFmZzDLLhj/
         yEZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Saayd0+v;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c4sor3022786wrm.62.2020.07.16.06.23.00
        (Google Transport Security);
        Thu, 16 Jul 2020 06:23:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Saayd0+v;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f8kTRj9f/lKZV3whiDWS/qsQN7HcFp/YvD+z4gzOGw8=;
        b=Saayd0+vy3GQOzwm53X6xFg0xaES0rMLU3ZhFMlWJwTNldspCnDA2mEtojQh/gD4HO
         oNDuAhkgnt6+7CcRiMrxoZBbeB2IOe4ypEmpzUk/U0jyp+50OklTxE8Qz7RurnnhKdbk
         n3mUrh6hIQW9Cyqdg65G5PTYoTi5kS9TrQz0H9eomYOti3bxUi8bPb9DoIvi3YrG95xe
         SBjdXfnP5M/IHIEsgc3UEd93ZCBxH0dusPLVOfz3rg/KmeIpcHaA4ezJxVUcXicUgr6l
         MZw8cKVD+Rx68mdGdLLtJngV/2SWdnjKm/vzO5ShkxgDqS9NzlOaWkZWcRbd25cebvO+
         gwGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=f8kTRj9f/lKZV3whiDWS/qsQN7HcFp/YvD+z4gzOGw8=;
        b=rpnNn+l028hjTkBk6iGz/yId/9II42qhHSkEWit8OLGyAqllaHHHNZgTUBPfR/gNSv
         a+mgd+EXLZGf/kjvTu7ZVXci+/JEGx2y2z6xddpjo4050nfivSHCkDV+2Zc0/Q3c0qWj
         U46X/1TAH8XGw3ZuXoptErneIOXu79LzFJXo2pHCCbVgjK4581eEY+YTUU4g7TaPFpZ6
         ZiH+EtQXOXdm1OanyS+m1kXz3v6ugw5VFSaVDBLA71bapDivMDN5H+Ke17kSOpEae1gA
         L5pChY/vcICD6azuE0uGEMKhnKGHnuA94b3VQ0DvoelQt1yhOeANp7QLlvYRIazfu2U2
         1EWw==
X-Gm-Message-State: AOAM5313SZZQ7ZjKJaa10LKzhe5dceo6ApaJ8tGEpmIg0Ny1fc5ab/F6
	ad1z9TiM4zn/5v2TGYcr74s=
X-Google-Smtp-Source: ABdhPJwrghvhX7hLwrf11MYvAyQT71KOFsgl5vw+alrTNa0lRkftrAvvXzmb1/VcWyXRnxVbIV891A==
X-Received: by 2002:adf:f984:: with SMTP id f4mr5004583wrr.221.1594905780151;
        Thu, 16 Jul 2020 06:23:00 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.37] (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
        by smtp.gmail.com with ESMTPSA id s10sm8922430wme.31.2020.07.16.06.22.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 06:22:59 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v8 08/18] hw/arm/allwinner: add SD/MMC host controller
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
 <20200311221854.30370-9-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <29ee48af-ff20-9c97-0e09-f752e6186f03@amsat.org>
Date: Thu, 16 Jul 2020 15:22:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200311221854.30370-9-nieklinnenbank@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uszuVmvhI8XF

Hi Niek,

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

> +static uint32_t allwinner_sdhost_process_desc(AwSdHostState *s,
> +                                              hwaddr desc_addr,
> +                                              TransferDescriptor *desc,
> +                                              bool is_write, uint32_t max_bytes)
> +{
> +    AwSdHostClass *klass = AW_SDHOST_GET_CLASS(s);
> +    uint32_t num_done = 0;
> +    uint32_t num_bytes = max_bytes;
> +    uint8_t buf[1024];

Is 1024 a constant specific for this device?

> +
> +    /* Read descriptor */
> +    cpu_physical_memory_read(desc_addr, desc, sizeof(*desc));

I missed that while reviewing, but IIUC from [*] below, this code
is emulating the DMA context right? So we should be using the DMA
accessors here, dma_memory_read() and dma_memory_write().

> +    if (desc->size == 0) {
> +        desc->size = klass->max_desc_size;
> +    } else if (desc->size > klass->max_desc_size) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA descriptor buffer size "
> +                      " is out-of-bounds: %" PRIu32 " > %zu",
> +                      __func__, desc->size, klass->max_desc_size);
> +        desc->size = klass->max_desc_size;
> +    }
> +    if (desc->size < num_bytes) {
> +        num_bytes = desc->size;
> +    }
> +
> +    trace_allwinner_sdhost_process_desc(desc_addr, desc->size,
> +                                        is_write, max_bytes);
> +
> +    while (num_done < num_bytes) {
> +        /* Try to completely fill the local buffer */
> +        uint32_t buf_bytes = num_bytes - num_done;
> +        if (buf_bytes > sizeof(buf)) {
> +            buf_bytes = sizeof(buf);
> +        }
> +
> +        /* Write to SD bus */
> +        if (is_write) {
> +            cpu_physical_memory_read((desc->addr & DESC_SIZE_MASK) + num_done,
> +                                      buf, buf_bytes);
> +
> +            for (uint32_t i = 0; i < buf_bytes; i++) {
> +                sdbus_write_data(&s->sdbus, buf[i]);
> +            }
> +
> +        /* Read from SD bus */
> +        } else {
> +            for (uint32_t i = 0; i < buf_bytes; i++) {
> +                buf[i] = sdbus_read_data(&s->sdbus);
> +            }
> +            cpu_physical_memory_write((desc->addr & DESC_SIZE_MASK) + num_done,
> +                                       buf, buf_bytes);
> +        }
> +        num_done += buf_bytes;
> +    }
> +
> +    /* Clear hold flag and flush descriptor */
> +    desc->status &= ~DESC_STATUS_HOLD;
> +    cpu_physical_memory_write(desc_addr, desc, sizeof(*desc));
> +
> +    return num_done;
> +}
> +
> +static void allwinner_sdhost_dma(AwSdHostState *s)
> +{
> +    TransferDescriptor desc;
> +    hwaddr desc_addr = s->desc_base;
> +    bool is_write = (s->command & SD_CMDR_WRITE);
> +    uint32_t bytes_done = 0;
> +
> +    /* Check if DMA can be performed */
> +    if (s->byte_count == 0 || s->block_size == 0 ||
> +      !(s->global_ctl & SD_GCTL_DMA_ENB)) {
> +        return;
> +    }
> +
> +    /*
> +     * For read operations, data must be available on the SD bus
> +     * If not, it is an error and we should not act at all
> +     */
> +    if (!is_write && !sdbus_data_ready(&s->sdbus)) {
> +        return;
> +    }
> +
> +    /* Process the DMA descriptors until all data is copied */
> +    while (s->byte_count > 0) {
> +        bytes_done = allwinner_sdhost_process_desc(s, desc_addr, &desc,
> +                                                   is_write, s->byte_count);

[*]

> +        allwinner_sdhost_update_transfer_cnt(s, bytes_done);
> +
> +        if (bytes_done <= s->byte_count) {
> +            s->byte_count -= bytes_done;
> +        } else {
> +            s->byte_count = 0;
> +        }
> +
> +        if (desc.status & DESC_STATUS_LAST) {
> +            break;
> +        } else {
> +            desc_addr = desc.next;
> +        }
> +    }
> +
> +    /* Raise IRQ to signal DMA is completed */
> +    s->irq_status |= SD_RISR_DATA_COMPLETE | SD_RISR_SDIO_INTR;
> +
> +    /* Update DMAC bits */
> +    s->dmac_status |= SD_IDST_INT_SUMMARY;
> +
> +    if (is_write) {
> +        s->dmac_status |= SD_IDST_TRANSMIT_IRQ;
> +    } else {
> +        s->dmac_status |= SD_IDST_RECEIVE_IRQ;
> +    }
> +}
...
