Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEA9FF8875
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:57:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIA67-0007Iz-BF; Wed, 29 Apr 2026 14:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wIA62-0007Hp-RX
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:57:20 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wIA60-0006EL-K1
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:57:17 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso942855e9.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777489035; x=1778093835; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WyukkISRT3EqtuMfJc7VrSUgJJ1UgN4hLSWqM/j8BFw=;
 b=xrCdSYv21ZsiyGy7NOxOwwO/BE31nn+MbFlz3EZ6CNuSOX+vWv1RhoGhAMKO4RVavd
 IhtCLHTLKJdCtBoUCiKeIeldmsb4Dx16mXOrVaK1UMN3UWEymsJJNaW1A3HMKBsmHMEO
 jz1nrWtwBGhgIEywhUTtPT8LW81XNDlMMrgeyP7rKCTMWjNgDciNzTJI8bP9SkP/xPDT
 /nQHj57+yR07XFySyTWDtB2b+2Lm7eWRFSkJm38abEQlAVg4ZZc//dYi0RtP0W+URd+T
 vsCtYeVLrJJJAqbTqR7hW54VjjcMLIhpzwEEjBtS68bjDSJT9y1indFWIpdsn5UCXBEK
 j6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777489035; x=1778093835;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WyukkISRT3EqtuMfJc7VrSUgJJ1UgN4hLSWqM/j8BFw=;
 b=cDWipNoiKWRBoqThUws7hhnDXLk0TZx1zsLirQGWUUo/r3GiqOjK0Xv71ELUEe57Sd
 16Dk37KVoATIAZoZ7gZjokj6DRk9pKRL9WtzjdI4L/zzDIbDz+tdr+PgzSF1g8Vw/bKu
 NHW3mu5owOOe9Haw9Z7aiDq6rtKg3Z8uFN5qrWQijBez3n7VTJPFI7rLbW9NH4lK1uD7
 hGO2OTdERy4V7f+ZEACaEIoKFjhfCQ03FhN2SGM1EDCySVa16V4egLgWrCTPmUhYXDDc
 JCpNF00WC1dI0HTCcvpYT7Mbs8o2yqcqj2q2/EqxaVOifnWEoZh/oxuK+PNuTVjueb25
 c4/Q==
X-Gm-Message-State: AOJu0YyRgnNHaW7hzZqEWblbtor/EbchvzHgg6p0nx3ISj/+MRZmDZge
 HTO/Gs5EJik+CGQbzDOM2QVTM7QHId+r67wKkBbDGiJHBoFl6mqA1LEc1i5JotHYVNoVW8R0VbV
 xzAKFEPc=
X-Gm-Gg: AeBDies+9VFKTwu80PGPBhPwmTx3Sj3KycUGs8j6cDLqBkeA1/51B7EZywiPIB8Uv4T
 VDz7MDwNv6z9UFgxx6q2C7i4Ydqh09alGj/11445UAqlYLzhQV/JqpIDWU8x6I1TAC+SRu+h3qA
 EwbUMnhdBTwhcLgoAnTjsA9ghpPI0dEbXhmNZX3t4iPrXRdwr0O82YYIqqTcf6GMfAJ6hWh7+wJ
 LrP5Y5LAUPk7FNuraosF/W0zb0VvF4/VsiHWSJeI7qvgRbN3IlWS6x0gFeoAQp0Bq9iupDjNPvJ
 zTqLeyJUAJOzZIzxNfeItK1Q1P2fhUhw8iCYN1W95ySLjn8SZSpW2afv5+M1bRK0bberlcbr5Sn
 hQERd6uLZBowQpPXgPuylrovISTuRueEtlrVr0GXNoiKxOAMGCdUn+uJ0QL3FfYcbWkTEg9N01w
 pVJanvtEOZcyJn4E22MsPmsDhapzp5u8o3r9CP3ziHcA/FPExRdtJi3oHxIf+BfISpABU8LqvE9
 efP
X-Received: by 2002:a05:600c:3516:b0:48a:65a5:750f with SMTP id
 5b1f17b1804b1-48a7b542187mr88263515e9.21.1777489034878; 
 Wed, 29 Apr 2026 11:57:14 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a82307f28sm14478045e9.13.2026.04.29.11.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:57:13 -0700 (PDT)
Message-ID: <3454f178-c529-4da2-b290-3567dbb43f57@linaro.org>
Date: Wed, 29 Apr 2026 20:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 47/84] fpu: Change parts_float_to_float_narrow to
 parts128_to_parts64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-48-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-48-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Rename and return FloatParts64 structure.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

