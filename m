Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F89CAC5B9
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:02:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Msi-0000Qk-KW; Mon, 29 Sep 2025 19:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Msf-0000QE-JB
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:02:05 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Msc-0006mU-CD
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:02:04 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-782023ca359so2713335b3a.2
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759186920; x=1759791720; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hIKUG78DwsPPugwCj004d3vQis5ZKS3dyYq6AzvHlYs=;
 b=FIP5uBs5iyiRFZJJAqY1PNActmii2uZDe18oGo0IiGSAzCiDu7M7UR37GY8EZO7p01
 twob4LUKXe/pxFU8cADacbI623q71uE0LLzRscfdRjaBpaMF17lHoRyVYM9CIrfF7Mff
 sDIpfrPnQOyAfFYttAQDXph9acLdKSgQPfk/ODWpzc7Tvx3feZH/vEZLj6QTEEYUcVDb
 BRYe2LhwvQcWMaeSEXryOJNt++garP5d+ctGW06HMmI+uMpPJ0vtlkU36GwkntNQK61/
 QoVkMFKsxw38WX8K1GLyZl+1yKUAX9UhrHSoTVnbl7eBHhMv9plkiNLZDBIDGACeZkXz
 EM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759186920; x=1759791720;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hIKUG78DwsPPugwCj004d3vQis5ZKS3dyYq6AzvHlYs=;
 b=Z5KVHR5HWc5Oo/BKtqwID/6tD0VvVSMvUElYev+hwgQNTHnwEeM3RPpBMuFtuoIio5
 74Y8ncHc7VHKzfL/41d7WW3kS8ZwH/kdaZXR7r4Zx4lK21fVVKbPkRMe+/DfmsTIqJgY
 TLLivV35XNK4Ue3vx/ep/gsXidbRPs3TGWPQYMJ6XC0DhcYBlQYbfdPNu8Oha07LQbJg
 1VaxE21nTdno0erxqfAoJn1dl1psVi6eFdoijwuisN7bDmUyiVCeYhSNI8+Zj0LNBurP
 x/tdh/AArRJrM5suO/FRuj267gHo+s3NcBDUYOC3U5XBZSpIjNGRDddWGayUJve6qDGt
 k2HQ==
X-Gm-Message-State: AOJu0Yy7C9m713Zy85/BN/0pcENhTu1ErojtRmwD+/jL7OuDx1BbXZZe
 dX7NlO4xD0kOC8s8FNsQJxcRg5WJa9cY4QzImUDFaVFzMM64hBc22+nsb6UwJZMlXXg=
X-Gm-Gg: ASbGncuQ9iTKgg8zaYaaoMnZOQ/r0MCfcwqZtoINW3bjt+AV2cYa89a1gEhbgsPHjed
 m/thiMrYW8Mb2cCpgEIuBF+TixtwHsemRnvhXzEzvX4KRwqbu2rX1/UjwTxfEy8GadWdMGH4Unt
 19v9O7siLrucNfFNCb3yo8mrmkjiwVOOv3Ae/Q7L5blrccfbT5i02vMIWI3ctuEhyIoLREKmr5N
 FB6Vj4iiqlHc2ZUKrjZe6m9p6irCd8L0LtplvPCsH2SwDHtKQrVJocw3K7o5ZPnDZ05N/KqwJvi
 A4ajpx5VyIgFgQjEb+T6R/lpmWw7r6n6AeenhxUp/bqBp7JkloWeXpzlmlDDN6syvKMBP2erusA
 grkQMzqLdnCDR6z8AhKqHEFCKuQ7uRFS+ZYZHCwPr0x/74g==
X-Google-Smtp-Source: AGHT+IEre11r6B+GrO1kugHORRpSepVwnRVqs4B7j7Si5gAUc2Fru/PV4TJdhWxYDZsS5fvSpe2oRA==
X-Received: by 2002:a05:6a00:b85:b0:772:40ba:61c0 with SMTP id
 d2e1a72fcca58-780fcdfd87bmr17173669b3a.5.1759186919985; 
 Mon, 29 Sep 2025 16:01:59 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102b2865bsm12213527b3a.64.2025.09.29.16.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:01:59 -0700 (PDT)
Message-ID: <b2fb81c8-3a5f-4187-83d5-eace6fd204e6@linaro.org>
Date: Mon, 29 Sep 2025 16:01:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] target/arm: Add GPCCR fields from ARM revision L.b
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-3-richard.henderson@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


