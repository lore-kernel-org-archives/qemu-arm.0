Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EC8EF8FF5
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 15:20:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxo19-00076P-Ek; Wed, 04 Mar 2026 10:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vxo0u-00073i-Hc
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 10:19:54 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vxo0s-0004fl-SJ
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 10:19:52 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-483abed83b6so59159345e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 07:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772637589; x=1773242389; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KHdlh+QmHi8mH8dpdlQhPpgU7GMnD8K/URT6dopr9n4=;
 b=KncajCkhlD0NAHTPxpKFEJSN/yw9O1hCJc4G6oLGSfbaiBl7v6ungjXkrmEWRl3AVN
 cup8JFfN/uFOdVVXbtdu0KU4oZqyk9Rs5R+cYRw/PrFgINI1aeA3KR1mtxFcKrPqfdjf
 R8x+4r+aiZn89o/4GSHRsovXH7QsThJR2qTIOClSdWu7uuoeTRv6ci0IJszfXE7PHDg3
 Zt7zxJOigEUpRM9w9u972NwJSgApZKpan7om/3//7n4HUEDgU+/nHfH/MzF6xU4Env/P
 yfX5duhzZWrPc03pwLo1/WA4yCJj6lmMNbo9F0N0M6yr/ZP5uiH/VE4A6ecsx1UU3oH8
 c8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772637589; x=1773242389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHdlh+QmHi8mH8dpdlQhPpgU7GMnD8K/URT6dopr9n4=;
 b=NOxH5ZtSFjOolrOA0FVWl5CU4wT7FKbj8FEHiA5XUeBq0r3b9/Umd20Qeu8Xrj8wBl
 3ywXsyvcD+qQYB7I67G7WaI/4zEjGBbSD+05T1GKlcdd90g0jxwGaEML7MoselS18RW0
 +U/71AgbCl9DUK2ejAshorh08zsYrTMdrXRYn/rNxxqFO17esHIdSccIT+r02rAZrKWQ
 ADKp9dZszU0owlT1MU5VCr+D4A+X82lgDQAd36GvG7h5yNDKJZGTnnrJXRBtUHAo6LXV
 UPZvas3omsMzmstd32N6RtZKXPYoqlwIyuZUoOILJ8HrZYs01D/ZohZjmjjPg0if81ex
 dfeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyPAe9PQGmOMKvUxT0o82/FNU4Iz2VoDyQXcZFru5HjMbCylZ478zZW9jvv3NPcy4xhIgpiOyFpg==@nongnu.org
X-Gm-Message-State: AOJu0YwJ6iaN8E2fuXzvG7aFRIabBkPR76NAAP3ZtfVsYq8B9QTtR8VY
 DnoT+rZOLJkjfUfxht3UZ2mE+J/xZ0u6AsdS40gg202+2JFSDzLKa1K2g8Ex6Nvv1UE=
X-Gm-Gg: ATEYQzwvUmImB1xADRLyOuswg1ETlmUR+IdZOU5hyRzJ/NtarzBD31BiCN/SrioAF1m
 ap5niQtVz+AMgseka47yERejdLoOuiwhTz7jh3AiCEH8R4PStHDezX50x2BSEVZQb5aMzA4jFAO
 yN5m/22g4q6QI7t7mg3+5W6qiUuPUBH9WzYVRkLZ/HrOCdOXzpPChShamNuqlWF3TnSkCY3dEnx
 YwN+dRsD5wYobAMY9SYSWUid01yhhl01ciEdiOPAA4xwsyC8QAZ6qRAPKlEuBaHLX26xNlCfJay
 +ZtML6a7I/eewBnnoa22Vm0JXJR54inznUOJvgUjJgx94XK5WhxjWNkrbuBmzUGpj6cRwx0okbk
 x601ZoZ0jzkOfc0+JSgvh6cVzbaogYebDTFr0Zk/15bk9oOsmPBO4hikKCSvcCHazTSqj3otEWm
 MUgwZbAMGa+v+eBsCBlBSNZXmJNF4BrENT7XK6kzUemWvmQB28kXR/IZiyoyAEHz9Z0A==
X-Received: by 2002:a05:600c:3b21:b0:480:6852:8d94 with SMTP id
 5b1f17b1804b1-485198955a9mr42876505e9.27.1772637588688; 
 Wed, 04 Mar 2026 07:19:48 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851ad0ad2fsm21352735e9.5.2026.03.04.07.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 07:19:48 -0800 (PST)
Message-ID: <b7d78917-9e28-4472-8418-86bbc26465ac@linaro.org>
Date: Wed, 4 Mar 2026 16:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] hw/arm/aspeed_ast27x0-{ssp, tsp}: Do not access
 SerialMM internals directly
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Troy Lee <leetroy@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-arm@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20260303222143.142741-1-shentey@gmail.com>
 <20260303222143.142741-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260303222143.142741-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 3/3/26 23:21, Bernhard Beschow wrote:
> SerialMM inherits from SysBusDevice and exposes the memory region by
> means of sysbus_mmio_get_region(). Use that in order to avoid accessing
> implementation details of SerialMM.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0-ssp.c | 7 ++++---
>   hw/arm/aspeed_ast27x0-tsp.c | 7 ++++---
>   2 files changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

