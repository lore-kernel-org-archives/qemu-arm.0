Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp722412lfc;
        Fri, 17 Dec 2021 06:31:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDA+NEpwnFy+KxRPfbmn7DA/tOw+HQEU5Te5tQKuCikpuiDNwwC9lBtGbs6ixITsMZMnxn
X-Received: by 2002:a05:6214:19e1:: with SMTP id q1mr1259457qvc.115.1639751476450;
        Fri, 17 Dec 2021 06:31:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639751476; cv=none;
        d=google.com; s=arc-20160816;
        b=wDmjw7EKShgjF012v6Qo8hExrkUFUsbnjWUcqZv4ie9cLdsZN2srN8ub7uXwqEbfVw
         9HH7nEFmZWpGkc/7/VFJZ6+vCYtGgSLlu91ps4+m0dSoU4Dqm7V/hORIBDunLEeHQeMn
         ATz8RciN5CiHgzoQ0ZA0Z9NEKdk5XfJvBGhMUwHrrSQKdeXkLY08f+KXBDX8F5I/7786
         Yk/X9mACWGcGN2B05hW0yUFEGP+7L0x8CSm25MKDWcNa3VHkgWjgv77xiNhiNuZx6bPH
         iyMgGACn8TLbk1L/id9KwfZVt7VwKyRcaZRpPqEEB8Af4OPscUkGF+ukJsMlmpNztK/C
         0tdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:to:from:dkim-signature;
        bh=Dynv5zhBoDUNox9BIpX7PpZYCe6PblWO3JxeNjCS+8I=;
        b=xiEwad1poKJhRPoBCM6hePcRR2VoOsYn6rZ084X8MRfr/yOubuB2MA8K1r6CN/3i1u
         TAvvwuwIUw77wE9Vmxm7Xzb05KTerig0L0bseby62afQhwlLFsFqHtAv8SA974aExb5v
         kTAzngmVjIn0N9xjw/VKPBNBeJY7q60Tf/eV49py8d/UTOS3sUygSnuwVW3OnG5Jo19E
         N/+mBfE5tW+wPJozWmoyCHl7xT9JMHvmIlhyih43uYEyNc2vHb9OsPqob5Chf0aCSIyU
         per9Eou+1rwLp/LelqoTAIJk+K4XAOhi3Yk8v+9T4b5uvpVov13X9MQbuXgQNDO7eK7/
         F+tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Fvkj5mL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si3926978qtx.512.2021.12.17.06.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 06:31:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Fvkj5mL1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myEGR-0005W0-PC
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 09:31:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1myEFh-0005Tf-Eq
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 09:30:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1myEFc-0005fY-DT
 for qemu-arm@nongnu.org; Fri, 17 Dec 2021 09:30:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639751422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dynv5zhBoDUNox9BIpX7PpZYCe6PblWO3JxeNjCS+8I=;
 b=Fvkj5mL1/3BfVsQ5OPSg4/VYXj0NR9WrALeMiWzzn7WE7UGhzooK/WDE4STc1Nbk1RHtV/
 UkUufXU/9BqHMZ3HQHJhvMi2fal3GTSvEAurvKqxTjJ6jsmHERbMln2Iw5RgRJnsgNgIcV
 TnPJZBLl2177cjSuxsvGhDyBzxK6dV4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-IWTle6i_P1iMYfnHy3EbTw-1; Fri, 17 Dec 2021 09:30:19 -0500
X-MC-Unique: IWTle6i_P1iMYfnHy3EbTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5567102CC54;
 Fri, 17 Dec 2021 14:30:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E33D74BC72;
 Fri, 17 Dec 2021 14:29:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
In-Reply-To: <YbyR1C+77+moWF/O@redhat.com>
Organization: Red Hat GmbH
References: <20211208170241.110551-1-cohuck@redhat.com>
 <87lf0jr6m4.fsf@redhat.com> <YbyR1C+77+moWF/O@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Fri, 17 Dec 2021 15:29:13 +0100
Message-ID: <87fsqrqp8m.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Bhu9+huH/Wv

On Fri, Dec 17 2021, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, Dec 17, 2021 at 09:13:55AM +0100, Cornelia Huck wrote:
>> On Wed, Dec 08 2021, Cornelia Huck <cohuck@redhat.com> wrote:
>>=20
>> > Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
>> >
>> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> > ---
>> >  hw/arm/virt.c              |  9 ++++++++-
>> >  hw/core/machine.c          |  3 +++
>> >  hw/i386/pc.c               |  3 +++
>> >  hw/i386/pc_piix.c          | 14 +++++++++++++-
>> >  hw/i386/pc_q35.c           | 13 ++++++++++++-
>> >  hw/ppc/spapr.c             | 15 +++++++++++++--
>> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>> >  include/hw/boards.h        |  3 +++
>> >  include/hw/i386/pc.h       |  3 +++
>> >  9 files changed, 71 insertions(+), 6 deletions(-)
>> >
>>=20
>
>
>> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> > index 223dd3e05d15..b03026bf0648 100644
>> > --- a/hw/i386/pc_piix.c
>> > +++ b/hw/i386/pc_piix.c
>> > @@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass=
 *m)
>> >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>> >  }
>> > =20
>> > -static void pc_i440fx_6_2_machine_options(MachineClass *m)
>> > +static void pc_i440fx_7_0_machine_options(MachineClass *m)
>> >  {
>> >      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>> >      pc_i440fx_machine_options(m);
>> > @@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(Machine=
Class *m)
>> >      pcmc->default_cpu_version =3D 1;
>> >  }
>> > =20
>> > +DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
>> > +                      pc_i440fx_7_0_machine_options);
>> > +
>> > +static void pc_i440fx_6_2_machine_options(MachineClass *m)
>> > +{
>> > +    pc_i440fx_machine_options(m);
>
> Needs to be pc_i440fx_7_0_machine_options()
>
>> > +    m->alias =3D NULL;
>> > +    m->is_default =3D false;
>> > +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_le=
n);
>> > +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_le=
n);
>> > +}
>> > +
>> >  DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
>> >                        pc_i440fx_6_2_machine_options);
>> > =20
>> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> > index e1e100316d93..6b66eb16bb64 100644
>> > --- a/hw/i386/pc_q35.c
>> > +++ b/hw/i386/pc_q35.c
>> > @@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m=
)
>> >      m->max_cpus =3D 288;
>> >  }
>> > =20
>> > -static void pc_q35_6_2_machine_options(MachineClass *m)
>> > +static void pc_q35_7_0_machine_options(MachineClass *m)
>> >  {
>> >      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
>> >      pc_q35_machine_options(m);
>> > @@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineCla=
ss *m)
>> >      pcmc->default_cpu_version =3D 1;
>> >  }
>> > =20
>> > +DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
>> > +                   pc_q35_7_0_machine_options);
>> > +
>> > +static void pc_q35_6_2_machine_options(MachineClass *m)
>> > +{
>> > +    pc_q35_machine_options(m);
>
> Needs to be pc_q35_7_0_machine_options()
>
>> > +    m->alias =3D NULL;
>> > +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_le=
n);
>> > +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_le=
n);
>> > +}
>> > +
>> >  DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
>> >                     pc_q35_6_2_machine_options);
>> > =20
>>=20
>> So, this apparently causes some problems with one of the avocado tests:
>>=20
>> 162-tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_=
alias -> AssertionError: None !=3D 'Cascadelake-Server-v1' : Cascadelake-Se=
rver must be an alias of Cascadelake-Server-v1
>>=20
>> (full output at https://gitlab.com/qemu-project/qemu/-/jobs/1893456217)
>>=20
>> I have looked at the patch again and do not see what might be wrong (has
>> something changed with the cpu model versioning recently?)
>>=20
>> Does anyone else (especially the x86 folks) have an idea?
>
> AFAICT, just a typo in chaining up the methods I've pointed out inline.

Duh, indeed. Thanks for spotting this.

Will send a v2.

