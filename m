Received: by 10.182.158.201 with SMTP id ww9csp721198obb;
        Thu, 17 Dec 2015 15:51:41 -0800 (PST)
X-Received: by 10.55.195.221 with SMTP id r90mr884621qkl.4.1450396301191;
        Thu, 17 Dec 2015 15:51:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n94si13648895qgd.127.2015.12.17.15.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 15:51:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:57661 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9iKi-00089j-Uz
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 18:51:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9iKg-000862-Iq
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 18:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9iKf-0003ZI-GZ
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 18:51:38 -0500
Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b]:36407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1a9iKd-0003Yi-Br; Thu, 17 Dec 2015 18:51:35 -0500
Received: by mail-ob0-x22b.google.com with SMTP id no2so68507992obc.3;
	Thu, 17 Dec 2015 15:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=EAtQE54pdNQNjqOHCpb3hPs5I3QAzzeDYkTHVGv2t34=;
	b=fT1F+paWLhB+X/XzSCH5ik3NPPbGXBxDYgLqe7THB0B55hrAuavqpUphsSw/NKu2/y
	R+pjtpGbQ4fbXc3nBzHkadLuLR5CDKfMpbe8VrRrNIN7yCG+v8A0priOqieLtpQgSB4Y
	EJNBW24/Fvwpfbr/mwHQ78OVy2gw7L5Fw0J5hT9/oQuuyySZ53nr67f4F5IvNVK/cGRO
	+A1VpDUl4ZBQvnMpnM6y28RIpJd4k/ao+kM3j6kgJhDK7zUBmJRFWC9S0bTUcDz9ensp
	UQVxVbBMXqpG6+xM/DLg2R8bHHjaJFOs2omyFKvMHUO3bpBwAvTbN+bturMlOUkoFXmP
	m8og==
X-Received: by 10.60.77.97 with SMTP id r1mr259592oew.82.1450396294792; Thu,
	17 Dec 2015 15:51:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Thu, 17 Dec 2015 15:51:05 -0800 (PST)
In-Reply-To: <1449851831-4966-4-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-4-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 17 Dec 2015 15:51:05 -0800
X-Google-Sender-Auth: -volPVqO9Oi6KKGzzUerw-mxlvE
Message-ID: <CAKmqyKP5SUW-DLJB4-FQm2hzxW0OV+dCOFtr638wKwDY2gMxjA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22b
Cc: Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/10] hw/sd/sd.c: Convert
 sd_reset() function into Device reset method
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
X-TUID: HfH99EaAFY7f

On Fri, Dec 11, 2015 at 8:37 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Convert the sd_reset() function into a proper Device reset method.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

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
>
