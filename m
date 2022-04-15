Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1344178lfk;
        Thu, 14 Apr 2022 23:14:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcpb1Ccgf/3Jk0VU8EkCF/c3NDGOqQW+SqgOaoqG8IU8AsjwjMAmumciO3Ik8vURl7W1yI
X-Received: by 2002:ac8:5756:0:b0:2e1:e06a:72b6 with SMTP id 22-20020ac85756000000b002e1e06a72b6mr4318819qtx.234.1650003259498;
        Thu, 14 Apr 2022 23:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650003259; cv=none;
        d=google.com; s=arc-20160816;
        b=yUOquY22o9bMq7MKamJyhvxcEPpXNUTyboq6wTG7RVNWaXrPl4S0R5uXfdXp4A2NL4
         s/ZmQ2tInspQzYBX5T4wve8ltRcbKHBCSlYLkUnNEu8IY2eH1njldh5PLRf4YZ32NioS
         xyiZg/w2u7IIoybc8ErNj8NdxmLKpySJUicUcJfr1fXDJdZzlCS4ZgbkugOcqGdoTpEa
         qhKKwEQhsUY8TI46NJ2MuWfxRaEEatEV1rA32WC72uzwfGUhwn0MTZGU/l8PQLFu/rM/
         JbLgZU/ojQGb++Nbt5WFl0mm0ICthtGJMw2iJ8VhX/wa8xMQpB2hwOtZL2dmr0mNomI7
         VNpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=Y2kFeMkOQD8FYRKavrs3YwOQCweUqQ+elnLR6esje7A=;
        b=utc19IJH14cM6zBwqnoP/VD/a8hMJNsGkLc94D5O/AHLo6uhZQN1JSJz9wOOBuHY7d
         jjMlYjnHpsexJraLP8B7b+Kj2+5hZ1fzKNN19Afq9JAEi+xDenf1HJ8FMcQcD+XMcQHi
         9lzNUMo3Z85DG8tSEZ8Yw/1l1A/ZGKBfv9b3Rog4h1ntBomuWYCFrQgabaB4hzxYsPW8
         POZ8sTarP/yFBQ8usGKV6xzlWa8oL4fPyKWBJL0rVmCCUL/1J7GbvJAttNewJ7zgfFgn
         3sL/gTJXNuMEoWxdUffnSqzX83ZhR50ZJWlsL+MzHG/lgeHCP/xYEFNL1sAlbIkRk3NM
         srUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GstaySNT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac84e0a000000b002f1d0377fd7si387972qtw.762.2022.04.14.23.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Apr 2022 23:14:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GstaySNT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nfFDm-0005EN-V7
	for alex.bennee@linaro.org; Fri, 15 Apr 2022 02:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nfFCs-0005E5-Uu
 for qemu-arm@nongnu.org; Fri, 15 Apr 2022 02:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nfFCq-0005P2-U2
 for qemu-arm@nongnu.org; Fri, 15 Apr 2022 02:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650003200;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2kFeMkOQD8FYRKavrs3YwOQCweUqQ+elnLR6esje7A=;
 b=GstaySNTIWVgQVjfLBiieFU/pPKIGIiiO9Ck2DbUXRNNWFdAbK61IfB+29QzEmnfDeM7nJ
 QsTrEavR0rX/DhieMxKWQl37SRyVgV7y0YxgxKBVnp6HdfZgruGAVxJBqVQm3fTI8O6l8S
 Cimn8e7J4B+7YhkzakStYiYUHQ+vcxk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-O3LmHFwmP9a5WeSyhwCBxQ-1; Fri, 15 Apr 2022 02:13:17 -0400
X-MC-Unique: O3LmHFwmP9a5WeSyhwCBxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80AB6185A794;
 Fri, 15 Apr 2022 06:13:16 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC5A1C07F43;
 Fri, 15 Apr 2022 06:13:11 +0000 (UTC)
Subject: Re: [PATCH v5 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-3-gshan@redhat.com>
 <6f713fec-71e6-3300-a504-817f45a82a51@huawei.com>
 <27df8771-ebe0-b5fe-39c4-83696e21e3a3@redhat.com>
 <ea5ab7db-1831-83a5-1719-239930b37571@huawei.com>
 <c49d80af-f68b-1b5c-a808-848172d88f89@redhat.com>
 <f02ae2ce-0256-ac85-0bb7-bd34244d9781@huawei.com>
 <503fb329-8f39-eddb-d05a-729279934fa7@redhat.com>
 <20220414103310.0000356a@Huawei.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <f1bded66-8bf7-815b-2b88-1025a4b7cd43@redhat.com>
Date: Fri, 15 Apr 2022 14:13:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220414103310.0000356a@Huawei.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qWPcc5CU5dv4

Hi Jonathan,

On 4/14/22 5:33 PM, Jonathan Cameron wrote:
> On Thu, 14 Apr 2022 15:35:41 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>> On 4/14/22 10:49 AM, wangyanan (Y) wrote:
>>> On 2022/4/14 10:37, Gavin Shan wrote:
>>>> On 4/14/22 10:27 AM, wangyanan (Y) wrote:
>>>>> On 2022/4/14 8:08, Gavin Shan wrote:
>>>>>> On 4/13/22 8:39 PM, wangyanan (Y) wrote:
>>>>>>> On 2022/4/3 22:59, Gavin Shan wrote:

[...]

>>>>> Oh, after further testing this patch breaks numa-test for aarch64,
>>>>> which should be checked and fixed. I guess it's because we have
>>>>> more IDs supported for ARM. We have to fully running the QEMU
>>>>> tests before sending some patches to ensure that they are not
>>>>> breaking anything. :)
>>>>>   
>>>>
>>>> Thanks for catching the failure and reporting back. I'm not
>>>> too much familar with QEMU's test workframe. Could you please
>>>> share the detailed commands to reproduce the failure? I will
>>>> fix in v6, which will be done in a separate patch :)
>>>>   
>>> There is a reference link: https://wiki.qemu.org/Testing
>>> To catch the failure of this patch: "make check" will be enough.
>>>    
> 
> Speaking from experience, best bet is also upload to a gitlab repo
> and let the CI hit things. It will catch this plus any weirdness
> elsewhere without you having to figure out too much unless you see
> a failure.
> 
> The CI is pretty good though more tests always needed!
> 

Thanks a lot for the hint. I usually use github to host my code.
I will setup gitlab repositories so that the verification and
tests can be automated. Not sure if there is any document on
how to trigger the automatic verification and testing from
gitlab?

[...]

Thanks,
Gavin

