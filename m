Received: by 10.223.134.117 with SMTP id 50csp11771888wrw;
        Wed, 3 Jan 2018 02:29:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBouXkka6Gqrz6TinYcz7Ug/WqiSroSIXiaMtI/YW4MgsrZrVAU3V6N4UzEO2af8KCvRAU3KW
X-Received: by 10.98.253.3 with SMTP id p3mr1020752pfh.20.1514975390121;
        Wed, 03 Jan 2018 02:29:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514975390; cv=none;
        d=google.com; s=arc-20160816;
        b=z/aySbqiCnYCi9zmsOLLrIK6KjALCK+lC4lsG7UCVt3W7iuCzgzN/SlKqEIkJVQOaX
         wPcg3nnHSXZRp2fhk+Zv1wmgOHXRTQwAZrRdqgK2wkvbaRbac2yvOX4UFp7UEmzboFfY
         hcLbg5sCzpbr3uPb5ouN72pJHXoBXJo0trnxvrGu1fHslkTCFucLQzH78dq33oZxp2T5
         khwYaVOR/qsNq3QRXwJQcUW5wls7mu6DypGHx0l8XmC0tVyR+khAIPDLhGdCDAWJ7NTc
         WBSDTO8txF+WAIy10LpOTImZn1YLCkGRSbhzKf25svi907CJfu32yEKseegBFsggwEs0
         j4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=q0aThbr40gQNcO1lAl2qi2/SJkSAdMXF6WG5RBprUCA=;
        b=NnaUV76X0A6khpjUStwW6QItJrtrCZK3TFmX5QZZd65+nrKrly/cZzjt6cEXwri9Sa
         Q18QpbNu6P4a35Zs1HOF615di0m9WmLMbdrOxWpOwcBsykb5vclo4PXW/GWjup6Eana+
         MUVNGW1uWeUxWf03rb0XU6h6fYgj19WPxH3oTedp4s84giwX6i7aAIkOwnbmNRTLs8dk
         5m63PlKuqlXBfE4/eISNU6OJppbrP7TcNzy5MXaubP8q2r5pTdiMIL/YwdWxVSwK3Pls
         Plt4ooNsiCGfGldSX0azL7t8Q5huQ3WZHEiVsm8ryIoR8AEVoNARJHcfnIiWjWNa8DMX
         7NdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n6si516542pla.565.2018.01.03.02.29.49;
        Wed, 03 Jan 2018 02:29:50 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751207AbeACK3r (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Wed, 3 Jan 2018 05:29:47 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3270 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750861AbeACK3r (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 3 Jan 2018 05:29:47 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id BB4BAD66B618B;
        Wed,  3 Jan 2018 18:29:32 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.361.1; Wed, 3 Jan 2018
 18:29:25 +0800
Subject: Re: [PATCH v14 1/9] ACPI: add some GHES structures and macros
 definition
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
 <1514440458-10515-2-git-send-email-gengdongjiu@huawei.com>
 <20171228132910.6594110a@igors-macbook-pro.local>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <0353f3c1-7863-0e93-82c7-adae36d6a0f8@huawei.com>
Date:   Wed, 3 Jan 2018 18:29:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171228132910.6594110a@igors-macbook-pro.local>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: mXg5Cs/ANZfU

Igor,
   sorry for my late response due to chines new year holiday.

On 2017/12/28 20:29, Igor Mammedov wrote:
>> +enum AcpiHestNotifyType {
>> +    ACPI_HEST_NOTIFY_POLLED = 0,
>> +    ACPI_HEST_NOTIFY_EXTERNAL = 1,
>> +    ACPI_HEST_NOTIFY_LOCAL = 2,
>> +    ACPI_HEST_NOTIFY_SCI = 3,
>> +    ACPI_HEST_NOTIFY_NMI = 4,
>> +    ACPI_HEST_NOTIFY_CMCI = 5,  /* ACPI 5.0 */
> for stuff coming from spec comment should be something like this
> /* ACPI 1.0b: 16.2.5.3 Type 1 Opcodes Encoding: DefReturn */
> 
> i.e. concrete version, chapter/table
> otherwise it could be hard to find definition in huge spec 
Ok, got it. I am modifying it.
Appreciated for your detailed comments.
sure, it needs to be updated.

> 
>> +    ACPI_HEST_NOTIFY_MCE = 6,   /* ACPI 5.0 */
>> +    ACPI_HEST_NOTIFY_GPIO = 7,  /* ACPI 6.0 */
>> +    ACPI_HEST_NOTIFY_SEA = 8,   /* ACPI 6.1 */
