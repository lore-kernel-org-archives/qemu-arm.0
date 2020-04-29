Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp898386lfm;
        Wed, 29 Apr 2020 11:42:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypK7M56lqVL5OzNvnzK1+/RmG3w96t1nrAmM43UlwGw8NQBMggEyUwPFgrVm4wIZ4wThorqx
X-Received: by 2002:a37:9e4a:: with SMTP id h71mr34014710qke.341.1588185725148;
        Wed, 29 Apr 2020 11:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588185725; cv=none;
        d=google.com; s=arc-20160816;
        b=Rm02RDXZk/rtBbc/kGuJNsqFbo4+cfAW+E2GJwg5ncOhkoxGMpqlU/LLm/T6Pi9hHQ
         wCRggggvxx73o3uS/dKixDYjfxZiH+roTZfwN5g3O4/PlXoCfiNQOWepTvzlA0K3tfOs
         yXmgtWKhj+rw6s1ocIzSHvCUZWDgKlo2Ht+2IMMISJ3o/XM+/kx70a8gaRJQ/HwFvRCN
         73qidpvsX1Ie3FBXZKSCKjgTMD9chyxI3OxbOkXTbKhmIosIqpL2Tp7uEFDz7CJ1p7Nf
         eh8PnLSwPIz1oV2k59WkLXPS9fDnIreAeQE5pi6rIUXqYfKxvHAJWwRWlsFTwjKEMcxK
         0jiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xy56eoJUJWZN+BstVmu/0c9syXwVAf+2TuYgeFfXSx4=;
        b=qchoFlmkzPpdcVFU0lpVwcfs/8b3kzvadqYxzW5V914ROed+BDTTx4DTSWFTRcCW3b
         4z5fyWVu4qyAJuAY4HuzFV4QIbLsnmm4HyNbe6dqSkxFrSj/3bttyR5m6g6Y8QzGPOr/
         wCe7MjgCUeI+a5yyDqXmF3PcqlPzualRRpORIY3Q1mKJSvW4NLyqa21mRirAngQq4WwX
         cg1rD2Yodu/fnXVyw7Ao+6i/Wk/CU9qvlusZlMNiPq6ZkbELXACMlbu0tVchTnSzXSQW
         5eG8hee3WmJwnJcdGJZ3ugkeOSb9yohlAhAUdd3Zzb5Lz11nngbV9OG5JSE3YJfJzM0h
         xV+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yZh+mZ+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id r17si58708qtk.333.2020.04.29.11.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 11:42:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yZh+mZ+P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTrem-0008CK-GC
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 14:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jTreC-0007cV-5i
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:41:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jTre0-0007y6-8y
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:41:27 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jTrdz-0007xl-MF
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:41:15 -0400
Received: by mail-pg1-x541.google.com with SMTP id h69so1421726pgc.8
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2020 11:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=xy56eoJUJWZN+BstVmu/0c9syXwVAf+2TuYgeFfXSx4=;
 b=yZh+mZ+P7Z6Gg7XAdJH1WpYreRP/Y8/UyGYuHA03soLYtXzH9h/hMrFmnuFeiYFBrj
 3sbDk5SPWnsjg81ikpZBLGeh7Pc9JRfBtoJX66U7bpfpy2D9Piw6T56FCuJ1jA3jocm9
 UQMW/QWyzCbqbTn/dQ2MF9epPf7Kct6GhFklmVKzl3av5ZPDbkPXDh8thdmi6kK0Fw7f
 kJO7BIDFRI5p5eggf3k47WNLNh8oIUa33V4ePSoMNVmoqwqciVKU4YYTMd2FM3Vzrf4s
 lTnJCPNNx8Mo+uhlhZ1tTGibNEO7lOg4WViJUwPQPuhiKrKmy7ERmijSjOWuA2Ecicze
 8TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xy56eoJUJWZN+BstVmu/0c9syXwVAf+2TuYgeFfXSx4=;
 b=oBOBHeUbfo5XEPpG37A5p2QwZRqaZWZ2WYhnLINSPJMoJLoKuAo1gZMDQy1QOC3tzo
 mRF+P3E+dpqCw9c6yGMk51QsUuw6fgmGwhpY0zQUNB05n4/xbVz0ZJtD72WhF8O7J80Y
 /wH+jmx2q+rSeQKNttTUKWYrp5FTPJmnFRS+P4msYJ7opLiA5ehkDa/ggZXBNoNqDkjT
 o38+urpEWWcXpVSE2JusEroGtcENcqT+O+tqgd6yLeQ1slVeixMe1vm6+aeCV2+CfloJ
 Geu6WgJ+mzLuEqRT5K/DzZMRTZNg4mJvRwJb8O3p5F2lxxWhZtrKZ60DmF65+52WAK8x
 nlkg==
X-Gm-Message-State: AGi0PuYZhPkvmdMFUfGDzLkGLz9lwVgB+v7DEUld8YBX4x3bOLOCZ+7B
 lzcZDDFEYxd8KlnCBvXwUGdh8Q==
X-Received: by 2002:a63:ce4e:: with SMTP id r14mr14236395pgi.219.1588185674059; 
 Wed, 29 Apr 2020 11:41:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id i15sm1550955pgj.30.2020.04.29.11.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 11:41:13 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Add new 's1_is_el0' argument to
 get_phys_addr_lpae()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200330210400.11724-1-peter.maydell@linaro.org>
 <20200330210400.11724-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd6a7e77-5eb7-2a22-ff9c-09d3d8196d80@linaro.org>
Date: Wed, 29 Apr 2020 11:41:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200330210400.11724-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: pXJQb/2CUslg

On 3/30/20 2:03 PM, Peter Maydell wrote:
> For ARMv8.2-TTS2UXN, the stage 2 page table walk wants to know
> whether the stage 1 access is for EL0 or not, because whether
> exec permission is given can depend on whether this is an EL0
> or EL1 access. Add a new argument to get_phys_addr_lpae() so
> the call sites can pass this information in.
> 
> Since get_phys_addr_lpae() doesn't already have a doc comment,
> add one so we have a place to put the documentation of the
> semantics of the new s1_is_el0 argument.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
