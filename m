Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4041CAC5A7
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 10:41:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v10SP-0003Uu-Ot; Tue, 23 Sep 2025 06:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10SG-0003BH-6p
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:41:07 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10S0-0005x1-WB
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:40:54 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45dd5e24d16so52027715e9.3
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758624043; x=1759228843; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f/aisKST/8hDjWdiusrDcc2rSSf4U8wiExwPe1CZZmc=;
 b=z68V6gyCbCCKcLy3I3wRKxyVNl0GxP6r6ivDgJo0AZQ8MZchbhCmp3PGm8BZjVCGYq
 NNauhtRn8KJCJqhjNlDFX+acgNlu61y7/nVANrgD4kkLjiILYveu4JigRZ+CrQdimGUm
 Q+fXH0eBXEGLuKJCtvzhxTrjPNhBPIM6ei1f8H9Mb+/Zr/YxyaN4elboe+L/zsq57Dsw
 dwppU0QhzQCqFpOYWwhfs5XaeKv3bG/SH9+m9BLeyk4nZwYs/N7aaDFJ0kGi0hG2IERy
 SIT5++8h9LNx/7EZ8v4dUF88x3lIkOVZXDJp7C9mTGQcwHWxdlGXCcOiQJQgaUY9ypHH
 2usA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758624043; x=1759228843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f/aisKST/8hDjWdiusrDcc2rSSf4U8wiExwPe1CZZmc=;
 b=oXpCn6FGRhZrEPVrllL+WlgPtoRgbBaXeLw+s2sTNzv4GAP7t//X0+FLEVzDs5zf5O
 Lsxu4vKcpByRhjWhkaEjuQMvkhezbjTjvWhoIQx6vkK1QwBR3v4pzALv4HnrnFQsrouv
 pQyRUxaGxNx1uLLSXogDRS5s6IB1OBxuSHX/V24doUSU3bPqEGurpHpjTou8w39IWBwM
 ul3yvPgS84a95QqNifDgLvPItSS8GYUGgeEiALfVVMqjN/plkJQ+QVG4qjzBAwDLqWVt
 I+2OEnPIKq/BpY50eBNyyRjzkc/ysSPf7QysYFpqZIsnN5bD9aT8bqYfyHiNv6DIO/lT
 G4hA==
X-Gm-Message-State: AOJu0YwKr0g3hp3DCXQ/p4NZsd10C2mmdzeU5uMz34Q0o/RyfzzjtpIE
 ZsiTY6vM+dB3b9JfQuKsEZdgc+qFxYtZRNf/wrFzowm/QGorFXJSM3IcdF1eckYAr1c=
X-Gm-Gg: ASbGncvGcdIcgtwWmQpkF+j0i+0BIKfoi+pFwnmKNijyn1WVhujJociXMzTysJ2auf/
 zmPCG/YS2P9ldCnGY2AQQAIabr6MIpRuH9rKP7IY38ZQHxtk44mD4TNKCqmviJouDrELdjKqmZL
 c6PEhNwcxcKS5/7yfgfZ1iMDWQmwlh7ZcaV9zwxPw6z5rZpz2K+yUwdQEmt3sgddr/JM/82nD3n
 zHf55XipumPpr3xioIknHCFWZK0XCL121OTU1ty7kEBErrbKxcjpH9Vd1sKeMUHVBZ+39FAa3bU
 dkLxu5B5eoauiPozuge8HgNKkBJ4u/Glxpfxs9m/CAp/68X0Mi1/04kN8xnq/cjmXxOaptPen4j
 TyF8PeHyqHxV1/zPCTRTWs+WQPyIIEl3fHt8xYZLoTsg5FDE8HZ5CYhrRG7KJjhcFmg==
X-Google-Smtp-Source: AGHT+IGY17/Cn39taWKEXze0mrmMEzL6hIV+ywAro4a4cKtkY4quCkvY7GaM2wdBiwRzJoDDCuReJA==
X-Received: by 2002:a05:600c:4593:b0:45d:f7dc:f71 with SMTP id
 5b1f17b1804b1-46e1dadc05bmr19888445e9.25.1758624043104; 
 Tue, 23 Sep 2025 03:40:43 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613d14d564sm314403565e9.14.2025.09.23.03.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 03:40:42 -0700 (PDT)
Message-ID: <9645a3d3-fa83-4953-8b24-588a84a58381@linaro.org>
Date: Tue, 23 Sep 2025 12:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/36] target/arm: Introduce KVMID_AA64_SYS_REG64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-2-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 16/9/25 16:22, Richard Henderson wrote:
> Allow us to create kvm ids directly, rather than going
> through ENCODE_AA64_CP_REG + cpreg_to_kvm_id.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm-consts.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


