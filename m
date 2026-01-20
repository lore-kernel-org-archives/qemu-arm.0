Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEF9D2ECF7
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 14:34:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viCoP-0007x9-1K; Tue, 20 Jan 2026 09:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viCoI-0007oJ-T0
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 09:34:23 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viCoH-0005Pg-Gr
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 09:34:22 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4359019da8cso659105f8f.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 06:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768919660; x=1769524460; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8lELPTCmDPTukwPWPop6bWIYoAZEgubt8IpIxt/kG7A=;
 b=J7fWhSLUYkWOJ07DB+pcwalesX7cIXTmnYrA75j3g839CQB2gxs2KoKRcOGPSlcVOI
 dcNZbU2FMdnXnL5vcDYt2kNrzznWqYEXX4MKuhvEj3meJbCJQ743dOkl5XcBI7baBQkf
 DAucudXATD4FScXsKmnpsyiFVj56WtxOCtoqSdIIhgASQWXcsEfgmgAl5nbc7C1x8sLb
 FGhjfCLywJNXguUDh3UAufSJodg0g85ekp0e73m9tfOY+68vm5UKs1jD3UzQ/n/0wXO9
 zbiZSVgqTHiJsI3HFqbLGHDydTetWZ2XdflazSMVtjMRWKEd2o+P7TJ9f6tSpPptqP9J
 cv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768919660; x=1769524460;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8lELPTCmDPTukwPWPop6bWIYoAZEgubt8IpIxt/kG7A=;
 b=rPYae34sKHqEcrY9Tzxa2HYMPAkSQmCxp4NMxYneGcQLH1KbchTXcVTfsDYOVhVNN4
 EUCOxy/Ul30FgMhqwUfdnkiOGQl+Ji8b1wtK1ly6oQEbC1NMTYfKf5XvfSLybH1Zs/m5
 b/yPweezhhBckPhDNDkVDnMXXf2RS0ysdBzcjFDxplnHjA78YCC6CPlzT8rSD5P20knZ
 +UxdVlad4gj2LC5+w12P87OU/Ex1C212Oz9ForOreo882rOpvnXu8RlRAarDNmB2AY+S
 6t9tZI1fEkSLJWJbCgtr3KCvfEVvYLf+2Wr3DQx/kwBsaIrEIVOfEF61zKnC3petYHdT
 9S0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz8BtrzM0Bs5Au2ZZ/jbqxY4XZodNuCzmJbiZPDOAyUyvMAZ7lbjreDkRF0GaD8y1s4fb7CzHT7A==@nongnu.org
X-Gm-Message-State: AOJu0Yydyjs2zktVxuPJRKGeiKFKFkJJnAwBszBHSEHuOvCVBXOewn6t
 dw9Fy1Q9cYf43vBDORO4lC02jXQ5HV51zDEQEgwqOPgkXQdl8RxBmuU3ICFicbdAViQ=
X-Gm-Gg: AZuq6aLsPJNsUFjL8zE2p5IrJN551k9XYIR5AlmhWPCDh+cn1bWeFOjB+lwHP3r/rq4
 F6qy+ceegtfcZi1+z6jsV0qZlabXx1YRApk7kwhlRMkuc9nR1+9lfJX3L8wZ3QHTb9J/lXBKEgq
 M6teUg/7DloPZOWxE1gCENLRV1UYnWnGIVpozwqEBYKzAE4gTC7/mSLHkFvjmkYGUn96uX9FWJA
 uMJ00uN3t/0eX8M//Fw3TjGL+U+9pd2wmawt9k3xw62kgI77nNOCRmhfpI/MnZpwb/eRPP1/iEW
 FAdEZJjBas3cjgV3wXiqvjpRUdMT7mOuSjJmhbTJDlsBzfV+Y2p4NlPZCtZZJMbJnlDx2ySpd+M
 NkaxXGSSyIhPPpomvbvNEMaLorhk2Yp6RP5hW3eaumNbqtTyyJNwvl2MEIrKaY1uI4WxoZPTNhr
 zMWoTnmETjjRwxT1Ana0GYSfYUuaQJJQjAfo4S9BFlxD1ttDdto8EN9Q==
X-Received: by 2002:a05:6000:1a88:b0:431:9b2:61c4 with SMTP id
 ffacd0b85a97d-4356a082ee3mr20510545f8f.45.1768919659797; 
 Tue, 20 Jan 2026 06:34:19 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435924ae723sm3098956f8f.41.2026.01.20.06.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 06:34:19 -0800 (PST)
Message-ID: <e0488d99-0a4c-4902-b53a-d56981aae52b@linaro.org>
Date: Tue, 20 Jan 2026 15:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] system/physmem: Enhance the Address Space API
Content-Language: en-US
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
References: <20260116185814.108560-1-gustavo.romero@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260116185814.108560-1-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 16/1/26 19:58, Gustavo Romero wrote:

> Gustavo Romero (3):
>    target/arm: Initialize AS 0 first
>    target/i386: Add a _MAX sentinel to X86ASIdx enum
>    target/arm: Add a _MAX sentinel to ARMASIdx enum

Series queued, thanks!

