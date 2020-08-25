Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp81293lfc;
        Tue, 25 Aug 2020 11:24:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxik9eFAN0BfvUjYV734x00kXn8fAlTHkrA0MxHWm8aXJALy1uqEoWHiDRxFt5DbaWr7XGh
X-Received: by 2002:ab0:60ca:: with SMTP id g10mr5948569uam.109.1598379880486;
        Tue, 25 Aug 2020 11:24:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598379880; cv=none;
        d=google.com; s=arc-20160816;
        b=IOaBXOT1+KS0xHpEz2Ach1QCdSX21PR2q/BRmcSMruVJB+nYPSwwzvu/9QnIeMDPKx
         uIVwcGqijkO529Hk9RKKg+nekHd1t/Z5RunYLAad2J+7M949hsS3k6OqakQVFyryUmOK
         I5mp4FF33HNPug+njfnXW9dhAYPcFUHitj1wMXsVcxcs6+KTstMTGyEe9O35U/neszBh
         ZeObqqgID5SDlT5uzIFDgaKfjZQ7hW4KSfSHTtU9kMvG8fE9nRp4JAsXtqReUHuJk/fy
         jlSvrHgZrPZVYcB/KYNTYBhTS/r9aU/iiSE/PQrm2gzClj/r2GkP8NicQmaDpUQiEMje
         I4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gAAR1NvGCldnuyaks9jqC7Et0Al1/tcqkfH+nw3aOWg=;
        b=kVO/Mc+UtdKJWZsEbKBJj0vF5ryB2/7hyrfxb5+r8JS0GCxS1t9/Amp0gMw3jL6GVN
         ntcp5ynuZvWqqjdELp2CpY1bWfkEmcd9jowG5rKyjOqvFPIsqLyFulw3gitu4woXHruJ
         IkGksFHExLuVTIVPlvs5i5TrbAFf8/yymxrpfj60FuifMQq9i9W7UIyZMNoX1zU/5mtu
         LiWzlTjftOPJpsHCKKl/LwododoWrGmuD+0+UHZ2cdO05HcJ1+Ew1smIoksZa0LyKd2x
         h8Aq0ypzeM182KIXRPfrO2b6UcTxMoKU51BD0M0Gmm0r70goiR1QWYDjiu6FrEUIrnGH
         6w9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6aICL82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17si2275240vso.424.2020.08.25.11.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 11:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6aICL82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAdcd-0001Mm-SR
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 14:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdcH-00014E-4Z
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:24:17 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:37202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAdcE-00078B-Ji
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 14:24:16 -0400
Received: by mail-pj1-x1043.google.com with SMTP id mw10so1658741pjb.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gAAR1NvGCldnuyaks9jqC7Et0Al1/tcqkfH+nw3aOWg=;
 b=f6aICL828XmWrEN8d9k43PVIyse1DWF2PMBFh0h0SRd9Mzmc8ZSS4Xcfkb3AmLZgc9
 xHXAHPlrH/NojYs6xumoqE3QZdkNqB1jV5Y5P0zf07z1kXJtgB1WkGbl9s0hQOitYdBa
 cygP1HQbf4I85ywiPMgvvWOoh9zFzCcaK8SOeGHsEWebnI6Kee9PccJDbWy19t9atGEc
 wFdVQZdqsfWFgDuIj4sNutgL9xSEUZ4tiSLrU0NP/U0ve370QXTUXqmlevmpaQE3Lsws
 wMYxaTrgg8NdF61v6T+t6Avwrs8ewUhxWGJAwrqZKB08lCOdB1poa6GxPGRHkmc8DO/q
 GNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAAR1NvGCldnuyaks9jqC7Et0Al1/tcqkfH+nw3aOWg=;
 b=piSB4xa8yi/tGg1UTThcJ/hmMCjSze5VED2PMOz0OLxhFqDYV+wPwx8wJtnoAcgWoN
 DAIgSuWOPAsrWGL5FNb/dPZILrgkPCxs1j51lZK0LC7HGr7iNgdlnmHTQUaIeNaS9T+4
 5HQtdi8S+6wYeqd7CI5nzLJ5HMXISUAByPamIgM8FQFZs6SXAPJo4b9WsYjTx5L6j4Of
 e2KsowIJCcxlKDHDacH6kQYqZlBplkdhSmKhBipxZ2dQn9vwM2OVmIv2gi6iKtxJTBsp
 YcjYKvhuEU5UyslPLbUQgJIyZbut//LgKVMmDoS/qFXj2TeOcD5l6ttjyGJEd/L0A7JB
 wukg==
X-Gm-Message-State: AOAM533gmEmxEySurRsvlYw6f4npH4w1fMcsNTMdecFGXcABLch19u4s
 P26FqowtEf5pyAX0yQhisJY+jg==
X-Received: by 2002:a17:90a:8589:: with SMTP id
 m9mr2677225pjn.109.1598379853152; 
 Tue, 25 Aug 2020 11:24:13 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id cv3sm3519110pjb.45.2020.08.25.11.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 11:24:12 -0700 (PDT)
Subject: Re: [PATCH 08/22] target/arm: Implement VFP fp16 for VABS, VNEG, VSQRT
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200824142934.20850-1-peter.maydell@linaro.org>
 <20200824142934.20850-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20953e1f-df8a-3265-5fa4-329384351e4a@linaro.org>
Date: Tue, 25 Aug 2020 11:24:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824142934.20850-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
X-TUID: eHT20LyzujU1

On 8/24/20 7:29 AM, Peter Maydell wrote:
> Implement VFP fp16 for VABS, VNEG and VSQRT. This is all
> the fp16 insns that use the DO_VFP_2OP macro, because there
> is no fp16 version of VMOV_reg.
> 
> Notes:
>  * the gen_helper_vfp_negh already exists as we needed to create
>    it for the fp16 multiply-add insns
>  * as usual we need to use the f16 version of the fp_status;
>    this is only relevant for VSQRT
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.h            |  2 ++
>  target/arm/vfp.decode          |  3 +++
>  target/arm/vfp_helper.c        | 10 +++++++++
>  target/arm/translate-vfp.c.inc | 40 ++++++++++++++++++++++++++++++++++
>  4 files changed, 55 insertions(+)

Same comments re the helper types.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
