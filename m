Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp302762eja;
        Thu, 29 Feb 2024 02:54:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4ldC9eBiKZU15TteQmaHBpPkV8FyvQmxLPKvX8PlqDdAt9W+0NOfKL8BgY+N5Vp93PSXM1C9J/ExJHa3yzwy5GICYqMrK
X-Google-Smtp-Source: AGHT+IFUYbI/G46Dl3x6n/S5DRhKA+hmgn28z9aGXIpmYkQNMCmCoC+Am1ZNsziZlNwOrwIaD5De
X-Received: by 2002:a05:620a:a06:b0:787:d4fc:932e with SMTP id i6-20020a05620a0a0600b00787d4fc932emr1703763qka.34.1709204055711;
        Thu, 29 Feb 2024 02:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709204055; cv=none;
        d=google.com; s=arc-20160816;
        b=oHnmU5tMHQ+oXiHIj8IPcVuVyl7yjh+gS3hQnkFYw6S6UIXfZNgEZYBnc0kV20JgA2
         OSaURvtpKgYbEmnV0Jwuf6Il6cSGNgbmz0q+MIvUA8341dEz5f5s9o7kP3eLAuPCEG8d
         fASPbyEw/tIzL9XDyDs/PJm/+ZHPh7rMUnya/4kQILcdruILbNgeGZV8TuvtWA0NJpZF
         TeTX+dkiiuNdtMWNAb7JCNZO9LfJALOYZSMeJMm0V8FpSetKvRe4iwbEAWxMdqgHcLML
         w4ndMyzno9lib5IiFyPnpLCKyTCG3rjaf5cI0/ZVk9afSz8nEHaX0HTCTQeMTgfo41LS
         aBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=tgMIq/M5mFlfMpvX5wTxywxxRMmmvaYAYKVWg20StjQ=;
        fh=j1TXyZAfvd5vP9Ap1biIsVS0p2d98qbkVYk02+m98oA=;
        b=QkCLJvv+DLTUNB6OjGxbTVNEjBWvXcaSBeWQ2OuJQMFTH7+ddfe8tr0ckGQqg7bBaL
         AbQ/w2jU8j+O5tZP9zVq6Xu8RqTpgBR6vQMz4OQMCSsl3pB7iAJcsQ4w161bin3HyEUm
         5bCwah0nxbB3ABNRBFbv7QJ4Vth1KAKyUKcw99yJVBeBBh8Phd97gHNVgrYq+f2u5V6N
         DrxuRHyYEUtywdRqUHQudpRiYE3reUDigqAeFhLiK3tB8wwUKWBaXaYNkTuBYl0cg4VU
         8Zfk2BLZ7W73Q5RhY5NifKwDjcGaChr7v1jHDAprbRcQLj7jSGds/4t3jJkrIW/MOHoN
         tvOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WdjLDo/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14-20020a05620a030e00b00787245038bbsi1068935qkm.233.2024.02.29.02.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 02:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WdjLDo/x";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfe2x-0000FA-Be; Thu, 29 Feb 2024 05:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfe2w-0000El-4A
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 05:53:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rfe2p-0005PQ-VS
 for qemu-arm@nongnu.org; Thu, 29 Feb 2024 05:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709204022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgMIq/M5mFlfMpvX5wTxywxxRMmmvaYAYKVWg20StjQ=;
 b=WdjLDo/xDm9gs/HLzLxSsbutUkBV0hH5yDyizv94rhbXIybw0+iZ4hTEE+ufWjtg2RyglG
 iqlDdTeCWfaNHSQ8G6yC/0wna3aB+XHD8B8qSZps4zSHULH8bTrL9C25NEfyVWTamvvKLj
 lB8Dz2DzME3G+5mIEdAc/XswAghLmXs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-5dQDocseNgW5T67lWBD_HA-1; Thu, 29 Feb 2024 05:53:40 -0500
X-MC-Unique: 5dQDocseNgW5T67lWBD_HA-1
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-36527824ab9so7754755ab.1
 for <qemu-arm@nongnu.org>; Thu, 29 Feb 2024 02:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709204019; x=1709808819;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T04YZ+WjGIGT+oF86UZYJmgPRyPQqMGsqGuR8vP+UKY=;
 b=iP8TxF8Cyr3RCDHD3zKe78JZHNvQq3qLR7T73kgMtn3/J1T1tzZcdx22dYZNlr7aPx
 nzSCtdEBixyws6TMI7VEwfvEavq8xuFs6KOXfRKqFxo+UkoN9F8lFxmPJBtx6RKAgkhG
 j+/GXAPCl5S6Mr3G3gKHTMIxgOnOAPxT3oxNXlV76gs9BP2vNTgqB086gh0FwWiqjKwB
 jKEZWBpgnnXT8leW2o4whKr7C8VbpOjWWi4TrxUc0hlX0tGPBY/UxQkKg8ABgXtuAEpD
 qI6gfYiE1CLUbTEDWfyQrNQ3XRyTYcnbuXbNMAabvENF3fAvei110qTZi49BBW1iwII+
 kcDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVluDkDW83VGT8uaKXVoAUbP1FE36LJP0URbwvRnSlAMsMlKkLzu1dWn4SwREs4o74aTFmJW/ABsZ+IshvSTBlz9gkQ
X-Gm-Message-State: AOJu0Yxtf2WWlyMSF6W+MaujfwOWV+tiVM6WTRvGgtREWdZz+GKPIXuZ
 KyXioDLC0ZI4Y6noigplVA7k+V4lJecnQrKGVHsUg5KYG/EdjA2mLEgJdVO8tY3c0XefSkt5dzf
 BzKPwgyJWZuMFklyicHsFPSfRTuc6vh9GgVtG9QErRjRqZc92fw==
X-Received: by 2002:a92:c9c1:0:b0:365:e03:df3b with SMTP id
 k1-20020a92c9c1000000b003650e03df3bmr2025450ilq.19.1709204019554; 
 Thu, 29 Feb 2024 02:53:39 -0800 (PST)
X-Received: by 2002:a92:c9c1:0:b0:365:e03:df3b with SMTP id
 k1-20020a92c9c1000000b003650e03df3bmr2025430ilq.19.1709204019229; 
 Thu, 29 Feb 2024 02:53:39 -0800 (PST)
Received: from smtpclient.apple ([115.96.135.6])
 by smtp.gmail.com with ESMTPSA id
 lp3-20020a056a003d4300b006e553f2b880sm974810pfb.211.2024.02.29.02.53.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Feb 2024 02:53:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 06/19] smbios: get rid of smbios_legacy global
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-7-imammedo@redhat.com>
Date: Thu, 29 Feb 2024 16:23:21 +0530
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
Message-Id: <0129FA3E-A566-481A-85A6-439E72C5594B@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-7-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.102,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5wEtWWP0zjUL



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> clean up smbios_set_defaults() which is reused by legacy
> and non legacy machines from being aware of 'legacy' notion
> and need to turn it off. And push legacy handling up to
> PC machine code where it's relevant.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> PS: I've moved/kept legacy smbios_entries to smbios_get_tables()
> but it at least is not visible to API users. To get rid of it
> as well, it would be necessary to change how '-smbios' CLI
> option is processed. Which is done later in the series.
> ---
> include/hw/firmware/smbios.h |  2 +-
> hw/arm/virt.c                |  2 +-
> hw/i386/fw_cfg.c             |  7 ++++---
> hw/loongarch/virt.c          |  2 +-
> hw/riscv/virt.c              |  2 +-
> hw/smbios/smbios.c           | 35 +++++++++++++++--------------------
> 6 files changed, 23 insertions(+), 27 deletions(-)
>=20
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index a187fbbd3d..0818184834 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -293,7 +293,7 @@ struct smbios_type_127 {
> void smbios_entry_add(QemuOpts *opts, Error **errp);
> void smbios_set_cpuid(uint32_t version, uint32_t features);
> void smbios_set_defaults(const char *manufacturer, const char *product,
> -                         const char *version, bool legacy_mode,
> +                         const char *version,
>                          bool uuid_encoded, SmbiosEntryPointType ep_type)=
;
> void smbios_set_default_processor_family(uint16_t processor_family);
> uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *leng=
th);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0af1943697..8588681f27 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1633,7 +1633,7 @@ static void virt_build_smbios(VirtMachineState *vms=
)
>     }
>=20
>     smbios_set_defaults("QEMU", product,
> -                        vmc->smbios_old_sys_ver ? "1.0" : mc->name, fals=
e,
> +                        vmc->smbios_old_sys_ver ? "1.0" : mc->name,
>                         true, SMBIOS_ENTRY_POINT_TYPE_64);
>=20
>     /* build the array of physical mem area from base_memmap */
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index fcb4fb0769..c1e9c0fd9c 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -63,15 +63,16 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgS=
tate *fw_cfg)
>     if (pcmc->smbios_defaults) {
>         /* These values are guest ABI, do not change */
>         smbios_set_defaults("QEMU", mc->desc, mc->name,
> -                            pcmc->smbios_legacy_mode, pcmc->smbios_uuid_=
encoded,
> +                            pcmc->smbios_uuid_encoded,
>                             pcms->smbios_entry_point_type);
>     }
>=20
>     /* tell smbios about cpuid version and features */
>     smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_EDX=
]);
>=20
> -    smbios_tables =3D smbios_get_table_legacy(ms->smp.cpus, &smbios_tabl=
es_len);
> -    if (smbios_tables) {
> +    if (pcmc->smbios_legacy_mode) {
> +        smbios_tables =3D smbios_get_table_legacy(ms->smp.cpus,
> +                                                &smbios_tables_len);
>         fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
>                          smbios_tables, smbios_tables_len);
>         return;
> diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
> index 0ad7d8c887..73fb3522ba 100644
> --- a/hw/loongarch/virt.c
> +++ b/hw/loongarch/virt.c
> @@ -320,7 +320,7 @@ static void virt_build_smbios(LoongArchMachineState *=
lams)
>         return;
>     }
>=20
> -    smbios_set_defaults("QEMU", product, mc->name, false,
> +    smbios_set_defaults("QEMU", product, mc->name,
>                         true, SMBIOS_ENTRY_POINT_TYPE_64);
>=20
>     smbios_get_tables(ms, NULL, 0, &smbios_tables, &smbios_tables_len,
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index fd35c74781..e2c9529df2 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1235,7 +1235,7 @@ static void virt_build_smbios(RISCVVirtState *s)
>         product =3D "KVM Virtual Machine";
>     }
>=20
> -    smbios_set_defaults("QEMU", product, mc->name, false,
> +    smbios_set_defaults("QEMU", product, mc->name,
>                         true, SMBIOS_ENTRY_POINT_TYPE_64);
>=20
>     if (riscv_is_32bit(&s->soc[0])) {
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 15339d8dbe..c46fc93357 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -54,7 +54,6 @@ struct smbios_table {
>=20
> static uint8_t *smbios_entries;
> static size_t smbios_entries_len;
> -static bool smbios_legacy =3D true;
> static bool smbios_uuid_encoded =3D true;
> /* end: legacy structures & constants for <=3D 2.0 machines */
>=20
> @@ -570,9 +569,16 @@ static void smbios_build_type_1_fields(void)
>=20
> uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *leng=
th)
> {
> -    if (!smbios_legacy) {
> -        *length =3D 0;
> -        return NULL;
> +    /* drop unwanted version of command-line file blob(s) */
> +    g_free(smbios_tables);
> +    smbios_tables =3D NULL;
> +
> +    /* also complain if fields were given for types > 1 */
> +    if (find_next_bit(have_fields_bitmap,
> +                      SMBIOS_MAX_TYPE + 1, 2) < SMBIOS_MAX_TYPE + 1) {
> +        error_report("can't process fields for smbios "
> +                     "types > 1 on machine versions < 2.1!");
> +        exit(1);
>     }
>=20
>     if (!smbios_immutable) {
> @@ -1006,28 +1012,13 @@ void smbios_set_default_processor_family(uint16_t=
 processor_family)
> }
>=20
> void smbios_set_defaults(const char *manufacturer, const char *product,
> -                         const char *version, bool legacy_mode,
> +                         const char *version,
>                          bool uuid_encoded, SmbiosEntryPointType ep_type)
> {
>     smbios_have_defaults =3D true;
> -    smbios_legacy =3D legacy_mode;
>     smbios_uuid_encoded =3D uuid_encoded;
>     smbios_ep_type =3D ep_type;
>=20
> -    /* drop unwanted version of command-line file blob(s) */
> -    if (smbios_legacy) {
> -        g_free(smbios_tables);
> -        /* in legacy mode, also complain if fields were given for types =
> 1 */
> -        if (find_next_bit(have_fields_bitmap,
> -                          SMBIOS_MAX_TYPE+1, 2) < SMBIOS_MAX_TYPE+1) {
> -            error_report("can't process fields for smbios "
> -                         "types > 1 on machine versions < 2.1!");
> -            exit(1);
> -        }
> -    } else {
> -        g_free(smbios_entries);
> -    }
> -
>     SMBIOS_SET_DEFAULT(type1.manufacturer, manufacturer);
>     SMBIOS_SET_DEFAULT(type1.product, product);
>     SMBIOS_SET_DEFAULT(type1.version, version);
> @@ -1103,6 +1094,10 @@ void smbios_get_tables(MachineState *ms,
> {
>     unsigned i, dimm_cnt, offset;
>=20
> +    /* drop unwanted (legacy) version of command-line file blob(s) */
> +    g_free(smbios_entries);
> +    smbios_entries =3D NULL;
> +

Can you please explain why you do this unconditionally without checking for=
 legacy mode? Seems wrong?

>     if (!smbios_immutable) {
>         smbios_build_type_0_table();
>         smbios_build_type_1_table();
> --=20
> 2.39.3
>=20

