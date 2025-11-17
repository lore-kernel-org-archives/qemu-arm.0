Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06857CE8D6B
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 09:49:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKvr3-0007c6-Cw; Mon, 17 Nov 2025 04:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vKvqI-0007OF-7P
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 04:48:14 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vKvqD-0007iR-JE
 for qemu-arm@nongnu.org; Mon, 17 Nov 2025 04:48:11 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso26698395e9.2
 for <qemu-arm@nongnu.org>; Mon, 17 Nov 2025 01:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763372888; x=1763977688; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aPVtvtBl7qxf1XdYwvBtZS0KTD0bptlLLXJymJlEgPE=;
 b=rwgCFGXiz74FbOQRpbVVRNDBZicx5N7X8YK65SdiTFOplmL7srKqXfCceJHXKu2TpR
 hzpg1KdKZ+Up/e80m0g3nRr2TAbU+iDrqxvZMz3pqsuFzRTs/abcyi0oQElhbLR627Fg
 PY75PsM2jKLm78e32J2D2uKABDh+C1dnh5YbGJBHNLZkQikEBKpH9ieGfmECdUXfessd
 4Wmy4/66awZvlErd70sJfTsTcd1A4fMpzc8UviSxYEVKdLmMRsdR/LXxpToYuhcRYvw7
 3nnHddQWDstn88FtB4G8W5GyH6KA7348fRR0nTv0tb3qpszkIw11CAtCny9hfpCJt7kM
 niOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763372888; x=1763977688;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aPVtvtBl7qxf1XdYwvBtZS0KTD0bptlLLXJymJlEgPE=;
 b=MUZ1Gg+JLQILCV4EoWHWeM57Z2DA3RRaxu/jW3/qvHMkH1HX7Hdgz5wLBy0sKhiiRf
 opwTL4CCHsMcmVdBz+fqHV3KBqqOspdhM5yQng29Rg5oBUXOCT8GRpgwm9pPh1EX5vii
 wiovBSWwTWxyHsCp+f8+/u7l83wfzgv6AdRjucS1D4xa0VkuNanF0HOFjfc2Z2omgE56
 yUu9t52QlNk8vDifCTCmkfKh+vzS+1h+UDAsQnOTlKrw4j9Ab8Pbeu+NIgJRFPAgp7hV
 wE0CvkYnsVC86uzmplmQRQLeLlp7Ey6087M7Fz8yUQhEQbdXsB5M5Lt09C+91IE4s84A
 xQZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0K9r0ohTSn/wiFyVNo4fGJBfBvDNSMGgJAtpldK+dAZSVXDvnzXkQ5qSp6Lmbhjsnjt+0wpEJXA==@nongnu.org
X-Gm-Message-State: AOJu0YyKoh3aIF76uagqYo+zNWErjqlgwfyWuNbuiLFENYSCDYRZcq6F
 AMO0DfyNyJ9ztbpSR9yq/hfkz7NEI534SulRTT5Tx+S5zjdlWffxw69AnL3AfztqpPY=
X-Gm-Gg: ASbGncvNUTjn+1h4WtNRhfkjfTs3EgBeHqN8aQfUUUAOkRPPIgRHBf+K5vDMObjlBfC
 l2uQZ8FkxcusRTAc6YVd06BELtiBdwQAaq4UXX9jFENzZLD021NNcANMpOrUH8T1Q0v3Hm+f7O3
 bH4vY/UwO4xs0Q0Kc3IEefdnrg5lEfxTtPtwqBJWu0JREhvyLzYC4+4eQSVuDhZJKnHFiWgVQGJ
 RryfBQDbGf6DlQ3knalsPGdBrepyi1Qulf3WXAKvHa4IlV6Qa2qZsijO5vuA6zhgYBFpYlx1JJN
 nN+LZfGUqfy1YtPUJc2yWj1t03mTZBJ4a7GgQi4cgl0MpQ39IbnN/ybmiMn3Qys1e8jRgjbmxrH
 SScainnc1bqGYJqSCmCNku5joJdlc52ORo65hBJPzZWKyNhBh9CQiqH47Z/gEmvLeB7NMZFstkX
 wb0l5YJCt4T9SpT8LCmVvTSWDMdr4PRTVBaHd6WSAr39HgvQJT4ZDZQLIYtKRA
X-Google-Smtp-Source: AGHT+IGkY10vlhJsb9CvjLedT7lRvnZIHMf9VL1pGCX8YbXkUMO2C2hBNxL8mcaHb5xh9nfLd3UrkA==
X-Received: by 2002:a05:600c:6b66:b0:477:9a28:b09a with SMTP id
 5b1f17b1804b1-4779a28b24bmr49146765e9.0.1763372887967; 
 Mon, 17 Nov 2025 01:48:07 -0800 (PST)
Received: from [192.168.8.105] (66.red-37-158-132.dynamicip.rima-tde.net.
 [37.158.132.66]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42c9628ebacsm12232945f8f.30.2025.11.17.01.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:48:07 -0800 (PST)
Message-ID: <de5f5b65-cbf8-4724-92a0-0a259b386019@linaro.org>
Date: Mon, 17 Nov 2025 10:48:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 01/10] target/arm: explicitly disable MTE4 for max
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
 <20251116-feat-mte4-v2-1-9a7122b7fa76@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251116-feat-mte4-v2-1-9a7122b7fa76@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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

On 11/17/25 02:40, Gabriel Brookman wrote:
> Previously, the bits used to advertise the various MTE4 features were
> not explicitly set for -cpu max. This commit calls out these bits and
> explicitly unsets them. At the end of the patch series, a second commit
> will explicitly set all of them.
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   target/arm/tcg/cpu64.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 6871956382..ca9557f4cf 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1281,8 +1281,16 @@ void aarch64_max_tcg_initfn(Object *obj)
>       t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_3 */
>       t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
>       t = FIELD_DP64(t, ID_AA64PFR1, GCS, 1);       /* FEAT_GCS */
> +    t = FIELD_DP64(t, ID_AA64PFR1,
> +            MTEX, 0);   /* FEAT_MTE_NO_ADDRESS_TAGS + FEAT_MTE_CANONICAL_TAGS */
>       SET_IDREG(isar, ID_AA64PFR1, t);
>   
> +    t = GET_IDREG(isar, ID_AA64PFR2);
> +    t = FIELD_DP64(t, ID_AA64PFR2, MTEFAR, 0);    /* FEAT_MTE_TAGGED_FAR */
> +    t = FIELD_DP64(t, ID_AA64PFR2, MTESTOREONLY, 0);   /* FEAT_MTE_STORE_ONLY */
> +    t = FIELD_DP64(t, ID_AA64PFR2, MTEPERM, 0);    /* FEAT_MTE_PERM */
> +    SET_IDREG(isar, ID_AA64PFR2, t);
> +
>       t = GET_IDREG(isar, ID_AA64MMFR0);
>       t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
>       t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
> 

They weren't explicitly set, but the whole ARMCPU structure, including the isar field, was 
zeroed upon object creation.  So I don't really see the point in this patch.

r~

