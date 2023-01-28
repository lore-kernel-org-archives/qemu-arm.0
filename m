Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp75289ejb;
        Sat, 28 Jan 2023 15:49:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+DHJwYjunV0bWLQ+IMcgZ7+fnC+3B/sFrX1GD4IW7a+RIBp4x3wcQvfMV9BwQ4foDNyWT9
X-Received: by 2002:ac8:5e4f:0:b0:3b8:200e:59dd with SMTP id i15-20020ac85e4f000000b003b8200e59ddmr13442875qtx.60.1674949774613;
        Sat, 28 Jan 2023 15:49:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674949774; cv=none;
        d=google.com; s=arc-20160816;
        b=zaciMQuYVSE9OS5N9LEVV/PtvuI+0E+WnV962WHynlVHsDK74HjapC57nmFv7TJ/Bg
         g1C+UNz3VhPiTIyCbMHm4ufYx50JAO0xtQO1QUjr+iWWhOiijuHkiEZi5D+o1E4wPdxv
         UyK7xOmuR458yTpoQ1DyDD33lpqMGw0gGa6KLe+nN6VmsbrC/nzAodDTbWRUikZKa2YW
         HyLI/FJUpfjvArMg751qHudzv64WLVljl1GDrGGPWgZelyg8o+kgsYqG0APcXTUyPy5b
         z3j6Ld0zNjlbnS18v1YXikY9zaN7AAhfo0c/77PBJOJJqNK41qItIr4fJT1lvogx9wUE
         +Jrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xG6de/o01IpjLULfpUdj3YXxL1jtDlQXZf7M78vs+4Y=;
        b=aPoKlMnyh1YJ56ouiDDoTz6CxFz1VXe92GyXUH819RcdiZLjCU7QTk9z8xGoPBXEsy
         gjuaJnVCtdLIysDSJOU9lWWND8ZPIJsE0wDqczY/G+Q7l7UMeYBoD1iMxXuTk/hp+aAq
         KYsll7lIKlmWM1/VKIjqexA1ePsYOijHs2Pv5iukvUljHJChWVs+23FGjc/rLCugsLWk
         dOUDWtddaDNJq7bq3b/nSn0TYDYx1O1cWSIi//DywEVN7FPcno2dV8EE+m7/w5bFWVRC
         foWB4CcAMmqqq49HajUDO+U6EMwsRZoL21pV/DpKOGwo5yFBM1AxS+vGUDNp3FvNblFi
         3OCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EdbT7S7D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a05620a244d00b0071b56f043a5si2046012qkn.163.2023.01.28.15.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 15:49:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EdbT7S7D;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLuwl-0000Gi-BI; Sat, 28 Jan 2023 18:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuwk-0000Eu-Bf
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:49:22 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuwi-0006cl-TA
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:49:22 -0500
Received: by mail-pg1-x535.google.com with SMTP id q9so5418191pgq.5
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 15:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xG6de/o01IpjLULfpUdj3YXxL1jtDlQXZf7M78vs+4Y=;
 b=EdbT7S7DGKNWoYkStWq4MHIJYtSIKdXDokFFDaOQMW6Eec2R0PZpJccns/k5rVZsyU
 qv9TdeVNxSoUprT+u/TkWmQIVMxqQWgLXtPlVA7idNXPagljI53YNNNwyrpa8P0QT4yh
 dYkRIwabhwHhLdTmgE8n0Wlok0QoI02BhOCR4XZsNoV13D/dPmCG8mm1WUXHweEwDfDH
 f++vLCGwpyCR33A+r1apf4B7NN/BHT4GLPq4Hiu8woS/8twpxYr69n3Y3ol0C3C78cC5
 SNhQNfg7vAbq4CJhgbIqRtQVGDkdVTPq/3dQp8QhVP9nF3/vK+bNozGr8Zbnh0Rk2fAf
 rGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xG6de/o01IpjLULfpUdj3YXxL1jtDlQXZf7M78vs+4Y=;
 b=YLZaxEKkxZZX6zPkEWR9xwKEHYCWn12Oc5vJokDFxvsOXa2Nif1+sJwOzqhjqjPSHq
 5o1JnqKIRqvAO8DOcV/CP3a9prbx1stuAT2gvN1sJG9qmXAqyrNfrN9wfE0pkXA9Xnml
 3o3JHD8WDTjdfECYyDmEwEG61XgxLoCfmLtfu0uQPtQ4EBc9eqwcIszddiXcrMMifRDX
 AnwhM8cszTmKvp4oSTAu6/euNpw9kadLxYBmMqR7beHSqIoYq+n52X8OUHHAQzbZ4/PA
 eMWOZWIJzXgsju15Vt8TeVrpKtiuu3cbTB35EO/Ys/XBQ7ThGtxP8LbNCA0KjhMnktfh
 Ouow==
X-Gm-Message-State: AO0yUKWsnl4VmjIghBR/nYV1eqoEh+t2ToOFwqhb9QAr1YOAtSd5iRJj
 +6JN9OBiwI6X3z7k6N8ATH/fwA==
X-Received: by 2002:a62:14c6:0:b0:593:2289:f01c with SMTP id
 189-20020a6214c6000000b005932289f01cmr5644843pfu.25.1674949759337; 
 Sat, 28 Jan 2023 15:49:19 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 o3-20020a056a0015c300b00593a01d93ecsm1242551pfu.208.2023.01.28.15.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:49:18 -0800 (PST)
Message-ID: <f5ee94e4-1975-7426-98ca-af39c4363319@linaro.org>
Date: Sat, 28 Jan 2023 13:49:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 18/23] target/arm: Mark up sysregs for HFGITR bits 18..47
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y7Yvf9+tc0vt

On 1/27/23 07:55, Peter Maydell wrote:
> Mark up the sysreg definitions for the system instructions
> trapped by HFGITR bits 18..47. These bits cover TLBI
> TLB maintenance instructions.
> 
> (If we implemented FEAT_XS we would need to trap some of the
> instructions added by that feature using these bits; but we don't
> yet, so will need to add the .fgt markup when we do.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 30 ++++++++++++++++++++++++++++++
>   target/arm/helper.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 60 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
