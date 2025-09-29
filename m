Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64881CAC5B9
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:04:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Muj-000265-1v; Mon, 29 Sep 2025 19:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Muh-00024q-Rc
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:04:11 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Muf-0007Ob-8y
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:04:11 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-782023ca359so2715087b3a.2
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759187047; x=1759791847; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I3Ci0n5vYi9+06itrB0ZpX/zM3GVQ6A+MGoQyG7UbBA=;
 b=y430UIpnVi/SG7vhGjqOE4TMosFNzFW1SFX6qNrrcWomlZtk8wN/OacDYQV3x2MPAH
 dZ1jg78zU0VL5ZiBrSAMMh+xYTYC+CZWxinZ3mCMPO7ktLLobxTiH8WvafJm65FzKzjr
 QLNfZeygkWZnLBuajKaOBU6gEWW9PvULQiLGcKINwDye3fSJlO3bauVMWty7hV5EmB4C
 F9RrMCHbcoArpdsf/yJ0PWguU8AOzRVN1IDDnNS0A2tsmorqMSSEGKdhFq061Tr4xXGB
 gohgQRqIQgolV5S0jdLAe+aYBIrhfrPPJo2DSzMuZd2Bz45AfBkrwkUSbYcNrveSxcAd
 nPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759187047; x=1759791847;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3Ci0n5vYi9+06itrB0ZpX/zM3GVQ6A+MGoQyG7UbBA=;
 b=h3AC5OgU3Ax1Gq67cCisw3Aez/vlgjzRqxiYRmlL29eXwM0DM386u8P/olwLeSEEHh
 WMdgUTOHZDj6qNbrxeaOARBbLD1cbjHOTZcj2rF3Utd27BF0Z3JzXBJC8449sIC5D8ue
 Fp/1B0ARGrhgydeoO2dgJTkZXslpO3NeM0iVnqBPvuDmOLrukh257o7mkJGNhp1TEyG2
 pK6kud01NFWbLk1GXZkZILJ6ae7nToWpb3rLkNCecc0Gq+jMq16j9rDPTImgmqfPu54y
 bbqm+Ilc+UWocgToANGXBn/ghp4sC8skFtJR7LrC65KUjDvAXDiZaJFfBvVjGZWxq3oJ
 3VWA==
X-Gm-Message-State: AOJu0Yz5MrmGoCI96FN+jr/yT2YtlhxY5iYpN1cxJe1SdTq2uhp8b7SS
 hZv2/NkVaQ9anmTHpZij89qzlwMsx9YiA/FDGQ0ifCBo56F7HkiMMcd5PYpdEySAXOs=
X-Gm-Gg: ASbGnctxPEc9vnFYLRDIgW8CEMip8lxNywIy/YH0Q6mL8tzKNrZyWJ+/ROFBhjoEpdH
 CI8tv2YIVEnlHc1UfgA2QVU7Ih7sz2Zlnc1QJOECbfxEgytHlVhPLDxW2uT4oL3MfG2WgEa67Cg
 7DbkuvTXXLDFlME8hELiC7OYXv6h1QiIaa9pydO/KR0FODymah6H0FLHEEo/wAuSf3YEef1Iwp8
 3EYd1ehsog536Uxfc42Q8rv/iKI49Pb0LtBU9yC9nNhbDq6+pQHutrwqUke6df/H+Qi3fQEhTlm
 d/Y7p/6FNMI6zG/cUKq8T7Z4XxgBISA0QqeLCgdp8l+iFd9VeoGqcaAr2HM/ynzXqWTNuQ8GCpn
 EOn1CNvgt/3Fdf/X8oKyTGuca8Q4tGfjsqlo=
X-Google-Smtp-Source: AGHT+IGz2nSbJn9+Agz4L1eOLhLathru/fsjiLcTlKYRzXbYKEmeHNzDzKkiKR62bSeFBNF0pLYcKA==
X-Received: by 2002:a05:6a00:18a7:b0:781:2069:1eea with SMTP id
 d2e1a72fcca58-7812069208emr14441051b3a.24.1759187046938; 
 Mon, 29 Sep 2025 16:04:06 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102c06fe8sm12002567b3a.77.2025.09.29.16.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:04:05 -0700 (PDT)
Message-ID: <c7365afc-ef3c-4783-aa13-f0afdd05748b@linaro.org>
Date: Mon, 29 Sep 2025 16:04:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] target/arm: Implement GPT_NonSecureOnly
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-7-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


