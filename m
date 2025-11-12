Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0140ECCF9F8
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 11:34:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJ97R-0006Z7-3v; Wed, 12 Nov 2025 06:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ94q-0005wg-1Z
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:31:53 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ94g-0004LY-5e
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:31:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso5053305e9.2
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 03:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762947070; x=1763551870; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YvVPXdYbfHwfM8CajHFtkN7+K4UKu3FmToITsG04s2U=;
 b=Xi8nwWPoU+EqTXwxtd2Tm/OlUatK0Rg3NCO4bIjtx+Asbu22yWPTwK4BFilBQRcH8S
 S/vciqMzjo0EPpxMbRbo3nSYB135y8XB+kxKoBZ1sHPInLK1ku1atGoyerH/c14ZvC6X
 5HC7NDiKvapGzIIsmEDPlwTBimEEiUpcVbgUSMWAfD5WL80PFc8VbJWlttc/cav4nfrX
 9IMTpG08AWsxi8IjkDG6wFwIaJqYjiPrBfS/d/K0eYmnXOs9W2dEEuznmumKckJRACYH
 4lihSuo6wAt4GoOUxK7gCDLsxZfXEQJFOYPQzyQrGsnzwYNV3mjRLDZraq0MEMsWbo1w
 byaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762947070; x=1763551870;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YvVPXdYbfHwfM8CajHFtkN7+K4UKu3FmToITsG04s2U=;
 b=UOnrIXszNzENJEkaC329j/vSJm5R4e5XBDExwBpord9GT52CM3TS5wSldC7X1sPFVt
 DfqJLnUXrqXCFdBURfbt5z76e2QlUAwffOYYTmm1SQxuaoxIdprB1R8w5aGKJczg3FWl
 30T5vs/o+/b24kXSmAT4UtksKExxy3WbZwSKXAwwyiv4uGOnnTesBWSpWA2Jvg3wxKt7
 iOMbRfMl86hSzmx35fc9jSF4ghyln5P3dv5hA4YNN4B70crpOm6/j3O/TIJLL2AO+SVr
 0Uo3ZfQJ1u4bY5p/0jpO7LehgvA0kds6YA7NmtMjpW+8umhwLCw7eUDNovDBZr9BpQpo
 /9hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfIUZTB9+Pu2ngXzmMkjf/CRdqsCQ4UK3o7Q5HHV22FxEcNLQ+EPk9t9XrzCIAiVxJgiqZIRLizA==@nongnu.org
X-Gm-Message-State: AOJu0Yzuap6p8q60pXidrssZgjA1lSrEZT3ZuEknPrF7dNjvLvyGoC5d
 KsUTJjyTULbBqMhHgi6I786ZCfxArfPpd7UL7Ckhl6V9oRSX/6VYdyDTD9Zhx7Bj6kQ=
X-Gm-Gg: ASbGnctmd/MCJ9rNjC+92MRT+yuX7QqXLgab4DAeqCZOampqmOe+UyiUuqfb41i9eIB
 3N3sv/fGHifj6uIdSnhPF9a+Z3kB02yHSd94K4PBd8iS0YpV8+4faOBrqv644Qvp5qy1iF2l8yZ
 5lRWB5bk/OIRe7KRGxB94iMKpvdSi5Xh3j8Bbq74r6fH5ZiFZYbEqZ6/yCOJluF0VLiOgOF4hti
 2doJAJm92spnNL/2V02WkH1+QjwCejxlsEeyvj65eLC39ktGSYgViijFbjvHQy963mazxfD46MJ
 jJ+DhxE53URAAvX5ddWDa3P0ojs3xd48l1xWEIPpx8F+Djnf7NDygutY8/ZG6jpHrg7MnzZO96V
 V5HJdeGB8TnD/0qOl7TPniDRuMn7/MShiTXqH89SEiDEwyRd1fb1HiGA3g+xNawxRQ/Nb3Vnnx+
 FhzCL8cEtHZuj6cUB3DV/8rjYqmZ5KNaW1LaEK0sIVhnA=
X-Google-Smtp-Source: AGHT+IHWiFdSb/J64SsgfuKIugDKj30LxQVwkZldEfWHaXByqOM3ud3g9o7sMRo0P3EmD/yuMMZXmQ==
X-Received: by 2002:a05:600c:c87:b0:471:1d8e:3c4f with SMTP id
 5b1f17b1804b1-4778708664amr19434235e9.24.1762947069769; 
 Wed, 12 Nov 2025 03:31:09 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e45677sm31010455e9.8.2025.11.12.03.31.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:31:09 -0800 (PST)
Message-ID: <69e61674-df92-492a-a982-a94f7c979621@linaro.org>
Date: Wed, 12 Nov 2025 12:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.2 v4 08/15] hw/dma/zynq-devcfg: Fix register memory
Content-Language: en-US
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@amd.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
 <20251111102836.212535-9-corvin.koehne@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251111102836.212535-9-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 11/11/25 11:28, Corvin Köhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> Registers are always 32 bit aligned. R_MAX is not the maximum
> register address, it is the maximum register number. The memory
> size can be determined by 4 * R_MAX.
> 
> Currently every register with an offset bigger than 0x40 will be
> ignored, because the memory size is set wrong. This effects the
> MCTRL register and makes it useless. This commit restores the
> correct behaviour.
> 

Cc: qemu-stable@nongnu.org

> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   hw/dma/xlnx-zynq-devcfg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


