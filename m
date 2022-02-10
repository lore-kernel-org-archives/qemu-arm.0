Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1884576lfk;
        Thu, 10 Feb 2022 14:55:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzC4Shd/IvT9Jn4TGlhre4rRsz+7G13H6dcxVwii1fFpbzH14sHf5mrBBjXTYvcQATAz+AN
X-Received: by 2002:a25:abaa:: with SMTP id v39mr8993562ybi.393.1644533727727;
        Thu, 10 Feb 2022 14:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644533727; cv=none;
        d=google.com; s=arc-20160816;
        b=UyucUrZJ1OaXdbnz0oxoKVuiLknFDe0UAkHg5qp7/TtzadDm3Hn8k2G3D/vOJRHHC4
         jZULZP/5wuqRBkA52JCIYrfumFgPIkOhgyxhySy7it0ySu0FJ0QBZrEbjyUklG4Ue3UJ
         i1CsHRHwVuYI4U0XmnHwxNByyhCzN7/zwaWkFbWHU1AezW8u/qatsgLdyJHArnn9gR4p
         CMYAGPcibcmRnQlv7GxnIeujBBYGQuJ9ODw/08Jw4vVb0upJihICYX53ZUDOa4bLx96V
         kdphTXUglVLks2KgsfpoJGR5bZI/dX22cizSaprwgVFF07610SL6ByoVi9LDEwHAdD/A
         GlcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=uUgDwKdebEN436ZzMu+C4qa7S176lAmVONz+bhBxS4o=;
        b=ioOXuOqJf8Ukvsl3VaYzhZj5uy6O0E4LNbhTQPJwzw2x21uLpLDEeYL4RpymjxQxTU
         jgyT/YyQHjYXWBfCOq6k8JGfo+2cueW2iIs+Ahb3NfcKTBX+ZgXsmYvQb07nSKD0W56r
         GQ5beY+EFmxocJQKmKx+S9abCBmNz2E7kUp/qK2gLG1yCDqEj8rwYGcMFP946MdbtjuG
         uZDUdMj2VCG7nUUEqvYusutbe2ohbjWtZ0foLAipiOQuMLNZlLSt2U0S3TLtK3kPQ4XP
         mtQHVmX5o/OwRfJyTuEM7YckqmRVBAiBATFx+EIp9wyFn/wKMfZ8vk0lVxFGl59OSMlP
         Abtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0LBjR0V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m141si12982404ybf.251.2022.02.10.14.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Feb 2022 14:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q0LBjR0V;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nIILX-00072n-5s
	for alex.bennee@linaro.org; Thu, 10 Feb 2022 17:55:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIILH-000715-1q
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 17:55:11 -0500
Received: from [2607:f8b0:4864:20::436] (port=44560
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIILF-00060g-2B
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 17:55:10 -0500
Received: by mail-pf1-x436.google.com with SMTP id y8so10206716pfa.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 14:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uUgDwKdebEN436ZzMu+C4qa7S176lAmVONz+bhBxS4o=;
 b=Q0LBjR0VwV3yryXzOozLgy/PikO2NTLkt+qDoHjLgHrJ4BI0RlnJUnqGyGrK653jD1
 wf0SljVZwWAGrKVJYaIe8oUaueq6O7pZ/OWcXncQb3gZAmkihRaqoegNMbNYtIosaFok
 u0xpTEtFDfuYrXE9zBh214FqbGvidyGW90EpoduIQj0G1PyFMLnM6hi7TvRmmlFyelkB
 wuCUDqLC0YrIW/NHbTIQeOBMCi+ShwlwTXSFIjL22K/Y0JLloybQcq1BW1yB5MGLEmHd
 EFmwC3wdB4l6B41+QaqcJ2ZY4fpXKDfTZ5+LmZ7rH9kkCj9pem+UEzj7OPyAfDOzo0cr
 cqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uUgDwKdebEN436ZzMu+C4qa7S176lAmVONz+bhBxS4o=;
 b=esYpo+VBxcoW3ej5/I5U5G8ebxv3gJq7aU6kS/dOe8eKtUr+VTaArfRMjyQRB9wnyc
 gvOMOw9HpXZDN7zlZ7TI08t/4wGoIbRPA/yPYRrBMVQr5kiYCfcZaCy5R9r3KXJc14KC
 K7J3bwpeH7j/9miDrRn/dmfPQoYcTUOSNi6ehCcLP8TopaiDizIiSwxA7kad9OiiA/mQ
 n92f29q8PAvc0l2xxwraRsiNWdFgXGn0+OMjr6u4pYzyWot5WsWlV+3GWLvnaVxGpnPC
 +tqQ0XTZPeb9u6+czaU+xuMd83y9/nEV8JcV/+yggaQ3A6uSxNHSKnDjtBSI131tQGZt
 ZFGA==
X-Gm-Message-State: AOAM530/+tBdurmmcf/3FBq5Fv97McQqE8fojcRCWzxHu4CyeHlYqHcF
 lhN4ye5z6J8ZMlh/Jv3qWaNmFA==
X-Received: by 2002:a65:6681:: with SMTP id b1mr7897114pgw.221.1644533706104; 
 Thu, 10 Feb 2022 14:55:06 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id b4sm24905495pfl.106.2022.02.10.14.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 14:55:05 -0800 (PST)
Message-ID: <348e0c8c-d387-ce2c-370c-b813ef4d9460@linaro.org>
Date: Fri, 11 Feb 2022 09:54:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/arm/armv7m: Handle disconnected clock inputs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220208171643.3486277-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208171643.3486277-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org, Richard Petri <git@rpls.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfzaDIaSEE3L

On 2/9/22 04:16, Peter Maydell wrote:
> In the armv7m object, handle clock inputs that aren't connected.
> This is always an error for 'cpuclk'. For 'refclk' it is OK for this
> to be disconnected, but we need to handle it by not trying to connect
> a sourceless-clock to the systick device.
> 
> This fixes a bug where on the mps2-an521 and similar boards (which
> do not have a refclk) the systick device incorrectly reset with
> SYST_CSR.CLKSOURCE 0 ("use refclk") rather than 1 ("use CPU clock").
> 
> Cc:qemu-stable@nongnu.org
> Reported-by: Richard Petri<git@rpls.de>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> The other option would be to have clock_has_source() look not
> just at clk->source but somehow walk up the clock tree to see
> if it can find something that looks like a "root". That seems
> overcomplicated...
> ---
>   hw/arm/armv7m.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
