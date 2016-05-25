Received: by 10.25.30.65 with SMTP id e62csp51201lfe;
        Wed, 25 May 2016 10:41:10 -0700 (PDT)
X-Received: by 10.200.41.248 with SMTP id 53mr3453572qtt.100.1464198070263;
        Wed, 25 May 2016 10:41:10 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p128si8991482qka.190.2016.05.25.10.41.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 10:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5cnt-0005d0-FM
	for alex.bennee@linaro.org; Wed, 25 May 2016 13:41:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b5ckC-0003F3-7D
	for qemu-devel@nongnu.org; Wed, 25 May 2016 13:37:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1b5ckA-0003QB-8X
	for qemu-devel@nongnu.org; Wed, 25 May 2016 13:37:19 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1b5ckA-0003Q6-3J; Wed, 25 May 2016 13:37:18 -0400
Received: by mail-oi0-x241.google.com with SMTP id h125so10957939oib.2;
	Wed, 25 May 2016 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=2SXg0cgeXrfuM1pf3jshvQfr1QVl5Pui4ikhIjra82k=;
	b=BFeWq8TmljWEDzYaL7Ky+U4CHMiG4T2tKMTaDAS8PaTQ0oghl6j3ZApT3M3CF32a5z
	zGV0vdBJKH1gBSel3vF3XntypQ3QJ0V0zcn4IyDVKnZtHA1RW+tdMU6M1s7E9bokVf43
	we/OuLqGA4kc/BR9dPh+UJA71NBvjG/hkmPRJDkMOfI4QFJ/ZzWzQa9ud3IA+/9cHqcY
	Anj0oDpjxgoCvghnv80Rapr/ls2Qodb3qEpocnaztPXx2WZM1x6GVQE/9O2i4pI32wLD
	IkROHqFbIgrQHmHLGxAyJcqsUUobo/jWoPCb88hCb1DJ96mkX9CO1h47uDAtAUJy4Gax
	d0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=2SXg0cgeXrfuM1pf3jshvQfr1QVl5Pui4ikhIjra82k=;
	b=k5E9ZEDTN066OBprkJJwM83JfheCQ7WYVSO6TyggiizThahXuLOOJgOm1wwvpGExCA
	K/Q2eDs4MIxzu6mVRZKT3g8DLD+njYuOrsnxPsXDHSs+LtYgbJX6La5oNCvo8nHpjdcS
	d9XmaskLsgjJRxrUUloEz/LUIBXQRFORyPiOhhstp1YOOCysRGWyoVAWnWls2Rocih9V
	nkhqkH7qZLy+Kfytb2liGf/S+HRcOW30FY8jhAGZU59D5NdFTywYg9EtIcy9gKeDo4El
	7aa1WUEXXX26+PPMdEzPBabWm7zeJQapPS6yLEpbVDBkRWrWS55OBiZkzLUUEkIwe4hz
	zvaQ==
X-Gm-Message-State: ALyK8tJUYSx9OxJ7tNBAjy5vi7ra/LY9v+Z1NnBemyAPpVZE17E0AsSbZSa5Ei28whK8NU1RnAOM8BWpSqSP3Q==
X-Received: by 10.202.98.133 with SMTP id w127mr2752817oib.136.1464197837578; 
	Wed, 25 May 2016 10:37:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.98.137 with HTTP; Wed, 25 May 2016 10:36:48 -0700 (PDT)
In-Reply-To: <1464173555-12800-5-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
	<1464173555-12800-5-git-send-email-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 25 May 2016 10:36:48 -0700
X-Google-Sender-Auth: tfHtBD8wXnrSpNALtdqU1NzZrSk
Message-ID: <CAKmqyKNm-xQ08LWJPoZmxqgDrkGoA4=6ktp1sMqZTfiVf=ke3g@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v2 4/4] xlnx-zynqmp: Use the in kernel GIC
 model for KVM runs
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BcfTnO+SAEZD

On Wed, May 25, 2016 at 3:52 AM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Use the in kernel GIC model when running with KVM enabled.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index db5b82b..9a1bc94 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -22,6 +22,8 @@
>  #include "hw/arm/xlnx-zynqmp.h"
>  #include "hw/intc/arm_gic_common.h"
>  #include "exec/address-spaces.h"
> +#include "sysemu/kvm.h"
> +#include "kvm_arm.h"
>
>  #define GIC_NUM_SPI_INTR 160
>
> @@ -135,7 +137,7 @@ static void xlnx_zynqmp_init(Object *obj)
>                               qdev_prop_allow_set_link_before_realize,
>                               OBJ_PROP_LINK_UNREF_ON_RELEASE, &error_abort);
>
> -    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
> +    object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
>      qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
>
>      for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
> --
> 2.5.0
>
>
