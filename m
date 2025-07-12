Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DDC83F1D
	for <qemu-arm@archiver.kernel.org>; Sat, 12 Jul 2025 21:29:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uahln-0008Fq-TM; Sat, 12 Jul 2025 17:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uahkA-0007AQ-Tq
 for qemu-arm@nongnu.org; Sat, 12 Jul 2025 17:26:56 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uahk9-0000Y9-Eu
 for qemu-arm@nongnu.org; Sat, 12 Jul 2025 17:26:50 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a6d77b43c9so2973713f8f.3
 for <qemu-arm@nongnu.org>; Sat, 12 Jul 2025 14:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752355608; x=1752960408; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q6vGY1B+bXe0vZlUaZxSWoq9+p7SL4/nosGYSCILT3o=;
 b=WrXzmOgPoGtqVMhNCbM+rWxtlTyZ2mNWznDRMBebUhHa6CcCPO2OL1POb19AYe333X
 XgPbRa6ERQqWoDPDl63mB/BAZci9X2OKHN7igrokPBpxlhV9GgZ9kxNFnmMqUkxxtsET
 nHmTX0CrefVFoJz0x6vfSzwvLKcigx6VgFX0moEj+2fa6aYWwMAX4Mk29GKho3dy2ZkP
 voL7mHCFUNbcFOI0d8eF3xygwjN6fmulUeGi4WH+J0cbqbfTAo8XXCVsMHbwhgLmJsJe
 n/VzdWj/AD2ZhCyBZlBp+hsgI+Fy8uC5pVsXHdSsGb+GptSOrl1CnGXilNxF+1N6yCxz
 vLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752355608; x=1752960408;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q6vGY1B+bXe0vZlUaZxSWoq9+p7SL4/nosGYSCILT3o=;
 b=RJlH8Ltmw/Bw2w4qh74hxS/NoRL7Zxto5az5gLFBDa/qgy/jCMtcDTlPzPFDTVbNrg
 NRMKKitfUl/+gYWbatcbNknUuBwOvv2ueV4g7ioQ6EkgwuoUS69Sk8s0StQP9XNS983X
 HKtSraJVS2RbrnG2eVjLJoslD2SYN4MNpILBOCuf37MjeIz54+P6v5b6+khEjtYgeb+a
 GSJNRJdhupQGqF6AelxQsdOH2uTObnHlpt8Mthep4xxuE7GBkfomU5yQovo8UPRLPsz4
 NIsQoMzN/dC0wlCZGWRUXCh1QzCkpvmqVWJKf6FTQsy3zW2qDbPUXsDnrwboA3O0siur
 Gqvg==
X-Gm-Message-State: AOJu0YzuxyOZ9eMgJ/b72TvCaBP3N/HTNk2NdBodkfqTLMYtwcaXm7lF
 KinM6BS4gscOy50mkkFkVb5A+RZryzHAvRuY7M854FZLyrVqPQLUj74BUkop+g/bFWI=
X-Gm-Gg: ASbGncuNIFYnNk7ZMJ0upHyJIJGYmRZxru8pzEr6gymPJBtcpVzGwY6qzCShhTPBFj7
 sIe1qWCSrcCYqXFmgz/THi4QSD8GptZK1IFHPTyLRi4ybJXhqd9nZK3KvnEiy3cepocO1VvLown
 RYpsEJSn25xuErs7QGmt6QzYJWx8mCCrh97ZhOofUXcsWDtTnOQ+jfSZb+IMow5wLUhqY5BhiRW
 qlQm6s9CyogiX0oPd5zqyt89Y1at1a5wsNUS9LxtIuThQFxjn4cccwoGmOMlgVtYzZlAGK4TuUQ
 3fD9gKRrgna5oAK++agLZNlH7SgBtlf9sSoz5JcD0nUgtHKii+M84R6WyyB81Xb2n8bqNnehfaf
 nHzq6ruuuQ1Q0dn+U8WYlR6SeaLQArVkgKsLULgYOJRMdTXcTfVqYnU+EdLrwZF4A+bMC6944ak
 vfp1I=
X-Google-Smtp-Source: AGHT+IE7lSbIxuftJzkrufiPXV72luIfttwPDNCQDnN1HCdfn7dfwro/ADV4CtIj3Y3IVJWRiskWxg==
X-Received: by 2002:a05:6000:2d85:b0:3a5:75a6:73b9 with SMTP id
 ffacd0b85a97d-3b5f187d131mr4758271f8f.11.1752355607798; 
 Sat, 12 Jul 2025 14:26:47 -0700 (PDT)
Received: from [192.168.1.117] (lfbn-mon-1-970-120.w86-227.abo.wanadoo.fr.
 [86.227.5.120]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e26c97sm8296908f8f.90.2025.07.12.14.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jul 2025 14:26:47 -0700 (PDT)
Message-ID: <ca980064-885e-4a45-a068-d7924b7c0e25@linaro.org>
Date: Sat, 12 Jul 2025 23:26:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] target/arm: Convert do_ats_write to access_perm
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250711224915.62369-1-richard.henderson@linaro.org>
 <20250711224915.62369-7-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250711224915.62369-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 12/7/25 00:49, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/cpregs-at.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


