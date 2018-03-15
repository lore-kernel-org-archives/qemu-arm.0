Received: by 10.28.91.67 with SMTP id p64csp1192079wmb;
        Thu, 15 Mar 2018 02:46:16 -0700 (PDT)
X-Google-Smtp-Source: AG47ELs5mW5EKAL60tYyia0cB90lBREIGFEEzqBJ/koEobyiNvy1Az/uExX/5evG200ymnMkh6HQ
X-Received: by 10.200.55.157 with SMTP id d29mr4819407qtc.61.1521107176814;
        Thu, 15 Mar 2018 02:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521107176; cv=none;
        d=google.com; s=arc-20160816;
        b=JzRJFDjnTfjPpL0c+Wpw5sNKxHch6fM1MzCV/PhjkZweF2FAqBCJOUprplSvd9Klol
         Cdlzt+RXOqaANPMThdMliTbtduAI2O5yU6I9Bgd3wwt/iysrBS6tNz+mrmSXDPuOMr3y
         Tn6gVrw34jZ31739fKEu0H3IrMa8cS+tydFb3AE1oqWH/ED3sxjX1g3SEB3Bydv/H09M
         g+8M4rDxB8ruW3pTFQWqM7MHNLhfzyl6MxRn+YSG0FQKXeBahyiY1yO9W8nPb3aWrLM+
         7N+PvkvAKBIiJLv5ewsSGIovTdy7+fMBRgIxz5VMIyK0Fcuw7vBRdf2N1K/8dNgVXoXB
         wQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=HB2GgmOvtUmErg5W3GnMIFU8rKsvdWqvq2qm1OVZKcs=;
        b=cDjb4qLmRR7u4vKpIME1gS4o0blQOXmD8onLp/bg1VSY0F7oDInBpTHT7I7e7SjjQO
         78iPC3cP6TcvGDh5XZN6ReXdHwWRrBjqvZoQ5E48qUFfVULTknnb1C0yR3qWvApOujLv
         PWhYJMP7diRQiRJtaAScGFsQ8tkAdCRufMVsd8HqJt9mhRRQREEoxXI/PiJDliUvL9Ss
         5LenbCxuusUNvmWvPhaOE6U7gp6nragXEDEISPC6b4yqylx1zApKYT3MGIvr8l/1nfkj
         23nd018ERPIjdT7yhfe/92n+DtL673KiHH9u7jRiaFOLUjoLwljoF2Y1JSK22LT7io7f
         IINw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j8si4461175qkm.303.2018.03.15.02.46.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Mar 2018 02:46:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewPSi-0006A4-Bn
	for alex.bennee@linaro.org; Thu, 15 Mar 2018 05:46:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ewPSX-00067D-Sc
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 05:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ewPSU-0006YP-Nt
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 05:46:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48632 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ewPSU-0006Ww-IP; Thu, 15 Mar 2018 05:46:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68CA7D1459;
	Thu, 15 Mar 2018 09:46:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 123CA1208F76;
	Thu, 15 Mar 2018 09:45:51 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-12-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_9cmK9gebqE9997fzhTzKT6Ky9q4jn=fxwziopDyK9Ew@mail.gmail.com>
	<cc6029a1-c177-ee8c-d09b-0ed2af81c897@redhat.com>
	<75aee987-a08b-570f-ec10-8b4853d853c6@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ee14227e-8d0a-6f5e-cc60-2bfa0f029723@redhat.com>
Date: Thu, 15 Mar 2018 10:45:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <75aee987-a08b-570f-ec10-8b4853d853c6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 15 Mar 2018 09:46:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 15 Mar 2018 09:46:01 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH v9 11/14] target/arm/kvm: Translate the MSI
 doorbell in kvm_arch_fixup_msi_route
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	linuc.decode@gmail.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LQovPyj46yPV

Hi Paolo,

On 13/03/18 14:37, Paolo Bonzini wrote:
> On 12/03/2018 16:16, Auger Eric wrote:
>>> It is still unclear to me if we need to register an IOMMUNotifier
>>> to handle any change in the MSI doorbell which would occur behind
>>> the scene and would not lead to any call to kvm_arch_fixup_msi_route().
>>
>> Paolo, do you know the answer to this question ?
> 
> Yes, x86 is wrong in this respect (it wouldn't use an IOMMUNotifier, but
> it still should process Interrupt Entry Cache invalidations).

I am not sure anymore of the issue we want to fix. The concen I had in
mind was: what if the MSI doorbell gets unmapped. We would need to be
notified in some way. As the doorbell lies in MMIO space, no
IOMMUNotifier is attached to it at the moment. On the other hand, if the
doorbell gets unmapped, can't we expect some kind of tear down of the
route? Paolo, is it the use case you are talking about here?
> 
>>> It seems a bit odd that:
>>>  * the code for arm for "PCI devices behind IOMMU need to have
>>>    the MSI doorbell writes go through the IOMMU" looks rather
>>>    different from the code for x86 for the same thing
>>
>> ARM SMMU translates MSIs whereas Intel/AMD IOMMU do not translate them.
>> Hence this implementation
> 
> More precisely, Intel IOMMU implements interrupt remapping through an
> MMIO region instead of an IOMMU region, because on x86 interrupt
> remapping can also change the MSI value and not just the address.
thank you for the clarification. Yes I too much focused on IOMMU DMA
translation and forgot the x86 interrupt remapping stuff which
corresponds to what is done here.
> 
>>>  * the code here needs to know specifically that this is an SMMU
>>>    and not some other kind of IOMMU
>> Yes when introducing virtio-iommu we will need to get this fixed. We
>> need a way to retrieve the iommu mr from the as. I will work on this
>> concurrently.
> 
> Probably something like address_space_translate can be used?
Yes achieved with address_space_translate + memory_region_find

Thanks

Eric

> 
> Paolo
> 
