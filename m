Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090C1C79F9F
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 19:50:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4kln-0001DP-Nd; Thu, 10 Sep 2026 15:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4kiA-0000JW-LD
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:45:38 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x4khr-00006b-Pu
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 15:45:16 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-398c1101c1bso134834a91.1
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 12:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789069510; x=1789674310; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=GqivVmMpwc2GZW2PB0TD+5B8CidEcEzCnFULwWTubzQ=;
 b=vAVUSUQgtshHz/TL6gs3zyj3M9D/3W8D9o5l20wK0Bvqh0ry0IN6ZbugY2vVybi3Aw
 UWSKY4Cj4H/RC+ooUjBrjSZcaAsodx1rHid0+wOTpBSkmCEnkhNYfiC+3OWQdY/1Q3B+
 Oiwtl4r4zE0myxccZl3BMe/ooeBWYvrri9n1kNpR8RYamr3gV3jYc9xPUqz5i0HmolWN
 1O4cYPzFUjHFSr4OWD1YBfi/POGNRHwQT16f8+FZsO6E2DSsc7Z2VM98jzIfsNtw6CTU
 GnrWpQm36D88AIG9333T+yq1mZXMVV0vG5xeFMPmGSFZmAcRMUkLePrgQA3+rpqCjeqY
 iiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789069510; x=1789674310;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GqivVmMpwc2GZW2PB0TD+5B8CidEcEzCnFULwWTubzQ=;
 b=SoQHiwcAb67s7Hf4qPr+ZbVfqna5tp1KUBN2wpaBYY8tXsa+P0xqhjtiV+sCCexSt4
 G+lfygoPdXN7DfOiIwO1g7zLmD/9yNJtHQPDOhBfDHORHI1p/MQGEAnPYKaD6k1ANOoL
 jcdvm85AQRIga+CmqEe3wvrYEdtL3GbJKgEqG9qeA9Y3hsJXJdtkQTO6Kzw5uvKnEfm+
 VN9FNXGSdIYNJexAegMGZFdzaz8rw3nt7lZNQJHmEqpHl3BVw0xa2VgEIhmMGwj8vA1i
 IO0rVRSdQau/C9T298BdmwsTTpstYnKdTxB9AqQlvKiU01sC0bGofafTJOEvk86wf39z
 sQBA==
X-Forwarded-Encrypted: i=1;
 AKwUvByWHL7CtlWDHAJk45Kz3GM1mYeDsxdYa3oYGnPjc6fjS9lEvGBtbcQCNT1NXRPVKaHrhBoEKG/n2A==@nongnu.org
X-Gm-Message-State: AFuF++mMmpEhJQGsChfZRBLtflT/7m4tyhHY9ds9/6k4nG+y6NhG/Bce
 iq0D30I0Ifg7DEKYuJj6GGjee7+Gm3gu4AvLMOxC2epGbgNMiYmaPico8aYeAIWB6JY=
X-Gm-Gg: AYBFou2PKVWBHEwnfQzP+AxBvtfT/texczoAHq0XVaSBNuDvpneBu95yNdlkTQk/T0J
 mVluB9/Pw5wtqhFcswFKeq+ECPqleh/ljehBy5knNNd1xIcBAsFD/hgFoenz2EfgcE01y1XiSAq
 xSdWEJuhAcb26N0bgQpn2EjxZUarNkC4DfhOVcXoHB5IBcW7wNUH2AdVyjjTweV0QRIN5j2obs+
 uXbYVcfTQJtlYfEHG5TgxtStgcZsC9QjYEdY7dl0ThuNCT4CU01RrrsOyhvcieMyUIzuyYD4VBC
 ctSziBVFyq9C+HhP6vRsg4TWTsf5AKcBscgudNEXXE2qV4dOHpvYxZkUP5/XU9+qJ/J1sAtdH87
 jcjr8EAh6DnhAfgnc+jD5OiWocYglFl5cdmIJkuxQ5HPJrhMP79Ul587c6TBqEWbOfZQ3Lm6+bi
 JJDBK0hTU+6/Ujw5A/qYm5W9wNx1d+5h6TY4b17M3IqzgaTAfWnCLPnAUyziCFvMlI5sF1oHCOA
 /8iXQwww7/VSkA=
X-Received: by 2002:a17:90b:518f:b0:38e:97f0:aa4b with SMTP id
 98e67ed59e1d1-39d9c1bef27mr469736a91.13.1789069509651; 
 Thu, 10 Sep 2026 12:45:09 -0700 (PDT)
Received: from [10.171.0.227] ([98.155.112.169])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-14365b8f1f7sm714469c88.11.2026.09.10.12.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 12:45:09 -0700 (PDT)
Message-ID: <c21f39f6-d6db-45ad-81a2-c03771206705@linaro.org>
Date: Thu, 10 Sep 2026 09:45:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/21] target/i386: Constify CPU*State for
 cpu_*_interrupt() getters
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20260901095229.72018-1-philmd@oss.qualcomm.com>
 <20260901095229.72018-10-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260901095229.72018-10-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 8/31/26 23:52, Philippe Mathieu-Daudé wrote:
> x86_cpu_pending_interrupt() and x86_cpu_interrupts_enabled()
> only read CPU state without modification, add the const
> qualifiers to CPUState and CPUX86State parameters.
> Simplify directly using cpu_env() in x86_cpu_pending_interrupt.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> Reviewed-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   target/i386/cpu.h | 4 ++--
>   target/i386/cpu.c | 5 ++---
>   2 files changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



