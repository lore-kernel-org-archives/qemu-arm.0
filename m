Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1026788njx;
        Fri, 25 Oct 2024 05:55:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqADwGDFIqlE629C+zit6Rw3FfGscn4ri02/x7GW3cps9LFhJTlZltMZCxUcP5ttJ8nGZiHG+eKwzllQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGe5iGLvLx902bViy+7pAfDPzdsZkW3rPUxGpMhrpB1u5QKAvdTM0WckiFxRO14aBeQrnJQ
X-Received: by 2002:a05:622a:110b:b0:460:e7e3:b072 with SMTP id d75a77b69052e-4612594a68emr65062411cf.57.1729860905993;
        Fri, 25 Oct 2024 05:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729860905; cv=none;
        d=google.com; s=arc-20240605;
        b=andGkPnj9IEBzqVO3KdxsEkdLPI4LrDNvgU126odws3r7MIOLlruNZk+pFnhNF16rs
         PEq9uSeaJuV3WGLjsFosKFGvI8IJuDfRWGZdS3zfkXizrc7Suums5LebeymzfF76EMJj
         9n+yNq7agsdF2sJr1+eLHuIt5u7jDp8SOuOQqMlH6hN2tSJJYxenyTue86zuByQ2MI+d
         ltQTcKNGDlt/mDQUAGLKW44PsBP4OyZpuv7dzzaN5P1zSRTSy491W7Kr7D/XHNdMmEzk
         qicd6CZJeidonu4Rw8cv5FxqFyqwEvdbZ+OtCeJVoYMmEPwRnHzoE8S4zlDjazJiYLQ9
         Dggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:cc:from:references:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=g8HvZUrdqxYpsQCnW1LInwnnKHa3OwCrmx21wPZJ8gA=;
        fh=QsneHyOVyUtFlb1GbZJFkUwFHsg8WM4ZyKOHP9d0YnU=;
        b=VaxcuXnHIx+VUpViSruneUUUxfv1d0N4OMLuRgqYSbFdx6ezCnrHpOswhg8YJz49n5
         CPBaIU8LIE1dyxboW3xJZkJaUH6Huo6JLddCCeUrAYkB34R0cthqOkX8rwz6Izp0Ttgf
         w8wAYkGyVjrJnOSywUcMfxzd4t2VPw/rXBm8NxjstbenEsBGtZ8pEIxUG9c2oeDvqUeW
         ssFHpOS/MZJqIkgkZjGbYp7sVnzZsWCKsEpFn7GsRO402c/mndXXSS8uM2u6F4ZYR28R
         VTuUvLlwZ1VyF5/oziWN+EaDEPg27O9IestaklY0nhlmsGanmnuo2NWl9xeU7THsglxD
         eXjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gRkuzoWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4613235da6csi13153581cf.294.2024.10.25.05.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2024 05:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gRkuzoWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t4Jq8-0006Uu-TD; Fri, 25 Oct 2024 08:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t4Jq3-0006Rt-1b
 for qemu-arm@nongnu.org; Fri, 25 Oct 2024 08:54:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t4Jq0-0004hK-SI
 for qemu-arm@nongnu.org; Fri, 25 Oct 2024 08:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729860883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=g8HvZUrdqxYpsQCnW1LInwnnKHa3OwCrmx21wPZJ8gA=;
 b=gRkuzoWkTyjp35/4Ie+r689uX0BlqwusmJXoIBp2XhlGn65ubsEMa9etQudFXAbq4p0eh/
 4xUBDPATWZGMvce5PrQcHCd6EitsD/KTjKqcZqyOA8AR7TDwZXzavxmIPuoAgQif8MxrR9
 XtW9WJmWZOWhjiK6hqlJP0NtCE2x/ys=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-iNEFnv_IPjaBcUg6YSyzOA-1; Fri, 25 Oct 2024 08:54:40 -0400
X-MC-Unique: iNEFnv_IPjaBcUg6YSyzOA-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-539fbf73a2fso1506018e87.2
 for <qemu-arm@nongnu.org>; Fri, 25 Oct 2024 05:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729860879; x=1730465679;
 h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g8HvZUrdqxYpsQCnW1LInwnnKHa3OwCrmx21wPZJ8gA=;
 b=IzHJu0a1vZyB4Aj/UUvnb/M4OxPiXGaKDgYKcsmdbZf5xYyZ+lReNTBw0hMd1GmRrd
 wHNMv85VQSJWlSBPIRDrheEgueQhN8bkF72EF5N0SP6LMa52esPOAazhKHI2AWOwV7S1
 uaKd3HxJbLUAQPajxqcsygc0pp7/jdzNlCg2vy6T7veBsIfga2YWjXfC0GJlD4xqzhe2
 ZkDv0omLwQCQNwPLjqQOG1I/Ax3BjEVyS1BYIbHXwscjvGgM8DIXfnF2IVs0oMlgA321
 uu3INmYsiwBNP3ZEOyR06J7EWMf3KEthMY4qTlZHMqgxq/McZiv7GI0r7p7jmk4G5DON
 ZoFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMzQkMAx9UXBg9w1VeYvzcGSfekOcAO45kyNuQFyrwZcuFKAniSkfCTfha3aPIkKGQXbzNCNu4rw==@nongnu.org
X-Gm-Message-State: AOJu0Yyp4tnkLN2kcYJrWjMWOZw+RS1fyhq5zcipGeLiB+eNZ8BSdbvQ
 9C0s3wxRD4vzV480HZSBmOy4BEA5lVHVKsv3c6joXzKfgu9qLukOjL8sbC3izcBMa5OlKhY51AW
 d13mVmPMrHj5zpaw4MPPU18rZwEl2bj6TvCXb3F/k0f4j1PspOMP5l4EOeQ==
X-Received: by 2002:a05:6512:1083:b0:539:de03:d7a7 with SMTP id
 2adb3069b0e04-53b1a3030fdmr6218623e87.22.1729860878661; 
 Fri, 25 Oct 2024 05:54:38 -0700 (PDT)
X-Received: by 2002:a05:6512:1083:b0:539:de03:d7a7 with SMTP id
 2adb3069b0e04-53b1a3030fdmr6218606e87.22.1729860878205; 
 Fri, 25 Oct 2024 05:54:38 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-40-241-30.web.vodafone.de.
 [109.40.241.30]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431935a4ad8sm17134765e9.23.2024.10.25.05.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 05:54:37 -0700 (PDT)
Message-ID: <b090fac1-85df-4727-a382-8a934bd02f33@redhat.com>
Date: Fri, 25 Oct 2024 14:54:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 4/4] target/arm: Fix usage of MMU indexes when EL3 is
 AArch32
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>
References: <20240813152054.2445099-1-peter.maydell@linaro.org>
 <20240813152054.2445099-5-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240813152054.2445099-5-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.454,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.697,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UC+u1ETwc3V6

On 13/08/2024 17.20, Peter Maydell wrote:
> Our current usage of MMU indexes when EL3 is AArch32 is confused.
> Architecturally, when EL3 is AArch32, all Secure code runs under the
> Secure PL1&0 translation regime:
>   * code at EL3, which might be Mon, or SVC, or any of the
>     other privileged modes (PL1)
>   * code at EL0 (Secure PL0)
> 
> This is different from when EL3 is AArch64, in which case EL3 is its
> own translation regime, and EL1 and EL0 (whether AArch32 or AArch64)
> have their own regime.
> 
> We claimed to be mapping Secure PL1 to our ARMMMUIdx_EL3, but didn't
> do anything special about Secure PL0, which meant it used the same
> ARMMMUIdx_EL10_0 that NonSecure PL0 does.  This resulted in a bug
> where arm_sctlr() incorrectly picked the NonSecure SCTLR as the
> controlling register when in Secure PL0, which meant we were
> spuriously generating alignment faults because we were looking at the
> wrong SCTLR control bits.
> 
> The use of ARMMMUIdx_EL3 for Secure PL1 also resulted in the bug that
> we wouldn't honour the PAN bit for Secure PL1, because there's no
> equivalent _PAN mmu index for it.
> 
> We could fix this in one of two ways:
>   * The most straightforward is to add new MMU indexes EL30_0,
>     EL30_3, EL30_3_PAN to correspond to "Secure PL1&0 at PL0",
>     "Secure PL1&0 at PL1", and "Secure PL1&0 at PL1 with PAN".
>     This matches how we use indexes for the AArch64 regimes, and
>     preserves propirties like being able to determine the privilege
>     level from an MMU index without any other information. However
>     it would add two MMU indexes (we can share one with ARMMMUIdx_EL3),
>     and we are already using 14 of the 16 the core TLB code permits.
> 
>   * The more complicated approach is the one we take here. We use
>     the same MMU indexes (E10_0, E10_1, E10_1_PAN) for Secure PL1&0
>     than we do for NonSecure PL1&0. This saves on MMU indexes, but
>     means we need to check in some places whether we're in the
>     Secure PL1&0 regime or not before we interpret an MMU index.
> 
> The changes in this commit were created by auditing all the places
> where we use specific ARMMMUIdx_ values, and checking whether they
> needed to be changed to handle the new index value usage.

  Hi Peter,

this commit caused a regression with one of the Avocado tests:

  AVOCADO_ALLOW_LARGE_STORAGE=1 avocado run 
tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_bpim2u_openwrt_22_03_3

is failing now. It works still fine before this commit. Could you please 
have a look?

  Thanks,
   Thomas

