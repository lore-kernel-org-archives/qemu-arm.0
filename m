Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BA1EB596B
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 06:32:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vq3lQ-00018g-Ad; Wed, 11 Feb 2026 01:31:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vq3lM-00017s-As
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 01:31:50 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vq3lK-00048f-E2
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 01:31:48 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-8231061d234so1198231b3a.1
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 22:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770791505; x=1771396305; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VI3P8I4QXrt/D58wc4S2XlvSfUm8+jvHYdThYnzY4E=;
 b=UcwYGoVkLwfC+iHbpzk0l0QcLrfYa72eFf10kpdtrG46u/kAsgrYq79zoVKsmYL2Ff
 ptsLzqFncZOcVwsqehCdKm8KTQNg/PKtCzRS9742m2yFjpeNhJorSWi7opCKfGKffRSP
 0Bgq8qAvHnfHzrjZUZHDVGbKx1vNHVfOjnnZ5US6LiQ684aFzCKQm2W0mAQkVBsFFdto
 jFy1OChe2dueSJL7vXR5+CRAqS95AWl0l04urjBSQGYfdSHF7nh9P2gTWqBa/CXMElJJ
 APmurbux4xVVGgBDPvYv2sVbda7+rnDPH0kH5ditDlvMn6es1kjuqx0n8TDtxqprluS1
 sqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770791505; x=1771396305;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5VI3P8I4QXrt/D58wc4S2XlvSfUm8+jvHYdThYnzY4E=;
 b=qRnUODQFjsvqxn/7XhgJbksig0Cqj/iHgMoU0R/wRjiI3uS8lQSSGPogijG84w9eDF
 lYcwC51jfijUajILJA8pAEN+x1p27cNfj8KN01Ed8eM8q2LDJn+AZ2ScQEGh9NhvdZvQ
 3Mrf7J/smkj71z97a7w7iq2YxPhuu0nLhuLMMn9SqLFlfcEXnRl6TH+uLj0DzhGBMCWF
 tb3YQrRPt+mhYdiBohIXlC0nCwOzk7Bpx72vR01CgyEUdSgB+Y+AxFGm2qGqwkh8ORpE
 xU0/TI0bwQh9XrfoJoNgEtLhkKp2jp3lyqqoQedc8RqQ6wPRxRtOCgtYjY6WlkI0FHFY
 4G5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLyhXXk8bIz378WeLCboWAnsIkRIuJ5295KatguGmbnwG1T3jQ5xWhKcsiTQELwta9Vd7UXogI6A==@nongnu.org
X-Gm-Message-State: AOJu0YywvkpS9ADDCQEqUW3ks500r02DUzpVBds+euY57ExDdxcH5YYN
 FrhLoSTr8KrddgPOVce7gj2CYawA6kesD5KG5R2W9S2XQP0MdDy9WnraPw4PxEIdsfE=
X-Gm-Gg: AZuq6aLG2FUvwFaEZ4sucfP9vlT+UXSiQWpa09RFabTbZP57CMSvNGyAVFpNI18cwA7
 dbqyqXydmFQuvZ2hzHE9LTWLS1SRlJxrr4t/T4y5WGUlyhWVKJvEdq53yfI33YlNub9BtQCdRqQ
 DxB8kmin28fPYc05i4JmvpfQEK5fmk0DOTAkUPgpr7zFAvQ5DI6JoIjIualEMs4hcRPcAwk0cvU
 O5znPs9PwABmiDL0v1enLXkDtZe8clKpQFssYSMBPNVEwNG//FjxFiLQX0P1sNzISecUHWf0W/6
 jV07T2PWYNALMe3q5Qs7kUZgLT4MSJGTZ6xnueD3E2lari5MYCTjzPRkvia09fIUbnwVzMfv6Bh
 T3ukuKMet13OVaG+wGAN6kHNUYn+PLBwL48UBwVn+okmne56AhjS+qD+oKJqG8w6eyFsvQpH5Nj
 4VTEVRHfq7vj51P2psnNBATXG7n3OahLFZSD1TQi1ajNrra6ajjaF3pcC2TH3e2rJasbg2Bcu3j
 mJJNtpcmwJydtZQiwAIoHbV
X-Received: by 2002:a05:6a00:22cc:b0:81f:43fe:988c with SMTP id
 d2e1a72fcca58-824416107b2mr15625182b3a.6.1770791504764; 
 Tue, 10 Feb 2026 22:31:44 -0800 (PST)
Received: from ?IPV6:2001:8003:e109:dd00:f8f8:2c3b:9605:55a0?
 ([2001:8003:e109:dd00:f8f8:2c3b:9605:55a0])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8249e366a76sm984264b3a.10.2026.02.10.22.31.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 22:31:44 -0800 (PST)
Message-ID: <8addf5df-614c-4309-8ae4-c3bb59f7e0ef@linaro.org>
Date: Wed, 11 Feb 2026 16:31:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] include/tcg/tcg-op.h: eradicate
 TARGET_INSN_START_EXTRA_WORDS
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Jim MacArthur <jim.macarthur@linaro.org>,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
 <20260210201540.1405424-13-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260210201540.1405424-13-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

On 2/11/26 06:15, Pierrick Bouvier wrote:
> This commit removes TARGET_INSN_START_EXTRA_WORDS and force all arch to
> call the same version of tcg_gen_insn_start, with additional 0 arguments
> if needed. Since all arch have a single call site (in translate.c), this
> is as good documentation as having a single define.
> 
> The notable exception is target/arm, which has two different translate
> files for 32/64 bits. Since it's the only one, we accept to have two
> call sites for this.
> 
> As well, we update parameter type to use uint64_t instead of
> target_ulong, so it can be called from common code.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

