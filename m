Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp541786lff;
        Fri, 30 Jul 2021 13:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdbqhbCCX/yWb7TCjZlhbkWVrVIo5jfzAKVl6Gelb0ziOeMUY2MlP+BjKd4HU2It5vCJ7C
X-Received: by 2002:a17:906:3041:: with SMTP id d1mr4561345ejd.54.1627675997362;
        Fri, 30 Jul 2021 13:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627675997; cv=none;
        d=google.com; s=arc-20160816;
        b=sAjiALLdONrenNJU89ROnc31kxEERbZWCkgzJeqJllea6bfN1sAwCXnUrFFKszrRbn
         Z/A8KtzDRiiQTJS3eUyu26GZ0IbgrocqNDWVQBvXB8Q/YcGT84/zvohqfC1CbPfxvhKt
         Uz/Fy1aqdQPVeWUZF+VE8c8Jdc72EzuYDjAVVhwD99zUnjNPT7sKWEV4qZUOecBI3pGU
         j2IK2hv+vLdsUPd0L/494wGgZe+hVSQpL6OQyRwPUhe8GivK1dRLUNm3+1d70JgxgRBa
         Liaf2eaJA6oDAY420EYmgcGoM96nEc+R0YrMBLnsGav8US0MVHX+0Msjw1/Vl+ztxWvm
         9Ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GfMhsEPK/7Sm7MHT9WSDgkZrAOZR+u9fjBLqNe+YCBk=;
        b=yPInh8sD2iRlAzjj1KOMOhZl90Ug4SKkwb1RXdTOUJ7yniiFaI2mqdJD2cNH3TtuJ5
         3kGuxVMcypV0Fc0KaF25k3Eg7W46uwEUysH6BV5Bhapu1PmYAY7kLNoOFYumhGHBa45s
         BOFIOmsqzwo964HOkoaIn2rq9UA1bRJBa7MV3p+SnuifzPuu2gk8GWvT8iI6N8nOSmMr
         AAGjNiP0ysh3vP2FnYmto+6ED2M5nrHXqYIzvM6eKyqIbMzqBsSjFQIG0q+pYI6TW3+U
         vXYQ6zHdPDQcMs2yQeE7BOj7M8cUsvbQCF1RClDrZfa6te/K1Z3KzAax5UwyKQq8icTl
         GtDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVd6fXAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7si2490151ejh.116.2021.07.30.13.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 13:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YVd6fXAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Yse-0001U1-Fo
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 16:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YsU-0001S9-Mr
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:13:06 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YsS-0005Me-0J
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:13:06 -0400
Received: by mail-pj1-x102e.google.com with SMTP id b6so16814766pji.4
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GfMhsEPK/7Sm7MHT9WSDgkZrAOZR+u9fjBLqNe+YCBk=;
 b=YVd6fXAlqa4Y/88xYkMaw2KLuyFTMD3031KCI3EOJshDKTaDda6r9cmDIgxF7T1VVQ
 YILojW1XWHb1z5kCt+X7D2hAp0YQkUWcxkqQ4sPnJik6tdOn0QnVHKqxM2AP96gi7m3X
 N9Cp1hodIxjU2Wr09ie3qrbM8oxy2Z2FMXicAtmIZvLvKqHmtwYsE9r9E+cnhoHYNthU
 Mn/Mh9CGrsl5NpnEB6JvFiBcXaLqJ/bo6jJcWCMBxrZDfh3l4/0v3QkeB9zPCsuvpSeW
 GOoprsHfb0iMjed8eu4tDa1893gPevbtjdJw+ijj83vSBcqaM23V/pzJYpj5qMVPpM0d
 6i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GfMhsEPK/7Sm7MHT9WSDgkZrAOZR+u9fjBLqNe+YCBk=;
 b=QOtI8aqbatiKiRTljWmcl7KkdutEmquQMDabmOdaRUsSlXjDPT5RV1i0qD8asXlSvi
 88WlzGDp6i0j8r8GhlEYnjpzj3nxpmgMDkHGAbp+7brL4PuY0cIm4ZVKpUL+vuu9s1bv
 6tVIlqTjEgU19HNptff6Ue+X7RXqy2hZS6oH3AFB/k0t0RTuWQ9AsS+cyRkNZkFtgsCP
 Rx226IPqLNdo7BiVL/gEdtHMUpQnLn37C/XyDdr7dBCodIJWm9FE7nJapLeDB/V1Ntv4
 MmBU2VNyX2zYB0BUwlgwFFD2WjN0gf3kyHrKnhehiUrmO0okBwvRmcQxGA2NtKy8/ObY
 MUnQ==
X-Gm-Message-State: AOAM532JoP9/Ud++N2u7qAQ6F8z5AFKKLFucU71vbfQfFlCs+CL5yNwO
 ebyZIhBqTXrgehwSkZIZjJ6DoQ==
X-Received: by 2002:a17:90a:6008:: with SMTP id
 y8mr4874139pji.81.1627675982260; 
 Fri, 30 Jul 2021 13:13:02 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id h14sm3262480pfo.47.2021.07.30.13.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:13:01 -0700 (PDT)
Subject: Re: [PATCH for-6.2 45/53] target/arm: Implement MVE FP max/min across
 vector
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-46-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <547e4ace-a7e3-f5ad-bf53-42c82a993d81@linaro.org>
Date: Fri, 30 Jul 2021 10:12:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-46-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
X-TUID: yOqz/Na88VRL

On 7/29/21 1:15 AM, Peter Maydell wrote:
>   
>   {
> +  VMAXNMAV       1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
> +  VMINNMAV       1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
> +  VMAXNMV        1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
> +  VMINNMV        1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
>     VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
>     VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
>     VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv

Looks like we could usefully have two [] blocks in here, for these 4 insns, and the 
previous 4 minmax.


> +#define DO_FP_VMAXMINV(OP, ESIZE, TYPE, FTYPE, ABS, FN)         \

Drop TYPE and just use FTYPE.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
