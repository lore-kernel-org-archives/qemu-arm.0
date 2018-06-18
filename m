Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3822955wrq;
        Mon, 18 Jun 2018 04:50:53 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIkb4LtbYdg9cbvCnB2GsWAb0Z2kWbykPENLDMvqfMq5w1cgvsNjc93v3Q1omJJ6AqIEdyi
X-Received: by 2002:a37:8ec4:: with SMTP id q187-v6mr9976311qkd.28.1529322653574;
        Mon, 18 Jun 2018 04:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529322653; cv=none;
        d=google.com; s=arc-20160816;
        b=BYyPo9yejbOa4BU0wCbnTQYzq55BxuYpF//rhfL8jJEtyCvyoMCkOt58yU0UYj8vS5
         DLeoFwPCIkhwEVcldg/5Xqa6lTnnTAD1Skiymaoo9ZUuGg3v+dN71JsjyUjO5qb9G1s8
         jlWDkDowFPj847xGxqaXb5DMdf2z1CPC4xOHDPaZpfQGs5jQam3fmNs53veB5keavOxp
         H4v63gGNZPH/uAIkuDcjWtSZfBRFiG1ufXfAEHSIL3N9UUi/PQ+sHvuyaVZjkxKm3f+D
         iOSgMhhujk+kxg3tsBevCkDjxs5oUZNIxIZkSIceqiw8uvjB/WnXKUV95uCqDPbndafW
         3Lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=OoQUey//XSJTUhmzTqdDtg5H3AEJTwYZxHzgB8jSbZw=;
        b=uD6uek+sGbRW1A8EMhFYGp2M8EpHDYCSaYuUrge0EhwfZQhZTgIsQCgiyOmFDN3yT/
         s/WilHoETIVeUjrwd69s/rIv+AIiSqctl688LhNS0G8ErfBuHZmIJDrkdNK2xs/HMibR
         9fw49WdcnscXRmWeKimQafGJGXOyMGgA0ipVi+wuK5u37OyOfavQN5xVDndqNH7aNpoY
         HB3sIeOGZlBLt2jXWv9NLlMDtrc+J4SzF9sexVX8LQSVd0KlURT92Cd25cTJMDgdQ1Pu
         dxEb+HFP72rUFLVEBEgNzvljy7vlrs+SuifroZsVEReXRhnvUvY7M5REA45S5eUxCveE
         4FSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jadZUAvz;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vGlkfMlm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vGlkfMlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m100-v6si1655227qkh.104.2018.06.18.04.50.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Jun 2018 04:50:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jadZUAvz;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vGlkfMlm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vGlkfMlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUsgP-0001AE-2r
	for alex.bennee@linaro.org; Mon, 18 Jun 2018 07:50:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fUsgD-0001A3-7M
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 07:50:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fUsgA-0006KT-45
	for qemu-arm@nongnu.org; Mon, 18 Jun 2018 07:50:41 -0400
Received: from greensocs.com ([193.104.36.180]:36437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fUsg9-0006J9-JS; Mon, 18 Jun 2018 07:50:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id D797A44B857;
	Mon, 18 Jun 2018 13:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529322628;
	bh=tCbE2L4q0yM+/03j8G0Q86WvX5aYFAISJ1/XUesjakQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=jadZUAvzp/UHkSLUlRYIouA5ae8DHPG8oAbYUVVUOPk9JV7uGVZNoeZ7hlqL0UQXV
	YulfT2wYKb5+I4ZUb0T4/xZbXjeobJtYKclWtXZTvaNnp+Mpo2Ww8dgwhsow370kab
	Zj0G/rC3O71mwlEiX64DogR6Hd+DEgo9JY6ywazg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vGlkfMlm;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vGlkfMlm
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvIVTRsSA4Dj; Mon, 18 Jun 2018 13:50:27 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id B251044B858; Mon, 18 Jun 2018 13:50:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529322627;
	bh=tCbE2L4q0yM+/03j8G0Q86WvX5aYFAISJ1/XUesjakQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=vGlkfMlmtsHPXH4ISNRkIyysy659g0sNQHojZvFY6ODMmmeDjaJ8ZAOA/P5QWl3/y
	H4pvLuWnQKGRt3vl0izON0lBdsF8bYunZvYjKu0gKnj23Bv51M3w1kcEpZmxVpl5DS
	zc3qARcVbu41gk0H738pLh4mWt+d5kTOdRrdv+G0=
Received: from [172.16.40.3] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E314844B857;
	Mon, 18 Jun 2018 13:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529322627;
	bh=tCbE2L4q0yM+/03j8G0Q86WvX5aYFAISJ1/XUesjakQ=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=vGlkfMlmtsHPXH4ISNRkIyysy659g0sNQHojZvFY6ODMmmeDjaJ8ZAOA/P5QWl3/y
	H4pvLuWnQKGRt3vl0izON0lBdsF8bYunZvYjKu0gKnj23Bv51M3w1kcEpZmxVpl5DS
	zc3qARcVbu41gk0H738pLh4mWt+d5kTOdRrdv+G0=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-4-luc.michel@greensocs.com>
	<CAFEAcA9Oh+faKrBwDb7LAG=drkQTtbtoOrV_WUqa7twJi974yQ@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <1425bf1a-1502-b614-ffb1-b261cb24d1de@greensocs.com>
Date: Mon, 18 Jun 2018 13:50:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Oh+faKrBwDb7LAG=drkQTtbtoOrV_WUqa7twJi974yQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="VQ3L0PP1UKY3x5qLVVr0vgOvQ6o1IqIai"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH 3/6] intc/arm_gic: Add the virtualization
 extensions to the GIC state
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8BbP0g1VMFF6

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VQ3L0PP1UKY3x5qLVVr0vgOvQ6o1IqIai
Content-Type: multipart/mixed; boundary="kQOuRiYNZcKJZ3LQ5soirLPkFI6UgKoMd";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>, Jan Kiszka <jan.kiszka@web.de>
Message-ID: <1425bf1a-1502-b614-ffb1-b261cb24d1de@greensocs.com>
Subject: Re: [PATCH 3/6] intc/arm_gic: Add the virtualization extensions to
 the GIC state
References: <20180606093101.30518-1-luc.michel@greensocs.com>
 <20180606093101.30518-4-luc.michel@greensocs.com>
 <CAFEAcA9Oh+faKrBwDb7LAG=drkQTtbtoOrV_WUqa7twJi974yQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9Oh+faKrBwDb7LAG=drkQTtbtoOrV_WUqa7twJi974yQ@mail.gmail.com>

--kQOuRiYNZcKJZ3LQ5soirLPkFI6UgKoMd
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/11/2018 03:38 PM, Peter Maydell wrote:
> On 6 June 2018 at 10:30,  <luc.michel@greensocs.com> wrote:
>> From: Luc MICHEL <luc.michel@greensocs.com>
>>
>> Add the necessary parts of the virtualization extensions state to the
>> GIC state. We choose to increase the size of the CPU interfaces state =
to
>> add space for the vCPU interfaces (the GIC_NCPU_VCPU macro). This way,=

>> we'll be able to reuse most of the CPU interface code for the vCPUs.
>>
>> The vCPUs are numbered from GIC_NCPU to (GIC_NCPU * 2) - 1. The
>> `gic_is_vcpu` function help to determine if a given CPU id correspond =
to
>> a physical CPU or a virtual one.
>>
>> The GIC VMState is updated to account for this modification. We add a
>> subsection for the virtual interface state. The virtual CPU interfaces=

>> state however cannot be put in the subsection because of some 2D array=
s
>> in the GIC state. This implies an increase in the VMState version id.
>>
>> For the in-kernel KVM VGIC, since the exposed VGIC does not implement
>> the virtualization extensions, we report an error if the corresponding=

>> property is set to true.
>>
>> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
>> ---
>=20
>> +/* Note: We cannot put the vCPUs state in this subsection because of =
some 2D
>> + * arrays that mix CPU and vCPU states. */
>> +static const VMStateDescription vmstate_gic_virt_state =3D {
>> +    .name =3D "arm_gic_virt_state",
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .needed =3D gic_virt_state_needed,
>> +    .fields =3D (VMStateField[]) {
>> +        /* Virtual interface */
>> +        VMSTATE_UINT32_ARRAY(h_hcr, GICState, GIC_NCPU),
>> +        VMSTATE_UINT32_ARRAY(h_misr, GICState, GIC_NCPU),
>> +        VMSTATE_UINT32_2DARRAY(h_lr, GICState, GIC_NR_LR, GIC_NCPU),
>> +        VMSTATE_UINT64_ARRAY(h_eisr, GICState, GIC_NCPU),
>> +        VMSTATE_UINT64_ARRAY(h_elrsr, GICState, GIC_NCPU),
>> +        VMSTATE_UINT32_ARRAY(h_apr, GICState, GIC_NCPU),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>  static const VMStateDescription vmstate_gic =3D {
>>      .name =3D "arm_gic",
>> -    .version_id =3D 12,
>> -    .minimum_version_id =3D 12,
>> +    .version_id =3D 13,
>> +    .minimum_version_id =3D 13,
>=20
> This breaks migration compatibility, which we can't do for the GIC
> (it is used by some KVM VM configs, where we strongly care about
> compatibility).
>=20
>>      .pre_save =3D gic_pre_save,
>>      .post_load =3D gic_post_load,
>>      .fields =3D (VMStateField[]) {
>>          VMSTATE_UINT32(ctlr, GICState),
>> -        VMSTATE_UINT32_ARRAY(cpu_ctlr, GICState, GIC_NCPU),
>> +        VMSTATE_UINT32_ARRAY(cpu_ctlr, GICState, GIC_NCPU_VCPU),
>=20
> If you want to put the VCPU state in the same array as the CPU state
> like this, you need to use subarrays, so here
>            VMSTATE_UINT32_SUB_ARRAY(cpu_ctlr, GICState, 0, GIC_NCPU),
> and in the vmstate_gic_virt_state
>            VMSTATE_UINT32_SUB_ARRAY(cpu_ctlr, GICState, GIC_NCPU, GIC_N=
CPU)
>=20
> Similarly for the other arrays. You'll need a patch adding
> VMSTATE_UINT16_SUB_ARRAY to vmstate.h:
>=20
> #define VMSTATE_UINT16_SUB_ARRAY(_f, _s, _start, _num)                \=

>     VMSTATE_SUB_ARRAY(_f, _s, _start, _num, 0, vmstate_info_uint16, uin=
t16_t)
>=20
>>          VMSTATE_STRUCT_ARRAY(irq_state, GICState, GIC_MAXIRQ, 1,
>>                               vmstate_gic_irq_state, gic_irq_state),
>>          VMSTATE_UINT8_ARRAY(irq_target, GICState, GIC_MAXIRQ),
>>          VMSTATE_UINT8_2DARRAY(priority1, GICState, GIC_INTERNAL, GIC_=
NCPU),
>>          VMSTATE_UINT8_ARRAY(priority2, GICState, GIC_MAXIRQ - GIC_INT=
ERNAL),
>>          VMSTATE_UINT8_2DARRAY(sgi_pending, GICState, GIC_NR_SGIS, GIC=
_NCPU),
>> -        VMSTATE_UINT16_ARRAY(priority_mask, GICState, GIC_NCPU),
>> -        VMSTATE_UINT16_ARRAY(running_priority, GICState, GIC_NCPU),
>> -        VMSTATE_UINT16_ARRAY(current_pending, GICState, GIC_NCPU),
>> -        VMSTATE_UINT8_ARRAY(bpr, GICState, GIC_NCPU),
>> -        VMSTATE_UINT8_ARRAY(abpr, GICState, GIC_NCPU),
>> -        VMSTATE_UINT32_2DARRAY(apr, GICState, GIC_NR_APRS, GIC_NCPU),=

>> +        VMSTATE_UINT16_ARRAY(priority_mask, GICState, GIC_NCPU_VCPU),=

>> +        VMSTATE_UINT16_ARRAY(running_priority, GICState, GIC_NCPU_VCP=
U),
>> +        VMSTATE_UINT16_ARRAY(current_pending, GICState, GIC_NCPU_VCPU=
),
>> +        VMSTATE_UINT8_ARRAY(bpr, GICState, GIC_NCPU_VCPU),
>> +        VMSTATE_UINT8_ARRAY(abpr, GICState, GIC_NCPU_VCPU),
>> +        VMSTATE_UINT32_2DARRAY(apr, GICState, GIC_NR_APRS, GIC_NCPU_V=
CPU),
>=20
> The 2D array is more painful. You need to describe it as a set of
> 1D slices, something like
>            VMSTATE_UINT32_SUB_ARRAY(apr, GICState, 0, GIC_NCPU),
>            VMSTATE_UINT32_SUB_ARRAY(apr, GICState, GIC_NCPU_VCPU, GIC_N=
CPU),
>            VMSTATE_UINT32_SUB_ARRAY(apr, GICState, GIC_NCPU_VCPU * 2, G=
IC_NCPU),
>            [...]
>            VMSTATE_UINT32_SUB_ARRAY(apr, GICState, GIC_NCPU_VCPU * n, G=
IC_NCPU),
> where n is GIC_NR_APRS - 1
>=20
> and then the other slices in the vmstate_gic_virt_state.
>=20
> But conveniently the only 2D array is for the APR registers, which
> you don't actually want to have state for for the virtualization
> extensions anyway. The only state here is in the GICH_APR, and
> (as per the recommendation in the spec in the GICV_APRn documentation)
> the GICV_APRn should just be either RAZ/WI or aliases of GICH_APR,
> with no state of their own to migrate.
>=20
> More generally, there's something odd going on here. The way the
> GIC virtualization extensions are defined, there are registers
> which expose the state to the guest (the GIC virtual CPU interface),
> and there are registers which expose the state to the hypervisor
> (the GIC virtual interface), but the underlying state is identical.
> In the spec all the various fields in the virtual CPU interface
> are defined as aliases to register fields in the virtual interface
> (for instance GICV_PMR is an alias of GICH_VMCR.VMPriMask).
>=20
> So you don't want to be migrating the data twice -- depending on
> the implementation we either hold the state in struct fields that
> look like the CPU interface, and the virtual interface register
> read and write code does the mapping to access the right parts of
> those, or we can do it the other way round and store the state in
> struct fields matching the virtual interface registers, with the
> read and write functions for the virtual CPU interface doing the
> mapping. But we don't want struct fields and migration state
> descriptions for both.
Indeed you are right, h_apr is a leftover that is not used in my
implementation. I use apr[0] of the vCPU interface to store the APR
value. If it's ok like this, I can simply remove h_apr from the struct
and from the virt VMState.

The same goes for h_eisr and h_elrsr, which are in the struct as a
cached data, but that can be recomputed from the LRs, and thus don't
need to be stored in the VMState. In my implementation they are
recomputed in the VMState post_load function.

If you agree with that, I'm going to publish a v2 with migration
compatibility and without those three registers in the VMState.

Thanks,

--=20
Luc

>=20
>>          VMSTATE_UINT32_2DARRAY(nsapr, GICState, GIC_NR_APRS, GIC_NCPU=
),
>>          VMSTATE_END_OF_LIST()
>> +    },
>> +    .subsections =3D (const VMStateDescription * []) {
>> +        &vmstate_gic_virt_state,
>> +        NULL
>>      }
>>  };
>=20
> thanks
> -- PMM
>=20


--kQOuRiYNZcKJZ3LQ5soirLPkFI6UgKoMd--

--VQ3L0PP1UKY3x5qLVVr0vgOvQ6o1IqIai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlsnnIIACgkQd8knW3Qn
Tr55Fw//SOH07R6xhVYn/S8Dyhq36PWCiEbRt6rO/6dEZjl+XkNdLW6zGuNTi2Ut
JJ2sODWilc0lrOvaKYTfyunWjb2CGO9msRFF3ldhmRmQ0/aDj1+/2tA+fjWqdz2/
otSinWUJndfqLH/nNCgm+rSeZsb5Ls9Jcd0AweZ8imSgU2gr3L7UJ+SLGNILUp+j
3egAwQWXqZVjDY+3DAxCVWw54EjLTcwKGa6a2khE4HBTSww9fQJdRKJoTCJq2AkS
+vroPgztoLbGsYu+snZu47EmUNemvewyxJV2jvww0uaRawNBGsX6PRs+Dvz/qt7J
zFxudEn0EulnXay/CgNM3li0jIFnhqbqmM7SYzi9BQV7e9PEsJtIWiwAfQFqQ31R
gKbRHoJzBvsM48T8hxCCeiZJuYc4VZAxpE4FG5k0zp+39KN6uDuI7Hv8pKF96e9T
MiARqK83EIMLAPdyI/E2j6g09nQpF8o4J79o+k+LqLHrEzSOQSjpal6yK6Wdqv8u
BZ3hArdHXFg3OJFKBuFc4cR0C2f0nOCVeMFAwtdf8Ch00qyeiBHeW1+RchjQKoXs
jR6q8JPgqDEsUnLo+aXXeGjf1o8FocY0AJo3jX/qmhU78o4AtxjLIVihqAPLa7IY
GQaOmuaCru6KNcwhxqRlLCXaMGwCGuhoAPxKINhBMlzRcDHYD4w=
=922X
-----END PGP SIGNATURE-----

--VQ3L0PP1UKY3x5qLVVr0vgOvQ6o1IqIai--
