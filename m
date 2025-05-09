Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1201060njb;
        Fri, 9 May 2025 09:02:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV06k0GVmHOIl4GF74xm3LE+3Y2y5JgHZMK0PuI7fM3hsQvp9mrP/AEA/BzQSOSAQVd7ni3Te8r3KmzLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IELyXE+P55bNX0VqyB9Qxr2SArYprKGiC/px3gva+0+C7hepzhmJ1pKiEQ+X+A2s9AWX8rt
X-Received: by 2002:a05:620a:2894:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7cd0116e27bmr700237085a.49.1746806544919;
        Fri, 09 May 2025 09:02:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746806544; cv=none;
        d=google.com; s=arc-20240605;
        b=IY5O02ifYeglwQAyBwX4DqTX9KiJfFijPUD1pWezOCNtz5tdXn8mC8ZeSGF/0w45/3
         pFmX7+B94K6mn1smeVpeFelQjYYyfx6Pi2SHLoXqAnl8U4iE1TIBK2L8MIjA2qi/t3a/
         L1qtooUJr7cuLN0ZXpWMawufgaCH3AaK73GQHH2bWqr69Y8e4/IEn+t5tFBEJGFZdf3X
         LHhiYa+JCYDuSBnAZxY0JgpuYgF09sAIYjk9G4W1avgI/IssIMzZwmEegjSNm1p1LmB+
         PyZmjf+7W0v4Pekb0va+2BXmhCkp9zmtd9GHuVomTjZdeg4lUJOKm7UwXqBELsRmJe+S
         4R3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=1l2f1VTt8XFWF8y5nnU3g+hJzfAgoHTdTr9qTI5UxXU=;
        fh=dmbIwjQnNYzeQB/6IcWWUWQu497bLqFlsqr+XqgwHto=;
        b=SiBD/KuwuNg0ZeeBtsdkCTOFTb1rArm56HC9YmKYrqUH+jdokGoS6FpKndNGL3cr/8
         WXbjNuDC1LtnhiQ4di2jMQQ5n4grZ8zmXVGzTN2J2nw9C6KkohpK+qfLeUG/e+GyMsj0
         qZwVlBExxXMaGomwS4a+XE60XJ56DvUAJUtpFahc8qlrZOwaWHQS0KojRw+7MyOX5w0n
         sATEvQUIDALj1PxbvU+g3ty7o2KKgNJ/Xxw823HOVSBLc4SO1mrP07Cyt6Yd0bnw0Qbd
         BxJGzukY6/1YhRv8E01dnR4lQqdhp5w/R6hY4I2+Mr5mfvrr5kFVQ1AJUqkzc8WpMyti
         v6+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/4Wt74A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd46acsi243706085a.303.2025.05.09.09.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 09:02:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="K/4Wt74A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDQA5-0008DN-QS; Fri, 09 May 2025 12:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDQ9m-0007le-EL
 for qemu-arm@nongnu.org; Fri, 09 May 2025 12:01:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uDQ9j-00042D-HC
 for qemu-arm@nongnu.org; Fri, 09 May 2025 12:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746806458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1l2f1VTt8XFWF8y5nnU3g+hJzfAgoHTdTr9qTI5UxXU=;
 b=K/4Wt74AVUuStY2qeO+6aPFi2IjHrEYfpP2Pb1TJCskT21VaCuOYHkwoRoJCBpjx5AVbiq
 4s9LhmPFyhzUspNFDSSWqFigpXXjZUq8bLGyzPvuq5mV34RcJUmLsUZ2jh97GGKO0R8geQ
 yeICVryiEijKDB9k0oTLu4fI9z5d2wI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-gjMC9TIvOXar0ra1Mi_mIQ-1; Fri, 09 May 2025 12:00:55 -0400
X-MC-Unique: gjMC9TIvOXar0ra1Mi_mIQ-1
X-Mimecast-MFC-AGG-ID: gjMC9TIvOXar0ra1Mi_mIQ_1746806455
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43e9a3d2977so15297025e9.1
 for <qemu-arm@nongnu.org>; Fri, 09 May 2025 09:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746806455; x=1747411255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pp1R+sHe0G6QXL8IYhdEIVqTNgya/k6FcsiXO1F4Qzc=;
 b=rqLD4XUNVKTXCF79vZ3/pedUG2Zi7MIH3SQ/cRTkBkx9RdW8DEBBBfJJmJbzFcieeb
 PPCK3MdLHr1/AZcjRoZJiGnL8qW82fIX36kBEUABaMS+Y8fWxMT4kvXALc0q+DWDeub8
 8X6m62VnyVCmQ0Adpxtqo9bs3XnxpNrz6CPt/zpr7ixLkpjFzcvpOkUSUMcQboPcRl/N
 9dg3GycLFSLf6ZEtRKSuOanGgIPc33Nav/V/zFLrvrkAVwtEPQhXW2W/9Ag1ilL8i626
 P8d1rP+f1Fq6woEwmZtkNuNydrstF8S3Q+q3lieIy9q9eZxFN1uOCIkS8dFlfrX2/V9f
 TY4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9bh/qaVORmOvBMdDdMJHB7OyWMRv9oSF7Ua/yPAPDAfsyhBun+YRX+Wno5V9ePXDYltWMMOv0NQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzb+2JbrgEPTH1uZYeKmbvLW1pZrVKhcMyNramRDzg08MvrjHLa
 dwHSUJYIMYohW8NmNznYv68iMcynsBIjxwdxDgm433x68VJkUa+tl4nn5fhVIBAW9E7plL4urOe
 1hF+SmYsx0nSGEgMxjPQmrryPdfqGOTOemOsrFlzZagmsprKkfA==
X-Gm-Gg: ASbGncsDuuC7gMuCdwRuobL7NYClH9DEnMRXGs0wtXh2+aVoULknsz/XG4oqEu/wCjg
 WHEqHqzDB8Bqnfpa3zxbsj2vtchuChfLEjVHmIy64VqcGUyefPddkSBmQiJoxqnR5p73qs108Cy
 u9Pv/+vjIz/hmpjtavvw1U5IV7FSyCcEA5nTM49En8e4Z6kDckYktqGWao9t7mEc+3CLJH4UpwF
 9QilcfIAbXMJYI6pd1/eu2CBdRMTQmciegXGrjlcVr4BxQKEYYDPZ9Iy5oB9PpyvNha8i7bohsd
 SgskBi0yCCLyY5KJTAe+R/zcMgp8H2GZ
X-Received: by 2002:a05:600c:699a:b0:43c:ee3f:2c3 with SMTP id
 5b1f17b1804b1-442d6d18b4dmr37308465e9.7.1746806454596; 
 Fri, 09 May 2025 09:00:54 -0700 (PDT)
X-Received: by 2002:a05:600c:699a:b0:43c:ee3f:2c3 with SMTP id
 5b1f17b1804b1-442d6d18b4dmr37307645e9.7.1746806454010; 
 Fri, 09 May 2025 09:00:54 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d67df5ecsm33860625e9.9.2025.05.09.09.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:00:53 -0700 (PDT)
Date: Fri, 9 May 2025 18:00:50 +0200
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
Subject: Re: [PATCH v4 09/27] hw/nvram/fw_cfg: Remove
 fw_cfg_io_properties::dma_enabled
Message-ID: <20250509180050.0b91cef1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-10-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-10-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PFFxRAL3YVI_JLARlKhPk0efdLiKhGtsQkpz1bha7bs_1746806455
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.413,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dU/bkE1LBgD1

On Thu,  8 May 2025 15:35:32 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Now than all calls to fw_cfg_init_io_dma() pass DMA arguments,
> the 'dma_enabled' of the TYPE_FW_CFG_IO type is not used anymore.
> Remove it, simplifying fw_cfg_init_io_dma() and fw_cfg_io_realize().
>=20
> Note, we can not remove the equivalent in fw_cfg_mem_properties[]
> because it is still used in HPPA and MIPS Loongson3 machines:
>=20
>   $ git grep -w fw_cfg_init_mem_nodma
>   hw/hppa/machine.c:204:    fw_cfg =3D fw_cfg_init_mem_nodma(addr, addr +=
 4, 1);
>   hw/mips/loongson3_virt.c:289:    fw_cfg =3D fw_cfg_init_mem_nodma(cfg_a=
ddr, cfg_addr + 8, 8);
>=20
> 'linuxboot.bin' isn't used anymore, we'll remove it in the
> next commit.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/i386/fw_cfg.c     |  5 +----
>  hw/i386/x86-common.c |  5 +----
>  hw/nvram/fw_cfg.c    | 26 ++++++++------------------
>  3 files changed, 10 insertions(+), 26 deletions(-)
>=20
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index 5c0bcd5f8a9..1fe084fd720 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -221,10 +221,7 @@ void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw=
_cfg)
>       * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA, the
>       * DMA control register is located at FW_CFG_DMA_IO_BASE + 4
>       */
> -    Object *obj =3D OBJECT(fw_cfg);
> -    uint8_t io_size =3D object_property_get_bool(obj, "dma_enabled", NUL=
L) ?
> -        ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t) :
> -        FW_CFG_CTL_SIZE;
> +    uint8_t io_size =3D ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_addr_t=
);
>      Aml *dev =3D aml_device("FWCF");
>      Aml *crs =3D aml_resource_template();
> =20
> diff --git a/hw/i386/x86-common.c b/hw/i386/x86-common.c
> index 27254a0e9f1..ee594364415 100644
> --- a/hw/i386/x86-common.c
> +++ b/hw/i386/x86-common.c
> @@ -991,10 +991,7 @@ void x86_load_linux(X86MachineState *x86ms,
>      }
> =20
>      option_rom[nb_option_roms].bootindex =3D 0;
> -    option_rom[nb_option_roms].name =3D "linuxboot.bin";
> -    if (fw_cfg_dma_enabled(fw_cfg)) {
> -        option_rom[nb_option_roms].name =3D "linuxboot_dma.bin";
> -    }
> +    option_rom[nb_option_roms].name =3D "linuxboot_dma.bin";
>      nb_option_roms++;
>  }
> =20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 51b028b5d0a..ef976a4bce2 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -1026,12 +1026,9 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, ui=
nt32_t dma_iobase,
>      FWCfgIoState *ios;
>      FWCfgState *s;
>      MemoryRegion *iomem =3D get_system_io();
> -    bool dma_requested =3D dma_iobase && dma_as;
> =20
> +    assert(dma_iobase);
>      dev =3D qdev_new(TYPE_FW_CFG_IO);
> -    if (!dma_requested) {
> -        qdev_prop_set_bit(dev, "dma_enabled", false);
> -    }
> =20
>      object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
>                                OBJECT(dev));
> @@ -1042,13 +1039,10 @@ FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, u=
int32_t dma_iobase,
>      memory_region_add_subregion(iomem, iobase, &ios->comb_iomem);
> =20
>      s =3D FW_CFG(dev);
> -
> -    if (s->dma_enabled) {
> -        /* 64 bits for the address field */
> -        s->dma_as =3D dma_as;
> -        s->dma_addr =3D 0;
> -        memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
> -    }
> +    /* 64 bits for the address field */
> +    s->dma_as =3D dma_as;
> +    s->dma_addr =3D 0;
> +    memory_region_add_subregion(iomem, dma_iobase, &s->dma_iomem);
> =20
>      return s;
>  }
> @@ -1185,8 +1179,6 @@ static void fw_cfg_file_slots_allocate(FWCfgState *=
s, Error **errp)
>  }
> =20
>  static const Property fw_cfg_io_properties[] =3D {
> -    DEFINE_PROP_BOOL("dma_enabled", FWCfgIoState, parent_obj.dma_enabled=
,
> -                     true),

in 7/27 you still have, fw_cfg_dma_enabled(fw_cfg) which works around
now missing property (in IO case) in obscure way.
that is also used in bios_linker_loader_can_write_pointer().

It would be better to get rid of fw_cfg_dma_enabled() as well
or keep property as RO and replace fw_cfg_dma_enabled() with property
accessor if both calls can happen on nondma path                     =20


>      DEFINE_PROP_UINT16("x-file-slots", FWCfgIoState, parent_obj.file_slo=
ts,
>                         FW_CFG_FILE_SLOTS_DFLT),
>  };
> @@ -1207,11 +1199,9 @@ static void fw_cfg_io_realize(DeviceState *dev, Er=
ror **errp)
>      memory_region_init_io(&s->comb_iomem, OBJECT(s), &fw_cfg_comb_mem_op=
s,
>                            FW_CFG(s), "fwcfg", FW_CFG_CTL_SIZE);
> =20
> -    if (FW_CFG(s)->dma_enabled) {
> -        memory_region_init_io(&FW_CFG(s)->dma_iomem, OBJECT(s),
> -                              &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma=
",
> -                              sizeof(dma_addr_t));
> -    }
> +    memory_region_init_io(&FW_CFG(s)->dma_iomem, OBJECT(s),
> +                          &fw_cfg_dma_mem_ops, FW_CFG(s), "fwcfg.dma",
> +                          sizeof(dma_addr_t));
> =20
>      fw_cfg_common_realize(dev, errp);
>  }

