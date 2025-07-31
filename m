Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BA6C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:59:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbJK-000486-Jy; Thu, 31 Jul 2025 17:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhb8B-0007Qx-4u
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:48:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhb89-0002Ov-MX
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:48:06 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2401248e4aaso18427325ad.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753998484; x=1754603284; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kuMjHlOeZhhwC3TcSy8An1vQavgStkC69xUsoTCnTlU=;
 b=vkU0fevpdbUP7XdmIFq9MEiVmogX0zZJJmMwZJS66fugTuwQOKiGJqveiGlmYmtaLa
 GXSyDBHWvBrEEoBw/OX/sY2c18qlamvP/BG6V537D/f3NCuTZmMFW+9B7+SKOnmFLMq9
 Co9RO3hNWD407/i/3hh4UPTcX+LmTn2TyL0HV6X463xMnsVxKZJSWmUJyZ9AQVh0Nwiy
 Pl81nuWXNQuV51XzM0bfVdg/rDkKal8JAHZR0gvXP2iaAkgH8ftZBWbCvCMgA+dy92Tt
 QcwxpHuEFFQzlN0GYX92MfKmwNh1SXCn4OOTCRaBWJmMbiejSfrx+HFRwewhb7N2lLbc
 uC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753998484; x=1754603284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kuMjHlOeZhhwC3TcSy8An1vQavgStkC69xUsoTCnTlU=;
 b=KaPR5Bsjf8y4Tux2UAIFGpaOVCfc/R4K3kKk9qJT9MUOwz03VtBU0N19L5Z3RvtsKA
 8WxQ4BkP/K0A3uA1QPWO3jYk+7BUOC+G7+LYJA+u+bJ/55KtzYvoGvElGDORrPK5rcs4
 LxFAiT1iz+Q8WofgoKKGnfTta3vk/Ae6Jh1jEEZgMZHHQR3HdOFJvUcqMNAiQSDPGHem
 zoylJHZDk9xm3JQ92Fi+yOdpmFjApDpg7xYdsZrqJd+WxNo8VeMKj4RtjKtfqduMwNVA
 SVksr4NlTQTPK+exlXUNfk/fHVet1j+jvXykZykdxmvG4Cnj7yHtMIq7XkRftCTo6lFD
 esew==
X-Gm-Message-State: AOJu0YwYvJwFiSxGLpDm5bfK2uZjv0f3B+u8Y5eumtjR0XFKWMJoU0Gw
 ahaC2TnoIqPbZ23QZ4UlJ72g8bQP8vqKXQmmaJ3gICPYgGteJxUhH4c8D3vskvob7s8=
X-Gm-Gg: ASbGncsb06LiFXrUqZktZeXXgP3pJtVUvd3iMK3G5tgbwGB25gdeENTdRTyaRZPyJ+h
 IJunF0Fj2Q4WZWjYchwgEJgWXleUF+ZDvFwEv5oO0wF9flDM4SG+u4pxwpk1t4YFKfc9hoX40Ll
 6EwK3Jk4TO8a48W33R8l3VKIiE4FhyDBvpgCQTZbfpt2B9RoKez6CG9vBPkRSHQry6lQo4WAq3u
 PJk8fIFmcJBSw5hZg82ruOBvv7lmZkDJDxxgBfZQGKjoPWt2oPTC9RZWdcOMvF7knQ1lVwP5wdA
 Jj3GHxtCbXyWXlglAljpShYzboNyNL8OOK8P4nNbH8ZxMROQumuBPOS9ptWLlNlLgrfWYoqc7RO
 isTJvw8PYk0T8lod3hH1W6Rn7fTaQZ86S2Op8bvu+I2dsbA==
X-Google-Smtp-Source: AGHT+IGdp9KgK1ThxLW+NO7LDynj2Vms+mJoTZOz8DTnw5jrpypz4AhYuOWf9p/dCwjgMXevhkaDsg==
X-Received: by 2002:a17:902:ef0f:b0:240:3e98:8edf with SMTP id
 d9443c01a7336-24096ae6953mr124335525ad.31.1753998484261; 
 Thu, 31 Jul 2025 14:48:04 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976cfdsm26123645ad.101.2025.07.31.14.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:48:03 -0700 (PDT)
Message-ID: <957f9869-4638-4e29-ad14-9940ee41f519@linaro.org>
Date: Thu, 31 Jul 2025 14:48:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 67/82] target/arm: Load gcs record for RET with PAuth
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-68-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-68-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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
>   target/arm/tcg/translate-a64.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


