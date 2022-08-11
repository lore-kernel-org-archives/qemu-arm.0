Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp344382ejf;
        Thu, 11 Aug 2022 00:09:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+vmOWq5eReCSFms9fiPsZhHuFe5wEWb9YfBn39WhrEoQ16Rm2TNET29SMeTLxKvCCY8gh
X-Received: by 2002:a05:622a:5cd:b0:31e:ea4a:d754 with SMTP id d13-20020a05622a05cd00b0031eea4ad754mr26569421qtb.447.1660201745167;
        Thu, 11 Aug 2022 00:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660201745; cv=none;
        d=google.com; s=arc-20160816;
        b=pYdwORmC2nndvck/N7k9jUC2Z8B4DE03AoSaEyGtPbpfcYP2Fxgi55vTmrA5laCzpC
         l13vt66ztyrQWVsa2MSlqTAPlaSplhOOHzK1LkQzRyLt8EQ9wRzzmkoQdfY5+5uGly+g
         V+6lSGgfe6E06dET16X1Wo8yJfWtDwgbrGWL+JcsIGD7lj2IoeluT8wMvX1I09ylbfhj
         vzLRzm0GFnud6NPvO5xY7YF1z2euVjCA1/bIKwPBozor/wBs6D3Do6kRHiXIFGrE2g/R
         eeBtle5lPIB0gox2fdQ0pg/+4fS+YVOreUU25XMlk3eXxX5f5MATS4wNyOUAem06NJBq
         t0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=bNhS9HUYK+18zv2UyQkdwYvyu0yBM77I/wlxg4dvf7M=;
        b=Izp4R4O02G+63iIKGZ0OOtw3ANAtqZ0eU7+m1o4LDWv9U+nqTrWV2V3upnIWv/Kt7N
         LxXQSkITiXb39adGr/lAg9PMd7UCb3a7nPbgTfefvvX0m3YQ5Qi7xvsLA0TfASXgBYZS
         ALv4khki0/udiz3z7TAwBGReEsKCRFDJWmEez8avVsrYVeaRnXJmc7OoV2bkViSDx3lw
         G21aAOQHofRvb5E36Mnj7U9I8TeR1/nR3YM3PHecmycfyk4PYQ1SX8Yf51plydHvV+FD
         yIWUh9XeqGOa3Fb/w37kaCGawio+IynHXJ2eK+0Tch8CTZuADqe7wl00yFMw/EjBEfD6
         ZNaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020a05620a404500b006b9c0382486si1265419qko.611.2022.08.11.00.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 00:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oM2JU-0001pK-JY
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 03:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oM2J2-0001mU-Nv; Thu, 11 Aug 2022 03:08:38 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oM2Iz-0005n3-QS; Thu, 11 Aug 2022 03:08:36 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4M3Hr55sDNzjXjN;
 Thu, 11 Aug 2022 15:05:09 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 11 Aug 2022 15:08:22 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 11 Aug 2022 15:08:21 +0800
Subject: Re: [PATCH v6 24/24] target/arm: Define neoverse-n1
To: Peter Maydell <peter.maydell@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
 <20220506180242.216785-25-richard.henderson@linaro.org>
 <1d915529-cd32-82b3-42ad-4d202d3590d8@huawei.com>
 <CAFEAcA-FQ3W78c=kwzZZ=wCuCbPWO=9vxG7ge4wnEZR6qBGHVA@mail.gmail.com>
Message-ID: <448f3df1-a306-86a5-cd32-01f403e12b39@huawei.com>
Date: Thu, 11 Aug 2022 15:08:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-FQ3W78c=kwzZZ=wCuCbPWO=9vxG7ge4wnEZR6qBGHVA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-arm@nongnu.org>
X-TUID: VhjOE2cKIWtG

On 2022/8/11 0:47, Peter Maydell wrote:
> On Wed, 10 Aug 2022 at 14:14, Zenghui Yu <yuzenghui@huawei.com> wrote:
>> The r4p1 TRM says that the Neoverse N1 core supports SPE (the value
>> of ID_AA64DFR0.PMSVer is 0b0001) but do we really support SPE
>> emulation in QEMU?
>>
>> The guest immediately received an unexpected exception (with EC==0,
>> at EFI stage) when I tried to boot it using something like:
>>
>> /path/to/qemu-system-aarch64 \
>> -M virt,gic-version=3,virtualization=on \
>> -cpu neoverse-n1 -accel tcg \
>> -bios QEMU_EFI.fd [...]
>>
>> and QEMU shouted that "read access to unsupported AArch64 system
>> register op0:3 op1:0 crn:9 crm:10 op2:7", which told us that the
>> guest attempted to read the PMBIDR_EL1 register.
> 
> No, we don't emulate SPE. We should probably not advertise it
> (we might do a no-op implementation eventually).
> 
> What guest is this ?

I guess basically anything that starts playing with SPE. I used Linux
and both stable-5.15 and mainline kernel can't boot.

Zenghui
