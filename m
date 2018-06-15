Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp543753wrq;
        Fri, 15 Jun 2018 00:53:37 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKvf1l5YFQjSshVb8+3o7bAW9xD5q54JLvEtpH0TZMgdWui6ts42eSFwOxwNdxohP0yr/aA
X-Received: by 2002:a37:70c1:: with SMTP id l184-v6mr475996qkc.86.1529049217760;
        Fri, 15 Jun 2018 00:53:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529049217; cv=none;
        d=google.com; s=arc-20160816;
        b=A3YE9XYzNSFp7cGqZaOScV8bQCo4p064s65qlu9Jg2s8TkTG+laBzjVak401vcu2wx
         1dA9I33xD7RpRMV6viZQ2lt35joms7zgAvHFun7NrgzJp9VvEuWPUlZVxoxUWsQzrmQl
         l+xSDQUEe2ZLI/dOpFwgyMw6bOhgeK7xWzA5/up3wUknuurb0swzdZcJPNRfeAf5gar2
         SOIwIy92ynQk/P0zq5/4DtKHDqpLvJen4tFAJWGxEVHzzDV0IWyq7cwOUgobVHTo75ts
         irQi1OS4gO3e3YGcid1ODhdEioXJrxJLmqkF4iquAujDMSuV9dtyTXRu5NLP8iynzKQ+
         R0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=KlSHzjTfAC5BGnm20yTi4rrmUO022zr+sJn9I+wGM34=;
        b=wSgNEEnnd7tvRLeR/GMhh6/osrENiL04fJG79fPEfhOSGzQvmKEcXJ+Qzg1NSnjNVl
         9CkYMSOW2yz/k+/e/O/R9fmhHn/S/76pfVfoau9wQ2//vqbj2ZX4tx5Ucy/uh94WpM7w
         WdzGpzBsaGcOlXJJU+rAfRs1+zcGIfqdD2nNOtBj9trDk4fTEXuQtwmAfi8Hb3qGmB+l
         SWY0XV7ys/Qd0PbEH8DFytJY1oZ/0CzlUX5V806n6kKyWaMkAvCw3XQESYvBihIg3zq5
         G3gxp74b0nynW1HYKi40p1tecMddLhWOT4b5yop8UMb/uNMYOe1VoJKYWkFUIEBe1+ik
         CXcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w17-v6si3494583qtk.146.2018.06.15.00.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 00:53:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTjY9-0005ZE-9a
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 03:53:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53232)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fTjY1-0005Z0-Bh
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 03:53:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fTjXy-0006Jd-6Z
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 03:53:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39448 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fTjXy-0006IJ-1k; Fri, 15 Jun 2018 03:53:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84A7D81663F2;
	Fri, 15 Jun 2018 07:53:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-109.ams2.redhat.com
	[10.36.116.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E0961116718;
	Fri, 15 Jun 2018 07:53:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A8E203B6; Fri, 15 Jun 2018 09:53:14 +0200 (CEST)
Date: Fri, 15 Jun 2018 09:53:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Erik Skultety <eskultet@redhat.com>
Message-ID: <20180615075314.fc3jattcaizpf6yd@sirius.home.kraxel.org>
References: <20180613084149.14523-1-kraxel@redhat.com>
	<20180613084149.14523-4-kraxel@redhat.com>
	<20180613135047.5c1ce227@w520.home>
	<20180613223625.lf6xkzgipzkfslit@sirius.home.kraxel.org>
	<20180614094856.GD2220@beluga.usersys.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180614094856.GD2220@beluga.usersys.redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 15 Jun 2018 07:53:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 15 Jun 2018 07:53:24 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v4 3/3] hw/vfio/display: add ramfb support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fsjKVt+CMY2A

> > Well, it's simliar to qxl vs. qxl-vga.  It's not qxl,vga={on,off} and
> > libvirt has no problems to deal with that ...
> >
> > Another more technical reason is (again) hotplug.  ramfb needs an fw_cfg
> > entry for configuration, and fw_cfg entries can't be hotplugged.  So
> > hotplugging vfio-pci with ramfb=on isn't going to fly.  So we need a
> > separate device with hotplug turned off.
> 
> Well if that's not supposed to work ever, libvirt's hotplug code could format
> the following FWIW:
> "-device vfio-pci [opts],ramfb=off"
> 
> As such, new device wouldn't be that of an issue for libvirt if vfio-pci and
> vfio-pci-ramfb are back to back compatible with all the device options that are
> available for vfio-pci (I mean in terms of using an mdev). Because in that
> case, what libvirt could do is to look whether we're supposed to turn on the
> display, if so, then we need support for this in capabilities to query and then
> we could prefer this new device over the "legacy" vfio-pci one. However, if we
> expect a case where QEMU would succeed to start with an mdev mapped to this
> new ramfb device but not with vfio-pci, then that's an issue.

vfio-pci and vfio-pci-ramfb are identical, except for the later having a
boot display (with display=on), and vfio-pci-ramfb not being
hotplugable.  So, yes, all pcu/mdev devices should work with both
vfio-pci variants.

> But I'm still curious about the ramfb=off possibility I asked above
> for hotplug nonetheless.

Well, the problem is introspection.  qemu can report via qmp whenever a
specific device supports hotplug.  A device which can both be
hot-pluggable or not hot-pluggable depending on some condition is a
problem here ...

cheers,
  Gerd

