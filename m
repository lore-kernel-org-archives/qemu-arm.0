Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp400513lfp;
        Fri, 7 Feb 2020 02:19:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxTN1ZqSqtOgKFKKLTXdKPMHorCkJ3rOr9BKhbObk4oUQciGukouoKJ2BeWRC/R2HdQnixh
X-Received: by 2002:a05:620a:2056:: with SMTP id d22mr6691112qka.142.1581070796424;
        Fri, 07 Feb 2020 02:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581070796; cv=none;
        d=google.com; s=arc-20160816;
        b=TT9fkLNEIE4ifvzq7esufGD+xkfG7AtwicuKr/t7MU9HHQP3xY6xpjwgr9ZgBP1HOf
         1odPIALYNOkXG64HBYdQPn4wCdRnLPl7MtSV+RY7QiwYMxx/pj2JAikkpa202F6spTf0
         Ku8MSmgi0P1/5Wciqh0ddtY9Agc/Tj8npdXr4L7U0eEbZv7lyjWZanzlaRiQeptoIzxc
         +gwe4y7ECJS8tF+Csei9zRw7ERkZtiu7x4dmU+LiP32MrPh4AmfjIRDK5tDQ4jS70lu4
         wheA7gqjHH3SKgQ4pdIbuk7qBAbD/U4VyKWS+GtQMNDi9/nt3xtW2q3y4dhEoh85A8HR
         9wJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZBrn9SGNO71zqqFpslql7PX6hoM1RQldG9GD7Gqg1jk=;
        b=a1qGgV4n9WqfdhIsFHxgPdJPCJti6zYKBKPcqc1iBFX9FwsPc6gGSgriXCW5JR9uXI
         Fyx2GGRkZw61BG4vxTIk0erkJ56c84Aw3BdzET4rsreRymnZrDs2Z+21OIPdWSCgb353
         epBVWPrbbJIuCzIfYV9ZUfz1v+Rgtk1vN4l8OqdSg2Ub+JY99HDIbvrRm043vZsagJ1j
         K8imeI3TfiQsadyVLCs8aMPbIqyT0sZQXlLxcrZQowp/a1xqmfM3QmaMZPMD+VrAbsFE
         LyNWdirR12xxS69RtptbkfpCgWAmWoKrPj1S92MS8OLtT0kMx74ebDuaq+cDyMPyC9ek
         QErQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BuMWLgJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si1194156qti.35.2020.02.07.02.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 02:19:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BuMWLgJI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j00jr-0002tA-JE
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 05:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47690)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j00jh-0002m2-IX
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:19:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j00jf-0003zJ-DK
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:19:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26726
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j00jf-0003wx-80
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 05:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581070782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZBrn9SGNO71zqqFpslql7PX6hoM1RQldG9GD7Gqg1jk=;
 b=BuMWLgJIEwpc6B4wQCVIHr0thV+fh4+a0p6O8WbQUjfsYHBCVYSsbBn3ev9xL2qTAttWX1
 axstU3rluLwSyG/o6kQCsxghBQ9Hz9nHE9qEvGLP7oBIe7fnT6zyyW6vSx7RBciVUZTalm
 qFjEVYsQNpyFw8FiG7VBtZrOqb3RVaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-qKpaNl-HNJCNNo9nQwKAeA-1; Fri, 07 Feb 2020 05:19:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A09CDB60;
 Fri,  7 Feb 2020 10:19:38 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E23B863AB;
 Fri,  7 Feb 2020 10:19:28 +0000 (UTC)
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
 <20200207100540.GA1999431@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <cec24814-2192-1e8f-495b-e57f5548df9e@redhat.com>
Date: Fri, 7 Feb 2020 11:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200207100540.GA1999431@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: qKpaNl-HNJCNNo9nQwKAeA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 mst@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L2WYO4dSvPrE

Hi Jean,

On 2/7/20 11:05 AM, Jean-Philippe Brucker wrote:
> Hi Eric,
> 
> On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
>> At the moment, the kernel only supports device tree
>> integration of the virtio-iommu. DT bindings between the
>> PCI root complex and the IOMMU must be created by the machine
>> in conformance to:
>>
>> Documentation/devicetree/bindings/virtio/iommu.txt.
>>
>> To make sure the end-user is aware of this, force him to use the
>> temporary device option "x-dt-binding" and also double check the
>> machine has a hotplug handler for the virtio-iommu-pci device.
>> This hotplug handler is in charge of creating those DT bindings.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> [...]
>> @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
>>      DeviceState *vdev = DEVICE(&dev->vdev);
>>  
>> +    if (!dev->dt_binding) {
>> +        error_setg(errp,
>> +                   "Instantiation currently only is possible if the machine "
>> +                   "creates device tree iommu-map bindings, ie. ACPI is not "
>> +                   "yet supported");
>> +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n");
> 
> "use -device virtio-iommu-pci,x-dt-binding"?
> 
> Can the option be safely removed as soon as we implement a topology
> description for the remaining platforms?  Or will we need to carry it
> forever for backward-compatibility (ie. ensure that an old command-line
> invocation that contains this option still works)?

"x-" properties are experimental so yes it is bound to be removed as
soon as we get the topology description feature.

I now have to figure out how to fix the make-check issue it introduces :-(

Thanks

Eric
> 
> Thanks,
> Jean
> 

