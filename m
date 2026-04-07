Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C02F10F9972
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:49:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYc0-0004RT-Pq; Wed, 08 Apr 2026 15:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAY9w-0000ak-Iw
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:01:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wADbV-0002PG-C6
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 17:04:59 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-488ba6366a7so19387715e9.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 14:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775595895; x=1776200695; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9HpQFuT0DKPaDPfbPNtPLVWuxJBPTKUXJcpXFbKe3q0=;
 b=eQUxkUIA7TLcnPPXYL3MflfClUJ0edtHH8p0zbrXGRojFM9FIlQ5fKj4/2qOj1T4TD
 1vjAPKxJJptBdL+YrLxWtp6zFW1yt1IuetaIjY6qw5ZhK5g3tQyvjBqqZDoC8XgQjaBF
 AGaPcYspj6kT590EQUMXGwykZuWsww2ZOBStGcriVssvgEQCpHBIMcI/200IAgU99wML
 lFNY4ltqy8sGxVqfNQHSFV1lwbUM+2uNfI0xsvSH08NAuoQ1sgUSTgsdYgA0vvRgrR86
 8vrjMMiWVE8jGFXIfT8o4+SoM7dXfSCGoNouAjdnZ0iWneOguJC3LuBk3fqX/Jn0/cee
 4MOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775595895; x=1776200695;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9HpQFuT0DKPaDPfbPNtPLVWuxJBPTKUXJcpXFbKe3q0=;
 b=sp7ZJCUyg7specbhiL1VQWrkHOfmT6M2fgjwklgwTP/bECz6jLqv5K0xVZOflVQxuw
 wxhxHwHTOy7CJaHk6xh4lddSsw0LbhSIN8iPq1uiI3llDmhjfz3dR2sIxodDPaqwFD/+
 utiU7wqCdWolcB4KJIgfeWIqWSTO/R3bOXXzQKcvQnbq/kmYsXP63pcyhPRaJkAf0del
 x2I84NpToyQlMEUDEdp/B2/qE5LSmOe+QLxgwmIUt/VSuNJ4Kv9SEwc4y2HhdhcOWMeq
 n9QapRpK/RdR/+U5nYUSOJqXhchwONA2Szs0bvIinclS/aRg+z7ztIVerD8IBtxn/TWO
 Sd9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuWZzEwLgrZgGE+phgO2AlvHPYYZrYKFaiFnKrlQWh5A48DxdVP9f8uK4bPuFW3IUAqdk5B3r7iQ==@nongnu.org
X-Gm-Message-State: AOJu0YwrJ7fQCsqBRv+FnyxsPUXB3krpYSaPMlMJeWelS8YKSLoSWReS
 nG50phhNgWTQHVzrK4VCXCIybEUcAj5uMCshVIlY5AFPA4VuilPbKBNrDmbAvm384Kg=
X-Gm-Gg: AeBDiesCEmPV1Z7iSr60zYbTyAI2B2Z08xmc8MFhlEPvsDctlHWitWIJM1wXhCPwuvJ
 j4IMJwNv6cFDxa2RQWXQMBHX462oBFJrEVORMdHOlAWHKwsvdPYb0y8oKAFk1WtbNb6LkZYn8+S
 HA02urefdzs4+1KTGwUrvBV4Hdgy9aZI3mPjrpOflYjj89VAqfHbbcurwNjGmMkgUwFI2FL4548
 A30OSPICIeS+sZ1pVelmjSAsNpHVNjMQycNLxVKSc/tcd+gybmmA6ab/18qy6Qcy8FeFSK4Bos9
 Ce6KbGG1XdoKC2H/evfOLkES5OeozVQ+PsKumCrkEsp1x5uE6pDJJmu9O0N1f4TF2nOVyGQC8zD
 sc/aF1aisOIHQwA1Lha4fAWsy04fDWB7jbGdlvqGEuklzoPrErDJsyZqe+uI3Dkc0QFpuaznm6w
 qLL6PQQGzoweZu2dDMrrapIdepeQH+CYTm2loLQ4cWFtQaLkKXcd669GrvZCNIxNSkSb21GGaUb
 AfX
X-Received: by 2002:a05:600c:a47:b0:485:4eaf:eb53 with SMTP id
 5b1f17b1804b1-48899781357mr280250015e9.19.1775595895154; 
 Tue, 07 Apr 2026 14:04:55 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488a952a03asm258729465e9.0.2026.04.07.14.04.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 14:04:54 -0700 (PDT)
Message-ID: <0188d667-151f-4d82-b848-18646e1b340e@linaro.org>
Date: Tue, 7 Apr 2026 23:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 17/21] target/arm/tcg/arm_ldst.h: merge in translate.c
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
 <20260407195922.196410-18-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407195922.196410-18-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 7/4/26 21:59, Pierrick Bouvier wrote:
> Only translate.c uses those functions, thus move them back to this file.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/arm_ldst.h  | 47 --------------------------------------
>   target/arm/tcg/translate.c | 22 +++++++++++++++++-
>   2 files changed, 21 insertions(+), 48 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

