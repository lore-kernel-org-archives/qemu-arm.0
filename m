Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp131365lfc;
        Wed, 11 Mar 2020 21:38:50 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtBf/vC2eg3cx/467hZDIjInqZCZSwb3AQCIb2ucFhY8DjRQOz1qgncUNgYzUDHHTwKt5lk
X-Received: by 2002:ae9:efd1:: with SMTP id d200mr5286006qkg.79.1583987929976;
        Wed, 11 Mar 2020 21:38:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583987929; cv=none;
        d=google.com; s=arc-20160816;
        b=mbQSwU0g20QCbNfn1N5lpbPzYPpy06DjK4dkrj81uquOdMKresKSsLTFkXdr5tiv5G
         +SzM/mm3BE+HrTcDMkgvD6SHi+kXCdHEsAzgdRcs+GWRBqif4UjvfKOs9VE4LA99vXAH
         n6yMTHTxn1NY6yBo4Ukf4tPd0jRvcWu+LWT4iYuyyY/XeUyJmfDo1xmlTFqLbbFvuLNf
         EMlPSwVxArGx7qzRM+VT9UOH5ezKJ7YPRLm3G5UQw3N7Haj2WskgPhOaEpt2KCvMacDG
         u6mnIpg86IJ+LfGPD9gjrTf+3x9XVX3wSUiXo+BY76YL3BjfJ3Q0S05qV2NQZnLfOnai
         qYsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=BPruapG5gkRbwPfWuXzqL/1TOcvgyX/vSJbSLtZKK5w=;
        b=X2Eq/8raDd37lCMDwhsrCrXdPLqpXsNnqZ/oxVxBRmAaZ1WPAzmB42rKJlq/qDK2Im
         /QHCpkWzxp67sGVoed3MFxeCXxOlHgc6KPRZQjgLGZLhRMWE5uNCMuMWVvm5Ls8AHdjE
         BuySdfr+LA9MyJve2M3axsY6NP9MfWXYdbEiLIBYix+8i5OtzOYOy4xzWEEqgEzdruWu
         rctiZ0ZYMgO0yQJhUJZLHBltf6T0VNDVgsybeoIo/YotjLCczLbRP8agra+rLiv2QGkW
         faNQPjqfWTU6XdmL2BW6gNIdEoAl+MhrhaARy7fNEIVaAhVtlKfWu/AJ1Sp2pjYGIIOW
         3MVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJXlrRjV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k124si1905374qkf.300.2020.03.11.21.38.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 21:38:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJXlrRjV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCFcP-0001da-3j
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 00:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCFcH-0001dP-Vt
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 00:38:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCFcG-0000No-Vt
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 00:38:41 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:54841)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCFcG-0000N7-P2
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 00:38:40 -0400
Received: by mail-pj1-x1042.google.com with SMTP id np16so2008880pjb.4
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2020 21:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BPruapG5gkRbwPfWuXzqL/1TOcvgyX/vSJbSLtZKK5w=;
 b=iJXlrRjVQE2EKiA2R9VAb9bUhs8PkPkF7Pup4DzVvkXWkTMTVeqZvt5+6W8rOcbLNb
 /eXcYdzwVFnVT/4YEUC8q2zHAKslbDp1Rh2+iwmlpeW68uxjRD0+yMQAFsG5LiPjNI+M
 6WNSYposoa+CHbvyta58HskcPVwAJljQ209/AKCYc7M+jMgnJLXsw92+T1E+Qd9Wh9g7
 5LHag7dDVbK3BS7L4xFIBsHbYwyrd78G+EiZTRgCYtgLfYFETKEpRg1MnC2O7CkaaAs8
 ykMHOWLIds8OsXm77+JUIi0FQlBsaomwZtxzNUoy696Dz8kAIxiNTtQ405DlD3r1tQi7
 qyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BPruapG5gkRbwPfWuXzqL/1TOcvgyX/vSJbSLtZKK5w=;
 b=L1fFBlOF58DO7g9Sf6r7bxlgVOJxu7uHALmQ4K/CCIwUSdTMLUMv1I1j9Im2NgKY+X
 QNXS0n2u3ZO333xKRL7YLrVvvpc5/z/geeflVKiDo4abeqYtEGaZSqH8cmJI26dOcybC
 7ks/INqm5cjChXgA9/XJ29Xpto1F7pxgh8KYXsUfBDKjArkf5DLBVftaxKwiOe35/uuO
 M/2oMg16zOrR8f9hM3jPhkRXca8wOS8n6GR5SARkcDz3M/Jx0mfM094WawmKOLMKYuAI
 b1xL6tN2pzlpDXaZJRghPtEYmFL8XJ3LNcFWq7g88RQsdbtUsHr4e4sjocNenGLuianA
 72sw==
X-Gm-Message-State: ANhLgQ1tEKTt75i9Qhc+byBdM0guFrW00j8Ywg6eYMHT1s3pouwBIBEl
 dB0pEMd64HjZNfCB+Dh4CX3xvDTlCcM=
X-Received: by 2002:a17:902:9890:: with SMTP id
 s16mr6007662plp.71.1583987919419; 
 Wed, 11 Mar 2020 21:38:39 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y125sm2205770pfy.195.2020.03.11.21.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 21:38:38 -0700 (PDT)
Subject: Re: [PATCH 02/16] accel/tcg: Add probe_access_flags
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-3-richard.henderson@linaro.org>
Message-ID: <9d7cd2d0-298b-74a1-94e7-cd6889627c6e@linaro.org>
Date: Wed, 11 Mar 2020 21:38:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200311064420.30606-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cB5bL5rhojza

On 3/10/20 11:44 PM, Richard Henderson wrote:
> +int probe_access_flags(CPUArchState *env, target_ulong addr,
> +                       MMUAccessType access_type, int mmu_idx,
> +                       bool nonfault, void **phost, uintptr_t retaddr)
> +{
> +    void *host;
> +    int flags;
> +
> +    flags = probe_access_internal(env, addr, 0, access_type, mmu_idx,
> +                                  nonfault, &host, retaddr);

Bug here.  Should have passed along phost to probe_access_internal instead of a
new local host variable.

I've sent a v2 for this patch, in-reply-to.  I'll not repost the whole patch
set until I've also addressed any review.


r~
