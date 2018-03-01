Received: by 10.28.91.67 with SMTP id p64csp1579998wmb;
        Thu, 1 Mar 2018 00:41:35 -0800 (PST)
X-Google-Smtp-Source: AG47ELt1HmpdjQsezQq7SW9+IgDtlaZ+WjaZvrOZDfJ+UBazMpY9wDY/zQvKwZNjgA90NJI8K1xu
X-Received: by 10.129.216.13 with SMTP id d13mr520195ywj.167.1519893695794;
        Thu, 01 Mar 2018 00:41:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519893695; cv=none;
        d=google.com; s=arc-20160816;
        b=ICj4b2BiNXNtAIMfQglFadKJEL35UaNORxfiu/mXX6HWNOWhJ4LjTxlRzjp95oxlFT
         iw/U+rPTWHmYme0OCA6Ebr+og4U16DvdsDKwx4N+ygme7A6jhcIVkIfyTQQpRU1P/Hlc
         UrNI9iTKGN9Y0WRwZX86ogt1jJ9Sc2akAXo/xF8KREdGxbe2d3ns3ytJHsoQI/Bkrs+1
         Y6Qu5rk1tlX6n0lJzA2Seu0ElaX7t7opoxfjlHppzwe83TglchPrmmIawYWEbz87QwZy
         Ix2FMv+j+nh/dCvlR4zic59NrxJW9lvMvgjCY+f/hyMCDOkvVdmlQjFm7GHLZEnxt1YC
         OjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=PhyJ3ntK9oElGqhlqhkqTbpdiOmjHu3HEAv5ay2fxsg=;
        b=eSAXx9knTg9hFhhMCv/AQA1GkVjj82yuVc6HOuPpbZ2dcDNjr1hynIvPQMXZV7AmNP
         DEI+VvSFjaJQ7Dxi7q6C1S5Tv0VDn8vJ6oKWqQmAU8IKpqlg9zx/6Sm7UoP37SEdDB2e
         0NCZ6uFObxOThCG0d9uhgYptEEc+cZEoCO8mCzZAgbWDXSFjsnGEUNpcmqTxmN60aujO
         Lz6AHb5j3BAq2wbAx7jkxEV3jPOYfQludpdkbco443VKouY6GxptpLhj87/d5vvlzSNb
         JQt0xQj8qRoUdLetF8+XkAYt7tKdrRV5g2F2BNGp9tHvri2PNzDLTlGJvfSixvNrt/Pr
         78OA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k10si584021ywl.783.2018.03.01.00.41.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 00:41:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erJmR-00061M-9X
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 03:41:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erJmJ-000619-G3
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 03:41:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1erJmE-0005DU-Jr
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 03:41:27 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41972 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1erJmE-0005Cy-Dp; Thu, 01 Mar 2018 03:41:22 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C251EAEA0;
	Thu,  1 Mar 2018 08:41:11 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 908FE2144B26;
	Thu,  1 Mar 2018 08:41:05 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
	<1519827835-239519-6-git-send-email-imammedo@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b36a0028-ba18-fa57-8992-450857be6b40@redhat.com>
Date: Thu, 1 Mar 2018 09:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1519827835-239519-6-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 01 Mar 2018 08:41:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 01 Mar 2018 08:41:11 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v2 05/10] acpi: move ACPI_PORT_SMI_CMD define
 to header it belongs to
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cmToOXXvW4Vv

Hi,

On 28/02/18 15:23, Igor Mammedov wrote:
> ACPI_PORT_SMI_CMD is alias for APM_CNT_IOPORT,
> so make it really one instead of duplicating its value.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  include/hw/isa/apm.h | 3 +++
>  hw/i386/acpi-build.c | 2 --
>  hw/isa/apm.c         | 1 -
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/isa/apm.h b/include/hw/isa/apm.h
> index 4839ff1..b7098bf 100644
> --- a/include/hw/isa/apm.h
> +++ b/include/hw/isa/apm.h
> @@ -5,6 +5,9 @@
>  #include "hw/hw.h"
>  #include "exec/memory.h"
>  
> +#define APM_CNT_IOPORT  0xb2
> +#define ACPI_PORT_SMI_CMD APM_CNT_IOPORT
> +
>  typedef void (*apm_ctrl_changed_t)(uint32_t val, void *arg);
>  
>  typedef struct APMState {
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index b85fefe..699f3a0 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -255,8 +255,6 @@ static void acpi_get_pci_holes(Range *hole, Range *hole64)
>                                                 NULL));
>  }
>  
> -#define ACPI_PORT_SMI_CMD           0x00b2 /* TODO: this is APM_CNT_IOPORT */
> -
>  static void acpi_align_size(GArray *blob, unsigned align)
>  {
>      /* Align size to multiple of given size. This reduces the chance
> diff --git a/hw/isa/apm.c b/hw/isa/apm.c
> index e232b0d..c3101ef 100644
> --- a/hw/isa/apm.c
> +++ b/hw/isa/apm.c
> @@ -34,7 +34,6 @@
>  #endif
>  
>  /* fixed I/O location */
> -#define APM_CNT_IOPORT  0xb2
>  #define APM_STS_IOPORT  0xb3
>  
>  static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
> 
