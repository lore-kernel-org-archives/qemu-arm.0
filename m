Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4260788wru;
        Tue, 7 Aug 2018 07:19:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpenkU4JG8fRmb1vyyuveRMl48jE1FwWWoONUwEVqjHPyJh+lYJ9UHnXjM2q4R4NhzbgIlkg
X-Received: by 2002:a37:a18d:: with SMTP id k135-v6mr16867490qke.203.1533651579655;
        Tue, 07 Aug 2018 07:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533651579; cv=none;
        d=google.com; s=arc-20160816;
        b=syHmAYJsEJfSmV4y1hxs9pQ4a8i6cD2JeZtltiFBLK4ElPJICumovcGuCmk8+WO2bk
         yJGC2VIT3wDaVfKYUT8/t2WzhjnXBb7neTWxJYk8idehc51klSSNCAsS8qk6Lot3gWKz
         s1tg1/JHlj3HWkOR34i5lNOvcAeDrTi7zFQ1obL9L0fzKvi+vVu5Rk6zOpabmHJe+0EL
         zIHotf2cyv7DifVyCynr+DKwT0LHW4/FZQb22H1mV0rJSpYEkWP3kxI2ThdwwwgP4k88
         Si5bsho37Gs5Bgsjl/+yy1rCzMmWoa7+2JWiuxXIg5TNrZIscC+JmMGlBnNFB13qrd2g
         Z2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=oGBbUcpVhVk60bmt6aj6Tn4uqITgqUUPiOFoKsEMhUA=;
        b=EvI4AX0PWZVtqFORdUB7xQ47ul9c8VsijsZ/gUtiJ6Kbl/43n+Zgo/aHrkr7AYG4F6
         vaZslmvEzxrXzabTKKqMpbY7AkVqA9ZYwTW8TRQvaYOHMY0T6XIqeZReq6f71oebfI3B
         1VDgEYAGukj0XSWtlAL1Iefq79y67U+7ZOEJj2f67PEJz8kdavC47dVXeDFsdJbnMCik
         Ts2ZVcVzoAARia8tld26Ulj7doWk3L92fRU2huHCF6EIkuZQa4stDoAodW6x/TGCOLS+
         aoAEnTzmNkf3KV1y46THvpwdNCsVKriDzK7roiPlg71ot7Sxt/MMp5JU+R02q11KteOa
         5oJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r5-v6si1303934qkr.250.2018.08.07.07.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 07:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fn2pn-00011B-3z
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 10:19:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn2pA-0000wp-RA
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 10:19:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fn2p9-0002Fy-Df
	for qemu-devel@nongnu.org; Tue, 07 Aug 2018 10:19:00 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56056 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fn2p6-0002CW-Kx; Tue, 07 Aug 2018 10:18:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EDEE87A76;
	Tue,  7 Aug 2018 14:18:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FD0B2026D66;
	Tue,  7 Aug 2018 14:18:54 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180725143413.9728-1-geert+renesas@glider.be>
	<20180725143413.9728-3-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <768b7a25-273d-69cb-5b98-8339313560c3@redhat.com>
Date: Tue, 7 Aug 2018 16:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180725143413.9728-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 07 Aug 2018 14:18:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 07 Aug 2018 14:18:56 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v3 2/4] hw/arm/sysbus-fdt: Allow device
 matching with DT compatible value
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Dl4ETN88JcB

Hi Geert,

On 07/25/2018 04:34 PM, Geert Uytterhoeven wrote:
> From: Auger Eric <eric.auger@redhat.com>
> 
> Up to now we have relied on the device type to identify a device tree
> node creation function.  Since we would like the vfio-platform device to
> be instantiatable with different compatible strings we introduce the
> capability to specialize the node creation depending on actual
> compatible value.
> 
> NodeCreationPair is renamed into BindingEntry. The struct is enhanced
> with compat and match_fn() fields.  We introduce a new matching function
> adapted to the vfio-platform generic device.
> 
> From now on, the AMD XGBE can be instantiated with either manner, i.e.:
> 
>     -device vfio-amd-xgbe,host=e0900000.xgmac
> 
> or using the new option line:
> 
>     -device vfio-platform,host=e0900000.xgmac
strictly speaking I think you need patch 3 to do that?
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> [geert: Match using compatible values in sysfs instead of user-supplied
> 	manufacturer/model options, reword]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not tested with amd-xgbe due to lack of hardware.
I tested it. Feel free to add:
Tested-by: Eric Auger <eric.auger@redhat.com>

Otherwise looks fine to me

Thanks

Eric
> 
> v3:
>   - Match using the compatible values from sysfs instead of using
>     user-supplied manufacturer and model options,
>   - Reword patch description,
>   - Drop RFC state,
> 
> v2:
>   - No changes,
> 
> v1:
>   - No changes,
> 
> v0:
>   - Original version from Eric.
> ---
>  hw/arm/sysbus-fdt.c | 61 ++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 47 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
> index 43d6a7bb48ddc351..0e24c803a1c2c734 100644
> --- a/hw/arm/sysbus-fdt.c
> +++ b/hw/arm/sysbus-fdt.c
> @@ -50,11 +50,13 @@ typedef struct PlatformBusFDTData {
>      PlatformBusDevice *pbus;
>  } PlatformBusFDTData;
>  
> -/* struct that associates a device type name and a node creation function */
> -typedef struct NodeCreationPair {
> +/* struct that allows to match a device and create its FDT node */
> +typedef struct BindingEntry {
>      const char *typename;
> -    int (*add_fdt_node_fn)(SysBusDevice *sbdev, void *opaque);
> -} NodeCreationPair;
> +    const char *compat;
> +    int  (*add_fn)(SysBusDevice *sbdev, void *opaque);
> +    bool (*match_fn)(SysBusDevice *sbdev, const struct BindingEntry *combo);
> +} BindingEntry;
>  
>  /* helpers */
>  
> @@ -413,6 +415,27 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
>      return 0;
>  }
>  
> +/* DT compatible matching */
> +static bool vfio_platform_match(SysBusDevice *sbdev,
> +                                const BindingEntry *entry)
> +{
> +    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
> +    const char *compat;
> +    unsigned int n;
> +
> +    for (n = vdev->num_compat, compat = vdev->compat; n > 0;
> +         n--, compat += strlen(compat) + 1) {
> +        if (!strcmp(entry->compat, compat)) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +#define VFIO_PLATFORM_BINDING(compat, add_fn) \
> +    {TYPE_VFIO_PLATFORM, (compat), (add_fn), vfio_platform_match}
> +
>  #endif /* CONFIG_LINUX */
>  
>  static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
> @@ -420,14 +443,23 @@ static int no_fdt_node(SysBusDevice *sbdev, void *opaque)
>      return 0;
>  }
>  
> -/* list of supported dynamic sysbus devices */
> -static const NodeCreationPair add_fdt_node_functions[] = {
> +/* Device type based matching */
> +static bool type_match(SysBusDevice *sbdev, const BindingEntry *entry)
> +{
> +    return !strcmp(object_get_typename(OBJECT(sbdev)), entry->typename);
> +}
> +
> +#define TYPE_BINDING(type, add_fn) {(type), NULL, (add_fn), type_match}
> +
> +/* list of supported dynamic sysbus bindings */
> +static const BindingEntry bindings[] = {
>  #ifdef CONFIG_LINUX
> -    {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
> -    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
> +    TYPE_BINDING(TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node),
> +    TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
> +    VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
>  #endif
> -    {TYPE_RAMFB_DEVICE, no_fdt_node},
> -    {"", NULL}, /* last element */
> +    TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
> +    TYPE_BINDING("", NULL), /* last element */
>  };
>  
>  /* Generic Code */
> @@ -446,10 +478,11 @@ static void add_fdt_node(SysBusDevice *sbdev, void *opaque)
>  {
>      int i, ret;
>  
> -    for (i = 0; i < ARRAY_SIZE(add_fdt_node_functions); i++) {
> -        if (!strcmp(object_get_typename(OBJECT(sbdev)),
> -                    add_fdt_node_functions[i].typename)) {
> -            ret = add_fdt_node_functions[i].add_fdt_node_fn(sbdev, opaque);
> +    for (i = 0; i < ARRAY_SIZE(bindings); i++) {
> +        const BindingEntry *iter = &bindings[i];
> +
> +        if (iter->match_fn(sbdev, iter)) {
> +            ret = iter->add_fn(sbdev, opaque);
>              assert(!ret);
>              return;
>          }
> 
