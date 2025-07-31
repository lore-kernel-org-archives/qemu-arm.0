Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AEBC87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:11:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbUa-0003QG-7x; Thu, 31 Jul 2025 18:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbGM-0007NP-4f
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:56:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbGK-0003rp-1h
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:56:33 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-313a001d781so871787a91.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753998990; x=1754603790; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pIQkcJ5wW7mmEUJCk3oWoKkdfDjRjWtaO/LD7TIHLSY=;
 b=LLvvosPVRLAiyA6c634dtx5ZK2XlUq+yQCqQYcovymDRFyW7WB5eMnZscRpMb5E/RA
 Oq5iHiV8imsHczXegBhYEZE7EIiBq9cMec/rJ/z0qXpuIX3LyEykjpwo8c/WWHarcpp6
 +pLC/gHBIwW9BQeSPCH1kaZWPkhT12J2hp0dYa9R0yDTnM/XDkK5Ygf2XwAkbnen7sk/
 Eojee+wti5EV2hO7tcC++CJ40qTkLc5P9/dW+jTiHE2AREXIJkujLqS3EqsYOVGDGX1s
 chWp1YiQKVpJ+kOqdT5JbV/qmJeqETZpAjXmaoIGqo4SvtQVNCLTBSjOPCCMHZO9aVb5
 D4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998990; x=1754603790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pIQkcJ5wW7mmEUJCk3oWoKkdfDjRjWtaO/LD7TIHLSY=;
 b=HUdbp5BMbLRyjYybiqT3dd4WcW11EwjB2mjhfdgqOplhPc2HtQGzwZxmx6+oilV4AN
 h+fzGTfqKeZZ65ydqRJASC6pgM6q60CgiYD4n5ED1fs1BtNeap8K/BuVPJWXgQ6rSSUT
 TAIxIDf5TDjNRiI8UJqsDwsHKRokxJVi8T94iFKpKYVXAFV8WF+aCaXPvHDd8/IHRpmP
 EaFl9L5qtrMGCRfx3kbz2PO5pMVfzdn98t/m9Z/vZ7s5DNo6PsCXUex+hxpNu3uhwUs1
 UNVv7bqQQDoRCYTGchydjS/HrqQ9phOwUl1qz8BF25mOp/36L/ADgsXnwKDjcLbctEaq
 Sehw==
X-Gm-Message-State: AOJu0YxQIfTagitYeOBVB97v+at+jopytgrbOZSK4gMC13Fg27yy4P/4
 NM71tDRlzBB57dKch1guiotzEKy1c7Edj6UPKOdKOGstPmvRXfZ9ZULfQV2Cv0fLOUAfmC8LBTo
 cULHe
X-Gm-Gg: ASbGnctR+bPuKMYKbxK+FVuMYONz6VlCwI5S7CGdqV0uv4A+Vn/tb+//yQJ+E3AuRNB
 jFKNzAnI5I8sj2lhxLVaoku0K/t7MnidcPuipa0zPK7MONPLeIkZPI9fPrZGCnTcyTuIP+UAzNy
 622lcsBkzC8QROESwSVWNUimPYjhzkO2kOjH4NRgQGguVskGpYW3fWPSdTOymuFxhx07abJIpbr
 AHJGgtjnBY/1S/B2C6UoqNswNG7pIHvfwFrCTFAHc4gA+y+CdgX+dq3GA2ZbOuHvZkBEHL0EftV
 rAzVemJ3DC1pYgdG95P7yASQ8p7lx08uRV+QJMTUQO68giFKdd60ZgSoq0+74r3PaUBT8OsMfvT
 0uCpFF1JhdRnt+0xGQOc80fcXPgJY//JpUgo=
X-Google-Smtp-Source: AGHT+IFE168oUPTinzs3iL6uD9tnefo8mJ8XCcohH5mJ2nj1C/9JSzBn/C+EgEK0HZx7xP2LOv7UTw==
X-Received: by 2002:a17:90b:1b06:b0:312:26d9:d5b2 with SMTP id
 98e67ed59e1d1-320fb58f639mr629528a91.0.1753998990543; 
 Thu, 31 Jul 2025 14:56:30 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63dc1bb7sm5601050a91.10.2025.07.31.14.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:56:29 -0700 (PDT)
Message-ID: <dd5583ea-a349-4ef5-b89e-194d80009184@linaro.org>
Date: Thu, 31 Jul 2025 14:56:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 76/82] linux-user/aarch64: Inject SIGSEGV for GCS faults
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-77-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-77-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/target_signal.h | 1 +
>   linux-user/aarch64/cpu_loop.c      | 5 +++++
>   2 files changed, 6 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


