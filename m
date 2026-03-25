Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2516DFEA83D
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Mar 2026 09:55:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w5Kwy-0001oE-L8; Wed, 25 Mar 2026 05:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w5Kwx-0001nk-Ba
 for qemu-arm@nongnu.org; Wed, 25 Mar 2026 05:54:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w5Kwv-00068Y-Uj
 for qemu-arm@nongnu.org; Wed, 25 Mar 2026 05:54:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43b7481f9d3so2039268f8f.3
 for <qemu-arm@nongnu.org>; Wed, 25 Mar 2026 02:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774432492; x=1775037292; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HM1F/rvL+8KHdfyd6SSP7D/TKs/zH3ofyYeFYdVTmlc=;
 b=k0oe7g4FE5mMCutMfdK1JT25W2VqX8Ty1NS5UycRlo45HjCh/LEpqOQxUX9Cwbe/HB
 C80GC6V2axnNmX0AR48I55+hUxssYCf95QbBAtVTACqqkYhHpCFkASa45j4Tp3efufSG
 BD2AF4hZb2ngKb+lXJnsB0bOsCoXPjWKNogJB/ByBiYzgYbOT86wFjwKNTswe++Zvi50
 vQz22zhibfd8tV9bmKGLoIVGmYyt6JByx0rP+PdZmC8UzwdgQzlAIMr4crVgZVeZqoks
 KoIN9QmbF6hYJZH0VVQESm8DR0AAsqnz2KEFuSditC343Y3sht3tV8MBIRBryIpgZiFF
 CGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774432492; x=1775037292;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HM1F/rvL+8KHdfyd6SSP7D/TKs/zH3ofyYeFYdVTmlc=;
 b=ViCXVTpkzP83NqTaJx0yezDjy0x1/6xCMDCECFBB4Scu12t0fsJcSTN9dWl1lNPmUk
 qrIZyvE+N1d0tJxTpNWhBDO0JCyqO+KtRbSNB9cuue9JDQFq9aborclo7QRWemtN3IWN
 sYN5bv/5OPMfZ5UDDZDw52ofXg+32kDkpwQJ1FCPIfLKWUnCvp6UFb0m+Oz5cjNMk9Uy
 Ym/SRipAxB6Ls6vyDZgusiOwi6puhX2otxm/bc3XkIyEpl+UeRm+bI+0hPvK/5wC//BO
 PdNV+LLSgSj3aeBxc95KXmiq4mQbsxsOi4e5JUy7FKxEWqkMhATXPY3VEZIzph0aETbY
 aEDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnqUDxYcsdmNz1hYwUV0XacvV/5+hAClBv2Kd77pgPDCF4ICZIdE8Byq9EdyDBWXOGOwNNt7Tnyw==@nongnu.org
X-Gm-Message-State: AOJu0YwGMbCgSgTpYhmEza1ZcP7qzWaFfw9HaLw0cFQI4wlYRUqhVNoS
 w1kNFZUkvX56YQjov4YmJTjLMNhsWhMcyCPjsHHtkZYqgV9Xg7pOJ0ZshVzpKIomQwg=
X-Gm-Gg: ATEYQzw1NixUFAVPrEZIxfPEg2V0bVJuF8o6LmFVdxVm7xp/0ttQ6haCcVvQ44RxM3j
 crVWElcf3eAezIKGyUlwR2YHLM/LdOYpzcpgFg0BURLzdo0ahFjXTetJFU9h2gDdzl0ZBAiVtBO
 WzdOZX8B/Vmj5J7zqANbAbgoD9y6+WB4+3Vu70P5BghXs4ScVNHGmC/ZhRLZS7hDk7Lrnsehzzr
 bKfafhQNddok1kvsnGkLSE1K23tu4MsvNyu3ALzWPlj1qky/dLz/XooJfXYXXMoqD4P0XYwZoto
 d7FP2Um5Yu/B/cw4WjYmjxxJevJ3dRxCqs9ItbAspUnjqXnTglhE7D8W4BhrJ/PjuV1ymRo7bzx
 sgdPkZgCqefpr9sYq6gAZBoQIKlZSkzHOe93Qfr3Q58fqAa0ixYqEvJdqgIBWuHMMSlm8eC2cvI
 hAE/uHic3B/9fAxMTdHw7Pid0YKwYshemtAG0m2w9L6HKaVs2q1MFCMf0PVnSQkECthw==
X-Received: by 2002:a5d:5607:0:b0:43b:8f38:3b88 with SMTP id
 ffacd0b85a97d-43b8f383bf7mr1020345f8f.25.1774432491926; 
 Wed, 25 Mar 2026 02:54:51 -0700 (PDT)
Received: from [192.168.69.206] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b6470f902sm48761476f8f.28.2026.03.25.02.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 02:54:51 -0700 (PDT)
Message-ID: <447a220e-3058-44e8-ad77-fd4edc793baf@linaro.org>
Date: Wed, 25 Mar 2026 10:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v7 3/7] vmapple: declare it as an AArch64-compatible
 machine
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Xu <peterx@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>
References: <20260324204855.29759-1-mohamed@unpredictable.fr>
 <20260324204855.29759-4-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260324204855.29759-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 24/3/26 21:48, Mohamed Mediouni wrote:
> .interfaces = aarch64_machine_interfaces is expected for
> AArch64 machines now. Consider vmapple as an AArch64-only
> machine
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/vmapple/vmapple.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

