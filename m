Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2333150wrs;
        Mon, 19 Aug 2019 00:41:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWLVjIhczrp5/VPyT6dOaCyWtTNyBda/YmR8RCdJzjOHsQ2zr6R3iA8t/jI1tN+bxVlh9A
X-Received: by 2002:a65:47c1:: with SMTP id f1mr18496255pgs.169.1566200519246;
        Mon, 19 Aug 2019 00:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566200519; cv=none;
        d=google.com; s=arc-20160816;
        b=a4PiiqbOhvjsjSIFiSO+mrGr7LIG0nomUtCcFureASatZn4iQ4UDVd+khb4aDS6YCh
         cOwfcl4eoNWoofl2+4J4zZcpO3s5xc3uYW8Jpn/T2TVW4LK53WtnS8xQMiUk1l+dmLSX
         K8LG6smoDhHW/QEVpyYwVNYtD0nPhwm+7btvrZaXE3dXOcByay9IF5i35DQ6ZnxodFOg
         UqxxX99iPddB57WLGFci8DzBK6WqEAJkJ/eAYojuc2Xqm5Yzl6ACIU9jeH+PrKoO9iFf
         H2ee21DmejCFkkm/PZgA18RUvPtU7vakahAbKqQ7NSfjEbEtchR4PySyEgUOx4wbClLV
         4ZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=rWlpIC6nTm9hsxVK8E61ct/HXjrO8FpRdVILXtVnjFw=;
        b=n3AORhyGDn+NLUop2IXomLvAOti7Y8p2hgwZJAApNBEf9iBWrawKWbuYVhXGKYVrmh
         VzcLmMhsAACB3lzO4gYxbwSS017Kxsce2JqU29M+SDhrLz5/t88fuVeMAImdtNQvx64p
         iQ3pLgFqkHxma/cRsnsXgpbIZj/zc3Yt+9fsj/NtTfy4OGCFSy5t0W6WatPa5DnfWw53
         1dirvb78+8sbSQ3ZvGzDHXgzH9deu0xY9s09rhWKCfSu3LYNSnDcroqbLuvl25mEt6NE
         CkfTg6YZP+5fUvIzZDy8qXu/kkhRg/1JtLwuUq0N7xuYv5t2FSrRn3eVxgRKQth9kIm/
         LLSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=Hh2QkeT6;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j62si9331109pgd.170.2019.08.19.00.41.58;
        Mon, 19 Aug 2019 00:41:59 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=default header.b=Hh2QkeT6;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbfHSHl5 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 19 Aug 2019 03:41:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:60848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727091AbfHSHl4 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 19 Aug 2019 03:41:56 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BBBD4204EC;
        Mon, 19 Aug 2019 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566200515;
        bh=Bj5VwIQaJmiMtcxgccis/IQVQu1dOXG6ktRvVZc/tNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hh2QkeT6BWiakhxFyxX9eSPmMkYOaiZFJPreOEHHkevteQ4TsbD9fioIq6IEE6Kfp
         fviD/EiJU+ZfDV/9mNNGA5506rtM8Djweu+6R4NaTOHrtySt0ioPWxKXyDCAvPmZnh
         Dr+0/2szM3Ji0q9d4xn65pL7CbnjsX3M8gGmrsME=
Date:   Mon, 19 Aug 2019 08:41:50 +0100
From:   Will Deacon <will@kernel.org>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, qemu-arm@nongnu.org,
        kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
        kvm@vger.kernel.org
Subject: Re: [PATCH] KVM: arm/arm64: vgic: Allow more than 256 vcpus for
 KVM_IRQ_LINE
Message-ID: <20190819074150.jv3dyyxqazoawgds@willie-the-truck>
References: <20190818140710.23920-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190818140710.23920-1-maz@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: LcnMJHsQucMg

On Sun, Aug 18, 2019 at 03:07:10PM +0100, Marc Zyngier wrote:
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
>   vcpu_id = 256 * vcpu2_index + vcpu_index
> 
> With that, and a new capability (KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)
> allowing this to be discovered, it becomes possible to inject
> PPIs to up to 4096 vcpus. But please just don't.

Do you actually need a new capability for this? Older kernels reject
non-zero upper bits in the 'irq_type', so isn't that enough to probe
for this directly?

Will
