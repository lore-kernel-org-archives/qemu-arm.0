Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp180244ejt;
        Tue, 20 Jun 2023 03:22:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5M+bzgXF+QF6Kd733xZEW+sChyXaNDyvzzoPDBdujS/m0ebwNEzH60JeN597/0snxN/mD8
X-Received: by 2002:a05:620a:4390:b0:763:9ba4:6f7e with SMTP id a16-20020a05620a439000b007639ba46f7emr4953115qkp.35.1687256542620;
        Tue, 20 Jun 2023 03:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687256542; cv=none;
        d=google.com; s=arc-20160816;
        b=SNzlHik/TlDmRAnXBK5r8cK8v6t63Hu6o5jpbuaK6ft8xoZ1Jhbr/O+nLc/EvyLzOQ
         hfko0bd9mPpg99rnDgqNQWzUreP00I1A2y94uNOTuq1InoJmWvZ/0tJMjfQh6bi4SCYX
         Jg5lxiM98Sf9klD84QQhUpqiUZHXGZBk/OO7Ujw7nZHoW6j0lmC1gBKzvGQe4BUTDvPM
         ouLgyXe+YryZ4b0+IgS3vQoiCt7KQOMxTPXX1T934YhtwCopspOgTlwjj6kPRHkaTCOR
         gmbIDW42qpx4muSE8YyMSAV3oEMZUPBsdIAWhqiw9JG56GvnVOVHV4WAp7Od5QuuEM2r
         48tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8qZq7Sj9Z1+/AuLBZudyIsCXHiG9eyRrTdXAw5gAymg=;
        b=MwwEQHtS53lQNNQx/5TmRMmxjaZ6KMnDWcWew6x3cdZMz0tV2foOrs5iZ392u7ERp5
         LAM+akQ5h/mhKsWv2KYBC/rbVxfF5kxVaBTqOCNquITWgra1AYlj5IfQOAw9A9vH/LWt
         BTAtE9+yxY6uusodVodxp7SypjDIyAC0iYdp4rd+drgU8ICP1IAwMrKGww5SfhDH6E/B
         /VraTh9fHrM7lUxNvQ0NC2v0w9zrzPR/CIdwhAb1li9mm1rR4Fo1ejiv+HWazqj3QWcc
         YhbsimYg3MM6DFjrmO/fG1aeK7NhVdM4/HoVFClJX1JKsPXn/+vanK4F5BOzvsdZSoi/
         Slwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncS2myg3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay43-20020a05620a17ab00b0075b06bf2f4dsi689688qkb.159.2023.06.20.03.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 03:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ncS2myg3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBYV9-0007Ml-IW; Tue, 20 Jun 2023 06:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYV8-0007MZ-JJ
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:22:18 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBYV7-0000GI-1u
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 06:22:18 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9887ebe16d0so329127366b.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 03:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687256535; x=1689848535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8qZq7Sj9Z1+/AuLBZudyIsCXHiG9eyRrTdXAw5gAymg=;
 b=ncS2myg3xC2gWwpjNT0KJhDdTOEzU82KmTHmpoCF5ABIumileqf4nFUu9GERlN557Y
 /r2qbYjWq/4Lv6kW8SxzsZv/7Q1L3kFBsXmu3nmQuAztiSRWjSiNYN/bOUk/bsxQwP3n
 h7WJlrWT0T6fhfrbeExeUmsVgvDqSNNs7LAxXplhWmMNamlvUrxPUZB7wY8mGfxhJAKh
 DUA/yR/YGmtetiepg6tqWabXKsf5MT2xEZYaULpTna2+cLzTlEmrIMFLow1zPCLxYEGX
 Ul1MR6J2Rp8OwpUt2DJwQQkwWHQUkMo1TP6OXJR7lXhbs/zFl0fh3ejWuxJRK3hIwXfU
 NCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687256535; x=1689848535;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8qZq7Sj9Z1+/AuLBZudyIsCXHiG9eyRrTdXAw5gAymg=;
 b=l1l7bx/Ov1iqIcxxHGU2DA4r3nCsT80JDfWQxa6SWXqW7Plv3XvxBeADLxpioVPgaa
 9tkphC+qPor8dakzH1xdNQy4byaYdnNeQuZbz9DlR3fORmctbgG3KZhREHG4kLie9XGH
 DjOoq2lk5LyshrpsCInpopCs4pd5oBxEaHlegeDcuMihozpmgp73aJ8KSE9qeSV1FhYd
 4+nvPWGYQp7j+sgf+92A8v/zad50ZSbn9K8wTULpPKy5dqLVfDcrAlQ9y9UIk+JApNHz
 meI/hSpnTZF9vek6QLHR/UyP5+kwcrrNoOng6p75Xe4IxGK9tJkkD2sy+xt1fazFKOpt
 iAQg==
X-Gm-Message-State: AC+VfDxxynqXilzSb+EII5BbnhKOM7xcQJCh7gKpYA7ow5dE3d9/lCQF
 jnseJIFaN3psuNmdEE8UjKuSq2YxFhqoEm6AJxDY5nse
X-Received: by 2002:a17:907:160d:b0:989:3ae0:772a with SMTP id
 hb13-20020a170907160d00b009893ae0772amr906325ejc.50.1687256535510; 
 Tue, 20 Jun 2023 03:22:15 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 ks25-20020a170906f85900b0098864f474cesm1108233ejb.126.2023.06.20.03.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:22:15 -0700 (PDT)
Message-ID: <0b1d6388-7a7d-6eda-0405-0897aa8255ba@linaro.org>
Date: Tue, 20 Jun 2023 12:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 11/34] target/arm/tcg: Reduce 'helper-vfp.h.inc'
 inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230619154302.80350-1-philmd@linaro.org>
 <20230619154302.80350-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230619154302.80350-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: /HB/5R4aEwGQ

On 6/19/23 17:42, Philippe Mathieu-Daudé wrote:
> Instead of including helper-vfp.h.inc via helper.h which
> is included by all TCG files, restrict it to the few files
> that require it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/helper.h               | 1 -
>   target/arm/tcg/mve_helper.c       | 4 ++++
>   target/arm/tcg/sve_helper.c       | 3 +++
>   target/arm/tcg/translate-a64.c    | 4 ++++
>   target/arm/tcg/translate-m-nocp.c | 5 +++++
>   target/arm/tcg/translate-neon.c   | 4 ++++
>   target/arm/tcg/translate-vfp.c    | 6 ++++++
>   target/arm/tcg/vec_helper.c       | 4 ++++
>   target/arm/vfp_helper.c           | 5 ++++-
>   9 files changed, 34 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
