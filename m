Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1340619eja;
        Fri, 1 Mar 2024 13:59:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXJnDqDVjCBW81Wi4q2Jcleqo3J3gigMFiLamwbh8LnzKjYDJNnAgR8Vbn2s8l8Z1b/KDj2wv6i0SWzwvVcgEeZN6dKWqnU
X-Google-Smtp-Source: AGHT+IH4eFZf3MltCczATd7RilM3boLj5Xc5+CZEVeoWDIjmIFdhAO8nqzfBqn/P0CvGfT7DOYpM
X-Received: by 2002:ac8:598b:0:b0:42e:d064:2231 with SMTP id e11-20020ac8598b000000b0042ed0642231mr2640916qte.13.1709330345896;
        Fri, 01 Mar 2024 13:59:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709330345; cv=none;
        d=google.com; s=arc-20160816;
        b=FMqzA/7JER8PyXsnjQw72oAQwCMMgVbqdeNn/QPjyCsYsNuOrYbqlCcLmdqGA3/pvb
         eUsHdCBgXMiUuTTkr+YtRvp5xY8STeAiZKlmKxRO2wVY92vmEAoOOkjPfAFOS+sk/5pl
         SjH/DrkK1ptL9WzvX3IJZmy3UItX7lA9srE+GqF9rSnPBG9r9v51T0H5BYr0l9G2ujGL
         bGP9g9CsJqjhrfPfjQ+1XZMCxZ2vA7twgKj55EwllmcZZyF6QNHPkEQg4vU/gxmSsLBj
         ZPwIal2W7h4odXy1uxm3Qun/oEk2TxywscRMpNMS1eRGZQ3J4UmT89QIHglq8/BZPG6W
         xtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5jT0CxuJEnE5tUgTaHMHdXhkiNyo/OhNsWLxNmpXTVo=;
        fh=XGSCxhhVoo6+BCPRNO22Lv3q2VvfveFJkcFEnu0HM7c=;
        b=kpmcBb7ZeI0CK/K15LeDCFoHqqhF+ohwj1+0gPSpF8lCnwJMT2ZyiDvHmD3RfVaY6q
         u0Cu5RtKZb9QKmAu0fsejuoyGV1nvxMPSOT2RVPOupnxCHzH7/QljNvikKsVVgikc+8o
         mvW7IwL6bPnJNWEdRD1pvL5TttCTLch13/FKbQbytbfDUQwd+U1YHih9WkRVxO7UY+1d
         ffC7vxqOIIXfsPLYN2UuRY232uk4pA86iuyoEeVCFrYxq4cRQ6/WjAbsaOxEpgOrsfAO
         8b/X6wu3rFJ7ml8e5IjbwuHcKEi3fsPtkNRo1tIrVFJgTm4j2orw/0b6i/xCSLnKEByO
         GSYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SJNenJok;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13-20020a05622a174d00b0042df55ba7fbsi573838qtk.658.2024.03.01.13.59.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 13:59:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SJNenJok;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rgAuE-0008VP-0J; Fri, 01 Mar 2024 16:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAuC-0008V9-0z
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:59:00 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rgAu9-00021t-1J
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 16:58:58 -0500
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5ce2aada130so2327385a12.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 13:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709330335; x=1709935135; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5jT0CxuJEnE5tUgTaHMHdXhkiNyo/OhNsWLxNmpXTVo=;
 b=SJNenJokP5VJ1+HiV//uj7+cYa7nc7QKD2XQQCTRLw6/Wy6XfouaM8TNIbsFrK4IAz
 GNSw49ItQDJnIfp9tN3aGcZBZ6igmhTjqhi+oRY2mnKfmLiuk8JOvSu0SvK4OxqC9hic
 y6wjh1OOIM1jylEzX3zqABNE6KtGdX8loSUbB2v8grBcu8YuD3aChjDNLXhWaXpF+xfZ
 OHuZJ5tsZyFoxICyc1nKCfETbBSvbhDgH+YV4fWtBM+2WsTkzuP3qvSiOiG5WlGGzhnV
 fttc4FJjgvQG3yGEw0L77v//mn+rX7vsqMGjqB4yvkbP1GDGuPnA+MhyQivzolIo9/aw
 vriw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709330335; x=1709935135;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5jT0CxuJEnE5tUgTaHMHdXhkiNyo/OhNsWLxNmpXTVo=;
 b=kVCZTBALJo9NbiY5qDKbdVFUihPDiIl1/vrpdaKq1TSedVEqs+VOqkN1D77P5ekkWN
 8EmBAJvNi7x05ik3uoF/cJbVIBh6B769kM8Azne5Kzff1O1IHHkgIVKCq7lLuG05aKBJ
 doqMjq3JfMV+Fr4BjOzpUzTEl+XjQIdJBrYJEzRi8VLB1VXSbyNzvpOgVsL/fnZ6oeLW
 wV36Mj9W1Gn3MUl5SHYndhelGYpI1mf4EutVTN9kXdzHGOz/Z/11AxUOAn15pV936om9
 Zptdu/EJeDqrIkkwvn7pW9D8O3YuMqzuvYzYrTIod8nw2rxwF7OU1R/RzYdjA9Ca2seI
 uW4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyzOGzj/CK+gX24dzhMXilxsUUgdijd/BB95hB9rWZ/HjSquvjsE+EkWJxIiwRnM9SEf+nXmwCoE0yleDd+Oi2vbxW
X-Gm-Message-State: AOJu0YzmrWRScWyHEeOdSsviFt4N+2lgA9QT+ZjFDjPCii3AdN7LdC3d
 pUPzvcwz4KAdq+Uar8U7EL7SQLf856i659n30kVe5iCe7hmkooUmyS3KnFwzBr8=
X-Received: by 2002:a17:90a:b881:b0:29a:8c78:9a7 with SMTP id
 o1-20020a17090ab88100b0029a8c7809a7mr2709892pjr.40.1709330334887; 
 Fri, 01 Mar 2024 13:58:54 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 db12-20020a17090ad64c00b00298ca3a93f1sm6006165pjb.4.2024.03.01.13.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 13:58:54 -0800 (PST)
Message-ID: <81774643-dee7-4279-b622-f9435373401c@linaro.org>
Date: Fri, 1 Mar 2024 11:58:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] target/arm: Enable FEAT_ECV for 'max' CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240301183219.2424889-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: g7qZ6wnY87NV

On 3/1/24 08:32, Peter Maydell wrote:
> Enable all FEAT_ECV features on the 'max' CPU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/tcg/cpu64.c        | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
