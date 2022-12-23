Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp372087ejb;
        Fri, 23 Dec 2022 04:31:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsHF/7ZSMp9mTz4GOiQFX4CQ65YqMDuH3bU3QZRKC4HUqN1WGDdwZGvN7hKnmCLjRJm0QMk
X-Received: by 2002:ac8:5443:0:b0:3a8:16a7:6968 with SMTP id d3-20020ac85443000000b003a816a76968mr10456191qtq.46.1671798667589;
        Fri, 23 Dec 2022 04:31:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671798667; cv=none;
        d=google.com; s=arc-20160816;
        b=0pPz1yOPa4SoJNW18HmgdDSFn936Nc/Ea53/QW6SMb428uRUxdPf34C5QwyEun0sd1
         U+dLkVqBFPw4d/xfyecXgZNLxzvJHJVcNSyztIfEGkDAqWo8QRJmxSahz9Fc7l2KGI0d
         +ULaRUbzo2LbNzZvQGubPCQ05QqTj+nuXgOAFF95K6wLAPVwj+2V1/Se9UMNL44SCKiq
         bazRQfp4VTfMzflzfgl0NV1il82ojPfQaaUzGuUKU8Hfp2B5RgHKzpSDPtOyEVBnIuQg
         oP1XFQtGZX+rpyHvk5oD8lvoBdsHzkALGmfn2CeK0aDHY4EZ1vJI1BTkSm62bP5C63T0
         Rk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=uJ+JkTKmyQENgA8B9rWW0fE13kZvic9jKdEKXuw3tWQ=;
        b=tcQd6fQjU+OKMcHdt84zSj6xgZ2olUXeSSMNqIS2MuNknNiFVT25+ctuOiGzpNozPM
         g/M/xujt9jpfVemsaCqg/ORvDYL2cXTBQ34Rv2H6PVwq8QXd7qx6uJEEw6SRaeui7dSx
         ohFf3MuPxY/NJjRwVqoGBOeN4L2BPUQNseGL6ggUk0Nf7u5+KZWdkvxTXydeCSFLC3RZ
         B3Ac94UbJ131jJdwvb2+JfnSHqqqCZHNMIq4vZaUtfMdRao5edKHe2JOdKhKqDwtla9Q
         02aAy10BjYBiNWEZfa6hge6C3a76jj3PK+XvWve6ZHTb0a1pARidF2mL1BS4m9n+21DR
         s1bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PyCOV05z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x188-20020a3795c5000000b006ff0211b876si1059872qkd.158.2022.12.23.04.31.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Dec 2022 04:31:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PyCOV05z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p8hCE-00026D-Ow; Fri, 23 Dec 2022 07:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p8hCC-00025g-89
 for qemu-arm@nongnu.org; Fri, 23 Dec 2022 07:30:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1p8hCA-0003Pc-IP
 for qemu-arm@nongnu.org; Fri, 23 Dec 2022 07:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671798636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uJ+JkTKmyQENgA8B9rWW0fE13kZvic9jKdEKXuw3tWQ=;
 b=PyCOV05zyjxlBqT8xwRKFtVliDhoSEd5fuBqODYRLZ50+m+fvHWshw5o4Dtw0NTMR+ocHp
 R2H0KA8rMTJ7W8ZwDsVOV27st8qL6ND8xiBGLrBGFJFCHzO2r1mD20xX7RFbATqB6xr9aU
 jSx/LKEibKLcVdZWO2ABnAm7+MP6PJ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-SLVEbZcEONOLgdp1rZNe4w-1; Fri, 23 Dec 2022 07:30:30 -0500
X-MC-Unique: SLVEbZcEONOLgdp1rZNe4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 896A31875041;
 Fri, 23 Dec 2022 12:30:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BCFAC15BA0;
 Fri, 23 Dec 2022 12:30:28 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, Zenghui
 Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 1/2] hw/arm/virt: Consolidate GIC finalize logic
In-Reply-To: <20221223090107.98888-2-agraf@csgraf.de>
Organization: Red Hat GmbH
References: <20221223090107.98888-1-agraf@csgraf.de>
 <20221223090107.98888-2-agraf@csgraf.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 23 Dec 2022 13:30:27 +0100
Message-ID: <87mt7expy4.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-TUID: SLnMBElssz1S

On Fri, Dec 23 2022, Alexander Graf <agraf@csgraf.de> wrote:

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
>   - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
>
> v2 -> v3:
>
>   - Fix comment
>   - Flip kvm-enabled logic for host around
> ---
>  hw/arm/virt.c         | 198 ++++++++++++++++++++++--------------------
>  include/hw/arm/virt.h |  15 ++--
>  2 files changed, 112 insertions(+), 101 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ea2413a0ba..6d27f044fe 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1820,6 +1820,84 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
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
> +        if (!kvm_enabled()) {
> +            error_report("gic-version=host requires KVM");
> +            exit(1);
> +        }
> +
> +        /* For KVM, gic-version=host means gic-version=max */
> +        return finalize_gic_version_do(accel_name, VIRT_GIC_VERSION_MAX,
> +                                       gics_supported, max_cpus);

I think I'd still rather use /* fallthrough */ here, but let's leave
that decision to the maintainers.

In any case,

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

[As an aside, we have a QEMU_FALLTHROUGH #define that maps to
__attribute__((fallthrough)) if available, but unlike the Linux kernel,
we didn't bother to convert everything to use it in QEMU. Should we?
Would using the attribute give us some extra benefits?]

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

