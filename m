Received: by 10.25.21.156 with SMTP id 28csp1586646lfv;
        Tue, 26 Jul 2016 01:31:18 -0700 (PDT)
X-Received: by 10.200.43.174 with SMTP id m43mr36329540qtm.74.1469521878528;
        Tue, 26 Jul 2016 01:31:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x142si20317172qka.115.2016.07.26.01.31.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 01:31:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRxll-0004gM-Rb
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 04:31:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRxeQ-0006na-UM
	for qemu-devel@nongnu.org; Tue, 26 Jul 2016 04:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRxeO-0003tO-LV
	for qemu-devel@nongnu.org; Tue, 26 Jul 2016 04:23:41 -0400
Received: from mail-yw0-x231.google.com ([2607:f8b0:4002:c05::231]:36198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRxeN-0003tF-JE
	for qemu-devel@nongnu.org; Tue, 26 Jul 2016 04:23:40 -0400
Received: by mail-yw0-x231.google.com with SMTP id u134so190370395ywg.3
	for <qemu-devel@nongnu.org>; Tue, 26 Jul 2016 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iT8SJvA83XfJ8Pxl70LeZm/L+9AI7RSTrCq9DkQmUwM=;
	b=ARMMR4ZO477ePKxj40s56eM7QW7UxQU0DVpLJRKL2h9n1yxo+/2cuYPf3dFPXvt0ke
	O8OTk3XqM+pymhkvCYI/Ty1/rLjvQ8H65ylrx6kS/O0UmCGRvfiu5j75jDPIWq03B3IU
	vA1bYHsZWywIWxFmh+3R/uGC0L01bkSAio+7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iT8SJvA83XfJ8Pxl70LeZm/L+9AI7RSTrCq9DkQmUwM=;
	b=LAPW1MxcB3FUQNycLIKyoRh/dF8glkj1p6ZwIyOqFik+9ST1FV8s9d/raFqs8H+SQD
	WIxFBdNSVrRujCGxx8ZICh78eAHHFgLEU5ZOvosQwwDJZGZcfIh0plloZ/dbBDjoxq7P
	K553rZBziYsMgr6zhLjWbRtsUK9s/wJJXAUPqu2KPrbKDJFAcWqWJ8DrKDu+mI7lDT2y
	eVLPSDLTqgBmAO74GfmA4w5I/76eO3iZg43aX3+QAsM3Lt9a1cs5J1zFIJZzD/7viRtU
	dwJYl6vqtIGx5RH/aFQVwSwekNjfoW6bh2Dty3GZFAYTjagcn9hNW/7hjIrE71NARaIC
	021g==
X-Gm-Message-State: AEkoous/r+Z6pAblMHOG3QtbPz2tyxSOUVXYn2fHkwhL0B2ZngwAhg7+z3Hu+I3rB47Ci4fLxSd2uE7RjoGwhmsk
X-Received: by 10.159.41.69 with SMTP id t63mr10190537uat.66.1469521419203;
	Tue, 26 Jul 2016 01:23:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Tue, 26 Jul 2016 01:23:19 -0700 (PDT)
In-Reply-To: <7b410430974a47af9750f1666ac37d70@nmail01.hynixad.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-4-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA-_MMatknCSDDRX-V7MiM1rJzvWHYwc_Eurt1b_xyajaQ@mail.gmail.com>
	<7b410430974a47af9750f1666ac37d70@nmail01.hynixad.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2016 09:23:19 +0100
Message-ID: <CAFEAcA_OqPCjnyU=oB+ncUCPiycjj3x0SK4duov2Wu3ThtYoUw@mail.gmail.com>
To: "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::231
Subject: Re: [Qemu-devel] [RFC PATCH 3/3] hw/arm/virt: add nvdimm emulation
 support
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hCJNgveHLRL2

On 26 July 2016 at 08:03, kwangwoo.lee@sk.com <kwangwoo.lee@sk.com> wrote:
> Hi Peter,
>
> Please, check the comments below. Thanks a lot!
>
>> -----Original Message-----
>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>> This seems to be missing code to write the device tree
>> information about whatever this device is?
>
> Is it OK to just add a memory region which cannot be used without ACPI?
> This is unclear to me. If you suggest that it is better way, I'll revise
> this patch to add a device tree node. Please, help me to understand.

They don't necessarily both have to be added in the exact same patch
if it's less confusing to split it, but the series as a whole
should support both DT and ACPI (and your kernel patches also
ought to have both DT and ACPI bindings I think).

thanks
-- PMM
