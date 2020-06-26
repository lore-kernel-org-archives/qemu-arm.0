Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp192968lfm;
        Fri, 26 Jun 2020 00:42:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXhIVAazM332GYQwD1qEEOzJaILJ4mWrONH1v9ay4dzUR+4qrJMx+ghNPKbwzj6wJSBkOb
X-Received: by 2002:a25:e658:: with SMTP id d85mr2995799ybh.328.1593157375829;
        Fri, 26 Jun 2020 00:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593157375; cv=none;
        d=google.com; s=arc-20160816;
        b=bmfS1/3mup6xRuNwVVOvt6caHc+BTpD7IgBaWoN+Lxrr+P6POCx7zlIdzuzZ5DWw4C
         m/ti9/1ivumgTYMpYTmf4Kd3DyiAYmsQqJHcDBwmx46m1FV/a1wXsvynemH1Ev27pTZy
         srefoZK8oM95MRHo1YcPcaMgdV52FSr3emErwx4hpOsDjNcZMjJeYB/5byUsFEEQLbLP
         BNR0Kw8ilCVYNDJxha9PESaL2J1UaMvcRSgdDfvmbMN2tRz6KOYxZEj68P1NhRnQPAFh
         4aE2ej81tjqqLg9jhtrgFkDUgESJEiTyVOD9dXc6394NhuM0j8dkL2dmn9GRHAsEbjB+
         xsVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QeQygaVv5TiSkHunHE4fR17mn7pETjEbIo5uOpu9ynQ=;
        b=igvKA49xga/QsNOMBcWGptQm+cgaZ+enKXYL5YrzNXT3hvLQQQoyxIBVrabd64dCBQ
         VBrqJcIDf0Gdd1ZJ4h5yIPOuMUJ+TkqhUNpFOxUNyA0pgQZb6Abzbq76Fs8W9V2vEd5c
         5z9z5E12lZeOYskykmREUmBaju1u2qETh7UGRIAX4eXNACYdx60Lee3x5I0K0rxoXlU1
         0wF2i8YUEJiRPdXZAfY83XA0rkpTd0rxJDXoGJ5Cug4UfIfRb80uJF92EDsaRRDqKr6P
         xQQsh+u++mcUbHa6qh2UZsFpsstRMOzyJUQZFkcjypZ1hTk9znQp+96Febzqrb9+GZGd
         qcLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LLiTk0sx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n186si3001772ybn.323.2020.06.26.00.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 00:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LLiTk0sx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joj0h-00070X-9H
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 03:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joj09-0006P9-MW
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 03:42:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41850
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1joj07-00044e-05
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 03:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593157338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeQygaVv5TiSkHunHE4fR17mn7pETjEbIo5uOpu9ynQ=;
 b=LLiTk0sxW8l5eFh/hliYRvpSikniY+rO7LGKGKrjcjCrhwDt3eudcfDJ5fAPZc1M25Ampd
 hVZ78mD9XhrabGekZpif9IVg5XcSZ5JzoX2b3s4nMjsnKPMi9GcihKTecAfQ4c/0CSeCeD
 cXKtW89AQ/RJ0DXDU78uTBEdU1t+aTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-HEj5nfD_NOG8OhWaElHn2w-1; Fri, 26 Jun 2020 03:42:16 -0400
X-MC-Unique: HEj5nfD_NOG8OhWaElHn2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 525931005512;
 Fri, 26 Jun 2020 07:42:15 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ABD25C541;
 Fri, 26 Jun 2020 07:42:06 +0000 (UTC)
Subject: Re: [PATCH v5 5/5] hw/arm/virt: Let the virtio-iommu bypass MSIs
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200624132625.27453-1-eric.auger@redhat.com>
 <20200624132625.27453-6-eric.auger@redhat.com>
 <CAFEAcA_gDTuW_13a6MgC1XBMtR1XMkxAY39iUWRePp2U6Ow6XA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <88ddd9da-f3bd-a7b3-c8c0-d7dc082e32a5@redhat.com>
Date: Fri, 26 Jun 2020 09:42:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_gDTuW_13a6MgC1XBMtR1XMkxAY39iUWRePp2U6Ow6XA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 bbhushan2@marvell.com, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUbpzt/Ppibs

Hi Peter,

On 6/25/20 12:01 PM, Peter Maydell wrote:
> On Wed, 24 Jun 2020 at 14:27, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> At the moment the virtio-iommu translates MSI transactions.
>> This behavior is inherited from ARM SMMU. The virt machine
>> code knows where the guest MSI doorbells are so we can easily
>> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
>> setting the guest will not map MSIs through the IOMMU and those
>> transactions will be simply bypassed.
>>
>> Depending on which MSI controller is in use (ITS or GICV2M),
>> we declare either:
>> - the ITS interrupt translation space (ITS_base + 0x10000),
>>   containing the GITS_TRANSLATOR or
>> - The GICV2M single frame, containing the MSI_SETSP_NS register.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
> 
>>  static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>>                                              DeviceState *dev, Error **errp)
>>  {
>> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>> +
>>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>>          virt_memory_pre_plug(hotplug_dev, dev, errp);
>> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>> +        /* we declare a VIRTIO_IOMMU_RESV_MEM_T_MSI region */
>> +
>> +        if (vms->msi_controller == VIRT_MSI_CTRL_ITS) {
>> +            /* GITS_TRANSLATER page */
>> +            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
>> +            qdev_prop_set_string(dev, "reserved-regions[0]",
>> +                                 "0x8090000:0x809FFFF:1");
>> +        } else if (vms->msi_controller == VIRT_MSI_CTRL_GICV2M) {
>> +            /* MSI_SETSPI_NS page */
>> +            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
>> +            qdev_prop_set_string(dev, "reserved-regions[0]",
>> +                                 "0x8020000:0x8020FFF:1");
> 
> This hardcodes addresses and lengths that are in the
> base_memmap[] array for VIRT_GIC_ITS and VIRT_GIC_V2M,
> so it's setting up a bear trap if we ever decide to
> move those. Could we construct the string from the
> base_memmap[] array entry values instead, please ?
Sure

Eric
> 
> thanks
> -- PMM
> 

