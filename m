Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9D010AB82F
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Mar 2026 23:30:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5u9E-0006p8-EM; Thu, 26 Mar 2026 19:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5u9B-0006oe-1D
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 19:29:53 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w5u99-0003OR-Dq
 for qemu-arm@nongnu.org; Thu, 26 Mar 2026 19:29:52 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82c70e4654eso669645b3a.2
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2026 16:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774567790; x=1775172590; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WMdS+XsZ4x1Py4qRKNMadA0JNnKqQmrWtEOWqurclb8=;
 b=F6OwY/MqE5LVtd190O/fZD+8V94BFDhyvaSpEfUTJiuL6+x8BLHtY2N0p/9yVYizj2
 9nYiyrzDIX6QhliIUJVYdKVKknUCEdW0PS0NBQmEIcHz+cPXFjHUNGxBN3GDMhKonXR7
 CbvvL9I6hB0ACNp1Q8qWkesh23Uv2DBAvxE6EolHmIlGepX9E/1oOs9I97P5GDQjfaML
 eNBotMINTAn/j4j/bNehD2N1E/u7JMhn3PYOfiRSZuciITvwg3MsCS6sWO7W0rqQdGaN
 9GYY1w0iuYHGoBEwypBmJ9N3/vsmkXKcumGwgzvJvURXqAA8bNzzyddIJWAYqZNZ+wFi
 XQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774567790; x=1775172590;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WMdS+XsZ4x1Py4qRKNMadA0JNnKqQmrWtEOWqurclb8=;
 b=n5pKIxB0TbwDg0nk5vuslzR/jC6wNL7L8HM8us5HVymXIbG4TzlNwozSut/kGOSA40
 QFAs/PzNV7XBMrp4NXt0Mx6Hx1FOPaZF7g79jZpPj+kFpXo1zhwwhdsozjNyVdjtNiD8
 8GjoTtLv/diubDJDzo4MzBek0GsJYhS4sfIS1TWPobx9W5CH7hKo8o/iAk+qEkrjQQIw
 HjAvPBdo+wQFXsHjfl1b9YhysESvJF3i/cIwWeodgA9q2ScPXNtHIddThjkOCU0ZdQn8
 G929Dvdw4BiwsOmQ/xZM0Bp0zXXRjUfngkOunIlB9JYPvh0Ea313lk0VZcY5pNCiQENx
 HENg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVicBOYXJPLE+odrYeZVgRbnd2Ip088jhDvH/Meme8xkTa+vPOkNIaol6a9iYvoC1TNQ8SK38GDAQ==@nongnu.org
X-Gm-Message-State: AOJu0YwYOyUJ4psFz1V/jiC2xlnDldCrqDkegd5Lg47rglCcQaHoz25O
 Kjb/bX3PagCFUBAHx73ZWLc2ooRfDhrmJXi1m3USFEcwwDFakJBSDcR6zyBKB0FRjik=
X-Gm-Gg: ATEYQzy59XQL3m38Klg1w8+eCQqnXpnIdX2RKh99cTnIxJ3SVsWCjtRiGvpRTfBGhZs
 YQs6qyVQjqrs6Dt9Y0UeSGv5wvX1cP6YG8amEJwszkUFo9EX/hZXsdhTpJEreQXA31kc4munPqG
 0DF4auKl+FV807qZlpZmQQyv9UZHfz7kDiPgmfMcdmoX/CKp1HPF9QUNcvguLHsP+z2QQ8Xx3jA
 +A1zLtyv5O35XO+0UuTcgDOSok3AoTNFzbCRwzI0wDXYY47HvLrWbu8UCNNFhzbqrsNnecJnVSc
 B2scP3dlnAMrLpEAIsm3znEeXkzDRgkEAh32WittTg26SH/um3yg1wq6VaerEkmqD1oje05GXa+
 c18CAoxHLcOeMHyrVlxFzjYkPmXLvEN1a0x1PnrxG25XkmVrXHktgAORjZ9aBRYUrf8p6xWDpq3
 qjlvwvFPC8wZW87rhzfzeqUox7mnWwjnc9MY7vB0ea6Q==
X-Received: by 2002:a05:6a20:72a3:b0:398:7d3e:95d7 with SMTP id
 adf61e73a8af0-39c8782526dmr486679637.22.1774567789734; 
 Thu, 26 Mar 2026 16:29:49 -0700 (PDT)
Received: from [172.16.11.156] ([103.100.225.140])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76737f28fasm3157092a12.7.2026.03.26.16.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 16:29:49 -0700 (PDT)
Message-ID: <c39dac79-74e8-4163-b1b5-d7b113a05794@linaro.org>
Date: Fri, 27 Mar 2026 09:29:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] target/arm: Flush TLB on MECID write
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20260319022335.22523-1-gustavo.romero@linaro.org>
 <20260319022335.22523-2-gustavo.romero@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260319022335.22523-2-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

On 3/19/26 12:23, Gustavo Romero wrote:
> Flush TLB on write to any MECID register. This allow us to take the slow
> path and check if the MECID is the correct.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   target/arm/helper.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6bfab90981..ec25ec8444 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5125,6 +5125,8 @@ static CPAccessResult mecid_access(CPUARMState *env,
>   static void mecid_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                           uint64_t value)
>   {
> +    tlb_flush(CPU(env_archcpu(env)));
> +
>       value = extract64(value, 0, MECID_WIDTH);
>       raw_write(env, ri, value);
>   }

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

