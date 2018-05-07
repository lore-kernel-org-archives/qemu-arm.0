Received: by 10.28.4.212 with SMTP id 203csp2692526wme;
        Mon, 7 May 2018 00:51:50 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZq/9icvX9Oinu3gg1c6aetXKE0nh6HScwpNqcRu2SK0d2tZ1YwpVgExDlYo/LHb3B8FNHhF
X-Received: by 10.233.224.8 with SMTP id m8mr30036360qkk.73.1525679510273;
        Mon, 07 May 2018 00:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525679510; cv=none;
        d=google.com; s=arc-20160816;
        b=dxY5hmRZ1/GYIZ3VU8u00DEvnF0gt+7qjwNqJB4nuT6t1r5wqLnd65NY8qg0ebIfkf
         gfOsZbms86lU5GEFmmdT9tPXt0UXvxmdIzXiMEkBsZSijtsyOdMgfAvoaNKpGCk5x9LH
         i7myme4Jye/wng8zZYgssUiHywbQUI/HNpHL337ctBOA9PCONoGuC+375zWnLJksob6B
         +YUIidV6suomV6n/LkJPTGlmlAQ8BpqFj5j31agOZeyLQ3MU65/f1IOax06owFf5apYW
         uTFvgrTvfUHf19uW2XpP1Ccaz+7gCygryclIfls0uquphJY7Xkta59jBHa6pX4mg9a1a
         Fk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=Xzq24LQsqN8I2utyWCRj3/Cm+BjzUqbVNnUv/pVRJ30=;
        b=nq+dwnU7gCNOmJWQMkW6M4vJnAKZVpPUeXhKJA29VrqkeOWyVO+xIiXUrlvgs/x1Wc
         H8oFVGnX2aEhjYGcLqskSablVITqxMhshHs+HIAngBj9wvh9sCsyvZkuUlrtWozKzT07
         Po7HkB7m9jELGagwc0zsb+o2p48jQY3JEkB/SdKMys24f5mlFJ5RZlWS+ipo8w9CAM1r
         Tq9IJzp4NgG3a7Q9ZPHld/f97Od5fFNl7nqgzCUlKhgY7bOXTKqIyXTRMe4oqXPabhMi
         CaHOPY9SYhJ0nGrOUTjuC8nKL8LyNadPXlwnq1qgcVZwE52v0OlfzdC1ta0izPQte3Wn
         eL9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u36-v6si10619379qtb.18.2018.05.07.00.51.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 00:51:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFaw1-0007il-Oo
	for alex.bennee@linaro.org; Mon, 07 May 2018 03:51:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fFavv-0007if-Ad
	for qemu-arm@nongnu.org; Mon, 07 May 2018 03:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fFavs-0002CK-8a
	for qemu-arm@nongnu.org; Mon, 07 May 2018 03:51:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40672 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fFavs-0002Bs-3v; Mon, 07 May 2018 03:51:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5022FEB71E;
	Mon,  7 May 2018 07:51:34 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B70C7C37;
	Mon,  7 May 2018 07:51:27 +0000 (UTC)
Date: Mon, 7 May 2018 09:51:26 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180507095126.2fd146b7@redhat.com>
In-Reply-To: <CAFEAcA-6nkVOEBc59H0mcgnRy9ifPRoRjUrvJ_4Gcr94GdjuSQ@mail.gmail.com>
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9nG0_Eq1QWsCJMA6TKbZ_tf6mXWCVTrkxrFO5-UkmEvw@mail.gmail.com>
	<CAFEAcA-6nkVOEBc59H0mcgnRy9ifPRoRjUrvJ_4Gcr94GdjuSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 07 May 2018 07:51:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 07 May 2018 07:51:34 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v3 0/5] arm: isolate and clean up dtb
 generation
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g4jzTEQaYmeU

On Fri, 4 May 2018 17:28:55 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 3 May 2018 at 16:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 1 May 2018 at 13:08, Igor Mammedov <imammedo@redhat.com> wrote:  
> >>
> >> Changelog v2->v3:
> >>    * drop already merged patches
> >>        'arm: always start from  first_cpu when registering loader cpu reset callback'
> >>        'ppc: e500: switch E500 based  machines to full machine definition'
> >>    * add small not related cleanup
> >>        'arm: boot: set boot_info starting from first_cpu'
> >>    * add extra suggested patch
> >>        'make sure that we aren't overwriting mc->get_hotplug_handler by accident'
> >>    * make sure that dtb_limit initialized to 0
> >>    * drop stale comment
> >>    * drop not needed line movement
> >>    * drop not needed extra new line
> >> Changelog v1->v2:
> >>    * drop "arm: reuse  arm_boot_address_space() in armv7m_load_kernel()"
> >>    * move "arm: always start from first_cpu  when registering loader cpu reset callback"
> >>      at the begigning of series and rebase
> >>    * add "ppc: e500: switch E500 based machines to full  machine definition"
> >>      and rebase 4/5 on top of it
> >>    * fixup typo in virt_machine_get_hotpug_handler() name
> >>    * add doc comment to skip_dtb_autoload field
> >>    * 1-2/5 are queued in respective arm/ppc trees and are included for series
> >>      completness so it would be easier to test, I expect series to go through
> >>      arm tree
> >>  
> >
> > Applied to target-arm.next, thanks.  
> 
> Doing further testing within target-arm.next shows that this series (and
> specifically patch 3/5) causes segfaults for the "no DTB provided" case.
> 
> $ gdb --args ./build/x86/arm-softmmu/qemu-system-arm -M vexpress-a15
[...]

> arm_load_dtb() is trying to call the binfo->get_dtb() hook and is not
> handling the case where it is NULL (which it is on pretty much every
> board except "virt").
> 
> (You get a segfault with an actual guest kernel as well; I just used
> /dev/null here as an easy no-dependencies-required repro case.)
> 
> I've left patch 4 in target-arm.next as that was a standalone bugfix,
> but have dropped the rest of the series for now.

Fix is really trivial, I've lost have_dtb() guard, while consolidating
multiple load_dtb() calls into one.
I'll respin v4 shortly with fixed 3/5.


> thanks
> -- PMM

