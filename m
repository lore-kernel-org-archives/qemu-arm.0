Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8BDC87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 22:42:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj3sv-00019v-4b; Mon, 04 Aug 2025 18:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uj3sq-00017m-6q
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:42:21 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uj3sn-0003i5-PE
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 18:42:19 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458bdde7dedso17406785e9.0
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754347334; x=1754952134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VjTQ4z2k7H3mC0fHttSFmBAL3Wgkm0GozBCF4sbE9ag=;
 b=eMN6Q8Ep4ZIB+vDAAeVrhn0uYw4GONYjkrI+Wg+t3qQTKiqvWvYTgZtC+v6mS/Iox6
 b5t9nyXpwFxMYtjJ5YOBm/6PivwMlJrnuw00V1WiYg/HKYdjUBJEdjO0zRHAr+FJ+toJ
 v3G8ZNN6u+nJu5Fcyd4Pyx1h4LP2sgdCoUhyAT3oDv9tTon/ZoaqP8ytHC60Lh9UUQDC
 20lV6TupuIoJjWOBNmMjS7mIyXDx1IL1IUzt/cOBt2J3AJAeef0EuSvlSB3APYuq3Tbh
 aJvooqae3AOpkCmU+356H1f5ZqP2ob9ki7EnQvzvylMLMyykDv+M9PY/F5WQorB5sfql
 qv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754347334; x=1754952134;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VjTQ4z2k7H3mC0fHttSFmBAL3Wgkm0GozBCF4sbE9ag=;
 b=fwUWJr9cI2ZI/R1wzRucIZKY0a8KpptMMke6kB6MU8BT64NI7BgvIFM+yR6VqDCOd8
 x0uhSzV1Dqi9dtNww18/PIgNL9TXuMoy+ZWMi8PkZx/QbzZIKDVJUr7CltPb5lfWQH4l
 9/x8qJlMswySfEqMR6qoIxs6UTZ7hnmAkSFdomW1fyWULwXG8LjKAOtPu7LgXTRDH3Fg
 voDgiiwNEZL2GfpR1TvvXftHXCDVxkB4uuF9PgRbnLZXy73slIFgddUZw/ooGiF3wc97
 b+CmvR10MZmRCFWLKh9HKAcN9xPYbWv2YakAl8HjOTYgof1JNI6YaUUqixibLWaj+m8n
 64Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1iTb79urAi1zOy+gh+ibBPKVPbwg5bEhZDqW/5yE7fyFoMgVRZKymUAqrF0BUI3Uvza6sNdzcug==@nongnu.org
X-Gm-Message-State: AOJu0Yxj/fj52oCUXOjVTIWQ/EcSfrc/u4EQK24xIX3eAAEYPHUk6Rb9
 6qTo/b0NvYv7WpZDAJGUOcBVKkn8mcqF1mac/i2CgJNzhvkHz6Ctf3MBEHRrIPnx/68=
X-Gm-Gg: ASbGnctom2GzB1nHg0BJ10kR2J7sADXnq2ibB7RmSOnSy1qtJM5aYZVwFz/drmiOFRo
 i8XSbr+zjehNY4HCBZI8A3RWM7GDiacA73SF3MxjuZZAOBEIEGGpJNy++C6YWI6n5IQemYFoG+W
 4j3q4tYmS5AlAkTNNhWGHp3H8rbtvWBmZOc4bHr2PIeYLLt3OrrBiKdOin6uSNsnjDDQO+oBxxl
 zpZ6Bfs84XS5CkBFZOP4i3JdV09G3zg3i3P2OhnJQ2xPEJejxDP0Bw5nuQBhv3PwpcpGbUVANPI
 D0787/N4cZCoOhK5R1usI6B2E7rCV0hAI1QD0pURuZx1ZTdgbHhiIRaYe536L/ZYIiYWRMgK4J+
 g4BV8h2geeoOfAKqTiqEGICFrUHdXTGHM6Oshvzy9e9ZXqKQAoAKjWOMIev9cwyvUGpidRfG0ga
 uM
X-Google-Smtp-Source: AGHT+IFJM19K3tYusZrhJo03D4+4nTXGfOPTNdj1SPfmjTQi1Fzedxlnqgrv1romr3UXOPCYfPz7vw==
X-Received: by 2002:a05:600c:3552:b0:458:bfe1:4a82 with SMTP id
 5b1f17b1804b1-458bfe14d61mr73246685e9.16.1754347334203; 
 Mon, 04 Aug 2025 15:42:14 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589536acc9sm230040955e9.6.2025.08.04.15.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 15:42:13 -0700 (PDT)
Message-ID: <ca38be54-ec29-4fcd-be02-0aa526258920@linaro.org>
Date: Tue, 5 Aug 2025 00:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] semihosting/arm-compat-semi: replace
 target_ulong with uint64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <20250804183950.3147154-10-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250804183950.3147154-10-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Pierrick,

On 4/8/25 20:39, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index c03096b253d..f593239cc9a 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -123,7 +123,7 @@ static GuestFD console_out_gf;
>    */
>   
>   typedef struct LayoutInfo {
> -    target_ulong rambase;
> +    vaddr rambase;

Subject says uint64_t but code use vaddr, is that expected?

>       size_t ramsize;
>       hwaddr heapbase;
>       hwaddr heaplimit;


> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>    * is defined by GDB's remote protocol and is not target-specific.)
>    * We put this on the guest's stack just below SP.
>    */
> -static target_ulong common_semi_flen_buf(CPUState *cs)
> +static uint64_t common_semi_flen_buf(CPUState *cs)
>   {
> -    target_ulong sp = common_semi_stack_bottom(cs);
> +    vaddr sp = common_semi_stack_bottom(cs);

Ditto.

>       return sp - 64;
>   }


