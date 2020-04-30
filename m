Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2338911lfm;
        Thu, 30 Apr 2020 13:32:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypLIbJ3H+BW/1KsN7/76Ek9wuut1oAhWW96LZcBEYhcZ/GcIiEecUP8/iMVrqp0PsWJoet2J
X-Received: by 2002:a37:7a07:: with SMTP id v7mr352161qkc.198.1588278774617;
        Thu, 30 Apr 2020 13:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588278774; cv=none;
        d=google.com; s=arc-20160816;
        b=ZwO3l+8k3fBSDSvMAKggHMWQQosrhTqsaxheU7VxekOwLxyqSr+c8elWqV4ZkU0pHC
         IQ4eh2X+cB699qxvp2UKHFw1VfxBni+eEWFJwbGISMjCpUEtcnmEYBvPJYgUcDppkh4X
         mwO8Tcom4Gi0rjmWcXLBtKydm27i1PQhKv4BYfcopWzOYH9jdDexsPglQXnXQFXVxbN1
         0UpB/NTIvnGR7z13G9ZL16xb6RQXYyZQPZdd1iFlydbSYi9zg0Fu/kciXRkFZpX5gZvT
         cPIOrNCrujpot8LClZuvV3dxBi7u+G/EyBjRJsl6reweQONBlO0CiMPugdGzoOiC/AYT
         ITYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YErNcQ7OHQhvw8MS5JYWDwdtcZ9JepAj3kq5zFzWVp0=;
        b=UTbVZcxqE7FCUWyNtti9jaAI2/uCcxXto7SAkXoywv8t6WUef2SCtWDZPO3X9ctFkQ
         3dfNgLXqjBidt5C8FT36dpOOMe3AJ4pBr1qvgqXW2qh/SngWkvdA0nOTiLoYS74wGBwE
         DAMUnHJ3JAyTlZ2uOX6UXazMV6iWRLyIFGYw8EYguj76ouex9DtflovqFALs4yJopYlX
         D48GALEUz+vxp+Di31ocjXij3cVq2IOu84y26FNcywgwmy7PJPZ3B5SJXPKw07GajqtT
         Pk61zR28AFKKSVr/0SV3gAXnxgKynXXPVyEMmJPXKPFscsAl7ExoLYynxA2iFeU5R7y4
         wapQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dzHq/rZS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id cw3si499240qvb.161.2020.04.30.13.32.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 13:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dzHq/rZS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUFrZ-00010c-V5
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 16:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFph-0006hN-U6
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:31:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFpe-0002r4-Fd
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:30:57 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUFpc-0002pV-Hm
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 16:30:52 -0400
Received: by mail-pg1-x542.google.com with SMTP id l20so3423301pgb.11
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 13:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YErNcQ7OHQhvw8MS5JYWDwdtcZ9JepAj3kq5zFzWVp0=;
 b=dzHq/rZSJVpNhL/+jo4A+EvvyF2rtaTSUyDZ3pAe3DF9k+elPW+i31sbip5EDQp7NK
 rPII/cp6TmWLM0jySlNqlmAClCzAq7cg2uWSVCcJySFM94XT6YCw7XyA3XSfxJ/9prGW
 vBzwN3adzSYkYD40uXZCZsmMIKJEnSvvyU3/uGPoYCRc94/aCvbAm59OpB5Txe3nsMo/
 NpF8RC2nh7ntCI4JSMnoGeS/bSZOb8M7s/u2N3ZdzOaxRob7ojJMF/0mi54aG4gg0KdO
 b5bI5lVfZhaGgz/YMWcWAOHYfzOUnK0W9awEvr3Sv6GWW80dPevybl+fZx5wzzD4rMbJ
 cLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YErNcQ7OHQhvw8MS5JYWDwdtcZ9JepAj3kq5zFzWVp0=;
 b=Fd6L3nUNhcmMyP7RKcuOzOzhegLTtJozmEGqse2jdXrhqlcUUthtZ3B/rSOOKiWSJO
 f8F81mFwT6kifeThmZ+0HcK9SW3ysSaQrw0Di/llVt7Jy0nvt3WAq0eujRGp1eyfssUz
 rWsepV/ULOdaF/DJ/TIav8ZH6xzZTagS+5pIV6ZvRewxxCSjjfEFSzU+GS6sKGY0/TDK
 GpckYscuZ0ng1uB8KFG8QzAQRDENEeDHfq1ck8YzZ9qFuG53NujCxqxl06H/gipCdw+R
 ABp5cDYvmzLXyV6IhtIzsduj8ad063vJpH3jCa4Xn3YqxnP9GfPn16qU5y5HzI26xpEc
 HJUg==
X-Gm-Message-State: AGi0Pubs2hplpdbdUCNvqjj/CTu76t079urz++YUs6waaN581Dzz67lN
 MUc1SqZB1JgOYTEFr+SY4C/dHw==
X-Received: by 2002:a63:6f07:: with SMTP id k7mr799755pgc.274.1588278650108;
 Thu, 30 Apr 2020 13:30:50 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g40sm528068pje.38.2020.04.30.13.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 13:30:49 -0700 (PDT)
Subject: Re: [PATCH 21/36] target/arm: Convert Neon 3-reg-same SHA to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-22-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6249cdee-9815-83f0-c15b-0441d59904dd@linaro.org>
Date: Thu, 30 Apr 2020 13:30:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::542
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
X-TUID: YzGB+JMd/MTx

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon SHA instructions in the 3-reg-same group
> to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 139 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |  46 +----------
>  target/arm/neon-dp.decode       |  10 +++
>  3 files changed, 151 insertions(+), 44 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I have patches to convert these helpers to a gvec prototype, which will let us
re-use do_3same.  I'll fix that up when I rebase on top of your patch set.


r~
