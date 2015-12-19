Received: by 10.182.158.201 with SMTP id ww9csp1904239obb;
        Sat, 19 Dec 2015 13:46:11 -0800 (PST)
X-Received: by 10.140.39.179 with SMTP id v48mr14839531qgv.98.1450561571717;
        Sat, 19 Dec 2015 13:46:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s20si22869181qks.111.2015.12.19.13.46.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:46:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAPKN-0005hL-3J
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:46:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPKI-0005aS-MD
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 16:46:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPKH-0002ny-Se
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 16:46:06 -0500
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:36476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAPKB-0002mm-5b; Sat, 19 Dec 2015 16:45:59 -0500
Received: by mail-pf0-x230.google.com with SMTP id o64so67329347pfb.3;
	Sat, 19 Dec 2015 13:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OviQFM8Z6DlsgXagMi3aWlk1ABc64YGwkJ++2ourZNc=;
	b=v2tQ/eocbV+EHmgcu+WwZYU8EwqDWBrqJS58CbSxb0wcKz9RZ6I4lPaJW4WRc72bBx
	MB5IHESQJOv4v9cm1cy0tP951uoGKU9kW19VG4tRlMHIk3z0ChHfsIQ+FnUYRRWpsUJv
	02hCZIuiUa2WLLUygLNiivXXtDb6H1kUjcT58NJ1f/mb1hcyId4YMbU9BXT47OijUyPE
	mEkLUQBTyg+SGKLcomknCMX0y1+jX+C2jwaxHbRl9ddVUADx98BDHY0uwADLbrDZr7jV
	MwTMbevZv7cVF/9RJ51EAngtNtd99U0hNotA0ka4TsPT3Hk/TcnrYfgt4XeVawfEUC1V
	SyoQ==
X-Received: by 10.98.70.193 with SMTP id o62mr10569006pfi.32.1450561558509;
	Sat, 19 Dec 2015 13:45:58 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155])
	by smtp.gmail.com with ESMTPSA id 13sm19081115pft.5.2015.12.19.13.45.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:45:57 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Sat, 19 Dec 2015 13:45:50 -0800
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151219214550.GK4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-11-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449851831-4966-11-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::230
Cc: Kevin O'Connor <kevin@koconnor.net>, Markus Armbruster <armbru@redhat.com>,
	patches@linaro.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 10/10] hw/sd/pxa2xx_mmci: Add reset function
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z05fCwk7TK7c

On Fri, Dec 11, 2015 at 04:37:11PM +0000, Peter Maydell wrote:
> Add a reset function to the pxa2xx_mmci device; previously it had
> no handling for system reset at all.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
>  hw/sd/pxa2xx_mmci.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
> index 81fec4d..3df927e 100644
> --- a/hw/sd/pxa2xx_mmci.c
> +++ b/hw/sd/pxa2xx_mmci.c
> @@ -510,6 +510,35 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
>      pxa2xx_mmci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
>  }
>  
> +static void pxa2xx_mmci_reset(DeviceState *d)
> +{
> +    PXA2xxMMCIState *s = PXA2XX_MMCI(d);
> +
> +    s->status = 0;
> +    s->clkrt = 0;
> +    s->spi = 0;
> +    s->cmdat = 0;
> +    s->resp_tout = 0;
> +    s->read_tout = 0;
> +    s->blklen = 0;
> +    s->numblk = 0;
> +    s->intmask = 0;
> +    s->intreq = 0;
> +    s->cmd = 0;
> +    s->arg = 0;
> +    s->active = 0;
> +    s->bytesleft = 0;
> +    s->tx_start = 0;
> +    s->tx_len = 0;
> +    s->rx_start = 0;
> +    s->rx_len = 0;
> +    s->resp_len = 0;
> +    s->cmdreq = 0;
> +    memset(s->tx_fifo, 0, sizeof(s->tx_fifo));
> +    memset(s->rx_fifo, 0, sizeof(s->rx_fifo));
> +    memset(s->resp_fifo, 0, sizeof(s->resp_fifo));
> +}
> +
>  static void pxa2xx_mmci_instance_init(Object *obj)
>  {
>      PXA2xxMMCIState *s = PXA2XX_MMCI(obj);
> @@ -526,6 +555,13 @@ static void pxa2xx_mmci_instance_init(Object *obj)
>                          TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
>  }
>  
> +static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->reset = pxa2xx_mmci_reset;
> +}
> +
>  static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
>  {
>      SDBusClass *sbc = SD_BUS_CLASS(klass);
> @@ -539,6 +575,7 @@ static const TypeInfo pxa2xx_mmci_info = {
>      .parent = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(PXA2xxMMCIState),
>      .instance_init = pxa2xx_mmci_instance_init,
> +    .class_init = pxa2xx_mmci_class_init,
>  };
>  
>  static const TypeInfo pxa2xx_mmci_bus_info = {
> -- 
> 1.9.1
> 
