Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4124641lfg;
        Thu, 27 Feb 2020 00:12:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKUxDZmQpTe0uNygdH9TBVMY6WbI/L/z43IZTrqaQftR9W7Jq2vZT839uzqTlh7eAf/H0f
X-Received: by 2002:a05:6214:b82:: with SMTP id fe2mr3649780qvb.35.1582791143733;
        Thu, 27 Feb 2020 00:12:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582791143; cv=none;
        d=google.com; s=arc-20160816;
        b=fX7Vf2gFv5wVqByYNHqevRERNxRMopGVYUVr/VqetiQz+pn6+WWGJz3aKaCt1WaEwj
         hbzhm3BRKKNt1M4f+ryVUSv7AAUEfI8z7vnUvKE1Rq1bqno3LFOtrhFsWfA0eADABq+s
         WhN/x9mKIXazmCubdPrudy5K6V9bOH2fIZUFmvU3Mt/bfDl+vuGS7jXeIuPCxIIiHzve
         KhzeOxxJuoGnjkRBxraIO+KVvX+KsBp+SaTG90VAjAtEKStOh5QpJxq+KIOQMJYWhGe1
         UHQHEXJutIRHlGLGzkD7SB0rdM83RQi7YwwQQg1L6sR2Cwr26ouyqIXOJKvhbjXxuJ+8
         OUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r658ia3hKmhLXCESVbop3fdvJTntt2g0Jkc99YfoFuA=;
        b=cSgmEG0KLPO06uSetPwNcTijYNP8kFQnbqZjZxdw3mWaiHqkOFciAlxw6WRBK6EUCI
         QThMJaHMYbnINu/fxX7NSE29hgo4iOYD3I17lp+KcEOVZCxoeucBBSOtZZD0wPMZa1c0
         CbVEz6nA0Dg0Q76DqZ1c3bpxEICoVsPclslFgKanaVAhbEG8gzIt3wEs8d9U5cNnhTbp
         MS8M8X2Q6vO0vY9YqAaTcu84gDXLjQKi+Na4bnUTVHGRGy3Ju5++oZHpL9mOR9/VtrUg
         KH608qmFbFKtCNb4nppUDCfQxQ8h+h1Q4++3rZssr/ZpZJJIhwDAL5TocrGfahnp/VvZ
         hIAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HQhaeIAE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si1038677qtr.340.2020.02.27.00.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 00:12:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HQhaeIAE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7EHP-000836-6e
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 03:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38358)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j7EHH-00082e-GR
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:12:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j7EHG-0004K6-6U
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:12:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31563
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j7EHG-0004Jq-23
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 03:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582791133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r658ia3hKmhLXCESVbop3fdvJTntt2g0Jkc99YfoFuA=;
 b=HQhaeIAENugK7Vz99N6rBQGs4Hyog37+b1GGMktfrCDOCbCmom/UwJayIiKnqBfC/Y6S8S
 QxJpMnpSioHUKZPuZxmz1k21dCDpv+p12rqI/YJVDgfY76oM36qbvyIEEblvkyENvMzzat
 /Cbz+fUWwTVXgjqvlmXvrfoEGbCQRcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-IDrerJNNNAe_6QgXFEHMug-1; Thu, 27 Feb 2020 03:12:09 -0500
X-MC-Unique: IDrerJNNNAe_6QgXFEHMug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2A04107ACC4;
 Thu, 27 Feb 2020 08:12:08 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD20B77945;
 Thu, 27 Feb 2020 08:12:06 +0000 (UTC)
Subject: Re: [RFC 2/2] hw/arm/virt: kvm: allow gicv3 by default if host does
 not support v2
To: Andrew Jones <drjones@redhat.com>
References: <20200226170500.17028-1-eric.auger@redhat.com>
 <20200226170500.17028-3-eric.auger@redhat.com>
 <20200226184218.g5id5lnhzowiicxf@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c590d9c7-9644-8b09-bed5-0b83c34503a7@redhat.com>
Date: Thu, 27 Feb 2020 09:12:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200226184218.g5id5lnhzowiicxf@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ahq71L+U2ol5

Hi Drew,

On 2/26/20 7:42 PM, Andrew Jones wrote:
> On Wed, Feb 26, 2020 at 06:05:00PM +0100, Eric Auger wrote:
>> At the moment if the end-user does not specify the gic-version along
>> with KVM acceleration, v2 is set by default. However most of the
>> systems now have GICv3 and sometimes they do not support GICv2
>> compatibility. In that case we end up with this error:
>>
>> qemu-system-aarch64: PMU: KVM_SET_DEVICE_ATTR: Invalid argument
>> qemu-system-aarch64: failed to set irq for PMU
>> and qemu aborts.
>>
>> This patch keeps the default v2 selection in all cases except
>> in the KVM accelerated mode when the host does not support v2.
>> This case did not work anyway so we do not break any compatibility.
>> Now we get v3 selected in such a case.
> 
>> Also if the end-user explicitly
>> sets v2 whereas this latter is not supported, we also are
>> informed that v2 is not selected by thos host instead of getting the
>> above PMU related message.
> 
> I would change the above to:
> 
> Also, if the end-user explicitly sets v2 and this is not supported by
> the host, then the user gets a more informative error message than
> the PMU invalid argument message above.

Sure
> 
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>  hw/arm/virt.c         | 30 ++++++++++++++++++++++++++++++
>>  include/hw/arm/virt.h |  1 +
>>  2 files changed, 31 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index a196bbf0d5..b37b0c40c1 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1554,6 +1554,33 @@ static void machvirt_init(MachineState *machine)
>>                  }
>>              }
>>          }
>> +    } else if (kvm_enabled()) {
>> +        int probe_bitmap = kvm_arm_vgic_probe();
>> +
>> +        if (!probe_bitmap) {
>> +            error_report(
>> +                "Unable to determine GIC version supported by host");
>> +            exit(1);
>> +        }
>> +        if (!vms->gic_version_user_selected) {
>> +            /*
>> +             * by default v2 is supposed to be chosen: check it is
>> +             * supported by the host. Otherwise take v3.
>> +             */
>> +            if (probe_bitmap & KVM_ARM_VGIC_V2) {
>> +                vms->gic_version = 2;
>> +            } else if (probe_bitmap & KVM_ARM_VGIC_V3) {
>> +                vms->gic_version = 3;
>> +            }
>> +        } else { /* user explicitly set the version to 2 or 3 */
>> +            if (vms->gic_version == 2 && !(probe_bitmap & KVM_ARM_VGIC_V2)) {
>> +                error_report("GICv2 is not supported by the host");
>> +                exit(1);
>> +            } else if (vms->gic_version == 3 && !(probe_bitmap & KVM_ARM_VGIC_V3)) {
>> +                error_report("GICv3 is not supported by the host");
>> +                exit(1);
>> +            }
>> +        }
>>      }
>>  
>>      if (!cpu_type_valid(machine->cpu_type)) {
>> @@ -1840,6 +1867,7 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>>  {
>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>>  
>> +    vms->gic_version_user_selected = true;
>>      if (!strcmp(value, "3")) {
>>          vms->gic_version = 3;
>>      } else if (!strcmp(value, "2")) {
>> @@ -1851,6 +1879,7 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>>      } else {
>>          error_setg(errp, "Invalid gic-version value");
>>          error_append_hint(errp, "Valid values are 3, 2, host, max.\n");
>> +        vms->gic_version_user_selected = false;
>>      }
>>  }
>>  
>> @@ -2103,6 +2132,7 @@ static void virt_instance_init(Object *obj)
>>                                      NULL);
>>      /* Default GIC type is v2 */
>>      vms->gic_version = 2;
>> +    vms->gic_version_user_selected = false;
>>      object_property_add_str(obj, "gic-version", virt_get_gic_version,
>>                          virt_set_gic_version, NULL);
>>      object_property_set_description(obj, "gic-version",
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 71508bf40c..e363cde452 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -124,6 +124,7 @@ typedef struct {
>>      bool its;
>>      bool virt;
>>      int32_t gic_version;
>> +    bool gic_version_user_selected;
>>      VirtIOMMUType iommu;
>>      struct arm_boot_info bootinfo;
>>      MemMapEntry *memmap;
>> -- 
>> 2.20.1
>>
>>
> 
> I just noticed that virt_get_gic_version() returns "2" if the user didn't
> explicitly request "3". I guess that hasn't been a problem for "max"
> and "host" because nobody is looking, at least not until after gic_version
> has been fully initialized. It is wrong though (for example, with TCG
> "max" should be "3", not "2").

That's correct indeed.

 Ideally virt_get_gic_version() would always
> return what will actually be used by the guest, but maybe pre-init it
> could return "max", "host", and "nosel" instead. We could then use the
> property value "nosel" in machvirt_init() to determine whether or not the
> user provided input, rather than adding gic_version_user_selected.

OK I will try to address that as well.

I also notice the property description for gic-version misses "max"

Thanks

Eric
> 
> Thanks,
> drew
> 
> 

