Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC0BE98FAF
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Apr 2026 04:47:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAhIv-0008GH-Ep; Thu, 09 Apr 2026 00:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAhIh-0008Ar-Aq
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 00:47:31 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAhIf-0003Hw-N8
 for qemu-arm@nongnu.org; Thu, 09 Apr 2026 00:47:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso5970845e9.1
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 21:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775710048; x=1776314848; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oSk0cReHSPbAkCS4mtG4ivE6Co7ywDbjBk9n4sk37R8=;
 b=u6N28E8IZZBnreCmDBIkoyu0DxhHeuzW2CWjPGGk4tAexrGZC2dGvZFy8pUmZOEHjW
 8Hk9qCOKsS5l71Ioa/INwoADE/Brwok6k33WQxLExNchZhdhakokSzR3jE/jGnRKJlaJ
 vixLMG0WIRrH/jLPMxSbjQOObIIkhzaK6TT3R86t1GIk9JGsTtwDITug90dU4S2W5/LJ
 wXJyQVKCijsfGLfmY/2hbIHCGMbIs+eMawRjbfFoRKEn/bSqC+OTyZz2dMsOqqPGyMGm
 nvdXRQJu2w2b+rG8P7vdH6jLIVq+atfXuNOfRJzyUJHMgz6LblLV8xWAdNuVM3dk8wNc
 6COg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775710048; x=1776314848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oSk0cReHSPbAkCS4mtG4ivE6Co7ywDbjBk9n4sk37R8=;
 b=b12ItTYvUtJn0i2sat16/VNXpqcgHtcTyR0od4iVOPWeUH4SktvoxzTK2kTKvgbNed
 vWJS79oiIcZiU58X1SZuyxhOmETPDA3OI8qx5esoakg9H+3qkjYqxsvamnfC3tl3CB78
 VKyDEOTOjBdFQG+EHqcT6EHW3oEjwwsGbfHQLJJToJG1+sLWUsI6Nq45RcDXGAp4Mhti
 ah6Y3kIN0vc1s3ErttmJxW2Fmg862bmY1tS10Xrrfl3aF5Qk+W2ncfUfk7acY34EE87r
 NvgtxqEC6/rRvowZKvW4vsYg7ZVNK74+P7GEOp8/OFg/8Lu0SBNGkBghKigiVwCYqZd0
 68wQ==
X-Gm-Message-State: AOJu0Yyuvgsd+funY7coPgA9lGt6bxaIPpIY+kwD/e5pJWiTPAeCeiZq
 IeYNfM7vrgI3wckhq5ejLZQIpKzKc4IbJBU1CXm+xEpHPXmBS7pQbsq5gfbRMRWqbtI=
X-Gm-Gg: AeBDieshZY+UXqrcyyPPwV8F/EPoWYZ3FId4YnKWOqIt3oLVZnx3gfuefU5gWV4fjLZ
 SqrDhZe93dYzj0GBhjx7kDZ7Ab6+WXC4+hjYk+Xby3iEv96PcIefzSkr0Qy4XNWpGRo3QYIHn/E
 LI1YB9UuaKSwiZp9dxKCtUJY9GAuKOS+z+WUUY1vjqx6DUDTFyS3eCHmhIigzbxD7X1EeDmpRxh
 IRd4oidhzVf3MAgHRGN7s1HxSlCj21r6YJGMfxQUcpMmN+68KTIfMbYHZwVcZt/MMa2432oBUZS
 1UzMi3RAXGPEDOsLyTeIoBV0y9qzA3/OXT3W8t8QHP/wgaBOm9s6bEambDv4a3AZCto1jsD0y+n
 wTJ1cXwqld6upOym6kyI2GPLwYYp2MKUpX/gw3qUe5PfdKoQ/lq2BpI/M5q56UywpHdLQLHdE7U
 C3IJ9JVpA2wFeBM/THIJl4TPimbiQ2lGD8IfIzx1ijcKLp/xKPhRctPaCVYczbkru8hg==
X-Received: by 2002:a05:600c:630a:b0:488:8840:e5ae with SMTP id
 5b1f17b1804b1-488997eed8bmr330606145e9.24.1775710048107; 
 Wed, 08 Apr 2026 21:47:28 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cf9dc4e5sm23796625e9.2.2026.04.08.21.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 21:47:27 -0700 (PDT)
Message-ID: <d304af29-092d-4140-a44c-18b64091d96d@linaro.org>
Date: Thu, 9 Apr 2026 06:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] target/arm: Segregate target-specific user-only
 fields
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pierrick.bouvier@linaro.org, peter.maydell@linaro.org
References: <20260409035015.132370-1-richard.henderson@linaro.org>
 <20260409035015.132370-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260409035015.132370-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 9/4/26 05:50, Richard Henderson wrote:
> In CPUARMState, we have one field that is only used for
> AArch32 and one that is only used for AArch64.  Use one
> more ifdef to avoid adding both at the same time.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

