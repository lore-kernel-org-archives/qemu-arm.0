Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066C5CAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 11:29:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1kA5-0004OF-Uw; Thu, 25 Sep 2025 07:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1kA4-0004Np-Gd
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:29:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v1k9z-0007dU-Kl
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 07:29:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46e2c3b6d4cso5260605e9.3
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 04:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758799750; x=1759404550; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2kjqP/T0aAKnXWDCWagYfiH+NQyxKDWzpeUyQu3sm/M=;
 b=Mmuv4FmHXuk6V01sxGR6wsL4UIxWWu8X/9PdYg3cz86IBVj5gw8XaANNYZ8S0cON3N
 9bMEZLMFyMM1ZRRqeo9Dq88946QZgT0epdBkeC9i0bzn1QMEpJfpuRi2aYP1Cc1kHmYU
 j0sfvY/PA4P3WPkQOHo9KgygquWzzPQWtK2X7A0HHnT/swhcNU3wEz9td50Lq80bsMPG
 OlZWWAf+6Oh9iF9qVDX0gWsM07CpsxnswePvlQCtapphM+A1rF7qtcGni5yzXhaVRFW1
 fPrwiq/XWKt+9TZoXzc5tBwWx1g93lnWWdQY/1WKVGTVhFXHDnrx3BLFqaRTbxcsBZFm
 RgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758799750; x=1759404550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2kjqP/T0aAKnXWDCWagYfiH+NQyxKDWzpeUyQu3sm/M=;
 b=ABfXydKB/OTHJ1KypF9R/Hp0hvKItVvC3J0ehqL8r0Uv8REhZzx4UGIKR1C/s6kTEQ
 KwqlXu/h+q9BUmN4xwkjL8fl1BGW1TKkU+04FbjLE6lrQQhV2ZVblgbM04jsRi1NGJDZ
 aLpRyDTiorVxHJ0tOEcg1Jq5W/65yJe1GWgrmdc9eerjIwr2eZhjBYlNwjVGHyzGnoHR
 FQB1AiFeUU62EE10rWh8XSsKZcJJ9yy8/bHhtvemX9jKvfdXiMOep2XMD8XFbkBzdEbR
 c7rU+cABgGlIVUCcXYux7ecMzwuig6YHyWYY7+di+mB6iBV/ZMCu4BQo0UndN1G9HSLY
 hPDA==
X-Gm-Message-State: AOJu0YxJhvrgj9BlNjBxqPgjXf3TR6dx0zqbCxeYFrl25NcyA8MR4BO/
 WH+ZzoWMvd5TiXHNlsejnOjIDsuYZmL5pZ8Wc6/lUu34tDRXYRmTG+O/g/RIm2Qhj70=
X-Gm-Gg: ASbGnct7/D7LSjuOPWoX+zjctEfuUOtJCafxNnk6/mhc5Q6qZ/AyCP28T7akqzDb1mt
 g1MRfUbz55f9LxpDAPXdIAi0LpF32r3D2T/k3jX4YRKe7wAoAKQTsekwwroilhA4QKza8VcqURs
 M3xm51hUoVxDmo4yMHj22ZnGSub0qrxwHDQ7IMUumK5UWaP4GrsjGVAfpwOaM1LmbjF95yheq6X
 qXQaMpuUI9FnYDkuijyq3lw3WScBrSUTXXy8Fvn9+407Ipd+w8KbIvcNGVDNLNvYbpQZB/WasH1
 xCrAOIUKFDUpFrZ5qWhmsTU9u+LbjqoVAS4GZIaPsSCOmyJUJW0NQw8GUCBLi7ChjxZesXgO0eb
 UGmf8AQl8qNueGcYf6AKLWq0HGSqIFNnm6F3n7fGc3lWyJhdspnsrbVGqEHiVMNGjQ8YWU84whi
 +k
X-Google-Smtp-Source: AGHT+IGmptrpcotGLYpn/sK0VRLVzmvPzJP4F1tXCI9eGvmk5c/ZqWERik9eSAp/p86qHlKz0noJiA==
X-Received: by 2002:a05:600c:3ba7:b0:46e:34f9:993 with SMTP id
 5b1f17b1804b1-46e34f90b0emr21060375e9.13.1758799749974; 
 Thu, 25 Sep 2025 04:29:09 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e2ab48b40sm72014785e9.19.2025.09.25.04.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Sep 2025 04:29:09 -0700 (PDT)
Message-ID: <0126273c-4598-4a0e-b86a-da4b742bc30b@linaro.org>
Date: Thu, 25 Sep 2025 13:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/36] target/arm: Rename TBFLAG_A64_NV2_MEM_E20 with
 *_E2H
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250916142238.664316-1-richard.henderson@linaro.org>
 <20250916142238.664316-32-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250916142238.664316-32-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 16/9/25 16:22, Richard Henderson wrote:
> Install e2h in tbflags and compute nv2_mem_e20 from
> that in aarch64_tr_init_disas_context.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h               | 3 +--
>   target/arm/tcg/translate.h     | 2 ++
>   target/arm/tcg/hflags.c        | 8 +++++---
>   target/arm/tcg/translate-a64.c | 3 ++-
>   4 files changed, 10 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

