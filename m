Received: by 10.223.172.38 with SMTP id v35csp944374wrc;
        Wed, 13 Sep 2017 04:45:58 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBjjgIMoQoRMDUFGNdzCN7JjaxwCZKxFsjR1rNdQ1N2XrA+wZyjcYliYKk3U9zgse5C6rqt
X-Received: by 10.200.28.47 with SMTP id a44mr27635682qtk.256.1505303158322;
        Wed, 13 Sep 2017 04:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505303158; cv=none;
        d=google.com; s=arc-20160816;
        b=OKANGUG4YWzcBzSbmzkWzZjmCTNLTxga2irDEA/7/ZCKAajOtD9FmOActVDHJSEXok
         jWd28Dx1f3ZtzrKboeFKCuxHl5MV8pKNsJFYRjK3dW0WI0CzQYvIwg5RqW+N8TLx/7Ym
         r6vxuDKQl5ptnyztPngR/uKEJsdXzXMWnfg3J3jc8fSJmUY0iw+HTxW6X/iN3Qqt9de2
         +Tiy5CDaD2/QemcbN/Sn4ZOv3msNvKiBFLibdKJk+dIi8dWV6BYfz5MIgss7hvW6Mti2
         BIW/gkZCMlobJfdV/wv5hsuN88yYOzbja2RMEXR/dTGNTEa/DxJfRdZ/QgzSlqn1YY/G
         37cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=gNheZQJXNrBIzOvE9N2yfa8q4gUnWCUgeot6CvzlnOk=;
        b=Dm990UekjaOYeAOhEdP7LlYCaFcg0D53NFvRVvW97ToOccA//8iv+Ew5TB+4xi7Qaj
         /QolxXzFqIaxoXH7MezASBUrzY9vLV44HX4jXy3f4TTbKo54qFZgctRAYe1s/4XSb+Mf
         VQYHP2rj5u7WKjJpk1o4cffe86iPHi0wqAQlVdcaV/1I23HbbqX6cA3XL4thFrPPQkT/
         /JpTJQQYiGPyAyu2yjR5pt4Fe2KcivZE0SsMYkwgv9tvIl4eCtwzhoHiS+BqbPC/lAcL
         +CWojodZG2YUxpSz6eY1NJezv4YvHSx+KaLSjz1K3RaI8t7ka3deKfIgPAaZm7YIY2D8
         b/cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m11si4267513qtb.313.2017.09.13.04.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 04:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds67A-0005CT-6s
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 07:45:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ds672-0005BH-BX
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 07:45:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ds66x-0001W6-Tt
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 07:45:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35118)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ds66x-0001VE-Kp; Wed, 13 Sep 2017 07:45:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF1E4C04B924;
	Wed, 13 Sep 2017 11:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CF1E4C04B924
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6166B69A7D;
	Wed, 13 Sep 2017 11:45:33 +0000 (UTC)
Date: Wed, 13 Sep 2017 13:45:30 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170913114530.wrfnw72wdyyf55fz@kamzik.brq.redhat.com>
References: <1505296004-6798-1-git-send-email-eric.auger@redhat.com>
	<1505296004-6798-2-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505296004-6798-2-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 13 Sep 2017 11:45:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 1/3] hw/pci-host/gpex: Set INTx index/gsi
 mapping
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, agraf@suse.de,
	alex.williamson@redhat.com, qemu-arm@nongnu.org,
	pranavkumar@linaro.org, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IW+rNke4wf/H

On Wed, Sep 13, 2017 at 11:46:42AM +0200, Eric Auger wrote:
> From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
> 
> To implement INTx to gsi routing we need to pass the gpex host
> bridge the gsi associated to each INTx index. Let's introduce
> irq_num array and gpex_set_irq_num setter function.
> 
> Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
> Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Feng Kan <fkan@apm.com>
> 
> ---
> 
> v3 -> v4:
> - use int for gsi
> ---
>  hw/pci-host/gpex.c         | 10 ++++++++++
>  include/hw/pci-host/gpex.h |  3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 83084b9..41a884d 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -43,6 +43,16 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
>      qemu_set_irq(s->irq[irq_num], level);
>  }
>  
> +int gpex_set_irq_num(GPEXHost *s, int index, int gsi)
> +{
> +    if (index >= GPEX_NUM_IRQS) {
> +        return -EINVAL;
> +    }
> +
> +    s->irq_num[index] = gsi;
> +    return 0;
> +}
> +
>  static void gpex_host_realize(DeviceState *dev, Error **errp)
>  {
>      PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index 68c9348..aef38b8 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -51,6 +51,9 @@ typedef struct GPEXHost {
>      MemoryRegion io_ioport;
>      MemoryRegion io_mmio;
>      qemu_irq irq[GPEX_NUM_IRQS];
> +    int irq_num[GPEX_NUM_IRQS];
>  } GPEXHost;
>  
> +int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
> +
>  #endif /* HW_GPEX_H */
> -- 
> 2.5.5
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
