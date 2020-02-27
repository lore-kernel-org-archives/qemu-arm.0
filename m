Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4308380lfg;
        Thu, 27 Feb 2020 03:17:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOA4cweOQklersF2V6xNElKZsA+TX2dckPj14k2RqUXt7Ic0BzSvaTlx6xGhBP9IkpC4py
X-Received: by 2002:ac8:4e2c:: with SMTP id d12mr4476887qtw.219.1582802271067;
        Thu, 27 Feb 2020 03:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582802271; cv=none;
        d=google.com; s=arc-20160816;
        b=iNBuaw7xbMLXmYMgYtPZ6TNtbuINBIqOgaxY8GOV7obgf0ChCUyae/9+lRgfuWtLPV
         PHKpPpyT78dTboFYdqr7AKerTzcZAJX5XvP81ZOX2SxAKnE4drdYGNXp7JCGk/kimXpv
         OIqpayPBW+K/ri70b1imJKrbvpzVyExSUTp62iUKqM+bgGN508OSsg04fK0ry0YZ3OAU
         tj02jKNksFXmdvehyreSRKfFL2uPwOjEIjqc1RPYhKCi6iOSOpXfJ944U2e/spHAznJS
         5rfMkD0+NGBHHjlYjIiEfCZ44tMWrV2/Qmw4ykFA7ncGKzjqYaAmH/6UKWfXB0odZSJJ
         1exA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=8/Qao5mVrMLtiFprpgRK9mpQ8H/RGFsXAG8L+fjZqCI=;
        b=JQJZGxh421XXxgLJWe99Z3nAi1uKnvPeZSrF2kPZNmy0XPOsT7argsYqP/J8R+0srz
         XgW+oyJyyswY98+4e3G9OMLqvt+o17moTDhZCwtEfnQhg3KsE3WhJvBi4gEQddn0iDhc
         4iYhmJFNmuhTfOWXcV7qe/YO5VrOB65Xz7BKyxaGP2H44YRI5BfI4IG8ptGbGOlzaqQt
         TDYaWA13+oyBzaPP9PpWn0bCfQJgDsP1tBjQvsatUQNWZ3ReoIdOeiLhQNy7Ub+jzg/v
         TAyJJiaOIy5OD7Xe+PFNqNe6KboQtHVAkIHyGxyXuG0MTM6+eFMfO8PcOYPInB4fJiP6
         VNvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B/n7yag2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si1183703qtq.104.2020.02.27.03.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 03:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B/n7yag2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7HAr-0007cg-Ez
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 06:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1j7HAg-0007c0-7g
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 06:17:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1j7HAe-0007zE-Gw
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 06:17:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52770
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1j7HAe-0007yt-CA
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 06:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582802255;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/Qao5mVrMLtiFprpgRK9mpQ8H/RGFsXAG8L+fjZqCI=;
 b=B/n7yag2G89osl7BghQf1NnqGDtJ8rBueUwru58GIsNyHAKX7S9BN3Bqfpi+/yS1cluATQ
 K8WZw/z8zJ4R5+JnCvSW94SpjyWxPH/5X3IiFn026oLXqlkSan8Xkgnfhge3EbCQ8eUi2N
 6IcHJNBUFWwkCnJI0AM4cFKbIxVgU8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-W2xLvMUCNqyqmdRH4pt75A-1; Thu, 27 Feb 2020 06:17:32 -0500
X-MC-Unique: W2xLvMUCNqyqmdRH4pt75A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 697281005512;
 Thu, 27 Feb 2020 11:17:31 +0000 (UTC)
Received: from redhat.com (ovpn-112-43.ams2.redhat.com [10.36.112.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C4BF60BE2;
 Thu, 27 Feb 2020 11:17:20 +0000 (UTC)
Date: Thu, 27 Feb 2020 11:17:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v16 00/10] VIRTIO-IOMMU device
Message-ID: <20200227111717.GG1645630@redhat.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200214132745.23392-1-eric.auger@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, dgilbert@redhat.com, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /3NVKyDRakY9

On Fri, Feb 14, 2020 at 02:27:35PM +0100, Eric Auger wrote:
> This series implements the QEMU virtio-iommu device.
>=20
> This matches the v0.12 spec (voted) and the corresponding
> virtio-iommu driver upstreamed in 5.3. All kernel dependencies
> are resolved for DT integration. The virtio-iommu can be
> instantiated in ARM virt using:
>=20
> "-device virtio-iommu-pci".

Is there any more documentation besides this ?

I'm wondering on the intended usage of this, and its relation
or pros/cons vs other iommu devices

You mention Arm here, but can this virtio-iommu-pci be used on
ppc64, s390x, x86_64 too ?  If so, is it a better choice than
using intel-iommu on x86_64 ?  Anything else that is relevant
for management applications to know about when using this ?


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|

