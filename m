Received: by 10.28.173.206 with SMTP id w197csp1894380wme;
        Fri, 12 Jan 2018 06:12:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBouQAnXva1PadayZXTyUOPAW1EuxoZ1GVGRNnc49K9vR/hiRgaVhdXpptKbwP5aYRwrJL01o
X-Received: by 10.129.28.207 with SMTP id c198mr3584930ywc.426.1515766357284;
        Fri, 12 Jan 2018 06:12:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515766357; cv=none;
        d=google.com; s=arc-20160816;
        b=1CgJ6oly/s0DnReY+rRNtDMEpBZz3QafMm/5UujCsgX+3PtQfhZXCjpZyXatd2qDMO
         Y6KsNhgGlWBmRLTtKQqh0/MfbpwD5ceIeZJDgAzW10osYEMS3ULOv29NZ/ZCHJWwQ1qT
         xHc67n2YjpDqmOL8oxgoFtigGgY1SGsCb0vMmZuUhYvj/Z9b1NvP1Zz2bnxLxbvwnMvg
         sTiJWcrf3Kw+XUxHrc2qJfBMtH1eCrAezGos3AehLPKn707GYCodf7wym9vmtgoOQNzD
         yNI8CtgJ7/w2gSHUKTOlaCDvzMaiAZmCiyosw94iyIknR5YZJrz0xYCkfeAuHKzq8Kc+
         +pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=RjTWamaPClNBs2DuhzCfoJBYBIFy819MBghiu4dCUKw=;
        b=s9wkvOfnIV3H2pkOGVZKhKharHPzBCXhvcoYClb3WTSr6dQ+SLmiULB7M1T/hxjGkP
         gDoWpcpzLrPBOE2v8/aVbTMtS9N636Tzk8X7lzcfvF7mNM08mpYdRu2IXY6n/H4rT6jD
         /E1ivggkEvLT/Lnuq0qsP+goQY5Hc8CPUxUgVrQeHQ+/8XVjtKVfu/yeRZ/OYZKahl7O
         /NVwqd9PXuD2j8WYxvdbKljVv+UPZC4LWfpgFM0UToiQDXqqvv9QKa9ZLLAb7Dqe/nPP
         8TSxFyn20k2uglDNuqEltLvsNdR7KVix6ogNtHmzatsrEdYt0F5KRBQ9U4zZW+Dscst6
         Iurw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z188si1203382ybz.736.2018.01.12.06.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 06:12:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ea04S-0002Sh-If
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 09:12:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ea03e-0001vp-T3
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 09:11:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ea03c-0007jg-8D
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 09:11:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1ea03c-0007fj-00; Fri, 12 Jan 2018 09:11:44 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F08E3356D3;
	Fri, 12 Jan 2018 14:11:41 +0000 (UTC)
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D18BD179E9;
	Fri, 12 Jan 2018 14:11:25 +0000 (UTC)
Date: Fri, 12 Jan 2018 12:11:19 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180112141119.GF6646@localhost.localdomain>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104192203.GD3407@localhost.localdomain>
	<20180108135122.637e478a@redhat.com>
	<395b6cff-e4be-1aa9-48f6-82cdbd9633b9@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <395b6cff-e4be-1aa9-48f6-82cdbd9633b9@amsat.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 12 Jan 2018 14:11:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 0/6] qom: introduce TypeInfo name aliases
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alexander Graf <agraf@suse.de>, Fam Zheng <famz@redhat.com>,
	qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AE7vwM41Z150

On Mon, Jan 08, 2018 at 11:10:37AM -0300, Philippe Mathieu-Daud=E9 wrote:
> Hi Igor,
>=20
> On 01/08/2018 09:51 AM, Igor Mammedov wrote:
> [...]
> > Though it seems easy and trivial, I'm a bit concerned about using
> > QOM types for the task though.
> > Also see commit 6acbe4c6f which labels aliases as a bad idea
> > and says that they are there only for compatibility and shouldn't
> > be used.
> > So far I agree with that statement, because it introduces
> > ambiguity in code used internally and more worrying is that
> > this ambiguity will increase user visible ABI (think of '-device_add =
FOO_ALIAS')
> > that we would need to maintain afterwards.
> > It would be nice to have unified alias API, but I think it should
> > be separate one and limited to the same scope (i.e. compat stuff),
> > and even that won't be easy as different alias impl. we have now
> > have a different needs.
> >=20
> > wrt this series targeted usage, I'd prefer that object_new/initialize
> > would use real type names when creating devices as it does currently
> >=20
> > FDT linux guest specific names wouldn't seep into device model
> > itself. Firmware (FDT or ACPI) should be separate from device
> > implementation.
>=20
> Good point.
>=20
> > If really there is need to dynamically scan present devices
> > and build FDT from result, then probably we should introduce
> > interface that devices could implement if necessary.
> > (I was thinking about such possibility for ACPI). But so far
> > it looked to me as too much overhead for what we do now.
>=20
> I see, I thought about something similar but TypeInfo.aliases was way
> too simple to not try this series first.
>=20
> What about adding a INTERFACE_FDT_DEVICE type (InterfaceInfo) and let
> the FDT devices implement something such:
>=20
> typedef struct {
>     /*< private >*/
>     InterfaceClass parent_class;
>     DeviceClass parent_class;
>     /*< public >*/
>     bool (*is_alias)(FDTDeviceIf *dev, const char *name);
>     bool (*set_prop...)(FDTDeviceIf *dev, const char *property, ...);
>     const void *(*get_prop)(FDTDeviceIf *dev, const char *property);

An interface common to FDT devices probably make sense, but I
don't know if the one you suggest above makes sense or not (a
description of each method would be useful to understand what
exactly they would do).

--=20
Eduardo
