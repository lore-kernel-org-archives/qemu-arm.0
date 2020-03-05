Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3300203lfi;
        Thu, 5 Mar 2020 11:41:11 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtr78o50F5RLhbSrr1u0gxrIT1OqCrPuFDq0b0Gv8c6r7LALkyXQ9wQZ3rR2Cffjazs/L9D
X-Received: by 2002:aca:7552:: with SMTP id q79mr15703oic.109.1583437271646;
        Thu, 05 Mar 2020 11:41:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583437271; cv=none;
        d=google.com; s=arc-20160816;
        b=Nwuv63q+nBbixJ7prB6b5VOb/oZer/5cR7XAUY3J1AugAbZ1IWB/yvhbGl8JswP/yT
         UOyzIrrl0sY8jxovMGEF9qVtHeFPs3YpptS+MF78cCA/vAl/CjmF7Z4FNHys1/0I+2Bp
         GJ8oVRb+Zjk9fN1gufeK4QGZ5NXeSQ7AMot1SIS8C8wTVNc0NkWLQMVb7olPt0IM3fg8
         UoRHgq329DLHCEVggxGIogHdfJpJFK8IKgYzsE4m6c+NtQqcNdgJee6WVvwnUcUEPocR
         UyP9I6n9qAiGqlYgLsMZ74wVY4D0r4Go5U57IPY4GfuEPKeuQk/OGXHkBcRdJUbyW4oH
         1s6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=XTwc7utWzKzyAhBWCE6+Bn/zt36VL3m2kIIGjJFea4w=;
        b=xEybVix5/ganBfOzyIzxCP4blMX3+dwNassfizV1St8+/1+WjxYbgaf58d4i4vWpHb
         mhVKLJRscfhahuf/0MBWKWrRwwZyIZHLiSE5K5A2qE77IWzNDUypel11cjoPGWkCG60E
         aiKqkj1kH5PxQvlvVf0bs8fq4ZmqYgz/HAaGshR9c4v4jit1e//lEQE6L11wjww2oCij
         ztkc8ZYwPGALbGg6/ClIovZGVkWV9pA5lN2KIpHApjIdUGGAHUfpkPT3dYWQNM7EWkyw
         B5enhIGxwBP3E+oa3Z9ARiVNiQZITCEfdaZeBg5MGV4LPKbzn1lclLBmIFH3X6Y8R/AT
         OWRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NJJv/g16";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x72si3592956oia.194.2020.03.05.11.41.11;
        Thu, 05 Mar 2020 11:41:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NJJv/g16";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgCETlH (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 5 Mar 2020 14:41:07 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38570 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725944AbgCETlH (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 5 Mar 2020 14:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583437266;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XTwc7utWzKzyAhBWCE6+Bn/zt36VL3m2kIIGjJFea4w=;
        b=NJJv/g16fuj+di17SEHg8b5aJgj95mAf9kbxpSUS69G1YtwZwo9q35SM6L7O1dLYtLVgGA
        oMkF7XpTh1uUqhPziDukoRnfWESMoiAyaSswLHs7CBLua0AITuzI7MfUqhPJ/1BN8cdD3p
        QnCnlQY1m5YqGlUuZDtrV3Dwm+Q+Esk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-p2KwtOX8PpWqemKazDTNyg-1; Thu, 05 Mar 2020 14:41:04 -0500
X-MC-Unique: p2KwtOX8PpWqemKazDTNyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80EA98010F2;
        Thu,  5 Mar 2020 19:41:01 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9938FBE0;
        Thu,  5 Mar 2020 19:40:56 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH v3 06/14] arm/arm64: gicv3: Set the LPI
 config and pending tables
To:     Zenghui Yu <yuzenghui@huawei.com>, eric.auger.pro@gmail.com,
        maz@kernel.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com,
        thuth@redhat.com
References: <20200128103459.19413-1-eric.auger@redhat.com>
 <20200128103459.19413-7-eric.auger@redhat.com>
 <5e188428-11c9-aad4-3d5e-fca89cc41b7f@huawei.com>
From:   Auger Eric <eric.auger@redhat.com>
Message-ID: <11ff332b-6634-7d9a-c12e-921e8dc592e9@redhat.com>
Date:   Thu, 5 Mar 2020 20:40:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5e188428-11c9-aad4-3d5e-fca89cc41b7f@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: fskTsuaNVGxo

Hi Zenghui,

On 2/7/20 3:12 AM, Zenghui Yu wrote:
> Hi Eric,
>=20
> On 2020/1/28 18:34, Eric Auger wrote:
>> Allocate the LPI configuration and per re-distributor pending table.
>> Set redistributor's PROPBASER and PENDBASER. The LPIs are enabled
>> by default in the config table.
>>
>> Also introduce a helper routine that allows to set the pending table
>> bit for a given LPI.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v2 -> v3:
>> - Move the helpers in lib/arm/gic-v3.c and prefix them with "gicv3_"
>> =C2=A0=C2=A0 and add _lpi prefix too
>>
>> v1 -> v2:
>> - remove memory attributes
>> ---
>> =C2=A0 lib/arm/asm/gic-v3.h | 16 +++++++++++
>> =C2=A0 lib/arm/gic-v3.c=C2=A0=C2=A0=C2=A0=C2=A0 | 64 +++++++++++++++++=
+++++++++++++++++++++++++++
>> =C2=A0 2 files changed, 80 insertions(+)
>>
>> diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
>> index ffb2e26..ec2a6f0 100644
>> --- a/lib/arm/asm/gic-v3.h
>> +++ b/lib/arm/asm/gic-v3.h
>> @@ -48,6 +48,16 @@
>> =C2=A0 #define MPIDR_TO_SGI_AFFINITY(cluster_id, level) \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (MPIDR_AFFINITY_LEVEL(cluster_id, level=
) <<
>> ICC_SGI1R_AFFINITY_## level ## _SHIFT)
>> =C2=A0 +#define GICR_PROPBASER_IDBITS_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 (0x1f)
>=20
> This is not being used.=C2=A0 You can use it when calculating prop_val
> or just drop it.
yep dropped it.
>=20
>> +
>> +#define GICR_PENDBASER_PTZ=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT_ULL(62)
>> +
>> +#define LPI_PROP_GROUP1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1 =
<< 1)
>> +#define LPI_PROP_ENABLED=C2=A0=C2=A0=C2=A0 (1 << 0)
>> +#define LPI_PROP_DEFAULT_PRIO=C2=A0=C2=A0 0xa0
>> +#define LPI_PROP_DEFAULT=C2=A0=C2=A0=C2=A0 (LPI_PROP_DEFAULT_PRIO | L=
PI_PROP_GROUP1 | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 LPI_PROP_ENABLED)
>> +
>> =C2=A0 #include <asm/arch_gicv3.h>
>> =C2=A0 =C2=A0 #ifndef __ASSEMBLY__
>> @@ -64,6 +74,8 @@ struct gicv3_data {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *dist_base;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *redist_bases[GICV3_NR_REDISTS];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *redist_base[NR_CPUS];
>> +=C2=A0=C2=A0=C2=A0 void *lpi_prop;
>> +=C2=A0=C2=A0=C2=A0 void *lpi_pend[NR_CPUS];
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int irq_nr;
>> =C2=A0 };
>> =C2=A0 extern struct gicv3_data gicv3_data;
>> @@ -80,6 +92,10 @@ extern void gicv3_write_eoir(u32 irqstat);
>> =C2=A0 extern void gicv3_ipi_send_single(int irq, int cpu);
>> =C2=A0 extern void gicv3_ipi_send_mask(int irq, const cpumask_t *dest)=
;
>> =C2=A0 extern void gicv3_set_redist_base(size_t stride);
>> +extern void gicv3_lpi_set_config(int n, u8 val);
>> +extern u8 gicv3_lpi_get_config(int n);
>> +extern void gicv3_lpi_set_pending_table_bit(int rdist, int n, bool se=
t);
>> +extern void gicv3_lpi_alloc_tables(void);
>> =C2=A0 =C2=A0 static inline void gicv3_do_wait_for_rwp(void *base)
>> =C2=A0 {
>> diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
>> index feecb5e..c33f883 100644
>> --- a/lib/arm/gic-v3.c
>> +++ b/lib/arm/gic-v3.c
>> @@ -5,6 +5,7 @@
>> =C2=A0=C2=A0 */
>> =C2=A0 #include <asm/gic.h>
>> =C2=A0 #include <asm/io.h>
>> +#include <alloc_page.h>
>> =C2=A0 =C2=A0 void gicv3_set_redist_base(size_t stride)
>> =C2=A0 {
>> @@ -147,3 +148,66 @@ void gicv3_ipi_send_single(int irq, int cpu)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpumask_set_cpu(cpu, &dest);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gicv3_ipi_send_mask(irq, &dest);
>> =C2=A0 }
>> +
>> +#if defined(__aarch64__)
>> +/* alloc_lpi_tables: Allocate LPI config and pending tables */
>> +void gicv3_lpi_alloc_tables(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned long n =3D SZ_64K >> PAGE_SHIFT;
>> +=C2=A0=C2=A0=C2=A0 unsigned long order =3D fls(n);
>> +=C2=A0=C2=A0=C2=A0 u64 prop_val;
>> +=C2=A0=C2=A0=C2=A0 int cpu;
>> +
>> +=C2=A0=C2=A0=C2=A0 gicv3_data.lpi_prop =3D (void *)virt_to_phys(alloc=
_pages(order));
>> +
>> +=C2=A0=C2=A0=C2=A0 /* ID bits =3D 13, ie. up to 14b LPI INTID */
>> +=C2=A0=C2=A0=C2=A0 prop_val =3D (u64)gicv3_data.lpi_prop | 13;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Allocate pending tables for each redistrib=
utor
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * and set PROPBASER and PENDBASER
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 for_each_present_cpu(cpu) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 pend_val;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ptr;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ptr =3D gicv3_data.redist_=
base[cpu];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writeq(prop_val, ptr + GIC=
R_PROPBASER);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gicv3_data.lpi_pend[cpu] =3D=
 (void
>> *)virt_to_phys(alloc_pages(order));
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pend_val =3D (u64)gicv3_da=
ta.lpi_pend[cpu];
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 writeq(pend_val, ptr + GIC=
R_PENDBASER);
>> +=C2=A0=C2=A0=C2=A0 }
>> +}
>> +
>> +void gicv3_lpi_set_config(int n, u8 value)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u8 *entry =3D (u8 *)(gicv3_data.lpi_prop + (n - 81=
92));
>=20
> But this is actually the *physical* address, shouldn't it be
> converted by phys_to_virt() before reading/writing something?
> Like what you've done for the 'lpi_pend[rdist]' before writing
> pending bit.=C2=A0 Or I'm missing some points here?
Agreed! Thanks

Eric
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 *entry =3D value;
>> +}
>> +
>> +u8 gicv3_lpi_get_config(int n)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u8 *entry =3D (u8 *)(gicv3_data.lpi_prop + (n - 81=
92));
>=20
> The same as above.
>=20
>=20
> Thanks,
> Zenghui
>=20
>> +
>> +=C2=A0=C2=A0=C2=A0 return *entry;
>> +}
>> +
>> +void gicv3_lpi_set_pending_table_bit(int rdist, int n, bool set)
>> +{
>> +=C2=A0=C2=A0=C2=A0 u8 *ptr =3D phys_to_virt((phys_addr_t)gicv3_data.l=
pi_pend[rdist]);
>> +=C2=A0=C2=A0=C2=A0 u8 mask =3D 1 << (n % 8), byte;
>> +
>> +=C2=A0=C2=A0=C2=A0 ptr +=3D (n / 8);
>> +=C2=A0=C2=A0=C2=A0 byte =3D *ptr;
>> +=C2=A0=C2=A0=C2=A0 if (set)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 byte |=3D=C2=A0 mask;
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 byte &=3D ~mask;
>> +=C2=A0=C2=A0=C2=A0 *ptr =3D byte;
>> +}
>> +#endif /* __aarch64__ */
>>
>=20
