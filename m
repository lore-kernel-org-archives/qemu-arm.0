Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E377CA0EDC
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 12:26:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uohtk-0007jC-4A; Wed, 20 Aug 2025 08:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohti-0007is-Nu
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:26:34 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohtg-0002LY-MZ
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:26:34 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b9e418ba08so3513790f8f.3
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 05:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755692790; x=1756297590; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k6hlG/Cy8SCZJ0b4vvcDF8WCN1yH1zPaJ1deIoM3Mak=;
 b=EZ19kGl8WRyaG/EZ+XWOosN3gE5mUb9de+8kma/zzVi8sLyrA/NTb8jyAK27WG/6he
 7yUe19sFhskHyS3ltZrW3pHj+OAwsDyoCZRGDNXHv2QmllBfGvGfjisNxHxd1RBX02Gb
 iF8c6UGPT+1LII/Exz9hRWv+3KalJT9iED0plc5r57xOPszLZ/Kkujy4EmGA1RQFcWKW
 LoQw33uhTmP3o6F97cBPWCMBCwvLuf+2O5IBo3maLV9zGnqDTTxZFgd+h8DIrZtnt0LI
 NRxzb0IwYG0zqwRr9l7nR9j9ww5k7sp8hDixPni0FPtxBiH/eeDpXwL0GZjubm4FK7Vk
 Tifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755692790; x=1756297590;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k6hlG/Cy8SCZJ0b4vvcDF8WCN1yH1zPaJ1deIoM3Mak=;
 b=TpUIXPZsk+yeTgG1ZlrSTpRYcoZAwzYR51dUlm6FdKVVTRrKkQqXA1UaArQLd2BVpj
 54bQ/Z8Iiui3H+88+YX4wiq2B+D+SGyrxl7jFSfFHY9OP8MYncEzvUuuzcRZ5yiSRRs6
 g94dvBraVq/yz0gOd8Ip6Q7Pq0Ak3oSEe+9Rvn2vsSSdu5UgJ6rdQ+p8rTaqcAPxnVbB
 d+swVxeEk8JqTKvy+BPbMag06APoUFnJFHtGSkvi4fxuhdVyhmQEbNDG6NMiwFnBf7LX
 kM/mVkRGugPcgu/giva20KAUS1OgsUJGwgfRDG36ScDWexzLkkkuQXvmoCskZjXdqUEI
 MZAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVdLTNa3vsovRaUSsMaLbsoaVDe1KJ8kB1xZZa223eEXFNafAqvWtkAcZO20jfqw6pu6B7HYErgA==@nongnu.org
X-Gm-Message-State: AOJu0YykV6+6swvaOU5JS+zmdtKRUbKoM8eLdcu//EVrYwgwF5irN6J8
 yItlSWwydnPWZtjBlXw47podd3oGDnKxY2Cfdduf/kR8MdHON5s/8fr34f8IzksPwqc=
X-Gm-Gg: ASbGnctm9Se0qE5s4OF9C4esTl8RgRoor3ReMagpFcMDutYLRl8Ft7jRfQRWg512grC
 tlQ4gRcA5MRjBM6zWxO7RHgCiQRiW1CmbI/Z5CyRwsqS4ZL0QRYC7wgubx5yrvg7cbpnDHzh12K
 cNAIEmgucRloB8i0VjAlU5s60iKY8Uy5H93+n2ZtWXUgMyrnsIu+sxr7AgU5HjqVQPkzPpEVlqg
 ah5bIf5kMYn/8nbXLRh0/RQe5MQu1LXK4JQh3FDDVYgMlfnB2XtQa4SKHeLfTfXRi7FKZ/4DPKT
 hhNkcvhhJnMVagjasjssUoXxMuGaaFSVvNBTenX7rDd2V+vvFcfU7xBYr8mPJWz8ios1V7UtbRM
 W8g5SxwvsQAcQkp814+OTc84hcy8b+/ZmQEVkpMXS+3mAs8iFSELCH+Bd5CL8Ri1vbtbNeY0=
X-Google-Smtp-Source: AGHT+IHrtFF2KEJfVpiPBEv8AZsVTfQlVQCZDl8dZDiUPTkXXoe3EiYN+bGD1KVG+SqeFrcnHNu+3w==
X-Received: by 2002:a05:6000:2c07:b0:3b7:92ca:2831 with SMTP id
 ffacd0b85a97d-3c32be67b83mr1846728f8f.12.1755692790244; 
 Wed, 20 Aug 2025 05:26:30 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b47c30dc1sm30367795e9.6.2025.08.20.05.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 05:26:29 -0700 (PDT)
Message-ID: <b06e61ad-1019-46a5-b3d2-1973946241da@linaro.org>
Date: Wed, 20 Aug 2025 14:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 41/47] hw/arm/xlnx-versal-virt: rename the machine to
 amd-versal-virt
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250820082549.69724-1-luc.michel@amd.com>
 <20250820082549.69724-42-luc.michel@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250820082549.69724-42-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 20/8/25 10:25, Luc Michel wrote:
> To align with current branding and ensure coherency with the upcoming
> versal2 machine, rename the xlnx-versal-virt machine to amd-versal-virt.
> Keep an alias of the old name to the new one for command-line backward
> compatibility.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> ---
>   docs/system/arm/xlnx-versal-virt.rst | 26 +++++++++++++++-----------
>   hw/arm/xlnx-versal-virt.c            | 11 +++++++----
>   2 files changed, 22 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


