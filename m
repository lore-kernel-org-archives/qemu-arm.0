Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2117136njc;
        Mon, 22 Jul 2024 13:02:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt7xZp/dsGtDzLtklUxca7WKHglr3YzlA4WbfJojRZgVNdMyB02URzct/eSCSFLkA7u3+EX8yQOKr+TK9bx5ymtau1OJtN
X-Google-Smtp-Source: AGHT+IF08qpfsy0BZ+ixlsyuhwM9vJIrnhS1S7ctFA8Pb2hDNyCfeNqZMs/QuldoHhW1IDy2qNZn
X-Received: by 2002:ad4:4ea9:0:b0:6b7:b259:4632 with SMTP id 6a1803df08f44-6b981921a63mr14132656d6.14.1721678555118;
        Mon, 22 Jul 2024 13:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721678555; cv=none;
        d=google.com; s=arc-20160816;
        b=VoFuZ+qo2Tg9HmymsBlUX+TQtOtmzPS3WUrzPqnkPHDJhAX2mbw2CbL4I0fsarTnc2
         FMsxh+qWpWh5e8XR4RHPZqfrjMb4PALhi0tEr2fXuJAscUK35Vpzwmavmz49D/qqKHQ4
         D6d7P3c5LtA47Nh2jpCVCPi0xp0lIDwqL1jJQphg265Q/K5O8usUhtevjMlZ8khBniFr
         lfySvxhZD9eIQtHSIgrEZjkNYYOq5VIgr5Pc+qMN//1GqtWJ9XaajA4SSo97JgnrTiU4
         006mr4NdeOzbU2z5UWHAwjEV1nk2qcG9aL/grCEGZdddru0aaAT0BSkImyj52WTrIN9e
         n2Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DXgZG32sbZUUJvy0LLPw9dM3Lgo9p3e4NlYrhphNMnM=;
        fh=e472JqPUnl12CkyYZtMQ3FrqsnW+54f+ejQ1CllVVto=;
        b=wKZMn2+bevbQZn24W7bHrmWa+XsTKlM356AAaFaYLp1dsW/bwigN2Pw5RdpT8pWDQd
         5AwFiBMRKORE7EQ5x8eNO11ZJhPmTGLe6rz87MddWQn9ExxL1Zm5LtlUiNoq3Y4p31bn
         nZ/PoayZbQyzdPPUFZ4hIQYyQNvwe97151RpDlBnlE9G9GuBZQccP9HFI6zYBnBareA5
         dx1/+VXsdHi11ZeMoAeX9QHnBGRC0Rk7BN/K9L1L5FQJXtFuDa78ubNfYgwBLZyeZurF
         +3Ff92ei2a3rucsPK0QfGhNA2jcNjIE/Hg0FAUj/v+7PpW+mlmfaNTfLIIeuzjtNshW1
         R0aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQjIMeQC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acaf9989si88858416d6.484.2024.07.22.13.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 13:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BQjIMeQC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVzEV-0001kx-1b; Mon, 22 Jul 2024 16:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVzET-0001ik-FU
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 16:02:05 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sVzER-0001Mk-KZ
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 16:02:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-368440b073bso2272958f8f.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721678522; x=1722283322; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DXgZG32sbZUUJvy0LLPw9dM3Lgo9p3e4NlYrhphNMnM=;
 b=BQjIMeQCWdAOYPTUmFgaoS6zeCk1RQzrjSdDBIaTbla4KUnazq1Ym2w72PQ5G4AURJ
 e208wfBZwP+kpmtBR00Pgy1r2Tcaod763Ik5eZWG8vUlpoN32GlgIkDQSQIRLQXN/1V5
 YFMX25v0zDzorX9qJliEohlo0xSnmCIB0nHXTx8hNS/bFxczSM5VDbN4UpHwprcoAzG0
 cIFZH/xgkfUQL2wY6APu7eZmHyaeAOXSnMxZgPVksojLXpW7pjPUKqv1pZ5IrT0mmtFy
 wkF78MC2jFZdSI8aKEhNz7UKExd1KNdgtUCF4EtQsIE+ZajvxSBNM4gfGTZvQGIwcxuq
 vqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721678522; x=1722283322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DXgZG32sbZUUJvy0LLPw9dM3Lgo9p3e4NlYrhphNMnM=;
 b=sH1kf1JykttuPK2NQX986BVYoSmXWqeR8mxRJMX+lSMTNu8zcB1WsBvDGt4WYN0dWF
 T6uI9v6W5AOaQdLxipBTpqaZq6eQav0wqRG11xvnQKKUyHtA5c8Nz9QstCqVRDsvCPTF
 lPJOX6aUXqGdsncqknHtlzJMzO6P0FJsOznFVSmfpuGt9+WGDTFLVQXfKO+uuOzOEnuT
 A8bFKEWQtfKRqYEgf6SV3CqaabF+eAXaQCbajC70SmBrHh4FXuNCUi+yNu8k5O8cFPh1
 rAIW7Gwgxg5szRYdYskuLFaWif7/DZIEbldEeIlYfiAqp/UVyllkT5PYLm+Fp+zP2oGz
 vTxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyXC72weIzp4W4EKLb3/dt4Hl/2DXw5T76en2pDBZ2Ki77d2jWht8zrBVgkJXbgw7H/tBS/pzs1E6e3n3e6zColMwl
X-Gm-Message-State: AOJu0YxzZ+ZnoHnkwBhm8JAexQSaobxUmQKoZV+X4ZFnAouif59PS+WK
 V+dyS/dfNOny1BiljLQxUpzOxdOyc+cJOc+vQMHw5/Sh2tObmOEd8d5O5Qf5bdf7+8nK1FdhWQc
 S
X-Received: by 2002:a5d:6e06:0:b0:366:dee6:a9ea with SMTP id
 ffacd0b85a97d-368740244d5mr6943432f8f.26.1721678521872; 
 Mon, 22 Jul 2024 13:02:01 -0700 (PDT)
Received: from [192.168.69.100] (gen92-h02-176-184-20-254.dsl.sta.abo.bbox.fr.
 [176.184.20.254]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787eba8csm9446016f8f.91.2024.07.22.13.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 13:02:01 -0700 (PDT)
Message-ID: <9a8c2997-b9be-43ed-8fb6-febd6b50024d@linaro.org>
Date: Mon, 22 Jul 2024 22:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] target/arm: Ignore SMCR_EL2.LEN and SVCR_EL2.LEN if
 EL2 is not enabled
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240722172957.1041231-1-peter.maydell@linaro.org>
 <20240722172957.1041231-5-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240722172957.1041231-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: m1dkE7kyhLHl

On 22/7/24 19:29, Peter Maydell wrote:
> When determining the current vector length, the SMCR_EL2.LEN and
> SVCR_EL2.LEN settings should only be considered if EL2 is enabled
> (compare the pseudocode CurrentSVL and CurrentNSVL which call
> EL2Enabled()).
> 
> We were checking against ARM_FEATURE_EL2 rather than calling
> arm_is_el2_enabled(), which meant that we would look at
> SMCR_EL2/SVCR_EL2 when in Secure EL1 or Secure EL0 even if Secure EL2
> was not enabled.

Just curious, how did you notice?

> Use the correct check in sve_vqm1_for_el_sm().
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ce319572354..8fb4b474e83 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7232,7 +7232,7 @@ uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm)
>       if (el <= 1 && !el_is_in_host(env, el)) {
>           len = MIN(len, 0xf & (uint32_t)cr[1]);
>       }
> -    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
> +    if (el <= 2 && arm_is_el2_enabled(env)) {
>           len = MIN(len, 0xf & (uint32_t)cr[2]);
>       }
>       if (arm_feature(env, ARM_FEATURE_EL3)) {

