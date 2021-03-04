Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6534986lfg;
        Thu, 4 Mar 2021 11:58:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKgpY39ZHDUIq2wBy8/kLvewvMRLtf23bKnbSCyKoN1XmPMfKTOsht5s9C1KBTDFG2rw3u
X-Received: by 2002:a02:c017:: with SMTP id y23mr5871818jai.3.1614887913527;
        Thu, 04 Mar 2021 11:58:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614887913; cv=none;
        d=google.com; s=arc-20160816;
        b=YPg/94kKK746OIPkwTrgyPOELD6QSIEP8uRdYZN5mZXmunJq0E+qOt9Mjy7Y85hDji
         keR1E/DfXz03x3/ziKTV9dUvHIUU+N3IEje3p0Z3tyCA0EARStzaO4AP20Aawcf30ML2
         LrblRpUnWUPBRmf2D0TiCOJBguBzcQEs4thZHx/XbMT0cyF5OM6Mtet8n7iw8trTH3N2
         tLeVRgrDTnRU3OKOchK2cQ24qrXldlk6xMZLp/za9C3qeftCtl0TCGgKjmM7UGYd048R
         R8DQG3WeNIWoRkFajALOUwBj7Rb5gvfBzUp8nhS5OQk1AXcZNAp6yd3HaomTu9Wb0UVL
         a5AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Gc80jmjHOVt3Jl87bCK7+mkJZ7Hg3sAmhWHfe7H2xSI=;
        b=mU7jBjA6rj+nZwcUn7PSnRVwTRsyU9whly5ltCqfjZRFumxpV7qRThe5L2kNFZKxYt
         B1xseEBqBu4ig8TkWVdVD3vmdfobcEVYu6N4Tx/LSiowgETX3IkBR6gLo1cmOwiDYE0C
         gpi5f7r2mt/TgSWlGsQxjT+sRmxPVuyC8+LayEeiReWK6fhYnmDNqjYV8Dk0e0TODgYg
         tWHdBFM+VK/BajOFn4wZ2uoYZhE/PVSGkEjahpWKMe2XRm3IjHdILNf1tIt62v0FPrc4
         jvn+ut4oRIO6UY56fJrVtSBKeIUNMo8/J0q6jkiSrZhFaBLsePoPC6Yd9ZJPhPBc4C+A
         1NKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWtGIytK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si282215jap.42.2021.03.04.11.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 11:58:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWtGIytK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHu7E-0000E3-Qn
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 14:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu6U-0000Ck-PZ
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:57:49 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHu6R-0005mH-BM
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 14:57:46 -0500
Received: by mail-pj1-x1031.google.com with SMTP id s23so7868779pji.1
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 11:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Gc80jmjHOVt3Jl87bCK7+mkJZ7Hg3sAmhWHfe7H2xSI=;
 b=TWtGIytKpmFoBS92PmHi+xcsACjQRfPeYzhj7wm2YZ/IACu5weAdhckhOdylbeLbl7
 i3RRTvZzqyWBGJzef30Ihor2cpu/5cyBPF7IQYXMZccOQA2RkO7AhIu2VMQG64RdL23a
 dD1QZgn7xwFIRdvPWJ0nXEMtdFh5iTIRF7quZt0EXtR6ljH9vfWdZbapgjQEojjYLQQt
 j4Mm6l3L0X10jRM9QpsWeEesnST/ip3yUFHugFGcL0Jwo/FRv+1g/D2dxM27d9s9bqek
 VZJ3CfRQTkBWsT4R9pzzL+o1u3Gk55lI+ctYMQIWR75VagqN9PR/Gg+icBgWx88gqCjv
 XZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gc80jmjHOVt3Jl87bCK7+mkJZ7Hg3sAmhWHfe7H2xSI=;
 b=B5kOEBxdb1RRSZdZV/XXjnO3DqhEymvBi3k1QDIzgrBZlt0IlrKm0xPbpF1szAA7jM
 3FyjUnX62QHZsFYD8uaB8H9+2Lz+DI+6tZ4w1kucDMJo2UmyjLGCGyrA59Ynih7enPSZ
 5MNllpAvzkaAaQzrjW7V0Oe46lMWkjs8lqrNvgd9tS03mSxksO52bBc2EPjXovreZ5jp
 z6h6XE6q7NvYFCzbnZZs8orjTHkW5mToC23n/3/6S4hUYD9QVoJZqmfOkx4Ke9dvrQza
 RBBuCvEHEkyVpMvczHY0WX6Igz8tWRELdmgfK2PemseexGjGV4cwX5zB4TaKmLGJRwEd
 XUug==
X-Gm-Message-State: AOAM530Y0fHVbvlSNaxpdTZhfzYBOlrIAwu0zkSRAtIyPMHOyNKPm33E
 BPn0BthfXMSnkXMf+NYxAYX/dg==
X-Received: by 2002:a17:902:8690:b029:e3:91f9:eaeb with SMTP id
 g16-20020a1709028690b02900e391f9eaebmr5458205plo.34.1614887858758; 
 Thu, 04 Mar 2021 11:57:38 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b130sm207896pfb.65.2021.03.04.11.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:57:38 -0800 (PST)
Subject: Re: [PATCH 18/44] hw/misc/iotkit-sysctl: Implement SSE-200 and
 SSE-300 PID register values
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84b4b72d-b6cd-0d93-e9b5-376b1a01721b@linaro.org>
Date: Thu, 4 Mar 2021 11:57:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: 2xluOFrJgvn9

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-200 and SSE-300 have different PID register values from the
> IoTKit for the sysctl register block.  We incorrectly implemented the
> SSE-200 with the same PID values as IoTKit.  Fix the SSE-200 bug and
> report these register values for SSE-300.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
