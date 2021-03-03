Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5718441lfg;
        Wed, 3 Mar 2021 14:08:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywQM1ezkd33l2Tk7svLPaUFoovWMy3Cf5xev4iw0UglATJG0lDk0yyN/zqVpTU1I2A7x9N
X-Received: by 2002:a17:906:b102:: with SMTP id u2mr781944ejy.303.1614809320909;
        Wed, 03 Mar 2021 14:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614809320; cv=none;
        d=google.com; s=arc-20160816;
        b=tV9n6VJsfNRVWb/IMGfwcOhCmhk2UTUVj0vE/CC37a5ovC0owK/GNlKqADYB0zyFQW
         U7Qz/+u6y2M7Qsq0AWPzm8D77QV2AkaP78yasyGOvhXHTM8g+lbWMmfKibLByZiE1S47
         bK2zh0SkbWDHXnMEHxyayBcltQm2GMb3EaddYaEGX15iDVKyEz1PCOqjjfEBLT54eTcx
         Ugv6RpN6v3PSfqy8QieI7bSFFeWpbkeQpFwiBHXmBNw3MotYFCqfuZzoNla+bO8QZmke
         uf0gAQtRwskMKB37QqYW1ExJN1WLENSQ2efKFnnGbsKuvGC2perIyOmoaCbZj99KCF8d
         viCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Ta2T9uz1JFQzlu06+K/2lLMfo+o2zkn/sy8USwwlayc=;
        b=hxa+QgUhm7kOLfwHyOIQWIcPckW9REm8wqeeyMtw+b0WbMZZTeBZtL2i/PWUgBuNLo
         9ARDO8tvYFjOg4udlnpuxCAsZTNZTsUCwAhE+2VYvil1OKY7DK2ZA5WnBZOykWKpD8e+
         RNwYk3gfGPsn5OE7UVoCcYuZCh7qURoch1j6cXEWaPkn3wY80oGS/6lqp//eBPJE/G4t
         9A6F7zMXGC6KDd2LjzE1xy6bbogrCh+bvqVCNiCHydWTOukmsigjjnEQx9dPSQ17JaJe
         eOwmVVHQPeXYmT1/dMBsxeRzS1RIZGDIsGo4/rh9PmyQYAsTho4tEcnQGpQbzyFEQIu9
         4Caw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=airnfAAp;
       spf=pass (google.com: domain of mst@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id ly3si2792064ejb.615.2021.03.03.14.08.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 14:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=airnfAAp;
       spf=pass (google.com: domain of mst@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614809319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta2T9uz1JFQzlu06+K/2lLMfo+o2zkn/sy8USwwlayc=;
	b=airnfAApNx1aj1I1cGzaYrLtImNCNEhmlyW+4Oh6OVCC7KDc61n7jJIOZZSp59ffzTu1BT
	r+J8bcfNGA9NXCPOa8FNo4xI8wMErLCGAJm1TXVwRkXKmM0uMBhtcdstSRA1lIbH1ptYON
	FfcGS0BGSSvge+IEKce2U1sQYa3YFG0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-QqBw_O7xMJ-Pj7WooVKf_A-1; Wed, 03 Mar 2021 17:08:38 -0500
X-MC-Unique: QqBw_O7xMJ-Pj7WooVKf_A-1
Received: by mail-ed1-f72.google.com with SMTP id h2so8544075edw.10
        for <alex.bennee@linaro.org>; Wed, 03 Mar 2021 14:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ta2T9uz1JFQzlu06+K/2lLMfo+o2zkn/sy8USwwlayc=;
        b=my9qySVMkvMz+g4WopbmWk1sizJtkoV2PCDyDBnE+xYskMjRPS9QbXxGIjVd95gD2L
         XYelx60quu5zatYMcE2qBoEL3em2Da6LLDz/NEEdIqtoZOzlp4ovMBfuxrP+wgFnvwN2
         RgW/s8v9ILjW14rho35jvpmmEN7DFyF8D6dJvJM3uv6km/1b30WH6KQtFnm4s/h3WMhp
         pzyUUEQACsQvroUzlykv6eSHXteK3koWYruDf8SILOAoxXzbbsuc/xXVCKpIn564cOiO
         6UuLlrGO7QctiEr40yqMkZCDxtnl8pNLzVESHb89QcxA3bLxF5We6EFtQ7QrSkTXn3aO
         gUlQ==
X-Gm-Message-State: AOAM533a97DHmLXMTJhHOZXQTk15XtUSbvJz7zQLNRWGHM4bnmASuxtT
	0+OwHjEJFNL4IopNAgeDeVwJAyd7ndxqPEzi/Vf3UX/lEBvRqylGizDdwt48/VjDq/CCyf6W/l/
	cndTlV9LUmpSXA253
X-Received: by 2002:a17:906:a443:: with SMTP id cb3mr802796ejb.542.1614809316926;
        Wed, 03 Mar 2021 14:08:36 -0800 (PST)
X-Received: by 2002:a17:906:a443:: with SMTP id cb3mr802778ejb.542.1614809316782;
        Wed, 03 Mar 2021 14:08:36 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
        by smtp.gmail.com with ESMTPSA id m14sm15763480edd.63.2021.03.03.14.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:08:36 -0800 (PST)
Date: Wed, 3 Mar 2021 17:08:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
Message-ID: <20210303170743-mutt-send-email-mst@kernel.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: mVv2ih8QuRxm

On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daudé wrote:
> Introduce the cpu_virtio_is_big_endian() generic helper to avoid
> calling CPUClass internal virtio_is_big_endian() one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Using virtio in the name here probably because virtio wants this?
That doesn't sound like a good naming strategy, name should
tell us what function does not how it's used.

> ---
>  include/hw/core/cpu.h | 9 +++++++++
>  hw/core/cpu.c         | 8 ++++++--
>  hw/virtio/virtio.c    | 4 +---
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 2d43f78819f..b12028c3c03 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -602,6 +602,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>   */
>  int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
>  
> +/**
> + * cpu_virtio_is_big_endian:
> + * @cpu: CPU
> +
> + * Returns %true if a CPU which supports runtime configurable endianness
> + * is currently big-endian.
> + */
> +bool cpu_virtio_is_big_endian(CPUState *cpu);
> +
>  #endif /* CONFIG_USER_ONLY */
>  
>  /**
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 4dce35f832f..daaff56a79e 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -218,8 +218,13 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
>      return 0;
>  }
>  
> -static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
> +bool cpu_virtio_is_big_endian(CPUState *cpu)
>  {
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    if (cc->virtio_is_big_endian) {
> +        return cc->virtio_is_big_endian(cpu);
> +    }
>      return target_words_bigendian();
>  }
>  
> @@ -438,7 +443,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>      k->write_elf64_note = cpu_common_write_elf64_note;
>      k->gdb_read_register = cpu_common_gdb_read_register;
>      k->gdb_write_register = cpu_common_gdb_write_register;
> -    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
>      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
>      dc->realize = cpu_common_realizefn;
>      dc->unrealize = cpu_common_unrealizefn;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 1fd1917ca0f..fe6a4be99e4 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1973,9 +1973,7 @@ static enum virtio_device_endian virtio_default_endian(void)
>  
>  static enum virtio_device_endian virtio_current_cpu_endian(void)
>  {
> -    CPUClass *cc = CPU_GET_CLASS(current_cpu);
> -
> -    if (cc->virtio_is_big_endian(current_cpu)) {
> +    if (cpu_virtio_is_big_endian(current_cpu)) {
>          return VIRTIO_DEVICE_ENDIAN_BIG;
>      } else {
>          return VIRTIO_DEVICE_ENDIAN_LITTLE;
> -- 
> 2.26.2
