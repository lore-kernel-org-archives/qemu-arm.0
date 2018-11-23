Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2216773wrt;
        Fri, 23 Nov 2018 07:59:41 -0800 (PST)
X-Google-Smtp-Source: AJdET5eviTInoRL+tg/TT21U6VI7p6YdDSU9gwvaBLG5+McS8fQEIKn6VCyJoZnKDRNLM7q3u/tY
X-Received: by 2002:a5b:b89:: with SMTP id l9-v6mr15763208ybq.259.1542988780929;
        Fri, 23 Nov 2018 07:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542988780; cv=none;
        d=google.com; s=arc-20160816;
        b=TZOQawy/oJ2y0LQ8Ji2CZV35MzSNIFBLY6ICV8AyZMp6c94vQyratBGg8KZUMxFFx/
         nTQ2RyBF4I4zbHpsc8i7YE8iYyxG3CE1MrJJo2EZy44v5dnUoOfsSBoqh7ZMwYbCeSn0
         Pbej66XjDR5VKDB7y32kD54+L1r0SVTZ+ooSOr5IL9R31D6+ZW1aQoXYwbsssM/8pA9a
         sPQjBDtouqsBG+1iIT57Lw1Qjec/Ktmh29xiGAp0McPaC7imPqeXy9vfWJZsu4k4ZJ7d
         gu2zSilPAqlhJO+VvvuZJZHhl5uMAHkkiMtxEYWTr8bxCZFLfu0RBEa7XUacDIM0qWtd
         i3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Hrd9fHz0fpi+TXFaYVEJKA8bheDQ54lsfDosabzEvrc=;
        b=tAXH2e9qPQXaarCAh/dxg4HmgmcoLLbOWtSvRgi4HSaMdLribAMf/V73yS+5bENtmK
         p9N4UsjjwBjLujP7pwqHNOzwCjtf2UXa9oLgb2HAz3TC/ltM+MxlgNLd3l3fUKue5+nx
         keaTs+FSwPdlsXZ0JFDmECr4aCrZBYIXx1BldMg+1fDqlHWqwyFTOGTkFXwmpJ3CTZvs
         sQYNj7If9atOYGtsN3RRhGCHxTKxi2srX5Abu/EPghr1QdV+jHJB6rtIEnMAFrPzZ1Qp
         mFz+5jShZ2xW+EGp+6BWJNx6fwn6mTCdeCSWxNiemJTAVwBYOcSLwQ7nzhjdu37XjQb2
         nrRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 132-v6si31142238ybz.138.2018.11.23.07.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 07:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53206 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQDro-00081t-E5
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 10:59:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gQDrc-0007ye-SX
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 10:59:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gQDrY-00078s-SA
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 10:59:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gQDrY-00075x-Lf; Fri, 23 Nov 2018 10:59:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A07E1A7E1;
	Fri, 23 Nov 2018 15:59:22 +0000 (UTC)
Received: from redhat.com (ovpn-121-146.rdu2.redhat.com [10.10.121.146])
	by smtp.corp.redhat.com (Postfix) with SMTP id AFE381054FCF;
	Fri, 23 Nov 2018 15:59:21 +0000 (UTC)
Date: Fri, 23 Nov 2018 10:59:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181123105915-mutt-send-email-mst@kernel.org>
References: <20181122133507.30950-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181122133507.30950-1-peter.maydell@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 23 Nov 2018 15:59:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.0 0/2] Rename
 cpu_physical_memory_write_rom() to address_space_write_rom()
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
Cc: patches@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x2cIwdGLv6Me

On Thu, Nov 22, 2018 at 01:35:05PM +0000, Peter Maydell wrote:
> The API of cpu_physical_memory_write_rom() is odd, because it
> takes an AddressSpace, unlike all the other cpu_physical_memory_*
> access functions. We note this oddity as a TODO in the
> docs/devel/loads-stores.rst documentation.
> 
> Rename cpu_physical_memory_write_rom() to address_space_write_rom(),
> and give it an API that matches address_space_write().
> We also adjest the cpu_physical_memory_write_rom_internal()
> function which is local to exec.c similarly.
> 
> thanks
> -- PMM


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> Peter Maydell (2):
>   exec.c: Rename cpu_physical_memory_write_rom_internal()
>   Rename cpu_physical_memory_write_rom() to address_space_write_rom()
> 
>  include/exec/cpu-common.h   |  2 --
>  include/exec/memory.h       | 26 ++++++++++++++++++++++++++
>  exec.c                      | 30 +++++++++++++++++++-----------
>  hw/core/loader.c            |  4 ++--
>  hw/intc/apic.c              |  7 ++++---
>  hw/misc/tz-mpc.c            |  2 +-
>  hw/sparc/sun4m.c            |  5 +++--
>  docs/devel/loads-stores.rst | 35 ++++++++++++++++-------------------
>  8 files changed, 71 insertions(+), 40 deletions(-)
> 
> -- 
> 2.19.1
