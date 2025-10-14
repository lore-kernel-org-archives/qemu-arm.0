Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1A8CCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 14:44:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8gG3-0000CC-C5; Tue, 14 Oct 2025 10:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8gG1-0000BW-FK
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 10:44:09 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v8gFy-0001b4-6D
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 10:44:09 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-77f343231fcso3384086b3a.3
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 07:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760453042; x=1761057842; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYZJtNgCjcmjfsgMyLVOO+zkzevH8rM6wiw8zu6DUC0=;
 b=UzbflceqNF9hpkICJXiMiVEDpOxMUXbosjulFX7k1Ufg2ZXxmB4VnKCm4KKIqx0N1X
 s8Vj+o0l+GCrvMJqN7+k5y1d+goNuD867Kky6eFrQa8koLF4PHj9DdtVQuCBjXvpOdXE
 BeV8RYbHKkJSDzkWccdP9LuL21Y8rnR/WYAfRXj84Vf0fOBxFrepQU7nJJVuFNJ1Byp4
 vzoOc0W37og0KCEtFhpj3otmZaDUrxPNU6K5lZL+m9z9pE6WnZpWko5nPBlYEiZwnWYq
 jPQqudjRt5zRW9fdCp4FC22JURwcm1mkvIuq4xGxV1lEzYsMZ2kpWHFBusU7uvy174Ro
 P4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760453042; x=1761057842;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYZJtNgCjcmjfsgMyLVOO+zkzevH8rM6wiw8zu6DUC0=;
 b=aZ7JUTkzHNj+wlViZ65NXh3YHRR5ZUlvZb8MgQgOKijX+UJfyTzEQj5vgOCwsr9QfC
 Y3+1CRBU5mmINZ5MCnm6XX/mZXUp/U6Zl4nf3knI8pqGk4cLMCIv9xerD9LJrt63NfGD
 HF9pSuV0I/p4yZGys+WQK9md/ClTQ2DsJ2G9bT7+itfToZVYfBqthpJ6GRPYJq3r5zgA
 3a5gpsTo6HVsaN+v+VF1k4g2Q0DiPmT4y0fugefRRQRC3MQY26XNQtecsjm72WOpxXmu
 e3Uof1eoKjkL+NZ9Q4JnA50om/qF2GuZvK4jsXdiQU5OX5FkYkY5InZaLTglbS9OsCN1
 g0EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxXFApRj53Lt/p7bBWOdqZO6rHb59G/AsOXzDILiC5zaifa8B8A84K9HJ7EcNT7YeKFmWNACDzQA==@nongnu.org
X-Gm-Message-State: AOJu0Yy4t4wUJt1Ejx4YM9DoQiEkXFDyWZJF/Xyj7MmtI+2ELW43AwjN
 J2T+ofpz9VDHkucMcVWJZRoPTtW/jOlyOJ2QNGznB+uDyW1AN9I9Xw6K6q91JiG/5/4=
X-Gm-Gg: ASbGncsXibaSV7fXohoNkAVXoPZqZ1x+SfWliNO71qXqczmHODpoTKcLbNPIWVQoPWO
 UJ0iS3rv2Ksv1sZvUhDuoxVqSqbeOmKACwh06WTES5Dg0v79PMqH7bpdH6AcAnMlt+FLmnnoqRk
 P/TVCFkQ3PO0D5n2s5GbJnMH7x48vbExdv4Eky4V4oMY+kUxxIp2MzxP/bAQzibMHSnNd41KsyS
 3RsA+6VYEsgMzdQTbZMtCCw+LZMAaW19M+FDDo6PW7+GgtCQNujXIMAkMgfOV+iZ8B11ipdcn/+
 fRVeYU/8nSz/kcScMJduqVomeNBy9SLuZfOqFLILvwMtZ8+EQMqZM7WVwG65t5SCphTV5lqqc1j
 a6K/c52kd4N7gmDgrH0S+3GPnBw3TNXrx9Q83b+aDc3oCgNrSk/A2JX0QAx+L+XhQ62Ib9A==
X-Google-Smtp-Source: AGHT+IH+xOsS/zU1/mrda3BhPPNrn7RuxQiTsdH7wy9qkkiCerwd22MnuVbOp/Ew3dq9jZCIy5vq7A==
X-Received: by 2002:a05:6300:40d:b0:32d:b925:74ea with SMTP id
 adf61e73a8af0-32db9258839mr19630613637.11.1760453041601; 
 Tue, 14 Oct 2025 07:44:01 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678d821159sm12444726a12.0.2025.10.14.07.44.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 07:44:01 -0700 (PDT)
Message-ID: <4a90e2a9-8acb-4ed0-a950-4cdb1ea69187@linaro.org>
Date: Tue, 14 Oct 2025 07:43:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] target/arm: Implement MAIR2_ELx and AMAIR2_ELx
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20251010201917.685716-1-richard.henderson@linaro.org>
 <20251010201917.685716-3-richard.henderson@linaro.org>
 <CAFEAcA8_cotLWg6GTc+TFRJCPwVDG1743TRcXmH+LLJPEpSbRg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA8_cotLWg6GTc+TFRJCPwVDG1743TRcXmH+LLJPEpSbRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 10/13/25 06:55, Peter Maydell wrote:
> On Fri, 10 Oct 2025 at 21:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Enable the SCR.AIEn bit in scr_write, and test it in aien_access.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpregs.h |  2 ++
>>   target/arm/cpu.h    |  5 +++-
>>   target/arm/helper.c | 62 +++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 68 insertions(+), 1 deletion(-)
> 
> I think we also need to set SCR_AIEN in arm_emulate_firmware_reset()
> for the "have_el3" case.
> 
> otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Oops, yes.

r~

