Received: by 10.223.172.38 with SMTP id v35csp1560997wrc;
        Tue, 5 Sep 2017 08:35:29 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6ZzwxB+CSZK41KaWtjvevukHkXxbAir5eL3c6iDM2feOv2eSHg6yqAb8edzcM6QRRE20IF
X-Received: by 10.55.3.67 with SMTP id 64mr5441355qkd.307.1504625729427;
        Tue, 05 Sep 2017 08:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504625729; cv=none;
        d=google.com; s=arc-20160816;
        b=D2TmSERW/7N9pYD+rVgcdLqCToYmCQ1dRqyUSQ8lmzmRtueA+BvZTdMKi4tYGhr8F+
         HDw0wwIOPC8ZxdDsKBoYISffKD52AIKTAy+lp3VnID09xAg+IiAgyfP73nv2mOwr7akL
         rxcu32O1hTqK4ZbWZIJwljAlwC+sD4DP344FQVXp4JeKnZLtwsyft837jBq5F/lv8QLW
         SHnDr8kO62QNstC3w/yB66JKZTYJLjZpnhBLeLE7zwHod5jhm8ixI42eQktkfHlpQ+L6
         7goYELbMtF0D26fY3DusfirB9TJRL++uYSow97vyT0+EvxjOW0QxfykQfndAIJTUlWVb
         rh4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=EjhW2jRR91igvv7KIjCO13uwXy29OjpRvX0bHrzfU2g=;
        b=wN5PfQ1FsqVd0H5YX278uC7DkJ0nE/rbtg48sL8IrPeMTIbHQIKRlN1x5rrLU9E90d
         CkCYYsavsOelaGYAKz8f071gKDBM6MgfChpR9lwNTuSKzVj46mkERRR8Sd+jSJibJ+Sd
         U09Cs9RJ8vglMKDy4yJoUfKolmCRWaVnQ7zWIXibcZaNe3m1Ko0e4VbVXY7yGTykgXec
         AXkCNLglWsDmGg1ObR+QtmqR8jfteXpeZchCfQUBWQGBLbu7Skx5X0Hzfi04Pv4SGsL4
         Hc+2/fVsypRUPFJhknvJnnPgK2AjbFcFtCClVvSMwseFTxq2k8WaKP2E7Ebzwq5CG8aH
         OFrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si465271qte.388.2017.09.05.08.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 08:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpFst-0008Th-8e
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 11:35:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpFsi-0008LB-DV
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dpFsd-00071y-PJ
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 11:35:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39564)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dpFsd-00071G-HL; Tue, 05 Sep 2017 11:35:11 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CADAB72F2F;
	Tue,  5 Sep 2017 15:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CADAB72F2F
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-97.pek2.redhat.com [10.72.12.97])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12A7D6E491;
	Tue,  5 Sep 2017 15:35:08 +0000 (UTC)
Date: Tue, 5 Sep 2017 23:35:07 +0800
From: Fam Zheng <famz@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20170905153507.GA31389@lemon.lan>
References: <20170905131149.10669-1-famz@redhat.com>
	<20170905131149.10669-4-famz@redhat.com>
	<a628d888-f1e8-2d7f-034c-095c29818ae4@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a628d888-f1e8-2d7f-034c-095c29818ae4@amsat.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 05 Sep 2017 15:35:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 3/6] gicv3: Convert to
 DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F130o9tMpmm1

On Tue, 09/05 10:44, Philippe Mathieu-Daud=E9 wrote:
> Hi Fam,
>=20
> On 09/05/2017 10:11 AM, Fam Zheng wrote:
> > Signed-off-by: Fam Zheng <famz@redhat.com>
> > ---
> >   hw/intc/arm_gicv3_its_kvm.c | 19 +++++++------------
> >   1 file changed, 7 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.=
c
> > index 1f8991b8a6..39903d5eab 100644
> > --- a/hw/intc/arm_gicv3_its_kvm.c
> > +++ b/hw/intc/arm_gicv3_its_kvm.c
> > @@ -120,17 +120,6 @@ static void kvm_arm_its_realize(DeviceState *dev=
, Error **errp)
> >       qemu_add_vm_change_state_handler(vm_change_state_handler, s);
> >   }
> > -static void kvm_arm_its_init(Object *obj)
> > -{
> > -    GICv3ITSState *s =3D KVM_ARM_ITS(obj);
> > -
> > -    object_property_add_link(obj, "parent-gicv3",
> > -                             "kvm-arm-gicv3", (Object **)&s->gicv3,
> > -                             object_property_allow_set_link,
> > -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> > -                             &error_abort);
> > -}
> > -
> >   /**
> >    * kvm_arm_its_pre_save - handles the saving of ITS registers.
> >    * ITS tables are flushed into guest RAM separately and earlier,
> > @@ -205,12 +194,19 @@ static void kvm_arm_its_post_load(GICv3ITSState=
 *s)
> >                         GITS_CTLR, &s->ctlr, true, &error_abort);
> >   }
> > +static Property kvm_arm_its_props[] =3D {
> > +    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "kvm-arm-=
gicv3",
>=20
> moving TYPE_KVM_ARM_GICV3 to kvm_arm.h and using it here:
> Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

This file is only compiled natively on arm, so I'm not comfortable to mak=
e a
more complex change than this patch which may break build due to the #ifd=
ef's in
the headers, or add your rev-by without a compile test.  :(

The open coded type name has already been used here so the change you req=
uested
can be done separately, I think.

Fam
