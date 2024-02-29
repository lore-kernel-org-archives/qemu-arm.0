Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp227854eja;
        Wed, 28 Feb 2024 23:52:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXsmMpXETVMThfDWfj4CKqUVDFWdyd2WDayWm9+gBoFlvPx17sTtOhKr1WAbw0FvYyCAb2ah+qE8FXtS50bso/3ZCzPAYKF
X-Google-Smtp-Source: AGHT+IFMvqcYmlH1TAtkFjqVGcjjVRx+yMUC2SgkdWdKO/7E4TXWUa24CfnyUptTZfTqbIt8waeb
X-Received: by 2002:a05:620a:1a0d:b0:787:df2a:bbf5 with SMTP id bk13-20020a05620a1a0d00b00787df2abbf5mr1850813qkb.38.1709193135671;
        Wed, 28 Feb 2024 23:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709193135; cv=none;
        d=google.com; s=arc-20160816;
        b=WCRWrXyx4mF1+xugvApEgPG7qUjEpDHKnoF2ipkk0Zcndtz+gxNo7wrLfVU/9r2kHz
         L1V955hy1wZunfbxNLv70HeXVqwerYhLsUiZZ3OhhQoxyx1iMvZs99PEmVOY/kPYIYo1
         anA5kJoDNSgThm0/hME4Xh5+Bt/3S3Q3vWecDZ2SqCoeMB7iHvwnvlf5mSHCFHlxK3FU
         WemRZ1VgtmC5DBiOv/mh0V7P1GpygyjXfZln9sb6RHmOEQkahcE8tPdrqAblGohtikX7
         nFj02s590BdZmENhBHSIA5iTijRoThGmlU9s1p3ehG8iuU08KWLNLngzdo0bjpuTvhGU
         5rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=1ftegPjJzDRirAWTFgiZ8qfMnV03M4216LE0RFWMiRw=;
        fh=jVWmmOmQHGpJ1jkFs8N7BSeNZNqus67fpLjDGGNAEfI=;
        b=fWXvW+g11yaODa5517IXZSth92E1Ms2NxvRS2aB18XnhAybGJAG7M4CxPX5toM0Fe7
         T3z0vkaN6NwtLFmzDCXJn5PTyk+3E59isWsEd6dxqXzECL3hqlfmaMxSUhZJV+hf6O1m
         3UfVQvAYVIXb6G10QSZjLgDnScsCoL3MgA+Mcoej8yFCrHjgD1Xj8JxubQRbmlFOY+vp
         s2+zRDT2ZImXXPN+lFXoM5W1HlBmW8L4wGFZJr/RPUX3/2F3i2d/d/UK+yLEmCgav37C
         YGDWlaow4LeLoGVBubEOgk+5pkVmJGA7rb7xVpxb9PdPWMLhfvJYgbz1VY1ClT/oeZFr
         aw/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L8u0FqB8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020a05620a12ee00b0078772a9cf60si877228qkl.346.2024.02.28.23.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 23:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L8u0FqB8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfbCt-0006Kw-T3; Thu, 29 Feb 2024 02:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfbCr-0006K4-OY
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 02:51:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfbCq-0000BJ-7r
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 02:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709193110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ftegPjJzDRirAWTFgiZ8qfMnV03M4216LE0RFWMiRw=;
 b=L8u0FqB8YJOLx2Ct4eb0PXnQRMDwrS8IIUrHLNT86anAICpsW0oDkhHg7EmmqH6DxT53nk
 rPTkXdpI+G+yVouij49fXX3cp3pwi3hHm0A///q483RN42w8Z5fMek2vV1Y9AW0ZBJn9wE
 n7MBYvX4SufmS5xIFR48BgkxCNAkPBY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-hAOrESC5ON22adcZY7mQgQ-1; Thu, 29 Feb 2024 02:51:47 -0500
X-MC-Unique: hAOrESC5ON22adcZY7mQgQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-5c65e666609so595840a12.1
 for <qemu-arm@nongnu.org>; Wed, 28 Feb 2024 23:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709193107; x=1709797907;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vYZe/DZW2BzM3r0kIBtLsS/lPvl3VeHQTWZOYH4EiX0=;
 b=L16tMtATfRSQF2r0awiAASD8caVFP2rD0CcLUueqXXMMzOS9mnCDLXJwL2psbicY4K
 V5OkyHIZETqZ8Ps6E4F864ou/P1weMq1IBxFewDQFg7XpDEKyP6Nr5tBTgLmhD6nVm38
 W+J6t5k2vfo53xFvZ2jJS1choUjcCxfDP8qsdAOweoorMK798shEUS0PkXs8CZFCU4Rj
 uXhv295eprDdRsANMl7wsBWzZJm3mQ6sQDu3mtYNxCGMretKDscp81+vrhkilZmPJjGB
 lyslLVt4CxrrYurWhEERths25GUaRP+wrUXggvLiThqcWz6pPb7h4s6q9Wi9vYx8FVLC
 a43g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS7Mm+++9bv2wdvS5jGDiHUiBgG/Z3GrHzdmO1/xbolRZrAmmKhOqv8Fu2DjrMw23YKsle3bP/m5/Ys/ihKPx4vBxC
X-Gm-Message-State: AOJu0Yy9YUB6i8X+5hvbRbqEVTJiP444p9gsC68S1k3YDvcVQ/+Fk27Y
 z6waBMkFuAU1FBvzFEqnyQYgn0knEcx5MEY5J/TfNUYzmRyE42bxf0JyhX47ZgDcuiivRPOUZfl
 7DGLphP3qJYk0OYa4UaU8TfD49BV2maSLmOVS99RaSyLDRkILEg==
X-Received: by 2002:a17:90a:e601:b0:29a:377f:3994 with SMTP id
 j1-20020a17090ae60100b0029a377f3994mr1403244pjy.13.1709193106850; 
 Wed, 28 Feb 2024 23:51:46 -0800 (PST)
X-Received: by 2002:a17:90a:e601:b0:29a:377f:3994 with SMTP id
 j1-20020a17090ae60100b0029a377f3994mr1403229pjy.13.1709193106472; 
 Wed, 28 Feb 2024 23:51:46 -0800 (PST)
Received: from smtpclient.apple ([223.191.49.228])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a17090af10d00b0029681231ae1sm778568pjb.28.2024.02.28.23.51.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Feb 2024 23:51:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 05/19] smbios: get rid of smbios_smp_sockets global
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-6-imammedo@redhat.com>
Date: Thu, 29 Feb 2024 13:21:14 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <AF2F995D-246B-481E-B3C6-CF95F1BD6B13@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-6-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.102,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: N88WjKtgiwNn



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> it makes smbios_validate_table() independent from
> smbios_smp_sockets global, which in turn lets
> smbios_get_tables() avoid using not related legacy code.
>=20
Good cleanup!

> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>


> ---
> goal here is to isolate legacy handling from generic smbios_get_tables()
> ---
> include/hw/firmware/smbios.h |  2 +-
> hw/i386/fw_cfg.c             |  2 +-
> hw/smbios/smbios.c           | 22 +++++++++-------------
> 3 files changed, 11 insertions(+), 15 deletions(-)
>=20
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 6e514982d4..a187fbbd3d 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -296,7 +296,7 @@ void smbios_set_defaults(const char *manufacturer, co=
nst char *product,
>                          const char *version, bool legacy_mode,
>                          bool uuid_encoded, SmbiosEntryPointType ep_type)=
;
> void smbios_set_default_processor_family(uint16_t processor_family);
> -uint8_t *smbios_get_table_legacy(MachineState *ms, size_t *length);
> +uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *len=
gth);
> void smbios_get_tables(MachineState *ms,
>                        const struct smbios_phys_mem_area *mem_array,
>                        const unsigned int mem_array_size,
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index a635234e68..fcb4fb0769 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -70,7 +70,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgSta=
te *fw_cfg)
>     /* tell smbios about cpuid version and features */
>     smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX=
]);
>=20
> -    smbios_tables =3D smbios_get_table_legacy(ms, &smbios_tables_len);
> +    smbios_tables =3D smbios_get_table_legacy(ms->smp.cpus, &smbios_tabl=
es_len);
>     if (smbios_tables) {
>         fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
>                          smbios_tables, smbios_tables_len);
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 8e86c62184..15339d8dbe 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -70,7 +70,7 @@ static SmbiosEntryPoint ep;
> static int smbios_type4_count =3D 0;
> static bool smbios_immutable;
> static bool smbios_have_defaults;
> -static uint32_t smbios_cpuid_version, smbios_cpuid_features, smbios_smp_=
sockets;
> +static uint32_t smbios_cpuid_version, smbios_cpuid_features;
>=20
> static DECLARE_BITMAP(have_binfile_bitmap, SMBIOS_MAX_TYPE+1);
> static DECLARE_BITMAP(have_fields_bitmap, SMBIOS_MAX_TYPE+1);
> @@ -476,14 +476,11 @@ opts_init(smbios_register_config);
>  */
> #define SMBIOS_21_MAX_TABLES_LEN 0xffff
>=20
> -static void smbios_validate_table(MachineState *ms)
> +static void smbios_validate_table(uint32_t expected_t4_count)
> {
> -    uint32_t expect_t4_count =3D smbios_legacy ?
> -                                        ms->smp.cpus : smbios_smp_socket=
s;
> -
> -    if (smbios_type4_count && smbios_type4_count !=3D expect_t4_count) {
> +    if (smbios_type4_count && smbios_type4_count !=3D expected_t4_count)=
 {
>         error_report("Expected %d SMBIOS Type 4 tables, got %d instead",
> -                     expect_t4_count, smbios_type4_count);
> +                     expected_t4_count, smbios_type4_count);
>         exit(1);
>     }
>=20
> @@ -571,7 +568,7 @@ static void smbios_build_type_1_fields(void)
>     }
> }
>=20
> -uint8_t *smbios_get_table_legacy(MachineState *ms, size_t *length)
> +uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *len=
gth)
> {
>     if (!smbios_legacy) {
>         *length =3D 0;
> @@ -581,7 +578,7 @@ uint8_t *smbios_get_table_legacy(MachineState *ms, si=
ze_t *length)
>     if (!smbios_immutable) {
>         smbios_build_type_0_fields();
>         smbios_build_type_1_fields();
> -        smbios_validate_table(ms);
> +        smbios_validate_table(expected_t4_count);
>         smbios_immutable =3D true;
>     }
>     *length =3D smbios_entries_len;
> @@ -1112,10 +1109,9 @@ void smbios_get_tables(MachineState *ms,
>         smbios_build_type_2_table();
>         smbios_build_type_3_table();
>=20
> -        smbios_smp_sockets =3D ms->smp.sockets;
> -        assert(smbios_smp_sockets >=3D 1);
> +        assert(ms->smp.sockets >=3D 1);
>=20
> -        for (i =3D 0; i < smbios_smp_sockets; i++) {
> +        for (i =3D 0; i < ms->smp.sockets; i++) {
>             smbios_build_type_4_table(ms, i);
>         }
>=20
> @@ -1160,7 +1156,7 @@ void smbios_get_tables(MachineState *ms,
>         smbios_build_type_41_table(errp);
>         smbios_build_type_127_table();
>=20
> -        smbios_validate_table(ms);
> +        smbios_validate_table(ms->smp.sockets);
>         smbios_entry_point_setup();
>         smbios_immutable =3D true;
>     }
> --=20
> 2.39.3
>=20

