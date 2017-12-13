Received: by 10.223.159.74 with SMTP id f10csp4620494wrg;
        Tue, 12 Dec 2017 20:09:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBouzW82sqxjp7vlRZFHiGe8qKm6ma1I//sxV0ra6eyJznjH9vTQwrobL5GdbCWPgjQ0PzNOB
X-Received: by 10.84.131.227 with SMTP id d90mr4430123pld.117.1513138178743;
        Tue, 12 Dec 2017 20:09:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513138178; cv=none;
        d=google.com; s=arc-20160816;
        b=aarFtbsFPxp7X2YHZsXBxm2CDlT1CfatoDkfg2yQQvaK3cS3aCzF4ePm7EYiiyiJnk
         JpHLQTik7G4KgDQ+st+gORyTCU9fCy7fS3i4zvYGnSDT7/AUlhdL9uTjS/VpHuWDs3/E
         20ANEFRz1xtLUGWUSmmQYoY9d/KIRtVdBc1Mc8+pAhLTzr4xvpV2zflv/Oa4BwONSMeX
         rGn0ce8xcV873u5cxvJUPN50vZl+xmKkMMPj+fVoQj3GaJFcIZw5VjlF1b999eDF/utK
         YH+4i+q9dx+MmbotVXBHMkiw3dXIgre+sbP3oRX+4eg8KAGK3H+PCtGu16dV99NOZmCx
         VOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:arc-authentication-results;
        bh=KUUK2BeL/QRV+2/w1o3FoOshTObRol8aMfKCx6Rc0rk=;
        b=MIj1zBtVP2TNh6CzFOQA51nKZWLPvoibv5SR/rnxHTi2FF+CH8ws4uAveKrM4pteDY
         tntM9vsbkmrMuNMA7KQKY5YCZzNGC3hJ3R9yfpMKAP2b1Jw91rJWwALGiR9F75SshnXQ
         uC15xp3NA05F8oD28ERwPRUbYTQ/UmxYkv8uylotXVU6TCVZ4B/AI+NWAiv0nmgnpXar
         4pH/opPwNSmdTpCTror0gHI1+2nQ89RtDTcY4l4ZFKivC7hv5QrVu4ARMSc7Ot0PstDg
         tPRH+VaPRf8SIR03JwwvhkFGHtm9bdk0d3AZS+qPryQ91+ypNJyUhXrHYAEUstPjqfyz
         Sj6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j3si584831pld.701.2017.12.12.20.09.38;
        Tue, 12 Dec 2017 20:09:38 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751577AbdLMEJg (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 12 Dec 2017 23:09:36 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:35851 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750749AbdLMEJf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 12 Dec 2017 23:09:35 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 88890A6BC601F;
        Wed, 13 Dec 2017 12:09:30 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.361.1; Wed, 13 Dec 2017
 12:09:25 +0800
Subject: Re: [PATCH v12 09/12] Move related hwpoison page function to
 accel/kvm/ folder
To:     Paolo Bonzini <pbonzini@redhat.com>, <mst@redhat.com>,
        <imammedo@redhat.com>, <zhaoshenglong@huawei.com>,
        <peter.maydell@linaro.org>, <mtosatti@redhat.com>,
        <james.morse@arm.com>, <lersek@redhat.com>, <marc.zyngier@arm.com>,
        <christoffer.dall@linaro.org>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
 <1510341591-22817-10-git-send-email-gengdongjiu@huawei.com>
 <3017b1b9-24d7-565b-1180-a0eb93c6d57a@redhat.com>
 <572b8361-ee14-35ed-6c85-a5e5d8ae5b1a@huawei.com>
 <b948cb25-dad9-ec7e-8406-b829d21cac26@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <7ae2a8e8-93d4-2fdc-c1e5-74a759444d73@huawei.com>
Date:   Wed, 13 Dec 2017 12:09:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <b948cb25-dad9-ec7e-8406-b829d21cac26@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: ZN/jLYg2zCit

On 2017/11/13 16:27, Paolo Bonzini wrote:
> On 13/11/2017 02:45, gengdongjiu wrote:
>> On 2017/11/10 19:32, Paolo Bonzini wrote:
>>> On 10/11/2017 20:19, Dongjiu Geng wrote:
>>>> +typedef struct HWPoisonPage {
>>>> +    ram_addr_t ram_addr;
>>>> +    QLIST_ENTRY(HWPoisonPage) list;
>>>> +} HWPoisonPage;
>>>> +
>>>
>>> Is this actually needed outside accel/kvm/kvm-all.c?
>> Paolo,
>>    Thanks for the comments, this structure is added in the accel/kvm/kvm-all.c is also OK.
>> My previous thought is that this is structure definition, so I move it to a header file.
>> If you think this structure should be added in accel/kvm/kvm-all.c, I will move it.
> 
> It can be done later; but if you have to send a v13 series, I would be
> grateful if you included this change as well.

Hi Paolo,
  I have included this changed in the v13 series, could I can get your "Reviewed-by" after you
reviewed it. thanks so much.

> 
> Paolo
> 
>> thanks!
>>
>>>
>>> Thanks,
>>>
>>> Paolo
>>>
>>> .
>>>
>>
> 
> 
> .
> 
