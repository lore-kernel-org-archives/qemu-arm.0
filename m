Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4939189ejc;
        Thu, 31 Aug 2023 02:03:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVXVDDn50mJQK0nmAsUfPVDZ15R2dQhOBy+CVw6/NdILW0JxFPQIBXhP2mjE7YunaqS22c
X-Received: by 2002:a05:6358:7f1e:b0:134:d467:b751 with SMTP id p30-20020a0563587f1e00b00134d467b751mr5219180rwn.21.1693472594599;
        Thu, 31 Aug 2023 02:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693472594; cv=none;
        d=google.com; s=arc-20160816;
        b=qd9UoIPxXibQpKdJJaoQ7Luv/0zKZ9aavMdPWZvD8mDarCRIveaJPU4zWIJ0A1Jelx
         kU5lakT7OsP76ewXd1UfCKm+IKNkVcVVSB3u5S8hBXhICGHGIN7NWfD0Qlr9P+Ez46wH
         75EOd/kIsDV7sHrMEbbj0OYPYLao5lrKjMeJHTzpzyRuHg117E+0rbZREkntCzVKzGEd
         T04USnRb4u9vbVto/FnpAnveilTSOCOHsbjC8pTaMW66btcJuT0YDNPkREnFvbE+uv69
         9zJSagR0zANkEupqSqabr7tSLsxaMWkJnfiUpKrntklC2qSbMRSFBQfQ5UmA8ncuprJ3
         xdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=PFxY6jEvHJCryW5f1S47Of0s/GN9d09biA1VDvRj7WE=;
        fh=wmP5c033XC5dZzckwNhldMWgZl8Zf61zYOtlvg1B/+o=;
        b=zyUsgQuj3Kax+jrasrxJfrCk0I+S4zAltBCmZmLh3Q2/W3NfHAObSL/33Xu8pODo28
         3FQ+C5GDlGVGETl/IN7i29Xi9L0LUkiJvWOPjv2W59VpwPoJCOxUoibfPk2SDA27wGdF
         2/QOlcTLAm0uQ0Q4a+FS3SmLnZXbd02uLJ6pDhfxUd28LCd9zJpILQjGTB/wBT+j3ePS
         ajyF1qG6ZCcKvNNoDsjOp88L7XckoFK5/ECkXzob4voxw278AhYwwTaQiZ0wPL8w0x1T
         u1eOTEW7mHHhhNO+RmpyVXTVr82ytDaj/dtGHbuPvoJOx4nB7+3GzQ6KdmA/7KOzFmIn
         ppOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I1609Fxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de36-20020a05620a372400b0076db1b23b27si581920qkb.715.2023.08.31.02.03.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 02:03:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I1609Fxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbdZN-000412-UQ; Thu, 31 Aug 2023 05:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qbdZE-0003zR-W7
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 05:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qbdZA-00077v-Pl
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 05:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693472531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFxY6jEvHJCryW5f1S47Of0s/GN9d09biA1VDvRj7WE=;
 b=I1609FxgzCeZaMscMHG8iAG6tKWlyVtjwasklwb9zYyfU24moF1JDMfjl4fHSj6wDvEmFM
 8DKl63slaqCr0W/8qO+qgNPV+6OphHilGm5QEiq8g565t2UKDqtFXcpUgrmgrmAcKwoJBk
 OcCa2lDg1QxYFM9mIaKR0sgvuSmOyss=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-NFsV3eL5MPqlfU6YPrZKSg-1; Thu, 31 Aug 2023 05:02:09 -0400
X-MC-Unique: NFsV3eL5MPqlfU6YPrZKSg-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-518676b6d09so439773a12.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 02:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693472528; x=1694077328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NC2DazyaP/wuw++05qPLMfoOTSxXfaGBP7yIljDNAIM=;
 b=A3eihJJPwrSJqNJFUTi5NgZwcHRBG2hq1miB33HaoJ3dNSXe4TlLcwy5+jrqpL47At
 Xmx2YUbuJgqyMTGfghtDDGDeEqLbYLZJ+NfhF0xLmIVwrjkS2SckrJJUyrQYB2MclMQz
 rII32mbzFd6Nf3UpA9bDTYzatzbdINwgNVXTfTX9z0kPe9huA0jk2DDxrUCqnHTnVcPL
 ylO3uxhFvgh6V2lYN27mLjjIM9syF7D/rIoehCeUdEXOrV73/K/KRKYSsKLXPRkYtuys
 ce8a5tJTqk2Ymyeyh25CFUDOoMzphPz/PyiCDoMJGAyBjV2IdmYW7JhH0USUbOz7BFQw
 O/ow==
X-Gm-Message-State: AOJu0YxqX/mRtiFaaBJNPIgFEo4vwtcdT5raPKPcD4OLt8sc+cNvQCRX
 zU4pYX9JgbnS6bAQPiyBLg007LyCMW0KVVFSh3AbjxOnyhPPPD27cmrurdO4gqAmKzQda2s2T8b
 kDBUn41nxWuKQ
X-Received: by 2002:aa7:c6ce:0:b0:51e:362d:b172 with SMTP id
 b14-20020aa7c6ce000000b0051e362db172mr3267143eds.32.1693472528414; 
 Thu, 31 Aug 2023 02:02:08 -0700 (PDT)
X-Received: by 2002:aa7:c6ce:0:b0:51e:362d:b172 with SMTP id
 b14-20020aa7c6ce000000b0051e362db172mr3267102eds.32.1693472527928; 
 Thu, 31 Aug 2023 02:02:07 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 x2-20020aa7dac2000000b005272523b162sm539053eds.69.2023.08.31.02.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 02:02:07 -0700 (PDT)
Date: Thu, 31 Aug 2023 11:02:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, cohuck@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
Message-ID: <20230831110205.27447fac@imammedo.users.ipa.redhat.com>
In-Reply-To: <a5a61f17-6792-fd53-e48b-aa9ab8fae803@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
 <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
 <20230727110010.648b61a6@imammedo.users.ipa.redhat.com>
 <5f26299e-f1e0-a2ab-db83-87011fe524d5@redhat.com>
 <20230828164637.52c2b5b0@imammedo.users.ipa.redhat.com>
 <6e637717-b739-3ee8-ac12-a339ea5fb166@redhat.com>
 <20230829110308.5282936f@imammedo.users.ipa.redhat.com>
 <a5a61f17-6792-fd53-e48b-aa9ab8fae803@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: nBPAre8oAxSW

On Wed, 30 Aug 2023 17:34:12 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Hi Igor,
>=20
> On 8/29/23 19:03, Igor Mammedov wrote:
> > On Tue, 29 Aug 2023 16:28:45 +1000
> > Gavin Shan <gshan@redhat.com> wrote: =20
> >> On 8/29/23 00:46, Igor Mammedov wrote: =20
> >>> On Mon, 31 Jul 2023 15:07:30 +1000
> >>> Gavin Shan <gshan@redhat.com> wrote: =20
> >>>> On 7/27/23 19:00, Igor Mammedov wrote: =20
> >>>>> On Thu, 27 Jul 2023 15:16:18 +1000
> >>>>> Gavin Shan <gshan@redhat.com> wrote:
> >>>>>        =20
> >>>>>> On 7/27/23 09:08, Richard Henderson wrote: =20
> >>>>>>> On 7/25/23 17:32, Gavin Shan wrote: =20
> >>>>>>>> -static const char *q800_machine_valid_cpu_types[] =3D {
> >>>>>>>> +static const char * const q800_machine_valid_cpu_types[] =3D {
> >>>>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M68K_CPU_TYPE_NAME("m68040"),
> >>>>>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
> >>>>>>>>    =C2=A0 };
> >>>>>>>> +static const char * const q800_machine_valid_cpu_models[] =3D {
> >>>>>>>> +=C2=A0=C2=A0=C2=A0 "m68040",
> >>>>>>>> +=C2=A0=C2=A0=C2=A0 NULL
> >>>>>>>> +}; =20
> >>>>>>>
> >>>>>>> I really don't like this replication.
> >>>>>>>           =20
> >>>>>>
> >>>>>> Right, it's going to be lots of replications, but gives much flexi=
bility.
> >>>>>> There are 21 targets and we don't have fixed pattern for the mappi=
ng between
> >>>>>> CPU model name and CPU typename. I'm summarizing the used patterns=
 like below.
> >>>>>>
> >>>>>>       1 All CPU model names are mappinged to fixed CPU typename; =
=20
> >>>>>
> >>>>>            plainly spelled it would be: cpu_model name ignored and
> >>>>>            a cpu type is returned anyways.
> >>>>>
> >>>>> I'd make this hard error right away, as "junk in =3D> error out"
> >>>>> it's clearly user error. I think we don't even have to follow
> >>>>> deprecation process for that.
> >>>>>        =20
> >>>>
> >>>> Right, It's not expected behavior to map ambiguous CPU model names t=
o
> >>>> the fixed CPU typename. =20
> >>>
> >>> to be nice we can deprecate those and then later remove.
> >>> (while deprecating make those targets accept typenames)
> >>>     =20
> >>
> >> Lets put it aside for now and revisit it later, so that we can focus o=
n
> >> the conversion from the CPU type name to the CPU model name for now.
> >> =20
> >>>>    =20
> >>>>>>       2 CPU model name is same to CPU typename;
> >>>>>>       3 CPU model name is alias to CPU typename;
> >>>>>>       4 CPU model name is prefix of CPU typename; =20
> >>>>>
> >>>>> and some more:
> >>>>>        5. cpu model names aren't names at all sometimes, and some o=
ther
> >>>>>           CPU property is used. (ppc)
> >>>>> This one I'd prefer to get rid of and ppc handling more consistent
> >>>>> with other targets, which would need PPC folks to persuaded to drop
> >>>>> PVR lookup.
> >>>>>        =20
> >>>>
> >>>> I put this into class 3, meaning the PVRs are regarded as aliases to=
 CPU
> >>>> typenames. =20
> >>>
> >>> with PPC using 'true' aliases, -cpu input is lost after it's translat=
ed into typename.
> >>> (same for alpha)
> >>>
> >>> it also adds an extra fun with 'max' cpu model but that boils down to=
 above statement.
> >>> (same for
> >>>     * sh4
> >>>     * cris(in user mode only, but you are making sysemu extension, so=
 it doesn't count)
> >>> )
> >>> For this class of aliases reverse translation won't yield the same
> >>> result as used -cpu. The only option you have is to store -cpu cpu_mo=
del
> >>> somewhere (use qemu_opts??, and then fetch it later to print in error=
 message)
> >>>
> >>> x86 has 'aliases' as well, but in reality it creates distinct cpu typ=
es
> >>> for each 'alias', so it's possible to do reverse translation.
> >>>     =20
> >>
> >> It's true that '-cpu input' gets lost in these cases. However, the CPU=
 type
> >> name instead of the CPU model name is printed in the error message whe=
n the
> >> CPU type is validated in hw/core/machine.c::machine_run_board_init(). =
It looks
> >> good to me to print the CPU type name instead of the model name there.=
 =20
> >=20
> > It's the same confusing whether it's type or cpumodel it it doesn't mat=
ch
> > user provided value.
> >  =20
>=20
> I tend to agree that it's misleading to print the CPU type name in the
> error message in hw/core/machine.c::machine_run_board_init(), where the C=
PU
> type is validated. qemu_opts may be too heavy for this. It eventually tur=
ns
> to a machine's property if @machine_opts_dict is the best place to store
> '-cpu input'. Besides, it doesn't fit for another case very well, where
> current_machine->cpu_type =3D machine_class->default_cpu_type if '-cpu in=
put'
> isn't provided by user.
>=20
> For simplicity, how about to add MachineState::cpu_model? It's initialize=
d to
> cpu_model_from_type(machine_class->default_cpu_type) in qemu_init(), or
> g_strdump(model_pieces[0) in parse_cpu_option().

I'd prefer not bringing cpu_model back to device models
(Machine in this case) after getting rid of it.


> >> Another error message is printed when the CPU model specified in '-cpu=
 input'
> >> isn't valid. The CPU model has been printed and it looks good either.
> >>
> >>     # qemu-system-aarch64 -M virt -cpu aaa
> >>     qemu-system-aarch64: unable to find CPU model 'aaa'
> >>
> >> Are there other cases I missed where we need to print the CPU model na=
me, which
> >> is specified by user through '-cpu input'?
> >> =20
> >>>>>>
> >>>>>>       Target         Categories    suffix-of-CPU-typename
> >>>>>>       -------------------------------------------------------
> >>>>>>       alpha          -234          -alpha-cpu
> >>>>>>       arm            ---4          -arm-cpu
> >>>>>>       avr            -2--
> >>>>>>       cris           --34          -cris-cpu
> >>>>>>       hexagon        ---4          -hexagon-cpu
> >>>>>>       hppa           1---
> >>>>>>       i386           ---4          -i386-cpu
> >>>>>>       loongarch      -2-4          -loongarch-cpu
> >>>>>>       m68k           ---4          -m68k-cpu
> >>>>>>       microblaze     1---
> >>>>>>       mips           ---4          -mips64-cpu  -mips-cpu
> >>>>>>       nios2          1---
> >>>>>>       openrisc       ---4          -or1k-cpu
> >>>>>>       ppc            --34          -powerpc64-cpu  -powerpc-cpu
> >>>>>>       riscv          ---4          -riscv-cpu
> >>>>>>       rx             -2-4          -rx-cpu
> >>>>>>       s390x          ---4          -s390x-cpu
> >>>>>>       sh4            --34          -superh-cpu
> >>>>>>       sparc          -2-- =20
> >>>
> >>> it's case 4
> >>>     =20
> >>
> >> Yes.
> >> =20
> >>>>>>       tricore        ---4          -tricore-cpu
> >>>>>>       xtensa         ---4          -xtensa-cpu
> >>>>>>
> >>>>>> There are several options as below. Please let me know which one o=
r something
> >>>>>> else is the best.
> >>>>>>
> >>>>>> (a) Keep what we have and use mc->valid_{cpu_types, cpu_models}[] =
to track
> >>>>>> the valid CPU typenames and CPU model names.
> >>>>>>
> >>>>>> (b) Introduce CPUClass::model_name_by_typename(). Every target has=
 their own
> >>>>>> implementation to convert CPU typename to CPU model name. The CPU =
model name
> >>>>>> is parsed from mc->valid_cpu_types[i].
> >>>>>>
> >>>>>>         char *CPUClass::model_by_typename(const char *typename);
> >>>>>>
> >>>>>> (c) As we discussed before, use mc->valid_cpu_type_suffix and mc->=
valid_cpu_models
> >>>>>> because the CPU type check is currently needed by target arm/m68k/=
riscv where we
> >>>>>> do have fixed pattern to convert CPU model names to CPU typenames.=
 The CPU typename
> >>>>>> is comprised of CPU model name and suffix. However, it won't be wo=
rking when the CPU
> >>>>>> type check is required by other target where we have patterns othe=
r than this. =20
> >>>>>
> >>>>> none of above is really good, that's why I was objecting to introdu=
cing
> >>>>> reverse type->name mapping. That ends up with increased amount junk=
,
> >>>>> and it's not because your patches are bad, but because you are tryi=
ng
> >>>>> to deal with cpu model names (which is a historically evolved mess)=
.
> >>>>> The best from engineering POV would be replacing CPU models with
> >>>>> type names.
> >>>>>
> >>>>> Even though it's a bit radical, I very much prefer replacing
> >>>>> cpu_model names with '-cpu type'usage directly. Making it
> >>>>> consistent with -device/other interfaces and coincidentally that
> >>>>> obsoletes need in reverse name mapping.
> >>>>>
> >>>>> It's painful for end users who will need to change configs/scripts,
> >>>>> but it's one time job. Additionally from QEMU pov, codebase
> >>>>> will be less messy =3D> more maintainable which benefits not only
> >>>>> developers but end-users in the end.
> >>>>>        =20
> >>>>
> >>>> I have to clarify the type->model mapping has been existing since th=
e
> >>>> model->type mapping was introduced with the help of CPU_RESOLVING_TY=
PE.
> >>>> I mean the logic has been existing since the existence of CPU_RESOLV=
ING_TYPE,
> >>>> even the code wasn't there.
> >>>>
> >>>> I'm not sure about the idea to switch to '-cpu <cpu-type-name>' sinc=
e
> >>>> it was rejected by Peter Maydell before. Hope Peter can double confi=
rm
> >>>> for this. For me, the shorter name is beneficial. For example, users
> >>>> needn't to have '-cpu host-arm-cpu' for '-cpu host'.
> >>>>
> >>>>    =20
> >>>>> [rant:
> >>>>> It's the same story repeating over and over, when it comes to
> >>>>> changing QEMU CLI, which hits resistance wall. But with QEMU
> >>>>> deprecation process we've changed CLI behavior before,
> >>>>> despite of that world didn't cease to exist and users
> >>>>> have adapted to new QEMU and arguably QEMU became a tiny
> >>>>> bit more maintainable since we don't have to deal some
> >>>>> legacy behavior.
> >>>>> ]
> >>>>>        =20
> >>>>
> >>>> I need more context about 'deprecation process' here. My understandi=
ng
> >>>> is both CPU typename and model name will be accepted for a fixed per=
iod
> >>>> of time. However, a warning message will be given to indicate that t=
he
> >>>> model name will be obsoleted soon. Eventually, we switch to CPU type=
name
> >>>> completely. Please correct me if there are anything wrong. =20
> >>>
> >>> yep, that's the gist of deprecation in this case.
> >>>     =20
> >>
> >> Ok. Thanks for your confirm.
> >>      =20
> >>>>> Another idea back in the days was (as a compromise),
> >>>>>     1. keep using keep valid_cpu_types
> >>>>>     2. instead of introducing yet another way to do reverse mapping=
,
> >>>>>        clean/generalize/make it work everywhere list_cpus (which
> >>>>>        already does that mapping) and then use that to do your thin=
g.
> >>>>>        It will have drawbacks you've listed above, but hopefully
> >>>>>        that will clean up and reuse existing list_cpus.
> >>>>>        (only this time, I'd build it around  query-cpu-model-expans=
ion,
> >>>>>         which output is used by generic list_cpus)
> >>>>>        [and here I'm asking to rewrite directly unrelated QEMU part=
 yet again]
> >>>>>        =20
> >>>>
> >>>> I'm afraid that list_cpus() is hard to be reused. All available CPU =
model names
> >>>> are listed by list_cpus(). mc->valid_cpu_types[] are just part of th=
em and variable
> >>>> on basis of boards. Generally speaking, we need a function to do rev=
erse things
> >>>> as to CPUClass::class_by_name(). So I would suggest to introduce CPU=
Class::model_from_type(),
> >>>> as below. Could you please suggest if it sounds reasonable to you?
> >>>>
> >>>> - CPUClass::class_by_name() is modified to
> >>>>      char *CPUClass::model_to_type(const char *model)
> >>>>
> >>>> - char *CPUClass::type_to_model(const char *type)
> >>>>
> >>>> - CPUClass::type_to_model() is used in cpu_list() for every target w=
hen CPU
> >>>>      model name, fetched from CPU type name, is printed in xxx_cpu_l=
ist_entry()
> >>>>
> >>>> - CPUClass::type_to_model() is reused in hw/core/machine.c to get th=
e CPU
> >>>>      model name from CPU type names in mc->valid_cpu_types[]. =20
> >>>
> >>> instead of per target hooks (which are atm mostly open-coded in sever=
al places)
> >>> how about adding generic handler for cases 2,4:
> >>>     cpu_type_to_model(typename)
> >>>        cpu_suffix =3D re'-*-cpu'
> >>>        if (class_exists(typename - cpu_suffix))
> >>>            return typename - cpu_suffix
> >>>        else if (class_exists(typename))
> >>>            return typename
> >>>        explode
> >>>
> >>> that should work for translating valid_cpus typenames to cpumodel nam=
es
> >>> and once that in place cleanup all open-coded translations with it tr=
ee-wide
> >>>
> >>> you can find those easily by:
> >>> git grep _CPU_TYPE_SUFFIX
> >>> git grep query_cpu_definitions
> >>>     =20
> >>
> >> Thanks for the advice. I think it's enough for now since the CPU type
> >> invalidation is currently done for arm/mips/riscv for now. On these
> >> targets, the CPU type name is always the combination of the CPU model
> >> name and suffix. I will add helper qemu/cpu.c::cpu_model_by_name() =20
> >=20
> > cpu_model_from_type() would be describe what function does better.
> >  =20
>=20
> Agreed, thanks.
>=20
> >> as you suggested. Note that, the suffix can be gained by ("-" CPU_RESO=
LVING_TYPE)
> >>
> >> Yes, the newly added helper cpu_model_by_name() needs to be applied
> >> to targets where query_cpu_definitions and cpu_list are defined. =20
>=20
> Thanks,
> Gavin
>=20

