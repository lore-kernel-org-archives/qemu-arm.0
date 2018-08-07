Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4260239wru;
        Tue, 7 Aug 2018 07:19:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdiZ4yKmnq0fA//RoDrPu9suhmSlL1tmjIkUILyDnYpiu3ZzkBe0h6PO2BpsVWO4Xcpa8Sl
X-Received: by 2002:a0c:c90d:: with SMTP id r13-v6mr16823504qvj.45.1533651549451;
        Tue, 07 Aug 2018 07:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533651549; cv=none;
        d=google.com; s=arc-20160816;
        b=GTZn9XFj+nzhkV2Rbig8UzU9ZvNrhO7GXqJAF/JyfeZVuc7kxK91pyDFQma51k7DAI
         UK9Y3v0gcJTs1/MAhTU+OELHbtwmt5Ha9HDUbgafM0h0wO/IYDF3sbYdwBV0QQpc52cU
         XHjHDCIajSqTsDhOOKi2ojeFrzJxjMlubh+bKBk80vfwZzPaSNyM3iePpkHjQJIpapD7
         EpthLXRes7X+WA+pHxWt/ijD/k1Lt+NNWtfgXeN7rKqDBE8+a8eAZiQFHcmgaiqF1t2j
         ncwhvJh0uHbGTYLR+DGKTfvTfHirAp8rqBAZ46Cocf736moa0olQ1gs0PwKSePFeZutM
         cEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=lBBeFUZ0YMIetOHecWN4K297LQGjzCngt5JLpLra0N4=;
        b=YAdQZVohUvBDVGOAFZa93MYTASYkByjlY9o2QrPWHnZIJfCcp7kW04/ei0j4MqRhlk
         X00abyDeT5t5PqXWz07+PUARWnJq8qYY/PKUtuoveOX0wWBYqAHj3W8fDDgUFH7Sc7FM
         CQHVhgJZTdA5arV0wfv7GiaSbEjvpm/ssguaOpD8/K1Z+hizAZ5UowxECzYEkH940C38
         jYpQLheXxPAGNeTAex+V2pSbcN3BBy9un/60M5dplNRmqEhyr5OwOHpSg634XtghxcQS
         Hn7/SWJlm0V4BjUWn8Kp5vtC8TJCNz/WbpWF8Qaa7znByRpnjdhCVem7GOqZpo2OSzAh
         kfLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6-v6si1284862qvl.54.2018.08.07.07.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn2pI-0000w8-Tx
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:19:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn2p7-0000ug-TM
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:18:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn2p3-00029y-Kj
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 10:18:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56036 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fn2p3-00029C-Cu; Tue, 07 Aug 2018 10:18:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD04E87A70;
	Tue,  7 Aug 2018 14:18:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA1D32166BA0;
	Tue,  7 Aug 2018 14:18:49 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-2-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <276c2cab-659f-ad1a-d3a3-0e0df9a439c9@redhat.com>
Date: Tue, 7 Aug 2018 16:18:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180725143413.9728-2-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 07 Aug 2018 14:18:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 07 Aug 2018 14:18:52 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v3 1/4] vfio/platform: Make the vfio-platform
 device non-abstract
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8nAYJueNNiKY

Hi Geert,

On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
> From: Auger Eric <eric.auger@redhat.com>
> 
> Up to now the vfio-platform device has been abstract and could not be
> instantiated.  The integration of a new vfio platform device required
> creating a dummy derived device which only set the compatible string.
> 
> Following the few vfio-platform device integrations we have seen the
> actual requested adaptation happens on device tree node creation
> (sysbus-fdt).
> 
> Hence remove the abstract setting, and read the list of compatible
> values from sysfs if not set by a derived device.
> 
> Update the amd-xgbe and calxeda-xgmac drivers to fill in the number of
> compatible values, as there can now be more than one.
> 
> Note that sysbus-fdt does not support the instantiation of the
> vfio-platform device yet.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> [geert: Rebase, set user_creatable=true, use compatible values in sysfs
> 	instead of user-supplied manufacturer/model options, reword]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Read all compatible values from sysfs instead of using user-supplied
>     manufacturer and model options,
>   - Reword patch description,
>   - Drop RFC state,
> 
> v2:
>   - No changes,
> 
> v1:
>   - Rebase, Set user_creatable=true,
> 
> v0:
>   - Original version from Eric.
> ---
>  hw/vfio/amd-xgbe.c              |  1 +
>  hw/vfio/calxeda-xgmac.c         |  1 +
>  hw/vfio/platform.c              | 22 +++++++++++++++++++++-
>  include/hw/vfio/vfio-platform.h |  3 ++-
>  4 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
> index 0c4ec4ba25170366..ee64a3b4a2e45bf5 100644
> --- a/hw/vfio/amd-xgbe.c
> +++ b/hw/vfio/amd-xgbe.c
> @@ -20,6 +20,7 @@ static void amd_xgbe_realize(DeviceState *dev, Error **errp)
>      VFIOAmdXgbeDeviceClass *k = VFIO_AMD_XGBE_DEVICE_GET_CLASS(dev);
>  
>      vdev->compat = g_strdup("amd,xgbe-seattle-v1a");
> +    vdev->num_compat = 1;
>  
>      k->parent_realize(dev, errp);
>  }
> diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
> index 24cee6d06512c1b6..e7767c4b021be566 100644
> --- a/hw/vfio/calxeda-xgmac.c
> +++ b/hw/vfio/calxeda-xgmac.c
> @@ -20,6 +20,7 @@ static void calxeda_xgmac_realize(DeviceState *dev, Error **errp)
>      VFIOCalxedaXgmacDeviceClass *k = VFIO_CALXEDA_XGMAC_DEVICE_GET_CLASS(dev);
>  
>      vdev->compat = g_strdup("calxeda,hb-xgmac");
> +    vdev->num_compat = 1;
>  
>      k->parent_realize(dev, errp);
>  }
> diff --git a/hw/vfio/platform.c b/hw/vfio/platform.c
> index 57c4a0ee2b58da70..e264555cd5dafb16 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -655,6 +655,25 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
>          goto out;
>      }
>  
> +    if (!vdev->compat) {
> +        gchar *contents;
> +        gsize length;
> +        char *tmp;
> +
> +        tmp = g_strdup_printf("%s/of_node/compatible", vbasedev->sysfsdev);
> +        if (!g_file_get_contents(tmp, &contents, &length, NULL)) {
> +            error_report("failed to load \"%s\"", tmp);
> +            exit(1);
You should set errp instead so that the error gets properly propagated.
> +        }
> +        g_free(tmp);
> +        vdev->compat = contents;
> +        for (vdev->num_compat = 0; length; vdev->num_compat++) {
> +            size_t skip = strlen(contents) + 1;
> +            contents += skip;
> +            length -= skip;
> +        }
> +    }
> +
>      for (i = 0; i < vbasedev->num_regions; i++) {
>          if (vfio_region_mmap(vdev->regions[i])) {
>              error_report("%s mmap unsupported. Performance may be slow",
> @@ -700,6 +719,8 @@ static void vfio_platform_class_init(ObjectClass *klass, void *data)
>      dc->desc = "VFIO-based platform device assignment";
>      sbc->connect_irq_notifier = vfio_start_irqfd_injection;
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    /* Supported by TYPE_VIRT_MACHINE */
> +    dc->user_creatable = true;
>  }
>  
>  static const TypeInfo vfio_platform_dev_info = {
> @@ -708,7 +729,6 @@ static const TypeInfo vfio_platform_dev_info = {
>      .instance_size = sizeof(VFIOPlatformDevice),
>      .class_init = vfio_platform_class_init,
>      .class_size = sizeof(VFIOPlatformDeviceClass),
> -    .abstract   = true,
>  };
>  
>  static void register_vfio_platform_dev_type(void)
> diff --git a/include/hw/vfio/vfio-platform.h b/include/hw/vfio/vfio-platform.h
> index 9baaa2db09b84f3e..0ee10b1d71ed2503 100644
> --- a/include/hw/vfio/vfio-platform.h
> +++ b/include/hw/vfio/vfio-platform.h
> @@ -54,7 +54,8 @@ typedef struct VFIOPlatformDevice {
>      QLIST_HEAD(, VFIOINTp) intp_list; /* list of IRQs */
>      /* queue of pending IRQs */
>      QSIMPLEQ_HEAD(pending_intp_queue, VFIOINTp) pending_intp_queue;
> -    char *compat; /* compatibility string */
> +    char *compat; /* DT compatible values, separated by NUL */
by NULL characters?
> +    unsigned int num_compat; /* number of compatible values */
>      uint32_t mmap_timeout; /* delay to re-enable mmaps after interrupt */
>      QEMUTimer *mmap_timer; /* allows fast-path resume after IRQ hit */
>      QemuMutex intp_mutex; /* protect the intp_list IRQ state */
Thanks

Eric
> 
