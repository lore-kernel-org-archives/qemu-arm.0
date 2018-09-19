Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp442106wrd;
        Wed, 19 Sep 2018 02:34:48 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ3szVaeBZwGRZZvb9t9Mt7rqXPXy9rv96rSg0U0puR48Ons4T5OZf7iN1WrMHSvw1t0NcB
X-Received: by 2002:ac8:1a04:: with SMTP id v4-v6mr24676242qtj.183.1537349688704;
        Wed, 19 Sep 2018 02:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537349688; cv=none;
        d=google.com; s=arc-20160816;
        b=GZgtJqHln+RYAAUaONiU/ASrRs/zL3IA305hWxGR8/31d0xmfJh5o+avpzUDM8U6u5
         iJiGdHKrEex9hQatQDPpgEzfxXOgtyXfVLFfwqVrF7vANYVryqIYM6dZn+pDEauprTnA
         q19BdWtn8PmVLGzWdHQUX4PpRXqeuCoS4OvFM1w1yGR48wpi+IUbU5BXeU9mnhHh0NDg
         V7mSO/kI+SeQZ8bmQeSSXmvkzl0rkF05R5r85xMV4QJngV3c+tnIBz4bEZdfH1AzGapE
         MbgJFWGNgYxmBIq5MPtHYV7lCzG/cFsqmjevkytqanCDX3OSv48Oh3RAuWFw/YoLubmj
         A0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=9La7WsMNt1XcwXMb4aQi2f5w+r/3hAbmtfTzYgrZZmg=;
        b=Mnp1/t2KiQiPwAb3L2PYzRyfFhcaEWYVRkofPEEMw4/xu+5BtHATmQCxP+i0IlJd59
         AQpi/pnOEqIxWiV1IPJ4NSF/tBIfYZ+M3Ub+djpiw2x4HWNfm50VCI1bvGXon2L6ZXfd
         lHue4QlAowfnuICHiLo1iz3p10yg+qL/FLvpyo2hrK/W3y7XYYFjcjFTkL/DxPToqM/p
         oOjGv+LHuZWF0G0a+/SbFo9sJsk6lsznRY960GBQ95eLXYzCkimL27bPF4tWBmMVZ4pj
         jlTwgBP0P4eZzHPngNKbib1t2By/L2kvpGxBVt2YngbxsrDmG3THr20oO67zlLFLJPT/
         5kxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9-v6si2703577qtc.57.2018.09.19.02.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 02:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2Ysi-0006Aa-4A
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 05:34:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g2YsY-0006AH-BD
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 05:34:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g2YsT-0008TC-9B
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 05:34:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g2YsS-0008RW-F8; Wed, 19 Sep 2018 05:34:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5975030001E8;
	Wed, 19 Sep 2018 09:34:29 +0000 (UTC)
Received: from [10.36.116.241] (ovpn-116-241.ams2.redhat.com [10.36.116.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D3F210021B1;
	Wed, 19 Sep 2018 09:34:23 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180913154458.23939-1-geert+renesas@glider.be>
	<20180913154458.23939-2-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5376dc54-2845-4f23-9581-ff5447a00cdc@redhat.com>
Date: Wed, 19 Sep 2018 11:34:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180913154458.23939-2-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 19 Sep 2018 09:34:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 1/3] vfio/platform: Make the vfio-platform
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
X-TUID: EB0dpNnEcDFU



On 9/13/18 5:44 PM, Geert Uytterhoeven wrote:
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
> v4:
>   - Propagate g_file_get_contents() errors through errp,
> 
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
>  hw/vfio/platform.c              | 24 +++++++++++++++++++++++-
>  include/hw/vfio/vfio-platform.h |  3 ++-
>  4 files changed, 27 insertions(+), 2 deletions(-)
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
> index 57c4a0ee2b58da70..894333c602eb6fd2 100644
> --- a/hw/vfio/platform.c
> +++ b/hw/vfio/platform.c
> @@ -655,6 +655,27 @@ static void vfio_platform_realize(DeviceState *dev, Error **errp)
>          goto out;
>      }
>  
> +    if (!vdev->compat) {
> +        GError *gerr = NULL;
> +        gchar *contents;
> +        gsize length;
> +        char *path;
> +
> +        path = g_strdup_printf("%s/of_node/compatible", vbasedev->sysfsdev);
> +        if (!g_file_get_contents(path, &contents, &length, &gerr)) {
> +            error_setg(errp, "%s", gerr->message);
> +            g_error_free(gerr);
leaks path
> +            return;
> +        }
> +        g_free(path);
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
> @@ -700,6 +721,8 @@ static void vfio_platform_class_init(ObjectClass *klass, void *data)
>      dc->desc = "VFIO-based platform device assignment";
>      sbc->connect_irq_notifier = vfio_start_irqfd_injection;
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    /* Supported by TYPE_VIRT_MACHINE */
> +    dc->user_creatable = true;
>  }
>  
>  static const TypeInfo vfio_platform_dev_info = {
> @@ -708,7 +731,6 @@ static const TypeInfo vfio_platform_dev_info = {
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
> +    unsigned int num_compat; /* number of compatible values */
>      uint32_t mmap_timeout; /* delay to re-enable mmaps after interrupt */
>      QEMUTimer *mmap_timer; /* allows fast-path resume after IRQ hit */
>      QemuMutex intp_mutex; /* protect the intp_list IRQ state */
> 
With leak fix,
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
