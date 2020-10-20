Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4689847lfa;
        Tue, 20 Oct 2020 04:17:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjxADNx9fXLyG+k8pwq5FWBL2AYMrgsHXZgvOBFYOjLFMqIvHvyv2CHIQAgp5i8ByISAVq
X-Received: by 2002:a25:578a:: with SMTP id l132mr2994825ybb.200.1603192676502;
        Tue, 20 Oct 2020 04:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603192676; cv=none;
        d=google.com; s=arc-20160816;
        b=ak8fYn6tcftSCIyfq0RbSpv5AVOjk0m0AgBV5Ozo8wbL4VYuU8DpRecis9MakHOtbg
         657eXLrr+RcpD9OQfFQxEsl6JTfBobZVOsty3+BhDd82ncO7+IPAgGFzYg4RJ/yQSkKz
         kv1LRuo0bQYtCS0EWqvXr9ARp84eBaeVlyKAkh83cm0gSQqhMJt56ORYX9KMS19Z5QVy
         bVe/LtiUaV4fQh6AomXGMh0zx7UkHl5m7YF0tUFWu2D6/SfhwfpLp8XUcGkED6Nr0xID
         VpR6N0sh2KV8MbFVbpiM+LxbJin40hJ9afjVM/IlKucIzVH0IrpNv01IhHwzdNHtsxC/
         u7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=cmrex+g8ahBpEslRFDYkpKJLZyXINAW2wQhObZPRI/Y=;
        b=qyB8/RkcqOuKuGxxHxIM84mhByDqFLQ6YIgS8Pm6OjZnMpLoYQA6IioWU57JeR2Pl6
         vK7gDtpjZOdlmPoxIqY+tgqNpI0iSfmlgpCTHPEmer8K7cBrUsgQcNrsuBYSUEVswGkE
         GsjUpH0wPbZUHjGX+8GJWfwTs7YbxMXrDjtP0C/8ouQOa7nfmQ38RWg7eb/uqj6eZZby
         /UZnfi90jNv4RATV6ntLVsf5Lu5seJ8xGdkj3a7GNSTh+Ed8ZX6qc9NrvK/qVp/XHA3P
         JEUzlZoCpAbO3DISU4HyNuDllIIV48XVqUWl+GWRUTMA3eTr3dHChoSCSKsgRB7l3s3v
         IxVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a37si1688643ybi.133.2020.10.20.04.17.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 04:17:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUpeN-0005Wi-RX
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 07:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kUpe1-0005TR-5i; Tue, 20 Oct 2020 07:17:33 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2548 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kUpdy-0000Fd-Hr; Tue, 20 Oct 2020 07:17:32 -0400
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 49C1CC818518428D0A5E;
 Tue, 20 Oct 2020 19:17:19 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 20 Oct 2020 19:17:19 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 20 Oct 2020 19:17:18 +0800
Subject: Re: [PATCH] microbit_i2c: Fix coredump when dump-vmstate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20201019093401.2993833-1-liangpeng10@huawei.com>
 <786deb83-b6f4-d778-d5ed-19f3901ad211@redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <0c174303-50bc-128a-26ab-c062f98cd6cd@huawei.com>
Date: Tue, 20 Oct 2020 19:17:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <786deb83-b6f4-d778-d5ed-19f3901ad211@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 07:17:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, joel@jms.id.au, xiexiangyou@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n+nAWvO6A+qk

On 10/19/2020 6:35 PM, Philippe Mathieu-Daudé wrote:
> On 10/19/20 11:34 AM, Peng Liang wrote:
>> VMStateDescription.fields should be end with VMSTATE_END_OF_LIST().
>> However, microbit_i2c_vmstate doesn't follow it.  Let's change it.
> 
> It might be easy to add a Coccinelle script to avoid future errors.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

I tried to add a Coccinelle script to add VMSTATE_END_OF_LIST() to the
end of VMStateDescription.fields.  For those who are not defined as
compound literals, it works well.  However, I cannot make it work for
those defined as compound literals.  And Julia doesn't think compound
literals are supported currently[1].  So maybe currently it's hard to
check the error using Coccinelle :(

Thanks for my colleague Biaoxiang Ye, who wrote a shell script to find
the errors, I didn't find other similar errors.

[1]
https://lore.kernel.org/cocci/alpine.DEB.2.22.394.2010201143330.2736@hadrien/T/#t

Thanks,
Peng

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
