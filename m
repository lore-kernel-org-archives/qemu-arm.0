Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63014CCD1BF
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Oct 2025 17:30:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCi5q-0004NG-6J; Sat, 25 Oct 2025 13:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCi5n-0004MH-9Z
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:30:15 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCi5M-0004lf-Dh
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:30:15 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-637e9f9f9fbso5724008a12.0
 for <qemu-arm@nongnu.org>; Sat, 25 Oct 2025 10:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761413386; x=1762018186; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w0f03hOEp1gmYfEfGUxQnlArhFaVOTnFO28f0M4TDSY=;
 b=zxjYMkQaFSFl6h3s0+pLFJVPQZX17nojkQ/owonrT+xkpdXqciRm2iNT/eHYK+x4fR
 9HbyonegjVHYag0kNdI/1ntZ8MC9W7WXCrbTqPj8LuNzgsj7FAooKjyFtywebFNcSLPW
 4IfC144o+Am782ML9IGgDKLExjQwrwspw7HFnsxf9VOPE4t6PcSMA7KBCeFBCJdDh2nv
 Hk/qtdHpYxRMB7NLvuDcELl3koeblCTF6ee3kZgmnyVSl5TvmOLuzoVjLvFmbmvRB/Mw
 dOZs0og3KIEFUxJwCqpq4GOGqGRvVG5LUHnllj07DEuw78Q0genzVfKUl2deGwB/JhVM
 Vr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761413386; x=1762018186;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w0f03hOEp1gmYfEfGUxQnlArhFaVOTnFO28f0M4TDSY=;
 b=WNO/g8JpwmyAL6lxK6bMxzeABpSy5814/g6fuxRh5L4psUck64WNGqrcimtY9GRh5b
 4JeMKK/d8LorwCeAYHxF0NUO9InwWtvp77xMks6dgYDFxVnGxr2P6Up7EqZlTn0p5+k2
 ankjkATBTBEA3VqKfaAGivJ7u8d8DriIsE7dG/5TZEBRp9xKv9Hm0IAhudxD7jqyqgLz
 y7bq+YQLOYp3ZmpdyvASelv70o6jfH5zSXebmiezSRhAx1O4DWjwyV1JHPtY8Yj6ZxYg
 0gUjyZ7sFjZCV8U9vJDhy+mqW9Km/gtelWCn8QiakpIQR9yN+qFwBLFKQi6cGsq+HrYC
 QSVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfPXzLLJRkDNdRXM4+sBRW9PHBev21Hgw7MRL4kkRoYHI8UCANHHSnjjd7Dmp6s2pkOlx4jUh6Yg==@nongnu.org
X-Gm-Message-State: AOJu0YyCh4QNbHgImluVGNzPsAicw2mPFzMtvreE6kTm53Y3ZfSJyTh1
 LYbMaaJRY12opBgI51CcaNykRSWBjB10C7yok/PZUK2VvJehmvkj5RXTziP9kzO0YBg=
X-Gm-Gg: ASbGncsVO1F1EjbdUUVOYwUz7WA7O2LLf06L6WEmQhMqE4EEwcZ14quF193HwD3t94x
 JpSWndkZZz0H5BlJRvByaxA5zISCg7Du6EprCXVQtz1xeppol9DyrnB9t5amAAm5Vl8eEPPw2VV
 msAg1ik6ZzxVVriirZ7NcHiCRKNQNqC+mGHDXRyqbSV6ToUmVgZAt6N7+AfxH5JjjfkiPXA1fWI
 AyLgqYkWB964HTT6Cpr9tU4FFjyRkesl4WZRnWy0Mqo8tcreKbi8MeL5gO9R8btfBWOLNz1/lul
 NQsyqH9Urho+xt/6FcyHpKb/QyOEncEqay1RlvSKceNARR/ktMDnzyt4wdgpdTKY4XM9FyXEhhT
 W6uj/wjbMDNHVHk1bk8stW196UVwYAhla8/Zb5VtYlNsNfkrlQprRZ5OkMPoM0RbsQbMASyz50e
 zumGL1rUwlREeJpMtOLXcPd6Ep5GjW016N5+8jx9f20iLn32p9DeXBKEXeMPf++LvHhjSCKWlQZ
 A==
X-Google-Smtp-Source: AGHT+IGVO4le4lqEQDRHiNvaF7BB4i+X13/MevNdrWz8yx/9iYYuas9U3eRd1MOUK8E6+hI4gP91xw==
X-Received: by 2002:a17:906:6a28:b0:b2b:3481:93c8 with SMTP id
 a640c23a62f3a-b6d51b0ac76mr1208201466b.19.1761413386299; 
 Sat, 25 Oct 2025 10:29:46 -0700 (PDT)
Received: from [10.240.88.227] (ip-037-024-071-028.um08.pools.vodafone-ip.de.
 [37.24.71.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d8548ed8fsm255502166b.73.2025.10.25.10.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 10:29:45 -0700 (PDT)
Message-ID: <bb33e2ea-ecc3-4802-a312-57a664d1d283@linaro.org>
Date: Sat, 25 Oct 2025 19:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/58] target/arm: Share ARM_PSCI_CALL trace event
 between TCG and HVF
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Mads Ynddal <mads@ynddal.dk>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023115311.6944-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023115311.6944-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
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

On 10/23/25 13:52, Philippe Mathieu-Daudé wrote:
> It is useful to compare PSCI calls of the same guest running
> under TCG or HVF.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c    | 3 ++-
>   target/arm/tcg/psci.c   | 3 +++
>   target/arm/trace-events | 3 +++
>   3 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

