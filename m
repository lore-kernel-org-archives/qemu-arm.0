Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08498D172CE
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 05:21:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmmNY-0005h7-6B; Mon, 02 Feb 2026 00:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vmmNX-0005gi-QO
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 00:21:39 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vmmNW-0000Aw-AV
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 00:21:39 -0500
Received: by mail-pg1-x544.google.com with SMTP id
 41be03b00d2f7-c2dd0c24e5cso1543684a12.3
 for <qemu-arm@nongnu.org>; Sun, 01 Feb 2026 21:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770009696; x=1770614496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hA7hz3ZWd4Qof4JyvW57AI8YR3iR4HQDYjdTFo2G1kE=;
 b=N61klBMT5QfZ4p2T1Vv7+9JeNfE2F75UPpIvd0EdLuf1CYhNcpjR6wPM/7eU2QWPT/
 f6LW8aqGh7skn0/NCNl6lSScopF+kjcgyeMjB+H5O1kUAhUBx83eUDe2jYEEm9nqe1rn
 41T5sJ6lXuakt0LjbbwAeAHC67AbnsjhVuKvjzSjpJTkICOe1mZTxIkxw7cI12W+6mxT
 JQm09R/Ngatdj8mr/TFoIxdMHmpynNdyECs8fuvPzfpjQ2DMD+HVIJa3hn6HGLMtKV/j
 wPLrGpOYXptr8sXJKrck0bWXs5YW6fFPFEc9XFVu1LvEnl3tPcl2hNfAYK0oAC38o93q
 viwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770009696; x=1770614496;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hA7hz3ZWd4Qof4JyvW57AI8YR3iR4HQDYjdTFo2G1kE=;
 b=ALuzH9KmtE7MV6FxOJDq0AYktsXX0+aJoY/30arEciaRNS7QoCLfivGV68M9cxXqfP
 NpWJ0R02+nPDWTd3DYh98Su1HE4Fwy2Que7NKtzjovZsy4a294ykouy1kM9PJ+QjdS31
 FsT0QkN4BKq8sTZFRJgme+zulPhBTok8EWN67FsfK6K1DeMa69/ClDbgZHnX00ZCBbeU
 NmQD4jnmAhupiqaEUsb8FTbQBfPhiGqUsvH6l/yWGeejKY4/3iP5+infeUZZDMnuWoBf
 NDBJP+73cnlT+IgZjwfUknIzmXuWWdgGJxfMmbXdQpIeaADBRffvh31n9F3SmtQRmaP9
 AWDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrZG+NltpEVOF+LBXXGPfA09L0BE39I1ZteBgDjuwB5QZmgMMVQ8FXn3bYrYhw1g3k1afNjegVCA==@nongnu.org
X-Gm-Message-State: AOJu0Yyceqw4BU3AvTZ3egGp85baRIf6dlrK67TWJuXEyjUVX1+XMPjP
 Dnx/3x6weK7Ejx7g57cDF96y37i5UqL75N6k7wabnNOWOOD8nxaKaFwBDxqEWcqN0TA=
X-Gm-Gg: AZuq6aINvziTaVInTmVL1Odb/o/9bk1bBp/7WBGAfz3tJi8Eb/v/pDR6pD52QV6Hf1z
 uZIYYtaXe4GTwmQHvf9QjuW4hbaasgcuVnIed2e14JCc0WSiZUu+IFPH9IdGjTZz+8ogSJe20xO
 sfcFBuSdPnYElHoFm2JH0H7S0bgUBOpoPC0KcthDJMFf1L3wEj9Eoq0L2rWVcOuW8btY0uaKVLG
 WC01O4Npn02GBVi4CzTDNkW1pkO5wsEmQiVmkAdzCZXA8R7Tb4GKiY9vSN4dBsaW44YQpGYPyJP
 jyD4Uen9hyPOJzAEXv0BvMSSXQHV2+n+YR2jK9yxSLhIbIrPHvuaOKzsK+fyzNSwpGF4pUUOgPM
 6b+3jUVoEKX4qBzfLZUy63VbkEpTtMbcWHH2pZp3Fmkrb1SQoFok8nUUfBrdbgqNkuRLVTHZSy3
 beGXg9+7tPq1ETsB1i0FJClf5gtrlfnL2i9XMz6FuFMAnH0l2p8PpkmW+wYw7kr/N4ze0Iroy9h
 1TpA9/n1S3QPTr6JluPslt+81Fphfn2DDmlk9kA9g==
X-Received: by 2002:a17:903:2f8a:b0:2a9:db7:4471 with SMTP id
 d9443c01a7336-2a90db74772mr30902675ad.1.1770009696353; 
 Sun, 01 Feb 2026 21:21:36 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:e524:51ca:ff85:53b9?
 (bg30dj08q4s9ql12qb2z.ip6.superloop.au.
 [2401:d002:dc0f:2100:e524:51ca:ff85:53b9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a8c3b40b67sm128733605ad.21.2026.02.01.21.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 21:21:35 -0800 (PST)
Message-ID: <3307a820-e195-48da-9081-072449ee2d5a@linaro.org>
Date: Mon, 2 Feb 2026 15:21:31 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] target/arm: Account for SME in
 aarch64_sve_narrow_vq() assertion
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
 <20260129113455.1283266-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260129113455.1283266-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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

On 1/29/26 21:34, Peter Maydell wrote:
> In aarch64_sve_narrow_vq() we assert that the new VQ is within
> the maximum supported range for the CPU. We forgot to update
> this to account for SME, which might have a different maximum.
> 
> Update the assert to permit any VQ which is valid for either
> SVE or SME.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> CC stable on this one, because it might also be a problem for
> a CPU with both SME and SVE but where the SVE max VL is less
> than the SME max VL.
> ---
>   target/arm/helper.c    | 2 +-
>   target/arm/internals.h | 9 +++++++++
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

