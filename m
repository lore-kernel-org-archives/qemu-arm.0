Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5DAFF885A
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 10:58:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKDTL-0001am-9l; Tue, 05 May 2026 06:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKDTK-0001a9-7M
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:57:50 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKDTI-00031l-Kl
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:57:49 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-488ab2db91aso60970475e9.3
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 03:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777978667; x=1778583467; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4VxplSUpXi9bv1KzzE4OgyVwhYqVJESpnIMetbREGK4=;
 b=oMLBY3rOiFWlNYlz45EnumewltQVQJWKH8GCJxezpKhADtogdtS70xJYKCs+PuL7YD
 RsmRyCi6e9cJTX/uOdKxNXUCOVIyB9VL5l61OqsPv9jPF1Kq3Ruk9BexMXUdEn04ZUOV
 NURnzXpd8Y+RtoMdGR+fGc+sWcOqWTmtXxocO/B/jN4J68ERt3YNB+8K/rw440du6hqO
 vro7t1mfje6SosXOCOs6ys+HS2GwGWELWlh9hb6b67gmxlsjFL63JUV0A9NYdUIWEZd6
 tByT1xRecP+CBxlmotrFxnAu1/EHOu215VKhOidh+WZCOoBPeiqcDlsrRMn3F0w6KEe+
 D27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777978667; x=1778583467;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4VxplSUpXi9bv1KzzE4OgyVwhYqVJESpnIMetbREGK4=;
 b=VwHXl8eJypWSehwKIYHls8te6lw/hiTZXq+Ey/bpGrMMOQd2I4b+MkSO7OQD4FhOXv
 wbQpFOASxmWcWAzAErHAABQcjeuTELVRSv4w0Vy/AtcvYY0YSpZaul+LlcDyywte0sN+
 92kw1wBi3yNdSFfZQowT2uk0Qn52wO2RYevBl11jt7qrjY5g+NxzS3Y9XGH36TSzpiJx
 /lWZrNDnoSQZGJO36SYdbCrmohLVGqLZVT6cNOr2wN+vUOAZ/3cTA7JNV9PtKqpeklMn
 sH3gjXG26kc3EsNoT1GoplM932PxB7vNJHnwxSgEEVW8ZXSuqFcP+JDqs/JHJti2QJcD
 gURQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8kuAT9+0xjQUgbVeKznxJYfpKchwh1cVCy09liviERP3AeH5ESkSJuWVOQPXVwn/3UVnmivNvNSQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxo4OAfNYulOUhow/x40aE5vPhZuerrk8J2OgFcNla3BqsNL/56
 lOONhiDqr1x2EP7KmOr/Mig3Wo+7BL/ABfUwopBTRdw+9Iw31UlykDHVcTmDWxbL0g4=
X-Gm-Gg: AeBDieuIiJttZa91/DYfZvJY7cy2Mpe792JW7A/nUbwcNeyxfDTbmqIcNJCbuyKw3EC
 GxVOKM6h/G7ZJDLx/BBNt4lXuPW7iU5edwWKl9yZ9M2bH62A3UpNM3tqkhdsOKxMC7gR5O9Ivqm
 gE1ooyZewXZBZcH7Es+QpHPMJxbzsGd5lBVMO6CyWhELqI+1VCCYna1hITWD+s/vS+s3RMMQ3oy
 zVvscvuX6uXfzTRipxgxAdfq4Oh1e82vaHt3GY2j3cJNcoXI+PLJG9E1UgoMin2Kk3ahN44QOEW
 wJ5w1dYzq41Y/OL8QylaEbCXeFK/wmh2NMkzhQHgLp4ppvinCow+Usl0i0xemaDjlrYutxEfMbB
 RlMZLTq+rR9X110XmiwdkfMk4ctaHaVqVzsa6Gb+zJlKzV3os7ay5H0baBkKu+o7j/l48GnXLKB
 qKBKqOB1M5wbgfdmhDbHRrR+MCaunfvjKf4Z5nPHDVAIZau1AGskJ3h/VXQ96IwiQ5WCo97VPr4
 A1D
X-Received: by 2002:a05:6000:2001:b0:439:b1c3:84c8 with SMTP id
 ffacd0b85a97d-44bb5b4d5e9mr24469817f8f.21.1777978666827; 
 Tue, 05 May 2026 03:57:46 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45055f2487dsm3661733f8f.35.2026.05.05.03.57.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 03:57:46 -0700 (PDT)
Message-ID: <3fbbb017-7868-4f24-ba7a-de6f8d96ea76@linaro.org>
Date: Tue, 5 May 2026 12:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Report IL=0 for Thumb 16-bit BKPT insn
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20260505103726.419195-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260505103726.419195-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 5/5/26 12:37, Peter Maydell wrote:
> The Thumb BKPT insn is 16-bit, and the ESR_ELx syndrome register
> definition requires that we set the IL bit to 0 for this, and 1 for
> the 32-bit A32 and A64 BKPT/BRK.
> 
> We used to do this correctly, but accidentally lost it in the
> conversion to decodetree, because we converted the A32 BKPT first,
> and then when we converted the T16 BKPT we forgot that trans_BKPT()
> was unconditionally setting IL=1.
> 
> Pass the right value for syn_aa32_bkpt()'s is_16bit argument.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3474
> Fixes: 43f7e42c7d515f ("target/arm: Convert T16, Miscellaneous 16-bit instructions")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

