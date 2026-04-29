Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F9ACCFA13
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:43:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9sp-0006uF-Ea; Wed, 29 Apr 2026 14:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9sh-0006mq-DN
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:43:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9sf-0001i1-VC
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:43:31 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso74447f8f.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488208; x=1778093008; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pRxTLmfcF+jRs3/+yS2j8IrHCwnIEZST4WkzJ5yvVrg=;
 b=dhuAH2uK/JUvum8AXRBZXdJqmEs5afMghQ2Dh8n9YTp5ZID+hRmWXn51o0mJtC8yRX
 eYid/JJg2p6oskNTfSXLsiE1mrgV4Zj+5PrkumRpVpeg5MxkAGLBjbOXbtR0SgfGCpkU
 m7EMyzWfQ2Vm4v4glr9aj9TztGFcuLHuquC1QakSYHQpbtpIvCMdAjVl/GZhWNlurpwc
 sobLzE9IDmFqcbZU+GQBOla9Eud5iidzdXcghCOdiGvju/z27bMw43Zj1z4E/K69p5J3
 njWUfvHo9MW96CdVpOhz6Oiciv+G+rxx0RwJsch7DLgsvx4SryJArRR7Fciuhbttmnb9
 D2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488208; x=1778093008;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRxTLmfcF+jRs3/+yS2j8IrHCwnIEZST4WkzJ5yvVrg=;
 b=XyK5aket3W3afTPm2aUCVt5fUNqc8BJDzz+/E4rCAQAagic/wD9B5XezkQ6fpOwzzM
 7I6MLx7tcOVVWZSNiz6rpSSkthnYBzJ0P7cZE+X25gU3oh3Hq2S3SFH+8weZIo+8RDMl
 JJLU2xfn+amuCSQTHtPbWanHIKL/aVByQL8DqK+BUc7Q1ffAoyZvaKKSvZt0+ByEizdu
 jjnoyrw2AYD3bs6FAMDoEu0bhTsz4H6Zl5HZeOCzBFiGsisbzfHgq/rDIw0YmUMIDLIU
 IuflNotF4Sv2Mx3mZCJcUY/brYTGUZurzcsRbHn5S81CynRDKypXqYuSeSxliS7Vj6tG
 O9Yg==
X-Gm-Message-State: AOJu0YwzwzTx72MJzCb4TWAMQecfkKx7cDYpBrsEIsdwDz+s7NGC3QoZ
 etL2kTwiOzXuGkGf0mIh4EvSoXy+xxv236MJJeHhh0LEBGJAaQdqXZ7G81YdVEpV610=
X-Gm-Gg: AeBDiesGZOLxYI5MTOud4qkWy3aRL2U1GhoI4zDyEsofeuqb/HGFkB5tCnSQhSYeZT1
 sYfN/F439GIU9VHXJ5J/g5FMKozdaXicBOaf4oG3int/j60HkoU4EjUyIF6NA36/Ytq/124A01b
 KbLSsEa0MhcWT0LK+lyo1Mv4seNDg+XVzIzNMUHmPNThssilFxhFO4EgUes3b0nsUlLcxRlS8mP
 xCvbo3DZX1ZAicJUZwNQ8Tz3ziN9ElysnEPR639ZmT6x8rbjk156DQT0Gj8g0zPjK5k5KgxmnTl
 VIfJY7sBiyTScqHRzl6/Cu0DkRVifYgcEG3/6sp2MoJXlaT9MpWJVSxSe5//a10BIAyfXmqM94o
 tt/sZ71gI3GkwrfNrMJYGH3HBdCAWoxI5shu71BaXjc87xhZw2CdxuqxW1cjPFdn1U5ZbrRSQ1U
 hIlnDP2yLDs8IkktYc3h2plJxzY6eSa+S5dvPynC8KMwWNu5IsLCE9pKtedQaHkyK4BcpzxA2/Q
 7gS
X-Received: by 2002:a05:6000:1884:b0:43e:b0dd:396b with SMTP id
 ffacd0b85a97d-4464a4470aemr14999179f8f.25.1777488208284; 
 Wed, 29 Apr 2026 11:43:28 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b7217afesm7403536f8f.23.2026.04.29.11.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:43:27 -0700 (PDT)
Message-ID: <80b93f58-3836-423f-9a09-7939e0f9c1ba@linaro.org>
Date: Wed, 29 Apr 2026 20:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/84] fpu: Return struct from float8_e5m2_unpack_canonical
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 26/4/26 15:39, Richard Henderson wrote:
> Inline float8_e5m2_unpack_raw at the same time.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

