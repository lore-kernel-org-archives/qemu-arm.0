Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1622310lfa;
        Fri, 30 Oct 2020 08:08:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP5IWfMdC/sQ6aBYuJWIGbZ1h71S+E+cK7sxbsKJSyMB32e0JKP12smunOo+4hy/GsOTt/
X-Received: by 2002:a37:a7c7:: with SMTP id q190mr2581138qke.185.1604070486245;
        Fri, 30 Oct 2020 08:08:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604070486; cv=none;
        d=google.com; s=arc-20160816;
        b=PJm/BxHsn5e5sTGjcHWG94rIedkBjwLvhbQ0LsBvQlv4WdyCsgU0+u1PgEk6iF1GTh
         dQjBHDc6BfMFU99eGl3o4uN9afamDSYvAq0g+hCeBnShdh1UWf4D/ojt+k43LlYPKI+q
         xEUrU/wR/PjJ2xLX+u5ONRQqCwAWFjMsjCujbE5piiHwMDGlbYLLZNGkWbnEdLtxmcb7
         lA5M6djmTEiMSRLuDGM7ZwK4ETc8hxFEom8nlI3IGDaw+ZJj9O56YH0xkRbzcajo88lp
         318I96eiPnG0MqsbIqbV5LPR3uqQAMN8RtMNvfDyyNznAlFG0ufVWuJuK/8Xf/rP/svR
         x4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GAqXPOXuukhZqK51Op/yU86BQwqXYj+LR6xYpLcHoAQ=;
        b=apOaQfQ4NdagqMhtcBhOm0XJaiY+C4ntexgPZdMv+RiK3Md7ywthIUlOCO5/IASOrr
         pTEg09CIwAodEJY97W0k656QwAmuRwBiDN05SyYKJgLNHdDNwdAcvipjr9l7+SpmNRqy
         EFW92Ghqy/eU1GTQpAF4ODjXnXg3KJJfzNSyjWs+/SEaVWhlRpNfj/xZaFigqphaPNB/
         ZE7I682GRxl8aG0I3L4sbOpWwWENkTZ5OgjiT6lJ9+GZoN6is8xn7esUZo79acU5VLZN
         /oI6DQKRIiVWd+puaJf+IbxGvO8pLKcPenfj05HrWtc+XEXG33p12JL0snobjYpY1Hmz
         tAEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HLcYRdwQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si1333720vsp.439.2020.10.30.08.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 08:08:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HLcYRdwQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYW0b-0003lZ-Js
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 11:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kYVxZ-0000kF-33
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 11:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kYVxX-0005QZ-0T
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 11:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604070292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAqXPOXuukhZqK51Op/yU86BQwqXYj+LR6xYpLcHoAQ=;
 b=HLcYRdwQRlSuBK+KH7nPx2bBNyqJhuwlxWKgw5wvTmWLoGFm9XX0q+AYQ+GP7KJ0zEww0O
 Zl/9rCiV0vgJarGVfhQHwje9ypu0anMrkCTtffB0gMdn8rqBYN8310htP7yWy4cW+QhBMF
 vzzVZkW1R0+H2P5sK7bcNOH3cCE8Ux4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-wBANpD2qN6W6BciJpa5qNw-1; Fri, 30 Oct 2020 11:04:51 -0400
X-MC-Unique: wBANpD2qN6W6BciJpa5qNw-1
Received: by mail-wr1-f70.google.com with SMTP id q15so2762851wrw.8
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 08:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GAqXPOXuukhZqK51Op/yU86BQwqXYj+LR6xYpLcHoAQ=;
 b=b7TN1lVbCks/ASHPHywdnWequaCLiiVHB7AuLsfQVYC6n3P19V2tB26R5mRz/+QWIa
 MCsIMaVpfMBNACaMAl03Wx0G7T0OfLB5BqllzIrwaUgnTOOe10FYG29vTcHU3CpkPAE0
 yzSCzFRMKTJ1UtDXH3b9ynigDqecrHOXl+GtiZTfrWaFXDwfCyZz2chog3nFkWskCky7
 IZthO/gyz2kL8sTZbpnFBDDJoqmF7XQHyxr9Vc7D10cYrENEYwC9wsmFKeRJ2kkZplW9
 OhVd4wtR3Lh43z8A/9bBjtQXTC1SiMzMFkFnYaKAv12iPswlB2/Ps+qKtuL2JPQRiOJL
 vTfg==
X-Gm-Message-State: AOAM531XAjPw84Tprc7bAWZ6DIOec4Q8cnd9HvMP30tuTZY8JsU/0NeP
 PdzLguf2Cjrjt3MRnK+80TS48GtDJlvwStcZ3BEEz+pz83Wd/mBAuTypPH1JQx3eU/v4B+t+oaw
 pXq1c9C2amnc6
X-Received: by 2002:a1c:3c84:: with SMTP id j126mr3229561wma.151.1604070289611; 
 Fri, 30 Oct 2020 08:04:49 -0700 (PDT)
X-Received: by 2002:a1c:3c84:: with SMTP id j126mr3229533wma.151.1604070289422; 
 Fri, 30 Oct 2020 08:04:49 -0700 (PDT)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id j13sm11257191wru.86.2020.10.30.08.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 08:04:48 -0700 (PDT)
Subject: Re: [PATCH-for-5.2] hw/arm/smmuv3: Fix potential integer overflow
 (CID 1432363)
To: qemu-devel@nongnu.org
References: <20201030144617.1535064-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d4a12de-95ec-0698-f8c6-8f1b7bd146e2@redhat.com>
Date: Fri, 30 Oct 2020 16:04:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201030144617.1535064-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 02:24:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.253, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0vexDL322oMT

On 10/30/20 3:46 PM, Philippe Mathieu-Daudé wrote:
> Use the BIT_ULL() macro to ensure we use 64-bit arithmetic.
> This fixes the following Coverity issue (OVERFLOW_BEFORE_WIDEN):
> 
>   CID 1432363 (#1 of 1): Unintentional integer overflow:
> 
>   overflow_before_widen:
>     Potentially overflowing expression 1 << scale with type int
>     (32 bits, signed) is evaluated using 32-bit arithmetic, and
>     then used in a context that expects an expression of type
>     hwaddr (64 bits, unsigned).
> 

Fixes: d52915616c0 ("hw/arm/smmuv3: Get prepared for range invalidation")

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/smmuv3.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 2017ba7a5a7..22607c37841 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -17,6 +17,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/bitops.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> @@ -864,7 +865,7 @@ static void smmuv3_s1_range_inval(SMMUState *s, Cmd *cmd)
>          scale = CMD_SCALE(cmd);
>          num = CMD_NUM(cmd);
>          ttl = CMD_TTL(cmd);
> -        num_pages = (num + 1) * (1 << (scale));
> +        num_pages = (num + 1) * BIT_ULL(scale);
>      }
>  
>      if (type == SMMU_CMD_TLBI_NH_VA) {
> 

