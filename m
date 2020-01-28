Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp324213lfp;
        Tue, 28 Jan 2020 02:59:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqydPBU+E9N1rVV/qogyWpqrsvVOgvMAw4IYlzN3nXC0m29qnv/Uezi5qYshvRHMD5jbw2U4
X-Received: by 2002:a05:620a:c93:: with SMTP id q19mr16944793qki.339.1580209160343;
        Tue, 28 Jan 2020 02:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580209160; cv=none;
        d=google.com; s=arc-20160816;
        b=OUgaAHjOhMG5JMmWepMy3NkRWOV4uMv/r9WEHDH6Ai9bMukN/uybDBO0NBcSNTXt20
         KICzmVy4l85IQUNwwQdSbVGGJYh8y9eSSUce+ISV3YqAp3R9rXHuY754g5Scl/tso6xV
         P18DXidsi/ifvAXXbQZ5eG+yp5G16sdH6Z23kZv79dng7lFAYqLseTWy+y4oee5L8h5+
         aJvK0TCX4rtiAA4fQAlECOauQzMVrqajgIORh/q2z+nL39STIcWIBz6SmUFB/B4GwwXD
         hbn6rc/AMmbekBWxbAcL4v9jzaD9BctLlTHAkvzZGypEWpL0o/CIxRMyXa+wVSg1YvJl
         fD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=2ByumgrNzlLWFSkD7chJPVnd5nK+x9Y51/TodVPgmg4=;
        b=0OgV60ZUSpDOCEndB+s7itep8yHZDhQ48oGzwYoqs1PwWvpPJJ29dDbnj6UQFuYrtO
         WnQhlW//zBtN9p2bEh8q25qrkUJzCkkymK9Hs8jaEh006geT04/hquaJsWeh4LkQ0XRc
         VF4h3ltBKSEk5S0sJYnySJY9RMtNw9K6AAgbOHEeFwcX7GyuyznWN/5ZSfqG2aRpY7jt
         oRcGn472tFqW3xQiXHXs1+7zMwLzFTjU9jO9f4PQRvCI4nWlRArcSYtGkd5F4Oox06SV
         gx//2LRVpMHi9LekFuYb+Kj9b66schlL3pM/TVTBR1HtSXAgEpWqPITFAacqOT8/M0xq
         aJhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LjV5b5j0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si11757610qvk.88.2020.01.28.02.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 02:59:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LjV5b5j0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwOaV-0004hE-O6
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 05:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iwOaN-0004gR-Cg
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:59:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iwOaM-0000kb-9l
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:59:11 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41214
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iwOaM-0000kJ-6v
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580209149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ByumgrNzlLWFSkD7chJPVnd5nK+x9Y51/TodVPgmg4=;
 b=LjV5b5j0NAk1MiOqYqMb4KMAs94h842emGiA73gUcutZLu+7hnU5nRmTcR5n0A1DZU1DIP
 0hjyG1gNihUMVYCnlgICbEGUB3SRKck9uFnHeeTDggg680xvoICId2ZVOp+Dzv2DL7xOxi
 XySs/jqNExE1lu7vQUbraNN5tv9xNHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-LutRDJZgNrSK4YF9RvZSMQ-1; Tue, 28 Jan 2020 05:59:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EDBB100550E;
 Tue, 28 Jan 2020 10:59:05 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6787E87022;
 Tue, 28 Jan 2020 10:59:01 +0000 (UTC)
Date: Tue, 28 Jan 2020 10:58:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [question] hw/arm/virt: about the default gic-version in
 accelerated mode
Message-ID: <20200128105858.GG3215@work-vm>
References: <df1d6ae5-b734-ef64-4ef9-c661e8f797e8@redhat.com>
 <CAFEAcA8hib-3YWuS-MajjvokOFCGKUHeuz+XQTBYf8LBz+PuFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8hib-3YWuS-MajjvokOFCGKUHeuz+XQTBYf8LBz+PuFQ@mail.gmail.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: LutRDJZgNrSK4YF9RvZSMQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: Auger Eric <eric.auger@redhat.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, qemu list <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wn3lxC/gCUHJ

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Tue, 28 Jan 2020 at 10:47, Auger Eric <eric.auger@redhat.com> wrote:
> > When arm virt machine is run in accelerated mode with "-cpu host
> > -machine virt", the default gic version is 2.
> >
> > I understand the rationale with TCG where we don't have MSI ITS
> > emulation along with GICv3 so we need to choose GICv2 to get GICv2M
> > functionality.
> >
> > However in KVM mode, I would have expected to see the host GIC probed t=
o
> > set the same version on guest. Indeed most of our HW now have GICv3
> > without GICv2 compat mode so our default values lead to weird traces:
> >
> > "
> > qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
> > qemu-system-aarch64: failed to set irq for PMU
> > "
> >
> > I would like to propose a patch to improve those errors and also sugges=
t
> > a hint. But I also wanted to know whether you would accept to change th=
e
> > default value with KVM and choose the host version instead of 2. For TC=
G
> > we would keep v2.
>=20
> As with the -cpu option, the default is there for command
> line backward compatibility primarily. Even if we had
> better support for MSI ITS emulation we'd still leave
> the default at GICv2.

I'm curious why; 'virt' is a versioned machine type, the whole point of
versioned machine types is you're allowed to change the behaviour of
them between versions of qemu.   If people want their command lines
to stay stable they can specify a version, i.e. -M virt-4.2 and
know that it won't change.

> If you want "do the best you can, regardless of accelerator"
> that is "-cpu max -machine gic-version=3Dmax".

Dave

> thanks
> -- PMM
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

