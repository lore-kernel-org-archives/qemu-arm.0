Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp9883318lfc;
        Fri, 29 Nov 2019 19:47:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzuVWag8n6mG4EUtLjuHpihg4XMZuTumKmSt+P3kPDyicjkCEAZ7+UYtPObGcijAs5FAmAM
X-Received: by 2002:a05:6402:205c:: with SMTP id bc28mr48844055edb.124.1575085679077;
        Fri, 29 Nov 2019 19:47:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575085679; cv=none;
        d=google.com; s=arc-20160816;
        b=R5sRJ8ctZ3W/trgFAeNy9kcFgUF2E52rvDEP8Rxc2LCr1chD3ExS0GsFQE0zEqsFC8
         Wnw4IE1BdKMIFhTurZZkl5pPWhIdxvjAoDm/TVxmwLAWEFrzXE4SifzraAERkhxsXHw2
         MEym5qwLNo+29E2SuFgI+GgRZ8qXMyx77XhAFigiTzP1GmkQUTXgpl8NAtkLpXDV8HgP
         eD19qVTmndtOZnAhAce9OpWo+iwDqTgFiG8YYtN9skJzX7bUuybkY04briHhnMbK+GY0
         8ydHdMgYmpzSNvDQ3HagO+uhwTENvCz9JB5rXRwqljEFFGyKMGxWZj5jlav/ANNmQjOx
         aT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=fUhnoS0fvy6ItQJG4cPBDS0p8d8ka6GcdP8TOajEPTM=;
        b=tz9rnH/mvTlcAb6rLiaHevOwuBCqMXTxI/O6UVCQpTIRqeApZttUZLJjscmxZ5SZPF
         w3NMUDPF0eeK02P19yF2rLbpf2IM7hbUV+mSKlBysAd2gIeDpPQtil4mImpwlkhMl9zg
         IDdX4Q4Gt2sUkaGXoEipbDDcycjXygVgUAKgq1B8KPaGLrLr/a0eHG1/mbOwDD156hfD
         asbtOgnGRc8MmwHCIMFBroJb9Xdbv6E8qWfAfN3dSKPnKOkmjKA6mW8TzX9x7LB5NNpR
         i778wCIJKDrvvpFRJcY83oMRdZYzrrDLkRJgkhFxVy29oBcZ42VLB+x7/cq8DRPD+w7n
         ofNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si5034298eju.208.2019.11.29.19.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 19:47:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iatji-0002Tc-3P
	for alex.bennee@linaro.org; Fri, 29 Nov 2019 22:47:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iatjY-0002Sy-Ev
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 22:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iatjX-0008Ud-85
 for qemu-arm@nongnu.org; Fri, 29 Nov 2019 22:47:48 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:45896 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iatjW-0008PT-SQ; Fri, 29 Nov 2019 22:47:47 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 113F89A65A6B2CC338E6;
 Sat, 30 Nov 2019 11:47:40 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Sat, 30 Nov 2019
 11:47:32 +0800
Subject: Re: [Qemu-devel] [PATCH v5 0/2] arm/acpi: simplify aml code and
 enable SHPC
To: Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <1552098649-28341-1-git-send-email-guoheyi@huawei.com>
 <20190312170859.73f0de9d@redhat.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <ca5ccc80-663f-83e6-d9ce-4d5e3749988d@huawei.com>
Date: Sat, 30 Nov 2019 11:47:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20190312170859.73f0de9d@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, wanghaibin.wang@huawei.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7/KrCtZrIvVM

Hi Peter, Igor,

I couldn't find these 2 patches in the latest tree. Could you help to 
merge them?

Thanks,

HG


On 2019/3/13 0:09, Igor Mammedov wrote:
> On Sat, 9 Mar 2019 10:30:47 +0800
> Heyi Guo <guoheyi@huawei.com> wrote:
>
>> After the introduction of generic PCIe root port and PCIe-PCI bridge, we will
>> also have SHPC controller on ARM, and we don't support ACPI hot plug, so just
>> enable SHPC native hot plug.
> Peter,
>   could you queue it via your tree?
>
>> Igor also spotted the store operation outside of bit and/or is not necessary, so
>> simply the code at first.
>>
>> v5:
>> - Refine commit message of patch 1/2
>>
>> v4:
>> - Improve the code indention.
>>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>>
>>
>>
>> Heyi Guo (2):
>>    hw/arm/acpi: simplify AML bit and/or statement
>>    hw/arm/acpi: enable SHPC native hot plug
>>
>>   hw/arm/virt-acpi-build.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>
> .
>


