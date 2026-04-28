Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430DAFF885A
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 06:09:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHbd4-0001Ny-0A; Tue, 28 Apr 2026 02:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbc9-00010e-Gq
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:08:10 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHbc7-0007VX-SO
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 02:08:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-43cfd1f9fd1so6810818f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777356486; x=1777961286; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uFU2ZGoSm/almi5MTkoDlVd5GRD8jawMKIRCUPbOpnY=;
 b=wl8UOxHnLLfgCceAdL+B8kcKsJ3auwc/VxJNVDsdCr0F64HwVv3iiSOu4Xw6S+3JLR
 KodEXJWrS11oJNZ2dW7aPEqZcHw3aEeqvE/WbIjjY+hElwk6gPakPA6UB4z1BwDr5sMj
 ze2xOssfNm1WXHjQCdBv1mw/vGGrC4/VE/nJCKMgi9+eytNEXdxXxwRo3NeRoZnabtkN
 eh+m66Rrk+jck/mMlgMk+nqoBWkWWVgS4A6U7qo0Bb2MIfgaFfvWRx+HLfg27HbwZWAn
 zEJ6e/hF7TGYk+L1V449/FYJByJf0gdbPjN0o6SnIhtUgPghT753sKyuBrLFz4ZpdwoS
 XDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777356486; x=1777961286;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uFU2ZGoSm/almi5MTkoDlVd5GRD8jawMKIRCUPbOpnY=;
 b=qMHaDh+Ap+FPvKT9O65dOULdETfvsYQMc7qZe/dS4dInBK1QYhog9XB9a0bK43yrBS
 I0ZB4cNUA/RBaBb2zYwV/GjXXu6Sa6rXfPF7edmX5OECVvUzpw4KHxSp3nWM7CBFwb/g
 +pnjghywHJlrnHH5WZsXzayjCweJ846KEen04p+15Og6zZvhFlc/wUcNKgHL5juj9t6T
 MBRik60GT05rzS0tv0blrGfbWC6ljv/6HJF6da6J1iEZ6pgoaKsA2+xujEahLJbtYCd3
 sGmqgdoz6KsZDtT8wu49gby1MXfdjOAclKC4/ADpeVyikE6Ge3sf2IEBFg5YPuornUwK
 3GsQ==
X-Gm-Message-State: AOJu0YyxyU/wYVLbYGfTThJf4US8OhiQYhAgTQ6e8XALx+uDKfNVi5ti
 exiLcTbVIdlKQMqJYs+Wi6JVCjFKK26YjiQs2fuNiFL9T5O/jaBGew0VmXA4xenn69k=
X-Gm-Gg: AeBDietGo5Td/CTVXCJDtjoZ3DKms6CcmESLh0Ah2SxLFhyCqRLCJSNDwf7eXJrbsJz
 kT9p8TXfFde8Xql3JnoGfQRrxgmymYsNfiZHEA0jZNJXZgIEC1fiLnvcfXGY7NfKU/Os7tmw96K
 z///Cno+/eXZjnuss5z3zmGRVI64Ihxwx2uIucclJw03Wh0ol3M6+9ayFXo+a6q0Vj89xV/gi2H
 Vg0xHNkJvd0VeugatOQEWVzNz/W94B1t8WdDWlDb+xznKLuw5X5YW9qik+nrCXt/vvUKTwPNdrR
 uDHT4u+khGgtHuQEeR/qoCy0M2Y9XMNs9gpBfYjYErow6Z4zkIcwHyuv3Rwb8R+BV5L1/18n7BU
 zv6oQDYnjyc72OJjHY+q6xH6VCvYpwW2O4xXwNzkw5ndiLTLMIxS3S6/czgip/9+Q/IY447zoQn
 Pe4SGQsqHklCGShzM60HNZLFJsbzrCkVeDTneOldQ5dLyBIddjm+/lY94ITEW7GrnvT6JVOKKVq
 9DP
X-Received: by 2002:a5d:5f85:0:b0:43d:761d:5423 with SMTP id
 ffacd0b85a97d-446493f4b0dmr2720123f8f.16.1777356486160; 
 Mon, 27 Apr 2026 23:08:06 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463d02f270sm3736683f8f.9.2026.04.27.23.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 23:08:05 -0700 (PDT)
Message-ID: <d9588eb6-a162-4f4f-9516-27300662ecb3@linaro.org>
Date: Tue, 28 Apr 2026 08:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 42/84] fpu: Inline float64_unpack_raw into callers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-43-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-43-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

