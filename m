Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp366872lfo;
        Wed, 3 Feb 2021 08:29:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4Bs8HfwINftR2fcSLKyBZpAgKp3CZ5KRS0yGml+gX+umzXqVLg7oEMdSGPgkmXZc5MDnL
X-Received: by 2002:a25:946:: with SMTP id u6mr5632707ybm.231.1612369782902;
        Wed, 03 Feb 2021 08:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612369782; cv=none;
        d=google.com; s=arc-20160816;
        b=XzFl5p6gBuSsNB5l7DK7ys9bLlQgFDJTzLj79FPVqp4b3UYrBEtEiKQwlZOQg8OA7V
         8Zcaj/Sw/mSTm2QloXDLKXcSIMsyAOYiCelaZkTrHTmyEUlwNcpx1tZ45xSYOlPT56vo
         SwrAlRGMSolj+XXcEILUeOPN+KTTcbZQY1cAZS8d0RRJj1bWJaTejv3kqinXnK6Iew1N
         pN73TWp0SMQL2jSE4Pkp+uVMdAMIKrImxfxfqSYI8Vx+v6e/24tHLdb9EI/hQri5hIU/
         HogICfbpziYEWjXCYUzBc2TMqQb+mclD9cXI7j4wlFP805Nn1Acn1MzgTdKNOiSAxgOF
         4Ssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LOqMLwa5Tota4pD6n9aqoencQy2rVSn44E6E+gK9QEs=;
        b=itM7Qh2t7Si4QTgBMpbNGNs4yTPwsQw4sr9LVf0HgQnVjjDljiIbCuWZrNmzzU0ahj
         ZGjwsaaAeyIivkcUKhSJS5ycGl6DIXfa04H2e4oVIQH7YACwWC9UkxEgxACgSpP9jlIf
         tRn6bORlisn3uOVfWQsNMyB2kz8cpMTmDAomH+qLwqe8c9pVbFgnUwXeKMAm0gMeAAwm
         qbexPqkxfjzqtCVryPqh6d+SwFK6MaWrJpmYE7D2zBEzUzpYv2KUrTqgQmKpvSJdcFl+
         HM0ZwgUpRO1exyG30zWcfOWNU2fmJ7+JV73FsTR73H35ITOSS25lDMGDoLWtUVurv3Tm
         uqtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MoEQzQjC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si2949429ybm.397.2021.02.03.08.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 08:29:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MoEQzQjC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7L2E-0004yj-BC
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 11:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KxZ-0000cp-5q
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 11:24:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7KxV-0002mT-A8
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 11:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOqMLwa5Tota4pD6n9aqoencQy2rVSn44E6E+gK9QEs=;
 b=MoEQzQjCY02Ntfrh/v1BvnUfLYN7oqEj8InzZ4lVAx7P8uN64Zgqz7H4VfKDVfkgTlYqwR
 oa3SnoAy/UzfmQo/8yeDO+dqYHU0ZVIvfcga3actPIbn9xBGVOu5425MELsW/yTnELeILz
 xNd4mAmY4shO4AGk++757wC/mg/waGU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-5ClM3BMNNcCZrET1spymJw-1; Wed, 03 Feb 2021 11:24:46 -0500
X-MC-Unique: 5ClM3BMNNcCZrET1spymJw-1
Received: by mail-ed1-f70.google.com with SMTP id g6so98697edy.9
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 08:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOqMLwa5Tota4pD6n9aqoencQy2rVSn44E6E+gK9QEs=;
 b=WQKQYvcQrjRB2i0n8M+HVxtqEQmguzvDJRPqUyIdTmqA4RuLx4dLow6o8T1q+9LUtO
 cVA1XSbFE8Wf+AsTQFt3F8b/nJJ+HnpAtyYTTYLBCkce8z25aquunSVNSO+vlRJftU73
 BshxAnQ+P6aNCYItBxfypoF6djnXphK3nZzQz8n88JF4utK4/GhZMu22SJILCj6O7g2S
 N8gqYMoOPDrUNDE6EZ+4bEx+vL0Ubh0klxJOX6K9UNhWWLRj7vTXDtNBnJ3EpsekcW9L
 VfnbqpVGX+o6xGDhwx+DT6IqzkJ9iwTIQKzhstPbfkRaASsaAVPjbsA8UFF8+bR6lg9l
 PdBA==
X-Gm-Message-State: AOAM5338IdCb+F2kmTtJPTcx5QEHGWnnTQzNsT8h36BSSGNngG3ETNAf
 S1AlXzVcIsDuF2kWGmgqjL/gQECvLSojJ6FHTcmFrM4lLc/vysO5TjvSRshyRSYGUyjOh1mv1Uq
 7harAM3wBPVrc
X-Received: by 2002:a05:6402:13c8:: with SMTP id
 a8mr3704436edx.191.1612369485760; 
 Wed, 03 Feb 2021 08:24:45 -0800 (PST)
X-Received: by 2002:a05:6402:13c8:: with SMTP id
 a8mr3704384edx.191.1612369485295; 
 Wed, 03 Feb 2021 08:24:45 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id e11sm1204629ejz.94.2021.02.03.08.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:24:44 -0800 (PST)
Subject: Re: [PATCH] target/arm: Don't migrate CPUARMState.features
To: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
 <20210203161340.55210-1-aaron@os.amperecomputing.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d45cb218-a3a5-6040-e588-50f31479a2c0@redhat.com>
Date: Wed, 3 Feb 2021 17:24:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203161340.55210-1-aaron@os.amperecomputing.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLfGR9awobtt

On 2/3/21 5:13 PM, Aaron Lindsay wrote:
> As feature flags are added or removed, the meanings of bits in the
> `features` field can change between QEMU versions, causing migration
> failures. Additionally, migrating the field is not useful because it is
> a constant function of the CPU being used.

Please don't bury patches within mailing list threads.

BTW you found yet another 13 years old problem :)
918f5dca18d ("target-arm: Extend feature flags to 64 bits")
aa941b94450 ("Savevm/loadvm bits for ARM core, the PXA2xx peripherals
and Spitz hardware.")

> 
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index c9e9fd0a12..7f2511b6ed 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -834,7 +834,7 @@ const VMStateDescription vmstate_arm_cpu = {
>          VMSTATE_UINT64(env.exclusive_addr, ARMCPU),
>          VMSTATE_UINT64(env.exclusive_val, ARMCPU),
>          VMSTATE_UINT64(env.exclusive_high, ARMCPU),
> -        VMSTATE_UINT64(env.features, ARMCPU),
> +        VMSTATE_UNUSED(sizeof(uint64_t)),
>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
> 

