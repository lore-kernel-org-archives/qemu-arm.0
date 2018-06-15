Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp646618wrq;
        Fri, 15 Jun 2018 02:59:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIK8BmfPRdfRPoxh67l8T/Rl2urlsPRJJo7EMld4NdusKG773AAuBRPvDo0OPyRSq0MI40j
X-Received: by 2002:a37:4249:: with SMTP id p70-v6mr656270qka.297.1529056772207;
        Fri, 15 Jun 2018 02:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529056772; cv=none;
        d=google.com; s=arc-20160816;
        b=PpCy0Gd5yqQTXSGkrXZKCi1TW9F3RccXCCHnEH5KdPDcE6r011lPrbSDkEw1bpm2c+
         rVQy1Tp2eqAeGX1xCDZVZrBCPfKMw3oqdeblSMtuEAgTcz0QqOYvP5q/Pw2fT78r5YuS
         Op2WuBAOPbEdnI8JT9juqxTWINUsWYG+WyoXNRCtJSoedykZhotGk+N3S+UtMF/hHDW6
         miPvGU2NsHWAH9FVJyww7+ZPBStoORAxZZsZamyoDa+C7dZWumVq7Kft16BOryZCAouo
         7WTmJi5CjZXXFdIvSF4V6bbpuXsHOXoXXwE3vK1AxpLd1rmkRv5EHHDlgh4mxPRbEX9T
         KjUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=3n/0lGCGuiuwv2VPUguj+t65KycJXs3d5rLO1zHgO2s=;
        b=TuFHnQ3Y727BJiVgOOKGlgd6q2GsBpNu2JmLIZMxSaQ1LxOgTfkBrVujaU8ACIfEeo
         PhDLV2u4jV38sh+vtL+YFOmyVZr8uB4Yglxe2KkLy8R2GgBiOKEeDGk0k9EbsrtErTCq
         nPDgo7FnTUTOuI8Dc3rOa7N969VHPHcOaTkTzikTDdv3pwkGvsRQTZElL2i7KC8LsULx
         tJM9whQGsVY6+PRqY7UE7ps5AJuN/py5blsEPUp2J0zw8xUD7j0onO5T6H/nEmOD5s9I
         /Cpc/ObFIM3g3Lw13+GwEr3yeJrV2jN/Mux6S7QhbZrBKRl2tYYNUTvywOUBsIiHTFy4
         DIig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3-v6si2729677qte.81.2018.06.15.02.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 02:59:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTlVz-0001z2-Nw
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 05:59:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fTlVl-0001xI-Pu
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 05:59:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fTlVi-0007kf-Nk
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 05:59:17 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46696 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fTlVi-0007j5-HX; Fri, 15 Jun 2018 05:59:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52FB440122A1;
	Fri, 15 Jun 2018 09:59:13 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73CE92166BB6;
	Fri, 15 Jun 2018 09:59:11 +0000 (UTC)
Date: Fri, 15 Jun 2018 11:59:09 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20180615115909.1c7df252.cohuck@redhat.com>
In-Reply-To: <1529056145-6404-1-git-send-email-thuth@redhat.com>
References: <1529056145-6404-1-git-send-email-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 09:59:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 15 Jun 2018 09:59:13 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v3] loader: Check access size when calling
 rom_ptr() to avoid crashes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rMrMS5kMXlQU

On Fri, 15 Jun 2018 11:49:05 +0200
Thomas Huth <thuth@redhat.com> wrote:

> The rom_ptr() function allows direct access to the ROM blobs that we
> load during startup. However, there are currently no checks for the
> size of the accesses, so it's currently possible to crash QEMU for
> example with:
> 
> $ echo "Insane in the mainframe" > /tmp/test.txt
> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -append xyz
> Segmentation fault (core dumped)
> $ s390x-softmmu/qemu-system-s390x -kernel /tmp/test.txt -initrd /tmp/test.txt
> Segmentation fault (core dumped)
> $ echo -n HdrS > /tmp/hdr.txt
> $ sparc64-softmmu/qemu-system-sparc64 -kernel /tmp/hdr.txt -initrd /tmp/hdr.txt
> Segmentation fault (core dumped)
> 
> We need a possibility to check the size of the ROM area that we want
> to access, thus let's add a size parameter to the rom_ptr() function
> to avoid these problems.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v3: Fix the check in find_rom()
> 
>  hw/core/loader.c     | 10 +++++-----
>  hw/mips/mips_malta.c |  6 ++++--
>  hw/s390x/ipl.c       | 13 ++++++++++---
>  hw/sparc/sun4m.c     |  4 ++--
>  hw/sparc64/sun4u.c   |  4 ++--
>  include/hw/loader.h  |  2 +-
>  target/arm/cpu.c     |  2 +-
>  7 files changed, 25 insertions(+), 16 deletions(-)

> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 04245b5..bcac204 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c

> @@ -195,8 +199,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>               * we have to overwrite values in the kernel image,
>               * which are "rom"
>               */
> -            stq_p(rom_ptr(INITRD_PARM_START), initrd_offset);
> -            stq_p(rom_ptr(INITRD_PARM_SIZE), initrd_size);
> +            romptr = rom_ptr(INITRD_PARM_START, 16);
> +            if (romptr) {
> +                stq_p(romptr, initrd_offset);
> +                stq_p(romptr + 1, initrd_size);

INITRD_PARM_SIZE seems to be unused now. We can remove it in a separate
patch if you don't respin, though.

> +            }
>          }
>      }
>      /*

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
