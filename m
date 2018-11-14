Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5942028wrw;
        Wed, 14 Nov 2018 08:41:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5c0Of+61mwBV9b01wQ0qH0ywVFagA7grdOtHrju33U+QrO4Z3WcxhLTMf7Gd5pzX4Q17R8w
X-Received: by 2002:a37:c3c3:: with SMTP id r64mr2453099qkl.70.1542213716998;
        Wed, 14 Nov 2018 08:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542213716; cv=none;
        d=google.com; s=arc-20160816;
        b=HkPgY+rIOqCryMdbDHd3bGdisV/cDOjLtuDlMaVpi0vyuXWY7BvIEN90e50Z93XCBR
         8dl+SPb/kwbX6AWcYIreThA1t28Trs0YC5bGtZsCkkbSnzIFc8CHllM1fKG5pFKrWL8l
         n7pRn5cvf4thwOSgVdp7XKoSRD0OJ5MBp69c2/2m6JANdPJj5t7wyQ8i5RR7hwt9sXbt
         m97iWZl2wBVVC6TLHgEHpAq0FiouVlkepSj9Cu39eAZoKWITOCQxpVdDj9WTaz/NXS/B
         kUOwDgG/D/I0OP70PQettG4KRU6xQS6eaOwXIpXnWkSnmttw142+BQHWCSIww6QM/Emj
         2ziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=tcxKXOhtRmqnH6TMnBvQbCpZgVkmTTusaAP/5myE0uk=;
        b=Mc7FTITmZsBQYYsTMKsHSbHR1Z8XFnPRUXYVbRblHIVOvYRpYD/eCmsgFftlY2pWk9
         9CKPOTp53ehZpxMsywMihc34bcZe1nad/8iPHPWeMqgfRF5TEDm5svWPPCxBRoFjTiN2
         Yihv1pTNFv7v7KRsXyqZVf/1EWESkYODCjTqm+gnbqnZsLxoqchGSh8rR1NoH38tWafL
         2pZ0Uf/WUfIcny1v+ty5uKMSFKofo0P98YoDKybEZXliZ/g2RKHlw0KL0/prPhGvZyeY
         VXzqOH3ArF39sGRhz0YHVxZmA6wga+pj3FpmZeOc26WEaPvUhq4e0Kati5g6tkqb4smg
         FKYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 88si101640qte.245.2018.11.14.08.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 08:41:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMyEm-0005Fr-81
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 11:41:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gMyEZ-0005Eq-R7
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:41:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gMyEQ-0003n0-Ai
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 11:41:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33520)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gMyEJ-0003it-Fh; Wed, 14 Nov 2018 11:41:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D9DA312E9FB;
	Wed, 14 Nov 2018 16:41:22 +0000 (UTC)
Received: from [10.36.116.180] (ovpn-116-180.ams2.redhat.com [10.36.116.180])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B155460BF6;
	Wed, 14 Nov 2018 16:41:20 +0000 (UTC)
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"mst@redhat.com" <mst@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
	<20181109112957.10067-16-eric.auger@redhat.com>
	<2d6c96ce-9eb5-9347-1a75-4e13c0cea0ec@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <8653586f-404f-5b03-30ba-a0eb3676c107@redhat.com>
Date: Wed, 14 Nov 2018 17:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <2d6c96ce-9eb5-9347-1a75-4e13c0cea0ec@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 14 Nov 2018 16:41:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v8 15/18] hw/arm/virt: Add
 virtio-iommu to the virt board
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
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OQYApc8N5r3H

Hi Jean,

On 11/14/18 5:01 PM, Jean-Philippe Brucker wrote:
> On 09/11/2018 11:29, Eric Auger wrote:
>> +static void create_virtio_iommu(VirtMachineState *vms,
>> +                                const char *pciehb_nodename, PCIBus *bus)
>> +{
>> +    const char compat[] = "virtio,pci-iommu";
>> +    uint16_t bdf = 0x8; /* 00:01.0 */
>> +    DeviceState *dev;
>> +    char *node;
>> +
>> +    dev = qdev_create(BUS(bus), TYPE_VIRTIO_IOMMU_PCI);
>> +    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
> 
> For the Arm virt platform, should msi_bypass default to false? Otherwise
> I don't think pass-through to guest userpace will work.
That's correct. It's a regression compared to v7. I will fix this soon
while doing the pc machine integration + resv regions flaws you reported
in the meantime.

Thanks!

Eric
> 
> Thanks,
> Jean
> 
