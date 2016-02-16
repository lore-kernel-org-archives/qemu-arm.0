Received: by 10.25.208.211 with SMTP id h202csp1245167lfg;
        Tue, 16 Feb 2016 03:24:35 -0800 (PST)
X-Received: by 10.140.108.181 with SMTP id j50mr26053341qgf.104.1455621875050;
        Tue, 16 Feb 2016 03:24:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u124si40140042qka.69.2016.02.16.03.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 03:24:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVdkA-0007vH-Jb
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 06:24:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aVdk5-0007pj-VR
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 06:24:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aVdk2-0001lq-0m
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 06:24:29 -0500
Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e]:34936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aVdjx-0001kn-Ba; Tue, 16 Feb 2016 06:24:21 -0500
Received: by mail-pf0-x22e.google.com with SMTP id c10so105878568pfc.2;
	Tue, 16 Feb 2016 03:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mu4OxX359hMwn1i6NMVIm0yd1FtcGU1HcUrwkETUjV8=;
	b=iDjeTrOp1WEtwcXSticMbPYwy/w1QuhcP/o3ZlR7QjavCHyP415cCjaJ+QC32oLKEc
	4o9UJMs95DNXJu10F+2jXl98qxZVo6YfwvmE7hQ7lbBHEBb7tpwqhgqEwY0uTtOUl13p
	HvNYFCXHe8suLRyA3k48vRsgzyDjIFspoFlDso7DX78ngStyHWAxeNx4C2l8CyucFSIZ
	qIDEHd0d5/fUalezIajjmbaWA+vITAfYCWHd8Tp7ZL33GxvYWqJLEklMPe60f+FhC8jj
	ExGbH89rBVIz1G+sZjlnALKxF+Jn6xWVdAMmLjDUJh/o5dN+0e25DhwLhNOWIlZpFG6T
	JSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=mu4OxX359hMwn1i6NMVIm0yd1FtcGU1HcUrwkETUjV8=;
	b=jFQjZjwjHdTROgLZoPUBJhNf4/UWioonzjjJmW4skt/ELbebGf1saDMffYqQCNsucH
	+LbOf9dcXLuwa71dWbY9PFRlNPnXYSgWc1Ttej5y1a2HC/yq14PnyxytgPK31KrMZLlm
	ZmVSoDXtxkxaP3A8cU7qYCwqtza/8GSSBh+TAwWSUUMuBQLcl7K5f9aI/5qPLhAYYwbt
	GFqWuH+aq96sUzWgPiPhmJRl4jjXq/f3NCmzio3XaGOP0gSZ3N1zdRXZGnncGXFUZeLX
	vTIYcmTHxh7I9FDARQevYXjD6MzQYNS3R6WDT+u9pu1A7lmtA34j4MJvcjNDR+hjTXwV
	74GA==
X-Gm-Message-State: AG10YOQj0LB/vCpzUtuMgWciSiTvzdd5kCRLWueL9NqBeioJOrpVsJvJOZWYVRmB7DEhjg==
X-Received: by 10.98.18.207 with SMTP id 76mr29946698pfs.53.1455621860347;
	Tue, 16 Feb 2016 03:24:20 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	k65sm45138784pfb.30.2016.02.16.03.24.18
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 16 Feb 2016 03:24:19 -0800 (PST)
Date: Tue, 16 Feb 2016 12:24:17 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Message-ID: <20160216112417.GY31433@toto>
References: <1455620981-13868-1-git-send-email-zxq_yx_007@163.com>
	<1455620981-13868-4-git-send-email-zxq_yx_007@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455620981-13868-4-git-send-email-zxq_yx_007@163.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22e
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	michael@walle.cc, qemu-arm@nongnu.org, gxt@mprc.pku.edu.cn,
	afaerber@suse.de
Subject: Re: [Qemu-arm] [PATCH v3 03/16] hw/timer: QOM'ify etraxfs_timer
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
X-TUID: gqtq6bPfzL9O

On Tue, Feb 16, 2016 at 07:09:35PM +0800, xiaoqiang zhao wrote:
> assign etraxfs_timer_init to etraxfs_timer_info.instance_init
> and drop the SysBusDeviceClass::init
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> Signed-off-by: xiaoqiang zhao <zxq_yx_007@163.com>
> ---
>  hw/timer/etraxfs_timer.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index 36d8f46..4f115c7 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -315,9 +315,10 @@ static void etraxfs_timer_reset(void *opaque)
>      qemu_irq_lower(t->irq);
>  }
>  
> -static int etraxfs_timer_init(SysBusDevice *dev)
> +static void etraxfs_timer_init(Object *obj)
>  {
> -    ETRAXTimerState *t = ETRAX_TIMER(dev);
> +    ETRAXTimerState *t = ETRAX_TIMER(obj);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>  
>      t->bh_t0 = qemu_bh_new(timer0_hit, t);
>      t->bh_t1 = qemu_bh_new(timer1_hit, t);
> @@ -329,24 +330,23 @@ static int etraxfs_timer_init(SysBusDevice *dev)
>      sysbus_init_irq(dev, &t->irq);
>      sysbus_init_irq(dev, &t->nmi);
>  
> -    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
> +    memory_region_init_io(&t->mmio, obj, &timer_ops, t,
>                            "etraxfs-timer", 0x5c);
>      sysbus_init_mmio(dev, &t->mmio);
> -    qemu_register_reset(etraxfs_timer_reset, t);
> -    return 0;
>  }
>  
>  static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
>  {
> -    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>  
> -    sdc->init = etraxfs_timer_init;
> +    dc->reset = etraxfs_timer_reset;
>  }
>  
>  static const TypeInfo etraxfs_timer_info = {
>      .name          = TYPE_ETRAX_FS_TIMER,
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(ETRAXTimerState),
> +    .instance_init = etraxfs_timer_init,
>      .class_init    = etraxfs_timer_class_init,
>  };
>  
> -- 
> 2.1.4
> 
> 
