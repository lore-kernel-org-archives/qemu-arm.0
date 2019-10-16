Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6583199wrm;
        Tue, 15 Oct 2019 20:26:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxWAVxo/zmJK/7wtqnVAb6K0cLL/Ip4105s6FdjuWnN1N6si4gmack54K1QVFOTkd+jXYtd
X-Received: by 2002:a17:906:24c9:: with SMTP id f9mr37891494ejb.201.1571196387125;
        Tue, 15 Oct 2019 20:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571196387; cv=none;
        d=google.com; s=arc-20160816;
        b=yxhXoETS2pwNeP20VMv7JnfWeTH/8lmomZLIGHOe/bbSmLbzncIJt70HG7H6iUaJkf
         qDZd5kUFZ4udCGaTqmQhFzBd9ebbfiNvY5YP7pkJ+BDoAkrR5JAjDgRDFogR1x3ryx5M
         SJYv27BTVWbW+eqkzOrmLZdNevaE39D5JvU4UJZkazMQs4I0+l9sGUQ1VXUc1l3jInSD
         J0iP22r7c1KSz4ARRgtNQKlmumg5cB2LnFvLXSXPnWgKN+DFcS+eKJFr0DD5GrvGfzF0
         +TZ8lVOCHbIiiiNUheF1LOvAdLofyKpbkvXiIk0a8YWp5tyWaOUgtLZwZ9WnzYIYDRhW
         G/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=AK+kg8DeZdcbIgmNcA3mo8MmEXgBVYVLFlX8pPs1IK4=;
        b=EC6BcMg2b4oeFdREyDOpAL2uZ/yWx+0rvH9AlwZIzyB95Q1lM97U7017cIU4Kh/LhF
         6ohjEVigDcN733SJcEE9r8prwLKI/fLk6JCVmWgV5HRnUvCQJn+BQV0Q758T4yeHXse7
         +9iZX96mR2LeOKCyhFErBQAbddEb3NjqzyRbKElBc7OPezDGwyQqR0u1JM72d8SABc9W
         7XJPRMaTwIa2TAt4ba1GNG7qCJKExWU6FaZaztjjkV/NUGhSX+PYEohvLl+eheD3JbQc
         gcG8F44MSrH5mIBZfyDoB2spLZmq67QAFTRsmH4ccB8PciiWNDodyq3N7ROMxpE2WEoc
         hbfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h7si14372385ejx.59.2019.10.15.20.26.26;
        Tue, 15 Oct 2019 20:26:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389155AbfJPD0Z (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 15 Oct 2019 23:26:25 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4162 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728871AbfJPD0Z (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 15 Oct 2019 23:26:25 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 83F0FEC8CDB2DA02A902;
        Wed, 16 Oct 2019 11:26:22 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 11:26:13 +0800
Subject: Re: [PATCH v19 2/5] docs: APEI GHES generation and CPER record
 description
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20191015140140.34748-1-zhengxiang9@huawei.com>
 <20191015140140.34748-3-zhengxiang9@huawei.com>
 <CAFEAcA85gZUXnL+Qy=Wdg-MVbb1PqiKWCi72XvRnX8pZsgVr_A@mail.gmail.com>
From:   Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <9724f69a-2887-7896-29d8-3e9aa022df14@huawei.com>
Date:   Wed, 16 Oct 2019 11:26:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA85gZUXnL+Qy=Wdg-MVbb1PqiKWCi72XvRnX8pZsgVr_A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 7rAteKiz5jO1



On 2019/10/15 23:08, Peter Maydell wrote:
> On Tue, 15 Oct 2019 at 15:02, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> Add APEI/GHES detailed design document
>>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>> ---
>>  docs/specs/acpi_hest_ghes.rst | 94 +++++++++++++++++++++++++++++++++++++++++++
>>  docs/specs/index.rst          |  1 +
>>  2 files changed, 95 insertions(+)
>>  create mode 100644 docs/specs/acpi_hest_ghes.rst
>>
>> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
>> new file mode 100644
>> index 0000000..905b6d1
>> --- /dev/null
>> +++ b/docs/specs/acpi_hest_ghes.rst
>> @@ -0,0 +1,94 @@
>> +APEI tables generating and CPER record
>> +======================================
>> +
>> +Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
>> +
>> +This work is licensed under the terms of the GNU GPL, version 2 or later.
>> +See the COPYING file in the top-level directory.
> 
> This puts the copyright/license statement into the HTML rendered
> docs seen by the user. We generally put them into an RST comment,
> so they're in the source .rst but not the rendered views, like this:
> 
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> index 5b43e4b0da2..348825f9d3e 100644
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -1,10 +1,11 @@
>  APEI tables generating and CPER record
>  ======================================
> 
> -Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
> +..
> +   Copyright (c) 2019 HUAWEI TECHNOLOGIES CO., LTD.
> 
> -This work is licensed under the terms of the GNU GPL, version 2 or later.
> -See the COPYING file in the top-level directory.
> +   This work is licensed under the terms of the GNU GPL, version 2 or later.
> +   See the COPYING file in the top-level directory.
> 

OK.

> 
>> +(9) When QEMU gets a SIGBUS from the kernel, QEMU formats the CPER right into
>> +    guest memory, and then injects platform specific interrupt (in case of
>> +    arm/virt machine it's Synchronous External Abort) as a notification which
>> +    is necessary for notifying the guest.
>> +
>> +(10) This notification (in virtual hardware) will be handled by the guest
>> +    kernel, guest APEI driver will read the CPER which is recorded by QEMU and
>> +    do the recovery.
> 
> Sphinx thinks the indentation here is not syntactically valid:
> 
>   SPHINX  docs/specs
> 
> Warning, treated as error:
> /home/petmay01/linaro/qemu-from-laptop/qemu/docs/specs/acpi_hest_ghes.rst:93:Enumerated
> list ends without a blank line; unexpected unindent.
> Makefile:997: recipe for target 'docs/specs/index.html' failed
> 
> That's because for an enumerated list all the lines in the paragraph need to
> start at the same column. Moving in the two following lines in the (10) item
> fixes this:
> 
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -90,5 +90,5 @@ Design Details
>      is necessary for notifying the guest.
> 
>  (10) This notification (in virtual hardware) will be handled by the guest
> -    kernel, guest APEI driver will read the CPER which is recorded by QEMU and
> -    do the recovery.
> +     kernel, guest APEI driver will read the CPER which is recorded by QEMU and
> +     do the recovery.
> 

Thanks, I will fix them.


-- 

Thanks,
Xiang
