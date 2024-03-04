Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2599161eja;
        Mon, 4 Mar 2024 05:53:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFZEij3a8AkcvdfCuq44m3DBSbe86oTMZewHw9ElevoZ3KQc12yvha1/6uc0hWDm2orhIUWN44e5zLCRpAXLkXS6xJlDg4
X-Google-Smtp-Source: AGHT+IHozypyBw2285gQhIJE2LOV/QyDIsbs9HIR1vstk8zkLm+wwqcooioQ2Cdc+puZz3dOkWDh
X-Received: by 2002:a05:6358:7e07:b0:17b:db48:9349 with SMTP id o7-20020a0563587e0700b0017bdb489349mr11079146rwm.2.1709560419583;
        Mon, 04 Mar 2024 05:53:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709560419; cv=none;
        d=google.com; s=arc-20160816;
        b=bxotYofJw9I2w44zTjgMnzNWa/DNns9px4kv/4vZsEzEBvBGN7ezyhH7He53lB9ueI
         7tiqIu+iU74o0Sctm0Yoji41hm3s+vaJDUyOxtBquZxmjDeAXgTwiKaXkQ60j5267UIv
         jkmVxRlOgJUBLVcsdzyqIpcoghZsf5PsOvrv94l5Ap+/+NkowfCyilUR4+jiuTqGBz+B
         0AGufWqH9BETu0KvghVXA8RMQurtnOShA815wTUoM7q2MZMx0nzspkEOnF7QB/loOMP+
         JuT1TpkJOvjuU9VjUuD4zP1tj7Fs/etdpjdVi/wz1+xN+Kf19/Rbc0aj7Z/eOSaW2iju
         HhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=bQnWXMNXMk6uodDKVMzjDqeuUEGjmGGnbC9h9WakF+0=;
        fh=pwkbfF/+LjfqXTpbXnLaQ4bKmsG1t40YLqVjYdT7PHc=;
        b=XFACQ3T4VG7cJ5Avhnc4FwmRHl6DygbGsXwdO+rPkfC2rvHfWOZGXzUN6rfgiGjUOz
         dBtRWptlQ6G1eJRRANiu18+qKbshHfo52BstX9hyCIV5NWIjGrBz7DF8yA9bGKvFiv9O
         3nwcMvCQ2YJ6N76apSB0yx7yXwJEpP3WdmbSBT3tcfjdse2MeYVliBZ6jO/Eb5MJdPmT
         oVziLWiiJ4Erlg5T2MQREkXGw0MtWgRKCWoCIZIZkL7Y4tCuwsvmCx1N9Yg+f0jwz0Ln
         OeLINwJwvSCFTvhRs8vY4qx3RXnABVd41sGjJrro6Xa0fqshuoMTaCM8EIRRI9Oeagox
         wABw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bilRxLbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke11-20020a056214300b00b0068fc83c08a3si9625507qvb.356.2024.03.04.05.53.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 05:53:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bilRxLbn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh8l4-0000tG-La; Mon, 04 Mar 2024 08:53:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh8l3-0000sD-Th
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 08:53:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh8l2-0002PZ-1N
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 08:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709560411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bQnWXMNXMk6uodDKVMzjDqeuUEGjmGGnbC9h9WakF+0=;
 b=bilRxLbnSx7xPvxks088g2JXa+3nB+4f0dzWBM5D8h5/7SbDoLfOSuWtqKcq7MEaBUGmV+
 AvaG3g10lZBUcxdL3SQw46XBq0lF2UUOs5AA2Ov47tVtMVHUHcdbDsweblo8Rd7lap1Dai
 hKkE0InBzKqkGIPAT6eBIaZ8X6HapTQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474--pfUIpcNMVSCpwBDsAqspw-1; Mon, 04 Mar 2024 08:53:30 -0500
X-MC-Unique: -pfUIpcNMVSCpwBDsAqspw-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1dc7278d020so37046445ad.0
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 05:53:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709560409; x=1710165209;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpE1arBJ/23Mk6o6KiFCZPrL6TLdBWqWZlXccfKzExw=;
 b=vKSDAyB4OlW4GCxAqzHQbgglxEx1HCirTmu0u1mBCmkQDjuWy8StWroJHnFNuphpU9
 Z0Oj2hCTDITU5AhcAwtcBsMbzMtb562mjZesFAjB+qbUYu5AKjomSZxapysRARx2y0oH
 tUUraRBnTQCgT9XC3CJQJyw3eCGjo2LCEeOKV/XqM4rcpi3trDo+ZUarKuJNl1LuXmAC
 SSNA0vjxE9DFGbQvcsTXtOHrb/IHxBleZDyM3WDPdliRWzFKwb63QCmnDSzR23XqyR1W
 bLfMQOFTIP+4o6QHNZo7PtSodE31wmc9F7/EhOkp1tQIX5povWkAYWRN4qkS0JrkWWVl
 NFRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Pl07FLwmBrW5GctV/Bxcqx4SxMwKiR49IVUPuESVjPjCjWXcnBt/KDD/COeYnXhgM1XENYuXMK/EtLwh/jueWksT
X-Gm-Message-State: AOJu0Yxtmylok21J7eK5/c5E4RLAMuiaFkWgCjOS5TZAJTTewBnANK5z
 WUYd1sAF652z1hkv+RiJOAzoeHtlgjt3O3nqkc3Fpr8g38j+0wP/zT5iMSKPC4TeG+4IJtti2C+
 38AaYBIuGldtMQvK3GpsFB0RA2UCg+4k6Zr8pud7yyO7xZKgGTg==
X-Received: by 2002:a17:902:c155:b0:1dc:6373:3cc with SMTP id
 21-20020a170902c15500b001dc637303ccmr7498617plj.50.1709560408847; 
 Mon, 04 Mar 2024 05:53:28 -0800 (PST)
X-Received: by 2002:a17:902:c155:b0:1dc:6373:3cc with SMTP id
 21-20020a170902c15500b001dc637303ccmr7498590plj.50.1709560408415; 
 Mon, 04 Mar 2024 05:53:28 -0800 (PST)
Received: from smtpclient.apple ([115.96.159.226])
 by smtp.gmail.com with ESMTPSA id
 mn14-20020a1709030a4e00b001dcada71593sm8544922plb.273.2024.03.04.05.53.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2024 05:53:27 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 10/19] smbios: handle errors consistently
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240304143902.3685050e@imammedo.users.ipa.redhat.com>
Date: Mon, 4 Mar 2024 19:23:10 +0530
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
Message-Id: <2C51E4B1-3B7B-443E-8A84-0C98E889161F@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-11-imammedo@redhat.com>
 <00c2eb0d-1667-5922-ac4b-8b11c099deef@redhat.com>
 <20240304143902.3685050e@imammedo.users.ipa.redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Hr029kXvK9CC



> On 04-Mar-2024, at 19:09, Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> On Mon, 4 Mar 2024 16:44:34 +0530 (IST)
> Ani Sinha <anisinha@redhat.com> wrote:
>=20
>> On Tue, 27 Feb 2024, Igor Mammedov wrote:
>>=20
>>> Current code uses mix of error_report()+exit(1)
>>> and error_setg() to handle errors.
>>> Use newer error_setg() everywhere, beside consistency
>>> it will allow to detect error condition without killing
>>> QEMU and attempt switch-over to SMBIOS3.x tables/entrypoint
>>> in follow up patch.
>>>=20
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com> =20
>>=20
>> Other than the nit below,
>>=20
>> Reviewed-by: Ani Sinha <anisinha@redhat.com>
>>=20
>>> ---
>>> include/hw/firmware/smbios.h |  4 ++--
>>> hw/i386/fw_cfg.c             |  3 ++-
>>> hw/smbios/smbios.c           | 32 ++++++++++++++++++++------------
>>> hw/smbios/smbios_legacy.c    | 22 ++++++++++++++--------
>>> 4 files changed, 38 insertions(+), 23 deletions(-)
>>>=20
>>> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.=
h
>>> index a6d8fd6591..d1194c9cc2 100644
>>> --- a/include/hw/firmware/smbios.h
>>> +++ b/include/hw/firmware/smbios.h
>>> @@ -310,7 +310,7 @@ struct smbios_type_127 {
>>>     struct smbios_structure_header header;
>>> } QEMU_PACKED;
>>>=20
>>> -void smbios_validate_table(void);
>>> +bool smbios_validate_table(Error **errp);
>>> void smbios_add_usr_blob_size(size_t size);
>>> void smbios_entry_add(QemuOpts *opts, Error **errp);
>>> void smbios_set_cpuid(uint32_t version, uint32_t features);
>>> @@ -318,7 +318,7 @@ void smbios_set_defaults(const char *manufacturer, =
const char *product,
>>>                          const char *version,
>>>                          bool uuid_encoded, SmbiosEntryPointType ep_typ=
e);
>>> void smbios_set_default_processor_family(uint16_t processor_family);
>>> -uint8_t *smbios_get_table_legacy(size_t *length);
>>> +uint8_t *smbios_get_table_legacy(size_t *length, Error **errp);
>>> void smbios_get_tables(MachineState *ms,
>>>                        const struct smbios_phys_mem_area *mem_array,
>>>                        const unsigned int mem_array_size,
>>> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
>>> index d1281066f4..e387bf50d0 100644
>>> --- a/hw/i386/fw_cfg.c
>>> +++ b/hw/i386/fw_cfg.c
>>> @@ -71,7 +71,8 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgS=
tate *fw_cfg)
>>>     smbios_set_cpuid(cpu->env.cpuid_version, cpu->env.features[FEAT_1_E=
DX]);
>>>=20
>>>     if (pcmc->smbios_legacy_mode) {
>>> -        smbios_tables =3D smbios_get_table_legacy(&smbios_tables_len);
>>> +        smbios_tables =3D smbios_get_table_legacy(&smbios_tables_len,
>>> +                                                &error_fatal);
>>>         fw_cfg_add_bytes(fw_cfg, FW_CFG_SMBIOS_ENTRIES,
>>>                          smbios_tables, smbios_tables_len);
>>>         return;
>>> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
>>> index fb1f05fcde..7c28b5f748 100644
>>> --- a/hw/smbios/smbios.c
>>> +++ b/hw/smbios/smbios.c
>>> @@ -19,7 +19,6 @@
>>> #include "qemu/units.h"
>>> #include "qapi/error.h"
>>> #include "qemu/config-file.h"
>>> -#include "qemu/error-report.h"
>>> #include "qemu/module.h"
>>> #include "qemu/option.h"
>>> #include "sysemu/sysemu.h"
>>> @@ -448,23 +447,25 @@ opts_init(smbios_register_config);
>>>  */
>>> #define SMBIOS_21_MAX_TABLES_LEN 0xffff
>>>=20
>>> -static void smbios_check_type4_count(uint32_t expected_t4_count)
>>> +static bool smbios_check_type4_count(uint32_t expected_t4_count, Error=
 **errp)
>>> {
>>>     if (smbios_type4_count && smbios_type4_count !=3D expected_t4_count=
) {
>>> -        error_report("Expected %d SMBIOS Type 4 tables, got %d instead=
",
>>> -                     expected_t4_count, smbios_type4_count);
>>> -        exit(1);
>>> +        error_setg(errp, "Expected %d SMBIOS Type 4 tables, got %d ins=
tead",
>>> +                   expected_t4_count, smbios_type4_count);
>>> +        return false;
>>>     }
>>> +    return true;
>>> }
>>>=20
>>> -void smbios_validate_table(void)
>>> +bool smbios_validate_table(Error **errp)
>>> {
>>>     if (smbios_ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_32 &&
>>>         smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
>>> -        error_report("SMBIOS 2.1 table length %zu exceeds %d",
>>> -                     smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
>>> -        exit(1);
>>> +        error_setg(errp, "SMBIOS 2.1 table length %zu exceeds %d",
>>> +                   smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
>>> +        return false;
>>>     }
>>> +    return true;
>>> }
>>>=20
>>> bool smbios_skip_table(uint8_t type, bool required_table)
>>> @@ -1027,15 +1028,18 @@ void smbios_get_tables(MachineState *ms,
>>>     smbios_build_type_41_table(errp);
>>>     smbios_build_type_127_table();
>>>=20
>>> -    smbios_check_type4_count(ms->smp.sockets);
>>> -    smbios_validate_table();
>>> +    if (!smbios_check_type4_count(ms->smp.sockets, errp)) { =20
>>=20
>> nit: I would do a gfree(smbios_tables) here ..
>>=20
>>> +        goto err_exit;
>>> +    }
>>> +    if (!smbios_validate_table(errp)) {
>>> +        goto err_exit; =20
>>=20
>> and here. Then in err_exit ...
>>=20
>=20
> the whole point of err_exit is to do error patch clean up
> in one place to avoid duplicate the work.
>=20
>>> +    }
>>>     smbios_entry_point_setup();
>>>=20
>>>     /* return tables blob and entry point (anchor), and their sizes */
>>>     *tables =3D smbios_tables;
>>>     *tables_len =3D smbios_tables_len;
>>>     *anchor =3D (uint8_t *)&ep;
>>> -
>>>     /* calculate length based on anchor string */
>>>     if (!strncmp((char *)&ep, "_SM_", 4)) {
>>>         *anchor_len =3D sizeof(struct smbios_21_entry_point);
>>> @@ -1044,6 +1048,10 @@ void smbios_get_tables(MachineState *ms,
>>>     } else {
>>>         abort();
>>>     }
>>> +
>>> +    return;
>>> +err_exit: =20
>>=20
>> I would add a return here.
>>=20
>> That way all paths explicitly return void.
>>=20
>>> +    g_free(smbios_tables); =20
>>=20
>> No return here?
>=20
> technically there is no need for at the end,
> but I can fix it up for clarity.

I think you do that in patch 11. I suggest you can squash this one with pat=
ch 11 and I am happy then.

>=20
>>=20
>>=20
>>> }
>>>=20
>>> static void save_opt(const char **dest, QemuOpts *opts, const char *nam=
e)
>>> diff --git a/hw/smbios/smbios_legacy.c b/hw/smbios/smbios_legacy.c
>>> index 21f143e738..a6544bf55a 100644
>>> --- a/hw/smbios/smbios_legacy.c
>>> +++ b/hw/smbios/smbios_legacy.c
>>> @@ -19,7 +19,7 @@
>>> #include "qemu/bswap.h"
>>> #include "hw/firmware/smbios.h"
>>> #include "sysemu/sysemu.h"
>>> -#include "qemu/error-report.h"
>>> +#include "qapi/error.h"
>>>=20
>>> struct smbios_header {
>>>     uint16_t length;
>>> @@ -128,7 +128,7 @@ static void smbios_build_type_1_fields(void)
>>>     }
>>> }
>>>=20
>>> -uint8_t *smbios_get_table_legacy(size_t *length)
>>> +uint8_t *smbios_get_table_legacy(size_t *length, Error **errp)
>>> {
>>>     int i;
>>>     size_t usr_offset;
>>> @@ -136,15 +136,15 @@ uint8_t *smbios_get_table_legacy(size_t *length)
>>>     /* complain if fields were given for types > 1 */
>>>     if (find_next_bit(smbios_have_fields_bitmap,
>>>                       SMBIOS_MAX_TYPE + 1, 2) < SMBIOS_MAX_TYPE + 1) {
>>> -        error_report("can't process fields for smbios "
>>> +        error_setg(errp, "can't process fields for smbios "
>>>                      "types > 1 on machine versions < 2.1!");
>>> -        exit(1);
>>> +        goto err_exit;
>>>     }
>>>=20
>>>     if (test_bit(4, smbios_have_binfile_bitmap)) {
>>> -        error_report("can't process table for smbios "
>>> -                     "type 4 on machine versions < 2.1!");
>>> -        exit(1);
>>> +        error_setg(errp, "can't process table for smbios "
>>> +                   "type 4 on machine versions < 2.1!");
>>> +        goto err_exit;
>>>     }
>>>=20
>>>     g_free(smbios_entries);
>>> @@ -173,7 +173,13 @@ uint8_t *smbios_get_table_legacy(size_t *length)
>>>=20
>>>     smbios_build_type_0_fields();
>>>     smbios_build_type_1_fields();
>>> -    smbios_validate_table();
>>> +    if (!smbios_validate_table(errp)) {
>>> +        goto err_exit;
>>> +    }
>>> +
>>>     *length =3D smbios_entries_len;
>>>     return smbios_entries;
>>> +err_exit:
>>> +    g_free(smbios_entries);
>>> +    return NULL;
>>> }
>>> --
>>> 2.39.3


