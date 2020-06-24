Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp225065lfm;
        Wed, 24 Jun 2020 01:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKz4X7AUcc6H6mSUkmMU7n1MWq9JL4aVLx4KarJKJ22XwJH0yOuozaMkfQpF8YOOhwKZaP
X-Received: by 2002:a25:7b82:: with SMTP id w124mr40808151ybc.320.1592986261979;
        Wed, 24 Jun 2020 01:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592986261; cv=none;
        d=google.com; s=arc-20160816;
        b=J/RXdCuXnnLAwOPB//sNf9ywstlbJay7fhKT05R0VcNFtitId5eNvWVGSw+LnoIzA/
         z/2pwQeVDiAHhNq8z7MlvanmsfjJD+GcbvOFAnQ1rqjpWGW+tQrzAXu/0Q+dfZCF+bBy
         Fen2QUR0/5/mGkqfScr0DK8U6BXYJL8GjXpc3i1PHMYn529mPmCVyQHzymkYkdRkeQKR
         PCRv17FvGBWjRstisEpB+DcMC4j2ChRNhqGjwydVi3dM9SzKiGBpw19gkBkCBLkHMWGz
         /Bf1G+UhTavQZjvAyaYJEOcgGCmjXMMysfhvxYQWrsHdVdtzQVTf5rthtlglm0DBWKl/
         fgoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=zGvz6h9LZbpi/NUFbCELh2GryDLoIbef/gMUrM7wj5A=;
        b=TvDYql5GmOBpczJNKhSW/wEH/KDe6+hiA1Sokck64RpvQ6mQJJvxWB6W18DvqVpih1
         VdrtjRDeB0M3jKMYVaYrc/Uq6HYQdXVJVE3xLwhKkha6Es9sSZB31flVhstC36/UCb4R
         D9USpXFpvItuMBFbOyKlK0W7KAYt5y6KS3238u35HRBoX/+IjV+FuQeNSix1Om/zLr0m
         xir07V1llDaU/Isg5a6nUruW7xyEg0gi/F3tQ355tEiTWoKI+YfwzjkY/R7f2zq8xTPt
         mX9rG8t6ljmBF4sBYl/jCeTDyG53jwnN+pUhSj8NEeGMe17azY8SR5xCcyj6GQtK4hGt
         548Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f1Hkj6XV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77si18387124ybf.251.2020.06.24.01.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 01:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=f1Hkj6XV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo0Un-0001xH-AV
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 04:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0Uf-0001uv-0y
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 04:10:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32530
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0Ud-0003Pr-6x
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 04:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592986250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zGvz6h9LZbpi/NUFbCELh2GryDLoIbef/gMUrM7wj5A=;
 b=f1Hkj6XV3+0aI+XQ+GDjoIJTtJhsGtV+bxnQnlLABJasTqHMxLojlcIQ7flBdvQxTRHdib
 Xp+PZRa8x647QbyaqPZSNurZxFBtsnmnRS93MgSmSEHJf+QaUiXeCfbQwxxeWZWU5L9Ow3
 IlTKlXxBdU/3+vcOvz9VSoPH4BL7cHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-1o61uP6TOieo9BPatNX62g-1; Wed, 24 Jun 2020 04:10:46 -0400
X-MC-Unique: 1o61uP6TOieo9BPatNX62g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB86E1B18BCB;
 Wed, 24 Jun 2020 08:10:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 792A85C578;
 Wed, 24 Jun 2020 08:10:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E5391113846D; Wed, 24 Jun 2020 10:10:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v4 1/5] qdev: Introduce DEFINE_PROP_RESERVED_REGION
References: <20200623093244.24931-1-eric.auger@redhat.com>
 <20200623093244.24931-2-eric.auger@redhat.com>
 <87mu4thl2a.fsf@dusky.pond.sub.org>
 <8f5bf2be-96bd-5cd0-d60c-7123e83cb264@redhat.com>
Date: Wed, 24 Jun 2020 10:10:31 +0200
In-Reply-To: <8f5bf2be-96bd-5cd0-d60c-7123e83cb264@redhat.com> (Auger Eric's
 message of "Tue, 23 Jun 2020 18:12:28 +0200")
Message-ID: <878sgcevew.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FzaDNf9I7G9b

Auger Eric <eric.auger@redhat.com> writes:

> Hi Markus,
>
> On 6/23/20 5:13 PM, Markus Armbruster wrote:
>> Eric Auger <eric.auger@redhat.com> writes:
>> 
>>> Introduce a new property defining a reserved region:
>>> <low address>:<high address>:<type>.
>>>
>>> This will be used to encode reserved IOVA regions.
>>>
>>> For instance, in virtio-iommu use case, reserved IOVA regions
>>> will be passed by the machine code to the virtio-iommu-pci
>>> device (an array of those). The type of the reserved region
>>> will match the virtio_iommu_probe_resv_mem subtype value:
>>> - VIRTIO_IOMMU_RESV_MEM_T_RESERVED (0)
>>> - VIRTIO_IOMMU_RESV_MEM_T_MSI (1)
>>>
>>> on PC/Q35 machine, this will be used to inform the
>>> virtio-iommu-pci device it should bypass the MSI region.
>>> The reserved region will be: 0xfee00000:0xfeefffff:1.
>>>
>>> On ARM, we can declare the ITS MSI doorbell as an MSI
>>> region to prevent MSIs from being mapped on guest side.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>>>
>>> ---
>>>
>>> v3 -> v4:
>>> - use ':' instead of commas as separators.
>>> - rearrange error messages
>>> - check snprintf returned value
>>> - dared to keep Markus' R-b despite those changes
>>> ---
>>>  include/exec/memory.h        |  6 +++
>>>  include/hw/qdev-properties.h |  3 ++
>>>  include/qemu/typedefs.h      |  1 +
>>>  hw/core/qdev-properties.c    | 89 ++++++++++++++++++++++++++++++++++++
>>>  4 files changed, 99 insertions(+)
>>>
>>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>>> index 7207025bd4..d7a53b96cc 100644
>>> --- a/include/exec/memory.h
>>> +++ b/include/exec/memory.h
>>> @@ -51,6 +51,12 @@ extern bool global_dirty_log;
>>>  
>>>  typedef struct MemoryRegionOps MemoryRegionOps;
>>>  
>>> +struct ReservedRegion {
>>> +    hwaddr low;
>>> +    hwaddr high;
>>> +    unsigned int type;
>> 
>> Suggest to s/unsigned int/unsigned/.
>> 
>>> +};
>>> +
>>>  typedef struct IOMMUTLBEntry IOMMUTLBEntry;
>>>  
>>>  /* See address_space_translate: bit 0 is read, bit 1 is write.  */
>>> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
>>> index 5252bb6b1a..95d0e7201d 100644
>>> --- a/include/hw/qdev-properties.h
>>> +++ b/include/hw/qdev-properties.h
>>> @@ -19,6 +19,7 @@ extern const PropertyInfo qdev_prop_string;
>>>  extern const PropertyInfo qdev_prop_chr;
>>>  extern const PropertyInfo qdev_prop_tpm;
>>>  extern const PropertyInfo qdev_prop_macaddr;
>>> +extern const PropertyInfo qdev_prop_reserved_region;
>>>  extern const PropertyInfo qdev_prop_on_off_auto;
>>>  extern const PropertyInfo qdev_prop_multifd_compression;
>>>  extern const PropertyInfo qdev_prop_losttickpolicy;
>>> @@ -184,6 +185,8 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
>>>      DEFINE_PROP(_n, _s, _f, qdev_prop_drive_iothread, BlockBackend *)
>>>  #define DEFINE_PROP_MACADDR(_n, _s, _f)         \
>>>      DEFINE_PROP(_n, _s, _f, qdev_prop_macaddr, MACAddr)
>>> +#define DEFINE_PROP_RESERVED_REGION(_n, _s, _f)         \
>>> +    DEFINE_PROP(_n, _s, _f, qdev_prop_reserved_region, ReservedRegion)
>>>  #define DEFINE_PROP_ON_OFF_AUTO(_n, _s, _f, _d) \
>>>      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_on_off_auto, OnOffAuto)
>>>  #define DEFINE_PROP_MULTIFD_COMPRESSION(_n, _s, _f, _d) \
>>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>>> index ce4a78b687..15f5047bf1 100644
>>> --- a/include/qemu/typedefs.h
>>> +++ b/include/qemu/typedefs.h
>>> @@ -58,6 +58,7 @@ typedef struct ISABus ISABus;
>>>  typedef struct ISADevice ISADevice;
>>>  typedef struct IsaDma IsaDma;
>>>  typedef struct MACAddr MACAddr;
>>> +typedef struct ReservedRegion ReservedRegion;
>>>  typedef struct MachineClass MachineClass;
>>>  typedef struct MachineState MachineState;
>>>  typedef struct MemoryListener MemoryListener;
>>> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
>>> index ead35d7ffd..193d0d95f9 100644
>>> --- a/hw/core/qdev-properties.c
>>> +++ b/hw/core/qdev-properties.c
>>> @@ -15,6 +15,7 @@
>>>  #include "chardev/char.h"
>>>  #include "qemu/uuid.h"
>>>  #include "qemu/units.h"
>>> +#include "qemu/cutils.h"
>>>  
>>>  void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
>>>                                    Error **errp)
>>> @@ -578,6 +579,94 @@ const PropertyInfo qdev_prop_macaddr = {
>>>      .set   = set_mac,
>>>  };
>>>  
>>> +/* --- Reserved Region --- */
>>> +
>>> +/*
>>> + * accepted syntax version:
>> 
>> "version" feels redundant.  Suggest to capitalize "Accepted".
>> 
>>> + *   <low address>:<high address>:<type>
>>> + *   where low/high addresses are uint64_t in hexadecimal
>>> + *   and type is an unsigned integer in decimal
>>> + */
>>> +static void get_reserved_region(Object *obj, Visitor *v, const char *name,
>>> +                                void *opaque, Error **errp)
>>> +{
>>> +    DeviceState *dev = DEVICE(obj);
>>> +    Property *prop = opaque;
>>> +    ReservedRegion *rr = qdev_get_prop_ptr(dev, prop);
>>> +    char buffer[64];
>>> +    char *p = buffer;
>>> +    int rc;
>>> +
>>> +    rc = snprintf(buffer, sizeof(buffer), "0x%"PRIx64":0x%"PRIx64":%u",
>>> +                  rr->low, rr->high, rr->type);
>>> +    assert(rc < sizeof(buffer));
>>> +
>>> +    visit_type_str(v, name, &p, errp);
>>> +}
>>> +
>>> +static void set_reserved_region(Object *obj, Visitor *v, const char *name,
>>> +                                void *opaque, Error **errp)
>>> +{
>>> +    DeviceState *dev = DEVICE(obj);
>>> +    Property *prop = opaque;
>>> +    ReservedRegion *rr = qdev_get_prop_ptr(dev, prop);
>>> +    Error *local_err = NULL;
>>> +    const char *endptr;
>>> +    char *str;
>>> +    int ret;
>>> +
>>> +    if (dev->realized) {
>>> +        qdev_prop_set_after_realize(dev, name, errp);
>>> +        return;
>>> +    }
>>> +
>>> +    visit_type_str(v, name, &str, &local_err);
>>> +    if (local_err) {
>>> +        error_propagate(errp, local_err);
>>> +        return;
>>> +    }
>>> +
>>> +    ret = qemu_strtou64(str, &endptr, 16, &rr->low);
>>> +    if (ret) {
>>> +        error_setg(errp, "start address of '%s'"
>>> +                   " must be a hexadecimal integer", name);
>>> +        goto out;
>>> +    }
>>> +    if (*endptr != ':') {
>>> +        goto separator_error;
>>> +    }
>>> +
>>> +    ret = qemu_strtou64(endptr + 1, &endptr, 16, &rr->high);
>>> +    if (ret) {
>>> +        error_setg(errp, "end address of '%s'"
>>> +                   " must be a hexadecimal integer", name);
>>> +        goto out;
>>> +    }
>>> +    if (*endptr != ':') {
>>> +        goto separator_error;
>>> +    }
>>> +
>>> +    ret = qemu_strtoui(endptr + 1, &endptr, 10, &rr->type);
>>> +    if (ret) {
>>> +        error_setg(errp, "type of '%s'"
>>> +                   " must be an unsigned integer in decimal", name);
>> 
>> Suggest "must be a non-negative decimal integer".
>> 
>> Whatever uses the property needs a range check.  I can't see that the
>> patches that follow.  What am I missing?
> Do you mean, you would expect the virtio-iommu-pci device to abort in
> case a wrong VIRTIO reserved region type has been registered?

Knowing nothing about reserved region types, I (naively?) assume that a
finite set of types are encoded as small integers.  Any other integers
are then meaningless, and should be rejected.

> Effectively I could do that.
>
> For the time being, unexpected types are considered as RESERVED type.
> Also reserved regions are set by the machinesa nd we don't expect users
> to set them directly so I thought it was sufficient.

One, rejecting invalid values is useful even when they're set
programmatically, because it can catch programming errors.

Two, expecting users to only do what you expect is walking on rather
thin ice ;)

