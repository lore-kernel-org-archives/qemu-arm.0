Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718DBCAC5B9
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:04:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3MvC-0002li-I5; Mon, 29 Sep 2025 19:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3MvB-0002kh-9q
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:04:41 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mv4-0007RP-UF
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:04:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-781ea2cee3fso2179899b3a.0
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759187072; x=1759791872; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5mn9oMp4dsFFeD6V5MkleY94XvH1BdrGy0+HCw1Vx/Q=;
 b=hnMraOyVeunbLvekuV7SEl3LG7X1IRA1w8/go63F20+x58rFBDqE3HNSbO1IwRbAQ4
 cH773a0T6U+Vxkeh0mHtR8Tze66cqG14SNRnEXejplt31P2z1yj+VOu1xqvhxvLByMu+
 nBWJ7Isg4jrzHgaeMCjQLh7p5LzT/3GCZxp9E+dqcxaV3g5VyWE0Zt0DyQ6NnLv9d9Si
 k8lzufTxOvN0wLb0e89NkQz8F0XjTB/DpUGQ5AnaFUXXQAHoXYx8kA+vef0WVgld/8JP
 6H3ZkfIwBMPPdtKCHdHWI0zfBEW9qgSGoHueQ5vuX9i4Ie6WaPe3gkKYJw4CCPVziS3m
 aYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759187072; x=1759791872;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5mn9oMp4dsFFeD6V5MkleY94XvH1BdrGy0+HCw1Vx/Q=;
 b=iI+lLHi6IuWfE7DUtDGeGQuapYGPAPizeVil0cy+6XkSX1/Q7qGaYcO2jHVTySJKec
 rVAUAULSnSf+JiKRhRUcS4pxJ+MuNZQYjA2mcQAJDWvNDHYRrBbaAvWkZbIyKAPTLhOV
 5B+CEixPO8y0er2Y2s93QiPSM0dybytbhSqztyVCdpH+PtGN3qFuZBEaUsGnQBJAMQ4q
 eLNsZ0uNYnYFPwdspW8SfrMwA6VhZ5s5ArMRYP3HjqHIscEzL1nZgq3aDUouAnhAbp7Y
 +Qtqoe08yHnThLjMqxliZ+M7L84pLeSayj6za3eQabV4DiJlib9drKHe7U+LgOPnAv11
 iLrQ==
X-Gm-Message-State: AOJu0YwpHpDXPRtRS0E2ir51CIZal691kR3LHbKM/bPdLA5MWdh3Epkr
 gc1Bt7+Ui0SERlmw7vSrrXYdpJwK5xWDPfBIY13nbp08tJqhjvlpmewB3L6N6tBarmw=
X-Gm-Gg: ASbGncugF+d3PseFQKzCThUc3hLsAKDHmU3nzPicVHe6x056OG15Q1vbjZqPf3z8h4s
 KnU1XPn2Uv3osZPimb+TsJnbL95tyFgYwCSsZaevsoTeM+KiZ+rqMREVpdheaIf0lybsMDg33me
 vBhdaOTGcahr05gPCgBK0ssIUudzKP0NeGScFzKiE6ZQunaFEaC9sNPC/N15t+j+IpIDVxPNFOX
 YkPlGdAYTF1+Tbhq4Y0AdCASmkMuGqBu8ssXRE9JjqXeXI3Mp4ItU4N146pQdfOlps5JM+sxYZb
 efy6mWAHKzexJyYml2E4DCqa8KSts1lK0xo6j41Etkotd5mxowlqmv0HM+tCaOnxtGGPpXApEy+
 fLki4CUB5LRzbgH7r9FzbFWJnpZcWH5/jRzt7IfSp2AW9Qg==
X-Google-Smtp-Source: AGHT+IE1VcCtd380djgqRJEkWTLvFt0vVOwLQ+fJ3m8CzjUShilwSJqxxq+34Sku5f121SoAxsMlKw==
X-Received: by 2002:a05:6a20:e212:b0:2bb:b5b0:b3a with SMTP id
 adf61e73a8af0-2e7a83b97f1mr22500048637.0.1759187072051; 
 Mon, 29 Sep 2025 16:04:32 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b59ba240997sm6578672a12.22.2025.09.29.16.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:04:31 -0700 (PDT)
Message-ID: <f4bde3a8-25fb-4bf9-94fc-c3834b2f599c@linaro.org>
Date: Mon, 29 Sep 2025 16:04:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] target/arm: Implement SPAD, NSPAD, RLPAD
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-8-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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
> These bits disable all access to a particular address space.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 23 +++++++++++++++++++++--
>   1 file changed, 21 insertions(+), 2 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


