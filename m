Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp896858lfb;
        Wed, 6 May 2020 04:21:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypKueZNUZe6sRfEivtzOgBjEzNxrigXSpbTQgeg3cTnqspQrBkVXlhgzZWwv+Dgpmb5vAFRn
X-Received: by 2002:a05:6402:b47:: with SMTP id bx7mr6189537edb.374.1588764079709;
        Wed, 06 May 2020 04:21:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588764079; cv=none;
        d=google.com; s=arc-20160816;
        b=rNRu/u50P3oahwrVZ3sMi66NMx8VvzNy6fx2+k3wy6aihxzHLJUnXkEk3Hn7GimRZ1
         EEt7kkB4qpcdGNKkIBgL9UDF2zx4WowBWRx2nKIq/OlnJOleaNaOm8ebs3Kwb1FQW3AM
         2CO9D9j6POSciQ9RQqdeQz1FxNcShPdaH8QAV1JzYVGcAy4smNL2+EXPjtRzadTq0ZjF
         V8XuIlhHAQQu7Wry1oxD/ey2UZssIVNwJfjW61OZSIlKrzynAdvY0o7VweX4AdDyj4+G
         +M/DcncWb0HS/tSHxSYMy4VEIz8onTKZxydMeNJECkccXBBowAL4IcfBMrO2gpWH2JXC
         cyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=glwgW5OhDI9AKp1xuZuhyJSovcLa1yJGEmI9ThaO19w=;
        b=pDRd1HwSfiDY517+9fjzWZA9CALIDVyoegNsjbx6hKr9oQ/CvQMVL+ntRZVJ+JgQvc
         6cl0dZuaX92VwyzTC/iiqFCcqGPHJ8isdTxKHvJq9iLstPmEXpBHaLcbWLIDcISEXUmZ
         bpTk6egJS/QcLBen7rQd5gsmkP9i3G+PzKDHJ3BwlnGCl/PuVHTVQ8IqPQCfqISF5cqS
         UCZWRrnP+m/H/h3xVl2IaB/m9FcYiQ4r2D+o+oEJqNFtsOYiayXvEZx8YM14gK3LPC9t
         1MMygefEnzd4L4vi9u7k6FZ/iZvbPYKiaw31aeA0YZ3V7y7eNKI9FOxz1EZiLqeZqwOb
         kj6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id c8si858450edn.240.2020.05.06.04.21.19;
        Wed, 06 May 2020 04:21:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbgEFLVN (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 6 May 2020 07:21:13 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38172 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725824AbgEFLVN (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 6 May 2020 07:21:13 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E25B51C982E0AB317622;
        Wed,  6 May 2020 19:21:10 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 19:21:01 +0800
Subject: Re: [PATCH v25 08/10] ACPI: Record Generic Error Status Block(GESB)
 table
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <mst@redhat.com>, <xiaoguangrong.eric@gmail.com>,
        <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>,
        <pbonzini@redhat.com>, <zhengxiang9@huawei.com>,
        <Jonathan.Cameron@huawei.com>, <linuxarm@huawei.com>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
 <20200410114639.32844-9-gengdongjiu@huawei.com>
 <20200505124446.2972f407@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <85337ce3-4a26-31f1-752c-115fe0f4e558@huawei.com>
Date:   Wed, 6 May 2020 19:20:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20200505124446.2972f407@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: EJGqUg2rwGB3



On 2020/5/5 18:44, Igor Mammedov wrote:
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> Also we should ratelimit error messages that could be triggered at runtime
> from acpi_ghes_record_errors() and functions it's calling.
> It could be a patch on top.

Ok, thanks Igor.
I can make another patch for that after this series is applied.

> 
> 
