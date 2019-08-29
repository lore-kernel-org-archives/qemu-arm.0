Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1558314wrs;
        Wed, 28 Aug 2019 19:48:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzz563O2PzL/OwRGuCfgVSzChmaOBZ6flg6saUHSIDPKDpiBF5hf4jO8lLxayvgdl77UI+1
X-Received: by 2002:a17:90a:18e:: with SMTP id 14mr7348890pjc.66.1567046908063;
        Wed, 28 Aug 2019 19:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567046908; cv=none;
        d=google.com; s=arc-20160816;
        b=0Qmf3yiBwZtRlTEGY5Tj4OxznDqiWyrDUh5QBfsuxEh++i+DN8hOczaJayFZpf4hcV
         ejErCdyITWuxfFNDzr7bq/ROJduoPU/ANahNTGq3FFEdITOdttXRFP3eNuagULobpjwI
         6K5UJ65o6WGSOETMhtnABV7TKy/ozkiRpQqO8BKC/Gw7r78JRHvVD4ec92RNTdAIrSV6
         PA/8HDBveISVSI2mAufLFF5aACkUahhQWETHf1hIaLpPkGKCXR30X7DlYkdLnxhRJ4UN
         Wn3OgIFH59IF9WU5AjLlERvxXGvYYXYtgLyBC3JMC0TVt9i7QoOItewRTHYZl4ae3CmV
         S4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=7cmHEm1Seyy42BWyilQweTAW6/Hv13/PJJWDoxFHLtU=;
        b=VAuaTGsOGJHHQskJuas7z5hx7HZLC0ucGlYmgPEFNjI7nT0oLA+Uz3zaSH9mLi4mUZ
         CRrKH0ELot+8asY/mP1b+0EG9DY81Eb+o9tFTvFJqx+6oJUvTmheBS2V/o6qZjNJw9N8
         T2SsdT5U+yhS7M0NIDpYAo0W/PaqjpNYIk8mTYNFu/vnM57qtK8WnTGziRs602d5WeSE
         B8n/SBWOPVOAow5kZfROeK5t/NDwWnM9VLl/3ToV38FCzxg/7+y8xKRNHn6JB3OksaXg
         aHSpGA2HKLvZRF/8SUWpxmLjlDHGaZApj2p0+x2ydq2oH4HSLxPNK/FoBFh0wfC1DoNa
         p9Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 94si631845plc.407.2019.08.28.19.48.27;
        Wed, 28 Aug 2019 19:48:28 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfH2Cs0 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 28 Aug 2019 22:48:26 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5688 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725993AbfH2Cs0 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 28 Aug 2019 22:48:26 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 7CF3ED78A60A72B8A524;
        Thu, 29 Aug 2019 10:48:22 +0800 (CST)
Received: from [127.0.0.1] (10.184.12.158) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Thu, 29 Aug 2019
 10:48:15 +0800
Subject: Re: [PATCH] KVM: arm/arm64: vgic: Allow more than 256 vcpus for
 KVM_IRQ_LINE
To:     Marc Zyngier <maz@kernel.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
        <qemu-arm@nongnu.org>, Eric Auger <eric.auger@redhat.com>
References: <20190818140710.23920-1-maz@kernel.org>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <47328538-01e6-3152-01f1-ae9c923f628f@huawei.com>
Date:   Thu, 29 Aug 2019 10:46:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
 Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <20190818140710.23920-1-maz@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.12.158]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: E3gGkUECdrJz

Hi Marc,

On 2019/8/18 22:07, Marc Zyngier wrote:
> While parts of the VGIC support a large number of vcpus (we
> bravely allow up to 512), other parts are more limited.
> 
> One of these limits is visible in the KVM_IRQ_LINE ioctl, which
> only allows 256 vcpus to be signalled when using the CPU or PPI
> types. Unfortunately, we've cornered ourselves badly by allocating
> all the bits in the irq field.
> 
> Since the irq_type subfield (8 bit wide) is currently only taking
> the values 0, 1 and 2 (and we have been careful not to allow anything
> else), let's reduce this field to only 4 bits, and allocate the
> remaining 4 bits to a vcpu2_index, which acts as a multiplier:
> 
>    vcpu_id = 256 * vcpu2_index + vcpu_index
> 
> With that, and a new capability (KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)
> allowing this to be discovered, it becomes possible to inject
> PPIs to up to 4096 vcpus. But please just don't.
> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

And tested together with Eric's patches (KVM+QEMU).


Thanks,
zenghui
