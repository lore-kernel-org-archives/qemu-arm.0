Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp193861wrw;
        Thu, 8 Nov 2018 06:26:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5d0pQOULMsis5IajiO0BXBgi6uIIoGrBfbdgN8BVtt+j92yGbckGhI+WpmqKHM/A22h6vAu
X-Received: by 2002:ac8:3d91:: with SMTP id v17mr4617703qtf.263.1541687174145;
        Thu, 08 Nov 2018 06:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541687174; cv=none;
        d=google.com; s=arc-20160816;
        b=qaaa3hkyAk/msbFHcfNEgpURbduR6AaYJn+CX2X8jsU+9E480Lb8eoyd/znrONoM/X
         W8WI5WxvGzuaSlnYE+68GGoM1YzKzZcElIjcfdLHgptTBREu1+fGMCAh61s9JImiKz4e
         Yb5kGw2aZ1Aytf6fL7D5ZdmiSnE73NC6ty4Bgmc5s4AaopK/Zdl5b+glPA7NVitQCAsd
         l/8yM77wuaCrMtO9oxgcKfibK6a8mK0hdtDNQRDzsU5DQgv9smnXe9lp3MmUp9JbQhVI
         oWPc1XiaLxDS33dy+03Oyuk1dltH4yf6QJPK3NDNznkddhnMa5ekbbzf50lZj0p7OwgB
         FzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=2nKQwOTsme5jBoFhn66+tOWEKOb9NQeIVvMbaoXQgUI=;
        b=Ih6kRNVEbtMPSse62bfPn3wGgDSNRGSmRB2MP85gH/YSNNei73rvAYbvolU40uN20a
         aq50MmgZhMgdvO261//gQG+tjPMHtZDfvHjt0AU/0qI4LZBwLckY8x6IfLTxTAAc8kaN
         3BSXr6FUdo5B3JnIQztoG5W7qLO4PTUQHUnWV5lQFVAyQ/p2mX1Q+lfPnqkQZj7qZ2kN
         GvvfGD5IFuozS/Dixltkz1d9Wlzk+wCoUf2gcz1MUDrPXTliX1xYPLj/G4fTtJW4UurU
         dh5h5Sz4NrJYwHgbaT8Pbt/IOjXvvQapQ1HzV1JVKj3CZx+3VgdLroB/MZ9NplNbOSc6
         Jc1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s31si1141466qvj.140.2018.11.08.06.26.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Nov 2018 06:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKlG9-0001my-LF
	for alex.bennee@linaro.org; Thu, 08 Nov 2018 09:26:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gKlDu-0000cU-VO
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 09:23:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gKlDu-0002bK-6F
	for qemu-devel@nongnu.org; Thu, 08 Nov 2018 09:23:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gKlDp-0002Xy-S5; Thu, 08 Nov 2018 09:23:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85AC92D7F8;
	Thu,  8 Nov 2018 14:23:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32A5B672C7;
	Thu,  8 Nov 2018 14:23:43 +0000 (UTC)
Date: Thu, 8 Nov 2018 15:23:41 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181108152341.68e5a147@redhat.com>
In-Reply-To: <20181105014047.26447-17-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-17-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 08 Nov 2018 14:23:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 16/24] hw: acpi: Fix memory hotplug AML
 generation error
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A4hvZSElJZrh

On Mon,  5 Nov 2018 02:40:39 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> From: Yang Zhong <yang.zhong@intel.com>
> 
> When using the generated memory hotplug AML, the iasl
> compiler would give the following error:
> 
> dsdt.dsl 266: Return (MOST (_UID, Arg0, Arg1, Arg2))
> Error 6080 - Called method returns no value ^
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

I suggest to put this patch at the beginning of the series
before reference tables in test are updated.

> ---
>  hw/acpi/memory_hotplug.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index db2c4df961..893fc2bd27 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -686,15 +686,15 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>  
>              method = aml_method("_OST", 3, AML_NOTSERIALIZED);
>              s = MEMORY_SLOT_OST_METHOD;
> -            aml_append(method, aml_return(aml_call4(
> -                s, aml_name("_UID"), aml_arg(0), aml_arg(1), aml_arg(2)
> -            )));
> +            aml_append(method,
> +                       aml_call4(s, aml_name("_UID"), aml_arg(0),
> +                                 aml_arg(1), aml_arg(2)));
>              aml_append(dev, method);
>  
>              method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
>              s = MEMORY_SLOT_EJECT_METHOD;
> -            aml_append(method, aml_return(aml_call2(
> -                       s, aml_name("_UID"), aml_arg(0))));
> +            aml_append(method,
> +                       aml_call2(s, aml_name("_UID"), aml_arg(0)));
>              aml_append(dev, method);
>  
>              aml_append(dev_container, dev);

