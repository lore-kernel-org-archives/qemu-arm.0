Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp412552lfp;
        Fri, 7 Feb 2020 02:33:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzutnfoiNpua14GCVfCFiqibuSykQwNk5UkxWHDS850OolMaSD7fJvIcMoL8UustVRYC9Yo
X-Received: by 2002:ac8:1e05:: with SMTP id n5mr6797774qtl.227.1581071613607;
        Fri, 07 Feb 2020 02:33:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581071613; cv=none;
        d=google.com; s=arc-20160816;
        b=wRm6HBSZpk2MUAkEvF9z0epIGlF/ngtG7mbfv32PohMgVFojwV8ZD/ph7OhrToPPIz
         OAmMdgmaKINe+/ksFgS1Y8WQDfH1RfXLUotEfy/c7tnJ02MoMq6XTUUT50V8H+AUWGdD
         vwpcSJY5eDaghGWw0+wXjCz5D+5JD7D4oicGSPSX/1wm800b6Hsn+C8IdAeV0wQahisv
         YA7e+9Br5ROZl2std43jJc+WwnvW7JS+Ef7I5Oq9b5XePPeEY9qqtGmPOQe0FsypEpUf
         k469OMI+wV6B4VKWXcDVpyhs3BGkM7gq/PoxYBm7Lmkp91YKxo47XBRc8xgyqAxUbPgN
         sKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ozIjojcK3lm7pcb+VZNtYHYXa6itwsLNePmJfCbfq5c=;
        b=NuxQVSaBEZcOX9GJg4NyhiNupcCs1gCQCNf6dHsn1Zm6oE22TxrnOdvASeWcHC7b+k
         Xg014zhTj6ON1sYKnut3ESob+7CXc19L1HT/5gCEZMHme4i+YJJDob7CXO91ti/tjkbz
         jLiNmwgNRe1/tLbPtDNWUB43WglCXm2UAEHM6JEfUrOHuPwPGn16HQs35oLgd5WZuX4t
         6JrY8nq3x1BRmwZKenDjMkQg2qrwvj/9gQBAowxeBdLBdqfnenWYV+wA9Kw30o5OFZXB
         dGzbRuYjFPQsGA9R58Sa3L93tPrQNwnjukBXGobn3SxAN3AwIbmu4XRcX0zxuKm51AI3
         IARg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TlIpRc8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si1053736qkh.376.2020.02.07.02.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 02:33:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TlIpRc8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j00x3-0002nt-32
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 05:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50181)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j00wt-0002kV-O4
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:33:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j00ws-0005HC-CJ
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:33:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:54539
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j00ws-0005Gt-7U
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:33:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozIjojcK3lm7pcb+VZNtYHYXa6itwsLNePmJfCbfq5c=;
 b=TlIpRc8CSpnZ4E9bCf7w8SSSTwD9EHxmmwEZMcTvlBKyTUuUo93D+YQ0vNzLI3ilVEHxim
 0qA8qoG8HuBhLWaBE1HNslCthbGQp/R1V19wTsSA1lBiIsq2avaNx+tbMMK/3VW5jNmDLv
 3MfJjJ2YvOKd49e9Ou8OYPWhMctjkfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-K7RYvPHEOgeDwqMqqmr7Xw-1; Fri, 07 Feb 2020 05:33:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCD81100551A;
 Fri,  7 Feb 2020 10:33:18 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 100DD87B1C;
 Fri,  7 Feb 2020 10:33:08 +0000 (UTC)
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
 <20200207100540.GA1999431@myrica>
 <20200207052405-mutt-send-email-mst@kernel.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <bc48f14c-5be1-194b-b057-fbac121b2718@redhat.com>
Date: Fri, 7 Feb 2020 11:33:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200207052405-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: K7RYvPHEOgeDwqMqqmr7Xw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /4XK8new9Snt

Hi

On 2/7/20 11:24 AM, Michael S. Tsirkin wrote:
> On Fri, Feb 07, 2020 at 11:05:40AM +0100, Jean-Philippe Brucker wrote:
>> Hi Eric,
>>
>> On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
>>> At the moment, the kernel only supports device tree
>>> integration of the virtio-iommu. DT bindings between the
>>> PCI root complex and the IOMMU must be created by the machine
>>> in conformance to:
>>>
>>> Documentation/devicetree/bindings/virtio/iommu.txt.
>>>
>>> To make sure the end-user is aware of this, force him to use the
>>> temporary device option "x-dt-binding" and also double check the
>>> machine has a hotplug handler for the virtio-iommu-pci device.
>>> This hotplug handler is in charge of creating those DT bindings.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> [...]
>>> @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
>>>      DeviceState *vdev = DEVICE(&dev->vdev);
>>>  
>>> +    if (!dev->dt_binding) {
>>> +        error_setg(errp,
>>> +                   "Instantiation currently only is possible if the machine "
>>> +                   "creates device tree iommu-map bindings, ie. ACPI is not "
>>> +                   "yet supported");
>>> +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n");
>>
>> "use -device virtio-iommu-pci,x-dt-binding"?
>>
>> Can the option be safely removed as soon as we implement a topology
>> description for the remaining platforms?  Or will we need to carry it
>> forever for backward-compatibility (ie. ensure that an old command-line
>> invocation that contains this option still works)?
>>
>> Thanks,
>> Jean
> 
> I'd worry that if we actually document it then users will come to
> depend on it for sure, even though it starts with x-.

Let's rephrase my previous answer. Once we get the topology description
feature we can leave the x-dt-binding property supported but do not test
it anymore and document it at deprecated?

Thanks

Eric
> 

