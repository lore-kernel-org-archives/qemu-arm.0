Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E500F3D336
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 17:04:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyC6I-0000dj-BA; Thu, 05 Mar 2026 12:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyC5Y-0008Qt-Kr
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:02:16 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vyC5W-0003uD-SJ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:02:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4837584120eso63356255e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 09:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772730133; x=1773334933; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z5S4FWc2b0VCRiyuCVP1osL0L9CAwOiZq+WP/x3uphQ=;
 b=wWg+/CLoPWhDMfN7ZEmOL7l2cEABcQND7ZPIb06PGhHq+Yr/JMmpKCXM9cE9pblyRL
 PsjX3r9kddg4uBUkcqjXAKnn4bmXy/64ntKQgiLaLzBKVyJ1qPdYM7/CM/8+9Pn5epRc
 VSaR4BOx5kxMP5iNDhpemMaSqkt6HXbN7Lw8RQs92pzBMdlPJeNh5k37jl0feMexF/3I
 aKUpvQ5hlNwqyLq53ch6z1vZAQiDtShry0YFz37Qf+JmvZgeq3l9j2CoWJN5zIP4WSQG
 TrVugRJPYSbpAk8VrpbULRXYK8GjTBU54pw0frCgQxn81zp8ecxWWTDClyKO6FrGzmex
 duGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772730133; x=1773334933;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5S4FWc2b0VCRiyuCVP1osL0L9CAwOiZq+WP/x3uphQ=;
 b=nSi80K6B+CfSNOO7ZwXRvJ7hgohPzKob8d0XPesXFK3qs7Qr5wnRH6oAmXT5362VK6
 yQwZIJCGs3TCXiFna+wG2QdPa4y2m20/9M9ZpWFd6UiiiLRZ9PMLFeYTDN1H57NumIzw
 EC5q7+mn/zVBA/kkA80hjLOxe8UwpZ98y+U6WZYysy9m6dm3WMwWcXkXgNHTRv4HjOSq
 blS11PQZH5IQ0dKICPLJTjwQFiHdUxPZJCsZs+IZzHZES2jLyP3VF5AAqQgRXSDzLBTm
 S7ooaw0R3Ltkb0coQPnzsdQ68QklPS2QzzCk4MuaawW1nJQTo/AWjhxXdHO5r/Q7rXW1
 mX2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe+n26Q7tM4751XgTYTr6PbYW3zTT39Wa1Y/MNexn5dG3wxd5mXJ7RgIpXG+VM1uaH7VFEmsv80g==@nongnu.org
X-Gm-Message-State: AOJu0YyFbbcO9/pzGiK12d+Pq24KpCDWOn+R7K5Y+dlQQGQ4GZF57d4j
 cRWgPWt0Yln8MOTxwiPsvDZ732DNyO7aMaoVkwrvFXdbkhpoHPs+g5ppfgDVwzBoL54=
X-Gm-Gg: ATEYQzzRWNYGSQPRfpUzwrg8s5RuMwwdHmF4tuOZ4ELM2YO5LYzfN2QfrBM8+P7RrWi
 /AqS1UvJ+k2ECCZBUBjo4BU0uY4sl0rWo9p7aeI4WPNNKd41gY5VBo8oMzHm3HMeUFJRCThglz0
 ypeYE0K2pYhRFw1yM40ZCoACvpac2tPvRL1yx+jh0DrL2tnFEx0Z36K9RkhFVm7sk/gw2p3/7f8
 +53sTvTHxxD4bOu94KrkoaaH7YpcoQJD3ybDKFO77vQXA9yhSOT4aTQFyIUc7Ft/3oItsKVmzsW
 qylQvEK3ho5YOyKZZ2gfWAU+r2JRSAAGN25hHDa0lh6oYSz7ULXZTSORMZo2C8yg/BdQ0uWC5yo
 wgW+kgWUNKGGT6roukXQbCJNlQnKKpo5Z445PDOs14BLTOa/6WjUTtiWhQF5+SPwyku4O062HAj
 ek9mUiKWswMtd56jRgqGYJaZiTFxQ3jXZVPGmZgnt2nODT2baczZT9YMd1tJL3p9tRlQ==
X-Received: by 2002:a05:600c:1986:b0:476:d494:41d2 with SMTP id
 5b1f17b1804b1-48519897e1emr106549205e9.29.1772730132581; 
 Thu, 05 Mar 2026 09:02:12 -0800 (PST)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851ad28363sm36283015e9.30.2026.03.05.09.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 09:02:11 -0800 (PST)
Message-ID: <3d8b56db-aef0-40a3-81e8-e08803f8c5b7@linaro.org>
Date: Thu, 5 Mar 2026 18:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 05/12] hw/arm, target/arm: nested virtualisation on HVF
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>
References: <20260228220837.35275-1-mohamed@unpredictable.fr>
 <20260228220837.35275-6-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260228220837.35275-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

On 28/2/26 23:08, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/hvf/hvf-all.c    |  1 +
>   accel/stubs/hvf-stub.c |  1 +
>   hw/arm/virt.c          |  5 +++++
>   include/system/hvf.h   |  5 +++++
>   target/arm/hvf/hvf.c   | 36 ++++++++++++++++++++++++++++++++++--
>   5 files changed, 46 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

