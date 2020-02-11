Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5347250lfp;
        Tue, 11 Feb 2020 09:32:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwwezjnFShkwIW2UdMo52UJZQyQRkhrwSkTsj9hSP1gU+ggpXrmuq9NO1E+AwS95AAkcLS
X-Received: by 2002:a0c:8605:: with SMTP id p5mr3868726qva.109.1581442323413;
        Tue, 11 Feb 2020 09:32:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581442323; cv=none;
        d=google.com; s=arc-20160816;
        b=oePaZ25L+si/9GxxygOU5t++a0D/6jZRJQuIhLQ6xdznvaQVQpcpcmlpV5dOZwIJww
         EtYtvCn3HLGEQTy7tvOmnk4ln+NGENIrlr4Pv8JsRBoXDlYE5fIj7kLjEljAIO5dLMQa
         hmM8v8XOk4TMH9zCEPN5mSH4oiLga9+4O1FT0X6fukVyDOVlgE5bPDFxtpYpXBtp3v8o
         pouchRsRclp3bg9ISSKFwfURV3KElqoSiFvUj7BctKDJKjCNhwFw7D7OatLVB+B7+OHF
         9RaWUflIeynJzLp9bYMHdWkYJPcJzhjjVkECKsiCf5xGlxRSLqUV3sTBmv1MYtmGkm37
         z/hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KIG2jWNZvHfn1cjKvDlDX4wdBlCaBbkHWqDYpEE/6ns=;
        b=QKBRpN29usLdo2HSka22jQHSa0QNSnEqfJcgP5ZwJcPgb2DA7EDGpWl16s0u4JEftP
         Yv3FoP8uq+CsGs9SS0CVglzC6CVOozujh9pBd8BXnTFJbjvOdk9B1sYnDMJ5D5nMoomJ
         6FvkzDgkSsr9qfwUPBZA2HiCfeYdW0atPkTZtQZxjxscxVROA9+VY4llxfQWDJR6nboG
         yuZe4ck1Y5m39pYxhiFcWbnau4iE4+cthb945DFwpUw3c9uQAdWk2WGxGLNCfWEzyFwN
         fxjPESyhymPd9uj3MlJCbOJ55NwQkLnf6DMD24P/UpOS+4duFtcjRf3gnZV3Rg33lT3B
         TpBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NJlysz7Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si2283819qte.198.2020.02.11.09.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 09:32:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NJlysz7Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1ZOE-0001ii-QN
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 12:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j1ZNz-0001h2-Cy
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:31:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j1ZNw-0001Zz-BP
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:31:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33918
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j1ZNu-0001WT-IY
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 12:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581442301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIG2jWNZvHfn1cjKvDlDX4wdBlCaBbkHWqDYpEE/6ns=;
 b=NJlysz7ZT/hzhhSdLkMMjmbCXT27o8GO1W0/k1L9TipEhvUkff0DpIaYVnKC/A71BMDzk8
 VxUcbwioZCX7Tog0WDpgmElMNKyv0y03sEvsKMwXJJWzCRpSUw39WCkddyVyQZp+K//jhB
 ywJt15oewjPst/FxeWZFHCqxqPNWrhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-NQZSC5K5NZyQRz1_OJwEKQ-1; Tue, 11 Feb 2020 12:31:37 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 139E618C43EE;
 Tue, 11 Feb 2020 17:31:36 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2B4F90092;
 Tue, 11 Feb 2020 17:31:20 +0000 (UTC)
Subject: Re: [PATCH v15 8/9] hw/arm/virt: Add the virtio-iommu device tree
 mappings
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200208120022.1920-1-eric.auger@redhat.com>
 <20200208120022.1920-9-eric.auger@redhat.com>
 <CAFEAcA-n97LKaQo9haLdEv+c7k8QkK=LegP_gORr9z4WrBU2Ww@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <5e4549f4-44c3-6a2c-a270-4923db8b455e@redhat.com>
Date: Tue, 11 Feb 2020 18:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-n97LKaQo9haLdEv+c7k8QkK=LegP_gORr9z4WrBU2Ww@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: NQZSC5K5NZyQRz1_OJwEKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: jean-philippe@linaro.org, "Tian, Kevin" <kevin.tian@intel.com>,
 tnowicki@marvell.com, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 bharatb.linux@gmail.com, qemu-arm <qemu-arm@nongnu.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FF2jnLCdz+Sn

Hi Peter,

On 2/11/20 4:00 PM, Peter Maydell wrote:
> On Sat, 8 Feb 2020 at 12:01, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> Adds the "virtio,pci-iommu" node in the host bridge node and
>> the RID mapping, excluding the IOMMU RID.
>>
>> This is done in the virtio-iommu-pci hotplug handler which
>> gets called only if no firmware is loaded or if -no-acpi is
>> passed on the command line. As non DT integration is
>> not yet supported by the kernel we must make sure we
>> are in DT mode. This limitation will be removed as soon
>> as the topology description feature gets supported.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> +static void create_virtio_iommu(VirtMachineState *vms, Error **errp)
>> +{
>> +    const char compat[] = "virtio,pci-iommu";
>> +    uint16_t bdf = vms->virtio_iommu_bdf;
>> +    char *node;
>> +
>> +    vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
>> +
>> +    node = g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, bdf);
>> +    qemu_fdt_add_subnode(vms->fdt, node);
>> +    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
>> +    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
>> +                                 1, bdf << 8, 1, 0, 1, 0,
>> +                                 1, 0, 1, 0);
>> +
>> +    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
>> +    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
>> +    g_free(node);
>> +
>> +    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-map",
>> +                           0x0, vms->iommu_phandle, 0x0, bdf,
>> +                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - bdf);
>> +}
> 
> This function name implies that we're creating the IOMMU device
> here (which would be a weird thing to do in a hotplug callback
> for some other device), but it looks like we're only adding
> device tree nodes ?
yes the actual iommu device is created through the -device option. I can
rename into create_iommu_dt_bindings
> 
> Given that we write the FDT blob into the guest RAM on bootup,
> how does making changes to it here on hotplug (which I assume
> to be 'after boot, whenever the user hot-plugs something') work?

the virtio-iommu is not supposed to be hotplugged but rather
cold-plugged. I use this hotplug mechanism to detect its presence and
add the related dt mappings. Maybe I can add a check to detect if the
bootup is over?

Thoughts?

Eric
> 
> thanks
> -- PMM
> 

