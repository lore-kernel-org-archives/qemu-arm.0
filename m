Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5366458ejq;
        Sat, 13 May 2023 04:34:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4S19rHwl+lxezvz4gUoZqmWLH8NVge+sKyPapV2tx5IZyLPvb2G0GZzpJmWpggW69FBit2
X-Received: by 2002:ad4:5f48:0:b0:621:1a4c:759b with SMTP id p8-20020ad45f48000000b006211a4c759bmr39812848qvg.36.1683977695701;
        Sat, 13 May 2023 04:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683977695; cv=none;
        d=google.com; s=arc-20160816;
        b=yzddh4bVK/1uEh0k0Xho1bBx+lIEmAUwS7h+UutRpxullxT2pKVPTkKYKhprgM2DHi
         2JfZgvejLhcV+lYsUbTniSbNXuLmBtc+5vfzB+cUyydAXfPVU1g05Js9QUPep47u/9wE
         6Pi0wxKQlpqTDigW0PndfQG4QV9v/OVr9kCafe4Iv0X8dHwcka+lmQx2M7F7rd5NZZLn
         zVqK9glQbEQS9Uy3Xq5LqScQOOdf4Dn9Py7eJvUV3G0L85QLrLhcsUtjDG2g4c+xY5Ic
         OVGZHkNLxD1En1+2u1voByPn8duNnSVWrYRuQReRagAewwaOF3CugxL4/OHSKBfmFDv5
         ao0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=j5BGWueZLO9Kvni/8fQjY5/42t6Qvtg/+tiP/QNAO74=;
        b=pMK05JYHvr9v3X3KSooiywpM0XxhuePETJ6vME2i3VkHywD/LNO0/IoVCtotbTm83j
         RV/S7c9KciYHM9wkDvxCnnwM7yUAGwH4+wanvopOZfSAWrhKZEs4dgaXX60eItYgYed5
         HJEXXJHoUAjQVOgYdH61elMcrq2skO9sOpo++MkTO7SV4TjqQjaeFDbY6sw4MUXh90T/
         CLmjYp9AelM0iPEjhBugrcubCkDt9bC9uMsPgOmw6hYqx8mTB7Q19WEUbachNbhnI5yf
         +RagyFPvXmopx1Hg77B458Ifzq3GJ8Uovd3VcpMd1yqpQAOIAnTs7HBK8lIebbJDkQ2p
         pxcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yatH4Ypr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1-20020a05622a030100b003b9a5257882si6522769qtw.514.2023.05.13.04.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 04:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yatH4Ypr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxnWV-0002SL-Vy; Sat, 13 May 2023 07:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnWU-0002S4-VR
 for qemu-arm@nongnu.org; Sat, 13 May 2023 07:34:51 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnWT-0006Mf-Gc
 for qemu-arm@nongnu.org; Sat, 13 May 2023 07:34:50 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso19661923a12.3
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683977688; x=1686569688;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j5BGWueZLO9Kvni/8fQjY5/42t6Qvtg/+tiP/QNAO74=;
 b=yatH4YprBaD0V7JlB2C+hQVdQtvTH3xyAgxq07Id0EKtqeh/KLfHpa9IFP+wTKTVCV
 QwX1BTGzK6x2MwTqRkS6PqFkepSmR/5Xpf8dKSKt02LG/CGfyXrvJ4QtSDz6b7GETT1b
 5LWCFiu9ZOhSp+TYZd1pAV76IBvu+OR+HXKlvM45YfGwRqrSrKgbYwfSnL3y+IgHkvrh
 ppi26Q7EvKaxhNUPmKKuLGs39vlW+CWltZzDCtWdCBzlJUqh3Z+943DeLxI2uVpVstMB
 9RFjvh+/iXYLp+R9GWl9EpplrtOJcdSX7PLdgqZERC0B4It5yXpLmn2y2rRydoGJ5IP+
 Xpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683977688; x=1686569688;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j5BGWueZLO9Kvni/8fQjY5/42t6Qvtg/+tiP/QNAO74=;
 b=OVvf3A9bF3CGmjKZA9LdERQ3c6IKAatfvbL2LA1vN+Sk1A15N0uIAPxDg3/n0Stdmp
 eDwb4abnQkkTmKt6KFjeG7lTOuUoXNNzNUStHLxwkGJONp+H2XOWnzwDvIPuLoeBHDlZ
 AsbuC5VpGasUkTXTxVfNhg7LgG8XqEXXBS+uDc6S31zMVT9uEdaBQ70GIdqjlsBTzgDc
 rmaCpVLkqSAo6eQSJfyyoN2kT3I9wGFU0+AjwR5LogfHPsjx9fV1jTP8Kqlm7ASBuutC
 f/21vBrZfOs6cjRJhjkgOBtbABpNq4PVOv6B7FqNFH5JWUAeDgl0WwipUF82khxIUMDT
 318g==
X-Gm-Message-State: AC+VfDzLI+SQvufTAownuqVreqFFK9GhgnDvuWZNzFlOFJT+kBP8H/q+
 u7JoNzEsIF7JSk42dSEhE6CGwQttJhFDVY27dVunPw==
X-Received: by 2002:a50:fb8a:0:b0:509:d7d0:d71a with SMTP id
 e10-20020a50fb8a000000b00509d7d0d71amr20404336edq.26.1683977688118; 
 Sat, 13 May 2023 04:34:48 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 t21-20020aa7d715000000b0050bc041d2a8sm4708255edq.15.2023.05.13.04.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:34:47 -0700 (PDT)
Message-ID: <9b6c5e36-e45a-a23c-190f-4d84d781cd9a@linaro.org>
Date: Sat, 13 May 2023 12:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 19/20] target/arm: Convert BRAA, BRAB, BLRAA, BLRAB to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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
X-TUID: 80AxRop0w5yI

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the last four BR-with-pointer-auth insns to decodetree.
> The remaining cases in the outer switch in disas_uncond_b_reg()
> all return early rather than leaving the case statement, so we
> can delete the now-unused code at the end of that function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  4 ++
>   target/arm/tcg/translate-a64.c | 97 ++++++++++++++--------------------
>   2 files changed, 43 insertions(+), 58 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
