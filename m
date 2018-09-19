Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp442448wrd;
        Wed, 19 Sep 2018 02:35:09 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYevdDHMlN7XM+p4F0BqrIaKtfRQFnbeX5irSL2wvubbr1POj0W5xLNTee1U8Giu/PeC5U/
X-Received: by 2002:a37:8786:: with SMTP id j128-v6mr23200428qkd.32.1537349709328;
        Wed, 19 Sep 2018 02:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537349709; cv=none;
        d=google.com; s=arc-20160816;
        b=IuG4vOQfzLKKjNGmDc+CPYwIk4f+XHPwsci8szx+hAAnqHr+ziCS5aQmDDmghcTb67
         SHhYO4EvOlo78YF6GqrA25z99imAkYYy0jTncirGkEQZKxnWuj6ZJTg37AOWIkEGZymS
         Dnp6s+yK6ItWqxXJ2IE7HaeoHFzbB772wedWPmKCtWjtGDcDmVKmaDFqSA8cL22vZahy
         KU6WWKxgRk1IeT8zFlVV18u8o8hUOpeG1QsBOaK7ahaXso9ffCqbPgkq3el3hqVx7EGq
         cgdjFI9HJ0+yNH9RDfoZnK783OiIljW2VUJZZ2JSWZjHRJuWILNcyRM+4L0s8WoAsPko
         A9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=PQb8dUFo2cXGAeIcnjGC7WEqvfCByTQF4pJCU83rM60=;
        b=LnWCUTrzcTjxfAPJhRfGbXF1q1ZQvaXVfYG6dGWMmaOhwYIpygL+2bCsO8LGc5e89F
         KORbzIMGWZABUojxKkwMNp2dxIbFJOlT86ElwiZnj/hn36MWwz3ESj3mtGL15rfjoez5
         Pf0J6d3y7xecsHMDrKvjHE/FUvQGLMkHpRTyuVSUcSq5QgS2Cw0od3RvJ2axAgAI/tUB
         0LK2OfGs4KQlj0ILIlrS2H0WUdI0zxUlpU9zELCZnSvbltaEu1OS9P2yaaSaMXy75S8W
         lz7bTArb+vLaIAr56MZZIlQ3+bWYPOMz8L1imuPcG6kk6H2ZpVqzocCzV3YLVfFSQOak
         bUQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f31-v6si286055qtd.77.2018.09.19.02.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Sep 2018 02:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g2Yt2-0006LT-Q4
	for alex.bennee@linaro.org; Wed, 19 Sep 2018 05:35:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36135)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g2YsY-0006AI-C7
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 05:34:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g2YsT-0008T8-95
	for qemu-arm@nongnu.org; Wed, 19 Sep 2018 05:34:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g2YsS-0008Ri-FA; Wed, 19 Sep 2018 05:34:32 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com
	[10.5.11.24])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B6023091D4E;
	Wed, 19 Sep 2018 09:34:30 +0000 (UTC)
Received: from [10.36.116.241] (ovpn-116-241.ams2.redhat.com [10.36.116.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 171B3308BDAE;
	Wed, 19 Sep 2018 09:34:25 +0000 (UTC)
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
References: <20180913154458.23939-1-geert+renesas@glider.be>
	<20180913154458.23939-3-geert+renesas@glider.be>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <94e4b5cf-cf33-e239-da88-e513db19fbab@redhat.com>
Date: Wed, 19 Sep 2018 11:34:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180913154458.23939-3-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 19 Sep 2018 09:34:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 2/3] hw/arm/sysbus-fdt: Allow device
 matching with DT compatible value
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
X-TUID: lkQDT5kfYUS9

Hi Geert,

On 9/13/18 5:44 PM, Geert Uytterhoeven wrote:
> From: Auger Eric <eric.auger@redhat.com>
> 
> Up to now we have relied on the device type to identify a device tree
> node creation function.  Since we would like the vfio-platform device to
> be instantiatable with different compatible strings we introduce the
s/instantiatable/instantiable
> capability to specialize the node creation depending on actual
> compatible value.
> 
> NodeCreationPair is renamed into BindingEntry. The struct is enhanced
> with compat and match_fn() fields.  We introduce a new matching function
> adapted to the vfio-platform generic device.
> 
> Soon, the AMD XGBE can be instantiated with either manner, i.e.:
> 
>     -device vfio-amd-xgbe,host=e0900000.xgmac
> 
> or using the new option line:
> 
>     -device vfio-platform,host=e0900000.xgmac
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> [geert: Match using compatible values in sysfs instead of user-supplied
> 	manufacturer/model options, reword]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Feel free to add my T-b on the whole series (tested with amd_xgbe)
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> v4:
>   - Add Tested-by (with amd-xgbe),
>   - s/From now on/Soon/ in patch description,
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
