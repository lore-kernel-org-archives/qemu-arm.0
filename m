Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4969732wrg;
        Tue, 25 Jun 2019 06:30:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2UCtRDeAnhK4eRw8hpmVmYOSuQD6MBd9n3davKjccAFyvun5IRpgPKZpAGX5HB5v6MN82
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr39610667pgk.219.1561469400315;
        Tue, 25 Jun 2019 06:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561469400; cv=none;
        d=google.com; s=arc-20160816;
        b=JrOFOBpcTHMWGXVLlXRiuILGyugtjmJ/pv7y+3bxxhdLZ45fG0AKzVVWlBeVlRswz3
         B8uuaDh6reDKVGzE6oAtZDB+auJwvBYY0Q72lacw0hSF12TSCQrxXOSHr5nDkX5r0D4z
         ym4EkNtiRtqPNxV8Mf5fXY6OpPw7bEIA4Ka8bFpeqgkUz31xSfojNdB/2Ja/aVPgkk0X
         aOGAhBruo7lkomR8tkSQUSqCD8431q3J939s/zhvpoxTPhP8EEFfGyuxWY3J1FUy5H5i
         KMMowruT+BCCNKdyPFkLAToOaz33EmvaHIxdlox90WjoDAQJRu7TIOxt+87YXsbKDj7y
         M+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=t3ZIBLVovu7NaV7Z5WnYNiZRsJ4GQ6WWzNfUJK4Yow0=;
        b=ZA7q2zHOgw28iuau7bIj2WHFway+FZe19sqQ0JyADKFa6jdRRP6W2S7Ns0RrS5r/dL
         YQ+GsDy+wdRupJAEVGxp/YZCHyIVBdGhr/6cSQLvOU4S72zZIftpPglVDVrRTEUhLjaf
         6MjdM15P+W9cfbfMHpjWZf/rGjKEPuAvK1yORNWsLjepHqbUTIDXdW8ipM2vXncou2DB
         WXjWEt6p5DjjdGpe0OMNeXJmDZmNgyIJsesSlrD+fc53u7TaQUtO5ND1MimVUvxrXVdf
         Bo2mjAFZgaUcSbrkwfR2Q+FRl0GpfmANqpDb1uO1FNF7HZE7bzNF4PXOQC3Yos4VhNOA
         nEGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d30si346330pla.419.2019.06.25.06.30.00;
        Tue, 25 Jun 2019 06:30:00 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729593AbfFYN37 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Tue, 25 Jun 2019 09:29:59 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41044 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726506AbfFYN36 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 25 Jun 2019 09:29:58 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 169C71F4372C443137A0;
        Tue, 25 Jun 2019 21:29:56 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Jun 2019
 21:29:49 +0800
Subject: Re: [PATCH v17 01/10] hw/arm/virt: Add RAS platform version for
 migration
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
 <1557832703-42620-2-git-send-email-gengdongjiu@huawei.com>
 <20190620140409.3c713760@redhat.com>
 <fbd558d5-03b7-df5c-e781-549261207221@huawei.com>
 <20190625151616.12e46566@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <a4b5706f-a8f0-0a20-b77e-4cb250159ccb@huawei.com>
Date:   Tue, 25 Jun 2019 21:29:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190625151616.12e46566@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: bsbjsx0JRkm5



On 2019/6/25 21:16, Igor Mammedov wrote:
>>> In light of the race for leaner QEMU and faster startup times,
>>> it might be better to make RAS optional and make user explicitly
>>> enable it using a machine option.  
>> I will add a machine option to make RAS optional, do you think we should enable or disable it by default? I think it is better if we enable it by default.
> I'd start with disabled by default as it's easy to make it
> enabled by default later and we can't do so other way around.
ok

> 
>  
>>>   
>>>>  }
>>>>  DEFINE_VIRT_MACHINE(4, 0)
>>>>  
>>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt
