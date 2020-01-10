Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp769266lff;
        Fri, 10 Jan 2020 06:32:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxNhUCF6lA0DV+Qdd6+xqjcPQUiZx4tl9PI3GqBAAU0ULkKaFPKh5ATBlnqZrpweM57Qwi7
X-Received: by 2002:aca:e106:: with SMTP id y6mr2467926oig.131.1578666743083;
        Fri, 10 Jan 2020 06:32:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578666743; cv=none;
        d=google.com; s=arc-20160816;
        b=XIfT/lWVJ98lqgku2RBHoEtjITzlV/FKv5oL8MubcY4azBaPMfFCSFqyrl+pcDy48M
         2pyDvSy0tcsu5xwCjzX5agn2IokGp4wEsCEUc1AXnBncvvQI/4rHOlhNqETOx2AXzxUG
         hX3yvirE8qnBO4zEpJoCfHWXvhwMTdtOAiErHozGMGzQk04yGhQJKpofrdxUiKymn+5v
         udAWhAP1oAxGPKebvbUXJKPi5/TOYzTO0JDmK/z8U2jynrcBcoofWryTm9LYR8022DKV
         auU2Kl2i5puQo9+24sAZfSjl43rN4OYbyEqIozXWWL/0X5ekkMzJFM7c3CxrTIP+gRvU
         Wb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=719g42u2rz+9V3916YPTM/uativVLpzDKDsVaRSjTdU=;
        b=IMaRvRvbkSuDB5L/XGnJbhZNn9yo6JMpNRCI9W9jYRYOZBO7hz9tkBZWUOTRuKiyw8
         atH2g3z+zDVAXedHRFEonWMfZfC4tPZZiLfIYJB4hyxcql5WUJi9mpzACUJda3lXTH8D
         e3lbY508xx37hSwVV0bzMV9tH5Qe7XitUM0B56TCaqJqRHbhWuG+Ci/l95O/bqUlbZ8l
         pvQQee1PNwFiI/nbL/x0WyMJDZZgv5+kpsjEXaVWICZa0wXSNltcOVVpiFyBOkrenRPn
         KIZmRQJrJ7BVim1vl5UoBdUDrmcRHeJmwgIgajjr+H76P/WPyDmGwxHq+O0beD8Zts4o
         7IIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IIiZWrpe;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id o14si1107941oie.257.2020.01.10.06.32.22;
        Fri, 10 Jan 2020 06:32:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IIiZWrpe;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgAJOcV (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 10 Jan 2020 09:32:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31796 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727848AbgAJOcV (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Jan 2020 09:32:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578666740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=719g42u2rz+9V3916YPTM/uativVLpzDKDsVaRSjTdU=;
        b=IIiZWrpeA70ltyFXisPPut15Y5D2I5tU1w3mumxtN+4LSFJldEdsRJGR+w6EvoIxFkIMTE
        yx4lXs8M8JnQygxgTHUdHe/SfW7xlV7IG+fxGKFg6kLgFzpp0RLzZF7SZGwc7O85xyv0la
        Hb25A0pOQsueE6/lsaFkKUnG8KceIbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-abbg4ELiP0qL4yvf3JxD8w-1; Fri, 10 Jan 2020 09:32:19 -0500
X-MC-Unique: abbg4ELiP0qL4yvf3JxD8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF3698C507A;
        Fri, 10 Jan 2020 14:32:16 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F4FF87ED7;
        Fri, 10 Jan 2020 14:32:12 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH 11/16] arm/arm64: ITS: Device and
 collection Initialization
To:     Zenghui Yu <yuzenghui@huawei.com>, eric.auger.pro@gmail.com,
        maz@kernel.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com,
        thuth@redhat.com
References: <20191216140235.10751-1-eric.auger@redhat.com>
 <20191216140235.10751-12-eric.auger@redhat.com>
 <1f170d74-0ee5-6415-d84e-cd7de4d0f071@huawei.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <bb18550e-e9e5-f6ba-a5ff-8dc16cec866a@redhat.com>
Date:   Fri, 10 Jan 2020 15:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1f170d74-0ee5-6415-d84e-cd7de4d0f071@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 12IkP19r061U

Hi Zenghui,

On 12/20/19 8:25 AM, Zenghui Yu wrote:
> Hi Eric,
>=20
> On 2019/12/16 22:02, Eric Auger wrote:
>> Introduce an helper functions to register
>> - a new device, characterized by its device id and the
>> =C2=A0=C2=A0 max number of event IDs that dimension its ITT (Interrupt
>> =C2=A0=C2=A0 Translation Table).=C2=A0 The function allocates the ITT.
>>
>> - a new collection, characterized by its ID and the
>> =C2=A0=C2=A0 target processing engine (PE).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> ---
>> =C2=A0 lib/arm/asm/gic-v3-its.h | 20 +++++++++++++++++
>> =C2=A0 lib/arm/gic-v3-its.c=C2=A0=C2=A0=C2=A0=C2=A0 | 46 +++++++++++++=
+++++++++++++++++++++++++++
>> =C2=A0 2 files changed, 66 insertions(+)
>>
>> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
>> index ab639c5..245ef61 100644
>> --- a/lib/arm/asm/gic-v3-its.h
>> +++ b/lib/arm/asm/gic-v3-its.h
>> @@ -87,6 +87,9 @@
>> =C2=A0 =C2=A0 #define ITS_FLAGS_CMDQ_NEEDS_FLUSHING=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1ULL << 0)
>> =C2=A0 +#define GITS_MAX_DEVICES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 8
>> +#define GITS_MAX_COLLECTIONS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 8
>> +
>> =C2=A0 struct its_typer {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int ite_size;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int eventid_bits;
>> @@ -117,6 +120,17 @@ struct its_cmd_block {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64=C2=A0=C2=A0=C2=A0=C2=A0 raw_cmd[4];
>> =C2=A0 };
>> =C2=A0 +struct its_device {
>> +=C2=A0=C2=A0=C2=A0 u32 device_id;=C2=A0=C2=A0=C2=A0 /* device ID */
>> +=C2=A0=C2=A0=C2=A0 u32 nr_ites;=C2=A0=C2=A0=C2=A0 /* Max Interrupt Tr=
anslation Entries */
>> +=C2=A0=C2=A0=C2=A0 void *itt;=C2=A0=C2=A0=C2=A0 /* Interrupt Translat=
ion Table GPA */
>> +};
>> +
>> +struct its_collection {
>> +=C2=A0=C2=A0=C2=A0 u64 target_address;
>> +=C2=A0=C2=A0=C2=A0 u16 col_id;
>> +};
>> +
>> =C2=A0 struct its_data {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *base;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct its_typer typer;
>> @@ -124,6 +138,10 @@ struct its_data {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct its_cmd_block *cmd_base;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct its_cmd_block *cmd_write;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct its_cmd_block *cmd_readr;
>> +=C2=A0=C2=A0=C2=A0 struct its_device devices[GITS_MAX_DEVICES];
>> +=C2=A0=C2=A0=C2=A0 u32 nb_devices;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* Allocated Devices */
>> +=C2=A0=C2=A0=C2=A0 struct its_collection collections[GITS_MAX_COLLECT=
IONS];
>> +=C2=A0=C2=A0=C2=A0 u32 nb_collections;=C2=A0=C2=A0=C2=A0 /* Allocated=
 Collections */
>=20
> ('nr_*' may be the more widely used one.)
>=20
>> =C2=A0 };
>> =C2=A0 =C2=A0 extern struct its_data its_data;
>> @@ -140,6 +158,8 @@ extern u8 get_lpi_config(int n);
>> =C2=A0 extern void set_pending_table_bit(int rdist, int n, bool set);
>> =C2=A0 extern void gicv3_rdist_ctrl_lpi(u32 redist, bool set);
>> =C2=A0 extern void its_enable_defaults(void);
>> +extern struct its_device *its_create_device(u32 dev_id, int nr_ites);
>> +extern struct its_collection *its_create_collection(u32 col_id, u32
>> target_pe);
>> =C2=A0 =C2=A0 #endif /* !__ASSEMBLY__ */
>> =C2=A0 #endif /* _ASMARM_GIC_V3_ITS_H_ */
>> diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
>> index 9a51ef4..9906428 100644
>> --- a/lib/arm/gic-v3-its.c
>> +++ b/lib/arm/gic-v3-its.c
>> @@ -284,3 +284,49 @@ void its_enable_defaults(void)
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writel(GITS_CTLR_ENABLE, its_dat=
a.base + GITS_CTLR);
>> =C2=A0 }
>> +
>> +struct its_device *its_create_device(u32 device_id, int nr_ites)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct its_baser *baser;
>> +=C2=A0=C2=A0=C2=A0 struct its_device *new;
>> +=C2=A0=C2=A0=C2=A0 unsigned long n, order;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (its_data.nb_devices >=3D GITS_MAX_DEVICES)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 report_abort("%s redimensi=
on GITS_MAX_DEVICES", __func__);
>> +
>> +=C2=A0=C2=A0=C2=A0 baser =3D its_lookup_baser(GITS_BASER_TYPE_DEVICE)=
;
>> +=C2=A0=C2=A0=C2=A0 if (!baser)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> +
>> +=C2=A0=C2=A0=C2=A0 new =3D &its_data.devices[its_data.nb_devices];
>> +
>> +=C2=A0=C2=A0=C2=A0 new->device_id =3D device_id;
>> +=C2=A0=C2=A0=C2=A0 new->nr_ites =3D nr_ites;
>> +
>> +=C2=A0=C2=A0=C2=A0 n =3D (baser->esz * nr_ites) >> PAGE_SHIFT;
>=20
> baser->esz is GITS_BASER.Entry_Size, which indicates the size of
> Device Table entry.
> We're allocating ITT for this device now, shouldn't we use
> its_data.typer.esz?

Yes you're definitively right. I should use its_data.typer.ite_size.

Thank you!

Eric
>=20
>=20
> Thanks,
> Zenghui
>=20
>> +=C2=A0=C2=A0=C2=A0 order =3D is_power_of_2(n) ? fls(n) : fls(n) + 1;
>> +=C2=A0=C2=A0=C2=A0 new->itt =3D (void *)virt_to_phys(alloc_pages(orde=
r));
>> +
>> +=C2=A0=C2=A0=C2=A0 its_data.nb_devices++;
>> +=C2=A0=C2=A0=C2=A0 return new;
>> +}
>> +
>> +struct its_collection *its_create_collection(u32 col_id, u32 pe)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct its_collection *new;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (its_data.nb_collections >=3D GITS_MAX_COLLECTI=
ONS)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 report_abort("%s redimensi=
on GITS_MAX_COLLECTIONS", __func__);
>> +
>> +=C2=A0=C2=A0=C2=A0 new =3D &its_data.collections[its_data.nb_collecti=
ons];
>> +
>> +=C2=A0=C2=A0=C2=A0 new->col_id =3D col_id;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (its_data.typer.pta)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new->target_address =3D (u=
64)gicv3_data.redist_base[pe];
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new->target_address =3D pe=
 << 16;
>> +
>> +=C2=A0=C2=A0=C2=A0 its_data.nb_collections++;
>> +=C2=A0=C2=A0=C2=A0 return new;
>> +}
>>
>=20
