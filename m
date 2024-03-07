Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp915221ejb;
        Wed, 6 Mar 2024 20:04:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXuCib8TEyuaSva5e7exVqWfPSLwNY987Ig+zAwW3vba58BcJUEiDvVJbtxoFhwOnI03I0J/yKfduXjeETSCY+IIt7BPqH
X-Google-Smtp-Source: AGHT+IHok0IF8IbNJLTJSzit7GnUFwwoaO8yYAgx/mFKl0bvK0/AIvSQWib/oEbFynCWAb0ZaXTt
X-Received: by 2002:a05:6214:5587:b0:690:9c09:f734 with SMTP id mi7-20020a056214558700b006909c09f734mr2185717qvb.4.1709784252587;
        Wed, 06 Mar 2024 20:04:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709784252; cv=none;
        d=google.com; s=arc-20160816;
        b=rur28WQ25ePdPGaMEXK0xKdRndoK1Ty0PfgmzCAkBNOOnE+Tt9ZU7X76tiATntzN2A
         Ovmft3C+RqJhfoh/jTW9wQ3sDlSxlliWiSlUxzCH625fknZiWkiaGxs4obu0WsUJBD6r
         FuvSkoh5SODh1SvWTFCE4Kxgrd2jZW7DX4oHJ6N0BOk2GOZgYYUkLrRdPP3aNGx0k/3Z
         6BAqer9SwQXV93BUHW7Hm6Pacv+oclAFOC9bqmuFIfxbO/+p219HIwLv1XDPYEX5PTiy
         HoDnI8NfvJPRYM3fBqL3slnOBFTZC6IbeYRYa6NWpUJOkXoCKbi5Xs0aHN4zBSJMD5NZ
         lPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=nK6XErzBpkocsIWFutDGoKKWWUODsOaNUxM+g+K5/ao=;
        fh=Qs2cFxG27I/9/y+GFijU+Syv8JiCwCPeQ8hIJNNBXxk=;
        b=DsmU/yTJQYkPxhukBeHs4LUQfzA/jEaBl52h6C9mvTzI/Cd27jBfGCjxt/2LJ0cyXb
         t4deh8MgwXfVdkOzWscqbRbtkYra6w0Eml7j+2lh2fqJR6EkEzz6qbBFM1oopdIAZoMV
         ENyn90+Mq6Guz9j7Gsa+VFcAR5qDKMVrH579ztfbWO+DmaOydJ04P+S1Y1+51saOpBhx
         YjIsMG1gyL3ekzNhgqk4f5/3KidSKSydOaCTiE6Z+lfLP7zOoVmfPsNMoQHYzWdnv4rq
         KBIqfTsQg0DPESHkE/jaIWLuMI8eimGBz9GSLXWTGTwMBG3szvtHphZbZWd4R7tjczYO
         Jg2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZNeDcg4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020a056214224100b0068fa2e70f54si16132902qvc.11.2024.03.06.20.04.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 20:04:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZNeDcg4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ri4yu-00057S-Ec; Wed, 06 Mar 2024 23:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1ri4yt-00054E-6z
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 23:03:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1ri4yq-00018H-U4
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 23:03:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709784218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nK6XErzBpkocsIWFutDGoKKWWUODsOaNUxM+g+K5/ao=;
 b=ZNeDcg4baP5U5LNBRwqcTzxJ3J80Id7Sj2JjKKjNlVHereChX6AKzBCWMrJ9XoRdpdx19S
 4N69H6eENXtBqPq+mVMvVFOKo9zJlO8Ra4bIB5XKyvVGP1bNoSqkJc+g/W0vPv7ddpAqef
 2jqcXC3fgN8N7NDD+Siih1alpuj3Umk=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-TUYJ0H1iNWCx5RWBwSb9NQ-1; Wed, 06 Mar 2024 23:03:36 -0500
X-MC-Unique: TUYJ0H1iNWCx5RWBwSb9NQ-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3bbc40771a9so446881b6e.0
 for <qemu-arm@nongnu.org>; Wed, 06 Mar 2024 20:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709784216; x=1710389016;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wenKE+MVTcK8m6UPJnyls0Ib8nxNGHTk5ssV3xWvL58=;
 b=s7yQINA5jDlC8+Se7TsdQVTUdzRf7Ldy0W75Kiw6JUr+1tMuiUwRUS+wTa7Ngz5Xhv
 V/eCzIQIPysvtxHa8gKrgIzJY29ptsLMvVI+cddW0TMu2bzuFFoKR75UoAxctG7Z1lSi
 G6IT88i5bfkyluHIMgIqJ2ELKQxU53IeiiAkxb+0l98sBo0Qw5d97rbXbGVlZbWQ+YB3
 KqbQFTXa6BBKtPtu7Q5+/cvZ2H/1BNrqS6ZcxgfGyBho9BywZyDj7vSD9u6G7fcUJzyf
 BH8nQTzTa83ovjsRii2U+nDA426TZxs3l8D5u9S4ehk15J2j0/tc/lkz900Yimr0rmq3
 iMQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8aU3ujGtBpp2Ju3D/KWHvcPoD/PWpa1EhEWKj8ZfU8IlH8JYBdvW4r3trm7lXjzlfmnbPB1XVYJW493awR243r0Uj
X-Gm-Message-State: AOJu0YxIj45pt7NrY9QV8cXv/wj1atcH0XZLpo0/JQCqf6vwJISu9L5k
 7EXEhRm3qmen5G9nATeEtr34jFHq76emubR4l56gpAsnE6oJKCvPHnqqQJ2YZETE4i6g0/4Unzc
 EB6aH1ZU8VavLEnpReeni1BT0CmVw9OXUWlWpONuey2GCxTSEKw==
X-Received: by 2002:a05:6808:6297:b0:3c2:154f:7716 with SMTP id
 du23-20020a056808629700b003c2154f7716mr5048231oib.43.1709784215619; 
 Wed, 06 Mar 2024 20:03:35 -0800 (PST)
X-Received: by 2002:a05:6808:6297:b0:3c2:154f:7716 with SMTP id
 du23-20020a056808629700b003c2154f7716mr5048210oib.43.1709784215194; 
 Wed, 06 Mar 2024 20:03:35 -0800 (PST)
Received: from smtpclient.apple ([116.73.135.231])
 by smtp.gmail.com with ESMTPSA id
 r31-20020a63fc5f000000b005dc3fc53f19sm11566107pgk.7.2024.03.06.20.03.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Mar 2024 20:03:34 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v2 07/20] smbios: avoid mangling user provided tables
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <0eeed9a2-cd7b-bdde-6346-3357dc430835@redhat.com>
Date: Thu, 7 Mar 2024 09:33:17 +0530
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
Message-Id: <97A9187B-2BB6-4819-AB28-679C0DE04501@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-8-imammedo@redhat.com>
 <0eeed9a2-cd7b-bdde-6346-3357dc430835@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.365,
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
X-TUID: JDOBWNc6GyJD



> On 06-Mar-2024, at 12:11, Ani Sinha <anisinha@redhat.com> wrote:
>=20
>=20
>=20
> On Tue, 5 Mar 2024, Igor Mammedov wrote:
>=20
>> currently smbios_entry_add() preserves internally '-smbios type=3D'
>> options but tables provided with '-smbios file=3D' are stored directly
>> into blob that eventually will be exposed to VM. And then later
>> QEMU adds default/'-smbios type' entries on top into the same blob.
>>=20
>> It makes impossible to generate tables more than once, hence
>> 'immutable' guard was used.
>> Make it possible to regenerate final blob by storing user provided
>> blobs into a dedicated area (usr_blobs) and then copy it when
>> composing final blob. Which also makes handling of -smbios
>> options consistent.
>>=20
>> As side effect of this and previous commits there is no need to
>> generate legacy smbios_entries at the time options are parsed.
>> Instead compose smbios_entries on demand from  usr_blobs like
>> it is done for non-legacy SMBIOS tables.
>>=20
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> Tested-by: Fiona Ebner <f.ebner@proxmox.com>
>=20
> Reviewed-by: Ani Sinha <anisinha@redhat.com>
>=20
>> ---
>> hw/smbios/smbios.c | 179 +++++++++++++++++++++++----------------------
>> 1 file changed, 92 insertions(+), 87 deletions(-)
>>=20
>> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
>> index c46fc93357..aa2cc5bdbd 100644
>> --- a/hw/smbios/smbios.c
>> +++ b/hw/smbios/smbios.c
>> @@ -57,6 +57,14 @@ static size_t smbios_entries_len;
>> static bool smbios_uuid_encoded =3D true;
>> /* end: legacy structures & constants for <=3D 2.0 machines */
>>=20
>> +/*
>> + * SMBIOS tables provided by user with '-smbios file=3D<foo>' option
>> + */
>> +uint8_t *usr_blobs;
>> +size_t usr_blobs_len;
>> +static GArray *usr_blobs_sizes;
>> +static unsigned usr_table_max;
>> +static unsigned usr_table_cnt;
>>=20
>> uint8_t *smbios_tables;
>> size_t smbios_tables_len;
>> @@ -67,7 +75,6 @@ static SmbiosEntryPointType smbios_ep_type =3D SMBIOS_=
ENTRY_POINT_TYPE_32;
>> static SmbiosEntryPoint ep;
>>=20
>> static int smbios_type4_count =3D 0;
>> -static bool smbios_immutable;
>> static bool smbios_have_defaults;
>> static uint32_t smbios_cpuid_version, smbios_cpuid_features;
>>=20
>> @@ -569,9 +576,8 @@ static void smbios_build_type_1_fields(void)
>>=20
>> uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *len=
gth)
>> {
>> -    /* drop unwanted version of command-line file blob(s) */
>> -    g_free(smbios_tables);
>> -    smbios_tables =3D NULL;
>> +    int i;
>> +    size_t usr_offset;
>>=20
>>     /* also complain if fields were given for types > 1 */
>>     if (find_next_bit(have_fields_bitmap,
>> @@ -581,12 +587,33 @@ uint8_t *smbios_get_table_legacy(uint32_t expected=
_t4_count, size_t *length)
>>         exit(1);
>>     }
>>=20
>> -    if (!smbios_immutable) {
>> -        smbios_build_type_0_fields();
>> -        smbios_build_type_1_fields();
>> -        smbios_validate_table(expected_t4_count);
>> -        smbios_immutable =3D true;
>> +    g_free(smbios_entries);
>> +    smbios_entries_len =3D sizeof(uint16_t);
>> +    smbios_entries =3D g_malloc0(smbios_entries_len);
>> +
>> +    for (i =3D 0, usr_offset =3D 0; usr_blobs_sizes && i < usr_blobs_si=
zes->len;
>> +         i++)
>> +    {
>> +        struct smbios_table *table;
>> +        struct smbios_structure_header *header;
>> +        size_t size =3D g_array_index(usr_blobs_sizes, size_t, i);
>> +
>> +        header =3D (struct smbios_structure_header *)(usr_blobs + usr_o=
ffset);
>> +        smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len=
 +
>> +                                                   size + sizeof(*table=
));
>> +        table =3D (struct smbios_table *)(smbios_entries + smbios_entri=
es_len);
>> +        table->header.type =3D SMBIOS_TABLE_ENTRY;
>> +        table->header.length =3D cpu_to_le16(sizeof(*table) + size);
>> +        memcpy(table->data, header, size);
>> +        smbios_entries_len +=3D sizeof(*table) + size;
>> +        (*(uint16_t *)smbios_entries) =3D
>> +            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
>=20
> I know this comes from existing code but can you please explain why we ad=
d
> 1 to it? This is confusing and a comment here would be nice.
>=20
>> +        usr_offset +=3D size;
>=20
> It would be better if we could add a comment here describing a bit what
> this is all about.
>=20
> user blobs are an array of smbios_structure_header entries whereas legacy
> tables are an array of smbios_table structures where
> smbios_table->data represents the a single user provided table blob in
> smbios_structure_header.

Igor, are you going to send a v3 for this with the comments added?

>=20
>>     }
>> +
>> +    smbios_build_type_0_fields();
>> +    smbios_build_type_1_fields();
>> +    smbios_validate_table(expected_t4_count);
>>     *length =3D smbios_entries_len;
>>     return smbios_entries;
>> }
>> @@ -1094,67 +1121,67 @@ void smbios_get_tables(MachineState *ms,
>> {
>>     unsigned i, dimm_cnt, offset;
>>=20
>> -    /* drop unwanted (legacy) version of command-line file blob(s) */
>> -    g_free(smbios_entries);
>> -    smbios_entries =3D NULL;
>> +    g_free(smbios_tables);
>> +    smbios_tables =3D g_memdup2(usr_blobs, usr_blobs_len);
>=20
> Again a comment describing here would be nice as to why memdup is ok.
>=20
>> +    smbios_tables_len =3D usr_blobs_len;
>> +    smbios_table_max =3D usr_table_max;
>> +    smbios_table_cnt =3D usr_table_cnt;
>>=20
>> -    if (!smbios_immutable) {
>> -        smbios_build_type_0_table();
>> -        smbios_build_type_1_table();
>> -        smbios_build_type_2_table();
>> -        smbios_build_type_3_table();
>> +    smbios_build_type_0_table();
>> +    smbios_build_type_1_table();
>> +    smbios_build_type_2_table();
>> +    smbios_build_type_3_table();
>>=20
>> -        assert(ms->smp.sockets >=3D 1);
>> +    assert(ms->smp.sockets >=3D 1);
>>=20
>> -        for (i =3D 0; i < ms->smp.sockets; i++) {
>> -            smbios_build_type_4_table(ms, i);
>> -        }
>> +    for (i =3D 0; i < ms->smp.sockets; i++) {
>> +        smbios_build_type_4_table(ms, i);
>> +    }
>>=20
>> -        smbios_build_type_8_table();
>> -        smbios_build_type_11_table();
>> +    smbios_build_type_8_table();
>> +    smbios_build_type_11_table();
>>=20
>> #define MAX_DIMM_SZ (16 * GiB)
>> #define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
>>                                         : ((current_machine->ram_size - =
1) % MAX_DIMM_SZ) + 1)
>>=20
>> -        dimm_cnt =3D QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_=
SZ) / MAX_DIMM_SZ;
>> +    dimm_cnt =3D QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) =
/
>> +               MAX_DIMM_SZ;
>>=20
>> -        /*
>> -         * The offset determines if we need to keep additional space be=
tween
>> -         * table 17 and table 19 header handle numbers so that they do
>> -         * not overlap. For example, for a VM with larger than 8 TB gue=
st
>> -         * memory and DIMM like chunks of 16 GiB, the default space bet=
ween
>> -         * the two tables (T19_BASE - T17_BASE =3D 512) is not enough.
>> -         */
>> -        offset =3D (dimm_cnt > (T19_BASE - T17_BASE)) ? \
>> -                 dimm_cnt - (T19_BASE - T17_BASE) : 0;
>> +    /*
>> +     * The offset determines if we need to keep additional space betwee=
n
>> +     * table 17 and table 19 header handle numbers so that they do
>> +     * not overlap. For example, for a VM with larger than 8 TB guest
>> +     * memory and DIMM like chunks of 16 GiB, the default space between
>> +     * the two tables (T19_BASE - T17_BASE =3D 512) is not enough.
>> +     */
>> +    offset =3D (dimm_cnt > (T19_BASE - T17_BASE)) ? \
>> +             dimm_cnt - (T19_BASE - T17_BASE) : 0;
>>=20
>> -        smbios_build_type_16_table(dimm_cnt);
>> +    smbios_build_type_16_table(dimm_cnt);
>>=20
>> -        for (i =3D 0; i < dimm_cnt; i++) {
>> -            smbios_build_type_17_table(i, GET_DIMM_SZ);
>> -        }
>> +    for (i =3D 0; i < dimm_cnt; i++) {
>> +        smbios_build_type_17_table(i, GET_DIMM_SZ);
>> +    }
>>=20
>> -        for (i =3D 0; i < mem_array_size; i++) {
>> -            smbios_build_type_19_table(i, offset, mem_array[i].address,
>> -                                       mem_array[i].length);
>> -        }
>> +    for (i =3D 0; i < mem_array_size; i++) {
>> +        smbios_build_type_19_table(i, offset, mem_array[i].address,
>> +                                   mem_array[i].length);
>> +    }
>>=20
>> -        /*
>> -         * make sure 16 bit handle numbers in the headers of tables 19
>> -         * and 32 do not overlap.
>> -         */
>> -        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
>> +    /*
>> +     * make sure 16 bit handle numbers in the headers of tables 19
>> +     * and 32 do not overlap.
>> +     */
>> +    assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
>>=20
>> -        smbios_build_type_32_table();
>> -        smbios_build_type_38_table();
>> -        smbios_build_type_41_table(errp);
>> -        smbios_build_type_127_table();
>> +    smbios_build_type_32_table();
>> +    smbios_build_type_38_table();
>> +    smbios_build_type_41_table(errp);
>> +    smbios_build_type_127_table();
>>=20
>> -        smbios_validate_table(ms->smp.sockets);
>> -        smbios_entry_point_setup();
>> -        smbios_immutable =3D true;
>> -    }
>> +    smbios_validate_table(ms->smp.sockets);
>> +    smbios_entry_point_setup();
>>=20
>>     /* return tables blob and entry point (anchor), and their sizes */
>>     *tables =3D smbios_tables;
>> @@ -1254,13 +1281,10 @@ void smbios_entry_add(QemuOpts *opts, Error **er=
rp)
>> {
>>     const char *val;
>>=20
>> -    assert(!smbios_immutable);
>> -
>>     val =3D qemu_opt_get(opts, "file");
>>     if (val) {
>>         struct smbios_structure_header *header;
>> -        int size;
>> -        struct smbios_table *table; /* legacy mode only */
>> +        size_t size;
>>=20
>>         if (!qemu_opts_validate(opts, qemu_smbios_file_opts, errp)) {
>>             return;
>> @@ -1277,9 +1301,9 @@ void smbios_entry_add(QemuOpts *opts, Error **errp=
)
>>          * (except in legacy mode, where the second '\0' is implicit and
>>          *  will be inserted by the BIOS).
>>          */
>> -        smbios_tables =3D g_realloc(smbios_tables, smbios_tables_len + =
size);
>> -        header =3D (struct smbios_structure_header *)(smbios_tables +
>> -                                                    smbios_tables_len);
>> +        usr_blobs =3D g_realloc(usr_blobs, usr_blobs_len + size);
>> +        header =3D (struct smbios_structure_header *)(usr_blobs +
>> +                                                    usr_blobs_len);
>>=20
>>         if (load_image_size(val, (uint8_t *)header, size) !=3D size) {
>>             error_setg(errp, "Failed to load SMBIOS file %s", val);
>> @@ -1300,34 +1324,15 @@ void smbios_entry_add(QemuOpts *opts, Error **er=
rp)
>>             smbios_type4_count++;
>>         }
>>=20
>> -        smbios_tables_len +=3D size;
>> -        if (size > smbios_table_max) {
>> -            smbios_table_max =3D size;
>> +        if (!usr_blobs_sizes) {
>> +            usr_blobs_sizes =3D g_array_new(false, false, sizeof(size_t=
));
>>         }
>> -        smbios_table_cnt++;
>> -
>> -        /* add a copy of the newly loaded blob to legacy smbios_entries=
 */
>> -        /* NOTE: This code runs before smbios_set_defaults(), so we don=
't
>> -         *       yet know which mode (legacy vs. aggregate-table) will =
be
>> -         *       required. We therefore add the binary blob to both leg=
acy
>> -         *       (smbios_entries) and aggregate (smbios_tables) tables,=
 and
>> -         *       delete the one we don't need from smbios_set_defaults(=
),
>> -         *       once we know which machine version has been requested.
>> -         */
>> -        if (!smbios_entries) {
>> -            smbios_entries_len =3D sizeof(uint16_t);
>> -            smbios_entries =3D g_malloc0(smbios_entries_len);
>> +        g_array_append_val(usr_blobs_sizes, size);
>> +        usr_blobs_len +=3D size;
>> +        if (size > usr_table_max) {
>> +            usr_table_max =3D size;
>>         }
>> -        smbios_entries =3D g_realloc(smbios_entries, smbios_entries_len=
 +
>> -                                                   size + sizeof(*table=
));
>> -        table =3D (struct smbios_table *)(smbios_entries + smbios_entri=
es_len);
>> -        table->header.type =3D SMBIOS_TABLE_ENTRY;
>> -        table->header.length =3D cpu_to_le16(sizeof(*table) + size);
>> -        memcpy(table->data, header, size);
>> -        smbios_entries_len +=3D sizeof(*table) + size;
>> -        (*(uint16_t *)smbios_entries) =3D
>> -                cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + =
1);
>> -        /* end: add a copy of the newly loaded blob to legacy smbios_en=
tries */
>> +        usr_table_cnt++;
>>=20
>>         return;
>>     }
>> --
>> 2.39.3


