Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3745588wrx;
        Mon, 4 Mar 2019 07:46:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbjmiwGgUVTGOm3lir4ZaL1UIUDdrGXPq9Sf2Cney9QWVdzAHutKM4I81Hgo/8zAz/l5kL
X-Received: by 2002:a81:98d3:: with SMTP id p202mr14816666ywg.49.1551714402505;
        Mon, 04 Mar 2019 07:46:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551714402; cv=none;
        d=google.com; s=arc-20160816;
        b=YVwUOZi7Leek8Kc9tts6/LzXd4Hiv1vF4u3YhysDFAc4vULepUQMPhqqiPLkHb1gkz
         EhhwAPFJF3fFOL0yuzPQfuWQQ4+55s15EQK4cyjAqLRWbv5Gh2OkkFXiPZ+7wsRJLOHK
         Vr2WVStmVFxUUPeomqDudDGtZJCK74RNPCxQd6Q4hhXya0BPDRQazOI9NaJTFyemoXmG
         VU2Ob0BorDYMkyfM/p5tp/FzPrd3o4hQ6YELw02oZ87drUZYe47zpveqp4kc/yOLaeP3
         eYCjJ/+KBdtStc0NYLei/xb6rBqsY0APZRSROgzMKpncqDbBU8RR0YOU8Vel876a2sUc
         RzDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Gotu2phTAdUZmhvlBpLaCCJ04svtNCZU7tEkIiPMa4Q=;
        b=RJvgFdvEY2G8qi+wbXNjhX1LG2jX0TqtdjsHGEytyScsnpRlJCYwTAfhP/5f5c/Bjb
         dkzEPFxuVnVSC8ECvuKQ1Vn+U5vMs+8deH+Jp5cXubWPmrCg1DQmuhpQ1mAidOhBdmW+
         kKa9E//U32p3M6GnUvufvQhcznAcIogEWtpOgd38/I/u8Q/BHdB1ymMQ9/YB/dhXH3ud
         pLlsxo76ENUgkyDnr4PKJq+v0+42aWnd638FMKNg6kROe0ghQ9Q4iAmjkXXvfGxxqLFk
         hzHe/1y9lf7K0gkei/D8DMebQ8zzHtw9KIxP9YB4zMprWA01WvsN3GRVjsfATwBO1iF0
         tEPA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 185si3290438ybd.160.2019.03.04.07.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 07:46:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:56174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0pne-00038t-1H
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 10:46:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0pnW-00038W-HU
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 10:46:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0pnV-0004OZ-Kf
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 10:46:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56578)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h0pnV-0004Np-Br; Mon, 04 Mar 2019 10:46:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 583EC308A953;
	Mon,  4 Mar 2019 15:46:32 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 954126085B;
	Mon,  4 Mar 2019 15:46:24 +0000 (UTC)
Date: Mon, 4 Mar 2019 16:46:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Message-ID: <20190304164623.6643b5ce@redhat.com>
In-Reply-To: <20190304152811.GO4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304101911.GE4239@redhat.com>
	<87y35u3lth.fsf@dusky.pond.sub.org>
	<20190304152811.GO4239@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 04 Mar 2019 15:46:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate
 'mem' parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com, "Dr.
	David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oQ3f0f+Z3kOg

On Mon, 4 Mar 2019 15:28:11 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Mar 04, 2019 at 12:45:14PM +0100, Markus Armbruster wrote:
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >  =20
> > > On Mon, Mar 04, 2019 at 08:13:53AM +0100, Markus Armbruster wrote: =20
> > >> If we deprecate outdated NUMA configurations now, we can start rejec=
ting
> > >> them with new machine types after a suitable grace period. =20
> > >
> > > How is libvirt going to know what machines it can use with the featur=
e ?
> > > We don't have any way to introspect machine type specific logic, sinc=
e we
> > > run all probing with "-machine none", and QEMU can't report anything =
about
> > > machines without instantiating them. =20
> >=20
> > Fair point.  A practical way for management applications to decide which
> > of the two interfaces they can use with which machine type may be
> > required for deprecating one of the interfaces with new machine types. =
=20
>=20
> We currently have  "qom-list-properties" which can report on the
> existance of properties registered against object types. What it
> can't do though is report on the default values of these properties.
>=20
> What's interesting though is that qmp_qom_list_properties will actually
> instantiate objects in order to query properties, if the type isn't an
> abstract type.
>=20
> IOW, even if you are running "$QEMU -machine none", then if at the qmp-sh=
ell
> you do
>=20
>    (QEMU) qom-list-properties typename=3Dpc-q35-2.6-machine
>=20
> it will have actually instantiate the pc-q35-2.6-machine machine type.
> Since it has instantiated the machine, the object initializer function
> will have run and initialized the default values for various properties.
>=20
> IOW, it is possible for qom-list-properties to report on default values
> for non-abstract types.
>=20
> I did a quick hack to PoC the theory:
>=20
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 8b3ca4fdd3..906dfbf3b5 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -1368,7 +1368,8 @@
>  # Since: 1.2
>  ##
>  { 'struct': 'ObjectPropertyInfo',
> -  'data': { 'name': 'str', 'type': 'str', '*description': 'str' } }
> +  'data': { 'name': 'str', 'type': 'str', '*description': 'str',
> +            '*default': 'str'} }
> =20
>  ##
>  # @qom-list:
> diff --git a/qmp.c b/qmp.c
> index b92d62cd5f..a45669032c 100644
> --- a/qmp.c
> +++ b/qmp.c
> @@ -594,6 +594,11 @@ ObjectPropertyInfoList *qmp_qom_list_properties(cons=
t char *typename,
>          info->has_description =3D !!prop->description;
>          info->description =3D g_strdup(prop->description);
> =20
> +        if (obj && g_str_equal(info->type, "string")) {
> +            info->q_default =3D g_strdup(object_property_get_str(obj, in=
fo->name, NULL));
> +            info->has_q_default =3D info->q_default !=3D NULL;
> +        }
> +
>          entry =3D g_malloc0(sizeof(*entry));
>          entry->value =3D info;
>          entry->next =3D prop_list;
>=20
>=20
> If we could make this hack less of a hack, then perhaps this is good
> enough to cope reporting machine types which forbid use of "mem" in
> favour of "memdev" ? They would need to have a property registered
> against them of course to identify the "memdev" requirement.

Thanks, I'll look into it and try to come up with patches.

> Regards,
> Daniel

