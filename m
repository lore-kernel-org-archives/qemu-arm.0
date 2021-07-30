Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp485195lff;
        Fri, 30 Jul 2021 11:58:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHe7JN95QwM43zpSv1Msat4cRl46X5hD7PCU/wWKgFRg5wbDrlccx809yn75sdKyKAWlCH
X-Received: by 2002:a05:6402:27c9:: with SMTP id c9mr4905940ede.234.1627671517522;
        Fri, 30 Jul 2021 11:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627671517; cv=none;
        d=google.com; s=arc-20160816;
        b=oXduTqbofvnPfjw3IoZ4+HsF3Ld/CpEryK0UPR8hKDz2CcMQrnRVNw8bJdYPvp+ORg
         pOr4LCYtkt3Vn12MHx7VzOrfMETwRznbJV1QMG50qw6x/PvOWCQbrrSIlYNfgRO6wL/h
         Mv55Ex0orL3GQR0h+K95GgaHe4aSVXIY4HPuZ5K8a260cRZZda5N9+b1+S6U52SxFqxv
         OG849zgEMVaWWjnwmFUwnt2lqndT61hFJDLvfYLnCrNy6LT2kDa1BK3cPIbjvtwN/DE6
         ahPhw/rPFxEODB0asrYgJ6SDxuTwD513wUdflf6A9aF77SmtWSBSoK99y/w+lqXUyoZ1
         DThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wP8ylPIdv1FXFjp9eV4DWObaQYgABZJK9kyrEMZ5g24=;
        b=JwPvS7EJBtRwWK9J5DB5mcW7pNFOyt9ghFM/piixrjX9V3P+eHGIyFihva2AwLU9d0
         bADLJKQkyjJMzUPIZWvcuS/I+tyUa+xhpzCQnyZIMUcbbfp9W1igN/AXMcR2IBK/yL30
         1zeH/rIaETTcvCAtwq2/hu9dwpVnM0Q0NtW9AR8GHrDuotODq2CtxgwjSk/Gu9GXjIdR
         OzGighKqQvaqNCa6Zj97wAOd7Z9bywDI0Bq851JUFiVql+WRqP9+EoQogSUGxv8wbvqX
         R2DQl6AuCLkOcz+1fWJiQ7/9+viQDckBafFw5gNdkgDKkjKsDN/OA2ZGKUkc4a5vCUxp
         nQhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VSXtMYgy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si2774956edb.59.2021.07.30.11.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 11:58:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VSXtMYgy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9XiO-0002OZ-Kw
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 14:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xg2-00081E-7R
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:56:10 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xg0-0003rK-E2
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 14:56:09 -0400
Received: by mail-pj1-x102a.google.com with SMTP id mt6so16612881pjb.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 11:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wP8ylPIdv1FXFjp9eV4DWObaQYgABZJK9kyrEMZ5g24=;
 b=VSXtMYgymMNWXFlaFQ/2DmqKvD/HOuI2kBHNFLQX5qlxOvgk/9q/i+MOeo7bVW748G
 Ft+h6/9pSFVM7YsFV8GFiqdkJZRBPmMFKOq0guk68ZxC8iIrImA49m2i/Nrq9QphA8qW
 cSi01pnkoiie3pBT5tXRoVylDlELuXWkuC9YJAj6fDmzxWwrpB6ICU6JdX+mlfIBLWBz
 SC5ITXNyCDNM2zoeeuVEZUaPQqttRz1rM/CC+Gc+/ZhWT9I56laQbuTmiLs7T9VyamRI
 BC01bYfT6+MlGDywXsfaEeM6apPcWNgsPUdeOunTxqnRWfbLWA/092Zov+PeTp1GpcyM
 mS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wP8ylPIdv1FXFjp9eV4DWObaQYgABZJK9kyrEMZ5g24=;
 b=jYNjJs8DSToMwAXtpc25hb7+3vTOk3ON+iii78DTm7wnVsT2nq6fSvri6gxJzSfngq
 Tk6MR+ym+M7L/nltbF/M6vCBFfRfSRhq5zlNYegFTc6Lq04D71jE4V+T/kuhwX2H2fAP
 CQqquNhNID1bMN/isGDHsOERCok1pm+s2OJdlkMFr5R3B/QiYuEkUPwlt4nPl0sthr50
 7tBbDCH/4df2+LUsA9kNa8Rtn9SH+GDhLMKFP0ftCjzgXZk+UJaEvm+ROZ1Hw6wiWMLG
 jEVNDcj4iTPmn1zDSQE8Q2VYnQfeZO/glTZTRbBGEtdIA35GKRX7p6RtSP5qj/8e+eU/
 qAsA==
X-Gm-Message-State: AOAM530qWEhIqNBGzcvr647Poa+xRQ/AIp1b6VfP0dRzs07I+BTawsyE
 PM/fTL5nNC0r1T8Z083D51URvkDhYyvffQ==
X-Received: by 2002:a17:90a:6a47:: with SMTP id
 d7mr4633253pjm.176.1627671366836; 
 Fri, 30 Jul 2021 11:56:06 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id f7sm3030681pfc.111.2021.07.30.11.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 11:56:06 -0700 (PDT)
Subject: Re: [PATCH for-6.2 03/53] target/arm: Fix MVE VSLI by 0 and VSRI by
 <dt>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40a2512c-5a65-a50f-fd59-881b4110430d@linaro.org>
Date: Fri, 30 Jul 2021 08:56:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nnuuN7+zj+iT

On 7/29/21 1:14 AM, Peter Maydell wrote:
> In the MVE shift-and-insert insns, we special case VSLI by 0
> and VSRI by <dt>. VSRI by <dt> means "don't update the destination",
> which is what we've implemented. However VSLI by 0 is "set
> destination to the input", so we don't want to use the same
> special-casing that we do for VSRI by <dt>.
> 
> Since the generic logic gives the right answer for a shift
> by 0, just use that.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
