Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3738004wrt;
        Fri, 30 Nov 2018 08:01:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U43vLqKzMvSZ/qqE2C5T3jEAlBP3FkN6N8acoQMyeLYH0l4QoQPFEG+1ToYFPLE70VZ5Wo
X-Received: by 2002:a25:f450:: with SMTP id p16-v6mr6010576ybe.363.1543593713393;
        Fri, 30 Nov 2018 08:01:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543593713; cv=none;
        d=google.com; s=arc-20160816;
        b=Am7PCLMd4Y0HltXkDcm35Uz46DDPMa5nWaNc/gdCXhhDC9tEn2CBPn9ynmerNsyogf
         ed5uykXIkR8y6RcG3rY0u9a35DqBtm9FUpCCjP/R9v4AaUL3K9qQLArC6lP31O9cuq/i
         Ca6+JyPtKpXevJlZNdA2khOlSCZ/BtvdFft8Ue3YN9p4x1YDSDCkKL9uP90sLqrs0PKJ
         OzAN6CqrIQ4g6LrhQ9mSQ9hSfggYvw0yaSgLIFiA2XnpvKZAToUSYxs2JzcbxS/3bNCW
         pC4Wy13+LQOV+0bsxfEnmoRYGbbmPN2UMy0314OCK+gA/pcBLOpOyq6DxQcU2qNPy+mN
         EwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=7sohb85qGoZNwxE4ksP314gp+D6YfXDsHEKz4IBNTwM=;
        b=KD/bjTdAXilvCfH9TCrWtvCg2xVb71OPqaaeqLFq/5onlQVsl4DgHST4jZLF/tre/b
         nzpLa35N7RSJlQ5aY74fwXqdpNV1m8u+SIhz52FQ2VTwT28uM1MJz2WpV1P8BIee2jhH
         +uzEVgCwCMox+nOcN69M/Jgko6f8stKpXSil4rdTUBL6DM7fhHD7N7f+A68ESl68vjiJ
         wp+xpU9bh6VM7IFbApAHDZ5ZQncSHfW6m/wEw0Rtz26JUoEp4iqsxQsZ59jXC6XZoIMD
         OOp7whz9JqCRy7GL8UCM3TifXFHtguE7TgGac+CxJl3liyjhXg7wbdJvUgDxqhLt46y+
         yfEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f82si3436951ywc.257.2018.11.30.08.01.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:01:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSlEm-0005rC-TK
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:01:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSlEa-0005pR-NY
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:01:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSlEV-0004tW-3m
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:01:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53418)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSlEU-0004W5-Pu; Fri, 30 Nov 2018 11:01:34 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52E37307DAA0;
	Fri, 30 Nov 2018 16:01:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 163531019639;
	Fri, 30 Nov 2018 16:00:59 +0000 (UTC)
Date: Fri, 30 Nov 2018 17:00:57 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181130160057.i2ucjyprf5t3vs5l@kamzik.brq.redhat.com>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-10-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543407172-16175-10-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 30 Nov 2018 16:01:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V10 9/9] pvpanic : update
 pvpanic document
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GG1K0bjJggn9

On Wed, Nov 28, 2018 at 08:12:52PM +0800, Peng Hao wrote:
> Add mmio support info in docs/specs/pvpanic.txt.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  docs/specs/pvpanic.txt | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index c7bbacc..b1beea3 100644
> --- a/docs/specs/pvpanic.txt
> +++ b/docs/specs/pvpanic.txt
> @@ -1,14 +1,17 @@
>  PVPANIC DEVICE
>  ==============
>  
> -pvpanic device is a simulated ISA device, through which a guest panic
> -event is sent to qemu, and a QMP event is generated. This allows
> +pvpanic device is a simulated ISA/SYSBUS device, through which a guest

Why add the ISA/SYSBUS here? It's not really the best use of '/', IMO,
I'd just drop that as the ISA and SYSBUS is pointed out later.

> +panic event is sent to qemu, and a QMP event is generated. This allows
>  management apps (e.g. libvirt) to be notified and respond to the event.
>  
>  The management app has the option of waiting for GUEST_PANICKED events,
>  and/or polling for guest-panicked RunState, to learn when the pvpanic
>  device has fired a panic event.
>  
> +The pvpanic device can be implemented as an ISA device (using IOPORT), 
> +or, since qemu 4.0, as a SYSBUS device (using MMIO).
> +
>  ISA Interface
>  -------------
>  
> @@ -19,6 +22,13 @@ Software should set only bits both itself and the device recognize.
>  Currently, only bit 0 is recognized, setting it indicates a guest panic
>  has happened.
>  
> +SYSBUS Interface
> +----------------
> +
> +The SYSBUS interface is similar to the ISA interface except that it uses
> +MMIO. For example, the arm virt machine could put the pvpanic device at
> +[0x9070000, 0x9070001] and currently only the first byte is used.

instead of '] and currently'. I'd write '], where currently'

> +
>  ACPI Interface
>  --------------
>  
> -- 
> 1.8.3.1
> 
> 

Otherwise 

Reviewed-by: Andrew Jones <drjones@redhat.com>
