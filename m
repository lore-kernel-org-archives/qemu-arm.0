Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp2051178ejb;
        Fri, 8 Mar 2024 12:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEmCBtq/a5jYoZdAUDJ6iF36KIeZnnE7P+HPb/hxdGhMwDv/4wP67XQViylrPCMbV7zAUyZ0/Pbtej/drhEX6OFWAy344R
X-Google-Smtp-Source: AGHT+IHRVbPULYDQGL1qdDY6YI6sv477RO0KWlyQ8Vr0APRl3jZtemayflZiedu5m8nKGiwh+5bD
X-Received: by 2002:a0c:f989:0:b0:690:735d:ff74 with SMTP id t9-20020a0cf989000000b00690735dff74mr164198qvn.24.1709929059122;
        Fri, 08 Mar 2024 12:17:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709929059; cv=none;
        d=google.com; s=arc-20160816;
        b=te6cNftHUSF4dgrrpqlJIfCYDJcg7b9oNjHcsghYtFLXiXMXJ2DDjWDVjBbw7C7sJh
         654i9MM1al4dieq+zar4/1Cv+cVZGcEi0dCjT5hKBmhsuVhMWTgaAt5SNMaBgAYLrxfu
         yyUBxYTr+D0Y6ouvmasgB91xBhpGj3ooflOcx1MvZ5cod4d6uk1iXOTIqbiYx4jwa0Ak
         BxlZKo4HSmBs4HFT+8947hNQ1pR3kf24xFdY4Tps3uroDJOshpUg73B0QO+xKZLakTWn
         4L4IKpOGJ3cdXIN7XbUydD8e6Hv8j8bMA8Ed13t2Mc/OA/0a7qJ7wvpMvC+SPx856Vxm
         +/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=D3rY6gUN4XEadfm3H+Fhn8Wvy9CY5Sm31Db0V8RdJB0=;
        fh=HGLG+roskaFSR8dRRdSZ32IjkbQrxDGsWrik4NxscL0=;
        b=AtHMxb4R53sJcO8+fpk4BkX52wDpwoNZheokKvk2QvFBghDg1aOEx3hcMPbY78RLdA
         w29ggYIq2SCYPrfqfHROun4w37sMUnFBrAo0Yi2FBhTo4cuGmhp8lETTPFxqMhPGkFJK
         BEf7qAlanK/HPzZti9OgE4BPf21VZVhApM3hyjZTYtO0BO2p7zk1/TaT9jP7cZBXoocS
         ZrpfIZbZokAxY3BMDz+rT4yA2p1uCrZm13KMYcDH4tZqumtNs6448iQVd58qbjuHb4z9
         stUh1tQv6qNL4VIWw9Lp8UPq9EZLjS8v8mSrdTKG1cXeRMviJKrOLZ2CMkRBOibu1fGg
         qoRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SQIxmHcJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a056214202800b006903c85415dsi197735qvf.126.2024.03.08.12.17.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 12:17:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SQIxmHcJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rigeZ-0002kH-6T; Fri, 08 Mar 2024 15:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rigeX-0002ju-8x
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 15:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rigeV-00024p-Jn
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 15:17:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709929029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=D3rY6gUN4XEadfm3H+Fhn8Wvy9CY5Sm31Db0V8RdJB0=;
 b=SQIxmHcJj4sst6dYt8NpN1mTOLxhSusRLUrtyJvkgL6rJcy1AqufWKiJITIwX64zZaz+b6
 2P0Lz/dsDuyLf1NpGtw8J3chASBvbP6wHSxXgAGaQb7GOjAoQTtwIS+zbAqdcDL+Is1rE4
 pLvKmdu7uGkJF10OaeCq8awWkbaKSSw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-FFUsuUtMPPGh1R61x465SA-1; Fri, 08 Mar 2024 15:17:07 -0500
X-MC-Unique: FFUsuUtMPPGh1R61x465SA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-56544b5af9dso1414186a12.2
 for <qemu-arm@nongnu.org>; Fri, 08 Mar 2024 12:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709929027; x=1710533827;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D3rY6gUN4XEadfm3H+Fhn8Wvy9CY5Sm31Db0V8RdJB0=;
 b=Wt5f6Z4kOHl1yd+O9OrQuNwylfvV7LR/0sJO20be3Q8Gfkxv89rCopTV0qhSqVtjvT
 1LbAxdFbX+aO8Q1W2e0qIn4182h2XNcmUDcYKeulNqQBJAHI3cFcZMAPcx7XoQuGCRsB
 CLkX0DqG+7qGSmjSBdatgcaWbWZHo9PMeXED+Xs2JUkzy+d2MxGY/CX+aKlGgInpXJsu
 BfRrVN9s+kkY5d6wKEzbliF3wFXAetCwyKqzvbeaNqSITjmPMhtcoq4geY6RNpUlodc3
 kUxzGAnJK9mY3RcQxU7wdBHJJoAV/62/V7K8+d0bmrzIe0bMH/G7KHFV9wIiR4mStM6k
 sd2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjcoTgk3Fjxa/9RjT484feVrixVK3dHVWvab49bm0DNgXHkeu34T3XxobYuWCHJh7OKfu9WboUNBPcrtR4D18ZR+eu
X-Gm-Message-State: AOJu0YwawLoWNvIS8rMinX2UznQJfBcA1X0eI+PG4r+yLGQA/eEEREcN
 5vNzUHWzcsAS+BYUrJJAp0i5i4ZYeNibkyENaoBdQasFn7TIBJpOj8PFC2ws+yBLma4rbAzI4js
 pA5W7kVz1aYCoCy+SIzOAnBLMHzyswDTIR//wH3tlrvSpiI9pdg==
X-Received: by 2002:a50:955e:0:b0:568:1b18:1d11 with SMTP id
 v30-20020a50955e000000b005681b181d11mr172498eda.41.1709929026786; 
 Fri, 08 Mar 2024 12:17:06 -0800 (PST)
X-Received: by 2002:a50:955e:0:b0:568:1b18:1d11 with SMTP id
 v30-20020a50955e000000b005681b181d11mr172489eda.41.1709929026421; 
 Fri, 08 Mar 2024 12:17:06 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-151.web.vodafone.de.
 [109.43.178.151]) by smtp.gmail.com with ESMTPSA id
 n6-20020a056402060600b005682ed4335esm100842edv.91.2024.03.08.12.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 12:17:05 -0800 (PST)
Message-ID: <81c969b4-ffce-46c8-bcaf-25216e729fd0@redhat.com>
Date: Fri, 8 Mar 2024 21:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Deprecate various old Arm machine types
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240308171621.3749894-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240308171621.3749894-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.572,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tW3qVu5v2bDn

On 08/03/2024 18.16, Peter Maydell wrote:
> QEMU includes some models of old Arm machine types which are
> a bit problematic for us because:
>   * they're written in a very old way that uses numerous APIs that we
>     would like to get away from (eg they don't use qdev, they use
>     qemu_system_reset_request(), they use vmstate_register(), etc)
>   * they've been that way for a decade plus and nobody particularly has
>     stepped up to try to modernise the code (beyond some occasional
>     work here and there)
>   * we often don't have test cases for them, which means that if we
>     do try to do the necessary refactoring work on them we have no
>     idea if they even still work at all afterwards
> 
> All these machine types are also of hardware that has largely passed
> away into history and where I would not be surprised to find that
> e.g. the Linux kernel support was never tested on real hardware
> any more.
> 
> After some consultation with the Linux kernel developers, we
> are going to deprecate:
> 
> All PXA2xx machines:
> 
> akita                Sharp SL-C1000 (Akita) PDA (PXA270)
> borzoi               Sharp SL-C3100 (Borzoi) PDA (PXA270)
> connex               Gumstix Connex (PXA255)
> mainstone            Mainstone II (PXA27x)
> spitz                Sharp SL-C3000 (Spitz) PDA (PXA270)
> terrier              Sharp SL-C3200 (Terrier) PDA (PXA270)
> tosa                 Sharp SL-6000 (Tosa) PDA (PXA255)
> verdex               Gumstix Verdex Pro XL6P COMs (PXA270)
> z2                   Zipit Z2 (PXA27x)
> 
> All OMAP2 machines:
> 
> n800                 Nokia N800 tablet aka. RX-34 (OMAP2420)
> n810                 Nokia N810 tablet aka. RX-44 (OMAP2420)
> 
> One of the OMAP1 machines:
> 
> cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
> 
> Rationale:
>   * for QEMU dropping individual machines is much less beneficial
>     than if we can drop support for an entire SoC
>   * the OMAP2 QEMU code in particular is large, old and unmaintained,
>     and none of the OMAP2 kernel maintainers said they were using
>     QEMU in any of their testing/development
>   * although there is a setup that is booting test kernels on some
>     of the PXA2xx machines, nobody seemed to be using them as part
>     of their active kernel development and my impression from the
>     email thread is that PXA is the closest of all these SoC families
>     to being dropped from the kernel soon
>   * nobody said they were using cheetah, so it's entirely
>     untested and quite probably broken
>   * on the other hand the OMAP1 sx1 model does seem to be being
>     used as part of kernel development, and there was interest
>     in keeping collie around
> 
> In particular, the mainstone, tosa and z2 machine types have
> already been dropped from Linux.
> 
> Mark all these machine types as depprecated.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst | 15 +++++++++++++++
>   hw/arm/gumstix.c          |  2 ++
>   hw/arm/mainstone.c        |  1 +
>   hw/arm/nseries.c          |  2 ++
>   hw/arm/palm.c             |  1 +
>   hw/arm/spitz.c            |  1 +
>   hw/arm/tosa.c             |  1 +
>   hw/arm/z2.c               |  1 +
>   8 files changed, 24 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>



