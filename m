Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30023CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:34:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWxWZ-0000SY-0y; Tue, 09 Jun 2026 10:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wWxWX-0000S8-4r
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:33:49 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wWxWU-0006Um-Dq
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:33:48 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c8584e80d59so2210364a12.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781015624; x=1781620424; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b38ofrrBZbh3N7PockUt/wJ+PHtvxjxr+dRL1CGBkRM=;
 b=X5JA+FP4Nj/TbjKYvSS+Iy6ABSUyDTobbh/PSBUp5+JUD1eeLuJiJtVsC/TtrdyEhc
 VVt0OnSDKjUauYNbugXNnncSAgtIiM3EDjzw8TKcvOeY/w3KsUjYi2LVtb3ITRpf3IfA
 uTngpSSi0eAkKQiHzffypqdzIT9R5FEGWIC2qtJ1CpplcJi9wHKv5UpJOYYqE9vQf28e
 sU3EvOm3de9LUxW8DraFjmywstoue6sCHkhhJnf8x+BtxhbFqv3iKiEdjm00Ws9+ZPUg
 W7wQTlC3gt4yShYq8hUOLpjzM+Nu4Tr33/whUx1tCjtUaOISYCRP+deXfkSg8VB3wJRC
 j3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781015624; x=1781620424;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b38ofrrBZbh3N7PockUt/wJ+PHtvxjxr+dRL1CGBkRM=;
 b=o14XWT3yG8opC9WvU/x8E8zbwiDEkUjddR165VJ03zF3Mh8oSdlwVRvKpLo2VI1+e6
 WmP8HS9ibhY9qTO90CvdPlrgTsR1Ktgu+92e+FMVqeGFDWKDVggTa8Rge7o+InUIrHCh
 svYxGinr2z9PjLWh8YZBrVAGR/kMSDIt9MRcibDuse+rcw/G0ifKbZ1j4xMSoTqCjFbv
 XwSEBBQy3fNCq06rrU4SXS4h3wOvWBD1PVpfbcx8JzEQVQD0YCeVrHoSNo6fG7U8zMPf
 1v6Ljv80olaTYfXpxBdXr+Six3Sl0ft4PihQQ/NVEgnSzGjkdCAD+AWkF0o2F5l3C7kr
 pRRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9wKLFAEeAl33YYQQTOSPIx5lADwoc7Fvpqc0g06qZ9mwTO5IkdAjfS85jTqBt3EDKcjPVd6/RONQ==@nongnu.org
X-Gm-Message-State: AOJu0YxloyEn9lW+EwaTtuaPHPBf9BEmk9/LobKejyabAMSAuH7fZXRg
 Lj4kogF7r6ZE0hKLO9HQV1lT+QFrc9SjN7+V1JDs0bJ9dtOqJFh+L6qXsMq4p9QvsTs=
X-Gm-Gg: Acq92OEIHx0r7X4trOUbK/4DJpjhQoWKLOfRveE1dzflDve2tLNpI9YxodvD0/ZGyiu
 FzBrjjgLYQ6BfQOkfHq1XDbcMNnmh8T0O8tc3oXtiJnLlumWfl+NmO2hxCGqUroo6YmS5Z/5HPQ
 u3UVUGXA1GjHF62Nd9WDqQQjQdItbRBkO7KWNptQOjniAUFatAAOe+X8NU5UrVDprXp5r65o5hn
 Rxl4C7EqkgdiFKKVSBzyBqlgj5XZnQridM9eKZGdS8EbEJIXq5jemtQIDlx06aibXpu2sVdqUXO
 mpL1yieyFWeW/nFNHJMNLI5OkOwOUiD59uiaONQCRRPpceoSmbnmejKECUM77vQ4c65hUTPUebZ
 BIYya1IKMcq7Aj+/AaldP3zpxqlL9PYnrrBaau2QZQn3kSMbuE7s7dYHgNAoeWX9pYI3MpKzS1r
 PhbgTi7UESRkWwTP8JZzB/kiDwIg6gIxvrA4zkyJT44mRH3Ms=
X-Received: by 2002:a05:6a20:db09:b0:3b1:80c7:5f8c with SMTP id
 adf61e73a8af0-3b4ccf3c4b2mr25422052637.28.1781015624301; 
 Tue, 09 Jun 2026 07:33:44 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c85df032df5sm18265942a12.6.2026.06.09.07.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 07:33:43 -0700 (PDT)
Message-ID: <9ef94406-6544-4262-866c-c84d6ced6e3b@linaro.org>
Date: Tue, 9 Jun 2026 07:33:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/45] target/arm: Use FloatParts64 in f16_dotadd
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-4-richard.henderson@linaro.org>
 <CAFEAcA9D3x7hD=RmhddTmuHWvd+cpp027A18k+OQY3sPiQrW_g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9D3x7hD=RmhddTmuHWvd+cpp027A18k+OQY3sPiQrW_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

On 6/9/26 03:51, Peter Maydell wrote:
> On Wed, 3 Jun 2026 at 04:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Use softfloat-parts.h so that we can more naturally
>> perform the required operations witha single rounding step.
>> This happens to also simplify the NaN detection step.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Message-Id: <20260517002550.321291-11-richard.henderson@linaro.org>
>> ---
>>   target/arm/tcg/sme_helper.c | 96 ++++++++++++++++---------------------
>>   1 file changed, 40 insertions(+), 56 deletions(-)
> 
> 
> 
>> @@ -1240,48 +1238,49 @@ static float32 f16_dotadd(float32 sum, uint32_t e1, uint32_t e2,
>>       float16 h2c = e2 >> 16;
>>       float32 t32;
>>
>> +    FloatParts64 p1r = float16_unpack_canonical(h1r, s_f16);
>> +    FloatParts64 p1c = float16_unpack_canonical(h1c, s_f16);
>> +    FloatParts64 p2r = float16_unpack_canonical(h2r, s_f16);
>> +    FloatParts64 p2c = float16_unpack_canonical(h2c, s_f16);
>> +
>> +    int all_mask = (float_cmask(p1r.cls) | float_cmask(p1c.cls) |
>> +                    float_cmask(p1r.cls) | float_cmask(p1c.cls));
> 
> This looks like a cut-and-paste error : we don't take account
> of p2r.cls and p2c.cls, so if those inputs are NaNs we won't
> handle them correctly. This should fix it:
> 
> --- a/target/arm/tcg/sme_helper.c
> +++ b/target/arm/tcg/sme_helper.c
> @@ -1244,7 +1244,7 @@ static float32 f16_dotadd(float32 sum, uint32_t
> e1, uint32_t e2,
>       FloatParts64 p2c = float16_unpack_canonical(h2c, s_f16);
> 
>       int all_mask = (float_cmask(p1r.cls) | float_cmask(p1c.cls) |
> -                    float_cmask(p1r.cls) | float_cmask(p1c.cls));
> +                    float_cmask(p2r.cls) | float_cmask(p2c.cls));
> 
>       /* C.f. FPProcessNaNs4 */
>       if (unlikely(all_mask & float_cmask_anynan)) {

Gah.  Same error in patch 1.

r~

