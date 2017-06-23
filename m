Received: by 10.25.15.197 with SMTP id 66csp234207lfp;
        Fri, 23 Jun 2017 09:10:49 -0700 (PDT)
X-Received: by 10.200.54.108 with SMTP id n41mr10967914qtb.219.1498234249475;
        Fri, 23 Jun 2017 09:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498234249; cv=none;
        d=google.com; s=arc-20160816;
        b=nmm/XIi8qdZEYn+CwdVWBdTRzOGfEXY3hvZD+FNuBpDWiC1sX9Xad+VfXNv3bcOy2s
         tOf59vxKKJisareLdlIJwC5spM5CrNoAqRrF5Y8MsAv4s79+oejvZpY8e/zV6qnWkAgB
         LMp3pDzVhr7aePSiy939bHUVoh11QK6b+OLX1dHbJocno1iLvKYUVltz9UkWR5Ekp7lr
         wGzcQcCdeRjC6JAiALix28jzv/nLIFZLYdtE0bLsuv6umk7XYoIOofpBoMU7/x3KwaeX
         9ZVTaB3UzZqh8+RJE7Padnyqzb6aQH2lro3zey4DoOMJzYa3Ss6xT9JMjOqZs9S6wWiN
         AO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from
         :arc-authentication-results;
        bh=JAFbrFvuygJBICzKpjU8zr7fNyLP/mx5VtDx1a+MPhQ=;
        b=K7uFL1KDuSpBoWIGxUoO5bn5uuhUvMD13pzlt01duscgS5VS5jdtaInZPK3YEo8nBk
         /FqOFIRYFFq9Dmk2y6ww8h8h2y7+t6XyrdIKXb+Gi7UjAsmwL+MxEb907zQEAosyddES
         hWUmH1pyKHqHC0XO0rERhbDMpoG8EHo8V2HFVHQyJctz/U0FtxejgchGl/JlqjCHUSAc
         M8g5olFDJHOQjd5J7eO5GKN4wQl0veQSTMm3FirXMsQcchSXFsdG+SRTcBpZdNH6IPT/
         jbRsIEV+0JCqhKf+js50VcyYDpMhuO9+UPpv0RUVmOEHhiw7MbANib+RTaEwectXhX/j
         Z8gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k13si4406371qtf.38.2017.06.23.09.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Jun 2017 09:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dORAU-0002ov-LI
	for alex.bennee@linaro.org; Fri, 23 Jun 2017 12:10:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dOR9l-0002Ih-4U
	for qemu-arm@nongnu.org; Fri, 23 Jun 2017 12:10:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>) id 1dOR9g-00020a-0z
	for qemu-arm@nongnu.org; Fri, 23 Jun 2017 12:10:01 -0400
Received: from foss.arm.com ([217.140.101.70]:33336)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jean-philippe.brucker@arm.com>)
	id 1dOR9f-00020P-Qd; Fri, 23 Jun 2017 12:09:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 318132B;
	Fri, 23 Jun 2017 09:09:55 -0700 (PDT)
Received: from [10.37.10.32] (unknown [10.37.10.32])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B6143F557;
	Fri, 23 Jun 2017 09:09:52 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
Message-ID: <05924a52-7b7c-c747-26fb-499670ef468f@arm.com>
Date: Fri, 23 Jun 2017 17:09:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <1496851287-9428-7-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [RFC v2 6/8] virtio-iommu: Implement the translation
 and commands
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oS35/OVK3XQO

On 07/06/17 17:01, Eric Auger wrote:
> This patch adds the actual implementation for the translation routine
> and the virtio-iommu commands.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---[...]
>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>                                 struct virtio_iommu_req_attach *req)
> @@ -95,10 +135,34 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>      uint32_t asid = le32_to_cpu(req->address_space);
>      uint32_t devid = le32_to_cpu(req->device);
>      uint32_t reserved = le32_to_cpu(req->reserved);
> +    viommu_as *as;
> +    viommu_dev *dev;
>  
>      trace_virtio_iommu_attach(asid, devid, reserved);
>  
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> +    if (dev) {
> +        return -1;

I guess you could return S_INVAL here. However, if the device is already
attached to AS0, it should be detached and attached to AS1. The Linux
driver relies on this behavior when moving a device from kernel to user
address space and back.

Thanks,
Jean
