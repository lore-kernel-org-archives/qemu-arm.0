Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86497EB28D4
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 07:27:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voGFB-0003Hr-EO; Fri, 06 Feb 2026 02:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voGF9-0003HH-Mm
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 02:27:07 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1voGF8-0008GF-1y
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 02:27:07 -0500
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-81c72659e6bso1391785b3a.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 23:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770362824; x=1770967624; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Esn80IcBye1lZWW7gqCmY3N+KkEqhxRG4dc5qwdW4Hc=;
 b=c57pygJ2X5WBs2edoLQHbJw3Co4ZxzA+UHejG30Qgh9WnZ/oDMyv1L0Qs2qqxJwtrz
 aa3PSNgu7PTtClS/PwTFx8avDximTrL1A6EnQxzvY6IwNmXhFhjh4MAlAM43fvmoDO8q
 x2QxPp97MPDbRR64K6l0JtxaZtwgqdHcIxBw+zZX+zwYCG0mbPvs2ZQJ36NyOdTFA7TN
 GjAAYGrQ9MG5iN4D1zOqpK8wTyXnkTz26VxRYasXfYww5t17/iantTpi9Q7+wHp6Wn5s
 EusHOirDvcxPa6yc16vhwNQ4zofuoODb24TR+ObQQcyMof3ExO+394sk7gBCx1dKQ7QR
 fEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770362824; x=1770967624;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Esn80IcBye1lZWW7gqCmY3N+KkEqhxRG4dc5qwdW4Hc=;
 b=OKhSaRceKYKdTBo8tb0ehhJkQEYgxxoaQum38JRuPXb4LER+LtmqkqCiZ6fybScJxg
 8bC3iRCXSBaAtuYXY9HSNR5pH4F7mWrAlHxYfP89+b5DAri/lfjE6KsQruLV2HdJACuY
 0/CpJjq9IzrbsnkBvM018fI0Lmn/9CXElWBC/N7Q8KVjZseXTbERifqhIvEIqHDngzRi
 fdh1RYM7bU9htTHx2q90fAAB6Fmz8duXrvzLDE/s4saIfx+8iUdL2K/2xaEZgQCSFvfi
 ebVS2tnLTL43QD4Bxq32KS33xoi+0VfT0qaxF8Z7h+h+GxcxTAu0yu3ZZGx2iqoMyQR0
 aIjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV51dlzL38fLvzkI9u8P0PC2Cr8oTVOnuDnALQbL4NkKZ6OD7swhV/dMc1SsRhXLheugBGqKdSsJw==@nongnu.org
X-Gm-Message-State: AOJu0YzVdQfijebA+5dOVATgwxSmCSoHtsSpgvmj3QwwrYb+YpRPVPLx
 qrEugFokneMO7NfRZEKQHZfu8EgJ9l2JV/ccY36wj01rnWOQjUCMCf/rVxB9/6/BoKE=
X-Gm-Gg: AZuq6aJ1tCfOPWnE2BvMTfAMczAjeX9qt/RysONoO4j2BYSk2UZTAkP/tye5DTYP9mP
 T+5Sd6/hkIdM/JUPZB+eAQyOVLNqfPezQW8uztrKpPvRBIphj3/+pD7UGBCOeEr18B5SHX/5el9
 +ox5Cpr6iWuBuxFqysmlThdrjpqMixWkYrw6O2BQ2u8DSMeb33HzRr2EnbXZMqLNsU+ARBghAz5
 SYwoLGFViTsp8vUzK1D0Tft4GGlqlGZaOQ/os0sP1IQMlZ8NOTOcJuWpZYBJCdwJxVT6rcdbt9A
 P0Vz+0G+Ihrf79m0aiqjSzADINKZizrFyH95Uu6TcO7/I7i5ABAJSKKijeyIi9zgjCf4N0a9L+I
 waIOVMWJaUFNqE3aYJjhF7BnVdZqeAYx4t3QQRwCxvxqxNFydeeR7OTLvOvUBkEmssj+SSeQAeK
 j2W5n6gangIsoNMkKr0Hl6Wl0p+M4iOGav5oUTPNcAYNR7+1NYjXG6mcax
X-Received: by 2002:a05:6a00:1253:b0:81f:997e:59a0 with SMTP id
 d2e1a72fcca58-8244176e218mr1649354b3a.64.1770362824013; 
 Thu, 05 Feb 2026 23:27:04 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82441882481sm1339129b3a.35.2026.02.05.23.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 23:27:03 -0800 (PST)
Message-ID: <934c333d-c081-46d0-9058-cc7eda075d1b@linaro.org>
Date: Thu, 5 Feb 2026 23:27:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] target/arm/tcg/translate.h: replace target_long
 with int64_t
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng, Richard Henderson <richard.henderson@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20260206042150.912578-1-pierrick.bouvier@linaro.org>
 <20260206042150.912578-13-pierrick.bouvier@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260206042150.912578-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x444.google.com
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

On 2/5/26 8:21 PM, Pierrick Bouvier wrote:
> target_long is used to represent a pc diff. Checked all call sites to
> make sure we were already passing signed values, so extending works as
> expected.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate-a32.h |  2 +-
>   target/arm/tcg/translate.h     | 12 ++++++------
>   target/arm/tcg/translate.c     | 18 +++++++++---------
>   3 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/target/arm/tcg/translate-a32.h b/target/arm/tcg/translate-a32.h
> index 0b1fa57965c..a8df364171b 100644
> --- a/target/arm/tcg/translate-a32.h
> +++ b/target/arm/tcg/translate-a32.h
> @@ -40,7 +40,7 @@ void write_neon_element64(TCGv_i64 src, int reg, int ele, MemOp memop);
>   TCGv_i32 add_reg_for_lit(DisasContext *s, int reg, int ofs);
>   void gen_set_cpsr(TCGv_i32 var, uint32_t mask);
>   void gen_set_condexec(DisasContext *s);
> -void gen_update_pc(DisasContext *s, target_long diff);
> +void gen_update_pc(DisasContext *s, int64_t diff);
>   void gen_lookup_tb(DisasContext *s);
>   long vfp_reg_offset(bool dp, unsigned reg);
>   long neon_full_reg_offset(unsigned reg);
> diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
> index 2c8358dd7fa..1f455e4c434 100644
> --- a/target/arm/tcg/translate.h
> +++ b/target/arm/tcg/translate.h
> @@ -27,8 +27,8 @@ typedef struct DisasLabel {
>   typedef struct DisasDelayException {
>       struct DisasDelayException *next;
>       TCGLabel *lab;
> -    target_long pc_curr;
> -    target_long pc_save;
> +    int64_t pc_curr;
> +    int64_t pc_save;

An amend mistake changed my branch, so this commit was not updated 
correctly when sending the series. It has vaddr has requested on v1.

I'll update for v3.

Regards,
Pierrick

