Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3478787lfm;
        Tue, 21 Jul 2020 10:22:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWiv5rFxKJU/zaCd4dcq4BHmOZEmJShZBKMLd3uSmo+bezCyzuALuyyvubneD38o57x+Vr
X-Received: by 2002:a25:404e:: with SMTP id n75mr41716720yba.482.1595352159281;
        Tue, 21 Jul 2020 10:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595352159; cv=none;
        d=google.com; s=arc-20160816;
        b=CYf9TAaUo6HPYWMIXqIpZe3vytrcr3sFDNCkMH+JqsGgL2VHUxl6KuSHd7oLKXHEwS
         9QdUezrGRPqZQXSPXjtP/yWPYuS+/FOTrAiFKBW9LXaXU1U9lQ5opauJwpoI1VudkVaz
         +ESfC7LbuXP0swVX7FEU66mw5OCscHROO0pMbzp2Awkg9soBbQTS254pZCApg0EGum0t
         EYmu+y8kE7ianSjs2CnnKJlGtnsu4J/W+wwwSgID/9GNozeed/wxYh/F7d+3YjcqJL4p
         WeD7ag7OKVH3S5612CUgXsK/Fe7cVBdvikS5h74mMi5dAcFIAdVlyRVCg5EeS0eirDcJ
         7OQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZEx9mwXay3nVfsKJiKKT457CRer329MhMAoaD+G4I1U=;
        b=lFvKmsgMbzYKvoRcsoy3reYjNGpJ2QUUgStrS1EEYtg76kf0nJ8dqZ3LHYYnw+zSMp
         CQumft5sVTv8zRQ/wDWw8K+Gr4WdUnYuXUE9iI3sd9D9daL4gX16fw2CJGegoKJ2Rlkg
         2hKkDt4lOr6/se/OG6QgHPEMLXkoeFqFVLtjSPzdcN9T9YRrk5iwy34p3wEq1S4QGWqB
         uNASTiFrF/R53p6SHOoO0xaSFgDgHIk5z3jr+IZRtA5TBsQfQaCWugz/Mx4zPzMCMalD
         /YZw8L59td59zS4clxovuGYwUTqVH0op7UvzCaHo2AOJSPWJWq1WtwGdHLVQGL92hTdV
         dHLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xV/RNGZq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b79si18826442yba.44.2020.07.21.10.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jul 2020 10:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="xV/RNGZq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jxvyQ-0002rS-Kb
	for alex.bennee@linaro.org; Tue, 21 Jul 2020 13:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jxvxt-0002T8-Qy
 for qemu-arm@nongnu.org; Tue, 21 Jul 2020 13:22:05 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:54549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jxvxr-0006cs-7x
 for qemu-arm@nongnu.org; Tue, 21 Jul 2020 13:22:05 -0400
Received: by mail-pj1-x1042.google.com with SMTP id mn17so1888245pjb.4
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2020 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ZEx9mwXay3nVfsKJiKKT457CRer329MhMAoaD+G4I1U=;
 b=xV/RNGZqXOlleXt012rPEGvBM0Rgj/LbBHIDlQ0x0u1M7QNJ9LZhv7SEFdFgPm6ImZ
 1kkSfKg0eKIhPE9zv5OBDHp69xxbxhvoqemVSYMiV4hn4p1M5JKJAwXy/gTrQ/797X41
 /lwrXOPcdNin/1H6gcwN1vWqRpvUNp+0Coyr9tQv+1JEHCNl+caO9G4K4xDRpt1iMjpP
 guveS04s6C2Cdh74vByMQIdX1F3eGfmMStJEvjiALhNyL182NPE4nhtDvls7LjjsCInn
 aJTZutoQHFsDCEDmJM8lMQwjIByGYuaVDbvMZv6optHBVEZjBLm/KX+aXcU7wy90YwVg
 SQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZEx9mwXay3nVfsKJiKKT457CRer329MhMAoaD+G4I1U=;
 b=LoxYNBYLnbLYZHVCNHWL/i5tP8D0NKRIn4jiEYK9oiakUFoAL9Xz00JiRDg2EO6Rkt
 h0COMb8wIXNk1wvQIOHd3aa/gqmq9lNV0S1SSaH1l1eAwA7eJ4ZRuWETL/q7+GK5E6zI
 AH+fOEJ6djxbqaqWPjwtxo6dhWUGj8AWL/K+HubFPLxxaWVCM3jYgJKdGSTpUe4SN760
 maX8F1VGD//nQwu6lZVsft9cHtd79TSdxfqDcrzk8tT6BUZdnYi1aB3zDuf5PVWOaZGJ
 DjyysgExqiBlB6PiFhdkZthaQ/lmlP8HyNdpErMswrjrdbNUrFMbM+HhbXUSclb0DXn6
 +SEA==
X-Gm-Message-State: AOAM5331T6ZNLt50cF/EWycl5Vre0H+wcWCp8WywmJTqem9uSiwlFNVU
 l1FrcNb95yOsLVbuWk4D4U8TCA==
X-Received: by 2002:a17:90a:d3d7:: with SMTP id
 d23mr5790986pjw.232.1595352121652; 
 Tue, 21 Jul 2020 10:22:01 -0700 (PDT)
Received: from [192.168.1.11] (216-160-65-90.tukw.qwest.net. [216.160.65.90])
 by smtp.gmail.com with ESMTPSA id
 l134sm19204852pga.50.2020.07.21.10.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 10:22:00 -0700 (PDT)
Subject: Re: [PATCH for-5.1] docs/system/arm/virt: Document mte machine option
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200721143556.19484-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0459473-bf58-79c7-4c5a-4c0da25b7818@linaro.org>
Date: Tue, 21 Jul 2020 10:21:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721143556.19484-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gNtmYKUP0Ukl

On 7/21/20 7:35 AM, Peter Maydell wrote:
> Commit 6a0b7505f1fd6769c which added documentation of the virt board
> crossed in the post with commit 6f4e1405b91da0d0 which added a new
> 'mte' machine option. Update the docs to include the new option.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/virt.rst | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
