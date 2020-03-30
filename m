Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2721233lfi;
        Mon, 30 Mar 2020 06:17:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vufFyBSz7W9YvbK+zoZwFTJXORPIvIO30Cg5E5SA3UX/qLztuJMt+ClH315LNEgOf+txKYI
X-Received: by 2002:a54:4181:: with SMTP id 1mr7209369oiy.61.1585574279785;
        Mon, 30 Mar 2020 06:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585574279; cv=none;
        d=google.com; s=arc-20160816;
        b=hWUWLaVgVyRA0/7vsojHqmKzuMf5+8ms9rRPz+Ui/1+uFZFHVm/olaQkjseTPeDTWB
         eCjn2ZYYJEs32xdK6jCFY0+VSZ2HzuR0AXGx4qq2nK4Tz0forPeiQ2iGG/ExskV9AQFA
         Sw2+6w4e6XC0FyGytKSdH+C7HGSgaWaRu22IaImysU/0imVNwuaxNoPSDpVCeEp2mX9q
         9BDMhNhbvG4LZgpsQC7T9vO0BsoHa8aQRz2PBpRNsmNB+qFBYg7bhxqZfSCDODJtk6iy
         iYh5W14N/lxohU8gj/znU7tuKe6YQUbqiU6hNfWNgUMX2lABhmyp+E/TNxPkIZtxFrnC
         Dkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=KpeN8U++dVMdHWHMEjno40HeDxFwqnpYkqvZXNnPFro=;
        b=B/kW4JBPE59T/rgJYmN7XsVPiVTj6pNyU0rIB6T8kyasZXa5eWrqzNOGjbgpyAWYwC
         FfPJAPCFb4WO/8xFuuf+RRDtV7EP3SMyzncLHklB9VujT27hBuvwxS8KWOSCt57e0kwl
         8vLQ9zA5BKvi0Bhj34hwFKbj+NHLlqEaKQAUqe+Wxw/awW5bx9/wvLG9fANBlZ6kMXB2
         +xDwA5607Su5LzhFE872hNkqKIUu8GqqX7VJosWu2HU7uTGjSCcNjQTJ38slrl6w8k+K
         DWSlurT6rIOj0f5C6lkLYY7nU70Wf6fPeN1YwT4fjlnsMFZI6zomE05s6YvfQHrRy90p
         x5ug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id q197si5856257oic.262.2020.03.30.06.17.59;
        Mon, 30 Mar 2020 06:17:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730134AbgC3NR6 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 30 Mar 2020 09:17:58 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:12653 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730015AbgC3NR6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 30 Mar 2020 09:17:58 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6D6481EB6A23AB42A64A;
        Mon, 30 Mar 2020 21:17:54 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 21:17:48 +0800
Subject: Re: [kvm-unit-tests PATCH v7 13/13] arm/arm64: ITS: pending table
 migration test
To:     Auger Eric <eric.auger@redhat.com>
CC:     <peter.maydell@linaro.org>, <drjones@redhat.com>,
        <kvm@vger.kernel.org>, <maz@kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <andre.przywara@arm.com>,
        <thuth@redhat.com>, <alexandru.elisei@arm.com>,
        <kvmarm@lists.cs.columbia.edu>, <eric.auger.pro@gmail.com>
References: <20200320092428.20880-1-eric.auger@redhat.com>
 <20200320092428.20880-14-eric.auger@redhat.com>
 <296c574b-810c-9c90-a613-df732a9ac193@huawei.com>
 <ea74559c-2ab4-752c-e587-2bf40eab14b0@redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <0e73fd13-ca18-2d17-2267-fd5d852e3ac8@huawei.com>
Date:   Mon, 30 Mar 2020 21:17:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <ea74559c-2ab4-752c-e587-2bf40eab14b0@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: FTBZOf53+9gQ

On 2020/3/30 20:38, Auger Eric wrote:
> Hi Zenghui,

[...]

>>> +
>>> +    ptr = gicv3_data.redist_base[pe0] + GICR_PENDBASER;
>>> +    pendbaser = readq(ptr);
>>> +    writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
>>> +
>>> +    ptr = gicv3_data.redist_base[pe1] + GICR_PENDBASER;
>>> +    pendbaser = readq(ptr);
>>> +    writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
>>> +
>>> +    gicv3_lpi_rdist_enable(pe0);
>>> +    gicv3_lpi_rdist_enable(pe1);
>>
>> I don't know how the migration gets implemented in kvm-unit-tests.
>> But is there any guarantee that the LPIs will only be triggered on the
>> destination side? As once the EnableLPIs bit becomes 1, VGIC will start
>> reading the pending bit in guest memory and potentially injecting LPIs
>> into the target vcpu (in the source side).
> 
> I expect some LPIs to hit on source and some others to hit on the
> destination. To me, this does not really matter as long as the handlers
> gets called and accumulate the stats. Given the number of LPIs, we will
> at least test the migration of some of the pending bits and especially
> adjacent ones. It does work as it allows to test your fix:
> 
> ca185b260951  KVM: arm/arm64: vgic: Don't rely on the wrong pending table

Fair enough. Thanks for your explanation!


Zenghui
