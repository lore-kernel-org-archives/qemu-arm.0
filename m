Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1132120lfq;
        Thu, 10 Sep 2020 02:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHgbM7YJpzYu+rhZlpPMSB8NbuhhmPD7NxSm9P0Iq8daGIs+ZdhHsYTjA270TdoFeAS8ol
X-Received: by 2002:a25:aca6:: with SMTP id x38mr10540615ybi.517.1599728930367;
        Thu, 10 Sep 2020 02:08:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599728930; cv=none;
        d=google.com; s=arc-20160816;
        b=PzXgNwpazb2RitCfgMZLXrRNy1gZ9tE+QXwXuhUYioZmC1lYvwggHYqNDwc1Koszmd
         HaIsWF44XnpOZbxaJ2PJDl199X22n/hxdqeBVJEIRo2bnFvqSYaljqdM/8Jo4/DZuy6j
         TNqWkAkaFiq7RyLJ0VCV9DKr/CxVfEG4sqhhU/zbfOJgIk5ZbhwbvnGdaTiyOPaMnhCE
         0nSr7DjkPOGVIeciFTYrwTqZxyhXAX9gX/Y4tZVtwSdVBm18d0yTZGFmDhYLQI2JAB/M
         nhRvrtOYabxoC2MiuQ5z54FXAR95peGrpeISpSwBWlGy1zJUlc8Kgpw2H7CRW3Cy3RZJ
         rNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=mVa0T5osyyqVvof03O1uIvNYi/AqP9rH2A9BlQ3d+sw=;
        b=A5XlAZqx+N8PG3DmmExuCzASu/yaN2dD6Jpd1AxNc5tAQE/6X4UMVRrAnzOc0X3khY
         OFxw8dK2HBLp1DWwXUgBmdO24FlNGu17HiR1OHJ4tzggBkiiVEUweV8pPYRc6sz6ajVl
         sbf9/rwqPwb8tb6E+dTFjvodQqIy5fe72nyzuAiWeGdiES4FvM6Vw/DT4wSjHw2KMt7c
         t7EODBvQMIkhrzVfqrx7O/eCANuA78YtqWK9GeTf39s0s4wGbeEk9SrIcLgSUGiAeN4I
         GrCLwHU5DB4r+PRxPz6A4Nk2pMmp2Vdglq4OIK+Wxu6aOOede+U0GKUm81zGP6TijxE3
         RFDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EZcsCd5l;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id n197si4985884yba.175.2020.09.10.02.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 02:08:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EZcsCd5l;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599728929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mVa0T5osyyqVvof03O1uIvNYi/AqP9rH2A9BlQ3d+sw=;
	b=EZcsCd5l5dVfkaGgJhDanlG1o7fs/6677LN7MVfBdLO0XdszGgZnjw9FgoDDb9eVGcwBCh
	EZJWKDJGHW0STiJfsi0rwRXzn+9JxOev0yQGCMbcg6ceT7OWmNZWWds6sn1HpbV93FNmLA
	DjkiDqORN8j7zjiQGhWc2YOVMo0AXuY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-jBVyR-2lNCu62DfG1gpkjQ-1; Thu, 10 Sep 2020 05:08:44 -0400
X-MC-Unique: jBVyR-2lNCu62DfG1gpkjQ-1
Received: by mail-ed1-f70.google.com with SMTP id x23so2182951eds.5
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 02:08:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mVa0T5osyyqVvof03O1uIvNYi/AqP9rH2A9BlQ3d+sw=;
        b=dl/Z/jxJUbmQF6mJ8SH2V+8BH0EI0Zvybcp9g8qjN5pMSxltrtmQ5dt5cQFwnOqBw0
         aFG0y/B6EfzqoA6FcIylQJebQcguwS8ymWxOpN10EX2GVCj8QNoclK+HvH6HBSo1F005
         qXjPXs5p+EzJ8WwoDHBPLoWb58T7uPrnAIwzlt++GgjvDt0fyJZLmunzTLZVG0BhgJha
         TAqQgfrr8/VRXWFLvCA51q7tmjGHWg+rQSMB0Luc3A/fK6hB/5zc0d+N+/NzLVAkrutA
         gH0ePwqgf/mCRxQL4lCWe2NujKflXQT8m4lBPJEcBqPw1AATrQgWESES2UPahgOE7vs3
         IfCA==
X-Gm-Message-State: AOAM531NeNZz740oHcIUH/wu94ebklYSpAm6bBlxoAVTyGYgW/J7ddUx
	UKr0GbTN7YNW5Tfp6/i/bvfluTt9bTkoZrjGw7mBuSSUlxGn3WfjHiJlcROqgtoR0tQ+HXBjEjl
	r3N1KDkxt8xv+SDwl
X-Received: by 2002:a50:e79c:: with SMTP id b28mr8408116edn.371.1599728922799;
        Thu, 10 Sep 2020 02:08:42 -0700 (PDT)
X-Received: by 2002:a50:e79c:: with SMTP id b28mr8408080edn.371.1599728922550;
        Thu, 10 Sep 2020 02:08:42 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:2744:1c91:fa55:fa01? ([2001:b07:6468:f312:2744:1c91:fa55:fa01])
        by smtp.gmail.com with ESMTPSA id m16sm6120969ejl.69.2020.09.10.02.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 02:08:42 -0700 (PDT)
Subject: Re: [PATCH 1/6] hw/ssi/aspeed_smc: Rename max_slaves as max_devices
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-trivial@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Joel Stanley <joel@jms.id.au>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <34760c71-c6da-4730-2b1a-5c5be0b7ff9f@redhat.com>
Date: Thu, 10 Sep 2020 11:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: qauXdBW6m4cM

On 10/09/20 09:01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename max_slaves
> as max_devices.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

I think we should consider a wholesale replacement of SSISlave with
SSIPeripheral according to the proposal at
https://www.oshwa.org/a-resolution-to-redefine-spi-signal-names/.

Paolo

> ---
>  include/hw/ssi/aspeed_smc.h |  2 +-
>  hw/ssi/aspeed_smc.c         | 40 ++++++++++++++++++-------------------
>  2 files changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 6fbbb238f15..52ae34e38d1 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -42,7 +42,7 @@ typedef struct AspeedSMCController {
>      uint8_t r_timings;
>      uint8_t nregs_timings;
>      uint8_t conf_enable_w0;
> -    uint8_t max_slaves;
> +    uint8_t max_devices;
>      const AspeedSegments *segments;
>      hwaddr flash_window_base;
>      uint32_t flash_window_size;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 795784e5f36..8219272016c 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -259,7 +259,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_TIMINGS,
>          .nregs_timings     = 1,
>          .conf_enable_w0    = CONF_ENABLE_W0,
> -        .max_slaves        = 1,
> +        .max_devices       = 1,
>          .segments          = aspeed_segments_legacy,
>          .flash_window_base = ASPEED_SOC_SMC_FLASH_BASE,
>          .flash_window_size = 0x6000000,
> @@ -275,7 +275,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_TIMINGS,
>          .nregs_timings     = 1,
>          .conf_enable_w0    = CONF_ENABLE_W0,
> -        .max_slaves        = 5,
> +        .max_devices       = 5,
>          .segments          = aspeed_segments_fmc,
>          .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
>          .flash_window_size = 0x10000000,
> @@ -293,7 +293,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_SPI_TIMINGS,
>          .nregs_timings     = 1,
>          .conf_enable_w0    = SPI_CONF_ENABLE_W0,
> -        .max_slaves        = 1,
> +        .max_devices       = 1,
>          .segments          = aspeed_segments_spi,
>          .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
>          .flash_window_size = 0x10000000,
> @@ -309,7 +309,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_TIMINGS,
>          .nregs_timings     = 1,
>          .conf_enable_w0    = CONF_ENABLE_W0,
> -        .max_slaves        = 3,
> +        .max_devices       = 3,
>          .segments          = aspeed_segments_ast2500_fmc,
>          .flash_window_base = ASPEED_SOC_FMC_FLASH_BASE,
>          .flash_window_size = 0x10000000,
> @@ -327,7 +327,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_TIMINGS,
>          .nregs_timings     = 1,
>          .conf_enable_w0    = CONF_ENABLE_W0,
> -        .max_slaves        = 2,
> +        .max_devices       = 2,
>          .segments          = aspeed_segments_ast2500_spi1,
>          .flash_window_base = ASPEED_SOC_SPI_FLASH_BASE,
>          .flash_window_size = 0x8000000,
> @@ -343,7 +343,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_TIMINGS,
>          .nregs_timings     = 1,
>          .conf_enable_w0    = CONF_ENABLE_W0,
> -        .max_slaves        = 2,
> +        .max_devices       = 2,
>          .segments          = aspeed_segments_ast2500_spi2,
>          .flash_window_base = ASPEED_SOC_SPI2_FLASH_BASE,
>          .flash_window_size = 0x8000000,
> @@ -359,7 +359,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_TIMINGS,
>          .nregs_timings     = 1,
>          .conf_enable_w0    = CONF_ENABLE_W0,
> -        .max_slaves        = 3,
> +        .max_devices       = 3,
>          .segments          = aspeed_segments_ast2600_fmc,
>          .flash_window_base = ASPEED26_SOC_FMC_FLASH_BASE,
>          .flash_window_size = 0x10000000,
> @@ -377,7 +377,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_TIMINGS,
>          .nregs_timings     = 2,
>          .conf_enable_w0    = CONF_ENABLE_W0,
> -        .max_slaves        = 2,
> +        .max_devices       = 2,
>          .segments          = aspeed_segments_ast2600_spi1,
>          .flash_window_base = ASPEED26_SOC_SPI_FLASH_BASE,
>          .flash_window_size = 0x10000000,
> @@ -395,7 +395,7 @@ static const AspeedSMCController controllers[] = {
>          .r_timings         = R_TIMINGS,
>          .nregs_timings     = 3,
>          .conf_enable_w0    = CONF_ENABLE_W0,
> -        .max_slaves        = 3,
> +        .max_devices       = 3,
>          .segments          = aspeed_segments_ast2600_spi2,
>          .flash_window_base = ASPEED26_SOC_SPI2_FLASH_BASE,
>          .flash_window_size = 0x10000000,
> @@ -476,7 +476,7 @@ static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
>      AspeedSegments seg;
>      int i;
>  
> -    for (i = 0; i < s->ctrl->max_slaves; i++) {
> +    for (i = 0; i < s->ctrl->max_devices; i++) {
>          if (i == cs) {
>              continue;
>          }
> @@ -537,7 +537,7 @@ static void aspeed_smc_flash_set_segment(AspeedSMCState *s, int cs,
>       */
>      if ((s->ctrl->segments == aspeed_segments_ast2500_spi1 ||
>           s->ctrl->segments == aspeed_segments_ast2500_spi2) &&
> -        cs == s->ctrl->max_slaves &&
> +        cs == s->ctrl->max_devices &&
>          seg.addr + seg.size != s->ctrl->segments[cs].addr +
>          s->ctrl->segments[cs].size) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -948,7 +948,7 @@ static void aspeed_smc_reset(DeviceState *d)
>      }
>  
>      /* setup the default segment register values and regions for all */
> -    for (i = 0; i < s->ctrl->max_slaves; ++i) {
> +    for (i = 0; i < s->ctrl->max_devices; ++i) {
>          aspeed_smc_flash_set_segment_region(s, i,
>                      s->ctrl->segment_to_reg(s, &s->ctrl->segments[i]));
>      }
> @@ -995,8 +995,8 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>          (s->ctrl->has_dma && addr == R_DMA_DRAM_ADDR) ||
>          (s->ctrl->has_dma && addr == R_DMA_LEN) ||
>          (s->ctrl->has_dma && addr == R_DMA_CHECKSUM) ||
> -        (addr >= R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_slaves) ||
> -        (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_slaves)) {
> +        (addr >= R_SEG_ADDR0 && addr < R_SEG_ADDR0 + s->ctrl->max_devices) ||
> +        (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + s->ctrl->max_devices)) {
>  
>          trace_aspeed_smc_read(addr, size, s->regs[addr]);
>  
> @@ -1270,7 +1270,7 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
>          int cs = addr - s->r_ctrl0;
>          aspeed_smc_flash_update_ctrl(&s->flashes[cs], value);
>      } else if (addr >= R_SEG_ADDR0 &&
> -               addr < R_SEG_ADDR0 + s->ctrl->max_slaves) {
> +               addr < R_SEG_ADDR0 + s->ctrl->max_devices) {
>          int cs = addr - R_SEG_ADDR0;
>  
>          if (value != s->regs[R_SEG_ADDR0 + cs]) {
> @@ -1341,10 +1341,10 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>      s->conf_enable_w0 = s->ctrl->conf_enable_w0;
>  
>      /* Enforce some real HW limits */
> -    if (s->num_cs > s->ctrl->max_slaves) {
> +    if (s->num_cs > s->ctrl->max_devices) {
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: num_cs cannot exceed: %d\n",
> -                      __func__, s->ctrl->max_slaves);
> -        s->num_cs = s->ctrl->max_slaves;
> +                      __func__, s->ctrl->max_devices);
> +        s->num_cs = s->ctrl->max_devices;
>      }
>  
>      /* DMA irq. Keep it first for the initialization in the SoC */
> @@ -1376,7 +1376,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>                            s->ctrl->flash_window_size);
>      sysbus_init_mmio(sbd, &s->mmio_flash);
>  
> -    s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_slaves);
> +    s->flashes = g_new0(AspeedSMCFlash, s->ctrl->max_devices);
>  
>      /*
>       * Let's create a sub memory region for each possible slave. All
> @@ -1385,7 +1385,7 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
>       * module behind to handle the memory accesses. This depends on
>       * the board configuration.
>       */
> -    for (i = 0; i < s->ctrl->max_slaves; ++i) {
> +    for (i = 0; i < s->ctrl->max_devices; ++i) {
>          AspeedSMCFlash *fl = &s->flashes[i];
>  
>          snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
> 
