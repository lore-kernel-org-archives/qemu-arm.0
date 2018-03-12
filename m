Received: by 10.28.91.67 with SMTP id p64csp729168wmb;
        Mon, 12 Mar 2018 05:58:31 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuzT1AtPjNpTZ034efmGJNTprs9le3xeJgfx9gPMYMc0i8oiH1g2kdeSXdIvN5QY9sNB3M5
X-Received: by 2002:a25:d4c:: with SMTP id 73-v6mr4479870ybn.80.1520859510943;
        Mon, 12 Mar 2018 05:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520859510; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgLBw4TPgGwd/P+dmqROOB7Z1HK4ohrNTkpl3FpRgY1YNK0Z3GqB8rDVUWEMRmKoja
         gqHxhNYaNBoLEyJorRUKAuBIPgRayBAnrY7xYO6etw+yoQKvmkv+Hp0hrnxfgvoShZ0/
         WpRAFXUkHcyesMNWyl/5fy/A5Xce42DmjuA7/P1kpND6cWHWGEjDhy50cbzzDc/ESGcR
         5WHOx9EW2WJPdiJuEsjCOVBAnAJwY6Gb/70jq00uIEuoobTcZ6bAX474cHHpe1N8XKwJ
         4maJgrOomLYabRZsJA7KaF2re2u3q7dwBSXenPb0DVz+cDCzMfVbukTiLUNibTNHPT8s
         Oe4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SKm4WatO/VI8uHSESsSSHtDqPYQzjp14mSBzAGxIeB0=;
        b=m+9GV4Vpg/0vFJFxvscVJF4iXC/VqM0TwrFwNB4fbcv62aBF/M7mwTnV8iqyd3yex1
         P7MLddaj/Gwj9Azu3cS1ipFrLd0L6Rp3PIlkPNuig2eJiqcSjGO3hItLK0Dufvhiss4P
         DjlKJFu7BEbB0hhqHMucUjVLZQwDXM+ZeE3UynkDQDgubV2oYdCxO9acUMjfmWWUVG7O
         A82hDZ0Db4wg7rx9+hgT94PGggs6r9WiBGwu9u3XPKpB71YLCx9VcZ5TTeXqe6TpVln5
         58e/Yiex98HoxsA5YMfpPzgqz8LkGMf1dovzxhVuK9KfOlRTrYM01knRXiSyeCkUUPTk
         pXew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R3JPhjEk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w129si1261904ywd.258.2018.03.12.05.58.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 05:58:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R3JPhjEk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evN26-0004G3-CT
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 08:58:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evN06-0002sM-U0
	for qemu-devel@nongnu.org; Mon, 12 Mar 2018 08:56:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evN05-0002QQ-SE
	for qemu-devel@nongnu.org; Mon, 12 Mar 2018 08:56:26 -0400
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233]:33981)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evN05-0002PY-Mn
	for qemu-devel@nongnu.org; Mon, 12 Mar 2018 08:56:25 -0400
Received: by mail-oi0-x233.google.com with SMTP id c83so12203086oib.1
	for <qemu-devel@nongnu.org>; Mon, 12 Mar 2018 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SKm4WatO/VI8uHSESsSSHtDqPYQzjp14mSBzAGxIeB0=;
	b=R3JPhjEkvpdGKsY3WdhZQ+uAF6gjtTRAIDTOsQcQXEW1nLDHtvwaPN46eDiZfgtA25
	WQdBuVIlnagOiNB//vdRikjjh1d8lyLjopVymzXr/2V2zWqwmTh2B+w2JmHA3KPBsMFr
	Ykbly6Eg1mOqEscPVS1/Mb7xRCTUxpo/rvLEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SKm4WatO/VI8uHSESsSSHtDqPYQzjp14mSBzAGxIeB0=;
	b=q6LuDmOJbr4DW4HtJWjMPzwD5isM5xKPwCWsAviaKtKsDCq1kWfv1hm0pbwO2EIQIe
	jTjcjg/GcnqBwJlT5dr8gLbOSwYzAL17LP/hppxDjdcazdRm/cZ7ri3wIMY02paCgDnP
	Oif2HJYc8ImvlD/F/AgxA7pQoqdFebyCUPCADntcWJVvmklc5oUKq5sdilfdRHHG2qqg
	xk69fIkxQOBzM7M2uJx8JMWlFCeDpOn8Jt/LccNYotQzTPf7mwGcsfe0RJ+LCUAoMvUe
	f117wCChTwnYz45iWVF5gxU/Cnm35TlDmuUK5kI/8PXyrLBQyOTcAJ77JxWpj490JVeT
	dkwg==
X-Gm-Message-State: AElRT7FBTeZvlTRJqfxVRYIY2GKGhm9ohKAQsRjfbpzWffOJPlOlW73g
	67YI2FbMlP7ENcen2KBf4a7d/U8JEHzMKGZ+owGHqQ==
X-Received: by 10.202.97.87 with SMTP id v84mr4979025oib.12.1520859384817;
	Mon, 12 Mar 2018 05:56:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 05:56:04
	-0700 (PDT)
In-Reply-To: <1518893216-9983-15-git-send-email-eric.auger@redhat.com>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-15-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Mar 2018 12:56:04 +0000
Message-ID: <CAFEAcA-d_nL7Bw5FWwSEviGJwWijqYo3a8o_oPwBy2-Aw9U4zg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::233
Subject: Re: [Qemu-devel] [PATCH v9 14/14] hw/arm/virt: Handle iommu in 2.12
 machine type
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 22YYOusQvUv7

On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
> The new machine type exposes a new "iommu" virt machine option.
> The SMMUv3 IOMMU is instantiated using -machine virt,iommu=smmuv3.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
> v7 -> v8:
> - Revert to machine option, now dubbed "iommu", preparing for virtio
>   instantiation.
>
> v5 -> v6: machine 2_11
>
> Another alternative would be to use the -device option as
> done on x86. As the smmu is a sysbus device, we would need to
> use the platform bus framework.
> ---
>  hw/arm/virt.c         | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 46 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index e9dca0d..607c7e1 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1547,6 +1547,34 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>      }
>  }
>
> +static char *virt_get_iommu(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    switch (vms->iommu) {
> +    case VIRT_IOMMU_NONE:
> +        return g_strdup("none");
> +    case VIRT_IOMMU_SMMUV3:
> +        return g_strdup("smmuv3");
> +    default:
> +        return g_strdup("none");

Isn't this a "can't happen" case? If so, g_assert_not_reached().

> +    }
> +}
> +
> +static void virt_set_iommu(Object *obj, const char *value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    if (!strcmp(value, "smmuv3")) {
> +        vms->iommu = VIRT_IOMMU_SMMUV3;
> +    } else if (!strcmp(value, "none")) {
> +        vms->iommu = VIRT_IOMMU_NONE;
> +    } else {
> +        error_setg(errp, "Invalid iommu value");
> +        error_append_hint(errp, "Valid value are none, smmuv3\n");

"Valid values are", and add trailing "." to the hint string (matches
virt_set_gic_version() phrasing.)

> +    }
> +}
> +
>  static CpuInstanceProperties
>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>  {
> @@ -1679,6 +1707,19 @@ static void virt_2_12_instance_init(Object *obj)
>                                          NULL);
>      }
>
> +    if (vmc->no_iommu) {
> +        vms->iommu = VIRT_IOMMU_NONE;
> +    } else {
> +        /* Default disallows smmu instantiation */
> +        vms->iommu = VIRT_IOMMU_NONE;

If the default is "none" then you don't need the no_iommu field
in the VirtMachineClass. You can just have the property exist
on all virt machines, the way we do for "secure" and "virtualization".
It's only if we want to have the default for newer virt-n.nn versions
be something other than what the older machines had that we need to
have the VirtMachineClass field that lets us distinguish the older
and newer machine types.

> +        object_property_add_str(obj, "iommu", virt_get_iommu,
> +                                 virt_set_iommu, NULL);
> +        object_property_set_description(obj, "iommu",
> +                                        "Set the IOMMU model among "
> +                                        "none, smmuv3 (default none)",
> +                                        NULL);
> +    }
> +
>      vms->memmap = a15memmap;
>      vms->irqmap = a15irqmap;
>  }
> @@ -1698,8 +1739,12 @@ static void virt_2_11_instance_init(Object *obj)
>
>  static void virt_machine_2_11_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_2_12_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
> +
> +    vmc->no_iommu = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 11)
>
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 13d3724..3a92fc3 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -92,6 +92,7 @@ typedef struct {
>      bool disallow_affinity_adjustment;
>      bool no_its;
>      bool no_pmu;
> +    bool no_iommu;
>      bool claim_edge_triggered_timers;
>  } VirtMachineClass;
>
> --
> 2.5.5
>

thanks
-- PMM
