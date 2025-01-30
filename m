Received: by 2002:a17:504:5a03:b0:1be9:327d:8ee3 with SMTP id iw3csp110010njb;
        Thu, 30 Jan 2025 08:30:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUs9oekN7WS68b3HmJeMK5i+hW0HrhrC02rzJB07vj2McrhmaMc1lGiVxr+pBavi0tggQ7Xd1EIB+1+6A==@linaro.org
X-Google-Smtp-Source: AGHT+IFiNsVg9UZP4bSC1LgEqTN1rvxAQC5G/yP7m3Iebyj977Ks84Ro2BfC1b9XfjNN7Yi51eFZ
X-Received: by 2002:a05:622a:285:b0:460:8f80:909a with SMTP id d75a77b69052e-46fd0b8006amr141052461cf.32.1738254623284;
        Thu, 30 Jan 2025 08:30:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738254623; cv=none;
        d=google.com; s=arc-20240605;
        b=HGHHmYJCo1kpId9h2Y3g6z5/huZYAMmTCjUizJtZyS6EMbnBcwUrHRWVRfDBl0OlHh
         UExw5F+xK8FZgf5qL6ix2IjBUC7KnLTqxe/Pr7raasnj/AqJTLHJl9pJdLHNUgaxhOzT
         MoEPxbQ49Ogz5Iwcn6JkYM6506487vgiM0qODm4mN4p1sS3Iori3+NKpTzONIoP63CmH
         gnD/KmWzwCqH/L6tHYnsh7ivS8/ytcxmS3YJ+4vijYLVEyn+CqFxApr7kvT9Jzn1uv7e
         oyROU+JhjRFxC5TJDiNKyTHgIgI6j46WiKCNa2l3qOflPlFhj07r0YgVoCl+f645V8mI
         jb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=wWPBwLy6R6/ATvy6h9wcQwkuNb53sEBCgzAyUoSibp0=;
        fh=Zb2kcfsRNwOyZCFsdnJ9ji6Ko91sfAa5DXFIGHnC+qw=;
        b=THvBypOe5E9d3z5Vyyin8fS01+TRQCKV2sgPNeLwFFZYErF6Z/nzyqxNCyuGvT6qnq
         RTGM31Z0Tf8rO1G2vyoGOVRHrp0fLKkJ1DOMBAlohKox0+F4AQpakF1wNnOHk7bxopeI
         uFdnqIRuXYxhbrd+dudvgDi1+XVs22uL3pOgIeddoxAX2o9lCDUT+gNdjLvOZ28sWPx/
         P6VbJTmDrqKfHkpH/4/wX5gWGr830kHAboopJVD7VdNGhWRs/w4yKSX6g2qr69PDA9HO
         vETnClZaIRYi9PzpAJb/7N1R7UW6ujY9wVWwnHRIPXPhsw7S5jlPPukjvDbXF1mj+QMY
         88lQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O0tvGjiu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1b9ecbsi19401291cf.247.2025.01.30.08.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 08:30:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O0tvGjiu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tdXQe-00015V-BY; Thu, 30 Jan 2025 11:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tdXQZ-00012M-E0
 for qemu-devel@nongnu.org; Thu, 30 Jan 2025 11:30:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tdXQU-0003aX-Vn
 for qemu-devel@nongnu.org; Thu, 30 Jan 2025 11:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738254597;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wWPBwLy6R6/ATvy6h9wcQwkuNb53sEBCgzAyUoSibp0=;
 b=O0tvGjiuv6+X9P+gO5E6ECN+Qheib5s4HRoSzUrwcEQ8a3vYa0vhCXUKwI+vuR0MLX89Wp
 uayfneNz4RdI1XAck8QcIRl3KYZC8eTvTAkXY9mb9SmWnkLuHYwbpmR/PkMf/1BJHhGfJJ
 cmWU3Jf0p3m+/lqYyMVnJW4toUj/8Cs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-NmxFP1Q9PTqhYwWfZhobjQ-1; Thu,
 30 Jan 2025 11:29:54 -0500
X-MC-Unique: NmxFP1Q9PTqhYwWfZhobjQ-1
X-Mimecast-MFC-AGG-ID: NmxFP1Q9PTqhYwWfZhobjQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 16DA31800361; Thu, 30 Jan 2025 16:29:52 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.184])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8D8FB1956094; Thu, 30 Jan 2025 16:29:47 +0000 (UTC)
Date: Thu, 30 Jan 2025 16:29:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org
Subject: Re: [RFC PATCH 3/5] hw/arm/smmuv3: Associate a pci bus with a SMMUv3
 Nested device
Message-ID: <Z5uo9y6MppYQctW3@redhat.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241108125242.60136-4-shameerali.kolothum.thodi@huawei.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PZ8h2tKfiFmx

On Fri, Nov 08, 2024 at 12:52:40PM +0000, Shameer Kolothum via wrote:
> Subsequent patches will add IORT modifications to get this working.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3.c         | 27 +++++++++++++++++++++++++++
>  include/hw/arm/smmuv3.h |  2 ++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 0033eb8125..9b0a776769 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -24,6 +24,7 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
> +#include "hw/pci/pci_bridge.h"
>  #include "cpu.h"
>  #include "trace.h"
>  #include "qemu/log.h"
> @@ -2201,12 +2202,32 @@ static void smmu_realize(DeviceState *d, Error **errp)
>      smmu_init_irq(s, dev);
>  }
>  
> +static int smmuv3_nested_pci_host_bridge(Object *obj, void *opaque)
> +{
> +    DeviceState *d = opaque;
> +    SMMUv3NestedState *s_nested = ARM_SMMUV3_NESTED(d);
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +        if (s_nested->pci_bus && !strcmp(bus->qbus.name, s_nested->pci_bus)) {
> +            object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
> +                                     &error_abort);

Is the SMMUv3Nested useful if no 'primary-bus' is set ? 

If not, then the 'realize' method ought to validate 'pci-bus' is not
NULL and and raise an error if NULL.

After object_child_foreach_recursive returns, 'realize' should
also validate that 'primary-bus' has been set, and raise an error
it not set, to detect typos in the 'pci-bus' property.

> +        }
> +    }
> +    return 0;
> +}
> +
>  static void smmu_nested_realize(DeviceState *d, Error **errp)
>  {
>      SMMUv3NestedState *s_nested = ARM_SMMUV3_NESTED(d);
>      SMMUv3NestedClass *c = ARM_SMMUV3_NESTED_GET_CLASS(s_nested);
> +    SysBusDevice *dev = SYS_BUS_DEVICE(d);
>      Error *local_err = NULL;
>  
> +    object_child_foreach_recursive(object_get_root(),
> +                                   smmuv3_nested_pci_host_bridge, d);
> +    object_property_set_bool(OBJECT(dev), "nested", true, &error_abort);
> +
>      c->parent_realize(d, &local_err);
>      if (local_err) {
>          error_propagate(errp, local_err);
> @@ -2293,6 +2314,11 @@ static Property smmuv3_properties[] = {
>      DEFINE_PROP_END_OF_LIST()
>  };
>  
> +static Property smmuv3_nested_properties[] = {
> +    DEFINE_PROP_STRING("pci-bus", SMMUv3NestedState, pci_bus),
> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void smmuv3_instance_init(Object *obj)
>  {
>      /* Nothing much to do here as of now */
> @@ -2320,6 +2346,7 @@ static void smmuv3_nested_class_init(ObjectClass *klass, void *data)
>      dc->vmsd = &vmstate_smmuv3;
>      device_class_set_parent_realize(dc, smmu_nested_realize,
>                                      &c->parent_realize);
> +    device_class_set_props(dc, smmuv3_nested_properties);
>      dc->user_creatable = true;
>      dc->hotpluggable = false;
>  }
> diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
> index 87e628be7a..96513fce56 100644
> --- a/include/hw/arm/smmuv3.h
> +++ b/include/hw/arm/smmuv3.h
> @@ -89,6 +89,8 @@ OBJECT_DECLARE_TYPE(SMMUv3NestedState, SMMUv3NestedClass, ARM_SMMUV3_NESTED)
>  
>  struct SMMUv3NestedState {
>      SMMUv3State smmuv3_state;
> +
> +    char *pci_bus;
>  };
>  
>  struct SMMUv3NestedClass {
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

