Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp584887lfa;
        Thu, 15 Oct 2020 06:37:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkJ7q6iJXCRO0vBBSJKF9WFLp2UBs9blp+XxJe1o3kh6WOkmHa1pvi2OCzCDe9iCxk/wCl
X-Received: by 2002:a25:cd05:: with SMTP id d5mr5345973ybf.212.1602769037682;
        Thu, 15 Oct 2020 06:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602769037; cv=none;
        d=google.com; s=arc-20160816;
        b=h0IacsMe6w6Y0keUOBPBOO24gAM+7hEf0gTEIP4cNTIaYa4tnnCHXhZm1IaXeqEbbz
         IIMG5QmGPWiaZ9/wTrwEsWB7fG97vRz+w1z2Z1R7bb2NJmRmagB6B6GUTWJwXeJJ5AzG
         aLKPoJ6JvWocQpTvbEzehxrHkIMRApwdihmV6ht7xm0TVh+P3wUrXbGgvS5lrwYJWFKo
         LGHlbpbXmUIXeGf3FaL2QgbF7F1FTEyOccg5XEgvNSKd4wg7IwPZhj7NYQB3TEufZRDA
         RHTdOygt3TttZrbiT0V3LUzDxB3vJ0Qh7obLZRtTUjIevAzgh5upytILByD4gEeS4KRb
         +quA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=h53FUm/XFWvJg7tMan6BqbY1RKNByClaVBv9J2+lMr4=;
        b=cjBdL0kwR5XXMrtOm8dCU1uymDyK+yh9OvOOFsctPp/Y1RL1NTFcGqcYjdBIfmNl7/
         HMt0am3GYfQuHar/OAl6S4DGcvmU5gI/8O15QXa8zfqJhq6nCBlL3B4WjAL/M22WhZpb
         IqZjAjj3EnSw3lTXMxWdkBE2dfPt0LWWcTJcqHep1ATeeB5/AHlbGyf2ijC82TwloX6h
         u5jhbYXeaF93eqj+8Ba99awA58NnG4ZNxJJDJS6l++uWaOVtkJnPMd1XC8nXa7Ck1gbx
         4iR3JHlGRzKnAMoa4djYyNY4YGEart4vIKiHZCFZilxglMPoKihAYdN6LJJMfMq802xp
         UhaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=abVCo49+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l124si3346942ybc.102.2020.10.15.06.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 06:37:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=abVCo49+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT3RV-0002QN-46
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 09:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kT3RF-0002Pu-Ey
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 09:37:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kT3RD-00007B-9r
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 09:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602769018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h53FUm/XFWvJg7tMan6BqbY1RKNByClaVBv9J2+lMr4=;
 b=abVCo49+ecFu460ZCVwo5pCYdLT1PRDeP19UZ9TqhxC5C2TFXwSp+KO8tN7ooNeXcxY3dM
 sm+TzpAv+s6KJLE3j/6x2WGusFD4r5GzaBqhn2OZdSDatMQO5DKbNlV0G5EJ4Or6zumOM9
 ukGf9Cf9aXOw8LXXPO5dcfr14voAQdI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-zHFvHwJdPP6yCGmXpoOyCg-1; Thu, 15 Oct 2020 09:36:56 -0400
X-MC-Unique: zHFvHwJdPP6yCGmXpoOyCg-1
Received: by mail-wm1-f71.google.com with SMTP id g71so1878662wmg.2
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2020 06:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h53FUm/XFWvJg7tMan6BqbY1RKNByClaVBv9J2+lMr4=;
 b=h/slnvS32xy+R9/3ltPxHmoflmQiqDyhKLOFgpadEM+P1oNmIo1AB9mt00rGgX5/dP
 z33cEmdgwsJjDbUAlu2kzIS0b/dfQilKeqR3BHY2/iODkhBT2o5vV6IvctbO+Fqc+fOB
 D2qAhiQb6r68nLLWG6iWuDCiiUTAqEbiY08RdXF9E5nD4piJ+Za6vSpaN1KEftlvXdx0
 aBZUnE7tFGO33unvLu003JDVYBhTkHwkUqDp9J6i0s9RuqOVKbQmbzR6kN03+el2Td1X
 RcJc6fu+iEGMFLzTXqBfFVzOdcvIZiToHutPVBetsrWRlhs8/gPToabzwarFKR75o8To
 qa1g==
X-Gm-Message-State: AOAM532ovFrvq8kyZW7cE8cU8Ax1L7IwIWT4NGwYoZal2XYeGmutGFkR
 l2+lf07EI6Nb+hSBZg5FBk7j3u1yckaN0eEGedD+vHjyeKoEcUXc93cihsCB4NoK+Eh4MLdBS1A
 Qr/6yndRSlFUl
X-Received: by 2002:adf:e304:: with SMTP id b4mr4208642wrj.141.1602769014351; 
 Thu, 15 Oct 2020 06:36:54 -0700 (PDT)
X-Received: by 2002:adf:e304:: with SMTP id b4mr4208617wrj.141.1602769014149; 
 Thu, 15 Oct 2020 06:36:54 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id x3sm4596096wmi.45.2020.10.15.06.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 06:36:53 -0700 (PDT)
Subject: Re: [RFC 1/5] block/nvme: use some NVME_CAP_* macros
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 fam@euphon.net, alex.williamson@redhat.com
References: <20201015115252.15582-1-eric.auger@redhat.com>
 <20201015115252.15582-2-eric.auger@redhat.com>
 <ca512856-40a7-01a6-ec82-3a5b8c81b52a@redhat.com>
 <e479e77c-9061-22a4-eb57-3997a3a4910b@redhat.com>
Message-ID: <4787ed29-8659-b578-c804-8b27d4551212@redhat.com>
Date: Thu, 15 Oct 2020 15:36:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e479e77c-9061-22a4-eb57-3997a3a4910b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.019, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZKKzknRNF3AW

On 10/15/20 3:32 PM, Philippe Mathieu-Daudé wrote:
> On 10/15/20 3:29 PM, Philippe Mathieu-Daudé wrote:
>> On 10/15/20 1:52 PM, Eric Auger wrote:
>>> let's use NVME_CAP_DSTRD, NVME_CAP_MPSMIN and NVME_CAP_TO macros
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>   block/nvme.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/block/nvme.c b/block/nvme.c
>>> index f4f27b6da7..e3d96f20d0 100644
>>> --- a/block/nvme.c
>>> +++ b/block/nvme.c
>>> @@ -728,10 +728,10 @@ static int nvme_init(BlockDriverState *bs, 
>>> const char *device, int namespace,
>>>           goto out;
>>>       }
>>> -    s->page_size = MAX(4096, 1 << (12 + ((cap >> 48) & 0xF)));
>>> -    s->doorbell_scale = (4 << (((cap >> 32) & 0xF))) / 
>>> sizeof(uint32_t);
>>> +    s->page_size = MAX(4096, 1 << (12 + NVME_CAP_MPSMIN(cap)));
>>
>> Are you suggesting commit fad1eb68862 ("block/nvme: Use register
>> definitions from 'block/nvme.h'") is buggy?
> 
> Buh I wonder how we missed that :/

Since your patch doesn't apply anyway, I might fix as:

         s->page_size = 4096 << NVME_CAP_MPSMIN(cap);

> 
>>
>>> +    s->doorbell_scale = (4 << ((NVME_CAP_DSTRD(cap)))) / 
>>> sizeof(uint32_t);
>>>       bs->bl.opt_mem_alignment = s->page_size;
>>> -    timeout_ms = MIN(500 * ((cap >> 24) & 0xFF), 30000);
>>> +    timeout_ms = MIN(500 * NVME_CAP_TO(cap), 30000);
>>>       /* Reset device to get a clean state. */
>>>       s->regs->ctrl.cc = cpu_to_le32(le32_to_cpu(s->regs->ctrl.cc) & 
>>> 0xFE);
>>>
>>
> 

