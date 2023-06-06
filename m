Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3542398ejb;
        Tue, 6 Jun 2023 07:51:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NfoeHs8IMShXJ4n/6X6Wyp2qCD50jDImP46T7zEPTKTNlHLIByOoSSMyN6A3VENcjJWIK
X-Received: by 2002:ad4:5761:0:b0:625:aa49:c346 with SMTP id r1-20020ad45761000000b00625aa49c346mr2954328qvx.58.1686063073061;
        Tue, 06 Jun 2023 07:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686063073; cv=none;
        d=google.com; s=arc-20160816;
        b=b4UWHohhLunaJyllD4Jw28ADKbhgY3QQLgc7BYdz7SMP6vcR0+OcHeq/YDNas04LRa
         GKVdElL30x0DEpgur0sFBCQXB3Mups/FMrIwSkOLC92zftjeMskXUd3QS1RX9DjKfqku
         hc9rw/pwiTvyZz/mvwbPfabdrvQUhzkRCKK56cNZCYbJikiVMPnadcLzXZGmk8w9/FxU
         xob6DSv588e07/C2JQZg+SJvWWFcEE2H1MymxOMwu9WRV77sZpqQH8TMrBdjcUsCXycV
         QmXWH6Uj7z43D05QqotMZrPXqavXf8ZjuxpBMYdT4ZCFMIhaFIGN5i3IHU19AgehuG3h
         8viw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iuTTBRWkeR+Ed3K1IAJ+XA4dLPW2gUwM5GDgIojeyl4=;
        b=cYL2//vcUbTcfqP0n0lIkOxX9StWK+FMr8DpmyQ3cu3SF/i3uoorI0nuT9MSkdsCAv
         5r6F+RfaH30foXxYcqym+x9PyR2VXZUB6h5DV1j9ysMqLqeL0UUUvgv3+PWcE2ySBF9w
         zf1Lprs0OcPxYwai/LRtVFqYb8sliklneDKAI7iHYIG3LzcjN+Nr1DcAeS/wFeO8wNzR
         T+zoVW3Is/R4bi/4URR4TdunqKts0WWgGUlm0/4mQ56rntr9XGC900U5PJpfvRlMDdeq
         IoOeSCSA0k9DtJVk6C932qg2kY4a9YSbUUd+/bVp9MwSMqvlU3IjAElw6vkwr9Z/8V6t
         xePw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qSI4aX/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl26-20020a056214519a00b0062529d9a496si6200983qvb.608.2023.06.06.07.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qSI4aX/7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6Y1H-0005Lj-HU; Tue, 06 Jun 2023 10:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y1F-0005Bs-0t
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:50:45 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q6Y1D-0005FU-64
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:50:44 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5428f63c73aso3103685a12.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686063041; x=1688655041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iuTTBRWkeR+Ed3K1IAJ+XA4dLPW2gUwM5GDgIojeyl4=;
 b=qSI4aX/7QBQ/MF0alrtZXeEt6ak+w9ZejDjWN36aCzNXc3Oe5hIhaUBL0dpZT+HS+n
 YqrsaKxMULdjzGNeom//Xn8BjJBsuV3IFFFD5h/LZqhTLClu2/LP3xp2s3cpJXyRhdy5
 gSVxffHXjqKIzmp4PeZFReP01wf8J8xOTWtufqAjE/5GhffU+tIx2/K0NHdIPqkHfj4L
 7bv92gp2uzxTpT9zOMDueAcE5x3/R5QGCTZqA5fUF/aZcDyvAuRBzlsZTxLZfRZqMbdh
 OGHpjqWgzgvP7lgz6PvEiqM3moNMjC2SY9PqCYxyuSgRyJ53U0y0yZZql3vq/mjPgLYQ
 CRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686063041; x=1688655041;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iuTTBRWkeR+Ed3K1IAJ+XA4dLPW2gUwM5GDgIojeyl4=;
 b=FB+w94ux9/R1cG19tu8frFsnbHl4uVW4hTXHO3ggNSfezh0i5LxSiq9Hu2Kk2bHAUz
 0QHMzXnR+HDi6E5CtepXF3GhycpfLvNhtzMNnnA1UQbll1B9HRIakWdSvAHiwlwj7B/J
 EGaTViel8yIgczA6/hOxdT9DJN5KIzYU2xW/ez5EParxvAbyz8QTMPXQJ1ZPhd5yKect
 capLUlR74GgWI0aDS2LRC6Hs3gPUFY+3u09fezXJwbS41sA3pQbskX5G8jcPxFcX9a1Y
 bMqEg5XZ7AZaVDfOpXw0XYkPqJKvB8WzxjH1e/7PuJiRTJNKy5mU0q4x6VO+WTN3bOH+
 EB6g==
X-Gm-Message-State: AC+VfDzXwzSq+THOB0eH7QeN2dw+bHcyYmFy/yByDMHHsoL5GfdqMhvB
 FBIzOx1WkjM2ZCkpWql9TcHS7g==
X-Received: by 2002:a17:903:25d4:b0:1a9:90bc:c3c6 with SMTP id
 jc20-20020a17090325d400b001a990bcc3c6mr1347359plb.16.1686063041145; 
 Tue, 06 Jun 2023 07:50:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:b7fa:ce59:1445:805a?
 ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a170902ecc600b001b00dae8771sm8640308plh.201.2023.06.06.07.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 07:50:40 -0700 (PDT)
Message-ID: <d95e04cc-0cac-67f9-e9f2-5438c49d54f9@linaro.org>
Date: Tue, 6 Jun 2023 07:50:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 5/9] hw/core/cpu: Check for USER_ONLY definition
 instead of SOFTMMU one
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-s390x@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
References: <20230605222420.14776-1-philmd@linaro.org>
 <20230605222420.14776-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230605222420.14776-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vliYzeiqzqGu

On 6/5/23 15:24, Philippe Mathieu-Daudé wrote:
> Since we*might*  have user emulation with softmmu,
> replace the system emulation check by !user emulation one.
> 
> Invert the #ifdef'ry in TCGCPUOps structure for clarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h         |   4 +-
>   include/hw/core/tcg-cpu-ops.h | 102 +++++++++++++++++-----------------
>   2 files changed, 53 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
