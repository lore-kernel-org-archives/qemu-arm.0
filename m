Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A05CCCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 15:02:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9lyG-0002d4-GS; Fri, 17 Oct 2025 11:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v9ly5-0002Q9-Ma
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:02:11 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v9lxv-0004jJ-Oq
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 11:02:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-26e68904f0eso21148245ad.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 08:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760713310; x=1761318110; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MDtjB7BWmW9MfKm6fCWkzHH7AMYlVmTgFy2gFDI3M44=;
 b=q24+ry9ATphWlRRT4gxV50+SJ26n9w37kb+E7xt3zu61ignPYyKvpGp6s8/kwidDoL
 g+kSEYOExgD9thIVHYlWzLa1nszsRzRzQl5JccdnynbPjuCmP6DfMWtSbL8wNP2QUO1E
 s2FwxO6GBFxnBhFBga5/nJ0FONLnLE8JQ0zMfV9wqTyFaIbFJ0YFWulPedAEHAvN/m2o
 C/z9NrnuCZCPeKVgb7+7OY7Fx6AkmKynihwqwQbyy3LA7oSPAllZzJS+5GyRxNnPoZmt
 OTUJepw4jaZgECr50aOZru9pu94Lzi9nxiE5X9qcMEixAIsMzJS+3Ei+sop2VWhOnaun
 PRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760713310; x=1761318110;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MDtjB7BWmW9MfKm6fCWkzHH7AMYlVmTgFy2gFDI3M44=;
 b=F2VwUhCYL74oxOsxDMOY7OxmnU2VKToHH+KzGn9JgCeSSTEczOmfxCvciNrdX8CUQg
 4AGpMA7W+5vv2Vj9l7XwD08YI4ASozZEp8Y+SOQBmyiO180W/MxM+d1nh0olc6oWQ4t1
 wBHswm1GTSsMFwB2kiMjsMg6qGcz+zfJC+suYF073uh4UULRsfAOhxK7Ivr1O9Lkm7eV
 qRHDTTnGBUTD0kqNqc4CphCqSTcr872/0sJomiUcX3wDOszRcaWsrf1Y7sPD/0Qt7cml
 kymjLgnlG/DoL12vN6oes5HP6KEnq0UUz8BFYYpKu54ZCu1LSZd6YyCN55uTcTDvaIQX
 OziA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7oEdckOOqbzyMS369kW0HJlrFyMdhmgIn4UJw/d7eOLfRiX3YrzjwgPa9Nrf9V/sGWiI9hjhXTA==@nongnu.org
X-Gm-Message-State: AOJu0YzzB1BoqWuEyHxDzesvX0Hbdn1CC9Y/ZW9j0qYgywSQGPNtarmr
 xImigNG6w6BijJyasATlMtTz7ye/5mru6AEjKeSdTFCrF1DRCSwE06HZs659vM4Dk3w=
X-Gm-Gg: ASbGncuQiT3Hr9FLeC/04Bvg2H8QENxUX7IBKut/NCI/23vWYWfee8XQxmEul+JoZSO
 v5QASM442/lVxLZQ+UR6NyF0yt8kRSVgokGTCpYoeY+BQcBDQ6IsWcec+UJcWj6pfS/uKEaWSsQ
 ZmY5VQnh8FTLr5434NFgHKsUywb7Iks38+4QIkHPJH0dJf/hgQnT/E8/GoDPDvWcoue7tDBrVdS
 EWqYlhj/jugT5xx+QT3HnZdvVzcIUAcSsPENsCwjE5uH4ujvSMnV9vsxU88F4fAO/lp/XscMs3a
 BRQcwpGw8OLFjnok8JFcphFWvjgpX2Yk6tJ8AiAx3EuAbbzhw/cAtVGmb9aIk7muFPImi+FajdA
 1ehCQ7AmKwZz2E7d7DdRd0LFh7ZBWUvfsZJgm9MsAlZ/8Iovp+35HzfyUeQ1DWOk+Yl44QvatFw
 kfDdVKXMMjcwH/DrpzT9CaRrdI
X-Google-Smtp-Source: AGHT+IH8FjVqmKL+m9ZKw9PckeHysrYmB53LsNkpPQQyvU7DR5pKX4ZdmEbn4tBvw//iIk69xZOnag==
X-Received: by 2002:a17:902:e78b:b0:288:e46d:b325 with SMTP id
 d9443c01a7336-290caf858bcmr50921135ad.43.1760713309698; 
 Fri, 17 Oct 2025 08:01:49 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099aba99asm66272675ad.87.2025.10.17.08.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 08:01:49 -0700 (PDT)
Message-ID: <87479dcd-8db2-44a7-858e-acdebbadff55@linaro.org>
Date: Fri, 17 Oct 2025 08:01:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/37] target/arm: Asserts for ARM_CP_128BIT in
 define_one_arm_cp_reg
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-5-richard.henderson@linaro.org>
 <CAFEAcA_YRU8F02wM2z_DvR-0hryUYEZYA99fy1c+H3M6xzqN0Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_YRU8F02wM2z_DvR-0hryUYEZYA99fy1c+H3M6xzqN0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/17/25 05:59, Peter Maydell wrote:
>> +        assert(r->resetvalue == 0);
>> +        assert(r->resetfn == NULL);
> 
> 
> I assume that not permitting a non-zero reset value is just
> "we don't need this yet, so don't bother writing code for it" ?

Yes.

r~

