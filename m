Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2382528wrs;
        Mon, 19 Aug 2019 01:46:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzX7P0uEVAeBpxXbIWA9cOI/qyQFg69nOPAkllgamO/tylKkQiOTvVi0WfVlLWalO7ZMvqu
X-Received: by 2002:a17:902:29e9:: with SMTP id h96mr21252097plb.110.1566204387393;
        Mon, 19 Aug 2019 01:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566204387; cv=none;
        d=google.com; s=arc-20160816;
        b=inIdprowXwgHXwN/wJHi5ox78AwDutIYbUXxEcK8q0T7jz0faHEre4TS4TnD+MIvrc
         rsO7WGHyFsVYPoo0lx1PaTldRIhqulHvRnEdrlC0tiIEgVaeUH9pOh3ERrQjj5hrDt+S
         DbtnGxk9s7LT4XTgmWPiOdVTJTBbbAPUWqfQDpAdJomMiYm4kgT6k27T1yc9E9SYuS1J
         3tpyWFkqMqgqpBUKQhp4qLTB7hLtfQLHIHQGQkzqZhQHxepRvCwbPG42G5PBVm8s7o3r
         eQBgabGaDDyY1Oq5hUU6xIRZ3JDg1y2A/egubM81dC7eWKrnPJT/FWaVfZCYoT7XSCEK
         b5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:cc:to:subject;
        bh=I0L9pf/BQoXLAjLcScM4pNZ7Yl9llsMPxzrly5yR0hU=;
        b=Q14wj3LmjjLvJF3vxCoDfB46zAgtZKGhrLIcm/aNDsn0D/VsQCgsPNysVvhHes+Gk0
         aBYCHCUtStJk0h9rmNHseCH+LpT6nEyTMIBkp4kZ0tbMi+UmPPBrs40Cg1gvRyUTJZz2
         Or6pd3jUngJWL9F3KZpEgszjC+cCs9cbvH4A0b6A9UrW3r+Kwzi8vlqg/3kCljUqwrDG
         5UG9zCtJqQyz6HVD4sC9UzLzxzt6vQYMpLIHmajDLE8P3sprpW1/NV59ruO3sOPOY3po
         fzYR0RkvhD0b4csjsoEPhEiR839Gy0ukT2JNEnkATkCjBsfs4bTMrAILDprDSekfgilx
         ECTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id cp2si9378705plb.437.2019.08.19.01.46.27;
        Mon, 19 Aug 2019 01:46:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfHSIq0 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 19 Aug 2019 04:46:26 -0400
Received: from foss.arm.com ([217.140.110.172]:51080 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbfHSIq0 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 19 Aug 2019 04:46:26 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFE3344;
        Mon, 19 Aug 2019 01:46:25 -0700 (PDT)
Received: from [10.1.197.61] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8352C3F718;
        Mon, 19 Aug 2019 01:46:24 -0700 (PDT)
Subject: Re: [PATCH] KVM: arm/arm64: vgic: Allow more than 256 vcpus for
 KVM_IRQ_LINE
To:     Will Deacon <will@kernel.org>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, qemu-arm@nongnu.org,
        kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
        kvm@vger.kernel.org
References: <20190818140710.23920-1-maz@kernel.org>
 <20190819074150.jv3dyyxqazoawgds@willie-the-truck>
From:   Marc Zyngier <maz@kernel.org>
Organization: Approximate
Message-ID: <a7573176-6375-a7df-6fae-ab93155a824c@kernel.org>
Date:   Mon, 19 Aug 2019 09:46:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819074150.jv3dyyxqazoawgds@willie-the-truck>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ILM0B80anK8T

On 19/08/2019 08:41, Will Deacon wrote:
> On Sun, Aug 18, 2019 at 03:07:10PM +0100, Marc Zyngier wrote:
>> While parts of the VGIC support a large number of vcpus (we
>> bravely allow up to 512), other parts are more limited.
>>
>> One of these limits is visible in the KVM_IRQ_LINE ioctl, which
>> only allows 256 vcpus to be signalled when using the CPU or PPI
>> types. Unfortunately, we've cornered ourselves badly by allocating
>> all the bits in the irq field.
>>
>> Since the irq_type subfield (8 bit wide) is currently only taking
>> the values 0, 1 and 2 (and we have been careful not to allow anything
>> else), let's reduce this field to only 4 bits, and allocate the
>> remaining 4 bits to a vcpu2_index, which acts as a multiplier:
>>
>>   vcpu_id = 256 * vcpu2_index + vcpu_index
>>
>> With that, and a new capability (KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)
>> allowing this to be discovered, it becomes possible to inject
>> PPIs to up to 4096 vcpus. But please just don't.
> 
> Do you actually need a new capability for this? Older kernels reject
> non-zero upper bits in the 'irq_type', so isn't that enough to probe
> for this directly?

'Probing' is a bit of an overstatement. You'll get an error back when
userspace will try to inject a PPI into a vcpu whose ID is in the new
range. But nothing at VM creation time will indicate the interrupt
injection API supports more than 256 vcpus.

I think userspace should be able to fail the creation of such large VM
immediately, before actually running it.

	M.
-- 
Jazz is not dead, it just smells funny...
