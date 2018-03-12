Received: by 10.28.91.67 with SMTP id p64csp865750wmb;
        Mon, 12 Mar 2018 08:02:20 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuTXJ3XYEHZKf7wlJy8QK0XsWadVXESuUUzHPzcWcMXg4x+CDxxBuFh3wfS0ZzBlE+VEOlF
X-Received: by 10.129.168.136 with SMTP id f130mr4766741ywh.136.1520866940449;
        Mon, 12 Mar 2018 08:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520866940; cv=none;
        d=google.com; s=arc-20160816;
        b=JFIIXtRpFxMZjVSkC3XQHN9K6wj4cHcjOp00xVqbtf/NqAzcmalU72n/GyMA/D+HUE
         8ymiYpNa2twPGW1HJwPcc2R1r2Xmrx0aevpl2x5vG8c5YKbij1+L0ufbauc6cQwEdLhV
         PQdUE5YH5ee3jsawf+/NvcJd8XRsQVkMw7aaejpmzpWualSiB5qMX/Oo4/N1gR76dwE+
         i82aslZE45c0UpeiMn2Kmm1xeCgHUJEW0DA19FE7yOSNNx/VSBLaCzCWhpAm+oniFYlW
         vYsQuGypTUPMOXyain+GywCpeXJwbZSBd8kQzQcdiM1frp4di2F7J+CqAFkhcQvCFTey
         qeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=93Rta076GdnaVmTPPOETu0qLHyYrQdViLsArNZpKRIQ=;
        b=XZnkQISQHGx1x+bBtbPj2SpLQugX3bsvyOmwZu8eRX+oqPbg7InV2+qjybErHyhTiz
         OFgtBhEw3449YQmpTqzAgkd1ea8n+zgNex5mz5V+zVxbCHW3zZdLoQDlT9bpB3K2ZsJ9
         lWIcgZf1mU+T4Z3Yu+sBmew1QdCsSAZrG3/bEMr7vx0yb8lLcrzMdKX6ACXF/AqpF8bu
         aojPouIVYceSUanQgfY6Fa/w7nsOgAYmgy3ioLtQ1HwPWh06PDEnF20+bANxkt+ei+x4
         fThsbbA2mUt6QT3d1ntlnW+qYfuQShJhWoBBfbs4ctEdRoiRKAsloubTzty2FLc9P+mO
         4F9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h131si580843ywh.444.2018.03.12.08.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 08:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evOxv-0004AK-OE
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 11:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evOxN-0003sI-Mm
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1evOxL-0001pv-D1
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 11:01:45 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52440 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1evOxL-0001pU-7x; Mon, 12 Mar 2018 11:01:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A579C401C9AE;
	Mon, 12 Mar 2018 15:01:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07E5994585;
	Mon, 12 Mar 2018 15:01:35 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-15-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-d_nL7Bw5FWwSEviGJwWijqYo3a8o_oPwBy2-Aw9U4zg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <422530b3-44b4-5d47-fb70-1f5693569925@redhat.com>
Date: Mon, 12 Mar 2018 16:01:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-d_nL7Bw5FWwSEviGJwWijqYo3a8o_oPwBy2-Aw9U4zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 12 Mar 2018 15:01:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 12 Mar 2018 15:01:42 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 14/14] hw/arm/virt: Handle iommu in 2.12
 machine type
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yj+yCDVDy3ZQ

Hi Peter,

On 12/03/18 13:56, Peter Maydell wrote:
> On 17 February 2018 at 18:46, Eric Auger <eric.auger@redhat.com> wrote:
>> The new machine type exposes a new "iommu" virt machine option.
>> The SMMUv3 IOMMU is instantiated using -machine virt,iommu=smmuv3.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v7 -> v8:
>> - Revert to machine option, now dubbed "iommu", preparing for virtio
>>   instantiation.
>>
>> v5 -> v6: machine 2_11
>>
>> Another alternative would be to use the -device option as
>> done on x86. As the smmu is a sysbus device, we would need to
>> use the platform bus framework.
>> ---
>>  hw/arm/virt.c         | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/arm/virt.h |  1 +
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index e9dca0d..607c7e1 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1547,6 +1547,34 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>>      }
>>  }
>>
>> +static char *virt_get_iommu(Object *obj, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    switch (vms->iommu) {
>> +    case VIRT_IOMMU_NONE:
>> +        return g_strdup("none");
>> +    case VIRT_IOMMU_SMMUV3:
>> +        return g_strdup("smmuv3");
>> +    default:
>> +        return g_strdup("none");
> 
> Isn't this a "can't happen" case? If so, g_assert_not_reached().
yes, done
> 
>> +    }
>> +}
>> +
>> +static void virt_set_iommu(Object *obj, const char *value, Error **errp)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>> +
>> +    if (!strcmp(value, "smmuv3")) {
>> +        vms->iommu = VIRT_IOMMU_SMMUV3;
>> +    } else if (!strcmp(value, "none")) {
>> +        vms->iommu = VIRT_IOMMU_NONE;
>> +    } else {
>> +        error_setg(errp, "Invalid iommu value");
>> +        error_append_hint(errp, "Valid value are none, smmuv3\n");
> 
> "Valid values are", and add trailing "." to the hint string (matches
> virt_set_gic_version() phrasing.)
OK
> 
>> +    }
>> +}
>> +
>>  static CpuInstanceProperties
>>  virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>  {
>> @@ -1679,6 +1707,19 @@ static void virt_2_12_instance_init(Object *obj)
>>                                          NULL);
>>      }
>>
>> +    if (vmc->no_iommu) {
>> +        vms->iommu = VIRT_IOMMU_NONE;
>> +    } else {
>> +        /* Default disallows smmu instantiation */
>> +        vms->iommu = VIRT_IOMMU_NONE;
> 
> If the default is "none" then you don't need the no_iommu field
> in the VirtMachineClass. You can just have the property exist
> on all virt machines, the way we do for "secure" and "virtualization".
> It's only if we want to have the default for newer virt-n.nn versions
> be something other than what the older machines had that we need to
> have the VirtMachineClass field that lets us distinguish the older
> and newer machine types.
OK

Thanks

Eric
> 
>> +        object_property_add_str(obj, "iommu", virt_get_iommu,
>> +                                 virt_set_iommu, NULL);
>> +        object_property_set_description(obj, "iommu",
>> +                                        "Set the IOMMU model among "
>> +                                        "none, smmuv3 (default none)",
>> +                                        NULL);
>> +    }
>> +
>>      vms->memmap = a15memmap;
>>      vms->irqmap = a15irqmap;
>>  }
>> @@ -1698,8 +1739,12 @@ static void virt_2_11_instance_init(Object *obj)
>>
>>  static void virt_machine_2_11_options(MachineClass *mc)
>>  {
>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>> +
>>      virt_machine_2_12_options(mc);
>>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
>> +
>> +    vmc->no_iommu = true;
>>  }
>>  DEFINE_VIRT_MACHINE(2, 11)
>>
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 13d3724..3a92fc3 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -92,6 +92,7 @@ typedef struct {
>>      bool disallow_affinity_adjustment;
>>      bool no_its;
>>      bool no_pmu;
>> +    bool no_iommu;
>>      bool claim_edge_triggered_timers;
>>  } VirtMachineClass;
>>
>> --
>> 2.5.5
>>
> 
> thanks
> -- PMM
> 
