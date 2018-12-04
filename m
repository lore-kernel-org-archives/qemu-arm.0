Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8157186wrt;
        Tue, 4 Dec 2018 06:51:05 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WqYvjmzxGwjzj0XmcukAf/fX0/wWUd8j4/bXVhwfUETF+kMTWCnwO1/SZ384ktBKthr3wJ
X-Received: by 2002:ac8:2b99:: with SMTP id m25mr19648069qtm.36.1543935065705;
        Tue, 04 Dec 2018 06:51:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543935065; cv=none;
        d=google.com; s=arc-20160816;
        b=yIs9SXkMWmgaNs7cURioqG+2AljiNDmO40uofVcah4GTQxqC7bbbnTgyBLpMbHOcoH
         A/epb22xALWHBIZMASl0QaSv9+OjFykTHFkhJpWnHci+DCO1Ip9pBAAfeAvAF/ra5Tep
         s2a6n3u94EtkDG/TyOgC1EMg2SOU5LcApinBPPGX8TYoGKe5ZbUSluYhHgSwQHNgnQBD
         zKwkMs00337AmmubKESiJG93aac/sR4sWgMF5babVIGxR3hGtKVSIUOE8yGc+wN9UDFk
         W17e1V6l0z3c/YcVPt4M/U0Jff7QxJjz8DpIbW9T04SV7ynHUOaKWtUvGkcMA8hIhHQt
         E9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=LlXoOj9Zm6mc/afawckRHXMWa51DkiAmvV41KzY6I/I=;
        b=GcBTEaE3Dra1KZ2DKIj9kBUi+1mN4rvUYTaCwjJHEJ9tR7gBxgVTg7h8Lw9H4BzvbB
         hu9nZ3kQ3xQXhm4zTJ8i7dgYb+No5pIsA27PGPdLJkjoZSB0BojJ7uHoHTblBKmOec2x
         vsimQ+0GSN7K7Z42ORErdlICv/PLd1rLaftvhHO6oc0eKeT+ZjrD+K9bLZGLtmJhg26S
         093W9gxi/2GBRAwmfz+ZjKnPCcgt0EE7dn48/LPSJq7ikbO2kb5HMp1Ch/ufeWJruszM
         YnT+khpM4ilo/U432jxJToZbIDai3d+h1315N4vn7Rnc8Ij+aEGC+GmHoH/bdNeNkkPU
         6V/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o89si1165485qko.41.2018.12.04.06.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 06:51:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUC2T-0002j0-8u
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 09:51:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gUC0y-0001VU-1b
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:49:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gUC0q-0007JM-Vi
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 09:49:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49012)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gUC0q-0007IA-PH; Tue, 04 Dec 2018 09:49:24 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA899C05B1E7;
	Tue,  4 Dec 2018 14:49:23 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 473A55C25D;
	Tue,  4 Dec 2018 14:49:16 +0000 (UTC)
Date: Tue, 4 Dec 2018 15:49:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181204144913.2awwajttbtu2cjur@kamzik.brq.redhat.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
	<20181130130032.11835-5-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181130130032.11835-5-sameo@linux.intel.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 04 Dec 2018 14:49:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 4/8] hw: arm: Carry RSDP
 specific data through AcpiRsdpData
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ldzRTMWOBN10

On Fri, Nov 30, 2018 at 02:00:28PM +0100, Samuel Ortiz wrote:
> That will allow us to generalize the ARM build_rsdp() routine to support
> both legacy RSDP (The current i386 implementation) and extended RSDP
> (The ARM implementation).
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  include/hw/acpi/acpi-defs.h |  8 ++++++++
>  hw/arm/virt-acpi-build.c    | 18 +++++++++++++-----
>  2 files changed, 21 insertions(+), 5 deletions(-)
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
