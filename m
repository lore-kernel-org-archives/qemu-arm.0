Received: by 10.223.159.82 with SMTP id f18csp763211wrg;
        Tue, 21 Nov 2017 06:42:25 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYDT5OlnV8VTcX3wHvDFu0dqxpTie9O3U0Zc4u+p7bwQbYuMW3RcQbrTGQ4ygPK3nzrxk5U
X-Received: by 10.98.31.142 with SMTP id l14mr15553200pfj.62.1511275345840;
        Tue, 21 Nov 2017 06:42:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511275345; cv=none;
        d=google.com; s=arc-20160816;
        b=CKJ1v85hPmL8e9g458J1NbSRd99mGmi66NqJVJX9oCCPAAleQ0lUL2MibZWJ1SXhZm
         lgRxyWBCp6C9PLKuiQmXoo/0sZyASUjd8JED3gZB7O1+7GOGWSZ2bZvwz77nyJPvZIsF
         3ls9YQbe7seHNWJnNAy89EDOGpJ+rvNoU2fF0OXQRmieqktoijxpKSXIfunlxC7QB2Yn
         segTB43bdzW6D6yi7LldYbprYjl9rRJ8d6oInafwXae+3orVWqoWjWptn2BcHeYmt0k7
         9XjCBcFJeVr099lR1S8d7QGd9NJb/vyUT0aua3sL1GRE618r1F3LQ5bB1TSIN8TmmqLQ
         FtDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=i36a0TVsqUkNAOwPsU3Pn7O7xMal3kOjCXR0JDQz4yU=;
        b=bglMDWLoHI++8nEctuswWFIvZy+vEScHNyp//s4br7ckmtuwSawMcekWVJ6gKuY58R
         UUVGyg4UlcZIjyu7Hbo/UabSbzLPMrK3MMxCZk9w/UVmI3JTvwt/tqD7NDCzT0YX5nKU
         kysRADyiBiLxPHYfc2IYXmUtjFCiiHQ4p9P63hjzDHWlbkRxZHv1tcz96ZqQBQsh2C5B
         Ax9HF8IyerNdffdtyShfp/1TSB7eHM/H5EXX/9X3Tx/iddoFYrO06KL/fRLeNeAuWWB7
         67UvMNHZrlB7rjP2sE+E4fy2t7dt8cJiRi3PzasXC0RBDtT35MhBBeRTu8PvkwljE6Bo
         ntUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id bb5si10686108plb.467.2017.11.21.06.42.25;
        Tue, 21 Nov 2017 06:42:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751336AbdKUOmX (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 09:42:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42547 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751221AbdKUOmW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 09:42:22 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 55670DA32C;
        Tue, 21 Nov 2017 14:42:22 +0000 (UTC)
Received: from redhat.com (ovpn-123-123.rdu2.redhat.com [10.10.123.123])
        by smtp.corp.redhat.com (Postfix) with SMTP id E5F615D979;
        Tue, 21 Nov 2017 14:41:58 +0000 (UTC)
Date:   Tue, 21 Nov 2017 16:41:57 +0200
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     pbonzini@redhat.com, imammedo@redhat.com, zhaoshenglong@huawei.com,
        peter.maydell@linaro.org, mtosatti@redhat.com, james.morse@arm.com,
        lersek@redhat.com, marc.zyngier@arm.com,
        christoffer.dall@linaro.org, rth@twiddle.net, ehabkost@redhat.com,
        kvm@vger.kernel.org, guohanjun@huawei.com, lijinyue@huawei.com,
        huangshaoyu@huawei.com, wuquanming@huawei.com,
        zhengqiang10@huawei.com, linuxarm@huawei.com,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        dingtianhong@huawei.com, wangxiongfeng2@huawei.com
Subject: Re: [PATCH RESEND v12 05/12] linux-headers: sync against Linux
 v4.14-rc8
Message-ID: <20171121164037-mutt-send-email-mst@kernel.org>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
 <1511289434-1551-6-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511289434-1551-6-git-send-email-gengdongjiu@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 21 Nov 2017 14:42:22 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: C9kEC5ohvZFG

On Wed, Nov 22, 2017 at 02:37:07AM +0800, Dongjiu Geng wrote:
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> 
> ---
> Address Peter's comments to sync mainline Linux header file in [1]
> 
> [1]: https://lkml.org/lkml/2017/9/5/575
> ---
>  include/standard-headers/asm-s390/kvm_virtio.h     | 1 +
>  include/standard-headers/asm-s390/virtio-ccw.h     | 1 +
>  include/standard-headers/asm-x86/hyperv.h          | 1 +
>  include/standard-headers/linux/input-event-codes.h | 1 +
>  include/standard-headers/linux/input.h             | 1 +
>  include/standard-headers/linux/pci_regs.h          | 1 +
>  linux-headers/asm-arm/kvm.h                        | 1 +
>  linux-headers/asm-arm/kvm_para.h                   | 1 +
>  linux-headers/asm-arm/unistd.h                     | 1 +
>  linux-headers/asm-arm64/kvm.h                      | 1 +
>  linux-headers/asm-arm64/unistd.h                   | 1 +
>  linux-headers/asm-powerpc/epapr_hcalls.h           | 1 +
>  linux-headers/asm-powerpc/kvm.h                    | 1 +
>  linux-headers/asm-powerpc/kvm_para.h               | 1 +
>  linux-headers/asm-powerpc/unistd.h                 | 1 +
>  linux-headers/asm-s390/kvm.h                       | 1 +
>  linux-headers/asm-s390/kvm_para.h                  | 1 +
>  linux-headers/asm-s390/unistd.h                    | 1 +
>  linux-headers/asm-x86/kvm.h                        | 1 +
>  linux-headers/asm-x86/kvm_para.h                   | 1 +
>  linux-headers/asm-x86/unistd.h                     | 1 +
>  linux-headers/linux/kvm.h                          | 4 ++++
>  linux-headers/linux/kvm_para.h                     | 1 +
>  linux-headers/linux/psci.h                         | 1 +
>  linux-headers/linux/userfaultfd.h                  | 1 +
>  linux-headers/linux/vfio.h                         | 1 +
>  linux-headers/linux/vfio_ccw.h                     | 1 +
>  linux-headers/linux/vhost.h                        | 1 +
>  28 files changed, 31 insertions(+)
> 
> diff --git a/include/standard-headers/asm-s390/kvm_virtio.h b/include/standard-headers/asm-s390/kvm_virtio.h
> index daad324..4af18ca 100644
> --- a/include/standard-headers/asm-s390/kvm_virtio.h
> +++ b/include/standard-headers/asm-s390/kvm_virtio.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
>   * definition for virtio for kvm on s390
>   *
> diff --git a/include/standard-headers/asm-s390/virtio-ccw.h b/include/standard-headers/asm-s390/virtio-ccw.h
> index a9a4ebf..967aad3 100644
> --- a/include/standard-headers/asm-s390/virtio-ccw.h
> +++ b/include/standard-headers/asm-s390/virtio-ccw.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
>   * Definitions for virtio-ccw devices.
>   *

We intend to fix these ones. How about we skip the SPDX updates for now?

-- 
MST
