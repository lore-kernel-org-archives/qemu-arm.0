Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1406080lfk;
        Fri, 15 Apr 2022 01:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5EcGte/RBKSlhAB42ANlgQ0WQLW53CgER7/vbqO0l1TPeEWdCE6BHjKbb3KzFb4q0hX5C
X-Received: by 2002:a05:6214:2a84:b0:445:1330:9f32 with SMTP id jr4-20020a0562142a8400b0044513309f32mr14498785qvb.104.1650012731762;
        Fri, 15 Apr 2022 01:52:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650012731; cv=none;
        d=google.com; s=arc-20160816;
        b=0kKZy2wP30M+l7IWw5O8pyxXn3sgX0prgRqKAXX8MqwMN+NynxZD5F/o4JktaFQmph
         MMquGac7v/OIG8EM/fVkdehw5vpnmE4RmxLdkZYD5JjK61H/RgVwOVl7YUpbGzgENSwY
         z5MWlUJu8owR7TlLXb2NOvdCTJKHAXGD/HqyEIxQ4FPxUZ0HGBYV7NEVgkSWnNImhw0Y
         YPbv8ke+RTLX1KWEj/BApRlhRN2Uqg923L+UkWwNme1HYsy7uPnvA4AQx5Bf2xigymcf
         aBWa/uJ9f083rC4dwAtu56ATva10/97ploFRuBvVT7kE6iuMAfY1xbpSVqPeL8TeRD0Y
         qItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=b18SM8opQUdUEyV1FUIuetJ3qRVbje2Xl+H0a1Y4Uz0=;
        b=vIEmW8P/zY9GiI3Csg2/qw165/t5vS8BihzKnDRQQwvjRpvcCPVCjc8J/8OXsqLGEC
         N35L30MqjCzbvGvMqMR9zDEiTKaBdDlmtw8j0p2mqqgG/kGF9XDFoC4l9ksvOlPH4K9p
         UHnpoJFm2Aky9v4/5QXA7B61a3ZdfUTGN+VcMdfJm6lfsnK6qvszWEk1wHBKQ1Oyr5ao
         TnQybSfhxP2mULgWVojC3RcljVdVsRnFnt/pKKzZ0oY7rTXuuDPpG2z7m096J35hUA0O
         fjO2UG1ais7bv3d0iJYJhJItR2VENIO+VfUoz08IvZpOAGi1eRwQmx9NuuYqT3U9VfS+
         OKkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=sMziYcuG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jp12-20020ad45f8c000000b004462ab909f0si359763qvb.272.2022.04.15.01.52.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Apr 2022 01:52:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=sMziYcuG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nfHgZ-0006rf-3v
	for alex.bennee@linaro.org; Fri, 15 Apr 2022 04:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nfHbe-0006bJ-By
 for qemu-arm@nongnu.org; Fri, 15 Apr 2022 04:47:06 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nfHbb-0004Mi-Uw
 for qemu-arm@nongnu.org; Fri, 15 Apr 2022 04:47:05 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9BBD621C47;
 Fri, 15 Apr 2022 08:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1650012421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b18SM8opQUdUEyV1FUIuetJ3qRVbje2Xl+H0a1Y4Uz0=;
 b=sMziYcuGlboS42g5zuKNwpbZGOsb4qbMb5ja1P59baORAY63mTrtdHUPGsgImP6FJLXsSM
 Be1GR/gFdeShhESQmc54+YGCh4Y9ejTkMFyUkZAx1nkfpJlJ8Ly2vOYg9hKApUUj17DwW1
 7e7Gx7ukuKIlvgBFC8DKN8BZMj+jGDM=
Message-ID: <29d36b72-87c4-01fe-b779-b408ada693de@greensocs.com>
Date: Fri, 15 Apr 2022 10:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 3/4] hw/intc/exynos4210: replace 'qemu_split_irq' in
 combiner and gic
Content-Language: en-US-large
To: Zongyuan Li <zongyuan.li@smartx.com>
References: <20220324181557.203805-1-zongyuan.li@smartx.com>
 <20220324181557.203805-4-zongyuan.li@smartx.com>
 <77de88b4-9fb7-d1c6-4f2a-55b7b5cbc9b4@greensocs.com>
 <CADXGpuczVFmWawvm=vUj=-E9oa2OYUj4+cB_bWFpYuR6xLb7AA@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <CADXGpuczVFmWawvm=vUj=-E9oa2OYUj4+cB_bWFpYuR6xLb7AA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: flKIeI5IFvPF



On 4/2/22 04:32, Zongyuan Li wrote:
> On Fri, Apr 1, 2022 at 9:17 PM Damien Hedde <damien.hedde@greensocs.com> wrote:
>>
>>
>>
>> On 3/24/22 19:15, Zongyuan Li wrote:
>>> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
>>> ---
>>>    hw/arm/ .c           | 26 +++++++++++
>>>    hw/intc/exynos4210_combiner.c | 81 +++++++++++++++++++++++++++--------
>>>    hw/intc/exynos4210_gic.c      | 36 +++++++++++++---
>>>    include/hw/arm/exynos4210.h   | 11 ++---
>>>    include/hw/core/split-irq.h   |  5 +--
>>>    5 files changed, 126 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/include/hw/core/split-irq.h b/include/hw/core/split-irq.h
>>> index ff8852f407..eb485dd7a6 100644
>>> --- a/include/hw/core/split-irq.h
>>> +++ b/include/hw/core/split-irq.h
>>> @@ -42,9 +42,6 @@
>>>
>>>    #define MAX_SPLIT_LINES 16
>>>
>>> -
>>> -OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
>>> -
>>>    struct SplitIRQ {
>>>        DeviceState parent_obj;
>>>
>>> @@ -52,4 +49,6 @@ struct SplitIRQ {
>>>        uint16_t num_lines;
>>>    };
>>>
>>> +OBJECT_DECLARE_SIMPLE_TYPE(SplitIRQ, SPLIT_IRQ)
>>> +
>>>    #endif
> 
> Some language servers may complain if we use forward declaration of
> struct and typedef.
> 
> Regards,
> Li

Isn't that C-standard compliant code ?
We have that pattern all over the place in qemu.

Anyway I don't think that bit should be included in this patch about 
exynos4210.

--
Damien
