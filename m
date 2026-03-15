Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F53BF30264
	for <qemu-arm@archiver.kernel.org>; Sun, 15 Mar 2026 13:44:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w1llg-0005xu-1B; Sun, 15 Mar 2026 09:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w1lle-0005xX-9h
 for qemu-arm@nongnu.org; Sun, 15 Mar 2026 09:44:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w1llc-0000Ca-Uq
 for qemu-arm@nongnu.org; Sun, 15 Mar 2026 09:44:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4853c1ca73aso29740845e9.2
 for <qemu-arm@nongnu.org>; Sun, 15 Mar 2026 06:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773582267; x=1774187067; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qQEuHLcaKmHbNeWnL/cyH3hFkJm2m7Bba1DmXkayB1A=;
 b=qafB9vz9Vc+HU0C6e//FYzNk+zw8ZULImMxvZ1J5zKi1CRmM3oXHIt7vcua4tiMUJK
 BEqXi+33HB2+RQ0nYoqa9EDYPc7XDG9cBe0qOFM1we/8NNUYLhEJWLn1rA5kuqDnVmMC
 u3fNlauqKAiFbvDzjx30rGeNOGg58/BlmAPH16qSYC/tmI2xPjN9eF3OfB+kxfvAIh14
 QKo0qwwcdyzWdZxAKJbCv1GCCFqXVyUy3O4IAp3KkDi1YdskCnBiBzazZJVGQZJgSb2E
 C5wbWYaBs/dzO9Rg5hVU3aJlFtWqQ/rT2ikNjdQJaANPWgYaTDQYDxUPtmHl9QDWPDC0
 9cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773582267; x=1774187067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qQEuHLcaKmHbNeWnL/cyH3hFkJm2m7Bba1DmXkayB1A=;
 b=YPEyDxPfIv5q6AWMIJFYknBScOTauQshetq46AagcgQIJz8kUSRj1dbFWChalILtjv
 0HIziQnUkbs2WP35T+k2Y2xMGUgkuQ7gFzmjltfVhRMveuXJjTq5vYx+VTA9PEZMau6v
 +ubAjk+UrSCRraF23OJ8Lnv+bLx/R9fnlIWEDJq1tGuff/Cnu6eRIILi1MdvPFOLEFPD
 50Z3KSZLrG9TxcfddC5npGaN/fZ4Y2r8wiLRGvdpCeRQ4qGHFG+tZyMhQ54UhT6+d1dV
 0iYqYnlPJ9EujtAOfOQANYEo7zUawL72jTEwQtagdJWBai8/mosoXEzia83uKDtGI1NN
 YX7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuHKzh+eo78CnYjkqVc1vnc7TYaDbVQ3Jc2V28UOneuiQ/Y9dC/gOoUA18iA52JBLLGPxaPrzPXg==@nongnu.org
X-Gm-Message-State: AOJu0YxieShxIu+7lKIkPJBuLfzW9JZyLeD8BJShj+0dEQ8gmYI2sO2V
 ac8lVbJOWOdJ1MLbod/KYlbZfFU6xBY/nA/wbrSeQlOfqkzjmLLqNXGq01KzIj+mzkc=
X-Gm-Gg: ATEYQzzUu6hYkJgpUjJEWby3PkN4BJv1b7be7Cfn2KlVfx+WQb8eKGcIqUfTLWWggzs
 F/Ev4+QzCUjTUrtWup2bDNkiIfLTwSUpGZc4vpB2tRyHVPlhKx0cvWtdyP8mWKODaEbIMapP4Z/
 8jLxPI6jXTiGmLfwXz7KS3M/Zfzq+JdSV/Cy7RMeKkfEz5lDahiLHg3FCkygbHrMeVbQEN/OWco
 uiwcnH1QRfUR1WjwdxqDaj2vt15azUK/X6WyGmtfDZIEzGXFbQu4i25aQjPmp995zrWJMOdoyU8
 9D9x56WY4ADomHyhB2gR1WbQtuLPBALrOdZNPgOa1gnQuW/jvdLC4HICZts646fWfDvKc+WP47F
 pS425Pg87ODRuySAUSa4TcvKDQ4jSobQ/yKqW4LvX8kUR4ktZVUNF6OmuELsc0Lqr17OO0KfLnD
 r0pepdINMDTZtNmq1xVfvuHK2+iGNFT65boLPYrsvWYaBwZ3jqtbqv0+ARqC+IQPok0w==
X-Received: by 2002:a05:600c:3b90:b0:485:345b:ccb1 with SMTP id
 5b1f17b1804b1-48556720f86mr148634945e9.27.1773582267326; 
 Sun, 15 Mar 2026 06:44:27 -0700 (PDT)
Received: from [192.168.69.206] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f708sm756964175e9.11.2026.03.15.06.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2026 06:44:26 -0700 (PDT)
Message-ID: <bc1cb04a-8e3a-471e-8fed-1c53799ebef0@linaro.org>
Date: Sun, 15 Mar 2026 14:44:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] whpx: arm: fix ID_AA64MMFR3_EL1 host feature
 register index
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Osama Abdelkader <osama.abdelkader@gmail.com>
References: <20260314221529.47841-1-mohamed@unpredictable.fr>
 <20260314221529.47841-7-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260314221529.47841-7-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 14/3/26 23:15, Mohamed Mediouni wrote:
> From: Osama Abdelkader <osama.abdelkader@gmail.com>
> 
> IdAa64Mmfr3El1 was stored in idregs[ID_AA64MMFR2_EL1_IDX], overwriting
> MMFR2 and leaving MMFR3 never set. Use ID_AA64MMFR3_EL1_IDX so the host
> MMFR3 value is stored in the correct slot.
> 

Fixes: f7fa2b88084 ("whpx: arm64: implement -cpu host")

> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/whpx/whpx-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

