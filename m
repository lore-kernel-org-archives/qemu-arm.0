Received: by 10.182.158.201 with SMTP id ww9csp668521obb;
        Thu, 7 Jan 2016 08:05:19 -0800 (PST)
X-Received: by 10.55.200.15 with SMTP id c15mr118302298qkj.99.1452182719949;
        Thu, 07 Jan 2016 08:05:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7si16055845qgf.49.2016.01.07.08.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 08:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHD3v-00066v-LB
	for alex.bennee@linaro.org; Thu, 07 Jan 2016 11:05:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHD3t-00065o-CL
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 11:05:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHD3s-0002iP-9K
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 11:05:17 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHD3s-0002hJ-4O
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 11:05:16 -0500
Received: by mail-vk0-x234.google.com with SMTP id n1so22018990vkb.3
	for <qemu-arm@nongnu.org>; Thu, 07 Jan 2016 08:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=alF4jMx9NyuD/JCqY641XXzHJirK7dGk9GOAcC1V/BM=;
	b=jUL1uyBiTrfB860rENPSZz1z426l2MMQ0Vfl593Hd26PcY+w5ezQHjR6e0F8SHP/RG
	sdzWe2+7+4mwCCUQ9KjPPJ16TvlUeXZEKqkwIk4oPBjR5g31OL7yQlStuoSzLUa3Vx47
	Zu7e7RBSjMvrizYdV0yIQ9btDNRtKVFT665A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=alF4jMx9NyuD/JCqY641XXzHJirK7dGk9GOAcC1V/BM=;
	b=Ia0iN5f8XNQNc12qs+PJxHmvRonvo3d6tKCS4t7X4mG0+t1ql98tSp2k9pWmcwA55Z
	82QmE3SJBitDI+Z8OLxCks4fLvxAKVkgFu6rEKAmr/juXnW4/BivufbcJeoCigdfVT3H
	MjsGZTT26Ju6I7kE95wtDWMEYhMXIuIeZ0T6hqw7UtGkKTiExAnTO193u/ivgqjzPhts
	mzT5sAoj5LV6GhQOaVSdL/bEOTRmcsl0bfxRNLKKpWXlUuUk6UM3LFbqO4rX+39OCIKM
	urz1JnIZKI2C65ViapeXH52ZvooqY2j3ia0PcOovqPMj309x7lFuTlcHYxl9l9p100PR
	ozCg==
X-Gm-Message-State: ALoCoQnPHu6qz/lhXqIgm46d4GkcbLTEAFfaWlAMAIESir+aES82LPXSjUM7HdKe6LP8Aq1s3pjhyjFZ4lp+IIL2v0Euy43fCVea2dMqcMNuhakJ4sup7Oc=
X-Received: by 10.31.194.21 with SMTP id s21mr73915589vkf.92.1452182715469;
	Thu, 07 Jan 2016 08:05:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 7 Jan 2016 08:04:55 -0800 (PST)
In-Reply-To: <72794c95e3ccdadd4db71fe83d9c1855a91148ae.1450570397.git.crosthwaite.peter@gmail.com>
References: <cover.1450570397.git.crosthwaite.peter@gmail.com>
	<72794c95e3ccdadd4db71fe83d9c1855a91148ae.1450570397.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2016 16:04:55 +0000
Message-ID: <CAFEAcA_Ro2vWdyjduAc5PJYaQye2oYscmsfbw8tygyizHhTvtQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [PATCH v6 1/6] qdev: get_child_bus(): Use QOM lookup
	if available
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
X-TUID: xXWfGiLL0dTK

On 20 December 2015 at 05:43, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> qbus_realize() adds busses as a QOM child of the device in addition to
> adding it to the qdev bus list. Change get_child_bus() to use the QOM
> child if it is available. This takes priority over the bus-list, but
> the child object is checked for type correctness.
>
> This prepares support for aliasing of buses. The use case is SoCs,
> where a SoC container needs to present buses to the board level, but
> the buses are implemented by controller IP we already model as self
> contained qbus-containing devices.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
> Currently qbus_realize() ignores errors from object_property_add_child,
> so it is hard to guarantee that the QOM linkage is reliable. If it were
> the case that that object_property_add_child was supposed to be error
> asserting, we could remove the old bus-list strcmp iterator altogether.
>
>  hw/core/qdev.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index b3ad467..c96c464 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -581,6 +581,12 @@ void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
>  BusState *qdev_get_child_bus(DeviceState *dev, const char *name)
>  {
>      BusState *bus;
> +    Object *child = object_resolve_path_component(OBJECT(dev), name);
> +
> +    bus = (BusState *)object_dynamic_cast(child, TYPE_BUS);
> +    if (bus) {
> +        return bus;
> +    }
>
>      QLIST_FOREACH(bus, &dev->child_bus, sibling) {
>          if (strcmp(name, bus->name) == 0) {

This looks OK to me (and I like the effective API you get for
devices using things), but I don't know enough QOM/qdev internals
to be completely confident giving it a reviewed-by.

thanks
-- PMM
