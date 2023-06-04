Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2019125ejb;
        Sat, 3 Jun 2023 17:00:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4u5azGEk2nBVc7JSyOh/da/yl2iyBF5HFQzPqXpFXF/x7AvcHysYAQJiOIvTlQ1dOvvWfH
X-Received: by 2002:a05:622a:550:b0:3f6:a7ad:9ee8 with SMTP id m16-20020a05622a055000b003f6a7ad9ee8mr3404289qtx.19.1685836858597;
        Sat, 03 Jun 2023 17:00:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685836858; cv=none;
        d=google.com; s=arc-20160816;
        b=0pZYsGeehPPO1MKVAZgrACGzf3gb9RmgV3twArWJMx0UAEXKAJ5ka+WoOxB2yVN5Rj
         Ppyzz+Bik9KYjmB4Xe/ZUAo4h0svuZBjwvj+j4W7rm5Rnarh0xPkW7hPscZ9gIRLtT72
         NPw2wHgZ1B0B1Iqv9DvNH3zL5XzdHHyteQ9GrRv5FisUrTvhEhMiVaZZ8EG5FuvxsQlr
         BcCkoZOd0LOXI3LvVZIs4Vz39h/5yuhtD6g/f+doDYlWvsTxOELyLW/rS/DuENVlDitD
         eEeYJut1Yq0iRsIVSd/7Jawi+2lhYhae2vbQiANs6m67CT0yOVDZSzXFuwynfnYawu7x
         8xNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3MIQSj9A0aKXbJkw1n9u2EcYhEhpCvpzm+49Umo0DSA=;
        b=hnq15zu8k7Q0eHS95PvwvYp5TjWhRYlTPyZl9QCycvve1hKMhNSvogollQOL7haT87
         UYsBNKdQCnTxycyAxXc0wPMJkOWgxF35ZQWqRvuHjdVxMtMphZnI7zo+Al0TA6GkxvZW
         yKdT3tpTzkBcisfWe1k/n0UsHPF247OFKAXEvAYUXQHqMTyxKFBM+VXMMu3GbPcxSn4i
         BfqpaFYTxkM20R/4OT2CXuhiQ5VQqwuZ7bs6GStvh0fnmjsPo36T0GNSnTuS9zbvonmS
         RE/9oZnsft2K3Qqvt+VGJyxtajjEi9t0nmfP5OQvgu7gA6PkgxMRkmvM2KzK670LaGSb
         5lEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fw0u/9xY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w19-20020ac87e93000000b003f4df3f1f0esi2887506qtj.167.2023.06.03.17.00.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 17:00:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fw0u/9xY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5bAW-00040A-MB; Sat, 03 Jun 2023 20:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5bAU-0003zg-M9
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 20:00:22 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5bAS-0007pU-Po
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 20:00:22 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-25692ff86cdso2788310a91.2
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685836819; x=1688428819;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3MIQSj9A0aKXbJkw1n9u2EcYhEhpCvpzm+49Umo0DSA=;
 b=fw0u/9xYuk14if4cgd0+YFnu0eaTHIuIVDHiiIT/dq/FjbBD7eCw+w7aSuAQDr3ZpS
 9tRVjTrMTLb2WdSnu6gUh2/md+xh37msqfRlG/FkO6KwM7gv7jC4BqkhMzu551fKhI2Q
 HO86LGY2jE4K0ebShweyCTXDvTE3K5AnoyMv8t2wgouFdPJGyr/FsvQh0BatK1Xexvu8
 u1pdpXXGIQFiBN6LhW4oJLiqYbW+/7QqfXYXX5tnfDZTmVrnRXATKtWWlWdfa45EFsPq
 IZ1+hAq8QShm4DmngIeblLtxm6jH0uYYgIXt4b50iTH3nylVYHojBQM93hjWvmjEKPBp
 4OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685836819; x=1688428819;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3MIQSj9A0aKXbJkw1n9u2EcYhEhpCvpzm+49Umo0DSA=;
 b=F4t9sqPBOASmMHRXhsj0Viq+BiqtY5kB+Ent+EEujA3P5lq8f41LOPdkqpX1+8S65b
 XbFV6kJU8V6zopBtmveH/0Y54oPlxmpYSQAze4M1Qjq/8YuHIE9PVRqyF8LnjqHdvAZF
 r5IfsZeeNBh6ki7/Yib1rT5hkqU8VRmAF5Qn/LC+akAv8VDnYU+esgg13daNM9cuTwI7
 Q1ZnCj9U7d32wMpgeBHWK4zA46FmZlGaAmsjHRWvZBbNvwCCVShNR25L8TYCIP0RCTLt
 bX4Jkc0+9jt1ND425nAg2aiYWeOb3amc4hW7rQjOhT2WacfbHhdPwkHnt3evEacFcbZb
 Lhmw==
X-Gm-Message-State: AC+VfDwHR79+aacduKdIKqVYcWTMnyWchTYdN5EPGSBQR5bnixeCMhak
 mSY4Q9IjyOsFyGSVDsVqIBnX3A==
X-Received: by 2002:a17:90a:4e8f:b0:256:937:48dc with SMTP id
 o15-20020a17090a4e8f00b00256093748dcmr3648090pjh.40.1685836819086; 
 Sat, 03 Jun 2023 17:00:19 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a17090ab88100b0024dfbac9e2fsm5168772pjr.21.2023.06.03.17.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 17:00:18 -0700 (PDT)
Message-ID: <10d8ac29-2266-93f7-b55c-59b1f66a1841@linaro.org>
Date: Sat, 3 Jun 2023 17:00:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 18/20] target/arm: Convert load/store (multiple
 structures) to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fFXMwl32Lwds

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the instructions in the ASIMD load/store multiple structures
> instruction classes to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  20 +++
>   target/arm/tcg/translate-a64.c | 220 ++++++++++++++++-----------------
>   2 files changed, 129 insertions(+), 111 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
