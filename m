Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp616968lfq;
        Tue, 5 Jan 2021 23:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2n/9K02M8mySKLFa212IhFrRimzN+IV4ea699G55tXmiofmneuYrzqffZFg/gn1u3nDxQ
X-Received: by 2002:a25:b341:: with SMTP id k1mr4377590ybg.37.1609916879154;
        Tue, 05 Jan 2021 23:07:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609916879; cv=none;
        d=google.com; s=arc-20160816;
        b=P4bJVhCPQWSCu6IdkP5HpcHeE9UgYt89ySE08BC+4YCylnBAtNGjvhdjqwu2vaMNoe
         5y2YGE1Hr+MtZyOB7Ks0Sder7V3Y+idkLjWjg7l5pHCcrkQTMcr9Ygpe0Gi56X9thB05
         U/0G94gF8PxdRD/Y8JFBkd5sNDNl30RXtKtrfMJR/XkCWHIDsfYEKIeBhv8LL2QUwFhX
         sdjqR6P38dgQZiZBvZKjUpYbehJkFFr4E4N9EevNQRFDrgoNkvKvihhaoImthySQKDtP
         bRi3QY1b+90+EZFx/+rrbYODbrgEdlBqAOdBP2elGNVRb3cj+gUwS5VfLv7NuPooBguX
         igbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=3LAkGkvAKzXQfhOImdR8oz4Jwoc5fEK6IoeEKmObH00=;
        b=GB83BGQsJ5HH4CZjlzep0R6TvJr1MMitBz5SFaHitxVT4LH/7XMOooJ2oRp3Mp7EDW
         e1KYkxG0LJBk5UvmfnLQ6yQ3FP0wrgrwmoyxEv+7le3sUhLDLfR7h5KgS0mE8RO2XCD7
         xDWJagb0bTiLuX8Bi62nbkXoM5J8gREgOWOpWoOFw0NmX5dRxrj8MFTeq2fxwLm3bZUc
         SkSGytayH1YPe0p8kiWymAb32bgDuraS7902BKZc8ka/v+pGzDRlgfnDarwwpO/y0b3X
         2CAMLNPN8nOXHk/sT3HYhgeQzcOJl438BOQGDH3wnvqpXHaLrPGwLXqXHXtjRYh5YgIz
         cw5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si1881529ybr.32.2021.01.05.23.07.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 23:07:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kx2vG-0004fD-I8
	for alex.bennee@linaro.org; Wed, 06 Jan 2021 02:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kx2v3-0004f0-HY; Wed, 06 Jan 2021 02:07:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kx2uy-0004F3-13; Wed, 06 Jan 2021 02:07:45 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D9gQD5RSpzj392;
 Wed,  6 Jan 2021 15:06:28 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 15:07:13 +0800
Subject: Re: [PATCH v2 0/2] accel: kvm: Some bugfixes for kvm dirty log
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <6c1a62af-1aa7-cc7f-28de-9761d88faa8f@huawei.com>
Date: Wed, 6 Jan 2021 15:07:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201217014941.22872-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kKYdcP4pr16T

Friendly ping ...

Hi, please queue this well reviewed series, Thanks :-)

Keqian

On 2020/12/17 9:49, Keqian Zhu wrote:
> Hi all,
> 
> This series fixes memory waste and adds alignment check for unmatched
> qemu_real_host_page_size and TARGET_PAGE_SIZE.
> 
> Thanks.
> 
> Keqian Zhu (2):
>   accel: kvm: Fix memory waste under mismatch page size
>   accel: kvm: Add aligment assert for kvm_log_clear_one_slot
> 
>  accel/kvm/kvm-all.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
