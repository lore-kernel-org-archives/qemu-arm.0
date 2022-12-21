Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5241704ejb;
        Wed, 21 Dec 2022 07:26:00 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvlZ/TS1tsdeM8TOqHdiGXTu2piiVyrhPnNv+cDK0Nyhk/v/f1gocjDGJSZ5MGTBWz5wbFu
X-Received: by 2002:ac8:546:0:b0:3a9:9218:e110 with SMTP id c6-20020ac80546000000b003a99218e110mr2624178qth.37.1671636360684;
        Wed, 21 Dec 2022 07:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671636360; cv=none;
        d=google.com; s=arc-20160816;
        b=vORLnTVppXWotiKW6tetsttA51RPze4cknL6dsm2g1wAp+dVYjydMMfNKYlhFZdN4H
         73FFZXef/flWSeVQbtRKpfZ5S08ZRbV+Lssg3XZrbjeyZf4dKlnnWCAdZGKliQv7aPyC
         yqdKhko7eadUs1FwssIaLxXAhNXPgpOKM1pLhtHqebrxAAT2AUr/rudw0ZdZc5CtihZu
         0PoJHaYqoQ1UXNnRfy7igLXNccKovXv4kmLbPoIMUl5huP3nEkJjJj6rHN2NBjoDFV+H
         t9/j63d24oI0+2CObxnlOkSJiY3bONaSuuGUZJqMsVoEzpHn8P9NEiXtlLKChIuR8pTQ
         M5Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=FKLQ4CL2Fnag1jLCS7V20VA6ivmCcPLGba3CUbYo2QE=;
        b=gvTuLVJeQrQvApCP6oRACwJUS2pqTlr6B2XvPW1EO09R4pGV5oBYqCJz7hH4iUTQUy
         XqiQrzYREXXEIbvEiOV3d8PY4XLCobSvN+VjhjpeUKkdPqs51J+Vow2jY8yWsorqBh8n
         RkjocaeAb8K4ElB77qKDLbXUA0OImkByYh8dwaAjol2h5d7AKWcV9ap9YZMUQLO3MNyK
         iwM6cdaVk7IdBhJ40JWxTgiimJO+Tz5n75Whn7gOZ8gEQIockDvYJ8mlvLW9ft9c6mco
         Lal6/s71ByTTOcdyzaa6t3NgTbF4/y+FbEhhnrpua2tDz4a/7ie8xSHk3t5qgDQRsg/v
         R6jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VPsDVvDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do54-20020a05620a2b3600b006eee7be528esi6349996qkb.561.2022.12.21.07.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 07:26:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VPsDVvDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p80yd-0005OQ-Gz; Wed, 21 Dec 2022 10:25:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p80yc-0005OC-8a
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 10:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p80ya-00073F-Hw
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 10:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671636347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FKLQ4CL2Fnag1jLCS7V20VA6ivmCcPLGba3CUbYo2QE=;
 b=VPsDVvDlg/L5fr9UNJ1Heabjb7s19p1sEHIggXPaay4vcKYPdlQR80bOqn75yKjkrXswv4
 aQRRhWvwGoYz1VIkLcIT9gnA1i3oI/Mq8T04pNMd0VYE+/ploMPj6B8dJZ+0z0nQGtQJcI
 Ii1fVpbrHJXPMtwE2MfPwDsMecC8vP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-xXCP9yv2NmGgggGoLqaIkw-1; Wed, 21 Dec 2022 10:25:42 -0500
X-MC-Unique: xXCP9yv2NmGgggGoLqaIkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13E0118A64E0;
 Wed, 21 Dec 2022 15:25:42 +0000 (UTC)
Received: from localhost (unknown [10.22.32.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A01E8400D79E;
 Wed, 21 Dec 2022 15:25:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Zenghui
 Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 1/2] hw/arm/virt: Consolidate GIC finalize logic
In-Reply-To: <20221221092850.61332-2-agraf@csgraf.de>
Organization: Red Hat GmbH
References: <20221221092850.61332-1-agraf@csgraf.de>
 <20221221092850.61332-2-agraf@csgraf.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 21 Dec 2022 16:25:39 +0100
Message-ID: <87o7rw6aoc.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UzqMdUk+SwRV

On Wed, Dec 21 2022, Alexander Graf <agraf@csgraf.de> wrote:

> Up to now, the finalize_gic_version() code open coded what is essentially
> a support bitmap match between host/emulation environment and desired
> target GIC type.
>
> This open coding leads to undesirable side effects. For example, a VM with
> KVM and -smp 10 will automatically choose GICv3 while the same command
> line with TCG will stay on GICv2 and fail the launch.
>
> This patch combines the TCG and KVM matching code paths by making
> everything a 2 pass process. First, we determine which GIC versions the
> current environment is able to support, then we go through a single
> state machine to determine which target GIC mode that means for us.
>
> After this patch, the only user noticable changes should be consolidated
> error messages as well as TCG -M virt supporting -smp > 8 automatically.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v1 -> v2:
>
>   - leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
> ---
>  hw/arm/virt.c         | 199 ++++++++++++++++++++++--------------------
>  include/hw/arm/virt.h |  15 ++--
>  2 files changed, 113 insertions(+), 101 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 04eb6c201d..7b54387958 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1820,6 +1820,85 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
>      }
>  }
>  
> +static VirtGICType finalize_gic_version_do(const char *accel_name,
> +                                           VirtGICType gic_version,
> +                                           int gics_supported,
> +                                           unsigned int max_cpus)
> +{
> +    /* Convert host/max/nosel to GIC version number */
> +    switch (gic_version) {
> +    case VIRT_GIC_VERSION_HOST:
> +        if (kvm_enabled()) {
> +            /* For KVM, -cpu host means -cpu max */

That should rather be "gic-version" instead of "cpu", I guess?

> +            return finalize_gic_version_do(accel_name, VIRT_GIC_VERSION_MAX,
> +                                           gics_supported, max_cpus);
> +        }
> +
> +        error_report("gic-version=host requires KVM");
> +        exit(1);
> +        break;

I wonder whether reporting an error for !kvm_enabled() and falling
through would be more readable.

...although all of this is already more readable than before :)

> +    case VIRT_GIC_VERSION_MAX:
> +        if (gics_supported & VIRT_GIC_VERSION_4_MASK) {
> +            gic_version = VIRT_GIC_VERSION_4;
> +        } else if (gics_supported & VIRT_GIC_VERSION_3_MASK) {
> +            gic_version = VIRT_GIC_VERSION_3;
> +        } else {
> +            gic_version = VIRT_GIC_VERSION_2;
> +        }
> +        break;
> +    case VIRT_GIC_VERSION_NOSEL:
> +        if ((gics_supported & VIRT_GIC_VERSION_2_MASK) &&
> +            max_cpus <= GIC_NCPU) {
> +            gic_version = VIRT_GIC_VERSION_2;
> +        } else if (gics_supported & VIRT_GIC_VERSION_3_MASK) {
> +            /*
> +             * in case the host does not support v2 emulation or
> +             * the end-user requested more than 8 VCPUs we now default
> +             * to v3. In any case defaulting to v2 would be broken.
> +             */
> +            gic_version = VIRT_GIC_VERSION_3;
> +        } else if (max_cpus > GIC_NCPU) {
> +            error_report("%s only supports GICv2 emulation but more than 8 "
> +                         "vcpus are requested", accel_name);
> +            exit(1);
> +        }
> +        break;
> +    case VIRT_GIC_VERSION_2:
> +    case VIRT_GIC_VERSION_3:
> +    case VIRT_GIC_VERSION_4:
> +        break;
> +    }

