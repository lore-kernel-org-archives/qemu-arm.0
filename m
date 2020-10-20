Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4695967lfa;
        Tue, 20 Oct 2020 04:27:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpKubB0tJJxy2GAAUU+BT2U6hf3aD7n6wx8ZOSWT9Xf/1vHhWSg2iJ9wmXDIirS28cfJsH
X-Received: by 2002:a25:23ca:: with SMTP id j193mr3229524ybj.520.1603193240091;
        Tue, 20 Oct 2020 04:27:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603193240; cv=none;
        d=google.com; s=arc-20160816;
        b=hZQBp6t3c/ibqVO7MtPWtRgjVmqpdW1FSBIN/In859MMV8Yho/Ev7tlKVGNQ8hmf7/
         4MgaQLqkO1aA/mjxDEyMLm0WMolj8FKDMdpGBQqiSyQZQOa4ES8VGLublsqyVCGFlzT1
         jWs+3Pp3IKiN8pwRd9m5Gd7w9OnOqxjBvaxx+IT3V4b5MTlSZ+oA867B6kUaHaAxqzPs
         byFxFJiYfrUU/PcooMOkQdimmhUkb5qaKWmpj62Sm/G7XVqEVQnmuCa1t71UILfMUSHY
         0Mz4aif1Wjn2nXXGnRhp7Sj3Ldut0AqS49k8fudyuSoOKrnpkS+af5NkiVjrwLh9zf4H
         6nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LP5PNTd9mm9d+qqKCCt6fyeiLsJDCPQtN+P5klOE2As=;
        b=fOQd8IwCXbHObALEGKAKWodzB7ytCDkc0jTd1p1q3eqkwcOqikFtf3aJWGFutX0HwI
         gRD6PSIqUB4Vno9M+C9o9HwMpTeqspL5gNjpOl3goIWdeBfBOR7nZCv564QwQbya7p4K
         MNpDESXLzT81esxXvVYYgsS28mqLLyg4w9Wfu0FwJTGG7pG6jwVyXgdBr3Wop6dYKoO6
         YgfE8xk545Fnqiay6N5FbWk3a9n6hKwmC4uG3vYDKvXqhNvZNwoI2pHDZhDCEN0/pnGL
         nxndKjh7Xw2AiTE5MmSAF6i8dsK7HhvtlFyuQ7wtNugBUskLpUsAWf+m5AQXUffjro8m
         aYSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AN/hZtkG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a91si1499681ybi.165.2020.10.20.04.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 04:27:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="AN/hZtkG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUpnT-0003gM-GP
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 07:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUpnM-0003fy-0y
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 07:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUpnJ-0001ZJ-Os
 for qemu-arm@nongnu.org; Tue, 20 Oct 2020 07:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603193228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LP5PNTd9mm9d+qqKCCt6fyeiLsJDCPQtN+P5klOE2As=;
 b=AN/hZtkGCzfYDjjY+gWRs8iCpc1M7Rvh/pJKaycjddXj5pTZJqvEENN+Ra/gI8ESDPx+Rd
 gmO2cT8966atRWRqGeM+aytJVTCk90S7QHJ31+RVAd/5ZYUEJApQCWD6wo+BxI7wkWFEJd
 +Obs50JFaLN0RJSWcaMwIvTjNi54beo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-XvYnYIrJPgWqUpH8M3QKuw-1; Tue, 20 Oct 2020 07:27:06 -0400
X-MC-Unique: XvYnYIrJPgWqUpH8M3QKuw-1
Received: by mail-wr1-f69.google.com with SMTP id b6so679820wrn.17
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2020 04:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LP5PNTd9mm9d+qqKCCt6fyeiLsJDCPQtN+P5klOE2As=;
 b=eLb0kCazbGT0YrsZ4b6ydMLg5pj7HoQmnBptumsrz/J7Dh8a9F1Bx25CApq7g/6FR5
 17Xqp0nSsrLQl6XYYE7MCkvfgxaAL5CAx4b/M+CdS+TfDioUTBk+OB98Nl4SHBP6N7WQ
 zF6W328fdOkZMsy2qzkyWwMp5/Cm+8mnHPcw7JQHk95sRXCUlvtdX2Iklo3y4rcFfCQ4
 2JhrCBQybLl0Z7FOSTYXflmxcolEC02IATDOPMWFyTHQS8R7Sre9yeKCLgUHYeGcfIKX
 QUEs+/3RExA2kVIZ6Bi+C1xhdpCQOxmcr6PBcoFZN5/AJ8sVRPjkMnxsZ7cj8X437E6h
 +owQ==
X-Gm-Message-State: AOAM531EUy5YzIAy5AIRW/1/YbcKt0TKsZJJFvFkgp/s7DungSVTKh6p
 y8oaBafvl4vD1wFOMgrrBoVY1q2Mh4K69JJF4OYoim3yDYzLfsKMjR3fwY6Pv5Mud6t0Nra6aY7
 WQssyTxzDZ7Ug
X-Received: by 2002:adf:94e3:: with SMTP id 90mr2769040wrr.380.1603193225389; 
 Tue, 20 Oct 2020 04:27:05 -0700 (PDT)
X-Received: by 2002:adf:94e3:: with SMTP id 90mr2769014wrr.380.1603193225144; 
 Tue, 20 Oct 2020 04:27:05 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id w1sm2558382wrp.95.2020.10.20.04.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2020 04:27:04 -0700 (PDT)
Subject: Re: [PATCH] microbit_i2c: Fix coredump when dump-vmstate
To: Peng Liang <liangpeng10@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201019093401.2993833-1-liangpeng10@huawei.com>
 <786deb83-b6f4-d778-d5ed-19f3901ad211@redhat.com>
 <0c174303-50bc-128a-26ab-c062f98cd6cd@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d45ce658-f628-ae9d-1db2-68a14d815333@redhat.com>
Date: Tue, 20 Oct 2020 13:27:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <0c174303-50bc-128a-26ab-c062f98cd6cd@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:16:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 2Y15aCOyrqHC

On 10/20/20 1:17 PM, Peng Liang wrote:
> On 10/19/2020 6:35 PM, Philippe Mathieu-Daudé wrote:
>> On 10/19/20 11:34 AM, Peng Liang wrote:
>>> VMStateDescription.fields should be end with VMSTATE_END_OF_LIST().
>>> However, microbit_i2c_vmstate doesn't follow it.  Let's change it.
>>
>> It might be easy to add a Coccinelle script to avoid future errors.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
> 
> I tried to add a Coccinelle script to add VMSTATE_END_OF_LIST() to the
> end of VMStateDescription.fields.  For those who are not defined as
> compound literals, it works well.  However, I cannot make it work for
> those defined as compound literals.  And Julia doesn't think compound
> literals are supported currently[1].  So maybe currently it's hard to
> check the error using Coccinelle :(

Interesting.

> 
> Thanks for my colleague Biaoxiang Ye, who wrote a shell script to find
> the errors, I didn't find other similar errors.

Thanks for giving it a try. We could commit and run the script
in a gitlab-ci job to avoid such regressions.

> 
> [1]
> https://lore.kernel.org/cocci/alpine.DEB.2.22.394.2010201143330.2736@hadrien/T/#t
> 
> Thanks,
> Peng
> 
>>>
>>> Fixes: 9d68bf564e ("arm: Stub out NRF51 TWI magnetometer/accelerometer
>>> detection")
>>> Reported-by: Euler Robot <euler.robot@huawei.com>
>>> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
>>> ---
>>>    hw/i2c/microbit_i2c.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/i2c/microbit_i2c.c b/hw/i2c/microbit_i2c.c
>>> index 802473982082..e92f9f84ea81 100644
>>> --- a/hw/i2c/microbit_i2c.c
>>> +++ b/hw/i2c/microbit_i2c.c
>>> @@ -83,6 +83,7 @@ static const VMStateDescription microbit_i2c_vmstate
>>> = {
>>>        .fields = (VMStateField[]) {
>>>            VMSTATE_UINT32_ARRAY(regs, MicrobitI2CState,
>>> MICROBIT_I2C_NREGS),
>>>            VMSTATE_UINT32(read_idx, MicrobitI2CState),
>>> +        VMSTATE_END_OF_LIST()
>>>        },
>>>    };
>>>   
>>
>>
>> .
> 

