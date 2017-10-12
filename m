Received: by 10.223.197.9 with SMTP id q9csp1593596wrf;
        Thu, 12 Oct 2017 04:53:06 -0700 (PDT)
X-Received: by 10.200.4.29 with SMTP id v29mr3227557qtg.76.1507809186379;
        Thu, 12 Oct 2017 04:53:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507809186; cv=none;
        d=google.com; s=arc-20160816;
        b=S52PN19Mh3vcylXlGxBKJsxZ/tY8GBz1JgZlfMx27OhDqg8YC5sF5O/0yOSZgoITnE
         uDy8HA5b8VDVrJfepUDUXUECCyEZbsgceZNscwYS9JDp5kdzfyOP+Pn06mcc99Trx4vU
         DK/VZf8+U8sUaAkJPkpMk+nmQONz3Sb7EEP7GlOV7oRH2r50CxY3FLXIp/b5k9EC5+0Y
         HA4svhRUapRrAzZGQs0fRWTXEjDBq1dVpErqmvv7YxglY5RcFhYakNCC9mrYt/QMoRjV
         eo1G6rOiKv8rYVSLZFDUeUy9JFrlAemn55Irc/GPeJQktMJkvrsVQT4r+oF84opGlhc7
         /IUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=62M1zMD00Af9Dsiw2Pdk4KXbzwqSIIHnaCoGvXkmX/g=;
        b=C1JOSkt6WMYRQWOwDKEhBDOHvRmxqfCrb28oN6SyaPOZr5VKKmH+qL6zm7UYQa3mvB
         LEhznGQHuu2aLrgLJjfBwUrUsYlx4oln7yb8YCcOP721NvfA18JZTZotad9O3QNalOpn
         yhhf/NI6B1qmoJEyRO5SXMvIz7c+MAJPifcT1BKck6PP7iWSKdB6K6B+dZPOEYtR1aRa
         +6z4wWSwPULXSFrsbmZdspHPq7qPwkFlBwTCeVs6wQIoq54+nB73GMLQpIginfW2TX0u
         lv2n0XvKjqdY9n/CtqWxQRqlDZ6YjJTf+cPlkBQjjqlM0BptHTlsefGUzZD3pupjvCej
         CERw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EE+EWdK+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e197si343587qka.347.2017.10.12.04.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Oct 2017 04:53:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EE+EWdK+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2c2x-0002t8-Sx
	for alex.bennee@linaro.org; Thu, 12 Oct 2017 07:53:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2c2l-0002rr-FI
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 07:52:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e2c2k-0006FR-EQ
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 07:52:51 -0400
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:54289)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e2c2k-0006Ej-3p
	for qemu-arm@nongnu.org; Thu, 12 Oct 2017 07:52:50 -0400
Received: by mail-wm0-x22f.google.com with SMTP id i124so12593471wmf.3
	for <qemu-arm@nongnu.org>; Thu, 12 Oct 2017 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=62M1zMD00Af9Dsiw2Pdk4KXbzwqSIIHnaCoGvXkmX/g=;
	b=EE+EWdK+Sv01V4pixb1bshPvVxafCaGhBJZTOxQknBefj46NDIX4xy4OHULfcvytYZ
	YOd6XMY5Zvp6Kg+wWMjRoUEjpvSqGUkBT2LMlP1d24Qvmexwmvry1xZwLFGeS/AwUz6y
	t/94ulEAoa7XmxfBSX+wZgA8gYCm1Er87/isM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=62M1zMD00Af9Dsiw2Pdk4KXbzwqSIIHnaCoGvXkmX/g=;
	b=Mu67UZzVRj5q4ZMy2GvvRIptUSCrWEGHdckUtddnh7Td2Pbu26RXKlpBIEgJet+O+S
	WQuRulFfqU8NomhOcVRfVCOdrZFV8tbec1sYsktZQYa/tdI7gLnjtwUYBrj0WSN6RL/a
	Pc7aFrKf7j1WH0ldVei/nTIcMuLN4E3geDFQCcvcNLdOLXLjvidgbR10EYXGkn3CeRm5
	q6w8uh7V3zuApGvVDUiRFAH9In9/b3v0YFR4RKxPS0arE+V8g3bTnXK5cMF/dFM2YGjM
	GlEbOAvhOtsTqPTFRoARRnZ21JAnLDt+yZz/eKn5b4t34wYiQQs8YK8/XyQXWLwlsK+l
	KxfQ==
X-Gm-Message-State: AMCzsaVY0iBxN9nZIG/aCBka2b5TXaAML/PxmEXZr9CZUbAQc7e6EfX/
	SBisra8Mh1ClJnMu8u018ySfXJNTUUYqvO81vXgUeQ==
X-Google-Smtp-Source: AOwi7QBtPR6IumrHn7CBATy2rTTLXfavihC2FPVQpJLgA4Ii5oVnfsBtPviYmIbhMqSUbIMDuWlcJJ4dtTis37yeSkc=
X-Received: by 10.223.197.13 with SMTP id q13mr2130052wrf.272.1507809168735;
	Thu, 12 Oct 2017 04:52:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Thu, 12 Oct 2017 04:52:28 -0700 (PDT)
In-Reply-To: <1506524205-20763-4-git-send-email-eric.auger@redhat.com>
References: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
	<1506524205-20763-4-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Oct 2017 12:52:28 +0100
Message-ID: <CAFEAcA-a-7F0Ftj-hiYx2awxT7fYNpHnqe9nsj_S3Ps4Rb5wNw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-arm] [RFC 3/3] hw/intc/arm_gicv3_its: Implement reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Qufb1yiXPvU

On 27 September 2017 at 15:56, Eric Auger <eric.auger@redhat.com> wrote:
> Currently the ITS is not reset and this causes trouble
> when state backup is initiated before the guest has initialized
> the ITS registers and especially GITS_CBASER<n>.
>
> We are likely to save register values set before the reset/
> restart. The register values may not be consistent with the
> data structures in RAM.
>
> So let's use the ITS KVM device new combo,
> KVM_DEV_ARM_VGIC_GRP_CTRL/KVM_DEV_ARM_ITS_CTRL_RESET
> to explicitly force the in-kernel emulated reset.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/intc/arm_gicv3_its_common.c         |  5 ++---
>  hw/intc/arm_gicv3_its_kvm.c            | 22 ++++++++++++++++++----
>  include/hw/intc/arm_gicv3_its_common.h |  1 +
>  3 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index 68b20fc..a2fe561 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -129,15 +129,14 @@ static void gicv3_its_common_reset(DeviceState *dev)
>      s->creadr = 0;
>      s->iidr = 0;
>      memset(&s->baser, 0, sizeof(s->baser));
> -
> -    gicv3_its_post_load(s, 0);

This doesn't look right as it means we won't write the QEMU
initial device register values up to the kernel. I think we
want to do that as well as call the specific reset ioctl,
so that both userspace and the kernel are consistent in
their idea of what's going on.

>  }
>
>  static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_CLASS(klass);
>
> -    dc->reset = gicv3_its_common_reset;
> +    c->parent_reset = gicv3_its_common_reset;
>      dc->vmsd = &vmstate_its;
>  }

This isn't how we handle this for the arm_gicv3_kvm.c and arm_gic_kvm.c
code which has a subclass reset/parent class reset. What we do there is:
 * the parent_reset field is in the subclass's Class struct
 * the subclass's reset function calls the parent_reset function
 * the subclass's class_init function sets parent_reset to whatever
   the old dc->reset was before setting dc->reset to its own reset
   function

I think we should be consistent in how we do this.

> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 120b86d..3c2e724 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -156,10 +156,6 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
>      Error *err = NULL;
>      int i;
>
> -    if (!s->iidr) {
> -        return;
> -    }
> -

This looks like an unrelated change, or at least not one mentioned
in the commit message?

>      kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
>                        GITS_IIDR, &s->iidr, true, &error_abort);
>
> @@ -195,6 +191,23 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
>                        GITS_CTLR, &s->ctlr, true, &error_abort);
>  }
>
> +static void kvm_arm_its_reset(DeviceState *dev)
> +{
> +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> +    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
> +
> +    c->parent_reset(dev);
> +
> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                               KVM_DEV_ARM_ITS_CTRL_RESET)) {
> +        error_report("ITS KVM: reset is not supported by the kernel");
> +        return;
> +    }
> +
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
> +                      KVM_DEV_ARM_ITS_CTRL_RESET, NULL, true, &error_abort);
> +}
> +
>  static Property kvm_arm_its_props[] = {
>      DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "kvm-arm-gicv3",
>                       GICv3State *),
> @@ -211,6 +224,7 @@ static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
>      icc->send_msi = kvm_its_send_msi;
>      icc->pre_save = kvm_arm_its_pre_save;
>      icc->post_load = kvm_arm_its_post_load;
> +    dc->reset = kvm_arm_its_reset;
>  }
>
>  static const TypeInfo kvm_arm_its_info = {
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
> index fd1fe64..c158e9f 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -79,6 +79,7 @@ struct GICv3ITSCommonClass {
>      int (*send_msi)(GICv3ITSState *s, uint32_t data, uint16_t devid);
>      void (*pre_save)(GICv3ITSState *s);
>      void (*post_load)(GICv3ITSState *s);
> +    void (*parent_reset)(DeviceState *dev);
>  };
>
>  typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
> --
> 2.5.5
>

thanks
-- PMM
