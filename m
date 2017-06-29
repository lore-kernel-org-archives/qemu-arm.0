Received: by 10.25.227.6 with SMTP id a6csp4383114lfh;
        Thu, 29 Jun 2017 06:45:27 -0700 (PDT)
X-Received: by 10.55.158.137 with SMTP id h131mr19419967qke.246.1498743927026;
        Thu, 29 Jun 2017 06:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498743927; cv=none;
        d=google.com; s=arc-20160816;
        b=TJYFfHfOaDoTkUgOR6ANDHEkXcLN9X5HdeXZn9NjBUp4ezZEPAODAgC1N+2FIRwvuC
         gcI1YlOgfJkP4mxX+N4T6IBd0abHV/GTBxobfKIxWdIYkza3mFrjtBYDsdU1TbNGyu6w
         fIcfEu60KLkDeYNbu1mXf0aPvOdHksHRh1F5U/lOwRCfQWWwPtUt6mkIU+P7T41UhvXq
         /fOTQKxsx/bfbh+o1rOLUidcceqm9M6ebHra/XUfxV2LaUTUtIlntVgxez8ZtF8P8/4f
         GDa6vmpAmwxH+o1nAH6YWwWMPx5RjlsbwVD6gqY18Pf8J3ybnPxeOwIJbINc7/3rh4FG
         NIZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=6S20iz0S9X4lH5d4wuroLlYw4VJ1C6vDfITImn/rMfU=;
        b=f6EFDjLJ+cAxui6LGxxMjCU3JFdAXjtwLGwzUzDBW3ZjACqc9AL+X3AjPultzqE2Jk
         e44YSkcvgqwojlLee6PTGCJ7qn0IrfhPos0UyqVE/A9iUxaVR7wyuQe5Mq46S2mglaKM
         m5qZ1UkAOwTVG2xMPjWGgQOvPCBmA3PovOGjXy2K0cpTYza82pSP28GUPI+OHp/8V7V6
         oqAUwHkAUDt99ZmLPooMuzGwW2UvDrgRTHlspU0FsfeNk5WUiE9CD1GbBaKtwmjsh5FV
         4Tqq87XxR988H5tzh6128Yj8qqACEWyYxjKhTt67mvsiP3Gdys6BtCXqY0NBAvRWFJra
         1N9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si4711461qte.159.2017.06.29.06.45.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Jun 2017 06:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39464 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQZl6-0004DV-9P
	for alex.bennee@linaro.org; Thu, 29 Jun 2017 09:45:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dQZkv-00048b-Ay
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 09:45:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dQZkq-0003LO-CM
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 09:45:13 -0400
Received: from mail-wr0-f169.google.com ([209.85.128.169]:34925)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1dQZkq-0003JA-2r
	for qemu-arm@nongnu.org; Thu, 29 Jun 2017 09:45:08 -0400
Received: by mail-wr0-f169.google.com with SMTP id k67so189205750wrc.2
	for <qemu-arm@nongnu.org>; Thu, 29 Jun 2017 06:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6S20iz0S9X4lH5d4wuroLlYw4VJ1C6vDfITImn/rMfU=;
	b=alAnXUdIKGpGNVIkT89UocQXEQs8aPVVLrnFYBxd5zbMJq77h4m9b7AmqBr2gcu+pO
	x3gEe/bLNHDTlGIMC2VWqZ1myaXW91Lpev5+8o3IVtRW1q5gCJU+rC3lYLMxU38UXJSS
	Wmpjq9EGp3FPnCNJ7ZzHPy6dsvIa+5DiP0CeL30iIh4Kq1mILJvS2V9neK9/qABwyfrI
	UKdyJY5ziJRHaeThtirrkPkVafculZImOH2JJ1aztCS4IWkHBSMxqjfOf4tahR13ornt
	eMeGAL7raNWZZWUcqAOK1gre02M83tYXv22kHZE8P/2qxILLeEUFsj0P/b7J70Rwz4HW
	i9gg==
X-Gm-Message-State: AKS2vOw4wFeQi/SF9wfTOSMJH2xPgkNNDah0bcwoBiV6FvxV8t5SraQO
	YIX4IXIuI2eQodYl
X-Received: by 10.223.175.18 with SMTP id z18mr24996695wrc.22.1498743906640;
	Thu, 29 Jun 2017 06:45:06 -0700 (PDT)
Received: from [192.168.10.165] (94-39-191-51.adsl-ull.clienti.tiscali.it.
	[94.39.191.51])
	by smtp.gmail.com with ESMTPSA id e17sm8900383wma.1.2017.06.29.06.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Jun 2017 06:45:05 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b6193c2f-a358-b871-34f7-7f8d6784f4b8@redhat.com>
Date: Thu, 29 Jun 2017 15:45:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.169
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qom: enforce readonly nature of
 link's check callback
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
Cc: famz@redhat.com, mst@redhat.com, alistair.francis@xilinx.com,
	qemu-arm@nongnu.org, afaerber@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jgDyKHjJqvAq

On 29/06/2017 13:14, Igor Mammedov wrote:
> link's check callback is supposed to verify/permit setting it,
> however currently nothing restricts it from misusing it
> and modifying target object from within.
> Make sure that readonly semantics are checked by compiler
> to prevent callback's misuse.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> Fam,
>  it probably conflicts with yours DEFINE_PROP_LINK series,
>  feel free to include this patch if you'll have to respin
> 
> ---
>  include/hw/qdev-properties.h | 3 ++-
>  include/qom/object.h         | 6 +++---
>  hw/core/qdev-properties.c    | 3 ++-
>  hw/display/xlnx_dp.c         | 2 +-
>  hw/ipmi/ipmi.c               | 2 +-
>  hw/mem/pc-dimm.c             | 2 +-
>  hw/misc/ivshmem.c            | 2 +-
>  qom/object.c                 | 8 ++++----
>  8 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index 306bbab..6dfe16e 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -234,7 +234,8 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
>   * This function should be used as the check() argument to
>   * object_property_add_link().
>   */
> -void qdev_prop_allow_set_link_before_realize(Object *obj, const char *name,
> +void qdev_prop_allow_set_link_before_realize(const Object *obj,
> +                                             const char *name,
>                                               Object *val, Error **errp);
>  
>  #endif
> diff --git a/include/qom/object.h b/include/qom/object.h
> index 5ecc2d1..5223692 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -788,7 +788,7 @@ ObjectClass *object_get_class(Object *obj);
>   *
>   * Returns: The QOM typename of @obj.
>   */
> -const char *object_get_typename(Object *obj);
> +const char *object_get_typename(const Object *obj);
>  
>  /**
>   * type_register_static:
> @@ -1320,7 +1320,7 @@ typedef enum {
>   * callback function.  It allows the link property to be set and never returns
>   * an error.
>   */
> -void object_property_allow_set_link(Object *, const char *,
> +void object_property_allow_set_link(const Object *, const char *,
>                                      Object *, Error **);
>  
>  /**
> @@ -1353,7 +1353,7 @@ void object_property_allow_set_link(Object *, const char *,
>   */
>  void object_property_add_link(Object *obj, const char *name,
>                                const char *type, Object **child,
> -                              void (*check)(Object *obj, const char *name,
> +                              void (*check)(const Object *obj, const char *name,
>                                              Object *val, Error **errp),
>                                ObjectPropertyLinkFlags flags,
>                                Error **errp);
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index 2a82768..95e5fdb 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -25,7 +25,8 @@ void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
>      }
>  }
>  
> -void qdev_prop_allow_set_link_before_realize(Object *obj, const char *name,
> +void qdev_prop_allow_set_link_before_realize(const Object *obj,
> +                                             const char *name,
>                                               Object *val, Error **errp)
>  {
>      DeviceState *dev = DEVICE(obj);
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index f43eb09..3ed81ff 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -515,7 +515,7 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
>      s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;
>  }
>  
> -static void xlnx_dp_set_dpdma(Object *obj, const char *name, Object *val,
> +static void xlnx_dp_set_dpdma(const Object *obj, const char *name, Object *val,
>                                Error **errp)
>  {
>      XlnxDPState *s = XLNX_DP(obj);
> diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
> index 5cf1caa..a2fd1eb 100644
> --- a/hw/ipmi/ipmi.c
> +++ b/hw/ipmi/ipmi.c
> @@ -90,7 +90,7 @@ static TypeInfo ipmi_interface_type_info = {
>      .class_init = ipmi_interface_class_init,
>  };
>  
> -static void isa_ipmi_bmc_check(Object *obj, const char *name,
> +static void isa_ipmi_bmc_check(const Object *obj, const char *name,
>                                 Object *val, Error **errp)
>  {
>      IPMIBmc *bmc = IPMI_BMC(val);
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 9e8dab0..380cb30 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -366,7 +366,7 @@ static void pc_dimm_get_size(Object *obj, Visitor *v, const char *name,
>      visit_type_int(v, name, &value, errp);
>  }
>  
> -static void pc_dimm_check_memdev_is_busy(Object *obj, const char *name,
> +static void pc_dimm_check_memdev_is_busy(const Object *obj, const char *name,
>                                        Object *val, Error **errp)
>  {
>      Error *local_err = NULL;
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index abeaf3d..e25016c 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -1005,7 +1005,7 @@ static const TypeInfo ivshmem_common_info = {
>      .class_init    = ivshmem_common_class_init,
>  };
>  
> -static void ivshmem_check_memdev_is_busy(Object *obj, const char *name,
> +static void ivshmem_check_memdev_is_busy(const Object *obj, const char *name,
>                                           Object *val, Error **errp)
>  {
>      if (host_memory_backend_is_mapped(MEMORY_BACKEND(val))) {
> diff --git a/qom/object.c b/qom/object.c
> index 7a05e35..a429e64 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -735,7 +735,7 @@ out:
>      return ret;
>  }
>  
> -const char *object_get_typename(Object *obj)
> +const char *object_get_typename(const Object *obj)
>  {
>      return obj->class->type->name;
>  }
> @@ -1395,7 +1395,7 @@ out:
>      g_free(type);
>  }
>  
> -void object_property_allow_set_link(Object *obj, const char *name,
> +void object_property_allow_set_link(const Object *obj, const char *name,
>                                      Object *val, Error **errp)
>  {
>      /* Allow the link to be set, always */
> @@ -1403,7 +1403,7 @@ void object_property_allow_set_link(Object *obj, const char *name,
>  
>  typedef struct {
>      Object **child;
> -    void (*check)(Object *, const char *, Object *, Error **);
> +    void (*check)(const Object *, const char *, Object *, Error **);
>      ObjectPropertyLinkFlags flags;
>  } LinkProperty;
>  
> @@ -1519,7 +1519,7 @@ static void object_release_link_property(Object *obj, const char *name,
>  
>  void object_property_add_link(Object *obj, const char *name,
>                                const char *type, Object **child,
> -                              void (*check)(Object *, const char *,
> +                              void (*check)(const Object *, const char *,
>                                              Object *, Error **),
>                                ObjectPropertyLinkFlags flags,
>                                Error **errp)
> 


Good idea.  I think it's okay to wait for Fam's series.

Paolo
