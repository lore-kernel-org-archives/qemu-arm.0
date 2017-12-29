Received: by 10.223.134.117 with SMTP id 50csp6377091wrw;
        Thu, 28 Dec 2017 22:28:06 -0800 (PST)
X-Google-Smtp-Source: ACJfBot0byD8dpwYTEl7Ztxx5K4nV+XwAb2VH3rCD6UED/eeIPMlAPd2BGqNjXJFpU4vAFuBitX/
X-Received: by 10.84.225.132 with SMTP id u4mr33470293plj.120.1514528886088;
        Thu, 28 Dec 2017 22:28:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514528886; cv=none;
        d=google.com; s=arc-20160816;
        b=dxHScjsfaR/aFlwbWwqFGubtbz+TZefIWqvDRWpGadJ10N2g99vml7h399utOcq3KK
         +Bs87zU0k/cmzwFY3HCESYACzYoxe2U9RhO12qMJ4yLbr7omsxUsbC9xHSedC3sl5pY1
         qNI4rjE+8L1cdFte8uIQGYt3QAAU5TppBWjw2D8cbBC+Oi3w8k6p205qUfRPfiZMPbHR
         KXTgVPO4GE5CdBp6kMHZfSoA2Q+QPfr5UDsd9pXVF8NUmib3mPHxpO5u+xUoyGjirAkI
         h+WOCO/lYY7WqPVK5m41hE4V3H+4AkDuUFfBHdHq8gFG2LyeT7PamGN8boCeAtyEngUC
         hE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=JXxMTQIzZbYMeia+VVdzLqCUf1zqMCzc0bff3AErRb4=;
        b=cnqsDgLTKTC2vbnUOQqoY80E4GktWg8fYwriZfFtSV26bVaEhsunKw3Qqc+l7JIZeE
         ODpFwvr0JGdXCb0rHi2ic+q9UlyiLxYG05D4FjRzC4kKpyr3dSSw3XKs+JjVAV1mLW5c
         ZDOyk/sj2E+796TYQGZmTxDp3kshuTHGWEUB29eW5nR8aqcqF9jta2Tc4T1PvcuHMnFP
         OOHDAjCKR4yMNv7NfQ1xsxEbUSJO+9Om0fnSfZqMhr6m7djGGu9tYXaVsx+/A3I2soIh
         ZG1IjdNxtH7ibE0SnScDW/lA6ZCS1z33ZZPVyghghbiMKZIKhBjRkCzGRfAYt/ISQuYp
         ncBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id q2si24934860pgp.400.2017.12.28.22.28.05;
        Thu, 28 Dec 2017 22:28:06 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751066AbdL2G2C (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 29 Dec 2017 01:28:02 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3246 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750836AbdL2G2B (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 29 Dec 2017 01:28:01 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 04D63B7ABFF3F;
        Fri, 29 Dec 2017 14:27:48 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.361.1; Fri, 29 Dec 2017
 14:27:42 +0800
Subject: Re: [PATCH v14 5/9] target-arm: kvm64: inject synchronous External
 Abort
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <james.morse@arm.com>, <christoffer.dall@linaro.org>,
        <marc.zyngier@arm.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <huangshaoyu@huawei.com>, <zhengqiang10@huawei.com>,
        <xuwei5@hisilicon.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-6-git-send-email-gengdongjiu@huawei.com>
 <20171228144910.49fad2a9@igors-macbook-pro.local>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <07d9d13d-b1ae-6b6d-52f2-fcf5b2e90da8@huawei.com>
Date:   Fri, 29 Dec 2017 14:27:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171228144910.49fad2a9@igors-macbook-pro.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZPFsjcq4YtQ6

Hi, Igor,

On 2017/12/28 21:49, Igor Mammedov wrote:
>> so user space how to inject it. The test result that injection SEA to guest by Qemu
>> is shown in [2].
> is it possible to inject SEA when running in TCG mode?
 I have tested it in TCG mode, It supports to inject SEA when running in TCG mode. Thanks

 Start vm commands:
 ./qemu-system-aarch64 -m 1024 -cpu cortex-a57 -machine virt,gic-version=2  -bios QEMU_EFI.fd -smp 4 -nographic -kernel Image -append "root=/dev/sda1 \
 console=ttyAMA0" -device virtio-scsi-device,id=scsi -drive file=./linaro.img,id=rootimg,cache=unsafe,if=none -device scsi-hd,drive=rootimg

> 
> it would be useful from testing/verification point of view
> (i.e. we could test logic on non ARM host during 'make check')>
> 
