Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp899274lfc;
        Mon, 2 Dec 2019 18:10:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwebvIl/S6SltM42rXyMnhf+JUw8DdF0NSFVlYoKp2PpOUzs5NXzTnEIWnR9aIrCpkRpbcp
X-Received: by 2002:aca:d15:: with SMTP id 21mr1877494oin.177.1575339012747;
        Mon, 02 Dec 2019 18:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575339012; cv=none;
        d=google.com; s=arc-20160816;
        b=GtGseKCbqapT7+eZJtJpIJu4VaQzbgs5ukrfHAD+974halTPPaq4kBMWOVIgo4Hv9A
         kXD3DL3Dbazm7F8cuXBE/F2fJDf0svvxDyULsCMYJoJYnNnsBW+89nlek/xL2ZCxm4oi
         GkWsQwbVumVxCuacbyh8QCWCNArgBsyWTUyk5vc1/5iwbQ2JmI+/YPAmL4RNYMH3voPZ
         JADVSLX5uGGkj7zSgqex10FN54e3/mhPMT8eXE5H+9lZwRNvUusaiidxrMhCo+dNe9UQ
         SrcUcXbCr259ubKJvFp3BWz9xciKaT8RiBatlKKTZ5lyZ1f2nw32FbuxlCahDYZqAq8P
         STFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=XKbiEYflPFQzBTr1QRFFVRxZbYHjKde561hRDtR2PPo=;
        b=QBPzTBWJXk260n9AcrJDJA4a4dI40TOUrNNBJsihp+A1WCWzwxWe354UyP0X+TATCx
         405Jp/cUpKadnrLPZVCpaTvFSxLqntQGgCqQixcweIfKuKQ5LqdC8Bs8fURfQA5VSakN
         KcFHmqySaW6+Qu85oJOnNZj8tbvwSFunvVhjoJSCACFJFdo0ikam3AimPETIH05jy45L
         vyP9lOQylOlXi9zxxSSTWReMOBzmBgryWNoXuum3VrLDUeItgygFlH83FYZg88ovzmwl
         MtiZgA6EkOX9ex59BuzBC3uPxK/7OzCZd0pQ7jEbxcZAxcgv7gw1Bgqs5y1k0OIlVreM
         wCLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v9si592914oic.251.2019.12.02.18.10.12;
        Mon, 02 Dec 2019 18:10:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbfLCCKL (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 2 Dec 2019 21:10:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7186 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725941AbfLCCKL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 2 Dec 2019 21:10:11 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id AE02B229EEBA8B584857;
        Tue,  3 Dec 2019 10:10:09 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Dec 2019
 10:10:03 +0800
Subject: Re: [RESEND PATCH v21 0/6] Add ARMv8 RAS virtualization support in
 QEMU
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
 <CAFEAcA96Pk_d_T2=GL-QyEBwEXC2fV89K=5h4nEtSHUL0VKZQg@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <2fc18991-ecc7-a59f-c0ec-a39786e2dbf9@huawei.com>
Date:   Tue, 3 Dec 2019 10:09:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA96Pk_d_T2=GL-QyEBwEXC2fV89K=5h4nEtSHUL0VKZQg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: IHvZs/tg8cU/

On 2019/12/3 2:27, Peter Maydell wrote:
>> application within guest, host does not know which application encounters
>> errors.
>>
>> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
>> After user space gets the notification, it will record the CPER into guest GHES
>> buffer and inject an exception or IRQ into guest.
>>
>> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
>> treat it as a synchronous exception, and notify guest with ARMv8 SEA
>> notification type after recording CPER into guest.
> Hi; I've given you reviewed-by tags on a couple of patches; other
> people have given review comments on some of the other patches,
> so I think you have enough to do a v22 addressing those.
Thanks very much for the reviewed-by tags,  we will upload v22.


> > thanks
> -- PMM
> .
> 
