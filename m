Received: by 2002:a05:6214:92e:0:0:0:0 with SMTP id dk14csp163463qvb;
        Fri, 15 May 2020 15:55:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4vH5P5gnA2S5HWor0sMp8ooO9GRig4dHd3ks5lMFd6VZfwo9WtZ189BZJiay11PddDqCg
X-Received: by 2002:a05:6214:1427:: with SMTP id o7mr5940391qvx.104.1589583340539;
        Fri, 15 May 2020 15:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589583340; cv=none;
        d=google.com; s=arc-20160816;
        b=02ArhOmlYJ2WrLr+xPWUshWsorxT2Sqw4smPzFlnZoOBU5ZTh/sOI3H1SquLiBaknF
         rbVLN68WKdg+X8aN6WT3n6AKWZ+iLHx08/Rsve8wTX/1KO1suXKF8iK1PXEvgAzoTa3O
         iBjx5cfPvcKdcUiKgfqiK2z/Mn8RdJ1uHxZLY2yH2kFdRAugN9s8tdgkpREDYzaKzUgt
         XI2/RWcac8YNJZg6aLIuzQ3KQYBRKpMutiGdnM3U5Gf4ShJBGPsM+eRwBe7PjHfaPnnm
         szIh+MwIGlZs63ZwrCeNqD3ldN+ESkpiOkQv60OEvMTJSNXN4oV3N1VD4OG67uQmJcJu
         Jm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bSk+j3z6J7bFedrMgMHv2jmU2o0wk5kh3M5NzgL4M2M=;
        b=HX/hAYLxABZaBUtQ1gaewEFpJwA3ZiFX9Q+yc6Kmt+eRe6/kOlQXUsF6sl7M25Rk1s
         GEf4+vBYNDvk4vAOZVEuYc7z5npUXLAnZXkqKf/3jzrjySFr74rctT/EUYpl15egyRPl
         k8k7R6dM/kuQaabUNKwM4NGVhVs/bJCmtA6XUOojJ/ph/NbkUxY8MAoTsPIPO2ah/NUM
         OeQAk/sJU/iFEijP8eJliV2G5zpZCZBKsZatlomwQNwvO09QDoyP0nPivx54hwKpa+Zb
         ANK21d0Xqq4Xuo9+3/5OpyyVugAYD2T9gsJmo1GfRDgWSLT3UE9M3uTRBkQn8r1UH8hU
         4SVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lDzj/XMm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16si1949775qvt.53.2020.05.15.15.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 15:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lDzj/XMm";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZjEy-0007hO-38
	for alex.bennee@linaro.org; Fri, 15 May 2020 18:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZjEp-0007fF-Oc
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:55:31 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:32884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZjEo-0007fi-Rs
 for qemu-arm@nongnu.org; Fri, 15 May 2020 18:55:31 -0400
Received: by mail-pg1-x542.google.com with SMTP id a4so1696512pgc.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 15:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bSk+j3z6J7bFedrMgMHv2jmU2o0wk5kh3M5NzgL4M2M=;
 b=lDzj/XMmBk2jYC3IWxh3g1ZYCX7MekVBtHnbyNtcgasqk1eZdMiyoqtCRPOxXaBJRd
 Nl8t7zbviGZo2Eacu7f9ldibioyoeLdFc8/r+LPtex0YNu/niM7z4umzU5qHrUFVH1hz
 UGlze43dPm1GoJ6S6u7cB6p7+dak3We8Fza8zVTNvNBNoeKK2b05xQwo6N1S80QZEJXX
 dzOU1EOEm1iELRXu1gsoOYj7j+tXX4vIVs7JoNeLCEhzp7eLq3fiVN5OlQRIPjDBjkkH
 xqCZJtl/8nIdu4+mIFPwyWS+5zbYnm0l02syIHMuLTjjQaAVZM/IE/XL2PKE58fryjhX
 DYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bSk+j3z6J7bFedrMgMHv2jmU2o0wk5kh3M5NzgL4M2M=;
 b=t/jkrsGNyALAoVbbDUb3VmQmZ96jvvcVgb/V/yaUsnjtslp9wAQbnqx/vwf5tkgTQR
 b9r4ktR6AQvp4UYaqe/4jfVEKsf8RWTMkar8E7HPNZf7uHXQkOX3pWPE7sD91bfsN66q
 gd4eeCsIXRgAtZ77quIxfEBaWfojJ0uPRbbgmC3v+ZO3mMJMLfVBcqL56q0GD3R1FzzZ
 6VuWR3kltkFqi7SUhXJgiSE+acqDic9b//o31mHtfg4FD6yFYJx10F5v5xcSQSKJ098F
 h9KP6CHfaTUfO5VYfy1ZUrwGvVazLaid2KYmBLULthDkZlf1lEg/pBB5Zap5gonPpBPQ
 wrdg==
X-Gm-Message-State: AOAM531q88ljgghMsrjIjONdTv6jb73VaNU4TUxD/zEM8fZfZnu/j9nW
 ckoij/MRUAntxUVkg/Z/gVZrNw==
X-Received: by 2002:a63:5b07:: with SMTP id p7mr5316083pgb.218.1589583329257; 
 Fri, 15 May 2020 15:55:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id v1sm2283039pjs.36.2020.05.15.15.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 15:55:28 -0700 (PDT)
Subject: Re: [PATCH 05/10] target/arm: Convert VQSHLU, VQSHL 2-reg-shift insns
 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a8cf026-97b1-fb38-d2c0-d9e03e09aa8d@linaro.org>
Date: Fri, 15 May 2020 15:55:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: nPLq0sotnbOM

On 5/15/20 7:20 AM, Peter Maydell wrote:
> Convert the VQSHLU and QVSHL 2-reg-shift insns to decodetree.
> These are the last of the simple shift-by-immediate insns.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  27 ++++++++
>  target/arm/translate-neon.inc.c | 108 +++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 110 +-------------------------------
>  3 files changed, 138 insertions(+), 107 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
