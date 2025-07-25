Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B6EC87FCA
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 17:57:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufMfb-0002ex-Cy; Fri, 25 Jul 2025 13:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufMfN-0002FM-Gj
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:57:17 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufMfJ-000242-Qn
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:57:08 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-747e41d5469so2758982b3a.3
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753466224; x=1754071024; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PeVQPZhEZfWReNJfn1LTpHfqampo0f2QC9qeRIBkVbA=;
 b=Ny/WmC9Ld+vx3zIuLur1i96czRM/STOsYqRi6x9aWRSoJCjgnfZ8xelwRzrmn1Ptm8
 T/Hx/qHI1KZVU7Lh+0QUu4EbbtNqxtua498Xnb2R9c7IWkt+ovsLxe+BPECDc/B+9hQF
 wT6iTV/wxJ1cGEIvOuV7+s66n+pPpqVy3B9QghbYCU+mnqmGyHNzqb+5bfkg2Xk6vRXr
 C8NDYXK5F8/LCttLUDMG6j5nT70ZrvFlKP10WSIV7SZNzD+jXo0CLhxJGPPTK0B6U9zg
 mNUYQqVKz6nGlwduyFM0dz8orv5pTPn9DNlHC63qKl0ef+Po2Ty1p9sFuwSpu3U37ZY4
 6T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753466224; x=1754071024;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PeVQPZhEZfWReNJfn1LTpHfqampo0f2QC9qeRIBkVbA=;
 b=eDS9BYc/E6EI/Mf4N3jcbCipA1H4cG2nJTG4paRIyHjW3CM3WtdmAR15e24Zk/NO2q
 nIRmb/BNHjrelCXryhK+lhQK+n44hI0/6zVnqOi+ITV6OwXYYE4lFGgOOjLFqhnw+q5q
 Tz3toHVvbL7ZEMh/gwxnqbOQhJqpFm3BSK9uLoq/C0Pb5qOrqG0SHVTemCi5FS59S8RT
 VTUEg73asXCj0rOUmzZ+6jdALiQJWcJW79Yssc9q0LVTpt9wWDGfbWJZdiTnC84ew4Rt
 0Dv1stgh0D3b9zxgsK6A2em8q6JM76u6jrS8Geg2Df9AnGnhcBJsSea8fe3kedaI/p85
 pTiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgDrrG4LoRymdk15/6lZDpGMkQq8IG1EU5/4m/cHW4AZFl/mX4K/KqIxefJLL8GuiBgym6KEfnAg==@nongnu.org
X-Gm-Message-State: AOJu0YwiCKlGLgLuRMAAIcoyJxkiCBvW8sbC446yjprJEWWmJeRkYLQG
 eAWznDVFDLEH1JveOI6jes7/pkQ8hbuQ0BTYT35a3uxLQG+iIX0zTtqSL966e5MNqGE=
X-Gm-Gg: ASbGncsF4pZtDb8UIGBj/c++Pnvzb4FvI5hzOS+fVMTNUOKkUW09CllpHOmjzPzmqD1
 qjDSm76MoQhZhGq8BZoRNiQY2O1xSF8nwsPLUYJZn5Y4DgVvgRmuD3DPr69yy6ffM7I4/jKuMoq
 rWoikFHz8iXI0wawEmjU7yAco+fek8qnbW+87RYWZ4biILOOiwOL+rzMj+u+S+RB3r7NcTy0rj5
 J78EtEAnCORmxT4F/65ZgE9aaQ+Rf2EUMRspqKVq0Rk6B/a96gSim4FLtpOvf2u3dTWS5udELS+
 TL4SosvIBYwnGra+bMqNm53XowVmHlk3ClFEiNA45ypajr8UoPlmFGM+ymd9v4JKVURbGOpRWDS
 oxo/YH2/oao9i9kMHrSg7UEXrJ2TwH4TK15c=
X-Google-Smtp-Source: AGHT+IFsY7+n4Dnp/cpaVCT4tmgOUjj1Od7LjBbdrcR7Chum8+QjTNs2+yqQ7tJxuHxoQ3mR7rwccQ==
X-Received: by 2002:a05:6a00:8cb:b0:740:5927:bb8b with SMTP id
 d2e1a72fcca58-7633322c898mr4538873b3a.0.1753466224001; 
 Fri, 25 Jul 2025 10:57:04 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-764163074edsm137671b3a.28.2025.07.25.10.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 10:57:03 -0700 (PDT)
Message-ID: <7c817779-081e-4064-9e23-95b7d9ca2322@linaro.org>
Date: Fri, 25 Jul 2025 10:57:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-10.1 1/3] linux-user/aarch64: Clear TPIDR2_EL0 when
 delivering signals
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20250725175510.3864231-1-peter.maydell@linaro.org>
 <20250725175510.3864231-2-peter.maydell@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250725175510.3864231-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x430.google.com
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

On 7/25/25 10:55 AM, Peter Maydell wrote:
> A recent change to the kernel (Linux commit b376108e1f88
> "arm64/fpsimd: signal: Clear TPIDR2 when delivering signals") updated
> the signal-handler entry code to always clear TPIDR2_EL0.
> 
> This is necessary for the userspace ZA lazy saving scheme to work
> correctly when unwinding exceptions across a signal boundary.
> (For the essay-length description of the incorrect behaviour and
> why this is the correct fix, see the commit message for the
> kernel commit.)
> 
> Make QEMU also clear TPIDR2_EL0 on signal entry, applying the
> equivalent bugfix to our implementation.
> 
> Note that getting this unwinding to work correctly also requires
> changes to the userspace code, e.g.  as implemented in gcc in
> https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b5ffc8e75a8
> 
> This change is technically an ABI change; from the kernel's
> point of view SME was never enabled (it was hidden behind
> CONFIG_BROKEN) before the change. From QEMU's point of view
> our SME-related signal handling was broken anyway as we weren't
> saving and restoring TPIDR2_EL0.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 78011586b90d1 ("target/arm: Enable SME for user-only")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/aarch64/signal.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


