Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp5995473lfc;
        Wed, 27 Nov 2019 03:17:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOV+XYmvb1FyNxOD9lZHNM28JxevncjDyTB3nMbvI8W3TWC20wVGLBf+bzGo0Lw5m+ZgL6
X-Received: by 2002:a17:906:68d9:: with SMTP id y25mr49074444ejr.136.1574853423030;
        Wed, 27 Nov 2019 03:17:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574853423; cv=none;
        d=google.com; s=arc-20160816;
        b=iqzT4Aa3dSN99XxGYOPsZDPWQ8n3DwL61Y1OrAk+MzLboy/5vH/rkqiU6g0ilDKvsR
         F3IWvZdw5aVDjgyo14pXPJfSVrCzt7l3pWzQFP2YqkdVVM0clH7s+O9ZJM4PsJqlzuYb
         xVjRjCc9QqTo1e6oDWn+s8BhvYxpBClFIVFiPlNL1JA0NbQ8u61vAuhK0GZC9BtVqAHJ
         PTqYDnlOMurnOyN5/e1OSLDKWsk/ai8xeJhhMvFmfDg1iuB0eN33ClHcIRzbbJ+jvkih
         L73/16nwPTu4pRnnpnsOgZ7QqGbmCK3Hmvk/khLOYUcX0PXphp6tpkB0n0kuItC9MFZP
         5YdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=UcAZ1slMh8oz1XpH+oy5l1FYwbQNO5ZZAUElyjYYH1k=;
        b=yhpiyw/IfknYOU2ISHfmukzvfOHtz2IVm7vB0Lxtsqy2N2tYyDNN+Fcrb2WVIVah9J
         aEIbqRkWwd9Efw7C/HOdwH2L7Du+eVbNPqX3VvsF+68QK+HMOJh8mxkY3eMUp1J5jXE6
         n884s5+AvR7abysLbdawooCMB18e2hQTOjz6fG4EOMjCgXL0hCYJQpZagmO+7AKyZj0s
         bZqCbNAY1RdGWiqRWLvpgderuGSciWEUpEYdWPF/fwL9i2gpzoYDBwerZOEZcp8/KiQP
         dofXJkUZqtkz3MhU/FZ5l3AohGAhpUbxF5QBDIafIMVC6k0qpecc9gD/4Nnp6BkZ+ghy
         i0Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id w12si10500402eda.292.2019.11.27.03.17.02;
        Wed, 27 Nov 2019 03:17:03 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfK0LQ6 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Wed, 27 Nov 2019 06:16:58 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:48838 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726219AbfK0LQ6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 27 Nov 2019 06:16:58 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 03EDC2BFAB609FA68735;
        Wed, 27 Nov 2019 19:16:55 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 27 Nov 2019
 19:16:48 +0800
Subject: Re: [RESEND PATCH v21 3/6] ACPI: Add APEI GHES table generation
 support
To:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
CC:     <peter.maydell@linaro.org>, <ehabkost@redhat.com>,
        <kvm@vger.kernel.org>, <wanghaibin.wang@huawei.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <linuxarm@huawei.com>, <shannon.zhaosl@gmail.com>,
        Xiang Zheng <zhengxiang9@huawei.com>, <qemu-arm@nongnu.org>,
        <james.morse@arm.com>, <jonathan.cameron@huawei.com>,
        <pbonzini@redhat.com>, <xuwei5@huawei.com>, <lersek@redhat.com>,
        <rth@twiddle.net>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-4-zhengxiang9@huawei.com>
 <20191115103801.547fc84d@redhat.com>
 <cf5e5aa4-2283-6cf9-70d0-278d167e3a13@huawei.com>
 <87758ec2-c242-71c3-51f8-a5d348f8e7fd@huawei.com>
 <20191118082036-mutt-send-email-mst@kernel.org>
 <20191125104859.70047602@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <6a4bcef4-41f2-af5d-3cce-75718da23719@huawei.com>
Date:   Wed, 27 Nov 2019 19:16:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20191125104859.70047602@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: DvJOpAGs4I+8

On 2019/11/25 17:48, Igor Mammedov wrote:
>>>    ......
>>>     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
>>>         ACPI_GHES_ERROR_STATUS_ADDRESS_OFFSET(hest_start, source_id),
>>>         sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE,
>>>         source_id * sizeof(uint64_t));
>>>   .......
>>> }
>>>
>>> My previous series patch support 2 error sources, but now only enable 'SEA' type Error Source  
>> I'd try to merge this, worry about extending things later.
>> This is at v21 and the simpler you can keep things,
>> the faster it'll go in.
> I don't think the series is ready for merging yet.
> It has a number of issues (not stylistic ones) that need to be fixed first.
> 
> As for extending, I think I've suggested to simplify series
> to account for single error source only in some places so it
> would be easier on author and reviewers and worry about extending
> it later.
sure, thanks for the review, we are preparing another series which will fix the issues that you mentioned.

> 
