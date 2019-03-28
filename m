Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1108497wrx;
        Thu, 28 Mar 2019 14:34:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2k4xWSR66mleWB2Wuvb/tLZJWoPs3SPALwyKr0O0pw3+iI0b4Rtra5SODPGJsUeqmtfIz
X-Received: by 2002:a5d:60cf:: with SMTP id x15mr27836001wrt.96.1553808881707;
        Thu, 28 Mar 2019 14:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553808881; cv=none;
        d=google.com; s=arc-20160816;
        b=cc7+g29WwbvhzHt9/bMmGAua6fUcEX1gwwlLdbPkZ0HkKvBuP4KulatwoRTSkXxuM0
         AAXmk84qCGGT6gtFAiueP6zW8DOHYX18kMcXy5MNBohF7MpHItd/XzsQ7yBuqaCdx6e6
         UztBrx3GLtY9zNJkR6L44/z8jGa6gDQY7W0yjroRBKog+0Y+MhLrxOGPWi2yOlnw9cEi
         saaAZCf5jXAOnsRUo0C50fLd47ot7t5iIiDAOhSHid0bpSzg/BdczEdcJQ3YRy8dyR2F
         d2f6z9vb/qfV2RbGVEXJr2O/PpHvwUMvQTd8gr6cXHmziLLWHvl4UQmEQhXqRynXTlE9
         nvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to;
        bh=nbDWhd60SsfU3ZUR8ok23Y8SJ0f5wHEVjyxvkxsmnbA=;
        b=O0VKh6koI6LK9wGipZbvXEGaeWRH2IrbxXlr5ZdiVeQA516DZWZMJ2P6ALk7s3F9O3
         67wAohiArwaQsINP3b9o9r+cq2WH9vHzm86Cy72HrqxN1+8/eOUnOEdFPA3HAGeMhWIl
         PHBrnBO8hXuZ9RIwecNrpXSO73sjSVxoN59bQ8vC+VxZdeMBiZpLw6FzWGwBNBfOQxBU
         AguBJbdgJ23oe+QlyAWCNtfOHLVKEgEMqr+Qnw1H0zg/HQ7Q1iLdopzprnvkzC7BKiNA
         g0j1K6wUj23w0EZ5zduD4LypvnsZlE3nDZHcYQ+b7NqShGZ7rYv60LYlXM9YRu4/r9mD
         du0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si51209wrx.177.2019.03.28.14.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 14:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9cfY-0008Qc-Qn
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 17:34:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1h9cfH-0008JL-PX
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 17:34:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1h9cfG-0003Yb-N4
	for qemu-devel@nongnu.org; Thu, 28 Mar 2019 17:34:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56882)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wainersm@redhat.com>)
	id 1h9caN-0001R1-Hb; Thu, 28 Mar 2019 17:29:19 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5249E59454;
	Thu, 28 Mar 2019 21:29:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-118.rdu2.redhat.com
	[10.10.122.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B7091001DDA;
	Thu, 28 Mar 2019 21:29:15 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190328152944.3199-1-peter.maydell@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <4eb279f0-be5a-6250-678d-bec430d8473b@redhat.com>
Date: Thu, 28 Mar 2019 18:29:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190328152944.3199-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 28 Mar 2019 21:29:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 for-4.1] hw/arm/raspi: Diagnose requests
 for too much RAM
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rlSnE278Zjip


On 03/28/2019 12:29 PM, Peter Maydell wrote:
> The Raspberry Pi boards have a physical memory map which does
> not allow for more than 1GB of RAM. Currently if the user tries
> to ask for more then we fail in a confusing way:
>
> $ qemu-system-aarch64 --machine raspi3 -m 8G
> Unexpected error in visit_type_uintN() at qapi/qapi-visit-core.c:164:
> qemu-system-aarch64: Parameter 'vcram-base' expects uint32_t
> Aborted (core dumped)
>
> Catch this earlier and diagnose it with a more friendly message:
> $ qemu-system-aarch64 --machine raspi3 -m 8G
> qemu-system-aarch64: Requested ram size is too large for this machine: maximum is 1GB
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1794187
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2: use '>', not '>='...
>
>   hw/arm/raspi.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 66899c28dc1..fe2bb511b98 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -12,6 +12,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/units.h"
>   #include "qapi/error.h"
>   #include "qemu-common.h"
>   #include "cpu.h"
> @@ -175,6 +176,12 @@ static void raspi_init(MachineState *machine, int version)
>       BusState *bus;
>       DeviceState *carddev;
>   
> +    if (machine->ram_size > 1 * GiB) {
> +        error_report("Requested ram size is too large for this machine: "
> +                     "maximum is 1GB");

1GB vs 1GiB... maybe the message should display "GiB" to avoid any 
confusion?

Also I was wondering what is need for Patchew to start catching errors 
like in v1.

- Wainer

> +        exit(1);
> +    }
> +
>       object_initialize(&s->soc, sizeof(s->soc),
>                         version == 3 ? TYPE_BCM2837 : TYPE_BCM2836);
>       object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),

