Received: by 10.223.161.27 with SMTP id o27csp2062975wro;
        Thu, 2 Nov 2017 06:01:16 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TbjSi192Dvt/8cSgeGkCgy1T0UN1urnB7KUsN2IjHO425HmIztMNyZ2AVd/sIBse1VqRwt
X-Received: by 10.129.129.194 with SMTP id r185mr2245139ywf.70.1509627676146;
        Thu, 02 Nov 2017 06:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509627676; cv=none;
        d=google.com; s=arc-20160816;
        b=xhqbTs5+ud4Kl3ejadAIf3h1i1U6RecyRczniGBFGC7+xdX6baks/IYFwBd0hcAe7a
         hYWedYd4EOIZy9J1QVcCAryEVJgFhFQhLhSsfp6qHF5nV3JzTIt6zmF9YAsBaSRN1wU1
         9rI8FmvftslvjRrwjuZqcf/Xxo5tXsjg25resxd98iN7Njn9D8vTwer0epm5onMNNPRk
         5uD4EoMeleAwXcfqQBlmt45FjfOhXZy8NcwEas07mQUaZfiFHVAbEmSQqefo0K63jTpZ
         7zsSuIvaO70MGzm/VyjfXgICyccNa60qzyL1j/UmldSjDOwYU87Nc1uR1fNsvWB4JYAU
         0uyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=e6XF6xhS2HgcPvMw6v9sEYigb61zaV5BsSINxxQ/lZs=;
        b=XgM19elnLbcdO0UDQIfKiwAYdiHy1gXVSmMHQgutzKKgpUGN4UI8GnOZdaL9SCVyis
         c/fZT9hCpJdlcOxyxYiOiA1tYvgFBAFZ2jBwUQOIRoj1H13WsYHo2kW8pUclMI426DXa
         GkhR6QCrjR6gz1J7O6YUPv6Z4jTljjqEvaXYmKVsFpHWTEm3BESN8RFela5LWp0LZM3M
         +Wi2pS0k7fR9yQT9IlEUf02GDPDb2PuNsvZcay76LKulgkolvAW8LL224NAATECfuIbN
         Rl4HJrg4mqk5p/bcg5DljcgKZyUsfB8op5xrj2fkqH+ZYd4WfwbZMI/ZC3zC+sOwzQx9
         NNeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TueFwkZZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w131si799046ywb.479.2017.11.02.06.01.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Nov 2017 06:01:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TueFwkZZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAF7T-0003Ux-LB
	for alex.bennee@linaro.org; Thu, 02 Nov 2017 09:01:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAF79-0003U1-B9
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:01:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAF73-00053R-EM
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:00:55 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:47843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAF73-000531-86
	for qemu-arm@nongnu.org; Thu, 02 Nov 2017 09:00:49 -0400
Received: by mail-wm0-x243.google.com with SMTP id r196so10941466wmf.2
	for <qemu-arm@nongnu.org>; Thu, 02 Nov 2017 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e6XF6xhS2HgcPvMw6v9sEYigb61zaV5BsSINxxQ/lZs=;
	b=TueFwkZZ/p7K6IHTlGXvdmD91S1AsGv5VkGMGPieWflHBQEuW8t6+dIB4wV36uRm1K
	uisucjBZ4RcYJTPp5ufcGvLcL6gb0IO01UPpNFz5oxaSGohmWUNnuzKJHjI+dx17Q9au
	zDUQw8R8bnU+/HmAOsusIXncIPsWuy4kFR0OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e6XF6xhS2HgcPvMw6v9sEYigb61zaV5BsSINxxQ/lZs=;
	b=XoIHuTTgn0rCyfAmTEO7q+oClIpJJhppdCxuXHkpiooWiBO1UNCAN2K0iwp5Qroz6Y
	JVDEmZC2tXGGRkili4OpETEtWL06Iuyk8WlJ/umuK2164X+8UQdRiFw+4NVqD5+mR/8Y
	qAMUzG6oi80CQ1oKOGq7YKq2PFPW9qDcR/9EI4fg/H6+1K2Q1T9uu+6sCNLNkC1Yk7g1
	r+RbLw5va/3RSP2Ih/NqfOq/tYW7UkFPsKjBESElSg6e38zq7A0oRF1TTxAGelV/xS4I
	wR9YvACwoXlR1Y1fNCUxgiAjXYtFy/kfN6SazW8tf9ozpRSVIKvT+oE0dKbooFhdct9P
	xD2Q==
X-Gm-Message-State: AMCzsaU+5SpjFXkpV09IAeGYJxKe/Y6LDvJaYi7Wge0Tfm5KXluLbELl
	ePCyN9icXFnD5QUEF55fl6Mn74h59bGASXiyap7KRw==
X-Received: by 10.28.10.147 with SMTP id 141mr1471620wmk.40.1509627648030;
	Thu, 02 Nov 2017 06:00:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 06:00:27 -0700 (PDT)
In-Reply-To: <1508772937-21054-3-git-send-email-eric.auger@redhat.com>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
	<1508772937-21054-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 13:00:27 +0000
Message-ID: <CAFEAcA_QH_zzrzGteL-i-WUPMQa7OZhix8EqtkKNoTRL4iNQew@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [RFC v2 2/4] hw/intc/arm_gicv3_its: Implement a
 minimalist reset
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
X-TUID: LFfdyReLCOjA

On 23 October 2017 at 16:35, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment the ITS is not properly reset and this causes
> various bugs on save/restore. We implement a minimalist cold reset
> through individual register writes. This does not void the ITS cache
> though. This full reset will be addressed through a specific ioctl.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 1ae205f..537cea1 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -28,6 +28,16 @@
>
>  #define TYPE_KVM_ARM_ITS "arm-its-kvm"
>  #define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
> +#define KVM_ARM_ITS_CLASS(klass) \
> +     OBJECT_CLASS_CHECK(KVMARMITSClass, (klass), TYPE_KVM_ARM_ITS)
> +#define KVM_ARM_ITS_GET_CLASS(obj) \
> +     OBJECT_GET_CLASS(KVMARMITSClass, (obj), TYPE_KVM_ARM_ITS)
> +
> +typedef struct KVMARMITSClass {
> +    GICv3ITSCommonClass parent_class;
> +    void (*parent_reset)(DeviceState *dev);
> +} KVMARMITSClass;
> +

The infrastructure here for having a place to hang reset is
all fine, but it's a bit out of place because this patch doesn't
actually use any of it.

>  static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
>  {
> @@ -153,12 +163,25 @@ static void kvm_arm_its_pre_save(GICv3ITSState *s)
>   */
>  static void kvm_arm_its_post_load(GICv3ITSState *s)
>  {
> +    bool cold_reset = !s->iidr;
>      int i;
>
> -    if (!s->iidr) {
> +    if (cold_reset) {
> +        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                          GITS_CTLR, &s->ctlr, true, &error_abort);
> +
> +        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                          GITS_CBASER, &s->cbaser, true, &error_abort);
> +
> +        for (i = 0; i < 8; i++) {
> +            kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                              GITS_BASER + i * 8, &s->baser[i], true,
> +                              &error_abort);
> +        }
>          return;
>      }

I don't understand why we need to treat the "iidr zero" case
differently here. Why can't we just restore the register state
like we do now? (Also, all resets in QEMU are cold resets,
and post_load isn't called for reset, so the flag naming is
a bit odd.)

(I don't understand why the code in master at the moment does
nothing for iidr == 0, for that matter. We should always tell
the kernel the state of the device regs.)

thanks
-- PMM
