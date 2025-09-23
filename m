Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BED3CAC5A7
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 10:44:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v10Vo-0006nF-VW; Tue, 23 Sep 2025 06:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10Vl-0006ll-Le
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:44:42 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v10Vb-0006Tx-3s
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 06:44:41 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-467f6fd4e82so15061625e9.2
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 03:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758624266; x=1759229066; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p0We0Rhabq8Wz/Cu7h2GK7NceKf1CQ0BwJAJBr3tJyw=;
 b=xEsbz8dHyixUsG1ZITLS7vaX4j3Nxy/ypEydyNYpHf2td3VbD+R81ZPAiu2shgcxoP
 gZSrAhYjf1TtBtKWjDJXWkO1qzNsrFjjsJIcnE+EnMf4iRNS4i90V3zXJgTY/EhoPJW+
 duGuVO60lrbcbW+ztZxOmeGbSJ5+Cu4RBCwoUEO5KESQFeN70DS1bLzXIK8koHpVFfG5
 OftPoFSuTVcazPobpRIUJM7+aDgaq4GS8nXseC1+mtA7i3q+0w9a7Jl5qalG0d92UcvE
 wSQ8Rtd3e27NGcngjc5tAXv0/rlA0VheMEh3ZJSGtDGpsPDQyFc9FLGI3YbmW59+s9VF
 aAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758624266; x=1759229066;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p0We0Rhabq8Wz/Cu7h2GK7NceKf1CQ0BwJAJBr3tJyw=;
 b=YOmUc4Whwl0V+ZavTDjAKrYQgo+ZF24W3Q7wSBtO8IS1j/me1mOKRdOIysz6aMXLlD
 xDj47LT2gXz4r+mGZlsLXwk66LRsb15xRHkohZhvFpMRWkvVkGDQhhLd85yMHJYH8PbZ
 G8uYwF6b+pbfO+YxVRgwAIjO3/ohcPXJFbM+CWHrFxDKvGw5pF2cmyEcuAyRyTSadOTU
 iGTvWDXacLXAnVOqFaPY4JTSsXDkhLQfYHuopDLuZEIzma5Bab+O7yBx+qVeuKqEEES9
 mpe/jlJpr5SOBXq9kzqYZE8CHbkXp218ZJrhY5eALY8NYGHGXhKg2noAey8DB9RcANQL
 OUEQ==
X-Gm-Message-State: AOJu0Yz3V4D3NsLa1ePUTO+jk+iVYXNR1/Q5E0u5R9SBs4Oa14scclLm
 L+FRiVqLSZB0QNN0cnoMlXeWNx0srVdn2MyQ3ZjkaWl0z4gp6nOda2hBaUJWUX0CSn0=
X-Gm-Gg: ASbGncumktCIocL0Ld8qARvoivUMWzvxe1mnf2ds+NnAkVuD1caFJyBPSfrU+wggNre
 3zbrv8iGtSvb59K4PTk/LpsnkmV1oIsoQ9dOR297JDvh16HgrRlaAoR0fI2/suYk18jJ7tnkSUU
 stPjFQUfZGwlGAYms48a7hidEEIpeyZkPWQn1rSmS8At52jqvS4cNm0UFuqdeeasEFsZRKERp/V
 mFOKKPlMb7qq3gKnyvhBZMS/H3rhEOFzwIyro36wa0lo3FOAT6rwIOPG07oOzj71GKJXcTRIuvR
 S+xPrndRWmfj0w0TA3vhB2U/FdAqqu/pPkQ5uk7kuDST15nqFiGjdtKD6tk0nhIJqV9Q9qXKaIM
 go3L3j6XhYJZ2Qx/bLQtNSnHDZt8v+svbO9XiIDPF5V9TizlxpNVVIS/j5cO5rwbX7TjN3L8leK
 fh
X-Google-Smtp-Source: AGHT+IGtOwW1fTFzJbp/4xMYYtvPuSFLmXkqMQ6mvv8+4uusPbIWc5JutUyvTsUXZLkyq6KKULq2PQ==
X-Received: by 2002:a05:600c:4ba5:b0:46c:fc4b:89bb with SMTP id
 5b1f17b1804b1-46e1dacaa24mr13147275e9.29.1758624266069; 
 Tue, 23 Sep 2025 03:44:26 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee07411f4dsm23285070f8f.26.2025.09.23.03.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 03:44:25 -0700 (PDT)
Message-ID: <c577cfd6-cbcd-4ef3-b6c9-478d09db8be0@linaro.org>
Date: Tue, 23 Sep 2025 12:44:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/36] target/arm: Drop
 define_one_arm_cp_reg_with_opaque
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-13-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
> The last use of this interface was removed in 603bc048a27f
> ("hw/arm: Remove pxa2xx_pic").  As the comment in gicv3
> stated, keeping pointer references to cpregs has SMP issues,
> so avoid future temptation by removing the interface.
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h       | 32 ++++++++------------------------
>   hw/intc/arm_gicv3_cpuif.c | 10 +---------
>   target/arm/helper.c       | 29 +++++++++++------------------
>   3 files changed, 20 insertions(+), 51 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


