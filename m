Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp895870wrx;
        Fri, 1 Mar 2019 09:48:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqyYWzEdjdBnWsSOgyA7HmVtmqd6egeOCq4ZRnvLEvg8TJwKhIMv2fkYa/YtrUoYZ3kpxemS
X-Received: by 2002:a0d:c644:: with SMTP id i65mr4700929ywd.68.1551462514606;
        Fri, 01 Mar 2019 09:48:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551462514; cv=none;
        d=google.com; s=arc-20160816;
        b=fQ/wLXG5VHxuDXF8l/FP6UOvfW7YHXlaUIX+rgd2lbNKYWVqr/9+YyLknJYRrUYR7X
         BNXq9PmAqNAyn8aWgqEXHLGoK3Xi9IMA9G4twvkUABiKgz+J3SuzBKfq82tmLrZdm6l2
         vk97hJSb5M+ZVpb0eZmlGno0IwhHhUdHNqrEL7gqqydpoM+u6ST/utSxfUMPPyikhMNi
         v7dc0s1KogFgOcu6v1vcFxnbuSr9uQmxrJBTB+221aC67Zn56FGFoSDjO9ABmkh++aWb
         PE7/L4Dw/x/N+hvlkDlPyhgkGVHDBYYIHXx4Zvf76s9WIP85/Sv1dWxAe2TJrPteT/jU
         pxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=rH8XYsznembObtgdxedbWljg6oJ9aG3JoKHiz2qAquY=;
        b=KrudiTY6VWQ091tKRblxaXrOb31Ff/eIjQKvRWpVkLaMMeZFbl+50JROnLsOf9GuWF
         mVnjnX4zXUwpLRr2hXNo3JwJHt8ai8OddyyHSi9JXUfVm9Ok6jYzBfxL8jeIfSzdoBF4
         y3tDOXbn/I5IU06DgYlr5p2u1+5mc4s4ppckQEn+kO83vnUKTmE+Igt0pmqPCebCNAFu
         BmlRT2Wy9Zoj6Tn1fMGbZsTDVTr+fWBdxJ4kwjDvQndyrLsDK9CSRF5tFAShw6JdrJyA
         sfn5CnzoQc9W1cuLx7m2x6M4Fvzgusb0XD9ByzRk/Hhrp4RHuQc4G4UbdoEE89xSaDGI
         ntbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si12596510ybp.368.2019.03.01.09.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 09:48:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzmGw-0002cE-3o
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 12:48:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gzmGl-0002bI-DL
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 12:48:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gzmGj-0004jU-E7
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 12:48:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gzmGh-0004iE-Ee; Fri, 01 Mar 2019 12:48:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A34D30832EB;
	Fri,  1 Mar 2019 17:48:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCDB319C58;
	Fri,  1 Mar 2019 17:48:08 +0000 (UTC)
Date: Fri, 1 Mar 2019 17:48:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190301174806.GN21251@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190301183328.20b63e23@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 01 Mar 2019 17:48:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IY3cDpTcZTSP

On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:
> On Fri, 1 Mar 2019 15:49:47 +0000
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>=20
> > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
> > > The parameter allows to configure fake NUMA topology where guest
> > > VM simulates NUMA topology but not actually getting a performance
> > > benefits from it. The same or better results could be achieved
> > > using 'memdev' parameter. In light of that any VM that uses NUMA
> > > to get its benefits should use 'memdev' and to allow transition
> > > initial RAM to device based model, deprecate 'mem' parameter as
> > > its ad-hoc partitioning of initial RAM MemoryRegion can't be
> > > translated to memdev based backend transparently to users and in
> > > compatible manner (migration wise).
> > >=20
> > > That will also allow to clean up a bit our numa code, leaving only
> > > 'memdev' impl. in place and several boards that use node_mem
> > > to generate FDT/ACPI description from it. =20
> >=20
> > Can you confirm that the  'mem' and 'memdev' parameters to -numa
> > are 100% live migration compatible in both directions ?  Libvirt
> > would need this to be the case in order to use the 'memdev' syntax
> > instead.
> Unfortunately they are not migration compatible in any direction,
> if it where possible to translate them to each other I'd alias 'mem'
> to 'memdev' without deprecation. The former sends over only one
> MemoryRegion to target, while the later sends over several (one per
> memdev).

If we can't migration from one to the other, then we can not deprecate
the existing 'mem' syntax. Even if libvirt were to provide a config
option to let apps opt-in to the new syntax, we need to be able to
support live migration of existing running VMs indefinitely. Effectively
this means we need the to keep 'mem' support forever, or at least such
a long time that it effectively means forever.

So I think this patch has to be dropped & replaced with one that
simply documents that memdev syntax is preferred.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
