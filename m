Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1183974njb;
        Fri, 9 May 2025 08:33:49 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVp1Nd3xZYliy2z98fxnumqq3UCfJlebTBgTFEwcbhTIwgVE7+4mpeFcDIFoJ0Ck8C37EkWfSdXprgOgg==@linaro.org
X-Google-Smtp-Source: AGHT+IH17umdNyOkLF6tV/V5oWXy2NdN+zo5w33zjzxsfjMal31OQbvzho3qdBfBg0xycYtjr288
X-Received: by 2002:a05:6402:3509:b0:5fc:3e6e:f048 with SMTP id 4fb4d7f45d1cf-5fca035ef1dmr3315078a12.0.1746804828932;
        Fri, 09 May 2025 08:33:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746804828; cv=pass;
        d=google.com; s=arc-20240605;
        b=fZXj+vk3wDCPNy8LPpKNy7UlhHCrOIQrtBAHxcIpAN9TzgrcFpPOtK+U/PG3a8AC8c
         tMUv3eMdL17c1m4S33MlYVPgzUq2tQgQTI1OHx72/OPsWxcFJ3YNjOW5fdn2FFv8LRtZ
         xupjolEVSSWiIuItQgxBNp2erMCjd0V2/AB+O6/zJnZ+HlYC7d/6U93d9dgntYhvq8UI
         fsIYwO9806n1WiRSKr2zq1+QJyhCJq/laJwYk37nUQdpgbgnhFMlbqRYTdYN9naOXnFn
         rUeH7qyU6xkYlmsyR0EAjkoLUB/4m1Uxe9srNwplj0vIQGhKeM660EkX581K7UU/ZTKZ
         rstQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cxYNx3ojouceqPK+Dr7auESWb9mDE/VjwCaYTP8lEmw=;
        fh=Ufg5Xd5/T1gmW2p8eKpMUbAvNxxmmI/Fx9Stqfo1ay8=;
        b=P6v3NwSUkfjkFhLaKShksxeer3JEA5udnpZZa2eZvB22f8qyS5Oq9Wt4lVbM8V7Fcu
         vyy7nKge+0Njg1fFUFVx7CX05ENZ6Ca/W1OMnPP51VCENBeoqde2XUCRN0W971zEptPe
         wnSOU91tJA3fY3lcYM4DbA+kpeGz8MG+ngDbbv8Xg7DSKJrJQCRIUzOddm4nc616DPi0
         u50D/p3m5dFRNOP+yNqp2nOFxlbXQXPePzUKRF5zql24lfD+X2nBXLOqo8Wte/QDlqIM
         WYGhmL/DPFyBFnx29gI5AHoLeL1eIDecsbOt7sfnGa6djmytmIw/gmZJSeNEHjytUOrb
         +lkA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cl22f+jI;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46072-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-46072-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5fc9d6f4c81si1645676a12.522.2025.05.09.08.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cl22f+jI;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-46072-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46072-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18F1418935A2
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 15:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A3A1F03D5;
	Fri,  9 May 2025 15:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cl22f+jI"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C0A22CBE9
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804824; cv=none; b=HSv24rn1r1EHtdZuTcn0HRONp5ignw2vuZAjKFIOeyiPo3z3hubzJNaXuF/tn7q/b+/u7GhTH2l/S7A9nyTWLXRJXHMn2BPj+9XDG+IeYHF8a3mmt2oeu200SK46FWfsvaK//TPn17B3tA0UBbLfiI6HagtR9dH/fZit3neNUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804824; c=relaxed/simple;
	bh=HldbnI7znCYnOnbLT4smVScvkvvXgrFbnasmUcwcVF8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HFRNXdN02vi+DibBm7JMPBcyTscMD9Tkz8wXt/fZAllXE25hINYkCIT5xofTwVCju+Oy/P0+57pUljy5Vc1MZlbTmQVvu4asMRhOJsIE0Kt0JV8Tc3b9VvR6shI3C3r5aJ5KhBnt7fjUfI4F3FKE0sLL4Qs40AiBoWH3kNZrdqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cl22f+jI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746804821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cxYNx3ojouceqPK+Dr7auESWb9mDE/VjwCaYTP8lEmw=;
	b=cl22f+jIhOLr4F4dEys0mGoMisZnsQWl+tKxpxXBHLd8MNk9vd2DLO2A/DmKSuqbxDWXY0
	VnMOtMpJSxLYL9p5GE+bWnoEYQsI0sEFYqY/m2LYaAwbOgJ2a7dC8b/4euumXRB/POK0pP
	NaVW6PGrteOK2/HPg0TJhRVArtd7MTs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-QDPAWoz6OzCxH0sWfOEjjQ-1; Fri, 09 May 2025 11:33:40 -0400
X-MC-Unique: QDPAWoz6OzCxH0sWfOEjjQ-1
X-Mimecast-MFC-AGG-ID: QDPAWoz6OzCxH0sWfOEjjQ_1746804819
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a0b63ca572so1384546f8f.0
        for <kvm@vger.kernel.org>; Fri, 09 May 2025 08:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804819; x=1747409619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxYNx3ojouceqPK+Dr7auESWb9mDE/VjwCaYTP8lEmw=;
        b=G5wKbi3WmWJH/2xelq9QOaMdHvSiDkU2g8HsFIkaJZrIoQr2zevp1/5PnnrWcGvUj/
         61Cnrdzud1TJdKNwz9vwCfKvEIlkgW5nt36HaqUSi4GJT1UG/eYrzCUwwEHqN3LKWnkT
         nszcBnLv4UwM6IEBmjbYjgusSqBpxM2LU8CXslLL3qG1Sax0cM3Jdyq318Krmiux0gnj
         eKc8aNG5BkeG2Aw7L4Y/hPBva/hz0mxZS+E82JmlhsMzrc23jiii6nyy3GWR8XxxrlLC
         +t+hGfgm8ijtCxbkH5lNe0ShaCrVn/uU9S41vtC9KlwHaxPOdO465gj8AVD+U3mVZKb5
         Wt4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOwatqzIgIahYxhwln+4z3MUpNpfUQf9ufEm7rkPOYNNrnVdBnO0pGKGLoPMOB/kxuyRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw05NYSfeJkHy2AMDPKR68MfhAwO8ok1MNE75M7PuVFKCaE2Mmg
	30/QiLTeda8DDLq+2QDIkLb56LrHpZ4C7xo8T+3RwfL3a8v/IDmulLhZexvbG+iJrx2ZMxOsYG7
	p4oKjHiWjvbEpHFYbhsMKDsksxfnFw7KnmeTr2VMxTdIf+TkWdw==
X-Gm-Gg: ASbGncuVNLACPDhiC+0O+3lgQz2jHyUtqc49PXU4tGbQ3ieubpacuE508htKpKiqi/V
	7Isp8qIHOZ+6Oj+wEe4RhvLgf5MSuDxWumXVlFwbPCxw+OuIMLQiVTPUI5f8cnT3hTod2kjWm7k
	beE7dHSpFTlS9gL7rtFfwwCPdjXVqLeCgZspXoSjp51SX/rm6efuAG9/na2wta5tl10yXavByEG
	UdvFpwf+KnwDnzMObBVFGbhGApMcSfunX9zDqveFbGQAA6ASJGND6hy2CrlbfSquLay8dyQwY3s
	OreS7/DZWRcy/6kV6lfL9o60S7Ljirex
X-Received: by 2002:a5d:5f82:0:b0:3a0:7af3:843f with SMTP id ffacd0b85a97d-3a1f6432cb9mr3198015f8f.19.1746804818901;
        Fri, 09 May 2025 08:33:38 -0700 (PDT)
X-Received: by 2002:a5d:5f82:0:b0:3a0:7af3:843f with SMTP id ffacd0b85a97d-3a1f6432cb9mr3197999f8f.19.1746804818536;
        Fri, 09 May 2025 08:33:38 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d14e6d74sm66226135e9.21.2025.05.09.08.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:33:38 -0700 (PDT)
Date: Fri, 9 May 2025 17:33:36 +0200
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
Subject: Re: [PATCH v4 03/27] hw/nvram/fw_cfg: Rename fw_cfg_init_mem() with
 '_nodma' suffix
Message-ID: <20250509173336.637f0ed8@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-4-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
	<20250508133550.81391-4-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DYrtLbdMPFP0

On Thu,  8 May 2025 15:35:26 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Rename fw_cfg_init_mem() as fw_cfg_init_mem_nodma()
> to distinct with the DMA version (currently named
> fw_cfg_init_mem_wide).
>=20
> Suggested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/nvram/fw_cfg.h | 3 ++-
>  hw/hppa/machine.c         | 2 +-
>  hw/nvram/fw_cfg.c         | 7 +++----
>  3 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index d41b9328fd1..d5161a79436 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -307,7 +307,8 @@ bool fw_cfg_add_file_from_generator(FWCfgState *s,
> =20
>  FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
>                                  AddressSpace *dma_as);
> -FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr);
> +FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
> +                                  unsigned data_width);
>  FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>                                   hwaddr data_addr, uint32_t data_width,
>                                   hwaddr dma_addr, AddressSpace *dma_as);
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index dacedc5409c..0d768cb90b0 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -201,7 +201,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms, PC=
IBus *pci_bus,
>      int btlb_entries =3D HPPA_BTLB_ENTRIES(&cpu[0]->env);
>      int len;
> =20
> -    fw_cfg =3D fw_cfg_init_mem(addr, addr + 4);
> +    fw_cfg =3D fw_cfg_init_mem_nodma(addr, addr + 4, 1);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, ms->smp.cpus);
>      fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, HPPA_MAX_CPUS);
>      fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ms->ram_size);
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 54cfa07d3f5..10f8f8db86f 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -1087,11 +1087,10 @@ FWCfgState *fw_cfg_init_mem_wide(hwaddr ctl_addr,
>      return s;
>  }
> =20
> -FWCfgState *fw_cfg_init_mem(hwaddr ctl_addr, hwaddr data_addr)
> +FWCfgState *fw_cfg_init_mem_nodma(hwaddr ctl_addr, hwaddr data_addr,
> +                                  unsigned data_width)
>  {
> -    return fw_cfg_init_mem_wide(ctl_addr, data_addr,
> -                                fw_cfg_data_mem_ops.valid.max_access_siz=
e,
> -                                0, NULL);
> +    return fw_cfg_init_mem_wide(ctl_addr, data_addr, data_width, 0, NULL=
);
>  }
> =20
> =20

