Received: by 10.28.91.67 with SMTP id p64csp719360wmb;
        Tue, 13 Mar 2018 06:37:37 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtySu23ec/dGL6aqDoAKbZU3Jxeo+Acu5N5O/29jXe+Zk5gkzT3sTWGJwJjFHCJ/6iVY5lY
X-Received: by 10.237.44.99 with SMTP id f90mr1127411qtd.80.1520948257013;
        Tue, 13 Mar 2018 06:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520948257; cv=none;
        d=google.com; s=arc-20160816;
        b=cfOmpMQEYXQZyxXSCB2wcMc3AoqGKyoDYmDWSbuqlGghfh5nfExagxGCZ33wvutIRr
         CZKTADfFMMmt8YhWChCXTYFZOnkEWXi5gb9NMO62xBzdxbakLAt5lGVGXg3ZWFYSvw3q
         wDg6G6InRwc9FyTkK+DPfOCN9KGMNt95BoumXeLvKHHYhiA58YnYXk74S8Yx3VXOy1uu
         CAh4l/U/+J9D1EtCzlVhAcnInpc8Ik3GZSbxRoP3iTBPjDTFU67ND8sG7HUz/qLIekGQ
         5RAws4GI433Cyaxu0Z9LGJhjz/95SNhZt94PSxDCSLvWbooGGXufeYXb1jTwcjwJIiSl
         JRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=toRQyUs5h3mnHP762DihKBaEPAHtNnLTQAAFlHT+MFQ=;
        b=h3W/gzZtiiNhf3gRR6Hi1NobeSYg2GZrwJQCwpuOpAOXkoIp6ZIy2e02eB9hL0Z/8d
         bDmbmdWfeBAT5eUCc5JoUI24jI9aR+v/kLEVyeo207iRJ1fcHxtxGKNBcFmiVtajmoTQ
         doBVuM9IOqMcFEhjDZNQv5LAUP6r74aGCbm9W3lIgIYjlgEFPmjxYkJln/FVwEYjZOQg
         5UcWrUS/wpV2SpxZ/3nuhPVkga9oIyeMpO1FcPDU4fGHHKKK1ej3S0Uv5v+b/ERDO6gg
         zmQptccyoCtk/cI9Qrd+/VNN3zRltDukIn0IFnhm34my/0D9vM+eKXaDfOZXhUStkh0p
         H4qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t19si235785qtc.114.2018.03.13.06.37.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 06:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40037 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evk7U-0003RC-IT
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 09:37:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1evk7L-0003Qu-Lx
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 09:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1evk7G-0004kN-Pf
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 09:37:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46082 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1evk7G-0004k7-LR; Tue, 13 Mar 2018 09:37:22 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8F727CBBA;
	Tue, 13 Mar 2018 13:37:21 +0000 (UTC)
Received: from [10.36.116.103] (ovpn-116-103.ams2.redhat.com [10.36.116.103])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 037952026DFD;
	Tue, 13 Mar 2018 13:37:14 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1518893216-9983-1-git-send-email-eric.auger@redhat.com>
	<1518893216-9983-12-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_9cmK9gebqE9997fzhTzKT6Ky9q4jn=fxwziopDyK9Ew@mail.gmail.com>
	<cc6029a1-c177-ee8c-d09b-0ed2af81c897@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <75aee987-a08b-570f-ec10-8b4853d853c6@redhat.com>
Date: Tue, 13 Mar 2018 14:37:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <cc6029a1-c177-ee8c-d09b-0ed2af81c897@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 13 Mar 2018 13:37:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 13 Mar 2018 13:37:21 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
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
X-TUID: MKT9h0hp8Jgo

On 12/03/2018 16:16, Auger Eric wrote:
>> It is still unclear to me if we need to register an IOMMUNotifier
>> to handle any change in the MSI doorbell which would occur behind
>> the scene and would not lead to any call to kvm_arch_fixup_msi_route()=
.
>=20
> Paolo, do you know the answer to this question ?

Yes, x86 is wrong in this respect (it wouldn't use an IOMMUNotifier, but
it still should process Interrupt Entry Cache invalidations).

>> It seems a bit odd that:
>>  * the code for arm for "PCI devices behind IOMMU need to have
>>    the MSI doorbell writes go through the IOMMU" looks rather
>>    different from the code for x86 for the same thing
>
> ARM SMMU translates MSIs whereas Intel/AMD IOMMU do not translate them.
> Hence this implementation

More precisely, Intel IOMMU implements interrupt remapping through an
MMIO region instead of an IOMMU region, because on x86 interrupt
remapping can also change the MSI value and not just the address.

>>  * the code here needs to know specifically that this is an SMMU
>>    and not some other kind of IOMMU
> Yes when introducing virtio-iommu we will need to get this fixed. We
> need a way to retrieve the iommu mr from the as. I will work on this
> concurrently.

Probably something like address_space_translate can be used?

Paolo
