Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3694117wrx;
        Mon, 4 Mar 2019 06:56:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqycH7Gq3HtgwprngaY5p+MqXrNnPbs7xptbMCb8Vh5S4u24kPvimDgk92SwWHb6zgxFDby9
X-Received: by 2002:a25:c947:: with SMTP id z68mr14948495ybf.522.1551711414862;
        Mon, 04 Mar 2019 06:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551711414; cv=none;
        d=google.com; s=arc-20160816;
        b=ptPEtScyY3np4KoGdKbVaKnhIEB3vtyJsEWvrW8cpqud0oEBAURVFyjMZhg0sEDUVw
         zr1vnawFtJzofQjQbFvRmaBtxm2L4rpT1a9Qtq/TCmFhb+9b+cOaSlAE+WdQp+5t3u+s
         sS8XjQIBKjQ+MzfkoNlx32AuPdEyDhG83wOq3Khkd9gUYwsIwg51bNMtV654rO0h18y/
         EyyFZToNoPJkqc3Y3KipadmVS7MDcc7uIBF0oh9OvuxXPl75DrbG93LogfOQIcWItpnX
         hL63/4NfcDZHGp15+uuJ8A2OWKKmL1ibgEJS8dQeP3FdOsUL+gLmEUmOSxGo2Oi3k5zu
         FnfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=X1fQp/TQT03Y7bOTEVx78aRqZctiYtYoQSz4CXxUcsY=;
        b=SSnXBqEptNkW+Vjh7MrpzDmxz42pNCGebFOcV4DBsZD3oKpQuxqlpURGIB9XNSPcv8
         +47YAdzQejCADttetXcRJZCAyTa1ZiXY5ifhkiTvLgj8i8XacW4KoD8LxABqwytq3iir
         SGal37sCN4Txrqt+w6mr/MWiBK0IVUuCCdMz4qyPSBst+T1rYEyorPjhRaPLRseBswV3
         3xhr5b2Bx16mjk5kqf51wkGHyH4sRxg0YlRWzQ9uLNGKY0+EIP5nzAFlrpf7ku/lpGPs
         X0VOyqI9wvsK3d6dxx2LkV7cP9S8SBjdtDLiLw/6OHlbdSsLgR75s/SbQ7DrQqprWmXf
         pthw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si3162841ybb.53.2019.03.04.06.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 06:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0p1S-0005jx-BT
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 09:56:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53328)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0ozp-0004jY-BN
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:55:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0ozn-0000j3-J8
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 09:55:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51074)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h0ozk-0000Xl-R9; Mon, 04 Mar 2019 09:55:09 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03E95D2EE5;
	Mon,  4 Mar 2019 14:55:07 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C96160F8D;
	Mon,  4 Mar 2019 14:54:59 +0000 (UTC)
Date: Mon, 4 Mar 2019 15:54:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Message-ID: <20190304155457.206a7ff7@redhat.com>
In-Reply-To: <20190304135909.GL4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<15464582-e8a6-6654-7679-15d87c10af38@redhat.com>
	<20190304145510.57c73177@redhat.com>
	<20190304135909.GL4239@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 04 Mar 2019 14:55:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [Qemu-devel] [libvirt] [PATCH 1/2] numa:
 deprecate 'mem' parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
	ehabkost@redhat.com, libvir-list@redhat.com, "Dr.
	David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YHs/27zR/xUK

On Mon, 4 Mar 2019 13:59:09 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Mar 04, 2019 at 02:55:10PM +0100, Igor Mammedov wrote:
> > On Mon, 4 Mar 2019 09:11:19 +0100
> > Thomas Huth <thuth@redhat.com> wrote:
> >  =20
> > > On 01/03/2019 18.48, Daniel P. Berrang=C3=A9 wrote:
> > > [...] =20
> > > > So I think this patch has to be dropped & replaced with one that
> > > > simply documents that memdev syntax is preferred.   =20
> > >=20
> > > That's definitely not enough. I've had a couple of cases already where
> > > we documented that certain options should not be used anymore, and
> > > people simply ignored it (aka. if it ain't broken, don't do any chang=
e).
> > > Then they just started to complain when I really tried to remove the
> > > option after the deprecation period. =20
> >  =20
> > > So Igor, if you can not officially deprecate these things here yet, y=
ou
> > > should at least make sure that they can not be used with new machine
> > > types anymore. Then, after a couple of years, when we feel sure that
> > > there are only some few or no people left who still use it with the o=
ld
> > > machine types, we can start to discuss the deprecation process again,=
 I
> > > think. =20
> > Is it acceptable to silently disable CLI options (even if they are brok=
en
> > like in this case) for new machine types?
> > I was under impression that it should go through deprecation first. =20
>=20
> Yes, it must go through deprecation. I was saying we can't disable
> the CLI options at all, until there is a way for libvirt to correctly
> use the new options.

I'm not adding new options (nor plan to for numa case (yet)),
-numa node,memdev is around several years by now and should be used
as default for creating new configs.

In light of keeping 'mem' option around for old machines,
Deprecation should have served for notifying users that legacy
options will be disabled later on (for new machines at least
if no way found for migration compatible transition for older ones).

What I'm mainly aiming here is to prevent using broken legacy options
for new VMs (like in RHBZ1624223 case) and deprecation is the only way
we have now to notify users about CLI breaking changes.

In the -mem-path/prealloc case, there will be a new machine option 'memdev'
to replace them but that's migration compatible, so libvirt could use new
CLI syntax to replace even old configs.
(If there is a mechanism for introducing/introspecting a new options
per-machine or whole QEMU, I'd happy to add a new option there on top of
just deprecation notice that we have now).

> Regards,
> Daniel

