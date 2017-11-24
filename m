Received: by 10.223.159.82 with SMTP id f18csp2106999wrg;
        Fri, 24 Nov 2017 05:35:33 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaonoht45RLg9ujRWQWA42zqNEHOxW5/5FdtSXRM7oUYEcYxdSxpMupoXE9hXWAc9gqRus1
X-Received: by 10.37.82.212 with SMTP id g203mr14179334ybb.346.1511530533128;
        Fri, 24 Nov 2017 05:35:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511530533; cv=none;
        d=google.com; s=arc-20160816;
        b=N08qReLxVUwexvB0ddYaQ/or1dhPsOeQYrf2eyF783l7a4jIDK1O51XsfeNvL2YrkC
         SKUOooh/l2cPnlvhXcFkfrDmATTcgZ/nsmTpfEQwZ5er0w98/93/5SM6kPjpa6ngMqL/
         CK347IuLP8FLO4ZUu0j+f/wN1oWneXBny5xUtVVXF+HvkOkqNSXR5J9qC3MVcUZcD4HZ
         p1HsrbjXq1wW1nAmiABrUSFF9M5tg1DTEvAALB7BDj1iY0s3oU+VI9suVC+5JgX/khrL
         gTvJpYMNT74/sTXkEm+FsZFtoG9GP2wrUqNNQuGjf3NuRxzbXFgUkcZv0Upq1EwLCapO
         BI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=in/R0X8KcXT+El13hz5w07MFaP6H5BbNR732SvJ088c=;
        b=sCzKISauirQjx7neCjIxTDYU3AjTEE7RfOaJCLejRXVaofquPDvz7Q5cr2vpe0+Bme
         Sznr0nQ+P3kad++tWVg2jE2VeUj6oCSVQsp3gupkVB5C/LP/4D6Vr7jhWXENIXKERGwY
         E2LoFg7KkZ+B1WpXp3lzCrUJwIZ6qRHYzSjruUVkXDMIttYcbdpCefB/Uwqf4V8UTKx9
         l2rvGYQAqwOzCpxBUyUunuS6D5e9CKlV9/2EPSBaeNfXVbjzrNKR7YIEdieZfEL3aRii
         zjN9FoXKSVTqk1HSRSdchuYmk/NpQtEBVqy4SCGpoUqwFFrR3q/4wCeclpjojzUslxvM
         pvDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=byurMTaI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i14si4687871ybh.804.2017.11.24.05.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 05:35:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=byurMTaI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49305 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIE8i-0005G2-Jd
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 08:35:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIE8R-00057d-3n
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:35:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIE8P-0005Wc-QR
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:35:14 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:42620)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIE8P-0005Vf-M2
	for qemu-arm@nongnu.org; Fri, 24 Nov 2017 08:35:13 -0500
Received: by mail-ot0-x244.google.com with SMTP id 18so18798164oty.9
	for <qemu-arm@nongnu.org>; Fri, 24 Nov 2017 05:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=in/R0X8KcXT+El13hz5w07MFaP6H5BbNR732SvJ088c=;
	b=byurMTaInq4qB+FnP3F5kGO7BPqpVOzA9Q1NV6Om44UGlpAAe2WobdrLMqXKTcxqPd
	ab8FETUg5z2JfjDUks1e6n9PgjzvWVTW1UVBlTeQu6HK6+dTNGgLi6nH/LMB1WjxpXur
	c43XibE3rWZ8rptVPbRo6ROvBJ7gmlerr/MXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=in/R0X8KcXT+El13hz5w07MFaP6H5BbNR732SvJ088c=;
	b=YcsjXqNSItGhIn1VdZhnb/qbyJJmpHV+FUz+grYV+aqKBg3iCbDMkCq1tKTzN+R+nj
	Rq5fa9NDv3mwv4y7vk3KMaS8ObuA1BOc28XS3nz+eoapRj2s2KSvgczIKEPdVHsiIh+b
	Jzsykz69fzRbIt39Rh1CGmGINFcTCskT3GaC5wWygPghma2ZUIRgBy4X87fJsnYl5vU8
	cZN4g1lw3RP4JQ/bzVLSuG2wQpJcvKmyp18dYStwOtgy3mEWS59JKyvy59wmr9tziEUQ
	r3y7EAn1Bb3G+IKuuF8p8///5E/Uj59dSTSkH7iLx5fOR8MoaT+EAStEosiRCM28bFMS
	FCbQ==
X-Gm-Message-State: AJaThX5wOY3xg3y5bN4QGTTDqGAcOd4NfMPdru2853uUbHoqbf1/6WaL
	sAhLfPZJWZYS+fIGZPVCpQlYj45j/31d+Ik9L3kPzQ==
X-Received: by 10.157.37.173 with SMTP id q42mr18811064ota.116.1511530512708; 
	Fri, 24 Nov 2017 05:35:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 24 Nov 2017 05:34:52 -0800 (PST)
In-Reply-To: <1511530238-18318-3-git-send-email-eric.auger@redhat.com>
References: <1511530238-18318-1-git-send-email-eric.auger@redhat.com>
	<1511530238-18318-3-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Nov 2017 13:34:52 +0000
Message-ID: <CAFEAcA-7s8D1mts4LG81DoRM6x-wwT3mOPTcZJJ+EKi72tCjJw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v4 2/4] hw/intc/arm_gicv3_its: Implement a
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
X-TUID: SuhEv1kY+kxF

On 24 November 2017 at 13:30, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment the ITS is not properly reset and this causes
> various bugs on save/restore. We implement a minimalist reset
> through individual register writes but for kernel versions
> before v4.15 this fails voiding the vITS cache. We cannot
> claim we have a comprehensive reset (hence the error message)
> but that's better than nothing.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v2 -> v3:
> - individual register writes performed in kvm_arm_its_reset
> - check KVM_DEV_ARM_VGIC_GRP_ITS_REGS support
> ---
>  hw/intc/arm_gicv3_its_kvm.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index b1b322b..83e5268 100644
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
>
>  static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
>  {
> @@ -186,6 +196,34 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
>                        GITS_CTLR, &s->ctlr, true, &error_abort);
>  }
>
> +static void kvm_arm_its_reset(DeviceState *dev)
> +{
> +    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
> +    KVMARMITSClass *c = KVM_ARM_ITS_GET_CLASS(s);
> +    int i;
> +
> +    c->parent_reset(dev);
> +
> +    error_report("ITS KVM: full reset is not supported by the host kernel");

This message claims that we have a problem because of the host
kernel version, but I can't see where we do the check on the
host kernel that lets us avoid the error message when it's
new enough ?

thanks
-- PMM
