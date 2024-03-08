Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1963497ejb;
        Fri, 8 Mar 2024 09:35:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUMUy7A6cXb+i8ffNfr03EcggCTJvEzMYc1HyeHBt96j3pdlna25u9tKPlqsJ6IdcTxGN+sPgvHjjFkf2r1lm9EhBk694uW
X-Received: by 2002:a05:6820:228e:b0:5a1:bb9d:56a7 with SMTP id ck14-20020a056820228e00b005a1bb9d56a7mr5666309oob.8.1709919315109;
        Fri, 08 Mar 2024 09:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709919315; cv=none;
        d=google.com; s=arc-20160816;
        b=0koGwsnyCDYsK49blfCAmkREQZz43THkyiiUFiMhe8cAcfCgMQi/Jaax7Um5o88aQO
         ho/YiOOjxQxW39U3KY+JlwuXVBs+PVwH8Zv1dh8wA0RnCZyoK8L6mO4T8ZxxL0siI2LC
         sjPRfPm9VPTPTuBMhnWZ9sA35sA1na8JSEja1hrDhxTKjkDMgmQ81IsgDZARjBG4Q0w4
         PhO7O0pzCjFVZMBITmfetetuE7HxM/7EXoZZoOgq5+86Q/5BAvKf389C8CRjsAQws/eT
         WlJcvnyNGm7o6YxqEMySnEblcp+Tw3FBYnYYmGbyZCx2LbUwcoql7n0OyZAVbjIlCQSW
         uk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=42z1c6En4OMO73HSWbt9qhFCGOY4c7z3vfsZqA96K6s=;
        fh=ucL4D2yMYCzVEat+e7209krkqR+tOJf1mwmjSKiio9c=;
        b=oHYfxxA0TaF8pLA+AMACbHEC+2ZltaXMiCmY/A67dTkasulgB/MrUge0epfk89ALIy
         zYpRJMLpJfrttnodyOUU4YG8YZjMulGtbwVpsAM6jOJtaLlBQ1VMZ7IBKFKQv83Rfxy8
         SyV7tNEvTeqdFOMN5jimuanTQuYrU7vvmWPFOSXCQi0SVS1qS8mRmAv5L7ypa94cauZR
         Wx/hGnAb7yqXxrtaotQcoJQZ2AVBZuJhNGIGhaN1/NrI91tKqgrl61LRIsvImXWZH9K2
         h+BbYDMGaaAr4U5wsMGyvRF+pik41JYNr0ZFzoEPvuy5u/j/TuL/YRD+dDFCTVgP6lti
         XYPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=aJOTRog7;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
Return-Path: <anthony.perard@cloud.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n1-20020a4ad121000000b005a1c0973754sor654670oor.1.2024.03.08.09.35.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Mar 2024 09:35:15 -0800 (PST)
Received-SPF: pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@cloud.com header.s=cloud header.b=aJOTRog7;
       spf=pass (google.com: domain of anthony.perard@cloud.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=anthony.perard@cloud.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=cloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709919314; x=1710524114; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42z1c6En4OMO73HSWbt9qhFCGOY4c7z3vfsZqA96K6s=;
        b=aJOTRog77RMfvSEyzw2mMZvn1Hxng2Zk0fa+QfejUIxvp7sU+11PGkVRx2NrTCOE+Z
         MUXOHXBIvSqLS4l3NriW6y32InnaAJ1moWQrEWwREyPeJpraBSzgiFDwzmSFZQaLcEL2
         Z8dQ+5NjqftVqM9pxZWE6rHFH+sAdFlVeCnOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709919314; x=1710524114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=42z1c6En4OMO73HSWbt9qhFCGOY4c7z3vfsZqA96K6s=;
        b=FwsoNjDsvy0HHe2S4lVftSREu/89l1K2NSijSbA0ez/G3IIYbqjLq6bnndYFDRi24S
         +0TL1/QciDxwJ7g67mlgdLSL92tjL/sJBOeWVJxUaRYQSg2jj8YKoZ3/7A/wTC7bnR0v
         CWB4hjd6LcrhYCpXE0zTKTt0fXm/8nEVg+NNOjLY0epxl2YBuXD7kWvnT2KXTbt+7C9/
         MF9eP9gO0Ssmas4+aa+Um/S8zFTq29eQV+2y+cCCjUqir6GMbz3wnHPqplTZD8R/fY33
         tVCkjiX/sSQ82UVkLxVjO3OzId2AMDFsvolNh0A90uBlK+JRvrYzxuwG+YlD5GICC8N5
         WT5w==
X-Forwarded-Encrypted: i=1; AJvYcCVSWV2z03Odxas/CAR5k7p2WsckIEGj1gNfseE9vx97NxTb8Rmd/i1JiJQK+hOVBiHHFikEq2t0t/plaJC13PFNUpgNh6ej
X-Gm-Message-State: AOJu0Yxk2uiniSBnK8tt0NNyIJSmGOwVrj4Zb4sE7CpDiW4q0gzJCPPt
	QAoEGvPpBTgbItBYEj9A546ehwIE9k/2HF1xfKxn6rm2Sp+whHCfoEGARJyeRos=
X-Google-Smtp-Source: AGHT+IFP+iIn7ziPACo/W5ywuwt3jU9vKOJI+Md4melHw3m+IPRBayOOv3MnfyWInvHuBqQD34WXQg==
X-Received: by 2002:a05:6820:2227:b0:5a1:34cf:400c with SMTP id cj39-20020a056820222700b005a134cf400cmr12525786oob.9.1709919314653;
        Fri, 08 Mar 2024 09:35:14 -0800 (PST)
Return-Path: <anthony.perard@cloud.com>
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
        by smtp.gmail.com with ESMTPSA id z5-20020a05683020c500b006e12266433csm2248064otq.27.2024.03.08.09.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 09:35:14 -0800 (PST)
Date: Fri, 8 Mar 2024 17:35:08 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?iso-8859-1?Q?Fr=E9d=E9ric?= Barrat <fbarrat@linux.ibm.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, mzamazal@redhat.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/29] bulk: Access existing variables initialized to
 &S->F when available
Message-ID: <a495a2c8-0259-4a44-8ac4-9cb6052074b6@perard>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129164514.73104-2-philmd@linaro.org>
X-TUID: F1n2nGksJycO

On Mon, Jan 29, 2024 at 05:44:43PM +0100, Philippe Mathieu-Daudé wrote:
> When a variable is initialized to &struct->field, use it
> in place. Rationale: while this makes the code more concise,
> this also helps static analyzers.
> 
> Mechanical change using the following Coccinelle spatch script:
> 
>  @@
>  type S, F;
>  identifier s, m, v;
>  @@
>       S *s;
>       ...
>       F *v = &s->m;
>       <+...
>  -    &s->m
>  +    v
>       ...+>
> 
> Inspired-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index 36e6f93c37..10ddf6bc91 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -710,7 +710,7 @@ static void xen_pt_destroy(PCIDevice *d) {
>      uint8_t intx;
>      int rc;
>  
> -    if (machine_irq && !xen_host_pci_device_closed(&s->real_device)) {
> +    if (machine_irq && !xen_host_pci_device_closed(host_dev)) {
>          intx = xen_pt_pci_intx(s);
>          rc = xc_domain_unbind_pt_irq(xen_xc, xen_domid, machine_irq,
>                                       PT_IRQ_TYPE_PCI,
> @@ -759,8 +759,8 @@ static void xen_pt_destroy(PCIDevice *d) {
>          memory_listener_unregister(&s->io_listener);
>          s->listener_set = false;
>      }
> -    if (!xen_host_pci_device_closed(&s->real_device)) {
> -        xen_host_pci_device_put(&s->real_device);
> +    if (!xen_host_pci_device_closed(host_dev)) {
> +        xen_host_pci_device_put(host_dev);

For the Xen part:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD
