Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896F2E83040
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 03:28:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn75P-00047x-9Y; Mon, 02 Feb 2026 22:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn75M-000476-Hx
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:28:16 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn75I-0002vM-8a
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:28:15 -0500
Received: by mail-pl1-x643.google.com with SMTP id
 d9443c01a7336-29f102b013fso53941655ad.2
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 19:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770089289; x=1770694089; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kG+g41jHxy4QfHPhJ8v/fkwcQN8tia4kNhB6JwYbXVs=;
 b=VKjg5gZr6trkOr95RtEgatAmkPxbr2bLb7ReAutLYXNX1z/qeVVHwDrC4a7z+RFoe9
 DU9Bz1kuzzE0xaYguuXchO3L/L+XFaxp7tNv7qP0aYD2r70+veCgzFZ6drpN/fsihI6T
 dg+i5c9/UqX2h0bpUAueU8bCJkEpXHeN9meRJ3O3guRcaIOMCIDCze832gVTnQl87vvw
 eREDjKAEz6/eRj6W3bJNrZIc4FzRjENPQtenjVCmL7YRMr/2MrPofcAsV44SlsTGQnl3
 Q+6/4eL3ieLT8vWWaM5hJdnrAK5ivDVMS6vAJBB1tF3aE3cjjwEcSM7KDMf1zM7uUnGK
 yA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770089289; x=1770694089;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kG+g41jHxy4QfHPhJ8v/fkwcQN8tia4kNhB6JwYbXVs=;
 b=I8NDLSPMKy4Ov9xC6wHv0N+pvDSMjMg2GmJ2KRyLKp7hGvRESGxYGlCc195sjG6E2v
 Hhs/LAaB6K68ak9hA2ebpFUAdt0bszHp5dPlJSh6JZNdZVyjTBA90ObXu26g3goU93+d
 KvP+87tS6VEKJMZuXHKMatv9B57kVY45HBcxs+CzHmuvtHfEH2pDzOL+r5Yp7CG0/pOD
 GWx+Rke30hh2TWXj3HxYMdCiwDuPPXLz3nHtEiN/eaJXBfjrJgb6yu4Fp4tuBs5QDBpH
 XXpnpayYSW7mznGdE2hUwjCymamYnJDVdgxJt8ASVxqT9qSdvUgIjT2jcZLUqGwzB5fR
 p8Tg==
X-Gm-Message-State: AOJu0YwRiDLtDqAFT2iGvRmYN4FshPoSK3ekVhAfut0ze95EGguo+sB6
 PQATrAOj0Xz3tnAjzwxNbBLc5s3RyEWsfHD9gy2+oJ9hHTCoqwsQMxk2KpDo8W1bC6kb+8q9Vhl
 x+MSAFDvSAHfN
X-Gm-Gg: AZuq6aKA9RVxuw743hnnbHpplvarkK+kAuJBz893r/lyrYwDOr3bAptOkSZTjmpQ4cf
 weHLipj+jk/4X/ZlwOOluAWO0anKDyAdsa66QJl46XejUzEr65uWXvHhaWkNkoxdh2qDf56oUpL
 nShUP2J8gWNlrSuSC04KdOXToHDlSOuC5/0gemzcN0x3YwWFEM6EGsjK1mu0776otXyg/JTe8cv
 7WZgX6w7KLSSp6lQG+JKPqysp7P10ehVKUzjfpaKIe1oiQilKj7NsX9RCJUuAoeWXdDVbUxwuaA
 oe2wuwePZvSuMwTJh1sxPPSoKo+Cv8MtWTrhx8JbMkvw2yauBKrM47zEQzlC5fzvtSTNKrThhIN
 n7L2HX3fv8igxgqbvaIcV89nrGlXmx2QuUt47zXvqxoRmHUoODQsHQApMMVR0SgyA5WeBDAvqJ9
 kXzrDdSFDrPrn293sx6sE3TPuzuAqUwK8VT+++whV0nH+8+/lG4QG6QAJEmZ95f4gSeWkNI9dPa
 /l5ZVuLeAle+brUS8BA5YmYk6bZLCtWMgKArvnsRA==
X-Received: by 2002:a17:902:f552:b0:298:5abe:4b1 with SMTP id
 d9443c01a7336-2a8d99469cbmr151102455ad.52.1770089289424; 
 Mon, 02 Feb 2026 19:28:09 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:1047:c02f:591b:6a5c?
 (bg30dhzn7h1zhjqnvj08.ip6.superloop.au.
 [2401:d002:dc0f:2100:1047:c02f:591b:6a5c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b4163b5sm153423025ad.41.2026.02.02.19.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 19:28:09 -0800 (PST)
Message-ID: <c04ab010-f8a9-4157-987d-a27c0a1744c3@linaro.org>
Date: Tue, 3 Feb 2026 13:28:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] disas: Have disas_set_info() take a const CPUState
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260202222412.24923-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260202222412.24923-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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

On 2/3/26 08:24, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (7):
>    target/arm: Have arm_feature() take a const @env argument
>    target/arm: Have cpu_isar_feature() use a const ARMCPU object
>    target/arm: Have is_64() take a const @env argument
>    target/arm: Have arm_sctlr_b() take a const @env argument
>    disas/riscv: Make rv_decode::cfg const
>    disas: Make disassemble_info::target_info field const
>    disas: Have disas_set_info() take a const CPUState

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

