Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1145796ejb;
        Thu, 27 Jul 2023 02:15:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjFvXGa5XgIbITdfgnlhUFDdKUjn6wXIYafSvX9SSGbVJFH6gLC6j/YQ/+NINlI9EXMOAs
X-Received: by 2002:a0c:cb09:0:b0:63c:f835:9497 with SMTP id o9-20020a0ccb09000000b0063cf8359497mr4195733qvk.25.1690449355189;
        Thu, 27 Jul 2023 02:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690449355; cv=none;
        d=google.com; s=arc-20160816;
        b=DqHuvW71DJdexc5/PXYjkaW3xpbLreHwnv/ERcya7b9Oxw5YhPiY0qQ9b8IYBMNJFQ
         ju8yfpwaEYQuFVdPLao9qnxmMcAVJHMGWUbRxiHZQcpa+0jru6Ykb8Ndh5bt68UZqyR3
         kf0AVHymLvuWyQ9WIqNtQgOFUulJWDJuW6RT0gQ2twgCxCUkDb2T3LWcLtbukRWw6eSI
         nn4kui+bnnTPdV98Xb6a+NwgsQcleFVhl5KOWbaWyprfknavWCKWBrT+KvJ5iWYry/WN
         MorkBiXIr5SifIA+Wa9V3UcYEAo69EEWnFKYmkDE2XgEGhvtf3biWNmU0CbsCMI/WV9d
         LuBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=OpWQICC15zqiQ6iRwJN+xxQ51mwjnaio3FedX4pv0j4=;
        fh=Bs5ADiMb3C74nJCu6UgXr+Mvi1gEQnFIlZHke/ym38k=;
        b=Hql7N8NaaFge+6cx/oSVZn87iwjlmparTEUQy5Hg4lLmSga1BkVi3lJa++7pcwlWlc
         MIhHT71YkOQ5eaDUIIc0A0Na5CgoSIeY0RwezBt3TQs6dNy6Pollywh+kFNlFKyc0YMy
         2Fsh8tMDZIfNz1pOUc9GOMAyHS1A759UCzTTayYbjzNS+AURN3dmHn5WG8BV0qGTImQ5
         gJmc2wuxy4QOxfVA3kaCJ2Yq9Qbp/NQr2hFgmufeQxQ07W9bh/Ll0F2NfosXJtp6C8Mi
         Rsq5Qe4ldKwlCZ2mrN3zKttEgJWa85DLsFog6ZuaMGOGPpbgA0semAiQx7OyX5CNoZHk
         45RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jmu9N1GC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17-20020a0cf151000000b0063d1f9b0d68si436775qvl.458.2023.07.27.02.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 02:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jmu9N1GC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOwri-0004xV-RY; Thu, 27 Jul 2023 05:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qOwrH-0004sC-Fw
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 05:00:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qOwrA-0001x9-Ik
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 05:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690448416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpWQICC15zqiQ6iRwJN+xxQ51mwjnaio3FedX4pv0j4=;
 b=Jmu9N1GCZFB9Z/uOGB/11t2JP2AkkmqMEwDCt4zXu9bivbHI/0ua/JWIW8dquM57vKkMRe
 oyFe14KzYDZQOoqLGAC/0bdRlDW/DjvTD/OS2T+b1grhZJkngmC8qBkHHovNnGicH2hoyN
 w5rKAD5v/9kMMsZv60Xh07HD3LuuKSk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-pnYLUnkKOSuybufMZY06rQ-1; Thu, 27 Jul 2023 05:00:14 -0400
X-MC-Unique: pnYLUnkKOSuybufMZY06rQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a34a0b75eso38341966b.1
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 02:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690448413; x=1691053213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIOUAqec2ai+bF4m9iE4uRYJI7OqolLwWd/I4cEPUSQ=;
 b=LcaWoR1FJQqEmmnGCb/1SnTV3rbpLgz4cfE8+thHe1moHaWhg4K+pF70O8WhW31dMs
 n/y6BAw+A4FGVMuIiV/DsuBE4wd3drUaI4L2Jcxzur10X4GusZlUeFTcvwiqzx9bAhDr
 7yXMmAy+DXqO3qgR+BMo/AX3bzxTgVr1m7DUH3R2XCWaQqy3A1T2Q1QTIGGM0/0GrsLn
 dfVU3+SctgTwlHJg3wVb3lH3tqBWhdA3OivxdXzq3oyU7I0+CNHUPPZT4nANCaGDNqJL
 ei1DPGr4Bn3NjqMWYAhkfnlbNebDFyb22enW6yNULBv5/oO2ueV4NidACiYqIXry5XpY
 RUDQ==
X-Gm-Message-State: ABy/qLbBVP2Hx4eqbAO8mv9SznPnypzkKOmaDrTnCNB23XQAR7lqZsN7
 mgC4dbStzmuOqZ5Si4rlvb5zayV+XwO9qbak/EW1JGOJyCsx7j0u+AfmrQJTTcZ4fxFbt39riRp
 iG7oF9xG0LvlG
X-Received: by 2002:a17:906:3096:b0:994:5350:5a2b with SMTP id
 22-20020a170906309600b0099453505a2bmr1324633ejv.62.1690448413302; 
 Thu, 27 Jul 2023 02:00:13 -0700 (PDT)
X-Received: by 2002:a17:906:3096:b0:994:5350:5a2b with SMTP id
 22-20020a170906309600b0099453505a2bmr1324581ejv.62.1690448412956; 
 Thu, 27 Jul 2023 02:00:12 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 b14-20020a1709062b4e00b00992acab8c45sm531854ejg.12.2023.07.27.02.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 02:00:12 -0700 (PDT)
Date: Thu, 27 Jul 2023 11:00:10 +0200
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
Message-ID: <20230727110010.648b61a6@imammedo.users.ipa.redhat.com>
In-Reply-To: <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
 <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
 <0454c1ad-314c-3df6-d6e9-1a05cb4c4050@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: IoibeukNntSx

On Thu, 27 Jul 2023 15:16:18 +1000
Gavin Shan <gshan@redhat.com> wrote:

> On 7/27/23 09:08, Richard Henderson wrote:
> > On 7/25/23 17:32, Gavin Shan wrote: =20
> >> -static const char *q800_machine_valid_cpu_types[] =3D {
> >> +static const char * const q800_machine_valid_cpu_types[] =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 M68K_CPU_TYPE_NAME("m68040"),
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
> >> =C2=A0 };
> >> +static const char * const q800_machine_valid_cpu_models[] =3D {
> >> +=C2=A0=C2=A0=C2=A0 "m68040",
> >> +=C2=A0=C2=A0=C2=A0 NULL
> >> +}; =20
> >=20
> > I really don't like this replication.
> >  =20
>=20
> Right, it's going to be lots of replications, but gives much flexibility.
> There are 21 targets and we don't have fixed pattern for the mapping betw=
een
> CPU model name and CPU typename. I'm summarizing the used patterns like b=
elow.
>=20
>    1 All CPU model names are mappinged to fixed CPU typename;

        plainly spelled it would be: cpu_model name ignored and
        a cpu type is returned anyways.

I'd make this hard error right away, as "junk in =3D> error out"
it's clearly user error. I think we don't even have to follow
deprecation process for that.

>    2 CPU model name is same to CPU typename;
>    3 CPU model name is alias to CPU typename;
>    4 CPU model name is prefix of CPU typename;

and some more:
    5. cpu model names aren't names at all sometimes, and some other
       CPU property is used. (ppc)
This one I'd prefer to get rid of and ppc handling more consistent
with other targets, which would need PPC folks to persuaded to drop
PVR lookup.

>=20
>    Target         Categories    suffix-of-CPU-typename
>    -------------------------------------------------------
>    alpha          -234          -alpha-cpu
>    arm            ---4          -arm-cpu
>    avr            -2--
>    cris           --34          -cris-cpu
>    hexagon        ---4          -hexagon-cpu
>    hppa           1---
>    i386           ---4          -i386-cpu
>    loongarch      -2-4          -loongarch-cpu
>    m68k           ---4          -m68k-cpu
>    microblaze     1---
>    mips           ---4          -mips64-cpu  -mips-cpu
>    nios2          1---
>    openrisc       ---4          -or1k-cpu
>    ppc            --34          -powerpc64-cpu  -powerpc-cpu
>    riscv          ---4          -riscv-cpu
>    rx             -2-4          -rx-cpu
>    s390x          ---4          -s390x-cpu
>    sh4            --34          -superh-cpu
>    sparc          -2--
>    tricore        ---4          -tricore-cpu
>    xtensa         ---4          -xtensa-cpu
>=20
> There are several options as below. Please let me know which one or somet=
hing
> else is the best.
>=20
> (a) Keep what we have and use mc->valid_{cpu_types, cpu_models}[] to trac=
k
> the valid CPU typenames and CPU model names.
>=20
> (b) Introduce CPUClass::model_name_by_typename(). Every target has their =
own
> implementation to convert CPU typename to CPU model name. The CPU model n=
ame
> is parsed from mc->valid_cpu_types[i].
>=20
>      char *CPUClass::model_by_typename(const char *typename);
>=20
> (c) As we discussed before, use mc->valid_cpu_type_suffix and mc->valid_c=
pu_models
> because the CPU type check is currently needed by target arm/m68k/riscv w=
here we
> do have fixed pattern to convert CPU model names to CPU typenames. The CP=
U typename
> is comprised of CPU model name and suffix. However, it won't be working w=
hen the CPU
> type check is required by other target where we have patterns other than =
this.

none of above is really good, that's why I was objecting to introducing
reverse type->name mapping. That ends up with increased amount junk,
and it's not because your patches are bad, but because you are trying
to deal with cpu model names (which is a historically evolved mess).
The best from engineering POV would be replacing CPU models with
type names.

Even though it's a bit radical, I very much prefer replacing
cpu_model names with '-cpu type'usage directly. Making it
consistent with -device/other interfaces and coincidentally that
obsoletes need in reverse name mapping.

It's painful for end users who will need to change configs/scripts,
but it's one time job. Additionally from QEMU pov, codebase
will be less messy =3D> more maintainable which benefits not only
developers but end-users in the end.

[rant:
It's the same story repeating over and over, when it comes to
changing QEMU CLI, which hits resistance wall. But with QEMU
deprecation process we've changed CLI behavior before,
despite of that world didn't cease to exist and users
have adapted to new QEMU and arguably QEMU became a tiny
bit more maintainable since we don't have to deal some
legacy behavior.
]

Another idea back in the days was (as a compromise),
 1. keep using keep valid_cpu_types
 2. instead of introducing yet another way to do reverse mapping,
    clean/generalize/make it work everywhere list_cpus (which
    already does that mapping) and then use that to do your thing.
    It will have drawbacks you've listed above, but hopefully
    that will clean up and reuse existing list_cpus.
    (only this time, I'd build it around  query-cpu-model-expansion,
     which output is used by generic list_cpus)
    [and here I'm asking to rewrite directly unrelated QEMU part yet again]

> Thanks,
> Gavin
>=20

