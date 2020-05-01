Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp202680lfm;
        Thu, 30 Apr 2020 20:59:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypKZHVdci61S5icWSNorobf+0LkAP0sPAd08Aaxj32VMxHYksgWpDKfFoTDonxDxrx3tSpYj
X-Received: by 2002:ac8:27a2:: with SMTP id w31mr1870200qtw.318.1588305557701;
        Thu, 30 Apr 2020 20:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588305557; cv=none;
        d=google.com; s=arc-20160816;
        b=ZA6Bezw03fx1L+FlelG9VPyTdhzjPcp8ghWMN62F+t1h7y5nwuEpDAcjdCm3OASiXf
         kqFb5EwNfaz3lMSKHxVZqW+L/EONcuL9Ox6Z3WgeT19tsHx0D3ZhHS0HwujQYtObB35O
         F+vyjX1a0DXZcbsxlJ9s2DIDXa6EtoI0yUoYy9GxpuXDKhiFSgVppz3xCZsanMBu8EDR
         LepupKy5HzSci9kEJaTQI3IOUJMMjWrtnCf9fukktLHVMGKQdXZVZk7UOSxY3mSnv/cp
         CYDprYQjwCE2NiySd/GZ9PEdVDLR1/k1n3FjbFDmANbXEcEeetiF7YTwhsbewrkdL0AE
         JoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fum976EvjZXqcQsSO3m2Ob/cYuX/rk8gkGArfM1NSdE=;
        b=zHSDbCgNvbZYIc0ol4Duzk3w/aTschTnOJHRNIEYo8xW9psLxJX37BDwHZvbGY85Ra
         hUbTSMW/WanQO4k7pFKOeKrR5TGb4iizSogTm6xcXbG5jzkJJ2Q6uEl/e8Xel0JLxMBZ
         IGMd73HGAbbm4c4CDvOp+f50sGZBeePssUNNm6R0RLrnHVqbP25Ivy8kCllsxESYq3oM
         qBRb/Xkw5I5Vi2ZDs0RfuYSR3YB9JmaV3MWIqk+KAfQh2ogTRIj30kwtbAQVnFAj93S1
         Ell//h2dpmY0nOwom0V61CggZsYBFDNKsz2RXgF+PjOD78zgfFU5eHd+Pmyfz7NTYG6+
         O50w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CPG8tIRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id f18si922150qkh.196.2020.04.30.20.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 20:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CPG8tIRy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUMpZ-0008Tk-4e
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 23:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMpQ-0008Oc-QX
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUMpQ-00047u-7y
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:59:08 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUMpP-00042z-Qv
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 23:59:07 -0400
Received: by mail-pg1-x541.google.com with SMTP id l20so4034866pgb.11
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 20:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fum976EvjZXqcQsSO3m2Ob/cYuX/rk8gkGArfM1NSdE=;
 b=CPG8tIRyJwJodLsMYjYBKiiJ98Hc6w22kPaUFexU9Omqob7C7HZOeJEad0ubF6NSYE
 QoRbljy5sX9CCT5ione625Xf4R2EYQfyl/TdO5pQLAZ5Rizu1Skad9MeI/awOT8DmiGc
 ls7PXdH0Q1gOF5PQA0ATbBZdKkxji2UrOZGc9hKkrIPgX6fqjtPYBw1wswW/sRBnDNSH
 caZ7PJrJsbjyrJewj5spcxZsD4YHjL+prpx9RW0IPog9z84EimH6LC7hToN1npdiYrRH
 1W/6N/11H7LeVhch7I+uYEV6RrQOgGvxUmOiVZIolwOHq7ShSx3h7cdUNZ+DoG/iJhvU
 Xsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fum976EvjZXqcQsSO3m2Ob/cYuX/rk8gkGArfM1NSdE=;
 b=K9UcNlh/hVkDiFazxA9NHm24436qY7tOU/yqFPug46UbYKYcoyBFw+YGxiZULIshHJ
 CIoG1jeRiwbQDymnl9mQPbBmsqn8LnMiycJE4XFBQjmErQmbOZHqU7LmEIJzE+zp7LLi
 vtjXMCwO6DfaJid0GpyA5TCIiDvhFsT0o77oXhsaSdo2gPUh5VLAYsQEd+Qo9KckG+7k
 fQXrczda4TjAq5YlzGzq2rDXeZGZanuEcD7aU3HyNmCq4qhT7KoSM0cLNgvLpeo5p3pz
 H1t+HErln7gRJVuTZ0F+gChKfH1/QWDzH5XydfXe43l8U2rk3L5P2bpUkNP2XFvjERJR
 1eog==
X-Gm-Message-State: AGi0PuZx6pZV2gXFvOgGK7PN8vnZs8eU1aJOybn6SsTACuMs0M6g9JOU
 83EP/tWm/dCwbklejk0ejq+mqg==
X-Received: by 2002:a62:1b87:: with SMTP id b129mr2234795pfb.162.1588305546208; 
 Thu, 30 Apr 2020 20:59:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 7sm975889pga.15.2020.04.30.20.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 20:59:05 -0700 (PDT)
Subject: Re: [PATCH 32/36] target/arm: Convert Neon VPMIN/VPMAX/VPADD float
 3-reg-same insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f53f01a2-61f7-31e1-ae01-a98ee52abe3d@linaro.org>
Date: Thu, 30 Apr 2020 20:59:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-33-peter.maydell@linaro.org>
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
X-TUID: M0DGhiLCn0o8

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon float VPMIN, VPMAX and VPADD 3-reg-same insns to
> decodetree. These are the only remaining 'pairwise' operations,
> so we can delete the pairwise-specific bits of the old decoder's
> for-each-element loop now.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 63 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 63 +++++----------------------------
>  target/arm/neon-dp.decode       |  5 +++
>  3 files changed, 76 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
