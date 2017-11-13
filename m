Received: by 10.223.150.237 with SMTP id u100csp1969750wrb;
        Sun, 12 Nov 2017 17:50:00 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbBpJIlr5GdkJ4AuFSPOikLdXefCYMVW/3PueyvtjxIrAMYhIO8VNf3neSlZH7AvwBchuOD
X-Received: by 10.84.194.3 with SMTP id g3mr7520332pld.374.1510537799888;
        Sun, 12 Nov 2017 17:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510537799; cv=none;
        d=google.com; s=arc-20160816;
        b=pWS6WLFPFqsK0GL7SXy5SW3wZvJsxCZuoCfbROyPyeF/NrrU7XkD8WNsgTOVBZ3KJL
         M5rCIBCnHnj2tKwv1YdXUImtUZGUM+SeDdK81LSDHOz29BpBDkRGaCdnNUvZNO9Gevaw
         IKKPBTIjP0KTS+7SNgCk5Vz6kzorcMHRkO7w+Ej9hzu1+Nx9CqRodJbxbtz+AqswGfjQ
         mSepVK4XLwS2KolVGt2V9jRgMjko2rc+ofs1OCEJdolIz10wPvkQtRcizdyMJb5EOcK2
         +RTeRaJnTq3lU+1zZ1dl3KBDcv/CzkbiOOLLqNFX5rDslPv/ZiqWU6PX0xLzquBSNwLr
         71lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:arc-authentication-results;
        bh=GVOEmQrDpiCMx4Kn65QyMyb67XF/KDIIF6Ax3/uj5T8=;
        b=ZIGbrC/Mu7XK9tURkF3UPnkJLZLtW57WBJvay0jpqnFoA1oRxxL+ojEa8PkV9+jekk
         8U3dQYxi0VEKS2j6dRQ58nmPG8tkPHI3oB/9mnVM3EDlJA89iOiQ6JAFD7DGI6Z/Xq+3
         aPU40MY9lGHGUSJYb4hzyFVMf4SRfPaODPCIwkj39vMqZGBHTtPWxc8ZGoOx2umh8Cdd
         A+/CK94Ty4PX9q4+1gPcVkMHIOlHJ7Fd4iOYQfurh7gY3kGXN75G8KOHrOzqP/QMTs2k
         VFQZnAsVPln8sfVSW2BbVnBNFqyfPPAbeTSGCww2Cyb26GZeCmnbJgfOud03u8g664LR
         Nqng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si13303998pln.176.2017.11.12.17.49.59;
        Sun, 12 Nov 2017 17:49:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751113AbdKMBt5 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Sun, 12 Nov 2017 20:49:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10524 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751092AbdKMBt4 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 12 Nov 2017 20:49:56 -0500
Received: from 172.30.72.58 (EHLO DGGEMS407-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKV08223;
        Mon, 13 Nov 2017 09:46:21 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.361.1; Mon, 13 Nov 2017
 09:45:10 +0800
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
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <572b8361-ee14-35ed-6c85-a5e5d8ae5b1a@huawei.com>
Date:   Mon, 13 Nov 2017 09:45:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <3017b1b9-24d7-565b-1180-a0eb93c6d57a@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020202.5A08F96D.00D7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 6e1b53a949c9033f339813540263f1b1
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: dq7PY/Nqv3Nr

On 2017/11/10 19:32, Paolo Bonzini wrote:
> On 10/11/2017 20:19, Dongjiu Geng wrote:
>> +typedef struct HWPoisonPage {
>> +    ram_addr_t ram_addr;
>> +    QLIST_ENTRY(HWPoisonPage) list;
>> +} HWPoisonPage;
>> +
> 
> Is this actually needed outside accel/kvm/kvm-all.c?
Paolo,
   Thanks for the comments, this structure is added in the accel/kvm/kvm-all.c is also OK.
My previous thought is that this is structure definition, so I move it to a header file.
If you think this structure should be added in accel/kvm/kvm-all.c, I will move it.
thanks!

> 
> Thanks,
> 
> Paolo
> 
> .
> 
