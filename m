Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4870736wre;
        Wed, 30 May 2018 08:25:52 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKPScR0UCaC0OCN0/6PD99JMrKJHHy34i1UgfFevv3XliEF0z+c1ZNkv1o0pZ4XxmRUUApm
X-Received: by 2002:a0c:aec8:: with SMTP id n8-v6mr2919574qvd.81.1527693951975;
        Wed, 30 May 2018 08:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527693951; cv=none;
        d=google.com; s=arc-20160816;
        b=tMPCqm7oJqKmYKWHTrwQS0e0KavLeiEfT3tVRQ2/F2A7l9xMAslZwQjH4TcpGR8vmb
         DlkB9tH681o5zhaHakydOFrgvPoPm2RLZYQeKPm8UPaTezTGYjjnzlNepGX2hMFW3hMv
         viCZh0doSEJnjlFl6NLpA7RGBn+e0SdwFbYJk50/c0Y+utHuR1ygBDMFnZLJCj+ZZ/CX
         R76OdaOFKNeqS3oBZPH69/0ebRxcgw/t1omnH0d9Ux+fa8NumvQW9vD9EC2A7XFLPyGI
         HCHe1p/y8KN3jrfFLdok+i1+f720VlYkYEz5JVrwtHnDpVP97PjThWE+behn2oxxyixv
         8k3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=Wsn8osqJkA+JEnvw7yjRsmuoVQaWwnL/9dsDZexEyxE=;
        b=iH4OHDpPMm02mV8v2SEmQgO6yxYLTcZL1TPkWyR7hNZvdHfny4pcpUfnMebL8VtwWM
         tLcP/oPMkCYbUMO9pWiDXewbNxL5FtUXTDE6Vt0PRAV5NWdzbB8RB+KvFSAnwMp6soPk
         DJSanP/rj3d24uAkQJweAqMMaAyIegmwBGg7/OBxz+cx6LsAjdTsX+oGFSgTsTh01jzy
         qDEiRbiKD/obt81JrAqQYDT2vNOWJbDOvTK+Aseu7/EbNfxBhSoMLuRsuNFzAq4NJthz
         5HJUmg3LPDJ/jcZcC6jfgvBgQQ9dU9jKbM4aBHmZutf8nTROA0dMbRSCTtEWFtk5hSR+
         4EYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h89-v6si5936611qtd.54.2018.05.30.08.25.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 08:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO2z1-0002Lr-D3
	for alex.bennee@linaro.org; Wed, 30 May 2018 11:25:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fO2xR-0001Fv-HF
	for qemu-arm@nongnu.org; Wed, 30 May 2018 11:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fO2xN-0005H3-RX
	for qemu-arm@nongnu.org; Wed, 30 May 2018 11:24:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57760 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fO2xN-0005Gp-IA; Wed, 30 May 2018 11:24:09 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26E92818A69B;
	Wed, 30 May 2018 15:24:09 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 856542026988;
	Wed, 30 May 2018 15:24:07 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<f365f305-175c-db54-677d-6f66719b24cd@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8386F1799@FRAEML521-MBX.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <03cc41b1-cc2e-d272-ccbc-460dfc051e78@redhat.com>
Date: Wed, 30 May 2018 17:24:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8386F1799@FRAEML521-MBX.china.huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 15:24:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Wed, 30 May 2018 15:24:09 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v2 0/6] hw/arm: Add support for non-contiguous
 iova regions
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"drjones@redhat.com" <drjones@redhat.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1VLuHZRctaE+

Hi Shameer;

On 05/30/2018 04:39 PM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: Monday, May 28, 2018 3:22 PM
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> qemu-devel@nongnu.org; qemu-arm@nongnu.org
>> Cc: drjones@redhat.com; imammedo@redhat.com; peter.maydell@linaro.org;
>> alex.williamson@redhat.com; Zhaoshenglong <zhaoshenglong@huawei.com>;
>> Jonathan Cameron <jonathan.cameron@huawei.com>; Linuxarm
>> <linuxarm@huawei.com>
>> Subject: Re: [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
>>
>> Hi Shameer,
>>
>> On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
>>> When the kernel reports valid iova ranges as non-contiguous,
>>> memory should be allocated to Guest in such a way that
>>> reserved regions(holes) are not visible by Guest.
>>>
>>> This series retrieves the valid iova ranges based on the new
>>> proposed VFIO interface for kernel [1]. It then populates the
>>> first 1GB ram as a non-pluggable dimm and rest as a pc-dimm if
>>> the valid iova ranges are non-contiguous.
>>
>> Some general comments:
> 
> Thanks for going through this series.
> 
>> - what are your plans with respect to VFIO device hot-plug handling?
>> IIUC, at the moment, any collision between reserved regions induces by
>> hot-plugged devices are not detected/handled. I understand mem hotplug
>> is not supported on aarch64. Would you simply reject the vfio device
>> hotplug.
> 
> As per the new kernel changes, the _attach_group() will fail if the device 
> reserved regions conflicts with any existing dma mappings of the VM. 
> So my understanding is that, host kernel will in effect reject any hot-plug
> device that has a reserved region conflicting with dma mappings.

Oh you're right, as the whole guest RAM space may be dma mapped, this
should be detected.
> 
>> - IIUC any reserved window colliding with [4000000, 1GB] cold-plug RAM
>> segment is show-stopper. How was this 1GB size chosen exactly?
> 
> Yes, any reserved window in that region might prevent the Guest from booting
> with UEFI as the current solution will move the base start address . I think this is
> because the EDK2 UEFI expects the base to start at 0x4000000[1]. I am not sure
> why this is required by the UEFI as without the "-bios" option, the Guest can be
> booted as long as base addr < 4GB.
> 
>> - Currently you create a single PC-DIMM node whereas several ones may be
>> possible & necessary? Do you plan to support multiple PC-DIMMS node?
> 
> Yes, that is correct. This is mainly to keep it simple and with the expectation that
> the valid host iova regions may not be that fragmented. I can look into extent this
> to support multiple pc-dimms if there is an immediate requirement to do so.
>  
>> - I have started looking at RAM extension on machvirt. I think adding
>> support of PC-DIMMS through the qemu cmd line is something that we need
>> to work on, in paralell.
> 
> Ok. Do you have more info that you can share on this? Please let me know.
not really. We just plan to support more than 255GB RAM and support this
through PC-DIMM. Some of your patches can be reused I think.

Thanks

Eric
> 
> Thanks,
> Shameer
> 
> [1] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtQemu.dsc#L133
> 
>> Thanks
>>
>> Eric
>>>
>>> Patch #3 of this series is loosely based on an earlier attempt
>>> by Kwangwoo Lee to add hotplug/pc-dimm support to arm64[2]
>>>
>>> RFC v1[3] --> RFCv2
>>>  -Based on new VFIO kernel interface
>>>  -Part of Mem modelled as pc-dimm
>>>  -Rebased to qemu 2.12.0
>>>
>>> [1] https://lkml.org/lkml/2018/4/18/293
>>> [2] https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04600.html
>>> [3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg02412.html
>>>
>>> Shameer Kolothum (6):
>>>   hw/vfio: Retrieve valid iova ranges from kernel
>>>   hw/arm/virt: Enable dynamic generation of guest RAM memory regions
>>>   hw/arm/virt: Add pc-dimm mem hotplug framework
>>>   hw/arm: Changes required to accommodate non-contiguous DT mem nodes
>>>   hw/arm: ACPI SRAT changes to accommodate non-contiguous mem
>>>   hw/arm: Populate non-contiguous memory regions
>>>
>>>  default-configs/aarch64-softmmu.mak |   1 +
>>>  hw/arm/boot.c                       |  91 ++++++---
>>>  hw/arm/virt-acpi-build.c            |  24 ++-
>>>  hw/arm/virt.c                       | 367
>> +++++++++++++++++++++++++++++++++++-
>>>  hw/vfio/common.c                    | 108 ++++++++++-
>>>  include/hw/arm/arm.h                |  12 ++
>>>  include/hw/arm/virt.h               |   3 +
>>>  include/hw/vfio/vfio-common.h       |   7 +
>>>  linux-headers/linux/vfio.h          |  23 +++
>>>  9 files changed, 589 insertions(+), 47 deletions(-)
>>>
