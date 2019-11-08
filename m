Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp2188760wri;
        Fri, 8 Nov 2019 00:11:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqy1tFqfMHi5C+CmAdVhQSgo6o0tMY0qbI/2iu9N/EBYCMXbywygMO1p9pQwqdM/1HKkJPHc
X-Received: by 2002:a17:906:c801:: with SMTP id cx1mr7491370ejb.266.1573200690062;
        Fri, 08 Nov 2019 00:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573200690; cv=none;
        d=google.com; s=arc-20160816;
        b=yq4rzNI+DZ+P18zruJTQbTmAKV7do8zwK8wZ0Mx/XucYUwnf1sif2QTaajmLW0G5mY
         Wg+y6PqNhYeGyDFj7Zk/ZuWCp72o//u8fxQLzsPrLm2KFrguvjqiNqqnGYrIi672vH3n
         dvghTJ6fKHxv+jQ8cNqn6cSe8lXbmdRcRShQQPJj8ejbh/WRjSlswSPSi7nDu3fR6V7a
         qk0auWSWCY1yh4ExS7w5ZamOvQtL+XABLvmXgzmtFbvuGdbdP/uLJ082jX+irHVrWjI6
         Hl8mlMkFvqLthbzfCZvY0doKD3AHqrOkDMErMWJlkph2qDmkbM1hcQO+m85GGnN+EJeA
         9lyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=3qKEx9ErzmcGFScSe99yGFheuPO8ezWieYlgByTh+4k=;
        b=nsq8UJ9lRkbbO4ydKVyjg+12UmMU/HaAiZYi0UsVzp9dMW3CyW3n7Ewho4cfvFNjAv
         CVmc8wxez3MAYJoFeleBNV2xCBWuhlJFMIcDfhh56V+iZOsuh5yXYhpDDYnnXAwio+he
         xDqTd9Dhzivn2zJY2rUNpQX14BB5CPlB1tShgX/+UzhlT4tT9YCbSAIgsgrLljeZaxtw
         jEQZaxcEZMLNJ1agvWl8RyIi410Jb3/za/aBtNus7S21I4efMSJZD7mPsmyh145d5sM7
         j1K4WNiQxD8Uw/YFeIgG6oXFp1GlB2on68x8udmmoona4C/oMxcv/XqRKnQum73fmD2H
         omrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v19si3217467ejx.308.2019.11.08.00.11.29;
        Fri, 08 Nov 2019 00:11:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727459AbfKHILZ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 8 Nov 2019 03:11:25 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:5747 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726072AbfKHILZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 8 Nov 2019 03:11:25 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0B11D5CF9E69D6D25DA8;
        Fri,  8 Nov 2019 16:11:24 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Fri, 8 Nov 2019
 16:11:14 +0800
Subject: Re: [PATCH v21 3/6] ACPI: Add APEI GHES table generation support
To:     Xiang Zheng <zhengxiang9@huawei.com>, <pbonzini@redhat.com>,
        <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
CC:     <wanghaibin.wang@huawei.com>
References: <20191104121458.29208-1-zhengxiang9@huawei.com>
 <20191104121458.29208-4-zhengxiang9@huawei.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <3068b1f2-7175-485a-a9a1-dcba0bf82dea@huawei.com>
Date:   Fri, 8 Nov 2019 16:11:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20191104121458.29208-4-zhengxiang9@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 7vEowp4PCCdg

On 2019/11/4 20:14, Xiang Zheng wrote:
> From: Dongjiu Geng <gengdongjiu@huawei.com>
> 
> This patch implements APEI GHES Table generation via fw_cfg blobs. Now
> it only supports ARMv8 SEA, a type of GHESv2 error source. Afterwards,
> we can extend the supported types if needed. For the CPER section,
> currently it is memory section because kernel mainly wants userspace to
> handle the memory errors.
> 
> This patch follows the spec ACPI 6.2 to build the Hardware Error Source
> table. For more detailed information, please refer to document:
> docs/specs/acpi_hest_ghes.rst
> 
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>

Hi Xiang,
   please add "Reviewed-by: Michael S. Tsirkin <mst@redhat.com> " which from Michael, thanks.
