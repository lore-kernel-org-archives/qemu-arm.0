Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF92BCD98CE
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 05:22:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZMFh-0005os-W3; Tue, 16 Jun 2026 01:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZMFd-0005o2-TT
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:22:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1wZMFZ-0001L1-MN
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 01:22:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781587332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZE5nb+ERZyxn1cZ6YOlIOoaYtP0FCJL0L4PNt5yIf88=;
 b=VKDR2l30GsHisJDh+3V1cdCBIpfjcrZlRqgUrhsch3AR3TBTpJmjRZNfBlBuD9Q/EGIfHl
 ZjZz6oqHNiY7/bsaNpQdXoU90KazDF5wnOZixbm7eAX4qfGaoKSoRIGYuqcedE5dTb0kf3
 xbntTEwzQStjfqKdfWMBj2bmsjO54zY=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-CebYSxz4MGiw2GnNrvb7Aw-1; Tue, 16 Jun 2026 01:22:10 -0400
X-MC-Unique: CebYSxz4MGiw2GnNrvb7Aw-1
X-Mimecast-MFC-AGG-ID: CebYSxz4MGiw2GnNrvb7Aw_1781587329
Received: by mail-dl1-f72.google.com with SMTP id
 a92af1059eb24-137fc6f8e9fso4195583c88.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 22:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781587329; x=1782192129;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZE5nb+ERZyxn1cZ6YOlIOoaYtP0FCJL0L4PNt5yIf88=;
 b=U7VwAb0Dz69LDxbIwKe8wlJcQkuShADd05ICsM7tJsnI+3lQonYx3QLQMJTMcgbfK1
 iBjytLT9bQbRtdl3jGoht7tCVlpI6p3cUiD0Gu2n1XVE3hsdFJdEuVurS8iUjrV4yFIs
 RRUhEopRR5Ov5eA8/A+/mCvlmUMDtIyQ8cI2KZuOW3CnZI2iomrLyH7m9Gh4rboSyd+r
 T55+6WZh7qGQtsUG37Onn6HQlXP92OgrJ5ikUeSCSADZwnSLRPA7wh4FYybItA+HtmqW
 TaFT0Wi4m8PZFHjvHb+W0w5NNPQ1sIR3tUQRnJS+3qEf85c1Mbc+lcA2H6KqxLCPsXg6
 VETQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8W6cAYu4vJl2DiEeU3LD37S2ONVKIx0I+vv3zYeOqr0D53eWZjmzwgfewCaxHMvMNchPVbuJUK+g==@nongnu.org
X-Gm-Message-State: AOJu0Yz0XUXdI5CckvUOms8cJBA4Dqhf8a/cmudMPAsBoSjNAut6jBWg
 nXwuFxxn0J9BsEWL83J0IAiD3zMV91agYYFf4lEb7X4JjTUZNOlc5NRhr7pa6/QMOLg4bK/9gVR
 amd6nzug1jCKwQ/CsaxOutWN7LqL0ntEBSQRLfP4TGGrZ3WYBqFd8Kg==
X-Gm-Gg: Acq92OFwQqAMUrO92RQwLSxMtcwKYX7m++yHFoN/S+UH4eFty+dlel88xxU2nLKexKG
 y1COxF1SjMEAXcrPdGDz89pYIA+0iV/MSxpepkPMErUxRYD8kFlnLcytUOOjNCgGIa3438vvUTb
 ScJKRuZNsoLMEYUGYYj5Up8hmVXZPj8J+Bf72AQj7cxELASBiZj5+wzueWIjfmxjzkpPb/sYsNm
 h3PDyE6iFcG6d97PTW0z4Qkia0MkBeCITjCBu3IfXGdg5qFPY/NMOnEwrlVolt3Kh5/BgFBRPxd
 7pxmgngF3feNBjvN3pgEfajBH6DxeOHwRLorrde4H59bGjYS0gonBP2/EA4qpdGSzr8qQwqS2ib
 2IB9vOJ+xWrf/bAI8cheoT14pMm8TdBCvPp6YKo1pRtr7i/iDQSMIqdp0xeTdNXV1
X-Received: by 2002:a05:7023:b06:b0:138:1360:5bc9 with SMTP id
 a92af1059eb24-13985ebcba4mr922931c88.16.1781587329090; 
 Mon, 15 Jun 2026 22:22:09 -0700 (PDT)
X-Received: by 2002:a05:7023:b06:b0:138:1360:5bc9 with SMTP id
 a92af1059eb24-13985ebcba4mr922920c88.16.1781587328545; 
 Mon, 15 Jun 2026 22:22:08 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au.
 [175.34.8.244]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1384b8f9927sm12049489c88.1.2026.06.15.22.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 22:22:07 -0700 (PDT)
Message-ID: <07119a34-d8d2-4e52-b566-267830b51a09@redhat.com>
Date: Tue, 16 Jun 2026 15:21:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] system/memory: Use qemu_ram_{copy, move}() in ram
 device region accessors
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peterx@redhat.com, alex@shazbot.org,
 berrange@redhat.com, philmd@oss.qualcomm.com, philmd@mailo.com,
 david@kernel.org, clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn,
 shan.gavin@gmail.com
References: <CAFEAcA9CT6E8dhEV7Ek6ruT_o2dKUf==2V+U-1WFDOLtYbgeeQ@mail.gmail.com>
 <20260615105556-mutt-send-email-mst@kernel.org>
 <CAFEAcA9Gi43qNZoZcGtq8ioffGwOc_XuhoFAjGx7-bt4U8qfxw@mail.gmail.com>
 <e399ceb9-bc4a-4ba6-8efd-ed2742d0853b@redhat.com>
 <20260615154054-mutt-send-email-mst@kernel.org>
 <22d55870-b521-4002-add7-791bce8ea96a@redhat.com>
 <20260615224658-mutt-send-email-mst@kernel.org>
 <0038f601-7647-4547-a67a-c6a17fae26ca@linaro.org>
 <20260616004924-mutt-send-email-mst@kernel.org>
 <3880910f-4465-46c5-a5e5-daa2f70821d1@redhat.com>
 <20260616010544-mutt-send-email-mst@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260616010544-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tVxOrEzq-anNbVHoB2BfPoyp4JsZEgTm7pgJbSnlt7s_1781587329
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/16/26 3:17 PM, Michael S. Tsirkin wrote:
> On Tue, Jun 16, 2026 at 02:55:52PM +1000, Gavin Shan wrote:
>> On 6/16/26 2:49 PM, Michael S. Tsirkin wrote:
>>> On Mon, Jun 15, 2026 at 09:48:00PM -0700, Richard Henderson wrote:
>>>> On 6/15/26 21:23, Michael S. Tsirkin wrote:
>>>>> B. Also on x86, I do not see why we should not use memcpy for large
>>>>> accesses if we can. Better perf.
>>>>
>>>> We have an example where memcpy writes to the same location 3 times.
>>>> This is not appropriate for any host.
>>>>
>>>>
>>>> r~
>>>
>>> as in, same byte?  could you share the details pls?
>>>
>>
>> This issue happened on aarch64 only.
>>
>> https://lore.kernel.org/qemu-devel/CAFEAcA8dwHV8F48kb-013rxkG9kKcZhym9_qarKmoeUfeh0YWw@mail.gmail.com/
>>
>> Thanks,
>> Gavin
> 
> oh wow. thanks for sharing!
> 
> Still I think for sizes outside of 2,4,8 it's fine?
> That is where the perf is.
> 

For that point, I agree with you that it's fine to use memcpy/memmove
when the length is 16-bytes or more, unless Richard is concerned by
this.

I'm posting (v3) and lets continue the discussion on (v3) series. Sorry
for taking your guys so many time to review and discuss ;-)

Thanks,
Gavin

> 


