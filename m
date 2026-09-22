Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10C4C982FA
	for <qemu-arm@archiver.kernel.org>; Tue, 22 Sep 2026 18:47:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x95X1-0007W8-FZ; Tue, 22 Sep 2026 14:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95Ws-0007St-8F
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 14:47:49 -0400
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x95Wp-0006xC-TQ
 for qemu-arm@nongnu.org; Tue, 22 Sep 2026 14:47:45 -0400
Received: by mail-pj2-x0f.google.com with SMTP id
 98e67ed59e1d1-39b910bdf2eso128235a91.2
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2026 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790102862; x=1790707662; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=78JNZklME0O/1rA8EQgIG2udVfDdlIk7cp3F/kt0sSs=;
 b=aNjJz81pOi+C6dNGvsZy5fO9a6d2T8jYVoWDgSSeeJ6MsfDO8pOcJbcUCQIxj3duRY
 /o0aqaxl4hjRTXF2izHH5lhoS1XU7+mWqTp3ENFNo3SnTpEsbmwqL8ubob346mzYHnKT
 QndyWI1eiSNLkmLa1RAHgWJyxpR4TgGMdfWrrHtRvAPgSWtMtDpbBGi6tCMWtF4VqiJE
 qgN9bZugfVf9/hhI6C/nsqR5ZG+8E0KWx1wLrd4f0gJukZedxpLERULMUHcacc6/OskH
 bzSdTWathhY5vvu2/NcxR+nq6MvI3bqmOmoQgDV4ge2t4dZLstIcuIyhAkdKe3V493CB
 SPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790102862; x=1790707662;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=78JNZklME0O/1rA8EQgIG2udVfDdlIk7cp3F/kt0sSs=;
 b=arj0HsehbTxX1ZkvU81+EI//GROEHL6mrfXB4X9Jj7PUpRHyEP/SCl0r9JB6x4LsDy
 M8yk+8AcMO7TDyZUgBfgmHprWMhKxB2A3x8tMB2KynLfO6NfngvWaFK9QAdgKewhm7aE
 HIRekM2r8y05KZpDmm7c9aUCQG84Amho0nuRwGgjSlgaQ+5aIqCRZZfJ64NUFLtEehd5
 hKRvPkcVczg97oUFiN37VbrIDsxzPcYqmOl67PaWlCRGUrM4x2etLdMLe+A1SuqffNF2
 kd4RB5Wv26VWSomRRtdJR6hkwKyT+jiM5JRhALexIfW9pS5WQXhIEy0t0g5Zo6NNxxO6
 b9WA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzqytZptK5kf1ThJDLtVp6ZOIrqIOyCqE+MiHOyOANB1KsKuBH3S1PB/6GL7GiVCxIYyjWNCzW9Xw==@nongnu.org
X-Gm-Message-State: AFuF++lAZwlaNycrjfXRR4sCieUd2lJNKCwNPkN6BKXPEtz1smf/qrC+
 NTm3YsgCcuIKpzOuOgCZeQxWN/5Gaf1LpXnZ1STQKhtZyq7paZpA8X6B769X1DAwVhY=
X-Gm-Gg: AYBFou2o3LmHZ3vz2dBmoBi6QQqGgNq1qyBlBkHIUDZKkUp5ffrXSdshoBsHRcVUNoL
 NR6wpTN5Wd2SKvFpS/10QNUb5QK6b91jC0YO8luX3p6m2wjzIoXhFCl8Jx6JFmld7KWjwLsnx4M
 eu8LZBqqBXhs1/GDQAI5kZrCOULDyKF6b2F2RqLFUVFrwkd15n6X+2O5OarMKIk2ItotTc42c1O
 3NKzArgmOxRfzMBhWMga2T/FDuZXiD8Tnu7AlhUy6HOP+mqE7lQt/KqO6aKqeZUYCIPOKEa1+4N
 Jgbz0Si/BiBWZabmkTurr9++b7X0r2mG4Uw8FQqTEP8tnqh97NtHhc0duGM2d134KLjs2g4mzkK
 Dr36J9yvLLtPl11Y1Luklq+8oJYemAwLfThQJSInLf1X4fqSYBMMNCrmdNm2giH1Yr504nd3AxT
 aM4tVg7y8dLgNc9WAVrbn+ul82UB+Xg9OjKb+CNJkZyKy1zhcWRk4GGF+uzaycKmadTvnYS8Hmt
 1st2o/1KVncxHCYEhmpxOWa+WtcbE4xF62lNTEn
X-Received: by 2002:a17:90b:50ce:b0:39d:ecb6:8d40 with SMTP id
 98e67ed59e1d1-3a07e4e41e3mr272243a91.4.1790102861933; 
 Tue, 22 Sep 2026 11:47:41 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a07dc2923fsm694264a91.11.2026.09.22.11.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 11:47:41 -0700 (PDT)
Message-ID: <a067cab4-0e09-47e4-bdd0-b3b09d78cde7@linaro.org>
Date: Tue, 22 Sep 2026 11:47:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] target/arm: Read halt state atomically in
 arm_cpu_has_work()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20260922164936.15189-1-philmd@oss.qualcomm.com>
 <20260922164936.15189-10-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260922164936.15189-10-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/22/26 09:49, Philippe Mathieu-Daudé wrote:
> arm_cpu_has_work() runs without the BQL held. Use atomic reads for
> halt_reason and event_register to safely inspect state updated by other
> CPU contexts.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   target/arm/cpu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

