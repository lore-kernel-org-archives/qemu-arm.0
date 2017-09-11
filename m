Received: by 10.223.172.38 with SMTP id v35csp5463725wrc;
        Mon, 11 Sep 2017 05:42:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA/Nr3p4nsUVgwnZ+ct1GfnMKAgIC1oyhoAEj64txYWb10Af1WBUaYnVWPSwZQ1SIOQ4obZ
X-Received: by 10.55.198.152 with SMTP id s24mr16034643qkl.3.1505133740798;
        Mon, 11 Sep 2017 05:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505133740; cv=none;
        d=google.com; s=arc-20160816;
        b=gmXol7DS/BxwAqMhCuMB08tJxc17Se5VlftaV16ubqHAYmIBNjUNiWkaU2ZO8OEMrF
         +09rB2/RRvCxwI8W7sy1mMkkqs8resG1IwpRAMZ+fEaIYcyi3QHdhDy5ectKjxYf09st
         GvXh61gpvwjL2S4qypBQGyBLNCboHK+Lou5JoxOdeHq3FCUSIW2wITAHdLUuU+IcVHhn
         QY6AcmJno/y2q3lB1d4FSBn8BDHCCNLoUT1I46DxIde68sq3LvYwQc5Jdgl3h+/Ni65n
         AC4cXIC3uQ2diGkAlA3DEFyh7X7jaD7kVJlveIL/2o+8uZF9vr0emBSxkHmgfnMUA3t1
         AqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=aY9rtc65u72GmoizthvoR9hLDj5SZystVNy1at63E/w=;
        b=gl+24AZBRFcewJ6SMCftqhBMdQRqetZtUTCfxZiYDxD78AJhE/M3RMyA9Rw5IJVtSa
         zxBreTktHqxQf0knYE9XPq/27LaaaOm3/6vBp13qScHqz5NiFPGrIKGsBrs7bNxCntzN
         w3SCh4iD9OfC/b3YIoXdfoaIx6ye+jPXdcIE1SN1xbG2AnKJluhtTOQT43kIhT+bOtBt
         AUoIKe5bXZXIAyV0/0hHI7JUrSudSc31gZhghAaIr83xjFYYAp+hH35/CmRpEsRylbJ4
         DXZ2OWvOwLe1BmgRDklbpTVNj+vjiRRrLu9dkP7m468QQvmyQHc+uHxAQooBeYfUkVV3
         /PlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y196si9545105qky.425.2017.09.11.05.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 05:42:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drO2c-0001Z8-JA
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 08:42:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1drO2V-0001WE-M5
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 08:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1drO2R-0000hZ-IG
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 08:42:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1drO2R-0000gx-D5; Mon, 11 Sep 2017 08:42:07 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 907CF54F53;
	Mon, 11 Sep 2017 12:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 907CF54F53
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from hawk.localdomain (ovpn-204-91.brq.redhat.com [10.40.204.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D346B649D1;
	Mon, 11 Sep 2017 12:41:56 +0000 (UTC)
Date: Mon, 11 Sep 2017 14:41:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170911124154.lpckigdp32kfiisd@hawk.localdomain>
References: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
	<1499634139-20399-2-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499634139-20399-2-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 11 Sep 2017 12:42:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RESEND v3 1/3] hw/pci-host/gpex:
 Set INTx index/gsi mapping
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
X-TUID: nF67VWuypb2+

On Sun, Jul 09, 2017 at 11:02:17PM +0200, Eric Auger wrote:
> From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
> 
> To implement INTx to gsi routing we need to pass the gpex host
> bridge the gsi associated to each INTx index. Let's introduce
> irq_num array and gpex_set_irq_num setter function.
> 
> Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
> Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/pci-host/gpex.c         | 10 ++++++++++
>  include/hw/pci-host/gpex.h |  3 +++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 83084b9..0d42ac2 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -43,6 +43,16 @@ static void gpex_set_irq(void *opaque, int irq_num, int level)
>      qemu_set_irq(s->irq[irq_num], level);
>  }
>  
> +int gpex_set_irq_num(GPEXHost *s, int index, uint32_t gsi)
> +{
> +    if (index >=  GPEX_NUM_IRQS) {
                    ^extra space
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
> index 68c9348..db26b3e 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -51,6 +51,9 @@ typedef struct GPEXHost {
>      MemoryRegion io_ioport;
>      MemoryRegion io_mmio;
>      qemu_irq irq[GPEX_NUM_IRQS];
> +    uint32_t irq_num[GPEX_NUM_IRQS];

This is an int when calling gpex_set_irq_num() and then used as an int
later, requiring a cast. Why not just make it an int here and in the API?

>  } GPEXHost;
>  
> +int gpex_set_irq_num(GPEXHost *s, int index, uint32_t gsi);
> +
>  #endif /* HW_GPEX_H */
> -- 
> 2.5.5
> 
> 
