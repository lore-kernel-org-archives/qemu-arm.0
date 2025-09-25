Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED85CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 13:29:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1m1R-0002n6-GE; Thu, 25 Sep 2025 09:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1m1E-0002Sq-1r
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:28:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1m0u-000482-0d
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:28:14 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso826298f8f.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758806875; x=1759411675; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lBg85+VeMBSpTs/i/fWzvyY0dcW/NGYlgEF//JFSu00=;
 b=jp8cyfb+ctQ9p+kc+Q32q+iQ6jk/dftoWoPI1gSd0b1m4mUQpEXh8kphpQhaXOS/Ql
 +FRw7Q0FlfGRn24TLPoetIwl/N+qCQC5ocW+wLvnMm/cTfA14DaXombCzp+JgEf08XBm
 OVjY6q/h6wInMQeNP0dhF+VabJEA24qBOqNVJLIM71TqD+xUxICdF4qQr4Kqa23nZuAK
 VgPey3KIGfs+dtkruMPz4HABYDfchl7Nj+ts8v4Pvj/6+JSHEPUz8DbEEgAYpkEIAFS8
 s5fOkxcMDG53xfTijCw2eGjeFE18DjLkpeKsFkXs8xVecNVRdh9eh48Rwvn8INi74pu7
 Xtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758806875; x=1759411675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lBg85+VeMBSpTs/i/fWzvyY0dcW/NGYlgEF//JFSu00=;
 b=FaT4XyZSEY8qQ8OVkcJ4aOHME2DOkNMw7LbXtIckrXFBzdLmDBePdFNXmtkx2X/AHU
 y3raK8olG0cz/+ORL8lNlc4Ps0aAxs3xMHgSKv1Un9lbUBNMXiuiDKzE2lFVoVhLA06Z
 PGKl46gHYzb+9syyal8FNC5U/+cQiEp7gib1GbyHlrAQFCsHjGRhcpjqGxEgkIbqFcTP
 IykHT8JQ919LOW8hIdld8yTlaebRKTYke+TtglnnDrnmauumh2N+Fuct2ABv/66fqFE/
 +bj6qdjXWC35E3H2oLUrvnnGyPiE0+A0XiIb0E41DAJ7GUXxZOTuET0XsQknVQeZcESC
 SQmQ==
X-Gm-Message-State: AOJu0Yyce94wJEAxcrn9Fa31bTvkGuIGqc7pg+akFFYfcQoUZAsRIt70
 2M5oce4ZOR8X4me+BGstAV40cOXWQTRDHd3x/AyTTuqBZtoT6c04CRljilFUk/323Ns=
X-Gm-Gg: ASbGncsrkes5kRpQ8wIfjAuQm2P9SQpqOOI5oy4Q3GhTcQMRWA7hpMcfCYBsRol0Wp6
 6wZYignT01omFryirlntAALBZy7/ny9VgUI3M5yJemkgww4UQvrQDLOas8gnSt0RSvFGXJMgxwQ
 eNn3cfqwq4SjHCCrdPBJ54JDd9mVAIoN2vApKqzO33DAcG2inLmbX+YBMizH7mN75UwbzM2byEe
 UmVVfXpapXZaHLtNq65u1Thz4lm47qXLfPjxVK2evySiPd8G5FG+WaJnd5hgd/EUbEd1kJbLF1g
 EXvFxQXTENtfx8e8ZZmknGWvgKuAXfppGTSJI/ZzSBJF2OZBMhchjVGIEMbli/FUOrrh6HiTgRH
 it7sO4xG6DW/stINHt4iq7vqSYm/EDIXylgZa8sTfFLWKgS/oB1moljUU5AG61pi/Dg==
X-Google-Smtp-Source: AGHT+IGrXY9k1w+g/JYNxIy+/pmsfxyrqzpsZSl8Z1VenUXhpqvuCNvQ5X2wLD+7VfjS3Ks95fS+4w==
X-Received: by 2002:a05:6000:420e:b0:3e8:f67:894f with SMTP id
 ffacd0b85a97d-40f65cb098emr2793329f8f.26.1758806875383; 
 Thu, 25 Sep 2025 06:27:55 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc5603365sm3156080f8f.37.2025.09.25.06.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 06:27:54 -0700 (PDT)
Message-ID: <a265092c-c6bc-4108-9ad8-f70a19c36651@linaro.org>
Date: Thu, 25 Sep 2025 15:27:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/36] target/arm: Remove
 define_arm_vh_e2h_redirects_aliases
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-37-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 16/9/25 16:22, Richard Henderson wrote:
> Populate vhe_redir_to_{el2,el01} on each ARMCPRegInfo.
> Clear the fields within add_cpreg_to_hashtable_aa32.
> Create the FOO_EL12 cpreg within add_cpreg_to_hashtable_aa64;
> add ARM_CP_NO_RAW.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h |   6 +-
>   target/arm/helper.c | 249 ++++++++++++++++++--------------------------
>   2 files changed, 107 insertions(+), 148 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


