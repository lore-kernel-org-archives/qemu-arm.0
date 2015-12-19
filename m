Received: by 10.182.158.201 with SMTP id ww9csp1901864obb;
        Sat, 19 Dec 2015 13:37:58 -0800 (PST)
X-Received: by 10.140.164.77 with SMTP id k74mr15758349qhk.6.1450561078436;
        Sat, 19 Dec 2015 13:37:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a97si22859950qkh.49.2015.12.19.13.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 13:37:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAPCQ-0007uL-5H
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 16:37:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPCO-0007rd-3f
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 16:37:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAPCN-0000ss-6P
	for qemu-arm@nongnu.org; Sat, 19 Dec 2015 16:37:56 -0500
Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c]:34217)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAPCG-0000s7-NC; Sat, 19 Dec 2015 16:37:48 -0500
Received: by mail-pa0-x22c.google.com with SMTP id wq6so78512889pac.1;
	Sat, 19 Dec 2015 13:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bNCcP1PX1srgnkvJLVVnQI32o1DYMmfQvKw1EZgwGQE=;
	b=w7VDjOhwHy7vxJGWDSxX07T/Jcxnb3B4N2pR0+yjAyNGcFbLdRRGMbKcUHu2VwjHJm
	+ZwssUHx+gkVsblBgIdGxh83sUR/VjycZTe6VYzIhElMHRUA2fZBeOBZZkRD5hBFtK6W
	/0fSYJv8uz968UPOEtTpes/fb22bTmHHhtPIGmlBQ3qyETBy0w9DLKonzT6b/Z2JkoKk
	94v9MpmsOm8gIt1kGTzkr79N1F5Hrys+bmTTYF/jCVscrpm3WAGvbCwbJEoFdKltXyd9
	EwziAUXoAJqTTjjnBNJNoqz9E0jUlADcP71XAiNg9RY8uLik85CDvBP7MMhhacyOv4k0
	aLZQ==
X-Received: by 10.67.3.170 with SMTP id bx10mr15845692pad.34.1450561068160;
	Sat, 19 Dec 2015 13:37:48 -0800 (PST)
Received: from pcrost-box (c211-31-14-155.rochd5.qld.optusnet.com.au.
	[211.31.14.155]) by smtp.gmail.com with ESMTPSA id
	y27sm25636947pfa.29.2015.12.19.13.37.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Dec 2015 13:37:47 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Sat, 19 Dec 2015 13:37:39 -0800
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151219213739.GD4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1449851831-4966-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::22c
Cc: Kevin O'Connor <kevin@koconnor.net>, Markus Armbruster <armbru@redhat.com>,
	patches@linaro.org, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 03/10] hw/sd/sd.c: Convert sd_reset()
 function into Device reset method
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
X-TUID: wp/dyQf7V7ji

On Fri, Dec 11, 2015 at 04:37:04PM +0000, Peter Maydell wrote:
> Convert the sd_reset() function into a proper Device reset method.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
>  hw/sd/sd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 7c79217..b4a5a62 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -393,8 +393,9 @@ static inline uint64_t sd_addr_to_wpnum(uint64_t addr)
>      return addr >> (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT);
>  }
>  
> -static void sd_reset(SDState *sd)
> +static void sd_reset(DeviceState *dev)
>  {
> +    SDState *sd = SD(dev);
>      uint64_t size;
>      uint64_t sect;
>  
> @@ -435,7 +436,7 @@ static void sd_cardchange(void *opaque, bool load)
>  
>      qemu_set_irq(sd->inserted_cb, blk_is_inserted(sd->blk));
>      if (blk_is_inserted(sd->blk)) {
> -        sd_reset(sd);
> +        sd_reset(DEVICE(sd));
>          qemu_set_irq(sd->readonly_cb, sd->wp_switch);
>      }
>  }
> @@ -677,7 +678,7 @@ static sd_rsp_type_t sd_normal_command(SDState *sd,
>  
>          default:
>              sd->state = sd_idle_state;
> -            sd_reset(sd);
> +            sd_reset(DEVICE(sd));
>              return sd->spi ? sd_r1 : sd_r0;
>          }
>          break;
> @@ -1783,8 +1784,6 @@ static void sd_realize(DeviceState *dev, Error ** errp)
>      if (sd->blk) {
>          blk_set_dev_ops(sd->blk, &sd_block_ops, sd);
>      }
> -
> -    sd_reset(sd);
>  }
>  
>  static Property sd_properties[] = {
> @@ -1804,6 +1803,7 @@ static void sd_class_init(ObjectClass *klass, void *data)
>      dc->realize = sd_realize;
>      dc->props = sd_properties;
>      dc->vmsd = &sd_vmstate;
> +    dc->reset = sd_reset;
>  }
>  
>  static const TypeInfo sd_info = {
> -- 
> 1.9.1
> 
