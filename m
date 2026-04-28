Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6ADFF886F
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:07:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbbh-0000Jl-Oh; Tue, 28 Apr 2026 02:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbbU-00007L-LL
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:07:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbbS-0007Lm-5A
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:07:28 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43cfd832155so8113520f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356444; x=1777961244; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uFU2ZGoSm/almi5MTkoDlVd5GRD8jawMKIRCUPbOpnY=;
 b=KaGL4dtICnEypiXYQLcJhN/QomF5x1GABdAi8wVqdwAelDEsxIeNJVc0AZiVy1OAWJ
 qzCfDphhpejD0bJ6uzUIY9iu3b7kvMjPF5dyetOveAHZqrRRSvy3Ypq1hMWTWEdRwfFx
 mrgPUV2ni8ybSrpPFvIEd7xOFCuzwlqpEB9tUZByTyYS4VWZJUZxnkG63+MWBj9I/K8Q
 bImZm2OhAzUnfBbM/pr9OUUm86HoyxS+lQtxOdo9AIXpba0ZqkWa5xC+d4NZDB5xROjL
 Bk7WxrQo+VROuZyYdQkEwcVFJovwnqCqqQIO22NCRgODF7PK16rc0M9+S3+XXnPl0jJ2
 bUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356444; x=1777961244;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uFU2ZGoSm/almi5MTkoDlVd5GRD8jawMKIRCUPbOpnY=;
 b=BMus5ac+LIvz2vL3N650TMHcrwe5qrUuPQrrk38MQaYyxXvAja6TOJ6lGqndhhQK1O
 VaO0pgmWsREY8jfwLlld3FOVkxX2TyQkXWcQqzNxP0378sIt1o1NnFeB7p3zw/B7kYcW
 Ggp4AQgS6wvUHb5BIeB/AxF1AmBK1g8LH3G92kIz9GEm1IPzs5HOiJ9zvzBNdXnwmHUD
 BIfLK2WTU9ZmyQhDZXeBdRvjkHoIgOo7yCnMOU+8fhAplJZerp9FeWQ8CutbkrSqCJV9
 3ZP22ogHdArDf0m7exxSQIGmIjJfJriYi2wj2sYJR3hK/rUg5pNy5khqeuu+jYfXAV3j
 leAw==
X-Gm-Message-State: AOJu0YyKGaOVdtWwIsE2Fw0pzYa8M3xXbA6VdrPsehFdG2KdSO/1o9oD
 WtUNQh2MtoD2bBbkJ3WOtkWiFgZosDdAZa1mPCRPH/p9EQda4jjTvyZyjChpZn/zUHU=
X-Gm-Gg: AeBDiesehkOIpgHcbWBbPNeEFrGJjjbRBlcTALc8WQCfu49RR8ivPKdOQhDd0uu3n6V
 b21XUagl5xNEbV1qSSWCON8MQ8QP23ZHD+Gqlasit5h4/++XAjYeaApxnoc3SrsY/gBUa4Yqd9M
 atECjYafcg0qlFbSEhvUcwJYxqQ5OC9EtfCgGYrxbSMAH/Zv/akVbQIzyqWn4wdU0ufu93y9Dpe
 yWg113GLMHm3K1tjZ4VXo+V5uhbR/hN+2pJ8oW+gicbyvrCc3sMPdczmHT56iAucqGDqCl78JPZ
 l8mTN0ZFJEz1N84tmjGyDg3saSOzcs0hNAFrZ9vXKDWjj1sag+4QHd/7QeVYti34ophIJ8pmaUo
 5oP6TZsHvBJ68TJIBMbfhKOOEs2gI3WR08cABy5eyPn04dY+uTfVuSAlr+M1ijNgQxv2afdol+7
 0sK7tJpdr7UFZ9czgCWFUkdrW8TVF2Pw0Hp97mBdHPrFTd8iIoaZZ3BpGLpd83Ik0kGKMTUy9Rm
 M8yvQXDC7R4/Lk=
X-Received: by 2002:a05:6000:26cd:b0:43d:1c39:593c with SMTP id
 ffacd0b85a97d-446496d7a54mr2917984f8f.30.1777356444299; 
 Mon, 27 Apr 2026 23:07:24 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463d5ee9ecsm3868493f8f.16.2026.04.27.23.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:07:23 -0700 (PDT)
Message-ID: <ee800249-ecc3-4afc-ae3a-fedf5a9ddace@linaro.org>
Date: Tue, 28 Apr 2026 08:07:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/84] fpu: Inline float16_unpack_raw into callers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-37-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-37-richard.henderson@linaro.org>
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

