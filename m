Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076F3CF2594
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Nov 2025 07:52:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vLcz8-0008N7-AN; Wed, 19 Nov 2025 02:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vLcyI-0008C3-7x
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 02:51:22 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vLcyF-0003Yh-N5
 for qemu-arm@nongnu.org; Wed, 19 Nov 2025 02:51:21 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso33266655e9.2
 for <qemu-arm@nongnu.org>; Tue, 18 Nov 2025 23:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763538678; x=1764143478; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OIFUfe0Ax/LbY8n3zSczwiP4edhWPEkUA2u984zhCGA=;
 b=RdyVXlMNdUEKP48+E8yEmkiDloZCXjcauMrohitcoyZomuKAg/g1XmR85FBoeMRQZo
 qUszX07PXtxb9KqAc+yxciRl5HX3ykzABFECDsQAvOFSkzPPLQ4UCJBmO2hwwi4MhCNF
 9B/QlLV/m1LhJVkQ8qkiiz0E6L7fKRXX2zKYBiiBticRCFOF224oejHqKi03MNmS90Hf
 N4yw7bAysw/oNit7TaMM7KhrpzcfE3+dioG0w4cU4DDf2RfUxEvaIugtsOxsT85dtVTg
 zlj87QaVRxja+Wew/NYMeeMhas/uQ4gItg4A3M63dl9zqPRinLDjqzkIOQCs3/DpcumS
 tJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763538678; x=1764143478;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OIFUfe0Ax/LbY8n3zSczwiP4edhWPEkUA2u984zhCGA=;
 b=H1bNLSBaZYPGcRNfcpTBPkaCZjS2uk3iUPNZlKcz9BqA74XbgbJ1br7vIJU/hMNUjr
 aKcRSknuQ0rcbrwxhtIZ8xdDZQGRzvtEZDFq2vKATHQTA/EyhaF4J9fSTUI6nAhQ/+du
 JwquNAAXCnoFU3BH4JMyCrsDf1MpqRCgnaMi70pvx0soWl5FP7OMwMXk8TDcxiUF5SUW
 l4nWiConBYITccsZo5xZcXRGM0Q05DlmVgLn8WudoMx01QuQFwuknDkJPIwQ+uanv2oH
 mBuln2kGLzcpxgz4AC5KxjRdPpZAij81rlTW0mKDc5ESTt8KiNjtif2WvWLr+mdkSY6q
 35WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvEbrVEqFq4sjSgRj4kG/MpAJREBfvB91Y7exhAMXG8/PYF0ceVOXHswhIk0hU18XrjnryQf4/ug==@nongnu.org
X-Gm-Message-State: AOJu0YwIV4jtnd89ksfiHEH8DLuWIzYUOnLJKdPrkbKSPK6ZWweKc5e+
 G47PWyu2wKh/ilNAiif48EG/BnGZXz2u+BT0LLSHXfM6YGfnue7Q2fuepgaKRJQeQqE=
X-Gm-Gg: ASbGnctHJjoGkXcexJAilRZo+DLE4ujySPWPWAHyT9P2LOc/GsUIV53mH09Ewku88wx
 IahhRNDfGXd5LYkAaRv/NX/FkThE8vqaUI5GR0o/A9RP69NAmFuriec3jsLTRMrusifrF5aypqO
 7vcmiF/PuWOjIH7yVB7jJbdVyndZY5UsRY2DMz1dUXZG6Iw4krpaYkKu9x/nkmiCWtR9USszLh9
 4Zhg8orL/y2HqStmWbhpN5LGiahtAls4Rz9tKhOfbMY3ZmKsh4lb5FN50XUEfVDa6OfT0dXL5a5
 FBV6pKBwbL8nqIeIi0pkB/EbGZGDpTD5dVoFJcanvk8FRZfLbPpMFVJlo0cY90McVU2X87s2CR2
 BOPwSc47VBmcOIwB19eV3IPEs5Lh1RqDQi9bNLHGmPZt6bh5o0s3KJg6usmPE52Jr9nUpJPPo6D
 UJtimL4z1G/heiIk7iJFjTi5MT/7JGqsMBCOvidotK4QRGMXG7fC15G77DezNxVZUIL+uuLlwit
 oiZsA==
X-Google-Smtp-Source: AGHT+IG253dnn7Y3Zux5z6kjfXJqQNkl0wue4SOZVv1WmIBx9qYjPcDhxtkWJfuGTcIaXzUfPstlYw==
X-Received: by 2002:a05:600c:1caa:b0:477:76cb:4812 with SMTP id
 5b1f17b1804b1-4778fe0694amr206399265e9.0.1763538677914; 
 Tue, 18 Nov 2025 23:51:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ed5:b1f0:90e8:1fdb:2cba:9db1?
 ([2a01:e0a:ed5:b1f0:90e8:1fdb:2cba:9db1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477b102a3a1sm32432465e9.9.2025.11.18.23.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 23:51:17 -0800 (PST)
Message-ID: <d1b935a5-61a2-43db-bcc8-df1e8a1d3649@linaro.org>
Date: Wed, 19 Nov 2025 08:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 10/10] docs: added MTE4 features to docs
To: Gabriel Brookman <brookmangabriel@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
 <20251116-feat-mte4-v2-10-9a7122b7fa76@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251116-feat-mte4-v2-10-9a7122b7fa76@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

On 11/17/25 02:40, Gabriel Brookman wrote:
> The implemented MTE4 features are now present in
> docs/system/arm/emulation.rst
> 
> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> ---
>   docs/system/arm/emulation.rst | 4 ++++
>   target/arm/tcg/cpu64.c        | 8 ++++----
>   2 files changed, 8 insertions(+), 4 deletions(-)

Best to merge with patch 1, as I said.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

