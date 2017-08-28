Received: by 10.223.188.70 with SMTP id a6csp5109492wrh;
        Mon, 28 Aug 2017 15:58:51 -0700 (PDT)
X-Received: by 10.55.169.195 with SMTP id s186mr2958614qke.130.1503961131548;
        Mon, 28 Aug 2017 15:58:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503961131; cv=none;
        d=google.com; s=arc-20160816;
        b=etTcan2pCa+UpxYpIsu8X+73iBhoD9BNkioginBW18MFxA5mLoKcIfcqrWZCtLvDAm
         wczunYrcf1amRud51uZ3JLkDXAK3430SoHKWy6mnIHk+hA5RMJYus/HfReVpRD8Cjr/l
         ZmrrHm+AbN0a8gdslKhQciBpBm3BlTKbtFd2P0yr7qi2ltmZLBozIUGB5kZhwA1t44KN
         2xqcZKEuiMuNBug5LSBiOkav19wgHLPLLWy9ii05qRydd8Q1znpsugsVDNBHtAluPWb5
         8BOEmDzH6ZiDVfC3txj1DILKG9H5BXmbuJTZbDLNVIxz4Sz63FTd1JFhUZWpGP8sBPz2
         TwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=loElRw96/MwvSxvrbHO0YFaekLY9trhptBvEN/y1FkA=;
        b=UrdBRDA4C7oTUR5Z2cuh5UGCIIkUyuoxco+LNtUFOg1yAoPtEGLYAs3RZUxsgwUE62
         4ZG+2IuWk4gdDPNoxx0pKmoufDULex0B23KKKFGw7IWiNXOCt0864QO9HzY9SECTuyvV
         JhedDTiWCRlUTwu5RHR+wRLYXSKkuTqinKqnRJ7yYZsy4bt01x0vBGlLPu35PCdktrrr
         6oCkJYOH2h6fqfaBlK07ZqxZxHSzAp91dW/vsC285KR7wUnD85x0jQ2GubmOrZPjrs6J
         BLKvjUjnHW3jH2x8Ljb7lai6WPbZyBeSs2TyupivHPE8qtaJM54WOuPw9GJPE5IWPJnm
         DFCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z21si1418829qth.115.2017.08.28.15.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 15:58:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmSzZ-0005dQ-9H
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 18:58:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dmSzT-0005dI-HD
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 18:58:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dmSzQ-0004ZB-FL
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 18:58:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40986)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1dmSzQ-0004Z0-8q; Mon, 28 Aug 2017 18:58:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F40C57EA89;
	Mon, 28 Aug 2017 22:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com F40C57EA89
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.18.17.231] (dhcp-17-231.bos.redhat.com [10.18.17.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 157B018A74;
	Mon, 28 Aug 2017 22:58:37 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20170823221445.15243-1-ehabkost@redhat.com>
	<20170823221445.15243-5-ehabkost@redhat.com>
	<20170825193922.GN27715@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <8ad06170-3409-f9aa-dbaf-380c2ca35fd9@redhat.com>
Date: Mon, 28 Aug 2017 18:58:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170825193922.GN27715@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 28 Aug 2017 22:58:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/5] pci: Add
 INTERFACE_LEGACY_PCI_DEVICE to legacy PCI devices
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
Cc: xen-devel@lists.xenproject.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3LiBjsiPw6fp



On 08/25/2017 03:39 PM, Eduardo Habkost wrote:
> CCing maintainers of affected devices (sorry for not CCing you
> before).
> 
> On Wed, Aug 23, 2017 at 07:14:44PM -0300, Eduardo Habkost wrote:
>> Add INTERFACE_LEGACY_PCI_DEVICE to all direct subtypes of
>> TYPE_PCI_DEVICE, except:
>>
>> 1) The ones that already have INTERFACE_PCIE_DEVICE set:
>>
>> * base-xhci
>> * e1000e
>> * nvme
>> * pvscsi
>> * vfio-pci
>> * virtio-pci
>> * vmxnet3
>>
>> 2) base-pci-bridge
>>
>> Not all PCI bridges are legacy PCI devices, so
>> INTERFACE_LEGACY_PCI_DEVICE is added only to the subtypes that
>> are actually legacy PCI devices:
>>
>> * dec-21154-p2p-bridge
>> * i82801b11-bridge
>> * pbm-bridge
>> * pci-bridge
>>
>> The direct subtypes of base-pci-bridge not touched by this patch
>> are:
>>
>> * xilinx-pcie-root: Already marked as PCIe-only device.
>> * pcie-port: all non-abstract subtypes of pcie-port are already
>>   marked as PCIe-only devices.
>>
>> 3) megasas-base
>>
>> Not all megasas devices are legacy PCI devices, so the interface
>> names are added to the subclasses registered by
>> megasas_register_types(), according to information in the
>> megasas_devices[] array.
>>
>> "megasas-gen2" already implements INTERFACE_PCIE_DEVICE, so add
>> INTERFACE_LEGACY_PCI_DEVICE only to "megasas".
>>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> ---

[...]

>>  hw/ide/ich.c                        |  4 ++++
>>  hw/ide/pci.c                        |  4 ++++

Acked-by: John Snow <jsnow@redhat.com>


(Random fly-by comment without looking at the other patches: I assume
there are reasons it's not appropriate or good to add a legacy PCI
device parent that we inherit from, and it's instead better to manually
add the property to all children?)
