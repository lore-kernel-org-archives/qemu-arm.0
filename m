Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp520889lfm;
        Wed, 15 Apr 2020 05:44:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypLPN9NqUfz8PeFcvW393+RPrUIMr0xEgjhc+vWzscReODT1XhqMbuURZRUSPa5gWQTZuXZQ
X-Received: by 2002:a37:851:: with SMTP id 78mr26306764qki.352.1586954674901;
        Wed, 15 Apr 2020 05:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586954674; cv=none;
        d=google.com; s=arc-20160816;
        b=gadS98BAgt89dRD9Mj9sK1TjdqUtpzFD6m6bONLk/fYrK3xVi+DUAxv5nS6TqcJWVX
         ulLs+6CK4WlloQOp8ZKbChbm2yLPzeZAKkgSE2/1FGUmTy+Keg6CMa8uRaKoE5l+WicA
         x0iPAEtPT06wdemzpLkgnrRX6TUCvVVriWrnSogV6uy5J952LCpoSNsnfG3KYh5bpoph
         UoO5r2cAAetJq00RNVCg5sLJn65QHOEp+LL+FA8UaAobUUfkNs0uHGSsjQzUJ3nzW0cX
         aXRMfJWYME9GgMhRtNbwWdoS1/MGh0rAo9ifxpiC6egRRk3xOzMBIA8AVJf+tC987ITN
         ToPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=pDg5qi4xsryBk4w02BFiq4x1Ldryzh5UYOH/kWiPtkE=;
        b=GQKbDZQAs4tSyZz6WtPcUddgA1h46WqDUQSK+mfePQgSpKuuO08QbTvsEpXPbjot0v
         /dZ0F+VKnJ2tOhSVT5QHy10yOVAyA2pXs8CHlhC/8QiSo0u9sSqJs/IljUz7HXGeKMix
         6cshRX4M4x+y/ZgMFG8dkXAFLoUyY0aeJxdoJWu+E6P5zzUEkoSsUowlcWgb7OMUthID
         DBjZ8dcbS/vCS2RfY9H4NmXryfkpy3+tpsZOfOozw/L5ADU0wkFrcMKvqndR9Nzk4SpM
         OBFzwu5XI1tnQQrn/cHFp9B3ehXUnkFw6oEzGpk+nDic37LDRfjO/5SaOg5lHxkaJQYT
         9iKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W4IJCZoC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b128si9200690qke.202.2020.04.15.05.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Apr 2020 05:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W4IJCZoC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOhP8-00076r-DP
	for alex.bennee@linaro.org; Wed, 15 Apr 2020 08:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1jOhNT-0005U1-Qm
 for qemu-arm@nongnu.org; Wed, 15 Apr 2020 08:42:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1jOhNS-00043K-LP
 for qemu-arm@nongnu.org; Wed, 15 Apr 2020 08:42:51 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:56223
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1jOhNS-00042s-HP
 for qemu-arm@nongnu.org; Wed, 15 Apr 2020 08:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586954569;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDg5qi4xsryBk4w02BFiq4x1Ldryzh5UYOH/kWiPtkE=;
 b=W4IJCZoCqzkfvyv1X4fXAmvf0QEBcxIQ0f3B44YeRh2HNfFrvpH5Y90wDboA4G79y/qljv
 RjKYOMfLOhUjXmxms38WNgv3dQxfDV1c59o1h2rfY8m+S8zqBWitjG5wVR1Bq0uzYxGJdE
 4JioYdKK6Ejlyr1WELriqZKmxKsrm3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-pTUhGiO2N7iWVEoJH3_vGg-1; Wed, 15 Apr 2020 08:42:42 -0400
X-MC-Unique: pTUhGiO2N7iWVEoJH3_vGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D801005510;
 Wed, 15 Apr 2020 12:42:40 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA93A19C70;
 Wed, 15 Apr 2020 12:42:39 +0000 (UTC)
Date: Wed, 15 Apr 2020 13:42:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.0] Deprecate KVM support for AArch32
Message-ID: <20200415124236.GG1344391@redhat.com>
References: <20200414120935.12719-1-peter.maydell@linaro.org>
 <20200415123310.GC1344391@redhat.com>
 <CAFEAcA80g-Zohi0t7u51aNs58i8_zPCOcRob6zx6DYdTjYfXWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80g-Zohi0t7u51aNs58i8_zPCOcRob6zx6DYdTjYfXWQ@mail.gmail.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lCKsSUvnVsZM

On Wed, Apr 15, 2020 at 01:41:05PM +0100, Peter Maydell wrote:
> On Wed, 15 Apr 2020 at 13:33, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> >
> > On Tue, Apr 14, 2020 at 01:09:35PM +0100, Peter Maydell wrote:
> > > The Linux kernel has dropped support for allowing 32-bit Arm systems
> > > to host KVM guests (kernel commit 541ad0150ca4aa663a2, which just
> > > landed upstream in the 5.7 merge window).  Mark QEMU's support for
> > > this configuration as deprecated, so that we can delete that support
> > > code in 5.2.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > > I was reading the 5.7 merge window writeup on LWN this weekend
> > > and saw that the dropping of 32-bit support had gone in; just
> > > enough time to squeeze our deprecation warning into 5.0 so we
> > > can drop the code in 5.2 rather than 6.0...
> > >
> > >  docs/system/deprecated.rst | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> >
> > The docs are sufficient to start the deprecation process, but
> > we might consider also having a warning from configure, or a
> > message on stderr at runtime to make it more visible to users.
>=20
> Mmm. I didn't feel entirely comfortable making code changes to
> print messages at this point in the 5.0 release cycle, though.

Sure, that's understandable.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange=
 :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com=
 :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange=
 :|

