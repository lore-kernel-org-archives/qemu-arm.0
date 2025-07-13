Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA26FC83F1D
	for <qemu-arm@archiver.kernel.org>; Sun, 13 Jul 2025 22:00:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ub4kc-0007PS-Jg; Sun, 13 Jul 2025 18:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ub4jL-0005sP-C5
 for qemu-arm@nongnu.org; Sun, 13 Jul 2025 17:59:34 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ub4jJ-0002HV-Rw
 for qemu-arm@nongnu.org; Sun, 13 Jul 2025 17:59:31 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-73d0152369fso984560a34.2
 for <qemu-arm@nongnu.org>; Sun, 13 Jul 2025 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752443968; x=1753048768; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F781/ZweNMEa/HSDrQo9cJhkIzkPsp9k1uQLm+4+NUQ=;
 b=LCsYzqfmmmiVEhlOgQWjo9mrTEGjWYGrOE0+6QgaM2/6jxiLqH1i0pYC0/z/Rmu1aS
 S0ywO+FaEnzMvmpc/IZbeXGpFlZ1v18AkIFTw2oa6jSgEb+BdSS8+R5Oxs4Yr+j57++K
 GCIVD+r8mP5C1TSge2mr6/nYTPb6LqcDHJsiOTDu2HitwSqM+qMZH56O07cgFl5T6MlC
 gNQ7RYCzlKST+w6/tz4SxCxJkbhoSAXUiBbE2GFcq0fwmFzo3zHfLF9mAZCq11WB/3XY
 c+4WezG6Jrt/OzxWEDhDt7DTG5aTKrfsyDOd/e1U9MkW5fVHvhUpVdPvlIBukX6Il67Y
 72HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752443968; x=1753048768;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F781/ZweNMEa/HSDrQo9cJhkIzkPsp9k1uQLm+4+NUQ=;
 b=awB8Tq7SIKwXlgj5MF1UK1KABBItZXXTzeTdLL/MLtOC+L9MPutMCUWsiGIxCijyzB
 zLnTXESeZ4z3aVi+lV/SIcuXV+ASDM3lHpBpJp/SihJT/5hgcnlTx5H/Z9uyP8lo3fME
 x5BGW1Guq5eyo9ElltqgUaPHlYaSiIkQ3/A7Wqqq8wCblGM6Uaczuhttlv3LG2QPl+Gt
 2IRuoIVaJqfPSIfYhvewGbygMuXFVFgNk7gFLZou5F2dCP2jUvuw4fAAjLkzCj2FBkAQ
 6IsgjOfKcpDt5EZ4ahQsxdiZDoVfc9bq+0E6DmIINvoDD+FJBvawNV0epBWTnISWdmiP
 P8rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX+E6U/SASW7aoylqSDSopwPnseLcZAhdsGMiuwuwcsooNzPQEYYEkjghITtcbRhTyislfGc7oLg==@nongnu.org
X-Gm-Message-State: AOJu0Yzi3p58gKJxZgL58uR+1LcocEjqd1chyg9+9Df7ZL8PJByy28OG
 RxMgXibY4WhCUjyHLyE3lHotk1+oVRXPfs56BZjo7YrfkavEBA3RT3tk8V3RhjwMP0U=
X-Gm-Gg: ASbGncsWJi3uGy6OBtJq7zqO8lPIAFL7pwLVJTzkPulWNQ3O8aPHu5w9U9c0vtry93H
 Qv7eaDBe1kKVzGYXNznXBkrSas7TC6WdHYJMZ6/FOjwodQAlajUYoy6VxC9WfgoX5YVGPBU48Vf
 HHrvv9ulBObBAFGtlaj2SA6IphKxD6tjDIcQpwYowCtF3HhxivU7L9eQSsJ5t4Q7tO8HpazB+A/
 LwdVwwQGPon70jR3zEIuPXbF8b1g6lciUwtwyUw8qntBcjm3xDnCEgplGxTT2o2AAVgTSOeaXIE
 0sWD49YJQc/JRwrsT9HDuORDtW6Wg0IbLq39+bN3em15cGhKv+kZMa2U/5JLZabrI2BwbfmMIZp
 7Cp/FEJgXfzAEMU542jNaT4MBYqjb8v17g6wGpFw=
X-Google-Smtp-Source: AGHT+IHn5yu02dAQgwR7An95BbiRtPADOwZiX2BwJeFLdxmE1bIl/Acng/XutQ7lHbdGXjS08SgnSw==
X-Received: by 2002:a05:6808:171a:b0:40a:56aa:c806 with SMTP id
 5614622812f47-415397b924bmr7292461b6e.22.1752443968212; 
 Sun, 13 Jul 2025 14:59:28 -0700 (PDT)
Received: from [172.20.0.130] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4141bbde341sm1335946b6e.27.2025.07.13.14.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Jul 2025 14:59:27 -0700 (PDT)
Message-ID: <21bfbfaa-f0df-413d-bad6-b69688ac381a@linaro.org>
Date: Sun, 13 Jul 2025 15:59:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] target/arm: Add FEAT_TCR2
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20250711140828.1714666-1-gustavo.romero@linaro.org>
 <20250711140828.1714666-5-gustavo.romero@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250711140828.1714666-5-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
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

On 7/11/25 08:08, Gustavo Romero wrote:
> Add FEAT_TCR2, which introduces the TCR2_EL1 and TCR2_EL2 registers.
> These registers are extensions of the TCR_ELx registers and provide
> top-level control of the EL10 and EL20 translation regimes.
> 
> Since the bits in these registers depend on other CPU features, and only
> FEAT_MEC is supported at the moment, the FEAT_TCR2 only implements the
> AMEC bits for now.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
This causes a regression in tests/functional/test_aarch64_device_passthrough.py, by 
continually trapping on an access to TCR2_EL1 while the HCRX_EL2 enable bit is not set.

Unlike the similar SCTRL2 failure, it's not 100% clear to me how the guest and nested 
guest kernels are related.  But it is clear that the outer kernel does not does not 
support TCR2_EL1 (and also doesn't manipulate ID_AA64MMFR3_EL1 to hide FEAT_TCR2), but the 
nested guest kernel does support TCR2_EL1.


r~

