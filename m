Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A4EC87FCE
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Jul 2025 17:58:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufMgA-0003p8-Bf; Fri, 25 Jul 2025 13:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufMg2-0003Vo-RS
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:57:52 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ufMg1-00029e-2Q
 for qemu-arm@nongnu.org; Fri, 25 Jul 2025 13:57:50 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7600271f3e9so2221037b3a.0
 for <qemu-arm@nongnu.org>; Fri, 25 Jul 2025 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753466259; x=1754071059; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QkoZ7faUGgVx+/uaY1cFHpymKuZRj4E0OClgFoDJM/0=;
 b=tzHhy70AfiK2Nxuiq9vkJP9Z1r/5DPltgHJGipxHog7PGN2aTxyQqJuk7fLkVm9+PS
 gWAr3vFxVoTordUWmg9jMvS4bADKe9RxiwzLwdzXXN2FvYVnPUzMfxadcyer2FQW2M1k
 xNeBipqTZw3B9acqHAAL3WzYCEzi+IRODmQygCmZyNwsU45UXGh89EPlJvZYckbSV2OH
 oqHu7ZWp2ZKpn7YJHajcfmUJFhUUKl+86g5VBfCCZPvjLXwGHEa/mSvBx6b89v8f+KxR
 RvoChZEbr0/lqztWyU0EvCnPdqXjcgAe5FqwHh9WTk5RMI3Oel1QgcWvRQDECBF+GRSh
 ApkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753466259; x=1754071059;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QkoZ7faUGgVx+/uaY1cFHpymKuZRj4E0OClgFoDJM/0=;
 b=JASHcgeoo0sUU+ob8rSHAQSADNqkg2JnYashaUeLMruzdrntC2kG3hzAZYY0r6RuvE
 ur/2lnzUURD/XjHR66r5yh22K7xWAIPBVyK06uNMoclI6tHyTlnzD6epjjTnCN2FQ2Av
 DsrLVtQ6ElfKlVo1J4Bft3CC7gt7E/SxP/43C/GxDt+PBcuWb0pcNT1lihaZmSi1ObC2
 DP2nAujWKWOpziPLggUZSOyVNH1ahwzcUGJRPGYPIwhzkGAoJlJP5f3sqQUuICTsAdmd
 YANFU6xtqXNMBFGh6QQpzum2hdKcediVJmdsnKWAPNn7+OdACaTD3RX/LdjfT4MN7F8h
 IWLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2iy1xBvrDtxu73LbeF+Xh+BcKH0voMSyA78RSVbHECGg8MO9CfNYODFLMMmA+bMW4wcbVlMpTXA==@nongnu.org
X-Gm-Message-State: AOJu0YzJM1MATr/R+tnFvgv0SOAzZOH5dony+gB3WLWiyWbF5xvVZ4Jj
 D57zWfi/IxZiu9NqiHqbRnQigW+JbFmApTFeBZ2ZbzigwqiuIYQWhQWphT2UPB0SZLo=
X-Gm-Gg: ASbGnctwwo8m/3y71bk9VdE3ZCL8oP3HN8d+FyjUnFTndsEfyHuShJfDKomjRS6M1Xb
 NmRacMyYVtDpTdvjKzQT96nDD+5V4QPoVSH6jwE3Zc2GCvRxEaOgjfzeP+JgXhf+hI4ri6guP0y
 Lj4V4s0CDpbPxiCLIODYrA7bz0blSJtIfTVhOn7zy3XUdGUxxlP/IrND0lqJ8ZaYz65W2FdRzbw
 8C9JLTCoUwR8XjvkRxJ0vJya60Aqvo2aSGX9zI7MrM7n5gBdy5GNtZvgFAoiwVpVZSbsWskRgeA
 CNVlayyrcHTz96Vpa2x7BelCWhrAV4E7obKkxIdBv/HfO3yqyqq4t2BMH4vp556vD9+6vpnv+lJ
 jeFH4GeOgLHq0oOMG7ahgr1An5OnnLKQOABY=
X-Google-Smtp-Source: AGHT+IGgr5I8y94vMBcNtcU+TDplJ5N4GpzxFgc4vpftjzx+e4wFZEcvvXSl2UfOpPsDfnUA9gtEWA==
X-Received: by 2002:a05:6a00:3a12:b0:746:25d1:b712 with SMTP id
 d2e1a72fcca58-76333fe47b9mr4619385b3a.7.1753466259079; 
 Fri, 25 Jul 2025 10:57:39 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640b2de006sm191650b3a.108.2025.07.25.10.57.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 10:57:38 -0700 (PDT)
Message-ID: <1b99fd71-d32a-459c-b85c-7185597ac537@linaro.org>
Date: Fri, 25 Jul 2025 10:57:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-10.1 2/3] linux-user/aarch64: Support TPIDR2_MAGIC
 signal frame record
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20250725175510.3864231-1-peter.maydell@linaro.org>
 <20250725175510.3864231-3-peter.maydell@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250725175510.3864231-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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

On 7/25/25 10:55 AM, Peter Maydell wrote:
> FEAT_SME adds the TPIDR2 userspace-accessible system register, which
> is used as part of the procedure calling standard's lazy saving
> scheme for the ZA registers:
>   https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst#66the-za-lazy-saving-scheme
> 
> The Linux kernel has a signal frame record for saving
> and restoring this value when calling signal handlers, but
> we forgot to implement this. The result is that code which
> tries to unwind an exception out of a signal handler will
> not work correctly.
> 
> Add support for the missing record.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 78011586b90d1 ("target/arm: Enable SME for user-only")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/aarch64/signal.c | 42 +++++++++++++++++++++++++++++++++++--
>   1 file changed, 40 insertions(+), 2 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


