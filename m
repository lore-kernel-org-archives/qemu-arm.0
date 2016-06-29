Received: by 10.25.21.96 with SMTP id l93csp2016506lfi;
        Wed, 29 Jun 2016 00:00:59 -0700 (PDT)
X-Received: by 10.200.51.212 with SMTP id d20mr10403088qtb.14.1467183659309;
        Wed, 29 Jun 2016 00:00:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y135si2022911qky.58.2016.06.29.00.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Jun 2016 00:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bI9UY-0003Hi-Pm
	for alex.bennee@linaro.org; Wed, 29 Jun 2016 03:00:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bI9UU-0003Hd-BM
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 03:00:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bI9UT-0000Ta-7m
	for qemu-arm@nongnu.org; Wed, 29 Jun 2016 03:00:54 -0400
Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235]:35765)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bI9UT-0000TW-3J; Wed, 29 Jun 2016 03:00:53 -0400
Received: by mail-ob0-x235.google.com with SMTP id o10so300078obp.2;
	Wed, 29 Jun 2016 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HyX6I9Ufch+L3glVmrcfy5aWN3vFAuk1CfhN7qu0l/c=;
	b=HrujjZTQUDYpFexTrd0t8uAnjuxIyCzINmdMRJL4AkQrYL+qP1SBYfnCgmp6bgUW1y
	RIovCRY/nYN+FveBOvwr4esgVMB0ievdydikSxQsfornwEaye1CSDhLzEBg2++fV2GU1
	0F2YyKPE8j4MoSMGGwVb2rxHVUDGPvaEFQT7uVv+AQL4qsIHkiyU5D/IdVaPyu8ZzYUh
	qVFEo9xdA1GfsbU72bIRqmN8GF5UezVpVxDiNQrfOIOrxCKYuKyALDwhZZjqsMT6iy6e
	JFHHNG6UBF7K9E1apalJgAZvy1XfzooYcHZB8pl40zHwhnYrmrRml3nqjmjJvHD8ujF0
	nhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HyX6I9Ufch+L3glVmrcfy5aWN3vFAuk1CfhN7qu0l/c=;
	b=F4vbfz5Yz94Uufs/G5iHu5jT42ZM9r8lIRg4woFdWTKUzkULn8W07/0n6DVgXOdAFu
	vTGE5I4/OHxCmLz8Slnh8sA1lXonI4SiAlsgF8ZrLBEeS1ARehp6pX8AWYfzScwstqws
	ZrAHOALwMqVIC5jA0uXgdJlOeDDzDNKcYYNTER5lptY86CDRqfTZ0GO/ZOPkLcgGghCl
	sHx0ffpOtMB5f/XrA81dBT2DOrFQLdCe9mAgj9WOwW9xQI7oleFtQOIvobeUtDR3Eyn8
	xhlSyheDFbL0JaxO50tK5/tJXIoIxR5u9uiUz75OE6DWmIIAmGjnQgdN6Plj3M0DYIPk
	zAWA==
X-Gm-Message-State: ALyK8tIhtxQRh5iBuYh3n9ksxVO1O+7HflktFYeI+46f1VjMenBsGXV5eEY6AhzEt4seAZnSP7wwL9v6cB8v0A==
X-Received: by 10.202.68.6 with SMTP id r6mr4566151oia.53.1467183652183; Wed,
	29 Jun 2016 00:00:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.37.201 with HTTP; Wed, 29 Jun 2016 00:00:51 -0700 (PDT)
In-Reply-To: <BLUPR0701MB1684CF1920D922BD00E93EE6F2230@BLUPR0701MB1684.namprd07.prod.outlook.com>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8iPStWP4Pcf6Bxmn8gL5SnBDFyrPNDUpi8syc7PC_QiQ@mail.gmail.com>
	<BLUPR0701MB1684CF1920D922BD00E93EE6F2230@BLUPR0701MB1684.namprd07.prod.outlook.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Wed, 29 Jun 2016 12:30:51 +0530
Message-ID: <CALicx6tbpSZDBYYzA0Uk5dHGoW-4_CTFuUnUDDe+NGieakts+g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::235
Subject: Re: [Qemu-arm] Fw:  [PATCH v2 0/6] Runtime pagesize computation
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
Cc: "prasun.kapoor" <prasun.kapoor@cavium.com>, patches@linaro.org,
	QEMU Developers <qemu-devel@nongnu.org>, "Kumar,
	Vijaya" <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RxavFlX6WVQo

On Wed, Jun 29, 2016 at 12:24 PM, Kumar, Vijaya <Vijaya.Kumar@cavium.com> wrote:
>
>
>
> ________________________________
> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Tuesday, June 28, 2016 1:46 PM
> To: qemu-arm; QEMU Developers
> Cc: Paolo Bonzini; Kumar, Vijaya; Patch Tracking
> Subject: Re: [Qemu-arm] [PATCH v2 0/6] Runtime pagesize computation
>
> On 21 June 2016 at 18:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This set of patches is a development based on the ones from Vijaya:
>> the general idea is similar but I have tried to improve the interface
>> for defining the page size a bit.  I've also tweaked patches 2 and 3
>> to address code review comments.
>
>> NB: I have only very lightly tested these and haven't attempted
>> to measure performance at all. There is an assert() in the
>> definition of TARGET_PAGE_BITS which is good for making sure
>> it isn't used before it's valid but not so good for speed.
>
> Vijaya, are you in a position to test this patchset for
> performance? Presumably you have a test case benchmark you're
> looking to improve here?

I have tested the patches and the test case that I was trying was
Live migration of Idle VM on arm64 platform.
VM migrated is with 4 VCPUS and 8GB RAM running CentOS.

With page bits 10 (1K), the live migration time is 5.8 sec

capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 5857 milliseconds
downtime: 102 milliseconds
setup: 14 milliseconds
transferred ram: 336081 kbytes
throughput: 470.21 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 8271539 pages
skipped: 0 pages
normal: 261340 pages
normal bytes: 261340 kbytes
dirty sync count: 3

With page bits 12 (4K), live migration time is 2.9 sec

capabilities: xbzrle: off rdma-pin-all: off auto-converge: off
zero-blocks: off compress: off events: off x-postcopy-ram: off
Migration status: completed
total time: 2974 milliseconds
downtime: 76 milliseconds
setup: 5 milliseconds
transferred ram: 301327 kbytes
throughput: 830.30 mbps
remaining ram: 0 kbytes
total ram: 8519872 kbytes
duplicate: 2062398 pages
skipped: 0 pages
normal: 70662 pages
normal bytes: 282648 kbytes
dirty sync count: 3

Regards
Vijay
>
> thanks
> -- PMM
