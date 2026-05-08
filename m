Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF65CD342F
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 07:59:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLG7B-0007Jh-DY; Fri, 08 May 2026 03:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLG79-0007JI-Mg
 for qemu-arm@nongnu.org; Fri, 08 May 2026 03:59:15 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wLG78-0004WQ-9u
 for qemu-arm@nongnu.org; Fri, 08 May 2026 03:59:15 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so17730735e9.0
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778227152; x=1778831952; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ldx1CaNqTaWy3ELaBhs3kiXP7JbP6a0ZS4zJ20j+2TM=;
 b=Be/Ikj7tlGAnz8urkR8ul0DRfpOJuFE4bk79HiRI/5o7tuPaLoBT01fcG/++68QMvh
 33e80mFoSp2PhClm8OR1Ke0f0HFHS5mIGf5rLjL6/fRpHyQeDSv1O+yftS/by2vuIuKx
 qCWVMBvt8RDAi0MRe75o5MgfqDv5FDDGaDPt5iEA6Oo/iLtPoA8ETNwly3twNYKjUl54
 4fv4EqommkqC8xWB4DryVJdGLo3JX/ggpYHigDVZGBAbQ4tmwj+bNnLTFrNRSAmpA2jD
 UZnKiXuliOCTj8e7uXh92X/MhioICGpgB6W/dEHK2ZDPCU+8mzWtGhpSj95ScSJNRhbY
 1p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778227152; x=1778831952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ldx1CaNqTaWy3ELaBhs3kiXP7JbP6a0ZS4zJ20j+2TM=;
 b=JBPCloVTjmvslwP5KPiUcgKtLDHlTLwFz3KEHoVv1wZm6W+lT0fP+S/C1oiz2qu2/0
 3h2BQrK+N0TvhdrwLJ8tFZ+RIDwKmuHac98Ra/T8418oiNkIUIpwIjBo5uJWGtk0Ck2s
 WztuKk1YOY76dr8MhyLuz2B89vClW9K5DGD/rtiokgHppGbLYIG5kpU++VvjgpL8eKt1
 SurrBS3ltP/avV1krvoy27akqSbTXPY8rjUA633oTf6++rQk4VZLT3kNgaPLhOtJE54w
 cd3QchKdmV+5pDopYS0RBpE2p/afJEzlG5QwZNj7L+6xncjCpvbWdnT8W17JibunmZ+b
 g/Pw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8S+kDG/17VFdrNUaLwly0hJc8FAfHmzY9e7ZiK9zUsydSx4SnCTGQxdm3s4dEGv3nEotRJPwNxBA==@nongnu.org
X-Gm-Message-State: AOJu0YyPtQq+lJXrc7c+q4oJrNgzrtl1Z0/Ws7ew8++M1gseFtp0PAUR
 H7az8zccxg2g6tIBkuFSvmjLfzeZdOWoee6esCC9k+qTPzwn8RFntEtCcfOKlNs7hrU=
X-Gm-Gg: AeBDies50USFKeYARPTSDevSM5HFssWFgOZTstIyjDO8l+6Cvl35zRRODjn7fQiqZ2g
 I6b2CdFzTWAebL3ZeYHlC48Zvn+HmGp7w3O3grDA7A0Sfmjc66DHMfvCftyuDKKIyEm+ldAvTpl
 sHPPL6JLdzsTGXztvc7Sv/TGw4SVfvWErQL30yhuKhJ26R3KsZ/b7fbfRJJXO+f1ZdTHySR5pYD
 DsejuV8YMwRkselLzb8keMuIMQyfm2DyA1rR6bKOHc1fabkGF3+VLUF9aY+Hrw2HAHjQDVHZSIp
 /hR05HCAgfREsCVSiiqiX01hLBZw1o7Xuvpe0NZpcEtHG68a/rSiSVxgfjQx+dd38+wLTgubuWB
 Q/RKW+7paOjtISYCXux+XInH5hOk24M86JrQFYq8D0bS7vgxYpEKRsAdf66lb35YmtAiOIP09cv
 8TMLPWiY4YLh7kpuu+wrDLU2VVNsZxKRWWM513GEB9lYs96q9Iwd20UXwEb/ULHNhj
X-Received: by 2002:a05:600c:638e:b0:48a:53cb:8604 with SMTP id
 5b1f17b1804b1-48e5e00c1b9mr96731675e9.14.1778227151852; 
 Fri, 08 May 2026 00:59:11 -0700 (PDT)
Received: from [192.168.0.200] (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e68e374bfsm20729055e9.0.2026.05.08.00.59.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2026 00:59:11 -0700 (PDT)
Message-ID: <53cfc25c-cb3e-4637-8d23-1fb2d1901317@linaro.org>
Date: Fri, 8 May 2026 09:59:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] tests/functional/test_tuxrun: Restrict to TCG
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
 <20260507194728.2034696-7-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260507194728.2034696-7-peter.maydell@linaro.org>
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

On 7/5/26 21:47, Peter Maydell wrote:
> The tuxrun tests specify the cortex-a57 CPU; this doesn't work on a
> KVM-only QEMU build, where the default accelerator is KVM but KVM
> doesn't support that CPU type.  Restrict the test to TCG, to avoid
> failures on KVM-only AArch64 builds:
>          Output: qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   tests/functional/aarch64/test_tuxrun.py | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

