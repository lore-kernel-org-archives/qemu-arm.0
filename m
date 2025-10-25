Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6693CCF9E3
	for <qemu-arm@archiver.kernel.org>; Sat, 25 Oct 2025 17:02:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vCheL-00061J-OR; Sat, 25 Oct 2025 13:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCheE-00060A-Dk
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:01:48 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vCheC-0001Cg-DI
 for qemu-arm@nongnu.org; Sat, 25 Oct 2025 13:01:46 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b5c18993b73so563774166b.0
 for <qemu-arm@nongnu.org>; Sat, 25 Oct 2025 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761411702; x=1762016502; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=irJSfyjGdaIOgXdD0ZecVvdKEMFsg468TsxzlXPl+ng=;
 b=RxEyiUsaVaOhx+v48G/4UuioUfeDcrPBBMsDnjMtUm8KD6imkOZ0xyrWuoSLqx/uJx
 8H7pFYWeFEFmAPyAU3EpglYeIvxKx/pHz5rKhFlCnQXMrTeE9cB8MafzDf0gwXalqvov
 kZ3BHAQohu02SpqDiMM25x1v/GRz4VgsKAUL3mVbmQUyig9qre28EHoIjJCsGIlwSYhX
 tjkXcIPSlE7C8COCR8OigDLlAvlYOAc0Y1YPSpo/l88Jis118YXWors5CgvSyUSzy1S8
 aMfDEQXoMcC5N7KN3BeSTi/KreCyyFHktVdDJqbL/wDnSsIDFqSznmG2X3Z8iaVhgJCW
 R4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761411702; x=1762016502;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=irJSfyjGdaIOgXdD0ZecVvdKEMFsg468TsxzlXPl+ng=;
 b=DuOcXH1ufTtGIsWHhIfEF5Yt6UNAsvgMG16X89B8DojBGd+zjEWi+vdD5E8VBjEXuj
 Xm1X0TsdX5eUKyw5NlQVCmAn7QtP29CGq+70cI1hkdzUAlezZ75QecOglEcTUWKp3pVE
 4z0dZ1XkU2I1f2g8+sO75NbRCSApEKhwZPqduH4/RsSsmOnAJkkh+sbg616fAEn5IBc/
 dPokD5fLYYmVq/1SZvFGkwlUplvPsyuS3N7yf+Yyk81tbQSPWH3JUB2eU8bEXSk0Ah8O
 8IcZ+zwMKwOgokKb2u4KgVy2KHBJ601HfYcPn4WcaVM/OABVXvNFvrl2AloR46bputjT
 MD9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdbj3BwF1WZW4lrUwAU6F/+izcauDZWIcrhxDG04YHmiHLOLO9IWA8YHJu+RgKzXb4dKyQfcoE4Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw50OiluSW/dy4EFaRDOpNkpfBBCfJQ/rLCRWGn4vb5aAGcyoE2
 6GvVnP1CoFQNjXSRI5caUl21ykJi2bXzE60pbmzMyz1F/7BzMs7/luHtuU2zkNgN6XM=
X-Gm-Gg: ASbGncsjNTpn7ug7I0gQ5CBfLRw76UVYyRuNhCJ+jQ93FAlK0JRHraXorxuLSpDlwck
 oP8h0xAmsE0KzGeDRqiLoBsLoMAUGEUxJK0BTrk5/jXv7XzlPw1VZeaoNb92HKF5d8uscQfQ/Lh
 mxUgrSKfMJSjUnmCSnTjS7wF/SHoQrS2DfZxRn/UZZJSxxIdyPec/ZpMOhrP34DC4CAcbDK7iUf
 D0U/oeepz9c2A1PkKrvceUaFOXt8tYT8r+4nVE5fF5RJHeVYmB/EUIla3Jvud2HNIbYk8CU9omc
 quTsu+84aXqtK/gW/fmg73WSc/MjK6XEccusc+//BgnxjNjdS9dWl5s4DVQGFGgSxrDxdRyKXl+
 rLvFoFCZIaQ6wbL4JCXwJvL2QsmdTDBk7Il4eSGhQOtP2CEBb5mKRP6SjUYG8gkSBLW5sy4/rXt
 ZFFb6Uhhq09T3Dx8R2mGfJB5+eAvwGrVUGxH7sN1IX/lwY/LsNPsEpy0DO37G8fov8Olen/fW6Z
 Q==
X-Google-Smtp-Source: AGHT+IEfKoDwrv7T0zvwFfTFYBBkF5m3A8t1kq5C43URmHiuwZ6mMLud6u5TviiHCdfHxmNeXau+gQ==
X-Received: by 2002:a17:907:9445:b0:b46:31be:e8fd with SMTP id
 a640c23a62f3a-b6d6fe02ff0mr605210066b.26.1761411701535; 
 Sat, 25 Oct 2025 10:01:41 -0700 (PDT)
Received: from [10.240.88.227] (ip-037-024-071-028.um08.pools.vodafone-ip.de.
 [37.24.71.28]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d853e5138sm246018866b.44.2025.10.25.10.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Oct 2025 10:01:41 -0700 (PDT)
Message-ID: <5749e246-7a61-4f3a-9b98-c4caa6bfad84@linaro.org>
Date: Sat, 25 Oct 2025 19:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/58] target/arm/hvf: Trace vCPU KICK events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, Alexander Graf
 <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Peter Collingbourne <pcc@google.com>, Phil Dennis-Jordan <phil@philjordan.eu>
References: <20251023114638.5667-1-philmd@linaro.org>
 <20251023114638.5667-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20251023114638.5667-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
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

On 10/23/25 13:45, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c        | 1 +
>   target/arm/hvf/trace-events | 1 +
>   2 files changed, 2 insertions(+)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

