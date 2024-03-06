Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp324750ejb;
        Tue, 5 Mar 2024 22:41:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVd8qxjV2+P9BhT4LM8iAbMzBl7JXlgTBij58xNmADrs+aRap5DrpQAjmrl2FAny7XQQKh7HJ4Qmch++XSZDJDEuFR0Zdn
X-Google-Smtp-Source: AGHT+IHDNpLMLFdZ0t9S4yp6WR9/wnXTMMt50Gxq+5NNR01OX/F9Vro2K3AJCLpi54AWjZ4fW/KK
X-Received: by 2002:a05:622a:1a83:b0:42e:c432:b23d with SMTP id s3-20020a05622a1a8300b0042ec432b23dmr5372744qtc.53.1709707317300;
        Tue, 05 Mar 2024 22:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709707317; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHYTk+szz+s9s7w5knvkml9FDvb6K6J9NBJwrTsryGduXmJXakbXzx+r+1oVesFDto
         0xoPK32oajZgId8OewfBW1J/pXCw93DKTh4CnCxEev9qTe/o8Tikku4WGm8YJqxqvw9B
         u6QhIWWbFcZktUA2cGV+T7ac/VWE8F0ph3JWvuKFpK42Qcf5vO4iq1dpRIKP13unuDZB
         /kc2MsDqPP0kwjx/mboYlZ3rF/9Tj9S7m1rEGhGrs7Q5Q1fvY8AunYU0cMyDhzlfMFVQ
         s92qINBZPNDCf5DFFZNVjXvE7lpUGM2okmtrhprFkqGw41Tki1HUIZfdydGSOcCvOEbb
         eirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date:dkim-signature;
        bh=5x3iQ+o9MdNG+rw2Auq87crWL0YefwVSeYPIgkDiOu4=;
        fh=voqmxwUpoTrR8nQJmpfPLiQAXsSdXcR0dJQRxQ8LTS8=;
        b=CUaVQahN/g8Y2G70deQEKMKwX3WM3a6+NyiiLzYGofz32x64L/SyMyhN/e5q/2xjK9
         zAZMFREfE7OeSnCz9EetM1C4yzDi3nS/1T1rPlHHfe2flCLdwYx4s0CV6ODFEMEke4XG
         FOQt6bmPteKUr07mP0pH4G2DMmhnmkG/D21ExS09czuUs+70IMPobVQeVtVco1z6sobv
         uYb/alPf5VPxRFptZmgJ1lUM0uIP2yFBbwRHpuMN/4EAFGxWNk1uBswAxiXWlvN5s4G0
         HNuU1B0UCvOMZZpjMKYtyhsVh8W/Xx8mr4hfaL6K/o3km/7gZEUv1vDE5wxLx/l1aZ4T
         ERbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A1WGocke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020ac85813000000b0042ebd27e4d7si13996649qtg.103.2024.03.05.22.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 22:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A1WGocke;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhkyD-0003X0-2q; Wed, 06 Mar 2024 01:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhky7-0003W5-IB
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 01:41:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rhky4-0000SF-HF
 for qemu-arm@nongnu.org; Wed, 06 Mar 2024 01:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709707291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5x3iQ+o9MdNG+rw2Auq87crWL0YefwVSeYPIgkDiOu4=;
 b=A1WGockeH6LqHLWh+3iMMs82LZJ5PyuI6lLOC58yFzNIAorlWAj/9nC97PavxjK6mQPPFs
 8Bn4+F8lMnHPQDw6+SzhbimLFw4B9rg2Li1fjlwhlk4u4eAtDMG4ah6kEl36VP/9sd4uUZ
 kk7oyFirGWZbc3JEkTmHkmB+Ogs27wc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-nuyK5-ZqMIeJLpqcNSX7Aw-1; Wed, 06 Mar 2024 01:41:30 -0500
X-MC-Unique: nuyK5-ZqMIeJLpqcNSX7Aw-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-29a5bae5b3fso5309023a91.2
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 22:41:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709707288; x=1710312088;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5x3iQ+o9MdNG+rw2Auq87crWL0YefwVSeYPIgkDiOu4=;
 b=GWeRTinyeHosEzdKQsek5D7aF6zj6seyLnA5bL5KVCxs2Z4nYF0oHM/i8o+OxOfwBO
 DwZ+CPJTy1Rh6h3pGxFo+N6lhhCvI10DTn35EW+ySdzb7bpmbxglmFWN4Iec9yOgSgcp
 UyP95nxvL75OobBVVzSBCIHxtA9ENV7T8xDXtvxPRCovlXW9h63YLkL+Iz3BCTQrIe68
 F/3UFtSdbFsDrLOlxiTg8YoiDqfCIm4Rg70KzfeByxRgWNy6nUb45U64Yu3rPGcVF/nM
 +vv/8hjxXHhUZl9gj4b31USxoekkLTnCWUd5a8naAXAMKP9BNJwM0gTz5pO5I/oK2NEE
 CDbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3AQGxrmDaU6rk/uMz6ZKtPyjU7EhRukZruj1TqLuTmoRpL73m5NU5RV5nyzOE0bNXlmE4JbuZnTuoz3fHojK2ulg5
X-Gm-Message-State: AOJu0Yxt95wILO+OSn0j/AQQDf1rR8ZxLa9IL9vjQnHpO4xL8MfZotYb
 gY3dToqtxOoAcnrC/yPfVAKjkPP8sAqtF98lm5zjybZfmCkhpwuEaUcZoiXC0B8pU3u3K5bscUe
 IoA/no/muOxooKaST8YFXfT34U63av2tVOzG0TCZlIyhUNVKz8A==
X-Received: by 2002:a17:90b:20c:b0:29a:9f04:fbcd with SMTP id
 fy12-20020a17090b020c00b0029a9f04fbcdmr13293917pjb.20.1709707288559; 
 Tue, 05 Mar 2024 22:41:28 -0800 (PST)
X-Received: by 2002:a17:90b:20c:b0:29a:9f04:fbcd with SMTP id
 fy12-20020a17090b020c00b0029a9f04fbcdmr13293900pjb.20.1709707288127; 
 Tue, 05 Mar 2024 22:41:28 -0800 (PST)
Received: from fc37-ani ([115.96.30.47]) by smtp.googlemail.com with ESMTPSA id
 d8-20020a170903230800b001db5bdd5e33sm11709816plh.48.2024.03.05.22.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 22:41:27 -0800 (PST)
Date: Wed, 6 Mar 2024 12:11:18 +0530 (IST)
From: Ani Sinha <anisinha@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com, 
 mst@redhat.com, gaosong@loongson.cn, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, philmd@linaro.org, 
 wangyanan55@huawei.com, eblake@redhat.com, armbru@redhat.com, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, f.ebner@proxmox.com
Subject: Re: [PATCH v2 07/20] smbios: avoid mangling user provided tables
In-Reply-To: <20240305155724.2047069-8-imammedo@redhat.com>
Message-ID: <0eeed9a2-cd7b-bdde-6346-3357dc430835@redhat.com>
References: <20240305155724.2047069-1-imammedo@redhat.com>
 <20240305155724.2047069-8-imammedo@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
X-TUID: fOZWSl9s7bJc



On Tue, 5 Mar 2024, Igor Mammedov wrote:

> currently smbios_entry_add() preserves internally '-smbios type='
> options but tables provided with '-smbios file=' are stored directly
> into blob that eventually will be exposed to VM. And then later
> QEMU adds default/'-smbios type' entries on top into the same blob.
>
> It makes impossible to generate tables more than once, hence
> 'immutable' guard was used.
> Make it possible to regenerate final blob by storing user provided
> blobs into a dedicated area (usr_blobs) and then copy it when
> composing final blob. Which also makes handling of -smbios
> options consistent.
>
> As side effect of this and previous commits there is no need to
> generate legacy smbios_entries at the time options are parsed.
> Instead compose smbios_entries on demand from  usr_blobs like
> it is done for non-legacy SMBIOS tables.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Tested-by: Fiona Ebner <f.ebner@proxmox.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
>  hw/smbios/smbios.c | 179 +++++++++++++++++++++++----------------------
>  1 file changed, 92 insertions(+), 87 deletions(-)
>
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index c46fc93357..aa2cc5bdbd 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -57,6 +57,14 @@ static size_t smbios_entries_len;
>  static bool smbios_uuid_encoded = true;
>  /* end: legacy structures & constants for <= 2.0 machines */
>
> +/*
> + * SMBIOS tables provided by user with '-smbios file=<foo>' option
> + */
> +uint8_t *usr_blobs;
> +size_t usr_blobs_len;
> +static GArray *usr_blobs_sizes;
> +static unsigned usr_table_max;
> +static unsigned usr_table_cnt;
>
>  uint8_t *smbios_tables;
>  size_t smbios_tables_len;
> @@ -67,7 +75,6 @@ static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_32;
>  static SmbiosEntryPoint ep;
>
>  static int smbios_type4_count = 0;
> -static bool smbios_immutable;
>  static bool smbios_have_defaults;
>  static uint32_t smbios_cpuid_version, smbios_cpuid_features;
>
> @@ -569,9 +576,8 @@ static void smbios_build_type_1_fields(void)
>
>  uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
>  {
> -    /* drop unwanted version of command-line file blob(s) */
> -    g_free(smbios_tables);
> -    smbios_tables = NULL;
> +    int i;
> +    size_t usr_offset;
>
>      /* also complain if fields were given for types > 1 */
>      if (find_next_bit(have_fields_bitmap,
> @@ -581,12 +587,33 @@ uint8_t *smbios_get_table_legacy(uint32_t expected_t4_count, size_t *length)
>          exit(1);
>      }
>
> -    if (!smbios_immutable) {
> -        smbios_build_type_0_fields();
> -        smbios_build_type_1_fields();
> -        smbios_validate_table(expected_t4_count);
> -        smbios_immutable = true;
> +    g_free(smbios_entries);
> +    smbios_entries_len = sizeof(uint16_t);
> +    smbios_entries = g_malloc0(smbios_entries_len);
> +
> +    for (i = 0, usr_offset = 0; usr_blobs_sizes && i < usr_blobs_sizes->len;
> +         i++)
> +    {
> +        struct smbios_table *table;
> +        struct smbios_structure_header *header;
> +        size_t size = g_array_index(usr_blobs_sizes, size_t, i);
> +
> +        header = (struct smbios_structure_header *)(usr_blobs + usr_offset);
> +        smbios_entries = g_realloc(smbios_entries, smbios_entries_len +
> +                                                   size + sizeof(*table));
> +        table = (struct smbios_table *)(smbios_entries + smbios_entries_len);
> +        table->header.type = SMBIOS_TABLE_ENTRY;
> +        table->header.length = cpu_to_le16(sizeof(*table) + size);
> +        memcpy(table->data, header, size);
> +        smbios_entries_len += sizeof(*table) + size;
> +        (*(uint16_t *)smbios_entries) =
> +            cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);

I know this comes from existing code but can you please explain why we add
1 to it? This is confusing and a comment here would be nice.

> +        usr_offset += size;

It would be better if we could add a comment here describing a bit what
this is all about.

user blobs are an array of smbios_structure_header entries whereas legacy
tables are an array of smbios_table structures where
smbios_table->data represents the a single user provided table blob in
smbios_structure_header.

>      }
> +
> +    smbios_build_type_0_fields();
> +    smbios_build_type_1_fields();
> +    smbios_validate_table(expected_t4_count);
>      *length = smbios_entries_len;
>      return smbios_entries;
>  }
> @@ -1094,67 +1121,67 @@ void smbios_get_tables(MachineState *ms,
>  {
>      unsigned i, dimm_cnt, offset;
>
> -    /* drop unwanted (legacy) version of command-line file blob(s) */
> -    g_free(smbios_entries);
> -    smbios_entries = NULL;
> +    g_free(smbios_tables);
> +    smbios_tables = g_memdup2(usr_blobs, usr_blobs_len);

Again a comment describing here would be nice as to why memdup is ok.

> +    smbios_tables_len = usr_blobs_len;
> +    smbios_table_max = usr_table_max;
> +    smbios_table_cnt = usr_table_cnt;
>
> -    if (!smbios_immutable) {
> -        smbios_build_type_0_table();
> -        smbios_build_type_1_table();
> -        smbios_build_type_2_table();
> -        smbios_build_type_3_table();
> +    smbios_build_type_0_table();
> +    smbios_build_type_1_table();
> +    smbios_build_type_2_table();
> +    smbios_build_type_3_table();
>
> -        assert(ms->smp.sockets >= 1);
> +    assert(ms->smp.sockets >= 1);
>
> -        for (i = 0; i < ms->smp.sockets; i++) {
> -            smbios_build_type_4_table(ms, i);
> -        }
> +    for (i = 0; i < ms->smp.sockets; i++) {
> +        smbios_build_type_4_table(ms, i);
> +    }
>
> -        smbios_build_type_8_table();
> -        smbios_build_type_11_table();
> +    smbios_build_type_8_table();
> +    smbios_build_type_11_table();
>
>  #define MAX_DIMM_SZ (16 * GiB)
>  #define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
>                                          : ((current_machine->ram_size - 1) % MAX_DIMM_SZ) + 1)
>
> -        dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;
> +    dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) /
> +               MAX_DIMM_SZ;
>
> -        /*
> -         * The offset determines if we need to keep additional space between
> -         * table 17 and table 19 header handle numbers so that they do
> -         * not overlap. For example, for a VM with larger than 8 TB guest
> -         * memory and DIMM like chunks of 16 GiB, the default space between
> -         * the two tables (T19_BASE - T17_BASE = 512) is not enough.
> -         */
> -        offset = (dimm_cnt > (T19_BASE - T17_BASE)) ? \
> -                 dimm_cnt - (T19_BASE - T17_BASE) : 0;
> +    /*
> +     * The offset determines if we need to keep additional space between
> +     * table 17 and table 19 header handle numbers so that they do
> +     * not overlap. For example, for a VM with larger than 8 TB guest
> +     * memory and DIMM like chunks of 16 GiB, the default space between
> +     * the two tables (T19_BASE - T17_BASE = 512) is not enough.
> +     */
> +    offset = (dimm_cnt > (T19_BASE - T17_BASE)) ? \
> +             dimm_cnt - (T19_BASE - T17_BASE) : 0;
>
> -        smbios_build_type_16_table(dimm_cnt);
> +    smbios_build_type_16_table(dimm_cnt);
>
> -        for (i = 0; i < dimm_cnt; i++) {
> -            smbios_build_type_17_table(i, GET_DIMM_SZ);
> -        }
> +    for (i = 0; i < dimm_cnt; i++) {
> +        smbios_build_type_17_table(i, GET_DIMM_SZ);
> +    }
>
> -        for (i = 0; i < mem_array_size; i++) {
> -            smbios_build_type_19_table(i, offset, mem_array[i].address,
> -                                       mem_array[i].length);
> -        }
> +    for (i = 0; i < mem_array_size; i++) {
> +        smbios_build_type_19_table(i, offset, mem_array[i].address,
> +                                   mem_array[i].length);
> +    }
>
> -        /*
> -         * make sure 16 bit handle numbers in the headers of tables 19
> -         * and 32 do not overlap.
> -         */
> -        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
> +    /*
> +     * make sure 16 bit handle numbers in the headers of tables 19
> +     * and 32 do not overlap.
> +     */
> +    assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
>
> -        smbios_build_type_32_table();
> -        smbios_build_type_38_table();
> -        smbios_build_type_41_table(errp);
> -        smbios_build_type_127_table();
> +    smbios_build_type_32_table();
> +    smbios_build_type_38_table();
> +    smbios_build_type_41_table(errp);
> +    smbios_build_type_127_table();
>
> -        smbios_validate_table(ms->smp.sockets);
> -        smbios_entry_point_setup();
> -        smbios_immutable = true;
> -    }
> +    smbios_validate_table(ms->smp.sockets);
> +    smbios_entry_point_setup();
>
>      /* return tables blob and entry point (anchor), and their sizes */
>      *tables = smbios_tables;
> @@ -1254,13 +1281,10 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>  {
>      const char *val;
>
> -    assert(!smbios_immutable);
> -
>      val = qemu_opt_get(opts, "file");
>      if (val) {
>          struct smbios_structure_header *header;
> -        int size;
> -        struct smbios_table *table; /* legacy mode only */
> +        size_t size;
>
>          if (!qemu_opts_validate(opts, qemu_smbios_file_opts, errp)) {
>              return;
> @@ -1277,9 +1301,9 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>           * (except in legacy mode, where the second '\0' is implicit and
>           *  will be inserted by the BIOS).
>           */
> -        smbios_tables = g_realloc(smbios_tables, smbios_tables_len + size);
> -        header = (struct smbios_structure_header *)(smbios_tables +
> -                                                    smbios_tables_len);
> +        usr_blobs = g_realloc(usr_blobs, usr_blobs_len + size);
> +        header = (struct smbios_structure_header *)(usr_blobs +
> +                                                    usr_blobs_len);
>
>          if (load_image_size(val, (uint8_t *)header, size) != size) {
>              error_setg(errp, "Failed to load SMBIOS file %s", val);
> @@ -1300,34 +1324,15 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>              smbios_type4_count++;
>          }
>
> -        smbios_tables_len += size;
> -        if (size > smbios_table_max) {
> -            smbios_table_max = size;
> +        if (!usr_blobs_sizes) {
> +            usr_blobs_sizes = g_array_new(false, false, sizeof(size_t));
>          }
> -        smbios_table_cnt++;
> -
> -        /* add a copy of the newly loaded blob to legacy smbios_entries */
> -        /* NOTE: This code runs before smbios_set_defaults(), so we don't
> -         *       yet know which mode (legacy vs. aggregate-table) will be
> -         *       required. We therefore add the binary blob to both legacy
> -         *       (smbios_entries) and aggregate (smbios_tables) tables, and
> -         *       delete the one we don't need from smbios_set_defaults(),
> -         *       once we know which machine version has been requested.
> -         */
> -        if (!smbios_entries) {
> -            smbios_entries_len = sizeof(uint16_t);
> -            smbios_entries = g_malloc0(smbios_entries_len);
> +        g_array_append_val(usr_blobs_sizes, size);
> +        usr_blobs_len += size;
> +        if (size > usr_table_max) {
> +            usr_table_max = size;
>          }
> -        smbios_entries = g_realloc(smbios_entries, smbios_entries_len +
> -                                                   size + sizeof(*table));
> -        table = (struct smbios_table *)(smbios_entries + smbios_entries_len);
> -        table->header.type = SMBIOS_TABLE_ENTRY;
> -        table->header.length = cpu_to_le16(sizeof(*table) + size);
> -        memcpy(table->data, header, size);
> -        smbios_entries_len += sizeof(*table) + size;
> -        (*(uint16_t *)smbios_entries) =
> -                cpu_to_le16(le16_to_cpu(*(uint16_t *)smbios_entries) + 1);
> -        /* end: add a copy of the newly loaded blob to legacy smbios_entries */
> +        usr_table_cnt++;
>
>          return;
>      }
> --
> 2.39.3
>
>

