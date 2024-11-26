Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp17382njb;
        Tue, 26 Nov 2024 04:37:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWI+9/t9Xz3hTTDs81WN050ksbNTCJX4jWRXqJVn0PFwaNwcVZbdWlHfsJ8+WvjLXI0uRAvDJ8moSJfyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEWAHvKfl4OPzp3ht3Rxk1s55DLAxoDLn9gIo4tEDTYI+7s/WosZ3YJsuZ2V9h35+Zt45+8
X-Received: by 2002:a05:6359:4c20:b0:1c3:7415:693d with SMTP id e5c5f4694b2df-1ca7970df22mr794550255d.5.1732624632103;
        Tue, 26 Nov 2024 04:37:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732624632; cv=none;
        d=google.com; s=arc-20240605;
        b=Eqw+eOS02PJxj6sIDsiVBMu5puiZq8q5zGCLJrgJONzHi1SnIWWNpC1RHNml+E1udw
         L/nlWHVC2HUZWkUCcjduhc+8lyiIY6CqhhDr/VTmQcM7BOVEd9Aglym2H13lD2E8RIy+
         9kCRy5/5gMd43tI6+CKmw5PMQNeF/IUNe9Mv3TJ59W1py/xIg5ZGja1cVHEeLQYAaZ4y
         IEn0OC+xY3Xj9FbyPiatIiQyDXWvHSMqDthq13+PbRq2QQuaVFOcE30j7+IsjlAEJVnp
         6lPZvu80oY/chJQGGWlTjt4uU6p29rx3KKSKuZC0gv1kYtsVpxOodJRuY7Snvhf81ZPQ
         V6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=BXHJH1NFPr5BUMazKPvhlxdfocMk4iwpK5En4hIA2Gs=;
        fh=viLdcSkNm7Zsj4J/NO8HxLslwwy/Qn1SnyFRM80HHTs=;
        b=WHhC8sUTqo4f2w1gzEX/K2TmHLLOiyWpcfWHV7Gnrw+ahMEummkab4IqETydvHbEfD
         /OSH9Q9xpDvZTvmbrSnn8MEsOykRYtAtKf16PbeuR7lIv2iOtcnq3/b25i0P1oCvgazN
         chAPcfHQ9wcWJ1TVOJZSXsxDdvqwK5/+o2NGw0a53CXwA52Lbv+M/JOeN/ZoqV1HuDdp
         A4CiJsTMzZLN/nvEpdOpXBW0Cc3XVDB3N4VL5f8GIqT67lvpUpvUooMj987cU29ES1Fq
         MndX3X36PnxKOyPw5SztJUEPsDJZ8WS1Zezz6eAv7SUNYEidkvtbKzaZ7Y0nOAZSNezL
         rsAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c1AsLIUI;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af3592d4fcsi648219137.591.2024.11.26.04.37.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:37:12 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c1AsLIUI;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732624631;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXHJH1NFPr5BUMazKPvhlxdfocMk4iwpK5En4hIA2Gs=;
	b=c1AsLIUIUaPMoTg/S5x9+5hvHh2lUNz/yoL/iqYwB7V+YQRtqa/6BR7Cyz/1xTMGywt1a0
	wU+A6TbhOsUyKI2vwloZKSQCn7/xQOKJb9vW/QS4eEXApX+Ar/QbQW9U3xgka7CisCm1Rg
	ezfj8RjEt/lLKXgrP8OOnR5o/45+hRQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17--urY9HtHN7aHLAB5bg19-A-1; Tue,
 26 Nov 2024 07:37:10 -0500
X-MC-Unique: -urY9HtHN7aHLAB5bg19-A-1
X-Mimecast-MFC-AGG-ID: -urY9HtHN7aHLAB5bg19-A
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D1BF41956088;
	Tue, 26 Nov 2024 12:37:08 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.147])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A74CF1955F40;
	Tue, 26 Nov 2024 12:37:05 +0000 (UTC)
Date: Tue, 26 Nov 2024 12:37:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 02/26] target/arm: Add confidential guest support
Message-ID: <Z0XA7tNaD3iFZ8uM@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-4-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125195626.856992-4-jean-philippe@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 1Sq427lHWuki

On Mon, Nov 25, 2024 at 07:56:01PM +0000, Jean-Philippe Brucker wrote:
> Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> support the Arm Realm Management Extension (RME). It is instantiated by
> passing on the command-line:
> 
>   -M virt,confidential-guest-support=<id>
>   -object rme-guest,id=<id>[,options...]
> 
> This is only the skeleton. Support will be added in following patches.
> 
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2->v3: remove some boilerplate with OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES
> ---
>  docs/system/confidential-guest-support.rst |  1 +
>  target/arm/kvm-rme.c                       | 40 ++++++++++++++++++++++
>  target/arm/meson.build                     |  7 +++-
>  3 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/kvm-rme.c
> 
> diff --git a/docs/system/confidential-guest-support.rst b/docs/system/confidential-guest-support.rst
> index 0c490dbda2..acf46d8856 100644
> --- a/docs/system/confidential-guest-support.rst
> +++ b/docs/system/confidential-guest-support.rst
> @@ -40,5 +40,6 @@ Currently supported confidential guest mechanisms are:
>  * AMD Secure Encrypted Virtualization (SEV) (see :doc:`i386/amd-memory-encryption`)
>  * POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
>  * s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
> +* Arm Realm Management Extension (RME)
>  
>  Other mechanisms may be supported in future.
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> new file mode 100644
> index 0000000000..67909349c1
> --- /dev/null
> +++ b/target/arm/kvm-rme.c
> @@ -0,0 +1,40 @@
> +/*
> + * QEMU Arm RME support
> + *
> + * Copyright Linaro 2024
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/confidential-guest-support.h"
> +#include "hw/boards.h"
> +#include "hw/core/cpu.h"
> +#include "kvm_arm.h"
> +#include "migration/blocker.h"
> +#include "qapi/error.h"
> +#include "qom/object_interfaces.h"
> +#include "sysemu/kvm.h"
> +#include "sysemu/runstate.h"
> +
> +#define TYPE_RME_GUEST "rme-guest"
> +OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> +
> +struct RmeGuest {
> +    ConfidentialGuestSupport parent_obj;
> +};
> +
> +OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
> +                                          CONFIDENTIAL_GUEST_SUPPORT,
> +                                          { TYPE_USER_CREATABLE }, { })
> +
> +static void rme_guest_class_init(ObjectClass *oc, void *data)
> +{
> +}
> +
> +static void rme_guest_init(Object *obj)
> +{
> +}
> +
> +static void rme_guest_finalize(Object *obj)
> +{
> +}

When you create a new "user creatable" object, there should also be a
corresponding addition to qapi/qom.json.

I believe you have the qom.json addition in a later patch, but it
should actually be here 


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
