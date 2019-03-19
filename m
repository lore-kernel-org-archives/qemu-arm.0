Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp3592463wrt;
        Tue, 19 Mar 2019 07:19:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjlwbxiITgQpDSQbzv1wE8uP1x6vCi9XfyQuR6GkEQJJD2K2vsbTiTcgHUZrzINdztkGg6
X-Received: by 2002:adf:f488:: with SMTP id l8mr10333535wro.213.1553005165063;
        Tue, 19 Mar 2019 07:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553005165; cv=none;
        d=google.com; s=arc-20160816;
        b=iGyi8MJ1akEbkBlsQiupizqnKtCmC3jmiYw75B1m2d+BkekkwdBDsTaDuLB/q1p4Ay
         spUTW9nrRBWA0cpKO9g0OmZURvINeRLm+ZX6NpJs+A/4Z3lfDSUIN6AImD9rr3BColmT
         JuJlgDwrF9I5kgER7U6313Ina37ozdWDIWu9hNexvjnyrp3WfWOt1RXkAu1ra+wUNkBY
         Lrj6xguE2lL6lw6iFCjaxmi7+ffj+ybV0XLfq412EPszI93ivMPNtth8HH7Th8bSQguR
         /Yce+RBWZ0QKDBSPVDu1ZbE6dlPlFENySXdn30jYhUpDHh11hXlWr4CUTeQv9lPusNai
         mJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=/Uu1toxzxA14ZeDys/x58GBpoJQCIkGMOpHlWbbzTBk=;
        b=ZwmtZRg6PjIWb/Qbq74QCS9NGIxroYPufIo5LUx84TqfAphRwLoZLKQsYkUKGIK8ct
         hJv80e5NWYSh24Oe9+2aULBBPd1VUn6QNZPfCwpPdLDbimNP7+P8cSiEpVsfepWA/0uA
         rpw61s5iH/9DaUFD8ibSXZPPxUTeDar/yFx+26aJnCkSh5JfkpgrUOUW0lSjb0lxaog9
         a0QXsuZIerIE1NbSQiJ4HPRxKdosXI2eDnng73MLhgW8a3Kc9nZ2McTJf5YpYSiedCRu
         +Gy8qtPinlTQeiovzhYwhb7sOa01C0NPKWHXg93BxYMD3w+bca3bwKbGxpQhfXvADGUp
         HR9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si1221711wrr.118.2019.03.19.07.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Mar 2019 07:19:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6FaO-0004p7-3k
	for alex.bennee@linaro.org; Tue, 19 Mar 2019 10:19:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h6FYQ-0003fw-D4
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 10:17:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h6FYK-0000kg-Lx
	for qemu-arm@nongnu.org; Tue, 19 Mar 2019 10:17:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h6FYK-0000iX-6A; Tue, 19 Mar 2019 10:17:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F6ED30833BE;
	Tue, 19 Mar 2019 14:17:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAAB01001DC1;
	Tue, 19 Mar 2019 14:17:09 +0000 (UTC)
Date: Tue, 19 Mar 2019 15:17:08 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190319151708.0969b53f@redhat.com>
In-Reply-To: <8736nvxci7.fsf@dusky.pond.sub.org>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304101911.GE4239@redhat.com>
	<87y35u3lth.fsf@dusky.pond.sub.org>
	<20190304152811.GO4239@redhat.com>
	<8736nvxci7.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 19 Mar 2019 14:17:14 +0000 (UTC)
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
Cc: peter.maydell@linaro.org,
	"Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
	ehabkost@redhat.com, libvir-list@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R16MqxRddTGs

On Sun, 10 Mar 2019 11:14:08 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
> > On Mon, Mar 04, 2019 at 12:45:14PM +0100, Markus Armbruster wrote: =20
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >>  =20
> >> > On Mon, Mar 04, 2019 at 08:13:53AM +0100, Markus Armbruster wrote: =
=20
> >> >> If we deprecate outdated NUMA configurations now, we can start reje=
cting
> >> >> them with new machine types after a suitable grace period. =20
> >> >
> >> > How is libvirt going to know what machines it can use with the featu=
re ?
> >> > We don't have any way to introspect machine type specific logic, sin=
ce we
> >> > run all probing with "-machine none", and QEMU can't report anything=
 about
> >> > machines without instantiating them. =20
> >>=20
> >> Fair point.  A practical way for management applications to decide whi=
ch
> >> of the two interfaces they can use with which machine type may be
> >> required for deprecating one of the interfaces with new machine types.=
 =20
> >
> > We currently have  "qom-list-properties" which can report on the
> > existance of properties registered against object types. What it
> > can't do though is report on the default values of these properties. =20
>=20
> Yes.
>=20
> > What's interesting though is that qmp_qom_list_properties will actually
> > instantiate objects in order to query properties, if the type isn't an
> > abstract type. =20
>=20
> If it's an abstract type, qom-list-properties returns the properties
> created with object_class_property_add() & friends, typically by the
> class_init method.  This is possible without instantiating the type.
>=20
> If it's a concrete type, qom-list-properties additionally returns the
> properties created with object_property_add(), typically by the
> instance_init() method.  This requires instantiating the type.
>=20
> Both kinds of properties can be added or deleted at any time.  For
> instance, setting a property value with object_property_set() or similar
> could create additional properties.
>=20
> For historical reasons, we use often use object_property_add() where
> object_class_property_add() would do.  Sad.
>=20
> > IOW, even if you are running "$QEMU -machine none", then if at the qmp-=
shell
> > you do
> >
> >    (QEMU) qom-list-properties typename=3Dpc-q35-2.6-machine
> >
> > it will have actually instantiate the pc-q35-2.6-machine machine type.
> > Since it has instantiated the machine, the object initializer function
> > will have run and initialized the default values for various properties.
> >
> > IOW, it is possible for qom-list-properties to report on default values
> > for non-abstract types. =20
>=20
> instance_init() also initializes the properties' values.
> qom-list-properties could show these initial values (I hesitate calling
> them default values).
>=20
> Setting a property's value can change other properties' values by side
> effect.
>=20
> My point is: the properties qom-list-properties shows and the initial
> values it could show are not necessarily final.  QOM is designed to be
> maximally flexible, and flexibility brings along its bosom-buddy
> complexity.
>=20
> If you keep that in mind, qom-list-properties can be put to good use all
> the same.
>=20
> A way to report "default values" (really: whatever the values are after
> object_new()) feels like a fair feature request to me, if backed by an
> actual use case.

Looks like trying to migrate from 'mem' to 'memdev', just creates another
train-wreck (where libvirt would have to hunt for 'right' backend
configuration to make migration work and even that would be best effort
attempt). If that would work reliably, I'd go for it since it allows to
drop 'mem' codepath altogether but it doesn't look possible.
So I'll look into adding machine level introspection and deprecating 'mem'
option for new machine types.

> [...]
>=20

