Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4107354lfg;
        Tue, 11 May 2021 08:44:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylLTYDro0Bv5UG/ZNoclhI3CzPqeKNT26FOgrujKHxmELMkckf9Yr0SNjlQGAORGTfLUzk
X-Received: by 2002:a92:cb86:: with SMTP id z6mr27442395ilo.35.1620747869266;
        Tue, 11 May 2021 08:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620747869; cv=none;
        d=google.com; s=arc-20160816;
        b=y2vX5yamP+mX7vPWCf0UYJIpIrtPkdIs+Hj5R0TM4O7hhTrLtN7gnaxPwFOwUE8iV8
         +CSicsJxEIF8wWFa8H3XILeJhmDYD0oxCYXc93W3E9fHtXX0VkkA9MWtvSDkYynVbU3Z
         3wp3ZR8O+rJbkiz0M4Faz7IxBcU20xR4ysSwDdGjXFwSxVr70dJXU0vVVYEv8h02wTxI
         rZFaUztTFpHkjNz996887qli57b3zRQsXIXv5rrUPSjA2KY8Yz8WGhl9PU8Lv/UfiNOe
         2ZtSyViXUS9bSE/U25hGGEMsNqK3AKFP/VvMUkQj+RQGeufB/8pMY+URHH9KSAJO2jLW
         Scmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GjmP8ROM6jP1J2MLXt3zFMStlYNvzSp5sjSiLAcEdf8=;
        b=aKjv5bVzoxKf8quXf+3pBuTeYxDeI/yXZ7BSsYOhRvyT3fufqEoIgOzGmUFXRkOT8w
         3ooNEgGzijE/SoGig9HJJ99dHp3RLzX0nGvsblDHW4A+d14rQH+wvyMX8Mb6SPVyDGwL
         DpFJMQCzjoFwbrKpCiryBOjj3Vsu2U5OKvjwcd0ktse6JcNfjyQKSOkA1MeBruG3SIPa
         cyNgh4XhMDKUMlaNN2SJZ62t4cQy66QjZWot8MHAC+9xiB3LKnzAPCQ/4aPrCIg8igpE
         XJQei8tv3HuVX4Q0vV9TAoYluhTQ5h5T1VVpUDTwRFAl+ND5qi+sFQa9vPoXP+Sv4NXJ
         9QkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lz+HGdih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si18608406ioh.103.2021.05.11.08.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 08:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lz+HGdih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgUYe-0006wn-KR
	for alex.bennee@linaro.org; Tue, 11 May 2021 11:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgUVH-0001il-Fb
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:40:59 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:44785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgUV8-00033B-MZ
 for qemu-arm@nongnu.org; Tue, 11 May 2021 11:40:58 -0400
Received: by mail-oi1-x22a.google.com with SMTP id d21so19377113oic.11
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GjmP8ROM6jP1J2MLXt3zFMStlYNvzSp5sjSiLAcEdf8=;
 b=lz+HGdih86UyWzw/z3KN/SU7q2jBJx8bhyY4ZSV2cxoeFzrRtUudK/gNC19++Ph6Qk
 T9ZWmVz8aFHk86YAdbPTJSvI7FVtkI/Fy/nJwGL4UOCbyQTLZ5+08/aW//RHG2bg5NP7
 24jUaZPIavkHkENgWmAEj653TL+8pw4y+HJGHC/0GgNuzKNgApBs2Vcfg7vsFz7Df5ye
 cTSFnCVtQm3iRYPdiiVEy0gWZkrqv0aackCf/wi8vqtf9PHXaFTup3mqzDFoUEU1sKkY
 9HtKrESfffOsjRhZ4UY9gqsl9GAjVdtezeTc7BxNu1vE3YrJZXw4Y4l8AkrPiQ2KE7Mf
 pGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GjmP8ROM6jP1J2MLXt3zFMStlYNvzSp5sjSiLAcEdf8=;
 b=BBRL75+4nUuBvJIVmIK4UGkNGG2jJfvmtG1fjK0lbMPV/7QVwx0FxT4zxCyVmXX1Qu
 3uBZOI7lhyFSWQctU7X6JcBXshgzIekjdiKbqg/R1CQl9BpGBn0Y7o7M4t+4pD+kaqSf
 XOZTJ3ZoPUbPY0LJjBkp9bL0z6svbzBK37LLNKSbgu9OwL8g8GYkO+ln/JqjrL30XfLw
 TZuN7UnYjORDvhAmZIQyCIHOOo8kawdXOj0eEhnDtLNMFd1ALIhAB+S2kxXn0boLbkv1
 pxUeQX3Fu6DOSHkv3zsHUDYvkO+AUR0G/F0++TAFu5HnsD/1rWLCuobMaFQZinZMLnLf
 wVPA==
X-Gm-Message-State: AOAM532Sy1Bt4Cl06NT1VfETAVoNIVxuj5dRB+973TA17tfmXG62hXO5
 HoYARHsNlYnHwTIBvlW+i2feYIx0y5Ygtlm0Edc=
X-Received: by 2002:aca:ba09:: with SMTP id k9mr22249923oif.178.1620747648522; 
 Tue, 11 May 2021 08:40:48 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id n98sm3863445ota.24.2021.05.11.08.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 08:40:48 -0700 (PDT)
Subject: Re: [PATCH v6 06/82] target/arm: Implement SVE2 saturating/rounding
 bitwise shift left (predicated)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-7-richard.henderson@linaro.org>
 <CAFEAcA9Pv00takQH-2gJr27a58ivkcO8P+XowkziqDuf5BZKhQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf5b06b9-6b56-f006-eb58-5d5a9f249e07@linaro.org>
Date: Tue, 11 May 2021 10:40:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Pv00takQH-2gJr27a58ivkcO8P+XowkziqDuf5BZKhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AUu//04/ppVD

On 5/11/21 3:43 AM, Peter Maydell wrote:
>> +#define do_sqshl_d(n, m) \
>> +   ({ uint32_t discard; do_sqrshl_d(n, m, false, &discard); })
> Why pass in &discard rather than just NULL ? (Similarly below.)

sat != NULL means enable saturation.

Discard the results because unlike NEON, there is no architectural SVE flag to 
indicate that saturation has occurred.


r~
