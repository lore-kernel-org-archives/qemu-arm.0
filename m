Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1187065njb;
        Fri, 9 May 2025 08:38:58 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUTkn94PEGeM9jGnXmcMkgK7JQgNGCBeU6YxtjWRTpLiX7AeIjm1XnysdFWKfAXUqKEsgDGOD8IJJ7yPQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHtmQuIcyPmNdEYA4QRMEym1eZ8ZAyEQWjjTDljZOPWk58YeiXoIhDuBwzvQjN3E4UW2qtw
X-Received: by 2002:a05:6214:e8c:b0:6f4:cbd1:58fd with SMTP id 6a1803df08f44-6f6e480ab48mr66783846d6.28.1746805138036;
        Fri, 09 May 2025 08:38:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746805138; cv=pass;
        d=google.com; s=arc-20240605;
        b=WrlEo7vmA6Pu7/xHVTbO86wdEbUrEGB8H/rIg0osnUgbTV88qZn7NAWH83UnctsYVH
         JTWVzg3s1P9vDvcq0GPe0qa5CckcDlPQip98IcLhTcr9H7pwJ7cCSfEFly1HA5wln42f
         qG4swyOyvpW1BmDs5+3cVh1VpCL0mbeM1DBFe/aSCnZIl8BoSEbCm/I+j8UT9F7Iq3yL
         5Ys7H0/yOoFdo8sQa9P+9EM+8aFEGstzrMQV7TNpH0ddRsitFBHcFTLWOdZwWQ+KcPDn
         6dF4WldDUk+A3+FlQeieyHPFALNG51/QZW/bz9/TaKKWrIcTTgpGuY+mRTa9sDH3tvLD
         33DQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=nacOks2riggVWBsNA+mzbNQsW0rVzzTbedwggtXVT54=;
        fh=GD4a/74fu3m1OsjBEUbu3lZ6nxUcPWc9kaynFpiCTko=;
        b=IltPdhSr//akG3ScxuTp2C27PyUE13827PdOjULamgJX29AmUZ1ie59RKvATT7lAAN
         N0edNuTLTejbsUAZC8NycMtbKYB1xBVPWbqcZQmwmKJ32q1iMV02pCtQXWx/hPe9dqlo
         DWD9zKHxtqmSByCjKu5L9ItyYIZmpxdwt7a8oImCX2Rd10epOt+zCf08xMhwY0kEbybI
         vh5RPIrL8yBMu9lL/p8ucn5tEagffNwFYIZiDQ0nJTOx0XRpcaZNh8JNwEBZ6B0SyKY/
         J8mw+NNgvluaM1ZE4TX1CSC5oLWno3ziBlfndQpRZk3ImWBtRQdT2Qg01JZwUE0QUEA0
         ncTA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R0zSpsHr;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46074-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-46074-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-46074-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e6effsi25020506d6.30.2025.05.09.08.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46074-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=R0zSpsHr;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46074-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-46074-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D3E525CB3
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 15:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B57B21B9CE;
	Fri,  9 May 2025 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R0zSpsHr"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B622F757
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805119; cv=none; b=XNZNZ0elPnAxwM/KT3DS56bitAdlXHpplEbEVgml7yE5EtCHOxAgBTXLZbbSdooXaEFqjzZ7I5WaEng4LAdkDN9PfVZD5BWxMmB1XX90QQu5Xp+CVd13rA3ERJYsGeSrEZ6/TgU8qx6esbSQcuVd9jYOw4ASS0usNbApdjvLIlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805119; c=relaxed/simple;
	bh=4s2rO8gDEhG/vrt24mHiJ7x4gEXjB1pG/4/+2tzNW3c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMzsywNM7lEnstsceDo15x0Lv8kZLm3kvqm0O//fcdr+1CIbb8Q8h/Ossf85ILYFBPcsEJZMAyinSISuK6I4Ui3ZcudJebx7Cqvv8U6QgQWcDFSAsbgDZG57c/ekhWP4cjLGNgnmdFmExZduFkCS+KFNlFjG5dFG22yl/FWcB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R0zSpsHr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746805117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nacOks2riggVWBsNA+mzbNQsW0rVzzTbedwggtXVT54=;
	b=R0zSpsHrMzU6jkuWCozproO9X7gVrBl1ekZEObgTn5Gr4qCw/GAjXbOU54gmS8JrS7MzeO
	xxeCsg8KMa4K5eLBw+RQvsDYy1hnLHD3qOYd1Ra03l469hRJDjN2KsieSHkpFYWFkKPo5B
	2eowud7EEbbmZXfD0CkcjJys+Mf8iRw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-82oDUaa7PZOyolFM53_SyA-1; Fri, 09 May 2025 11:38:35 -0400
X-MC-Unique: 82oDUaa7PZOyolFM53_SyA-1
X-Mimecast-MFC-AGG-ID: 82oDUaa7PZOyolFM53_SyA_1746805114
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso15780965e9.3
        for <kvm@vger.kernel.org>; Fri, 09 May 2025 08:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805114; x=1747409914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nacOks2riggVWBsNA+mzbNQsW0rVzzTbedwggtXVT54=;
        b=GMfmwUClcs+DO5yAU6Cy/D7Kb7cwQOoaeeXnYKp6MpfJ+204qQP6nXozh93Eh0morZ
         P1TfUzu8y6gixkmdHBMBXAAOH8lKnjn0lLv8J7S35a2CAUlGuSV88ACehg3wyHPit/Jz
         iMqyMmSDSpwuK60ZDOLoxHyd8HIgU2+BIWL+ckFz/SJIorP1j669VDtealaSX4vEricR
         N+ZwDguiO48OOUCk9ecxMjqW8HIQZYjmyRyiGX93dJlMyZyliQ7GbWYPc8fBAmU2EccE
         3x5SJone3G2mVGLAOj2/74JOegkkv160aN2YoTDY45fShU4gcYpqbH1rpMLLcMSvhjlw
         hQqw==
X-Forwarded-Encrypted: i=1; AJvYcCVPTDfVf19fKmgwtr6qIhDSKdpEGqbt9GlW4MzQ0Y7Wtkh7uyUGsmuL7PijcPS8PHghCBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnX56vj4IT57vAcqhhaBOvsEtjApK+D+W29giP85ZtDQwtVO7s
	i4lKww84zv//LceWVARbYdjXekT03fNUIh9DVGZs+HtqpWhLnGCpbmtOMmbjYKMf5OyEDHPGMj9
	55ThZHtt5ap11ExFtiE84p3DqaqJOXRSLUZ30Is0AQPtrqYFAQQ==
X-Gm-Gg: ASbGncuygCENtQ05qPoccWjKC6LDeSbh2DX4hKWqIOmLFiPqObbGKKNbdeGbGZ0vkdN
	YmV4XDEsxiAREvzZlV/Ne//mV8kl9I2G9bcIzU8pQ/NUj3D0XRRoU8lhHbyg8UYctIsfNSNuPCY
	a9GkXTY0nf4YhJDr5rjLFxMOQDhH3RINXEDeAaLYSBwp+pzrtJq200QfgxrLSQgd8+REGmhDHO1
	BnmWj5HoGvS3b4b8Y+tu4+r2m7zKt9zr3i+bqhd41Nb415in2ImdZsH9jNjMdQqdqJ4eLagaGuw
	0BmXHVZczWFaM7fAPmcosDpaC6H3QWmR
X-Received: by 2002:a05:600c:1da8:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-442d6d1f997mr36588955e9.9.1746805114255;
        Fri, 09 May 2025 08:38:34 -0700 (PDT)
X-Received: by 2002:a05:600c:1da8:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-442d6d1f997mr36588685e9.9.1746805113892;
        Fri, 09 May 2025 08:38:33 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bc2esm75445085e9.20.2025.05.09.08.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:38:33 -0700 (PDT)
Date: Fri, 9 May 2025 17:38:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 05/27] hw/nvram/fw_cfg: Factor
 fw_cfg_init_mem_internal() out
Message-ID: <20250509173830.65d0fde7@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-6-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
	<20250508133550.81391-6-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: deM2F/UQNJUa

On Thu,  8 May 2025 15:35:28 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Factor fw_cfg_init_mem_internal() out of fw_cfg_init_mem_wide().
> In fw_cfg_init_mem_wide(), assert DMA arguments are provided.
> Callers without DMA have to use the fw_cfg_init_mem() helper.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/nvram/fw_cfg.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 10f8f8db86f..4067324fb09 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -1053,9 +1053,9 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uin=
t32_t dma_iobase,
>      return s;
>  }
> =20
> -FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
> -                                 hwaddr data_addr, uint32_t data_width,
> -                                 hwaddr dma_addr, AddressSpace *dma_as)
> +static FWCfgState *fw_cfg_init_mem_internal(hwaddr ctl_addr,
> +                                            hwaddr data_addr, uint32_t d=
ata_width,
> +                                            hwaddr dma_addr, AddressSpac=
e *dma_as)
>  {
>      DeviceState *dev;
>      SysBusDevice *sbd;
> @@ -1087,10 +1087,19 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>      return s;
>  }
> =20
> +FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
> +                                 hwaddr data_addr, uint32_t data_width,
> +                                 hwaddr dma_addr, AddressSpace *dma_as)
> +{
> +    assert(dma_addr && dma_as);
> +    return fw_cfg_init_mem_internal(ctl_addr, data_addr, data_addr,
> +                                    dma_addr, dma_as);
> +}
> +
>  FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
>                                    unsigned data_width)
>  {
> -    return fw_cfg_init_mem_wide(ctl_addr, data_addr, data_width, 0, NULL=
);
> +    return fw_cfg_init_mem_internal(ctl_addr, data_addr, data_width, 0, =
NULL);
>  }
> =20
> =20

