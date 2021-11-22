Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp7554616lfk;
        Mon, 22 Nov 2021 12:46:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeG4Khg3G8KfGmY2UQbStbZz4kx3S8e1f8vUiYJbXlAuLH8Cls0in7n9SI47bHjpQiXauF
X-Received: by 2002:a05:6122:1353:: with SMTP id f19mr35130069vkp.4.1637614010261;
        Mon, 22 Nov 2021 12:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637614010; cv=none;
        d=google.com; s=arc-20160816;
        b=o78ClusY7fimTs0QZOM//SFE3lCPv267BVLNRPojP5TrzSVIix0oAnA3xGOVZTEJcS
         saseRhA55/pcqmizQuocj6YEknJJMg2GqnUPiuR7/F2oZuF4hiGY+eEqWM9JGUu+Xban
         HZ5p3unT4SSqfUCGpp+K0fnNn3mywi5aowMgl5PsYnGuSTO56KYzMw9j4yUAx8rkgzXO
         yYWlpztgVeEME431plN1FyUg6bIN2siF0G+rYPpNExilQLyrF0p5mg4mpSKwkX1yFc2q
         dyaROjRqG0uiIg8CbW+REHLdJroD6wPZm6lVcb4b751udUigNx2++3xR1spnEQZ6B2tV
         h52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3W+AwtR3FDj8lNUStc9QYpxEsslpZdlkvWuQwCPtt1A=;
        b=lsfQa4RVU/veAIbK4Argom3+EeOMYHsrPLRG/aOLvB0Yox3cVfws8sLxx25M22RJit
         reSiaoqKq4zcAS7xFxvJL+dYZNSGLlhpPRMeEdlhZNIl8iRYi9wumFiizAq2loX78QQ4
         lPB9u0J1ns/ot9aWDjQNAxwSKszGGgw2S7FA9HS9SK6PUUJQO2sv0kZUB0/h8HafgmDu
         lDgXFhi3BAv7ra9taUm1T64SvqLZb34jST0a94JN2ai9OTDOQwq7zptOm2NTyEcGdpU9
         kDrdGxgnstjEC5Mrvt01nxBEdJy6sNu6jBJoks6oQ7Km3pPgzIonMBlixqAEEVN0bldY
         Bc+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Kwo+EqZs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22si25196102uam.68.2021.11.22.12.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Nov 2021 12:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Kwo+EqZs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mpGDB-0007SI-Ko
	for alex.bennee@linaro.org; Mon, 22 Nov 2021 15:46:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mpGCv-0007Qi-TC
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 15:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mpGCr-0000D7-ET
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 15:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637613987;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3W+AwtR3FDj8lNUStc9QYpxEsslpZdlkvWuQwCPtt1A=;
 b=Kwo+EqZs60DS0aBK8nKu7XiiXvCLUF6CWF6OjXKuOXmny5vVtG8PoGPh+3krESZg/0RjmB
 YS0Y4zQbPCmHWC5iCtEhPF3l0IxrcUbFyl0ku4xECWlLdMoZTphYTHvd1DJ9kBYvE+Oqab
 vEqL1PBbdFyKsMMp7OZAF6KFBQ5pLR8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-Qi13zFNoOQuQJBsVyPnVug-1; Mon, 22 Nov 2021 15:46:26 -0500
X-MC-Unique: Qi13zFNoOQuQJBsVyPnVug-1
Received: by mail-wm1-f69.google.com with SMTP id
 r129-20020a1c4487000000b00333629ed22dso137461wma.6
 for <qemu-arm@nongnu.org>; Mon, 22 Nov 2021 12:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=3W+AwtR3FDj8lNUStc9QYpxEsslpZdlkvWuQwCPtt1A=;
 b=18OlFqViEkeXnOUb5jAQNImwu44gYHSuPoWaKog2RaLjqE0Q1a8InTmpxmGwwTC/HH
 uijH+FvhX1ax43x+JUcIVKnp8aV3PD1coV08OL/Uro0L08tzbHKHo5DinheJOIak9iGD
 cqoHxK0W1xlhuv0HolA3SXoyilbmvuCdqZdDu63F+YKw/BH/og81mGoDcnhLvquFi1oL
 al7ap6KIkZdWbNOO9nvTCLQi9sTM2IUjGTbSimvXfSCYJRcu4y2xwivzBlZi1cm7AQkU
 32hI3neOhNu1Z8DGCldRYj9R/kXAFwlYo0adTEf2kR2Hny3LT0Gb51CCgbkEKHmBhR2j
 ifIg==
X-Gm-Message-State: AOAM533olS2liZLHxOmWldffVznVjnJXj9sp24ntBp+QwwXGCxewFMxy
 s0Sb72E2iqLGPe7JDkpoeIZSC6FUAPl0nhOEnlb9Jo+m1Dzc01dye3bSgn4fTijVFmYoBlBSA4k
 eBENFkGS2jmy/
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr26904wru.89.1637613984833;
 Mon, 22 Nov 2021 12:46:24 -0800 (PST)
X-Received: by 2002:a5d:4f8d:: with SMTP id d13mr26861wru.89.1637613984576;
 Mon, 22 Nov 2021 12:46:24 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id r15sm21677478wmh.13.2021.11.22.12.46.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 12:46:23 -0800 (PST)
Subject: Re: [PATCH for-6.2] hw/intc/arm_gicv3_its: Revert version increments
 in vmstate_its
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211122171020.1195483-1-eric.auger@redhat.com>
 <CAFEAcA-g9yjdO24cs+FSD0tp-Sw=RMe5_v0aVyFfWbY8zZp=Sw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <dfe31c68-4e91-a18e-c691-fa8c5e39074d@redhat.com>
Date: Mon, 22 Nov 2021 21:46:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-g9yjdO24cs+FSD0tp-Sw=RMe5_v0aVyFfWbY8zZp=Sw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: drjones@redhat.com, shashi.mallela@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zP0WsDpk4Maj

Hi Peter,

On 11/22/21 7:04 PM, Peter Maydell wrote:
> On Mon, 22 Nov 2021 at 17:10, Eric Auger <eric.auger@redhat.com> wrote:
>> Commit 18f6290a6a ("hw/intc: GICv3 ITS initial framework")
>> incremented version_id and minimum_version_id fields of
>> VMStateDescription vmstate_its. This breaks the migration between
>> 6.2 and 6.1 with the following message:
>>
>> qemu-system-aarch64: savevm: unsupported version 1 for 'arm_gicv3_its' v0
>> qemu-system-aarch64: load of migration failed: Invalid argument
>>
>> Revert that change.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/intc/arm_gicv3_its_common.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
>> index 7d7f3882e76..90b85f1e25c 100644
>> --- a/hw/intc/arm_gicv3_its_common.c
>> +++ b/hw/intc/arm_gicv3_its_common.c
>> @@ -50,8 +50,6 @@ static int gicv3_its_post_load(void *opaque, int version_id)
>>
>>  static const VMStateDescription vmstate_its = {
>>      .name = "arm_gicv3_its",
>> -    .version_id = 1,
>> -    .minimum_version_id = 1,
>>      .pre_save = gicv3_its_pre_save,
>>      .post_load = gicv3_its_post_load,
>>      .priority = MIG_PRI_GICV3_ITS,
> Oops, I didn't notice that the version bump lines were still
> in the patchset I applied :-(

No problem. I did not notice either ;-)

Thanks!

Eric
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> -- PMM
>

