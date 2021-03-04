Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6570205lfg;
        Thu, 4 Mar 2021 12:50:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybnd5f0lT33ISJWHhkOPtOLSz44aKaKzJDMKInC+SVMS+RIoL7dZnIgSrplTGuCtraObjj
X-Received: by 2002:a05:6e02:1044:: with SMTP id p4mr5811287ilj.238.1614891003802;
        Thu, 04 Mar 2021 12:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614891003; cv=none;
        d=google.com; s=arc-20160816;
        b=tWPDbXQu7gQxtTtQH9qcWC5KNdv0Tw8VEPTiuA8GfpaRn9o5WZNzKC6zppIxeeo7Vl
         g5ZN+D7eVqmTwRjEZMuZFVvKPa5Q9ulEYel3uNtCJuaEx9BPWCQZlJGBNt3B9TschWQ5
         7oxKoXO+f5eFU2ccsccXrzzUbc1t75+EsRT8JdWdD7EbkTAfQYxnwx8CP0YedRoBLkBb
         JJYGTgcycSmZt+OgyF4M4lW80Xwzk3paCOMr66VczFG3zAXjmeIjT+JC/n7hu7txPB/h
         STfov39ZecR4052b5LrtArfgojtjfzi/u2a22rqtal77HOVvbni/aMIPSLa4dc+jVTnb
         puog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GFgVY9MhRS6JvvQ4x+7F7gmoUKzOmPmyyCoR+mC3eYw=;
        b=IGTPlovqIqmOOu3dSWsbN2QtsyCO6N8BbgDYEhce75GbvVyLKMOYa+L/6oUsK58bmB
         mu0Vsq/UTTAN05gLA+m4/9NgRs6boNrPmmyCpyjDQmUg/TOr/LAQotYrP1q2kxyJmoar
         HYv2dXNzu+jm/ILidbJG1osqrN/Hsh9VjxkG9ar2D/wGbc1QEAXQp+piIwf74JTXq3eL
         w/ZzFMg1EKovALHHv81PkJi9maeHSZtD0tFzswvVkEfOUr3lnJWZeugFXc3AeiZNoZmc
         7TTz7oSz2RO/8ewzb0l1hbzaN1K7IilbheK16GE2RP2QI83VglVGfDw0jO8jNIQ5TUqF
         yNwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kwX7s6c6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si298172iov.47.2021.03.04.12.50.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:50:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kwX7s6c6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHuv3-000836-RT
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:50:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHulI-0005cX-EC
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:39:56 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:37136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHulG-0006kb-Uz
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 15:39:56 -0500
Received: by mail-pf1-x42b.google.com with SMTP id a188so2377146pfb.4
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 12:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GFgVY9MhRS6JvvQ4x+7F7gmoUKzOmPmyyCoR+mC3eYw=;
 b=kwX7s6c6hQ2lALNnoYYhOSczw+8pDcnB2bl8jMCBdwiFnezQXYY7I64Wu/o1g5Y5wt
 Nox2MiZAYezvgxF/aLKmTVXIBcyHtdilcDobd06HMojDkf/Q5+9R41TUG4cj9ALsFzoQ
 FLBv9E/to/BBV3Y2idem4enbxgzotBMTcZOs1Lo7jJaVq7Pbn5eupJgR7KYGhcUQv6/z
 SgWyLA8xladoeRPKOoouoUCuckywAXZuc6K6Nc259NvEEj1XKh+WPpmcyjwXZsf1ElFy
 EXpvoe9sBRyaaco+fvnuApr1tKBwYZhAa7/KsfYuSHT4NcVRtJexYCaqQj+1LLSCDLVU
 SgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GFgVY9MhRS6JvvQ4x+7F7gmoUKzOmPmyyCoR+mC3eYw=;
 b=nQy9Cg17tITS4+2pq+xsJveP7eP7/BVnTRwiYw2ngYi5+61j0KMBiAwsjAUtX9Qqi/
 S95Tfv5yC2EB12hU1adn9oFuVQuj6FT+T3iD8+lK9qECWlCKELDJoF3BaEZddQ+7ik1p
 Imiqsm/HExpDq7bIYXY1PPRbOaKuKr9/+GrJTKRoPTcwJD6Ll4jWemM/9cYyPPnkAOmV
 rXYgn2EZJpfXQ/nOVkwHf9GIbOgvqR2hpAMQ2sKwZ/W4895lyQZcHJOlY/y6LA8XIrhj
 1F+xauUp3gr21pYY7u6lvZ26vyFOrKumshjKJ1qEDLj2sJl1nNv3+cOxC5w3Z33oV8As
 XCqg==
X-Gm-Message-State: AOAM532eqk8ku9e5pNrtcBoW4cLlinn8oRyiwI8Dq+zOy0dA8wmA8iVN
 d1XrPWBwAKSANJelh8OD20V9Lg==
X-Received: by 2002:a63:1f1e:: with SMTP id f30mr5261092pgf.141.1614890391110; 
 Thu, 04 Mar 2021 12:39:51 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id 15sm255078pfa.58.2021.03.04.12.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:39:50 -0800 (PST)
Subject: Re: [PATCH 35/44] hw/arm/armsse: Add SSE-300 support
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-36-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8a7d9b2-28ac-9d04-d45c-54c6e6541970@linaro.org>
Date: Thu, 4 Mar 2021 12:39:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-36-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n2nwVVVlIqRy

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Now we have sufficiently parameterised the code, we can add SSE-300
> support by adding a new entry to the armsse_variants[] array.
> 
> Note that the main watchdog (unlike the s32k watchdog) in the SSE-300
> is a different device from the CMSDK watchdog; we don't have a model
> of it so we leave it as a TYPE_UNIMPLEMENTED_DEVICE stub.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
