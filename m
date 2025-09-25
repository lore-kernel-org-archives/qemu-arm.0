Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8239CCAC5B0
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 13:29:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1m1P-0002cB-KQ; Thu, 25 Sep 2025 09:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1m12-0002NP-B6
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:28:09 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1m0n-00044S-RL
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 09:28:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-46e1bc8ffa1so10330825e9.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758806855; x=1759411655; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uIKIQS0e4SSFIehEF/z0Pjj2S5uTgnqXK7kSBhCNOSQ=;
 b=VAuYTZsgIdCMoBr/vomY3OBNVxJJCmUOx8YYWIRKg4qRi/XendOitNZbmf1iYrkYmT
 CRG/33GL9HwZdHv0HSb67pqal0kwws+N/eO90AXF+/Y3ucF3da+B6szDrBXrV4OlX9Yr
 CkJyZM4iz1OMOIUElyWkWsrba/QkBvNmTP9aXrBlLbCiA/tF/AeRbLc9I7ul0Z3qt2Ts
 REynp+O5ZCpOGARi5onmnJY9JYjbIv7dkWUxUnCbTRrWqGvC/D9OSwfv7dEmCFZnyH14
 qdUy5RuheNievvYxajfwnjKD132FoMj6Hm7vx/Yjf1MuU8yeM1bDx4+p3fujPusW1teb
 xY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758806855; x=1759411655;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uIKIQS0e4SSFIehEF/z0Pjj2S5uTgnqXK7kSBhCNOSQ=;
 b=u953ss3eQFgM8gndZiYSmFjkkauDMwcmV4gmsLdc456GfLKHZdcUTCqnmsUakH7IHD
 SrEAkVgcckKxHLAa5WbwD+VTzOq/41ATGc/3vOBeH8Tpv/MHlckEYmFaM8+sAI9kSpyR
 Tz9ev9ybaj4nM7I+DVACIiu/i4bGgJ308cDYgIjFKY9hfyoKH+pjPd8AnoOe7/09eivH
 9akSyxD5LYyY+EPgD8rLJJyhdX3UJ1i3cD8MyVMKcuxS/Ot98BajRc8TdVkCbN3TXQrp
 oKiChMEJKGvwkz/pZIGqdnEQaGH8jXVhHuKJoenSeQxGPUxy5Cmf8vrVOyi/2CZNrtUG
 9sSA==
X-Gm-Message-State: AOJu0YxfXfDE3tc5+oMSZERUScr1fJR4VTAVo5yWlSOZOWPq9geHVcEf
 JdmMn1k8n57tgJDNSa4rusKxM/jHrXubFBJQdEs+O3h+GwSEDkgtzESTUj/eLS/AIOM=
X-Gm-Gg: ASbGncswjmZYJXSZZ4vYWg8ih04hIfzXT5zP4xGZUYZEaQkdlpdEaLCgNhqFkk02pRO
 kg/2Mpm/6RmUbQXmIST70qtqxRWIpoNJ7LvE1R0DL2aUqLMLoCne9pNA8lWpr1qC/dw+vg/Ox8V
 7qv/MVAeCDuQ81m4Acf7GfsOrImu6grAKazMqdV/ZMqeiFldFteNVtvEjk18rW77Za8ZAeRnN1I
 5unaOTUEzRG0kyKVcfoJ/fR/2uqe5wySVS4UmOMEQZ3hQWBsU8aXt9TJ0pzUZmpht+VCS7ybSP0
 POHFPtIg8v2WJqrzn+nkE7PzfjJH0jAemA9TKLKemBThV2ET7L55mH+J7CXSE4NtEGNL/mywBcl
 337I//DW3z+bldlGPmNQEPwqI6g4bXNrrmrgSYYzma/u8jS6uv5rDVcknHy1umZpP5g==
X-Google-Smtp-Source: AGHT+IECzjF1Xg4U/lSxMAEMWLQ4P1KclpSXvy5SCibuYk4ylSveQYXga2Wn6rbYQQ/GpPcy8jTN4A==
X-Received: by 2002:a05:600c:3588:b0:45d:d5cb:8dee with SMTP id
 5b1f17b1804b1-46e32a1c465mr44916365e9.33.1758806854821; 
 Thu, 25 Sep 2025 06:27:34 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab4897bsm75846255e9.17.2025.09.25.06.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 06:27:34 -0700 (PDT)
Message-ID: <d8915b07-fab1-4ef0-9bbc-6fda4260b7c6@linaro.org>
Date: Thu, 25 Sep 2025 15:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/36] target/arm: Redirect VHE FOO_EL1 -> FOO_EL2
 during translation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h            |  6 ++++
>   target/arm/gdbstub.c           |  5 ++++
>   target/arm/helper.c            | 53 +---------------------------------
>   target/arm/tcg/translate-a64.c |  9 ++++++
>   4 files changed, 21 insertions(+), 52 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


