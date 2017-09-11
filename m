Received: by 10.223.172.38 with SMTP id v35csp5477752wrc;
        Mon, 11 Sep 2017 05:53:22 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBfC7cJikUISlQRJLtdyX4bkfQ7+2sBM/Np+/44dJoo52mt5rOKeVrMcyIDMRRv38T8FCWu
X-Received: by 10.55.152.132 with SMTP id a126mr6259838qke.49.1505134402236;
        Mon, 11 Sep 2017 05:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505134402; cv=none;
        d=google.com; s=arc-20160816;
        b=rxj36/x+EFuUw6V0RdvZeGPPsdFpuCkb41UWGXoPG8OYcCBpnjZZkfCuGMQF0y7re1
         LWq/mssIgxq33XSJauRuMTOlDxQfMRtmzYXAL967Adm/D5mwt/hOIX/eMnoRzXEQjs9G
         NIWfBZ0EL2YzPp9kfdcJxL4zgfEQUYEV0EOjpNwx1HSYY556cnZyJFoUt9DRkYl/rg2V
         qW798i8JS5X+LfeAaPbRdIYgrogG9KxbsxScDM9aGz9IsbhqXZlmF9pD7qOlTlwNgIU0
         02zHPnuIg6k9qruvxAtUzySw+xehCY659qwlp/i+PL1/6TfepxsShaxURb5xkFHuM8+w
         LUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=ZP0sFxPklPEVsc09yfMRWp3zxjNgg09ReBlBnSH5s7I=;
        b=eX76RFFF6+jGOGsCKVR3W1E+ln1mGvyDPshgJSWJqh8K5a8XPqs+DGJQ7GRffzESUg
         5y2yD1DObgpoUoy6ixrserxa9LdL9G6lLNlRsfvbl2wOeVQq/5OEJTBomT29xuVJv8OJ
         SU98+63/8765DTsC8vBE1FHnNvjs1L/6vaOkUZ34gvJH77e+BsN4FbW8Vdcem8nagHUW
         bazAHLYBCm5jEEGSlHAKMA6s/MpcIvMTjsI3t8/EmcXj4K0GFE9CgXCvCJit2rHtz8rB
         NzkO6yENL4RsN5xVZiMNXKDU0Tbe15PFmYYFX8ha2ZkuCkDLuRFB5p4eITuKFQxhFWfS
         F0WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4si9567126qtj.403.2017.09.11.05.53.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 05:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drODI-0005PG-16
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 08:53:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1drOD7-0005Ow-S3
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 08:53:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1drOD3-0004oV-6b
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 08:53:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10911)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1drOD3-0004oL-0A; Mon, 11 Sep 2017 08:53:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D59E01490F0;
	Mon, 11 Sep 2017 12:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D59E01490F0
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=drjones@redhat.com
Received: from hawk.localdomain (ovpn-204-91.brq.redhat.com [10.40.204.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8F5763645;
	Mon, 11 Sep 2017 12:52:48 +0000 (UTC)
Date: Mon, 11 Sep 2017 14:52:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170911125245.plvcrojgsvnxz6zb@hawk.localdomain>
References: <1499634139-20399-1-git-send-email-eric.auger@redhat.com>
	<1499634139-20399-4-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499634139-20399-4-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 11 Sep 2017 12:53:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RESEND v3 3/3] hw/pci-host/gpex:
 Implement PCI INTx routing
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
X-TUID: f8B1S9QL2KZA

On Sun, Jul 09, 2017 at 11:02:19PM +0200, Eric Auger wrote:
> From: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
> 
> Now we are able to retrieve the gsi from the INTx pin, let's
> enable intx_to_irq routing. From that point on, irqfd becomes
> usable along with INTx when assigning a PCIe device.
> 
> Signed-off-by: Pranavkumar Sawargaonkar <pranavkumar@linaro.org>
> Signed-off-by: Tushar Jagad <tushar.jagad@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/pci-host/gpex.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 0d42ac2..94cc3c1 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -53,6 +53,17 @@ int gpex_set_irq_num(GPEXHost *s, int index, uint32_t gsi)
>      return 0;
>  }
>  
> +static PCIINTxRoute gpex_route_intx_pin_to_irq(void *opaque, int pin)
> +{
> +    PCIINTxRoute route;
> +    GPEXHost *s = opaque;
> +
> +    route.mode = PCI_INTX_ENABLED;
> +    route.irq = (int)s->irq_num[pin];
> +
> +    return route;
> +}
> +
>  static void gpex_host_realize(DeviceState *dev, Error **errp)
>  {
>      PCIHostState *pci = PCI_HOST_BRIDGE(dev);
> @@ -77,6 +88,7 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
>                                  &s->io_ioport, 0, 4, TYPE_PCIE_BUS);
>  
>      qdev_set_parent_bus(DEVICE(&s->gpex_root), BUS(pci->bus));
> +    pci_bus_set_route_irq_fn(pci->bus, gpex_route_intx_pin_to_irq);
>      qdev_init_nofail(DEVICE(&s->gpex_root));
>  }
>  
> -- 
> 2.5.5
> 
>

Wouldn't need the cast if irq_num was an array of ints, but otherwise
 
Reviewed-by: Andrew Jones <drjones@redhat.com>
