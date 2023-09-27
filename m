Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1653073ejc;
        Wed, 27 Sep 2023 00:20:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEurSQmWQqOfRzOUndfDDfgxifZHJt+3jM1uad7EhnGXkREXk+PW1hmeAntzASObVMxLtVL
X-Received: by 2002:a05:620a:29cb:b0:76c:b53b:8702 with SMTP id s11-20020a05620a29cb00b0076cb53b8702mr1679134qkp.26.1695799212183;
        Wed, 27 Sep 2023 00:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695799212; cv=none;
        d=google.com; s=arc-20160816;
        b=X5VcOubU4oMAQvXU7mp85vWD2u7Iq0TdlzURpLJ4wY7psj+xn8zZxnHrHIAxNAJzfL
         fsOEk0GgMQ5mJtYu6ItDRqMrWQKxymq4y0aOO6lzZNxklPwqcwlk88WQeFC3mQL2pRWe
         dcqdYnH9S/9IwAYuXKBySJDw8HWg17USpVT2G4aWA2z02aC94ny6CUcDZhd/typppqdQ
         gniCXEbSHeYRh3OJPYsBS97aa91SeDBLO9TyXIvXjZ82xDpGkjBIqLAb9IhVyLimbo5f
         N0M6ACCXfOtrRtm6Yxmv/vpaz3NK8vGqqKjVinavkLqrqVVSQrHOkXJWfGPIpUwWvDIE
         jQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=38nXhEHoPqW7YImaQj8Zb5esM5iek+Y1L7C3ErZ9hLI=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=aPJyofgJp0VPpZV3Y1tUeVpBQZvymSedvrQ0XZ7JOQA/Bt2lU+Fbdpz/QTLdeio/1I
         fdCFxuP8vKsEL46RloCHZ+9mPHaxncVJvMW4khWIl/eNQrILQkf68RAzYgJ3JfaG90+/
         Lu8m8E0tAGguUMzqfu9R5OozXNxAy93HePAOfGne05++XjDRe5tXHBwIwFafmFT1ih6b
         bnV0KYhWQ0XWHEWYtoZ2E8tPeSaSBG+72q3+9xupUotTCefWDfhz06+isF45Pn/jJIk+
         UJh5TIMPk+Gihr2EEFV0z+XuyImx/QsmzzSqB3lJb9hZTNFPcRINXh22uov4Jbpo+t3Y
         FxJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B82jvivl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq39-20020a05620a46a700b007757861297esi4489qkb.69.2023.09.27.00.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Sep 2023 00:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B82jvivl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlOq6-0002LP-6w; Wed, 27 Sep 2023 03:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qlOq3-0002KS-SO
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 03:20:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qlOq0-0006fj-SK
 for qemu-arm@nongnu.org; Wed, 27 Sep 2023 03:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695799199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38nXhEHoPqW7YImaQj8Zb5esM5iek+Y1L7C3ErZ9hLI=;
 b=B82jvivlO/81UvukdtP5NXnoIm4THerlU+zyw+FSIukZnttyzjAYk2LKQhg350tfqPDw+O
 nhYQi/jP8RO5I3sOT6NvnTI4DDPhcW5n/ZmvnjkS8uyQ49R6FEGipzzLNKDVN0aiGKMYUU
 AH65kqv0nhP5kSo+1AdvVVfG98lhGvo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-H19c5IIFPV-IkL_ifOCkwA-1; Wed, 27 Sep 2023 03:19:58 -0400
X-MC-Unique: H19c5IIFPV-IkL_ifOCkwA-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1c5ff189f3fso89791805ad.0
 for <qemu-arm@nongnu.org>; Wed, 27 Sep 2023 00:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695799197; x=1696403997;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38nXhEHoPqW7YImaQj8Zb5esM5iek+Y1L7C3ErZ9hLI=;
 b=et3ZvOpNAy0HO+FVDNI+yOdUuVrp8Hxj/FZhX+4iT0ORcpb6MBGuK3LLb0gh5TOKy0
 Pw5c2WPHwQvIVPYsSoqyhJmrPbQZX/SGR31iHnZ29jI5bqoXuechboRpt8ijg6XT4a7t
 2DFHRqcckXCgHNtYu3vjsY27APEUohVOPK6CMoUJbm7QFWAi5X6BgjjZ1lTFoApkotM9
 VRS1RR4H6kj84C4fwFyU4qLciYQCaVdLvfXNNdP66OlNtP8ch5FW5khdvs8PqxoluV5h
 mPJ08PCTXcYefAvwglEQVzVMtv3NCpUT2Q+uHbecFJIOszv0Yrxj5YQJWiQF/UOSm+2w
 OtMg==
X-Gm-Message-State: AOJu0YxuxkY/xC0hi4xLKkbMt+9KxdYuzcQd9xUUePDYoH0G0ADhBhVh
 jwtk9VisAV+VTGRN7MJHZIUcFaEW9S2qe66u7pr0QM19cy9A4tQIDcgzSjTg/27aYeuaGvGpqD1
 NDj6DejsjAZKR
X-Received: by 2002:a17:903:11c9:b0:1c7:2697:ec09 with SMTP id
 q9-20020a17090311c900b001c72697ec09mr799338plh.59.1695799197242; 
 Wed, 27 Sep 2023 00:19:57 -0700 (PDT)
X-Received: by 2002:a17:903:11c9:b0:1c7:2697:ec09 with SMTP id
 q9-20020a17090311c900b001c72697ec09mr799327plh.59.1695799196830; 
 Wed, 27 Sep 2023 00:19:56 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a1709029b9200b001b8a897cd26sm12240489plp.195.2023.09.27.00.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Sep 2023 00:19:56 -0700 (PDT)
Message-ID: <b52f83ec-e8ee-88ad-15d6-78dc7f8a6f35@redhat.com>
Date: Wed, 27 Sep 2023 17:19:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] target/arm/kvm64.c: Remove unused include
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230925110429.3917202-1-peter.maydell@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230925110429.3917202-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 1787S5RZ7OrF



On 9/25/23 21:04, Peter Maydell wrote:
> The include of hw/arm/virt.h in kvm64.c is unnecessary and also a
> layering violation since the generic KVM code shouldn't need to know
> anything about board-specifics.  The include line is an accidental
> leftover from commit 15613357ba53a4763, where we cleaned up the code
> to not depend on virt board internals but forgot to also remove the
> now-redundant include line.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/kvm64.c | 1 -
>   1 file changed, 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 5e95c496bb9..3ea9f1d6743 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -30,7 +30,6 @@
>   #include "internals.h"
>   #include "hw/acpi/acpi.h"
>   #include "hw/acpi/ghes.h"
> -#include "hw/arm/virt.h"
>   
>   static bool have_guest_debug;
>   

