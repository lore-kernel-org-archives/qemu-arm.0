Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1993731lff;
        Sat, 7 Dec 2019 04:10:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqxG8kAmJ6GjN33YoWv7NQscQ0HLCLfLuu8/mmdVRASRIIy03uDO9zE16Ls7e01IA2r15qyK
X-Received: by 2002:aca:3a06:: with SMTP id h6mr539270oia.137.1575720648943;
        Sat, 07 Dec 2019 04:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575720648; cv=none;
        d=google.com; s=arc-20160816;
        b=ymIk5GZj+ZA4kqQJzwEvbc71bHcKdA92E7EIijay+Ypjf/nVi+9d2/WQ5YB/sWUuWK
         bZ2B4LW2u2ReziuMSveaJ/qPxuydTULP20m7FDcXIPi7Neqxa13g2Jimgz8tLYeNyju3
         EBnSemEP1bXPMhAm8EM66H2OdJNZ6tEVH0g1s+oJaRYA/8gdyqkt0bXhrClM6ywof5sq
         DpnMN3mtqPyRiEOFmyQHrqK6dh3NSfig7VJ95Re/jQjPU9BdZRaVJwGZcYGVVMX0jSNk
         JqsZFqIbrIU6vgZZzeAC3e06OqF1kQuW3WVahQ0gctc3DgiptiIHoY5UqqgHedJ1X1pL
         rx3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=Ylw/sgWqzVNq3TrNg+iHJvdjkENx4gUv5bKWksIxf/g=;
        b=RArYifJJyM2iviCLY2P3nRc+Sc6mMUoGI7Gf8k0z2eNj88o2KZoPRsqOzHgrr6bHGQ
         +B84RVLQIUjqKlzoTyqqfZBmSicZ/BMHTKcY/2Rr/eP7lFLY+DH2emSWJNFA426UuliQ
         0ug8P4qD64b9w+Z1wJpq2DvxYuLOurno1BvyGjD3o02AqAfub9EVqanTQatleGUdM6o6
         GJ5LMIk+Rihoslcme8xnOiJt5MpcPVtoG7bXoHb3O2mJFsCwPW7O2xOThxScf0UVkeR6
         +VFS22j9OvagIlJ6thMm3ODprLAG4nZNlHgBKnt6mjBrGJvJt2ABtSMZFZbS/8h9CD2z
         FNrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r6si9029633otq.95.2019.12.07.04.10.47;
        Sat, 07 Dec 2019 04:10:48 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfLGMKp (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sat, 7 Dec 2019 07:10:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44466 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726263AbfLGMKp (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 7 Dec 2019 07:10:45 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id BC182A40469D3AC3E506;
        Sat,  7 Dec 2019 20:10:41 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Sat, 7 Dec 2019
 20:10:31 +0800
Subject: Re: [RESEND PATCH v21 1/6] hw/arm/virt: Introduce a RAS machine
 option
To:     Peter Maydell <peter.maydell@linaro.org>,
        Xiang Zheng <zhengxiang9@huawei.com>
CC:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Richard Henderson" <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        "Jonathan Cameron" <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-2-zhengxiang9@huawei.com>
 <CAFEAcA8fkc+0RhOH7780sREPUOaCvE-rpUkwFN0-hwsVD7RiMg@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <8219fac5-107c-32de-e9d2-2178bd8639a8@huawei.com>
Date:   Sat, 7 Dec 2019 20:10:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8fkc+0RhOH7780sREPUOaCvE-rpUkwFN0-hwsVD7RiMg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: A2jk6xhAkO2a


> 
> I think we could make the user-facing description of
> the option a little clearer: something like
> "Set on/off to enable/disable reporting host memory errors
> to a KVM guest using ACPI and guest external abort exceptions"
> 
> ?
Peter, sorry for the late response.
sure, we have already updated it, and will send PATCH V22.

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> .
> 
