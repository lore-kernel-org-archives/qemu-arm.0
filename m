Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp5688ejf;
        Fri, 27 Jan 2023 18:31:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+CsOlKxXSoQsC7X55eCFd0gUKkUz8YxYX/NNXeNnmQY/0Klr7iRg/3RjU34mCwR5oHIZO3
X-Received: by 2002:ac8:5f50:0:b0:3b8:2a6c:d1e4 with SMTP id y16-20020ac85f50000000b003b82a6cd1e4mr6003615qta.23.1674873119712;
        Fri, 27 Jan 2023 18:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674873119; cv=none;
        d=google.com; s=arc-20160816;
        b=YVeJWpN7gNra5ZM5bLXT3KLEu20jIQpNJSmWzyg8eZwD9dp9DgKqNEy15aj4QXhMBc
         tygtDLC6LCRM8ja9yGkpVO81AjwHZHXGsKQVw4bXHOno+91Y8JoJtx2rRX9mP+mkhkDh
         HI+UYPQyEBII31HkdiI2/KJ+GeK96iWBYvDLSbfAcRZXJDIOBQm+z6EfQlLqbGgabli9
         RAkoNOpo1nuICsMf8JXN+fWr8x8OUdxIlTwswnXjOAH5G3Ac4ZAMKkaJJetWvUc+NEfe
         nPY2om38ThupUePw2xJj0aDRqBTzWKmlFNoMoszoUbfMJMBHphlSpWGNBXL2OjkwVyJi
         Vicw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ujRLBQ/Gh7StapCYcLtuR4E4cgExFutBisuWFKM2zOk=;
        b=YxmRkA096qW7WV7p4MkOnVTn0hbjpoX/3F9+ZFAay0szToABSse+Tj9xHPfiT8XSp9
         UWM4Bjd4PqChM3YRiaXMsY1/hGkOYGlp7JRKnes4H784FzAbqFDwCR2KNT+9OdhtF8cc
         dgRDZCrT+/rPQAM3zQ9hNPa9lS3VobIQsOn836lrX19yJ1zCV3n7YbtXvKXcfHgpEKiS
         Yw2WUvPZ3rhu8UGRcKo+XVNkqaA2Vv2pI9tpZmDeD5cjJBko0qJQn389ByN+6rK0haSh
         4FQeBuQ/8HYXjKko8V7PpLXpQ3F9xeYiWMlf+1q37Iutupnuqq6j+PVC6BWNGkNRtsoc
         anYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jBCP8Oqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z28-20020ac8431c000000b00399a6c4c4cesi1997937qtm.134.2023.01.27.18.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 18:31:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jBCP8Oqq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLb0B-00010w-Vt; Fri, 27 Jan 2023 21:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb0A-00010R-Ra
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:31:34 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb09-00068b-7K
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 21:31:34 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 h5-20020a17090a9c0500b0022bb85eb35dso6380770pjp.3
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 18:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ujRLBQ/Gh7StapCYcLtuR4E4cgExFutBisuWFKM2zOk=;
 b=jBCP8OqqySuSdgSvhVgstdZKOl4SoGcLOUy8SY9QJWdIZLjXdvQcKo7H+HFp/KNNU2
 PalEcFsoNZtQY52GF2ai775TOqNBhvA4k4zKnRqvCMa0W+qBGvzKN6bo793kfNrIMMhE
 Ae77XxIjgjyWLpzd4B3hHbFB+7d3xxRxW5LSjoiAONV1S/IFe+SD0SB+WX4aNOX6hd2F
 Hd/nMSxVQOryasZamYnuUsFfU1jtEkvY8ByWYMfa98BBGZ5Z7eOgCNkvs1a3OoQlaJXh
 YwkjYyTidahuOSwoo01JEqDg0jVaACdw7Yq1h46ZP2b9SjJg0EpVSvH3Sssk9oG1cD35
 uCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ujRLBQ/Gh7StapCYcLtuR4E4cgExFutBisuWFKM2zOk=;
 b=CSbqHui1oUHBXcENPjHIxpRa9k4Sett+7ipzkQLpsz59c8liy5shXALgNtUuNFxMPJ
 gGn/r3dEPIOhT5LQdC6zyKCxBe3+Ui1k0WGJshV7/VPbggQI8lOhqBbT0ypXmj1xT64K
 WDPAOuEe2BddR2VQYQgd3ieX1I3FaPffvNkSNoNqnhBEqDOXnTWLOnJrJoWalWon7El8
 vq4O+eakAoABIbEMjyGthgABOl/HiVmzmM5r/v9pkRJ03z48U078WmL0vhq0luGZB3y3
 sKemdy8eGuHo1rsYGlZu8wAhPJ2smKo76UbGUI7sBlBvpTJ1vALJ4w0LIRD25NbEf0+l
 zwtQ==
X-Gm-Message-State: AFqh2koG76EQmQPjJ7cPgqEW+8ejUYK/E5nlZmHvRmYgrVtsMSOY56sP
 B7JDnnNAmGVVTHN2SO2IwajB0w==
X-Received: by 2002:a17:90a:f606:b0:228:f6cc:dc4f with SMTP id
 bw6-20020a17090af60600b00228f6ccdc4fmr44680270pjb.10.1674873091393; 
 Fri, 27 Jan 2023 18:31:31 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 ep22-20020a17090ae65600b0022c08445e97sm3312820pjb.38.2023.01.27.18.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:31:30 -0800 (PST)
Message-ID: <1fcd0c0f-f079-69ef-9455-1501ce725a07@linaro.org>
Date: Fri, 27 Jan 2023 16:31:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 08/23] target/arm: Define the FEAT_FGT registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ub/fwjuT+JOQ

On 1/27/23 07:54, Peter Maydell wrote:
> Define the system registers which are provided by the
> FEAT_FGT fine-grained trap architectural feature:
>   HFGRTR_EL2, HFGWTR_EL2, HDFGRTR_EL2, HDFGWTR_EL2, HFGITR_EL2
> 
> All these registers are a set of bit fields, where each bit is set
> for a trap and clear to not trap on a particular system register
> access.  The R and W register pairs are for system registers,
> allowing trapping to be done separately for reads and writes; the I
> register is for system instructions where trapping is on instruction
> execution.
> 
> The data storage in the CPU state struct is arranged as a set of
> arrays rather than separate fields so that when we're looking up the
> bits for a system register access we can just index into the array
> rather than having to use a switch to select a named struct member.
> The later FEAT_FGT2 will add extra elements to these arrays.
> 
> The field definitions for the new registers are in cpregs.h because
> in practice the code that needs them is code that also needs
> the cpregs information; cpu.h is included in a lot more files.
> We're also going to add some FGT-specific definitions to cpregs.h
> in the next commit.
> 
> We do not implement HAFGRTR_EL2, because we don't implement
> FEAT_AMUv1.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 285 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h    |  15 +++
>   target/arm/helper.c |  40 +++++++
>   3 files changed, 340 insertions(+)

I spot-checked the field definitions before my eyes crossed.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
