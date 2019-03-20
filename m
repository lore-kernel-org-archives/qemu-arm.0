Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp1044696wrt;
        Wed, 20 Mar 2019 11:42:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWyv7RQLO9YHl+hqQlTtDVhI5IRQsmP7w9Cy/w2th/3YA1Z/KzvM6g/cDvp6a5odJkyxzh
X-Received: by 2002:a1c:2d4c:: with SMTP id t73mr9338953wmt.142.1553107344463;
        Wed, 20 Mar 2019 11:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553107344; cv=none;
        d=google.com; s=arc-20160816;
        b=WrezLyBBLhkQ0U4rAuTyqxeKAGe57YWQc4t1NDXsHvdgQtBm7FpKpXbFvQWQCyTG3V
         YSf2Q/atzKvKT6hUa2oaLvTMb3zoPHIyuWVw1Qk4HGCUXVmw3HopHdnBZrhRV5OyP11J
         DHKJdSzmz7ybNNHQF56su/Cy/j/+vcbxh0y/JqyV94Zc1HCvU0sOxlwGo3stxfm/hTY6
         sGP4GYh+aDbrMDO3O7HPcS4r0clnDMtwRZIWNFCKrsfgQ0d2N8VSyXi8AmBKfFfFI5V1
         QTHoMRT5jpFVwGA8cT3MpMgoCidbaZBtdmsk5co6Nqw63MG3tz+9sxsiPcsfYW2ztFO0
         UEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=75CeD0IFwJi3khujqpz4U9LqEV2OZQu4dHZpbEFkJtk=;
        b=gR4TNodaZKd4e9lRHuxb5aJirdjV0JiCZzO6ycN2uPuCcFhv0ktJAxF68URHWuOd/V
         Rf5q9Ylk496qNUpB00ccYFM7wEMG42DSqAUpgGTMa2dwFD4Ds3pR8SDoBMUHkG9cvSBk
         FwyWXu/24B2fqJGpHolbQpcNJWaSTkp/xFeeMhNS/fgbpP3obe82oW6tDC3jZV48uRPs
         YZtHw/5cNSuKNAegf1jfHxWZrsx0LtXVl1n56GwzuHuqDxSQtAc4ZOAGompAAE6m+Lzf
         uLlZOB8VoDKfqeUhjI4KWBRTbye04UW0SBuf6fvRQpX1+Z5zVOWWhWVtojXw7BinseiK
         cbRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si3981602wmh.5.2019.03.20.11.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Mar 2019 11:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h6gAR-0001j6-HP
	for alex.bennee@linaro.org; Wed, 20 Mar 2019 14:42:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h6g7f-0008Rq-9D
	for qemu-devel@nongnu.org; Wed, 20 Mar 2019 14:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h6fxk-0003Vm-Ei
	for qemu-devel@nongnu.org; Wed, 20 Mar 2019 14:29:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42453)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h6fxj-0003Tr-3h; Wed, 20 Mar 2019 14:29:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3CB8B31587B3;
	Wed, 20 Mar 2019 18:29:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-132.ams2.redhat.com
	[10.36.116.132])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C50E5D71C;
	Wed, 20 Mar 2019 18:29:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D379E1138648; Wed, 20 Mar 2019 19:29:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>
References: <87d0mwatbu.fsf@dusky.pond.sub.org>
	<875zsed86y.fsf@dusky.pond.sub.org>
	<20190320122108.GN11621@perard.uk.xensource.com>
Date: Wed, 20 Mar 2019 19:29:07 +0100
In-Reply-To: <20190320122108.GN11621@perard.uk.xensource.com> (Anthony
	PERARD's message of "Wed, 20 Mar 2019 12:21:08 +0000")
Message-ID: <8736nh1jt8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 20 Mar 2019 18:29:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Maintainers,
 please tell us how to boot your machines!
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>, Alexander Graf <agraf@suse.de>,
	=?utf-8?Q?Herv=C3=A9?= Poussineau <hpoussin@reactos.org>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
	Jan Kiszka <jan.kiszka@web.de>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MkS7881crA4a

Anthony PERARD <anthony.perard@citrix.com> writes:

> On Tue, Mar 19, 2019 at 07:34:45PM +0100, Markus Armbruster wrote:
>>     = hw/xenpv/xen_machine_pv.c =
>>     Stefano Stabellini <sstabellini@kernel.org> (supporter:X86)
>>     Anthony Perard <anthony.perard@citrix.com> (supporter:X86)
>>     Paul Durrant <paul.durrant@citrix.com> (supporter:X86)
>>     xen-devel@lists.xenproject.org (open list:X86)
>
> That machine requires Xen to be started and at least one service,
> xenstore.
>
> In dom0, when it's used to attach more disks to dom0:
>
> $QEMU -M xenpv -xen-domid 0 -xen-attach \
>         -name dom0 -nographic  -daemonize \
>         -monitor /dev/null -serial /dev/null -parallel /dev/null \
>         -nodefaults -no-user-config
>
> Communication is then done via xenstore to attach disks, we would use
> `xl block-attach` for that.
>
> Another example, when we start a guest and want to attach qcow disk and
> VNC. Our tool stack (xl / libxl) would first create the domain then
> start QEMU:
>
> $QEMU -machine xenpv -xen-domid 6 -xen-attach \
>         -name pv-arch \
>         -chardev socket,id=libxl-cmd,path=/var/run/xen/qmp-libxl-6,server,nowait \
>         -mon chardev=libxl-cmd,mode=control \
>         -no-shutdown -nodefaults -no-user-config \
>         -vnc 0.0.0.0:0,to=99 \
>         -display none -m 1024
>
> Is that enough information?

At a glance, yes.  Thanks!

> Also, we do automated tests of QEMU. It is done by `osstest' and the
> results are sent to xen-devel@lists.xenproject.org.
> One example of a test result:
>     https://lists.xenproject.org/archives/html/xen-devel/2019-03/msg01577.html
>
> Thanks,
