Received: by 10.25.227.6 with SMTP id a6csp5435493lfh;
        Fri, 30 Jun 2017 03:41:22 -0700 (PDT)
X-Received: by 10.200.34.117 with SMTP id p50mr28224827qtp.2.1498819282273;
        Fri, 30 Jun 2017 03:41:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498819282; cv=none;
        d=google.com; s=arc-20160816;
        b=sXhtg2cBrz6kSHQhPhvwrSzt6My+haUP1roYwC9YHCrErAeyXLfhUlE1zUawYJ/k2R
         46GoMC+T0A0UJ/AZkKLxf7YxeewD258/AL1WpQfXStUIX7hpxaa9k84G/lMeAWpjKX6L
         9Xc17Ux+0p3JzG0QPd8MU6EClgKOtKmUmEowdvYBfXeQ77m1yFGD6tNGrPu3Dk+3/CrT
         wry9/d/ShFCPP9WN2q5bjF+pRuGfnEHDbRVZ6e2efnEp/eObnCXfbdaMEgdEqSF0KGXX
         ZnaSM2zusGuW0lK/zenBsLzbAReldLPyrJoc2urwnpP3gnLNiLzeo3btuqUH0gx7Zl4X
         b6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=WtC8RRTWCH6NmDWirkKDlU7YJXV6tHTP9G7dB7EAZtU=;
        b=ZWYbPhQ6m7BPKlwPyhGaEBJwXGw3TEfgm7angfoO05JdSrpRktxr+yA1RyFm6mv8wT
         QUEvWMnq6T3xQ1BkItwYi5LTAmA4aLNvOlOUNvYKg53XdMrG+HQG4HXcAxLKrycUMQkt
         XnfFxIW0Wj594xJRAojyDW4KQ8AEqz9nXQX2yIqoL6wXZdk8/S3GEhPLlTevQ9Z4yKRJ
         7N/iJAFwp0Lcy0QbXPj1P3idjyDy1gX7qAe1qqVXBvSLv//csd3I3LnSJzmaPKNcfWE5
         eboJ2KtFzuw2UIZxVhONh65SiSyNiY6Sh9rtMXZKrHZAoG9j+Or8pMFIs6XvNsLFOsYV
         nuxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i22si1807793qtc.237.2017.06.30.03.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Jun 2017 03:41:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQtMV-0005wg-Ju
	for alex.bennee@linaro.org; Fri, 30 Jun 2017 06:41:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dQtMR-0005wZ-VH
	for qemu-arm@nongnu.org; Fri, 30 Jun 2017 06:41:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dQtMO-0004Ui-Qk
	for qemu-arm@nongnu.org; Fri, 30 Jun 2017 06:41:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55936)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dQtMO-0004UM-IA; Fri, 30 Jun 2017 06:41:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C83B4E4D6;
	Fri, 30 Jun 2017 10:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9C83B4E4D6
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9C83B4E4D6
Received: from [10.36.118.6] (unknown [10.36.118.6])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02AB286439;
	Fri, 30 Jun 2017 10:41:02 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <41be440c-e158-fb83-15dd-e9853460d5a3@redhat.com>
Date: Fri, 30 Jun 2017 12:41:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 30 Jun 2017 10:41:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] qom: enforce readonly nature of link's check
 callback
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
X-TUID: Ux9WzTIbnG2W



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

Since there will be a respin, I'm _not_ queuing this patch.

Paolo

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
