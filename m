Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1108138ejb;
        Fri, 17 Mar 2023 10:37:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set+wXJ/cxj/L9fFPYFHYUgBYRIREIATvijSn78Gbu47YISPz1cifPClMb5dZqBfaGTawlX/2
X-Received: by 2002:a67:edd6:0:b0:412:ac6:57c7 with SMTP id e22-20020a67edd6000000b004120ac657c7mr607860vsp.13.1679074620677;
        Fri, 17 Mar 2023 10:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679074620; cv=none;
        d=google.com; s=arc-20160816;
        b=Sy9dP5I19nmKBPI43WGYD1xkH3wWb+frSEaRMm04FUW2S2tDrP5pfBtIx5EsmRKSxb
         IDyXIXPRur9dPmDPrS88JqXiUWm9nm8cve9iMoIfUTEsPgaGc4+qmi1snP3c6F5PGRgR
         4zCTUKGFRhmyyIsJQz0gQr61DsPe37U5w3QPWRcjWQ9v0hMXZO8pjDJxppd3HGyjLTyn
         Zsubwj8p35SQvfy6phFMGDEPazujhNWjuhP2QB4SbpVU5MW+pwMJHCMhLHkpPDrPr4dI
         yWo1roQMtpcuf30CrIB73X5BBEIr+LMmSizY8ygG4AkBzdQMBbKBmzlqE3jji7LRKFh1
         1v2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wvJ2Bj5igWJHkhlKgwXphX2XEEepvMEsNXVHe8pcWJA=;
        b=SYsvnIokgKNaxkAyBjKedR7yqv+f+qTektVCjNtgpQu2oSmkz4pWMp0+PzgccMaEBy
         OyKkcxD8zqmjfQL9Nn+q4dmAAGy2+p0TsVHnreaos/Jcako6OIqhQTKsgy3QyK8qCHah
         jfeBmA6C6nJuQwaFl1Kc9cZKSqGcgiG4soup4ZNNGHiDlbRpVlgYCZUVfNQCW45UsQcy
         jRe4SzIq+hGdxX6uueeRwq4ap4wS/Q/qV7JIjFnWLxjSvx+xX3LDeeQmEXiT6ftMb/9Q
         cdBxgpw0Js+5lXhG7Uqu9f1mAY8fQISIcYSTLKL4ajGcwwR38evrUOKPJk8OHgEgDq1r
         /9+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fa71TTKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12-20020a67cd8c000000b00425bfba0cf9si830421vsl.510.2023.03.17.10.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Mar 2023 10:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fa71TTKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pdE0F-0006cA-2q; Fri, 17 Mar 2023 13:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pdE0D-0006bj-MU
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 13:36:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pdE0C-0005MH-31
 for qemu-arm@nongnu.org; Fri, 17 Mar 2023 13:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679074587;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wvJ2Bj5igWJHkhlKgwXphX2XEEepvMEsNXVHe8pcWJA=;
 b=Fa71TTKUGyOsNnHwzV+EJW5cTjMJju7Sxlu/GOYqTam3poPZW7jDrmW/Xu0vcEZE8V2xxD
 OOXMzTG5nqwwIT9c8TULRDw7DhkFix9TaJJuQwmIz1QZ6oLRkccQSClIHP0QXVrbm07tY5
 C28TQgdQF4JXrXj46YtEr8q1gtQ0wh4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-p5rLG8DkNXq7E-pqhnp7Vw-1; Fri, 17 Mar 2023 13:36:26 -0400
X-MC-Unique: p5rLG8DkNXq7E-pqhnp7Vw-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so2549814wmb.8
 for <qemu-arm@nongnu.org>; Fri, 17 Mar 2023 10:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679074585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wvJ2Bj5igWJHkhlKgwXphX2XEEepvMEsNXVHe8pcWJA=;
 b=ZCxXEM4LBh/v8R0Qs0gD3+1oHdfXfMmfdAJKOC7/r32YCOjHWlYm4q2VbQap00klVq
 fc+5EAJ4CQS2IYsOjSj650+mAlg27Fvh+scex11PshTvsb5MG94Oc2GO5bTJUFrynAtn
 qGvCh43a5vksAy1br5+SFQpN0vSpRQ3c6CdvMnVDX7Jc21ubUAe6XBjtOrqkcoqizdC7
 fY0kCsojguXotIcgZFUsR/FeLml8V22wpIU0hUSl0+0JN4zscJmjjyGH3G0BXT8KE60J
 ASWO89Qm9V6trSCBZC4hnMyIctyZYjuEuwkxQ0Ql4aSjEE+b+oByHazdeuG7O7Y+E8i0
 bC2w==
X-Gm-Message-State: AO0yUKXEBexY7JmAU5kOXweH7fAiQbOym6jcmOh1lVqFNF8j6bKpYR7K
 Buunl5An3+K/hDFmkmYP9GDmyaApERUxYAxEXirnkcQUvjJZfJHUAh2x/8H7MgygPg2wSrq4Y86
 g2rKXCSrrU1tA
X-Received: by 2002:adf:e941:0:b0:2ce:e571:5cc3 with SMTP id
 m1-20020adfe941000000b002cee5715cc3mr3261675wrn.28.1679074585155; 
 Fri, 17 Mar 2023 10:36:25 -0700 (PDT)
X-Received: by 2002:adf:e941:0:b0:2ce:e571:5cc3 with SMTP id
 m1-20020adfe941000000b002cee5715cc3mr3261660wrn.28.1679074584883; 
 Fri, 17 Mar 2023 10:36:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 n2-20020adffe02000000b002cfeffb442bsm2449773wrr.57.2023.03.17.10.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 10:36:24 -0700 (PDT)
Message-ID: <afcc10e8-b983-1b67-c4fb-38fdcb3acd6d@redhat.com>
Date: Fri, 17 Mar 2023 18:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 02/11] hw/arm/smmuv3: Update translation config to
 hold stage-2
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-3-smostafa@google.com>
 <0f65997a-9b35-6e41-3960-c5de6ac13ec9@redhat.com>
 <ZBR8rjjP+qQoNUaC@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZBR8rjjP+qQoNUaC@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: giufBz75I07m

Hi Mostafa,

On 3/17/23 15:43, Mostafa Saleh wrote:
> Hi Eric,
>
> Thanks for reviewing the patch.
>
> On Fri, Mar 17, 2023 at 12:37:11PM +0100, Eric Auger wrote:
>> Hi Mostafa,
>>
>> On 2/26/23 23:06, Mostafa Saleh wrote:
>>> In preparation for adding stage-2 support, add a S2 config
>>> struct(SMMUS2Cfg), composed of the following fields and embedded in
>>> the main SMMUTransCfg:
>>>  -tsz: Input range
>>>  -sl0: start level of translation
>>>  -affd: AF fault disable
>>>  -granule_sz: Granule page shift
>>>  -vmid: VMID
>>>  -vttb: PA of translation table
>>>  -oas: Output address size
>>>
>>> They will be used in the next patches in stage-2 address translation.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Mostafa Saleh <smostafa@google.com>
>>> ---
>>> Changes in v2:
>>> -Add oas
>>> ---
>>>  include/hw/arm/smmu-common.h | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
>>> index 9fcff26357..2deead08d6 100644
>>> --- a/include/hw/arm/smmu-common.h
>>> +++ b/include/hw/arm/smmu-common.h
>>> @@ -58,6 +58,16 @@ typedef struct SMMUTLBEntry {
>>>      uint8_t granule;
>>>  } SMMUTLBEntry;
>>>  
>>> +typedef struct SMMUS2Cfg {
>>> +    uint8_t tsz;            /* Input range */
>> nit: Size of IPA input region. Called t0sz
> I named it this way to be similar to stage-1, as SMMUTransTableInfo
> just calls it tsz, I guess that is because it can hold either t0sz or
> t1sz.
> I can rename it for stage-2 to t0sz.
no strong opinion though, you can simply add this in the comment
>
>>> +    uint8_t sl0;            /* Start level of translation */
>>> +    bool affd;              /* AF Fault Disable */
>>> +    uint8_t granule_sz;     /* Granule page shift */
>>> +    uint8_t oas;            /* Output address size */
>> called s2ps. if you don't want to rename you may add this in the comment.
> This is not the S2PS parsed from the STE, but the effective value which is
> capped to SMMU_IDR5.OAS, which is used for checking output size, I can add
> a clarifying comment.
ok
>
>> I am suprised to not see S2R which would match S1 record_faults.
> I was thinking about this also, right now we piggy back on record_faults
> in SMMUTransCfg.
> But it makes more sense to separate this from the beginning as other
> fields. I will update that by adding record_faults field in SMMUS2Cfg.
ok
>
>> Also without further reading we can wonder wheter the parent
>> iotlb_hits/misses also record S2 events?
> For iotlb_*, they are shared also. However, I think this is not important for now as
> it is not architectural, and it produces the correct output as only one
> stage is advertised at the moment.
> When nesting is supported, TLB implementation might change and then we
> can take a decision about this.
>
>> I think we need to be/make clear what fields of the original S1 parent
>> struct also are relevant for the S2 only case.
>> Maybe tag them with a specific comment S1-only or S1 | S2. It may be
>> cleaner to introduce a union and common fields in the parent struct though.
> I agree, maybe we encapsulate stage-1 only fields in a similar struct
> and leave common fields outside.
>
> struct SMMUTransCfg:
> 	stage, bypassed, disabled, iotlb_* //common fields
> 	struct SMMUS2Cfg
> 	struct SMMUS1Cfg
> 		ttb,asid....
>
> Or we can add SMMUS1Cfg and SMMUS2Cfg in a union for now and when nesting is supported we
> separate them.

yeah that would be cleaner but it is also more invasive. At least make
it clear in the comments and commit msg what is used for each stage.

Thanks

Eric
>
>
> Thanks,
> Mostafa
>

