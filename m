Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBDDC87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 23:33:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhcly-0005NZ-Tq; Thu, 31 Jul 2025 19:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhclv-0005LN-Qb
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:33:16 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uhclt-0001wr-12
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 19:33:15 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-76bde897110so25866b3a.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 16:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754004791; x=1754609591; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cusbk8h4iXm2jR5tUfzKzP0NPQDw0lyh5JXYtf2oG1Q=;
 b=Ll0i/fv+PVOVuSpWwiYesNdhoMmYWcYf6cV8ltGHaDmiYW0aEcBU1cICAuS9bWbWWV
 /1NJp1BgEZguM6jWHfQ6JxFkQ5p4mvQAlMn0Y8PREeqVKAWNv3oQJX6QkxCen8Ei2+ik
 /HqwD3wGAwy9ZqSo5Sx+wuAowqp8BaxIRi6mZbneCH+Tgc8K4OMLpEyLMoxlfhhrTLSR
 By7i8TdhhZ/nHh3Oi3091L/q72FljAWOO2NbrEpqjSaQjZ/r/GxjYZ4cZQB6ZHhbKFrX
 F8PVKKiM3Ip/bZvcSudNQObR18FqDmN7VCYN3Eii/62bx95dNx7vQcbA2pNwFlF831lW
 COsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754004791; x=1754609591;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cusbk8h4iXm2jR5tUfzKzP0NPQDw0lyh5JXYtf2oG1Q=;
 b=AdblALq4E+RfetwNC2yRvsHg4aBPAJF5/u2Mg1RNMyd2SoeNmi6I13iiSBEAmhII1M
 0rvP0arSisoNxXC7KdcMEYxobmA+E4KI0YwKXzZ8CCMq4EQMxH8iFC6jx10NIREjqol8
 w+3yPGZottA9US7bTql9oTDrx4C4gK8HnaDscxjuD79n4GPnqsWBhrU0ZE0udSqYaSzZ
 00TJfnGGa8KrJr/7+dvonlOMit+MFnPQxsCDVoSuUOh9VbwVReNnK/dDf3NBVXPivUtc
 s6TxPX+tT8RwS4LemQnSf5U7CFYluVWybl75CqCaqZ5WL6T+xJ8VgNkRJig2BXfiQkBl
 iw3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7EEAisVdP+FloyR2HjSDspPyqCfaruytZXFrrQPyFYK26CF5OQKqsnZzNI+1lZcxo8FJhti7OiQ==@nongnu.org
X-Gm-Message-State: AOJu0YwZpTEb08hAOhVZFy0nvpvfpuXTaOi5XelON/t9w4C0y8+1VDe5
 kJcxMHXIjks/8dl7VaE8kINy9schIpbdCURVCfUlflkoULhmQFSBv+Z9k2G47CXH1PQ=
X-Gm-Gg: ASbGncv90vF3kgWo1L5nDn92mRnmKO3g9AWOHVJfWbORsFmJcEJaPO6fdKkh9vOzYNa
 txDZp07dPvAVr9gkYzkRXr6fUyIG5RUNJQtFNiGfot83277Y1YWiWYzJYhk9qgZ8IryX3JL3E6W
 93Y3HaBpfAMy7LUsl5r/0eaY7i1Hiq6wuUjmr+2vRRrE8uCI8UFGkeqjlwnBxAvzEL09XOfJNR0
 8XMqWss4eW4vRLGxQPmIIy+EPioc1nyt8SeHZRid+P88JB8RRqzCAS75m7fwZpDeV4LUkiKVhV6
 RkUG99jigNayGZbqtNrxCC4vU8idWJF7NPWv9uNVe2NBVwDAQH7Cg7MVniMXHAJozUXTPsA8CxY
 16UVHFa5ITwKf0ocGV9hDd+uNV4tehXy4J/KSeqyx
X-Google-Smtp-Source: AGHT+IE0faJ0bvCbjT88WZLV1nk3Sr71QsshSqen+buVnpZcVgDt4ETUiyf3r7lzcJeNZIXYqZH40A==
X-Received: by 2002:a05:6a20:a128:b0:23d:de52:a5f0 with SMTP id
 adf61e73a8af0-23dde52afe7mr4502206637.42.1754004791148; 
 Thu, 31 Jul 2025 16:33:11 -0700 (PDT)
Received: from [192.168.4.112] ([180.233.125.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bccfd8f8dsm2581563b3a.104.2025.07.31.16.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 16:33:10 -0700 (PDT)
Message-ID: <311fb2d2-b8b2-4b1d-aea6-429fe55f8217@linaro.org>
Date: Fri, 1 Aug 2025 09:33:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] semihosting/arm-compat-semi: replace target_ulong
 with uint64_t
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, philmd@linaro.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20250730220621.1142496-1-pierrick.bouvier@linaro.org>
 <20250730220621.1142496-8-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250730220621.1142496-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/31/25 08:06, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   semihosting/arm-compat-semi.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index e5a665d604b..e3b520631b3 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -123,7 +123,7 @@ GuestFD console_out_gf;
>    */
>   
>   typedef struct LayoutInfo {
> -    target_ulong rambase;
> +    uint64_t rambase;

vaddr.


> @@ -300,9 +300,9 @@ static void common_semi_seek_cb(CPUState *cs, uint64_t ret, int err)
>    * is defined by GDB's remote protocol and is not target-specific.)
>    * We put this on the guest's stack just below SP.
>    */
> -static target_ulong common_semi_flen_buf(CPUState *cs)
> +static uint64_t common_semi_flen_buf(CPUState *cs)
>   {
> -    target_ulong sp = common_semi_stack_bottom(cs);
> +    uint64_t sp = common_semi_stack_bottom(cs);
>       return sp - 64;
>   }
>   

vaddr.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

