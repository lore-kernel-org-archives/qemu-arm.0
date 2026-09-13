Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD95C88E56
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Sep 2026 02:46:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x5aDD-0002wy-2Y; Sat, 12 Sep 2026 22:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aCp-0002lS-EK
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 22:44:41 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5aCl-0002Ib-NJ
 for qemu-arm@nongnu.org; Sat, 12 Sep 2026 22:44:33 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2db710396ffso27576225ad.1
 for <qemu-arm@nongnu.org>; Sat, 12 Sep 2026 19:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789267470; x=1789872270; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=acBFeuWET6PcOIIIXhZ62OXiH58NgPyeqPIBUtEYsMs=;
 b=RY12mCP3CWZtKNNC0NU9NnHJcu5pYioGCaU/0RK1vwtolPhFrwiKJ+SJdnVRLABYM/
 v0zn8DHuKERurCJSnJutevcs2LSBL4bJscJIG5bO8msNHCvXj4mU+R6YhqTC7khAl15B
 yAERqkBVV8mKb3T1nl4uOJk9eqYZuhcsOMqapAg8JA8yeJaKjhdhpNDVpPMJp2HB+vLr
 f4t+Tt7jxhwimlA1inHJ1k0iDYX3GlkTOTYKdogKMz+wlwpYWXgXtIqKvxZ0DvIWQXTM
 gn1ikQEbSgRrkTUxEkrWmtY5QwjYU2HsDgLApB20LXAGIEkrnMsxAyZQAXcXSVPlk54T
 DQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789267470; x=1789872270;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=acBFeuWET6PcOIIIXhZ62OXiH58NgPyeqPIBUtEYsMs=;
 b=ZeHd3z3dMtXo3/E4gxWR7g4ZRfkd5+6jHPl7DzOMbzhox2eD/nHyx9gN7qPbKRqbvW
 m4Kw2X9ejWI2tiA1beq1NliR4V0qX4dJZez2H+/zpzp4YxX0pGynfuxwIdFEETsYeMF/
 fazPsLp32uJNXhDMU00pQ0y1Jx0Ci+ra3CaiOq0N9lJlF6wc2GhVfn27Z0FkvNBRaD7+
 Jz3zqq7rbzwjeHNROVXGrqfJ/RuarT4aS3WiMR7Ghi88I9eRVccngT1IEsIhH/WcN6PK
 ONsadmMtNof7ZfuGnwZtXYru7MbCh3fmADl+5fxorG9Do+WzAVGkWxHZDoseQT9icr6c
 8bPQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzCTtcSn4rFjBHmnFdT2v+8RXSFTCQGwrj9s4lRwiucaY60U1jbPKW9LIW0yAhDNb3KXOAEO+RI1A==@nongnu.org
X-Gm-Message-State: AFuF++kQzKGgUzZkpASMIuyaQhAsxadGvNpoA/cM0HZtqt9yEkof2yjP
 HimfElrnVSiRWxSKUGkaZ7bgo6WMu+enYJ/J5UChepA+EMkcEeuAESXuBNU1CF7OiSI=
X-Gm-Gg: AYBFou0gN9N1cmGFkQ3OI5QckmOk2pJ9c/9VThNLH/qxb+QpZuTGOq7terzby121L8v
 vUPthR92Yg2Od2SpxdJRNdNJDXxMXlb2oW7j15wycAr4cxCcn0LdzLaKe0Wbn8CKRK+1kt5ReZK
 Ix4Vqjq0k21ks+m0To9e7O8AGDgILtL3ZbaG2oaubiomhLzMUeQsMqjsmiZI57LiG+l4nJfCjH0
 6Ib7M6V178HapbmPuNOE39KhrCF7IE2rizMWnyzQ6dNHiLfa4mPnM2Q8wNIhtTUU3Jian7s93Ck
 tSi4B9SBvVatp6qRGu0rqAP95gkN+ZtCjZiAdL8zkTIkc4K5P5jCATnKcEeHsbyXCuuGb20A2XE
 GgHDf7KHam+EU370OBSaQecjh838Z6AB5aHN2qNY9F7qk3Z6aa1YDAWz+NKlRohatLfL2apOOvQ
 vTF//a3zeJ0WVeTO/shogUhf0aO/1YGVc4yre6bSCmvyGfJNiqKBQgLBkR9sp0Z6WDaUyKbzk8P
 XNDjKPGY2/3kmRs7vnnFvH9eR/Tlaa4N/cSP2TvFZd60yltWfY+NvGQYlUjr5k6NtW0zjxA
X-Received: by 2002:a17:902:f605:b0:2db:3734:cfa4 with SMTP id
 d9443c01a7336-2dd5f0745a6mr8905445ad.5.1789267469953; 
 Sat, 12 Sep 2026 19:44:29 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:bf2d:a6f5:e308:cd27?
 ([2603:800c:7900:ed00:bf2d:a6f5:e308:cd27])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4e9b359sm16591583eec.14.2026.09.12.19.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2026 19:44:29 -0700 (PDT)
Message-ID: <bab55949-4352-48fb-a986-794e9358b0ca@linaro.org>
Date: Sat, 12 Sep 2026 16:44:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] target/i386: Rename fake_do_interrupt to
 fake_user_exception
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-4-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260902152044.31291-4-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 9/2/26 05:20, Philippe Mathieu-Daudé wrote:
> The fake_user_exception hook handles exceptions in the outer
> exception loop (cpu_handle_exception), not inner loop interrupts
> (cpu_handle_interrupt). Rename to clarify the scope and intent.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/accel/tcg/cpu-ops.h       | 4 ++--
>   target/i386/tcg/helper-tcg.h      | 4 +++-
>   accel/tcg/cpu-exec.c              | 4 ++--
>   target/i386/tcg/tcg-cpu.c         | 2 +-
>   target/i386/tcg/user/seg_helper.c | 6 +++---
>   5 files changed, 11 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

