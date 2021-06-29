Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4967751lfg;
        Tue, 29 Jun 2021 07:01:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwId+WCSu775P4ayfOdiTu1NAs2TXsQ+7RwO1xCFHI1/eduX860OxNgGEU2tdo9YpRxWd1N
X-Received: by 2002:a05:6402:17d3:: with SMTP id s19mr41106249edy.222.1624975271281;
        Tue, 29 Jun 2021 07:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624975271; cv=none;
        d=google.com; s=arc-20160816;
        b=Ot7rn9SWA3xbfOlH82CMsA8IILeirUbEMsJst7NxTSE1sNAE3VK5dzGPTAA981uf6V
         AU7lp5hxMlOlXJIl55Fi/BunnKBRx9+OzWXGpCoA6N6tBom52IB1t3vmwpgRnKmYOkIo
         xGU9oDtKm8CKqNy57y2kiu2kJ35KRRADhw2s4AYd4/Izav965FsbntbqCMWJjE39Xlhy
         6/2CBpBj1PPQjCoeb39ycMjai0new0lycIrH9y2pl7UL/OLaSNcxE1jF7yBrX0Q/eqhY
         0yBmo9cwvLKbyYmc0wis+7Jzqy4mWpf4jyeBuPHHyi6efY4pU8fLzU3A3p8vTrTAZAmh
         57JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CzSB9KClHWe8rbShMLbwd6rst2rm3nsnJ2r9agmhsUs=;
        b=Y+swzH1YnKL9dS2nmSwwRYkKxhYUnu5185JTcaQdcNu+7HnLF5uMxRrv5BBEgA+wT5
         +47RvOH6bOZFRivDP07vWzU+z1NTomXPYBfX2i7109alrz8iT6saL9w2kFWsufpAIAZS
         yemy8J8nQPhULA2EjbIVOOwqb8QbNbYLOQcFNw2bKsb4fp689ziXX5UAPFVK9nkn9c62
         4VTvvj2WF58rP1hMz4mpGaFsh+Rq1BUs1TldFqeAD8XKIZQIi22A7uoukZEGGxJVZiGC
         k9JyeNs/ffHumpOxphdM9ZI5nnChIwGFiQ4RhgUMVy/jCj+jr3BWHUyExULMz94HIvyI
         cMpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tw6ByVwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si20157089eje.489.2021.06.29.07.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 07:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tw6ByVwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyEIY-0008VF-Bk
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 10:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyEI2-0008V4-DZ
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 10:00:38 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyEI0-00083O-NC
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 10:00:38 -0400
Received: by mail-pj1-x1035.google.com with SMTP id g4so12552500pjk.0
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CzSB9KClHWe8rbShMLbwd6rst2rm3nsnJ2r9agmhsUs=;
 b=tw6ByVwduLJ89XZ75gST3jxean8dBcQCCsa4e1DxtWNuHsG6ASQasNusR8iRaj52np
 Ribluz2NKF8D9va3ZsoTgBR9tEfoHkQKS8NqEW577ytc2ueXd4m46nrQ2uASQ1zvVUpN
 /wIwdPDphZkB/dle+ijrbp0U4GkQpmO40rZLzOB4T2U36eZQrFVzYIo7mESQ8jucR5lm
 8x4q87GLILNOZPJIdd/KvbwkGaNPkFiwW5OXuNMurBXPVXeYkxX77PzX4a14RNCEnETL
 ygxevc/iU7JXBHXC2uo7AQftSejcELxfLkUaJZDkL4w4uWbfaOgT2O2ncN5ny4e+KryB
 mGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CzSB9KClHWe8rbShMLbwd6rst2rm3nsnJ2r9agmhsUs=;
 b=Wcb1/4DsJCeCnur91eq9kkB2IAtQKr1BFjV7iyx5ZqZzALK0Evptuyc+El3gX6ZuAC
 /bOXFQQI19wAVzv+4a5fnJhv8v1Yn5I5UAQ7sr26yXQ7qT0fZDfwJGPw6XU0jLXG42aQ
 U6O3NaiAbeeK95whjV5o4FVy77mIZjIJBN8FaxZbAj8M03daGwns5e8C+bGJhobukt6h
 UAbEVpukRQhlFVXcOEUI37xIVjaqZV6v4rqCS69vGDUEAx1O985FrMm7ImV4QZ5N8xd1
 pOs+UoUUkOtyXYLty8M0l+0FgrgEe3y/ZzHhh/tSh0KGsRRKqI8fb3O3+q140r2jNUtH
 ii8Q==
X-Gm-Message-State: AOAM530PhbN6cxnXOd23QF40wLE2QmeHdZvMHhFX5pkerpludqH/1S4x
 LFolRlCos9AcZiiGRFVkRWowHw==
X-Received: by 2002:a17:90b:384f:: with SMTP id
 nl15mr22741434pjb.88.1624975234687; 
 Tue, 29 Jun 2021 07:00:34 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j3sm18319591pfe.98.2021.06.29.07.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 07:00:34 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: Nick Hudson <hnick@vmware.com>
References: <20210629081551.14133-1-hnick@vmware.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <90c71c55-4298-52c3-1ce2-0b60d52fac6d@linaro.org>
Date: Tue, 29 Jun 2021 07:00:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629081551.14133-1-hnick@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z5dlP8ZjqBAS

On 6/29/21 1:15 AM, Nick Hudson wrote:
>       { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> +      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
