Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1788606A31E
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZcOPcbz9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJXgQ-00081p-6b; Wed, 21 Oct 2026 10:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJXgF-0007xW-78
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:52:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xJXgD-0004vc-Lh
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 10:52:38 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso743684f8f.3
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792594356; x=1793199156; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VtmJ3+HF2o/DDyhJVCSoCBMJoq2eT+VcJa3fqTnZSdY=;
 b=ZcOPcbz9YLpSp+h7DTcubQFYv4i33f5F9m1gKb4MZyYPGIN9VI6SRgrjn8MnUmlg/o
 fKsP2x+SmmuEO/MJLyU2SMnI3K1GHwDHaYabA3X6BBQdpqK3HTCwHVmrLyySwaLCrsjZ
 GthPtqu3AkRE+otqDC49U3Sb92PSeisFyiPS0FuJ16Uem+WD7rGyeXX4sDO7kvP6D9Ty
 nPM1fjQTN2zC33B0a7FU1t7M5JvUfN4jXCVt+gFnqApaSpqeGQ3YIrYsJ913ncgMVXZj
 tHCemhW8U8OLX09kYn77iooWkZe8bKRBPdhVO8ATdApt6G4/Xlpt3lv7OsvtkHlM2EWj
 A0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792594356; x=1793199156;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=VtmJ3+HF2o/DDyhJVCSoCBMJoq2eT+VcJa3fqTnZSdY=;
 b=S2E7552KqxCZVcFTZ1V5yoVwfKZkYPl9XCIChVkhTqEF7hQHSqtEUR1tok3mupSoVs
 lWwDm+EqAHxmkAwzuwRNMDZMQkZTLS/sqmpXRUtplcAikWAiIuvBr94s2HdwO40qPf7H
 oz+yOIa0qfDY4k8KogOtSj0gE1GnVYshuTzd5NNNi9cpbdtLA4Jtzf5oTvTYrWPkue5z
 9PeJZL0z57IiJ9nJrrAwgwnwoKYHTPTlSmHezurQKwsjJDYoePZjkw4MQCuBbfOW3/S8
 5Hjva9kHalTYy8VDBvlQtFUC4wCLI0yTn4iuOwjWHWHZGC3P4igibqsJs1qE6QTfc79O
 B6MQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2mdkkWVBoYaFQhX4YR9Fi/FAoGnjQrp2LDKOfDtjRl+cRtsKq8J0KwMqFApXkvA3H6cqfwtoTog==@nongnu.org
X-Gm-Message-State: AFq9FYJ4QSK0Dm1HTYk16wpmGDijWYuU9Q6FOQoYqOJ1oHahKVbo5onm
 EGur6Uy37RAQAFB+Hol9a4kMP+wIk2/IVkE1m8loZn6Y5/mti61Pjy81xiJ75ynB3SE=
X-Gm-Gg: AYBFou0DCNGLszzwzbDq2oA5XWsc7o1wr8HqJNkT5r9XsYoAqJ37B05HNVQ7YqgX8G1
 a5v6i8wvdC7e3L43E0xhVyG5mFZE9TXSIBTcF2+/pQsK17FWOwYfHcyJC5OMBCOyKKyCb7O8i0z
 Cjf3MOOnweuxXXI/6YI/VsVIBzmNwYg4TIOIPTSaT+runn7jJ3ZYT1+xlq/reNBqNaAC4hl/DJC
 lyWlYWzPp7nN+xwVmEopdLiDL4ZAZfUIA7RGOaIwvl45ndkv0F0rBaZ2WYDIDqLtrrH9VJjh9jV
 JEvnxnF1rPyJJqKjYaJaDUXd4lt556aheO5hpIul5OoO2l6qaFAe58P9TGfE6zU66r8eDH5A3tE
 cX6p32JkF146xupQxLQfdyey1XL7W99Q6yJovzc9pMZm24Wrk1tKwDmyRSjIFjyIdj5R6sBz2/l
 J0IK0VSj2NSBShawRxntAVfTl+foxW/yJsbgYauc0Yn3mSZFWMk734zArVwBRopWVllO8kMRZpF
 Nr1AlaaJEQ172cemLvANFagaCRj00eWSzZsY9V4lc+qjwbNtc277q9oD+bBJvVedwwIVEiLUYih
 OgkANCiRGs7/pqMAEiDzKOqyjgs=
X-Received: by 2002:a05:6000:4313:b0:48d:f498:91e9 with SMTP id
 ffacd0b85a97d-48e2647cf3dmr5213393f8f.9.1792594356082; 
 Wed, 21 Oct 2026 07:52:36 -0700 (PDT)
Received: from [192.168.2.121] (pd95f64ec.dip0.t-ipconnect.de.
 [217.95.100.236]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e254efb2csm6246855f8f.2.2026.10.21.07.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 07:52:35 -0700 (PDT)
Message-ID: <ea1d0163-5dfd-4f9c-93f7-ecee49c4fc7c@linaro.org>
Date: Wed, 21 Oct 2026 16:52:33 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] hw/intc/arm_gicv5: Regularize spacing in
 config_readl() switch
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260914160020.327787-1-peter.maydell@linaro.org>
 <20260914160020.327787-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260914160020.327787-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/14/26 18:00, Peter Maydell wrote:
> In this file we don't put blank lines between cases in switches,
> except that for the switch in config_readl() we've written it half
> with blank lines and half without.  Delete the blank lines to make it
> consistent with itself and the rest of the file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   hw/intc/arm_gicv5.c | 15 ---------------
>   1 file changed, 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

