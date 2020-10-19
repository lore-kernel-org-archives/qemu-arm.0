Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3921961lfa;
        Mon, 19 Oct 2020 07:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+pIOurq1T0EeenGDk9JlHGqiyNE3db5kshGiCWffEKw2z/PD98uW0AKl8mIpD4ds1bCV5
X-Received: by 2002:a25:c141:: with SMTP id r62mr21327153ybf.519.1603117844242;
        Mon, 19 Oct 2020 07:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603117844; cv=none;
        d=google.com; s=arc-20160816;
        b=spBCqQKwNJg43gFKEgWo9/EOGMR8w6vu3eDfU8gIo/3lqZp5pyF0OP0NHD9zmVhFbE
         6alI82XW0oDPS0zIuedtkKHQv2LCNrwu8BrmYX/cA6+8VxwhMEQOMRvQZmVrUBxvulDq
         o2D05tvIg01qhlb4GpNOhodw7QLDd7D6urYVM7Aqd7PiNYOLdsRSdVcWQM99wC4M58ni
         L5L+UJp4Sj3Qn6FIgMjqIDBIyjhHS6vi9Ya20R/LpA0mZt9HQ9oMNvKXb5MJazHiU6vP
         j7QEAlMRCV6QU910W6OPOBg6m7H/loAnGViXdObyHXoqOct5eCrMQ7/5fyl20N6LDa/v
         DQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=ShPPSslesquohhmLXupCG+SI0DnpYqFfWt5mGppVf9I=;
        b=0eqdiFv3PlI2yj5TU8Xoc1XaOqq/FffdZszfTeVw3Znj1+KUkPpIOjC8j5Ec63POpU
         uzoI51imDRI2aD40e6G2iNZ0ifTnVwrxLzwzuxdRBzlsHq9X4hV/jm7Ec8Si72yH3LN2
         /tnZ49OVZ+EHBmIFpRlhGH5dVA3ffCewcL8T9ylE8iD6FHK1VEqR0Oi8ZV/i+S/tdwBG
         cpiS4DWb1dDrub+Vy0xJ2bdc3YRwVSSylI5Ob6A+EG6wcOrtUaJENxOZDjfAOo/tw8yZ
         kdHLvk3/h/9hJfCvybYGO7QsAtV9YxffuKdNiCXAx26nfE9s2PvMYNS31kzjzmP1UQso
         slJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si126106ybc.457.2020.10.19.07.30.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 07:30:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUWBP-0008LG-L6
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 10:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kUWAz-0008Gl-RN; Mon, 19 Oct 2020 10:30:17 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2942 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kUWAw-0005E8-Ty; Mon, 19 Oct 2020 10:30:17 -0400
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id DFA1D24EDF1DE6C1B84C;
 Mon, 19 Oct 2020 22:30:05 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 19 Oct 2020 22:30:05 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 19 Oct 2020 22:30:05 +0800
Subject: Re: [PATCH] microbit_i2c: Fix coredump when dump-vmstate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20201019093401.2993833-1-liangpeng10@huawei.com>
 <786deb83-b6f4-d778-d5ed-19f3901ad211@redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <def9291a-0ed9-0b47-e32e-53275a7302b3@huawei.com>
Date: Mon, 19 Oct 2020 22:30:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <786deb83-b6f4-d778-d5ed-19f3901ad211@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 10:30:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, joel@jms.id.au, xiexiangyou@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OHo+lu9Dakhu

On 10/19/2020 6:35 PM, Philippe Mathieu-Daudé wrote:
> On 10/19/20 11:34 AM, Peng Liang wrote:
>> VMStateDescription.fields should be end with VMSTATE_END_OF_LIST().
>> However, microbit_i2c_vmstate doesn't follow it.  Let's change it.
> 
> It might be easy to add a Coccinelle script to avoid future errors.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>>
>> Fixes: 9d68bf564e ("arm: Stub out NRF51 TWI magnetometer/accelerometer
>> detection")
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
>> ---
>>   hw/i2c/microbit_i2c.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
>> index 802473982082..e92f9f84ea81 100644
>> --- a/hw/i2c/microbit_i2c.c
>> +++ b/hw/i2c/microbit_i2c.c
>> @@ -83,6 +83,7 @@ static const VMStateDescription microbit_i2c_vmstate
>> = {
>>       .fields = (VMStateField[]) {
>>           VMSTATE_UINT32_ARRAY(regs, MicrobitI2CState,
>> MICROBIT_I2C_NREGS),
>>           VMSTATE_UINT32(read_idx, MicrobitI2CState),
>> +        VMSTATE_END_OF_LIST()
>>       },
>>   };
>>  
> 
> 
> .

Thanks! I'll try to add one.

-- 
Thanks,
Peng
