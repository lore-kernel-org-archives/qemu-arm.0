Received: by 10.80.166.35 with SMTP id d32csp1186196edc;
        Tue, 18 Oct 2016 13:30:59 -0700 (PDT)
X-Received: by 10.31.194.206 with SMTP id s197mr2619357vkf.101.1476822659057;
        Tue, 18 Oct 2016 13:30:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h20si14479004vkd.41.2016.10.18.13.30.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 13:30:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwb2I-0001SZ-IL
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 16:30:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48263)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwb1k-0001SE-C6
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 16:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bwb1j-0006Fy-Eo
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 16:30:24 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1bwb1j-0006FI-40
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 16:30:23 -0400
Received: by mail-vk0-x22d.google.com with SMTP id 2so7487688vkb.3
	for <qemu-devel@nongnu.org>; Tue, 18 Oct 2016 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o+e+75NXfQEbNbSBXpZ6QVGPn4SMI2eVBeusjlsToIc=;
	b=N5X+WZdT+1U5KuUVa6P8Axfe4Ojvombs7b9oaFVesvC41Fwc2PgXGcxc4CTAGz/T/i
	1TbpdjEll8YihXDrN+N1hzeNMyztlkGr2vrGMJtqib7o6njrgquL4tKBRDbbFpZz+yfL
	wJuhgRMllOeVu8bY0cYvIq6dVl0o/7o6b+IE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o+e+75NXfQEbNbSBXpZ6QVGPn4SMI2eVBeusjlsToIc=;
	b=LmHkYyzQjBGUuMGiV6L0WMHso+dQRnljyq4n1MK0kQ7SLJHldPOIRyAgXsOIKYnxLk
	THxJ3SxHF+t4xsQ3UtfoDAdOuNK6yqlOGvNVE/6wTEen4acOzO7/x8gjZqdmu1UGqZW6
	UZhXvsFjSRZIXUZb+w9UbMrWYlw6pgotP469B7sAUZkHjRiyMpFTmNZJdSwXddYZhAyU
	/B0uN4STlgpIeJYG+Yk3C+wh7stFhnCcb0/PWNf49lkqqd8hcgNBrKKTNe8SBlg6g21f
	1biRZ+/my4OfgIPRs3k5nh/fCviFLhfgYJigxDmcz5Kb45T8/C7z6OQABO33lLsR2zlm
	8KBg==
X-Gm-Message-State: AA6/9RnIsrzn4ypfKvRD5vDbGDzUITwAImCkClZPY70pgjhIWPeOV9CW3pP+MDAf5ERUbYeAl5X29W/u08rSEU5l
X-Received: by 10.31.64.75 with SMTP id n72mr2342653vka.170.1476822622439;
	Tue, 18 Oct 2016 13:30:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 18 Oct 2016 13:30:01 -0700 (PDT)
In-Reply-To: <20161018184532.GC3275@thinpad.lan.raisama.net>
References: <1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
	<20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
	<20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
	<CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
	<20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
	<CAFEAcA-TxifV3Wfnv=6byJSABnLyPnbtfMsK+aPvwGd-p5sqLA@mail.gmail.com>
	<20161018184532.GC3275@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2016 21:30:01 +0100
Message-ID: <CAFEAcA8nCjr2Zz2no3DikyGtRtYRm+ieouatfOJnynkzpJ+thg@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-devel] QOM properties vs C functions/fields (was Re:
 [PATCH v3 2/3] exec: rename cpu_exec_init() as cpu_exec_realizefn())
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n0SEvE3uMoSD
Message-ID: <20161018203001.3nluNmaV5DB4Kxe196FEwcc6abmecSFxZ6Mbm-b47NE@z>

On 18 October 2016 at 19:45, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Tue, Oct 18, 2016 at 07:12:51PM +0100, Peter Maydell wrote:
>> We actually have a concrete instance in the tree at the moment:
>> the raspberry pi 2. Specifically hw/arm/bcm2836.c sets the
>> mp_affinity for each cpu to 0xF00 | n (where n is the CPUID).
>> Currently it's doing that by reaching in and messing with
>> the mp_affinity field directly, but really it ought to be
>> doing it by setting a property on the CPU, and what it
>> wants isn't somethnig that can be expressed with a simple
>> nr_sockets/nr_cores/etc scheme.
>
> I am confused now. I thought QOM properties were meant for
> user-visible and/or user-configurable data. I assumed that if
> it's only meant to be used by C code inside QEMU, C functions
> and/or C struct fields were the way to go.

Lots of stuff in a device's C struct is strictly internal
and not to be messed with. I thought that QOM properties
were essentially how a device defined its public (and
typically settable-only-once) config knobs. QOM properties
shouldn't be user-facing (read: stable, required to be
backwards-compatible) interface in general because
we don't really want to tie ourselves down that much.
In fact almost all our QOM objects are not usefully
user-facing at all.

thanks
-- PMM
