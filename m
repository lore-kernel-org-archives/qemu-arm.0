Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1702163ejb;
        Fri, 3 Feb 2023 11:32:59 -0800 (PST)
X-Google-Smtp-Source: AK7set9+Fwkn4FxIw3YBQjO0VHnK+8cq3GUxVq5AgCwRiwfC6SC3Q/UCFTtnL5cLMVww2cCLn6Me
X-Received: by 2002:a17:907:6d02:b0:877:5dbc:da84 with SMTP id sa2-20020a1709076d0200b008775dbcda84mr15891202ejc.72.1675452779765;
        Fri, 03 Feb 2023 11:32:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675452779; cv=none;
        d=google.com; s=arc-20160816;
        b=wc/CpNnW83UYoqm7bY2H1peqHpiOXWicGgnGhHXBOlyDWDw4gSDMs+jCjzNx4N8Fuo
         MY+WNka8fU1cDFb9tE7id26knW67wDH6vCjGZTvogTZfN9V9XgatdRHund6brjlxC3UO
         B5yKsWtwGVMRZMq1ZF8c875DDmIegfDrRNwcDE9tWZcB4aBpYfVFICttCgIxt09FXJN8
         kYzIZw8t2XSgyojgXW6FjP8VKuDiHpUBNSAiehg1YbMss+0jWEFGkmuw48ydWwQpKNaJ
         VOQH3oPCoZwx9Oa0zYttsFammn/jym3SSHkwlFlVnVEjC77hls4WPEfYaTMTCoZ8sxRg
         D/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=dG0a8fJBCT/Oaur9MGeYdEB1XYw6nwH+l+QzxE964iI=;
        b=MfJBtjbzELFnwAl4Bi6HqBjM51qEL677F/sVSgZuBggFNodjxTguMp2bF1YyoP3X8x
         7xK9xprLAwL6AAAJiG4pL6xq9ocx9OID9Q71ezCCO5SMAjMycZkG9pZYPUEFLPiiGouI
         JAoVIPyE1yr52pHJHbn7pmdJQ+TFBKwIlRZz/ER1pH74I+YBKBbgR2EFqKzHlybllvTP
         IayJ404pw9FlOU7wSV4oj2WXg5cOL+wu9pXK3L5w7lLg3X1xYUKNDz/wpMX/ru+ZxNdm
         3rHNMIhpQi9LMvwe2KFqgoXaCvP9CPiGNFZuOxvZkkPuOVZdU0TRFhsFgUMUhYBse34X
         ndPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fn1GB6fV;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id fl13-20020a1709072a8d00b0088eb55ed9d4si3268457ejc.689.2023.02.03.11.32.59;
        Fri, 03 Feb 2023 11:32:59 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fn1GB6fV;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbjBCTc6 (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 3 others); Fri, 3 Feb 2023 14:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233595AbjBCTcz (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Feb 2023 14:32:55 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC5481C7E4
        for <kvm@vger.kernel.org>; Fri,  3 Feb 2023 11:32:54 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id o13so6036526pjg.2
        for <kvm@vger.kernel.org>; Fri, 03 Feb 2023 11:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dG0a8fJBCT/Oaur9MGeYdEB1XYw6nwH+l+QzxE964iI=;
        b=fn1GB6fVdaKh2PYPg8aH7Zug/cFJYp68g4zB8JsZTTGE1PAtqEERttXZVF9TY+Mz+z
         I+L6QKLO2rUe2ft4ifJZVRb9KNaeEM3DpL+v/KPJHD2lQw9/YBIXBcjiy7buTDhaMFpL
         FNJyIO5iyX/Xn2gO/V7UjRLeNAvUgFzXk6jYleR810oqYfg26mgRju/1N/vq0oYWwI2w
         GHng8Ef3/4w91vTLsvR3jzpSv1XAdJItYdukwnSA1ziBnxgPgQljJZgOCsa8bACB86gO
         Xiaxje3++N13730nwIXQuF4E+7od/i5lPXVFpask+9U/V2LSO9X6HSeTXA7Q3Ok+lzfX
         9M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dG0a8fJBCT/Oaur9MGeYdEB1XYw6nwH+l+QzxE964iI=;
        b=axkQBiaR2D4h0DaDGagB8pEWD78s5tiT6Z8Ke+d53nMBy1/JNwPyDw4Knq4WZeE+OH
         VlYNCfnGxbA56+oECTK2Jd2b3EZvLg6jBss+O/oo0i1l/PRVjNFetAztS+N6ByJaWS/f
         CBGBqhl8NwJUgDBIKXGGLi+YfK1mm6eO7fawyjEJkRAlaKSaF5rpeSfOFWQnl5/3zSdA
         9YHhX6OSqP4Z1IfuSXIM+JcO5NpfFoP7Cr6Kba8edyvrZ+WLY/PooLBDq13pvKtR1ck0
         yQ2zLsIQG6BsldbkJhusfW5H6wu9k4fu68cgCm4mnFMAYxRZ1oKGRCDs/xIYlSIMsJv2
         figg==
X-Gm-Message-State: AO0yUKUzLZs5jzpXDTczQeHsd3Ve3QkNzKcCjF7xehC+/hpalMwQAa8l
        FqnTLztKmESexHci97xczT/ThQ==
X-Received: by 2002:a17:902:f30c:b0:196:6215:8857 with SMTP id c12-20020a170902f30c00b0019662158857mr8311999ple.22.1675452774299;
        Fri, 03 Feb 2023 11:32:54 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id je6-20020a170903264600b001899c2a0ae0sm834759plb.40.2023.02.03.11.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 11:32:53 -0800 (PST)
Message-ID: <30a154d5-7a11-4a65-c847-c8ebff8242b5@linaro.org>
Date:   Fri, 3 Feb 2023 09:32:48 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 1/3] arm/virt: don't try to spell out the accelerator
Content-Language: en-US
To:     Cornelia Huck <cohuck@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Thomas Huth <thuth@redhat.com>,
        Laurent Vivier <lvivier@redhat.com>
Cc:     qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
        Eric Auger <eauger@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
        Juan Quintela <quintela@redhat.com>,
        Gavin Shan <gshan@redhat.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-2-cohuck@redhat.com>
From:   Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230203134433.31513-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: YODigNzueTp0

On 2/3/23 03:44, Cornelia Huck wrote:
> Just use current_accel_name() directly.
> 
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   hw/arm/virt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
