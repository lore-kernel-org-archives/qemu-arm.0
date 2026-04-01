Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511CB10F6FB9
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 14:58:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7x11-0000fA-LE; Wed, 01 Apr 2026 10:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w7x0v-0000dv-02
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 10:57:49 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w7x0t-00036j-Bv
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 10:57:48 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3585ec417f6so403022a91.1
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 07:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775055465; x=1775660265; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7zY+WJBmQZnfgg+bU6mIxK5hOsuQA0UDPUojGKP5t2Q=;
 b=CATXyYb9uctyXkRG6iq3fcvrBVo/1q8sniTs/dzjNawFGKEWV0Tsu0FVO3qshXOfAn
 amOImnvOgGXZFpsUfai1i3SaM9wKndmnNo39DzTH3n157R+W3MiK2Ry2J594NcqmIxcY
 1m2b/crABgDA27L3d7QXdVfVKkRYV7IOtItJ25iTdR4ZkJIuAYVSZS9uEOw3NUcp6lxP
 ie+zEN6VKx3eyViPyD+TZk0kdEi/OOtJ9adRRxViTe1bdt4xXTlCcQSkGDombzZTotcB
 BN4aWWFMDpawNYeghXl+Eltq0032aS1Hj+XVO7Y0ucUvFlBlfjSo+cHac7UGW3Y/29AQ
 QGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775055465; x=1775660265;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7zY+WJBmQZnfgg+bU6mIxK5hOsuQA0UDPUojGKP5t2Q=;
 b=l5+yAO/8p5AkU+TPmpAHhhhP7ukOkojL+boVEbUUuCrvPCLTa2H4K7+/eN2BXF1PVc
 ufoP4tes0xqAv249Xn9qGQroX8OQFbLznh4fNe0P6OPYP/On363m7Gkjn8glNoINSSkm
 nboyo0n4XKTNZZfKo6a7YmlB3mTtF40TWcQzvMyqerBnhZ47JPXiX1F4c+R8rbpQf8Be
 lZV6PH0+DF2/c/iLZRH/VsQkN2MyZmEn5LmFHyToNV/f1njJPHPwKTNcHn/fqE+nU8He
 Ivd5yB3qZ9uUrHJpLFyPo+9Q5SuZAXE9Qax5pqOJ2nqdiSw/6X7dewFx3j7cohTvyK3U
 74sw==
X-Gm-Message-State: AOJu0YzscFF9MIVvPoQ/paQznvkM89CoUGD9ozAkSzlmhqpaCFnr8/+z
 fOZdpU82iRuEjBtR6gRKibFWEddswV3grS+1qB59A17eHdh1NqFYpDyU8wzuZ2Eahqo=
X-Gm-Gg: ATEYQzxHjW6lzeORv/lEw9D0HXEnfx3sIXTVaOurDK/cwoKOExt070uWwvOqmxq214Y
 fsSej32kKsZ6Yo3VvaeTj7hG6Sz5ZMNAHd2Y3pGzXMAlz7L+UmZO6+mFIGXQhPjguPNMGYtu+nX
 oJPkF80hgBHpsLoXno91FcWtBw8gjmXymISCOt3zAGoQ0ppBRbbE64q5EpP2d+5G9IFUWR+UvrT
 vppKIuAU49F6aQbN0aRYVPKSiAGUtcY1gSYkUSO5VvaNKTmgdPl93EgxKJ4W5gitwjApj7cGM/S
 4ujsoVnwz0pUU6M4ns/5pVsZjNMztZenz9NAE0ieFpswEaTrlLy+/Un3k37YanR4NDSGfm0RiLo
 fx514eVhFnh73Wv8oIJd+JV78QKTtETH0d2fGKi9qwuVZhF/OY7k1VQh3uqkxO+E8S8gdbfKMlw
 4wFX6pRYS+hzBothCyEiaXtwInEkmI57OzTXobSde1KNLU0UDkmkyAWcli/Y1Zw4Pm3qJCPc7XH
 eCMS5I=
X-Received: by 2002:a17:90b:2d8b:b0:35d:aa02:d776 with SMTP id
 98e67ed59e1d1-35dc6e7b196mr3470275a91.2.1775055464688; 
 Wed, 01 Apr 2026 07:57:44 -0700 (PDT)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe5e5127sm6974158a91.1.2026.04.01.07.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 07:57:44 -0700 (PDT)
Message-ID: <d9ebb776-59c7-4ee2-8aad-dd38d14baae6@linaro.org>
Date: Wed, 1 Apr 2026 07:57:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.1] target/arm: Replace target_ulong -> vaddr in
 guarded_page_br()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260401143456.79843-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260401143456.79843-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1033.google.com
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

On 4/1/26 7:34 AM, Philippe Mathieu-Daudé wrote:
> Following commit 15500df3b3b ("target/arm/tcg/translate.h: replace
> target_ulong with vaddr") change, adapt guarded_page_br().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> I know this expands to uint64_t on Aarch64, but vaddr for $pc
> seems clearer, since this is the type used by callees, i.e.
> probe_access_full().
> ---
>   target/arm/tcg/helper-a64-defs.h | 2 +-
>   target/arm/tcg/helper-a64.c      | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

