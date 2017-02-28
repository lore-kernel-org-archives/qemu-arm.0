Received: by 10.25.0.147 with SMTP id 141csp1454592lfa;
        Tue, 28 Feb 2017 07:56:32 -0800 (PST)
X-Received: by 10.237.36.210 with SMTP id u18mr3722364qtc.51.1488297392876;
        Tue, 28 Feb 2017 07:56:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14si1758733qka.137.2017.02.28.07.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Feb 2017 07:56:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cik8c-0004On-4Y
	for alex.bennee@linaro.org; Tue, 28 Feb 2017 10:56:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cik7n-0003op-M1
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 10:55:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cik7m-0003Qk-U7
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 10:55:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42434)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cik7m-0003QU-Ot; Tue, 28 Feb 2017 10:55:38 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D0B97572E;
	Tue, 28 Feb 2017 15:55:38 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-29.ams2.redhat.com
	[10.36.112.29])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1SFtZZc005352; Tue, 28 Feb 2017 10:55:36 -0500
Date: Tue, 28 Feb 2017 16:55:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170228165533.690366cf@Igors-MacBook-Pro.local>
In-Reply-To: <1488293711-14195-2-git-send-email-peter.maydell@linaro.org>
References: <1488293711-14195-1-git-send-email-peter.maydell@linaro.org>
	<1488293711-14195-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 28 Feb 2017 15:55:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] qdev: Have
 qdev_set_parent_bus() handle devices already on a bus
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPYhN5vapyuA

On Tue, 28 Feb 2017 14:55:08 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> Instead of qdev_set_parent_bus() silently doing the wrong
> thing if it's handed a device that's already on a bus,
> have it remove the device from the old bus and add it to
> the new one. This is useful for the raspi2 sdcard.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/qdev.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 06ba02e..923e626 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -102,9 +102,23 @@ static void bus_add_child(BusState *bus, DeviceState *child)
>  
>  void qdev_set_parent_bus(DeviceState *dev, BusState *bus)
>  {
> +    bool replugging = dev->parent_bus != NULL;
> +
> +    if (replugging) {
> +        /* Keep a reference to the device while it's not plugged into
> +         * any bus, to avoid it potentially evaporating when it is
> +         * dereffed in bus_remove_child().
> +         */
> +        object_ref(OBJECT(dev));
> +        bus_remove_child(dev->parent_bus, dev);
> +        object_unref(OBJECT(dev->parent_bus));
> +    }
>      dev->parent_bus = bus;
>      object_ref(OBJECT(bus));
>      bus_add_child(bus, dev);
> +    if (replugging) {
> +        object_unref(OBJECT(dev));
> +    }
>  }
>  
>  /* Create a new device.  This only initializes the device state

