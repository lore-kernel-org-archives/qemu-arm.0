Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33737FF4923
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 01:06:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w715E-0002kK-5D; Sun, 29 Mar 2026 21:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w715C-0002je-AO
 for qemu-arm@nongnu.org; Sun, 29 Mar 2026 21:06:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w715A-00007r-Ox
 for qemu-arm@nongnu.org; Sun, 29 Mar 2026 21:06:22 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-35691a231a7so2272531a91.3
 for <qemu-arm@nongnu.org>; Sun, 29 Mar 2026 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774832779; x=1775437579; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oBAvPFBtDPTcfi3EF9TcmubLMO4vaVVbWRNnJEtv9/I=;
 b=sGnDG6BHuWnqUdYVjDNtdlZ+clYEyLuB7KymKZeaB894KQ4mm/Inf7egI9FgazrWgA
 eD2AEWmJZBDgsyBdBXXOJ94cY9hksiIbPorsmBS21A4k5jkroXBPvudDTDlAnC2j2RF2
 6Y++9Z9b73Qwiu7YMIqH0aTpc1+3n4o4XbFDjA3caUIrRVNLVgtHhLIWtF7p8VYe8+93
 hjGcLInrTRW7akeNKjfh8sFmMsJwhJlQvrKFlCvk7rJDx8n3my1wtWDiQEJyf9nn9gGN
 1gOeDaji/ioYlEnkCQAi965pl4uDWJKSw1sWQXj+3l/6b/NbmxEG5GLw5t0tqEFT2Zu8
 If9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774832779; x=1775437579;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oBAvPFBtDPTcfi3EF9TcmubLMO4vaVVbWRNnJEtv9/I=;
 b=gb8NtmBUP1YN+aPQL1vGgdhZ91f7KK5eL9mJL9wnLiP20O9/aBVO18iErcV2aLzuV0
 qk9wbh2EtXD7bUfqiEvKcgfZ7JYVPGLaTCRuKqflF9VVbU+S3yqCWpL4XDa/H0VYunc5
 axIty1sXpl/cfrP9tzX5g9ZGqvEJ0BWPXUacvHhMWaFkAGVCyP0B/nBOQFn7vsl0a1rq
 p0mE3HqlzIVL4iBSFTKkdMU0KIbjsGpq7XRck0WH6RBNRLbsKQafrXGFq65EHP3aDgWx
 zu7r1dLOUH+KkGJHLqiI5KmHR0Lf/hoTN1Gt06BTZGPoaHRwzi0kbCvAM/whQje+ZFNM
 Drug==
X-Gm-Message-State: AOJu0YxC5nUZQH3gRDxYfyhLwMldMp3rFuWFW8LeODuJsQs+GVUWjHuL
 07ALL+wRYfflRqHya/gzoEDFsltErJRuVtfSRgnsz6JCFsRPgXaLprY6s3LaQJVDJZ4=
X-Gm-Gg: ATEYQzxvP6XYF5NxOZQCLXe27UGGyYvdWbF4oi2lXBtd0VYeMsLWb4qKS3HWTCpqQ4e
 dr4YbEJ1frjgZDriWZUXRcth6RrDkx0HS2cdhwJqCmI2RUfn9pFGBWdYwZsPWRp74oHcJiFUB2L
 fh3LtSG/r9zbpRqZXOttLnxgC4JNnMdirJW0zJgklcvZXXK/ZwYu4qa2uwBMhbss6dn1E0JoUAa
 RAEZWOj9Tnfm/FjcfXywsvsgP2VkABm6SO8ZdPbTLqN5deIUP1EyiCWsqNr9nvwDuUaQ0Zumy0Q
 IF037XcWRe/h4p5E2GacHJBzt35p5jfvCc/qVAplT+2Sowgb+m/11VzHaW0FC023yP7e5Mf9Cwv
 8K57VW22XF+JVlJqpRAq4i5EpXT1DvaIdyVQuVgEjOY4yRyt9cEaQGRXEUrGEHDNPHPewHDdGgR
 Umfl6l2P71osEwHCKBLerqxvoFfgpga464HvWEW9M=
X-Received: by 2002:a17:903:2408:b0:2b2:54c1:2067 with SMTP id
 d9443c01a7336-2b254c120d9mr11605065ad.21.1774832779053; 
 Sun, 29 Mar 2026 18:06:19 -0700 (PDT)
Received: from [192.168.4.112] ([103.73.85.112])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b242642887sm67920925ad.1.2026.03.29.18.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Mar 2026 18:06:18 -0700 (PDT)
Message-ID: <adafed36-b654-4176-a519-f6742c4eaba8@linaro.org>
Date: Mon, 30 Mar 2026 11:06:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] target/arm/tcg/translate.h: remove TARGET_AARCH64
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-5-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260327165042.604105-5-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 3/28/26 02:50, Pierrick Bouvier wrote:
> We need to stub a64_translate_init and gen_a64_update_pc.
> At this point, we don't need to do anything for aarch64_translator_ops
> since it's just an external symbol.
> 
> We can now include target/arm/tcg/translate.h from common code, since
> all target specific bits have been removed, or can be specialized with
> specific defines.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.h | 10 ----------
>   target/arm/tcg/stubs32.c   | 17 +++++++++++++++++
>   target/arm/tcg/meson.build |  1 +
>   3 files changed, 18 insertions(+), 10 deletions(-)
>   create mode 100644 target/arm/tcg/stubs32.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

t~

