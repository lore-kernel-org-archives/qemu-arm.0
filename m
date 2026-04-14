Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB91FF9D0C4
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 11:54:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCcKs-0004rd-5D; Tue, 14 Apr 2026 07:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCcKr-0004rO-GY
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 07:53:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCcKp-00025Q-93
 for qemu-arm@nongnu.org; Tue, 14 Apr 2026 07:53:41 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso53278965e9.1
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2026 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776167617; x=1776772417; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sya6TlpsOda6KIV+hWvvYKea9jRr9NPJhmjkerfAYzQ=;
 b=w8/T8/Cwt5rdYPhXxI1NpN0dtA79eQ5qkS/hSvxGxI3BZYsBFi7XL0LiUYwmqhhD46
 Tbn1Q5G8irDLVnIaeEEgxruxUbnwy0w0J+cqXzMvhtDBjHcW+W/1rQu2yKBnI//1sBts
 mm3leVN1RWqs3xD4ziP5vwUj8e8DjGHCWTf01ORXHjJ7axQaYR97ov8Ojehxt2+AQpMQ
 c63X2v2prwR9cFJOh1Owiq82VkOAyUyhuzS2NI5oiCZdeKILA4ry/2hXh+FI3nZx7F8w
 h/puzRlQZm9cn7wuFeuDbVfxVtE2AfAgsSJQTttqL26zQaGGNIAFQl7dEQifNyT7ttB+
 Tveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776167617; x=1776772417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sya6TlpsOda6KIV+hWvvYKea9jRr9NPJhmjkerfAYzQ=;
 b=XS+MJbpJ4NVP35Ra8lsqlCsMYSRAtpNE+rwhZNeEyO1xVSUJfRcosdxBHyFbahGj9y
 G4Rw5Ac6eqES3gopWCOMo9pUKfYouofh2+bmIliDjfB2Z02g1aRd+JWaD3HoFnH2w3Gb
 4X2JxxuQiRr7sS1O9B0bb9YYVGf8UKyTYpkpALW5d/ewiH7vv0c00w85WHpc1RPqJNNZ
 xX+/D4T7Rwsw7DzUXJAwd/FwMgPCCureWKiXFIkVxLvagkSVidbO9ci6SYIzfmZjGigX
 X3Tmc8xSx5hWFvwDnFCnYGQDQ9JUbp7gNbDfltp220gP4sRl+irPUhxFjAbVYQIPpmQt
 33Pw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/mLdtM6PgEHjfNKdwSqdXvEAy9n+ggKaAhXYqN1Zid26y3uZqSc7cWkS0lpBGiCS47+lRFzZE4dQ==@nongnu.org
X-Gm-Message-State: AOJu0YxFu52RSP8KvNq+ueIzn0TnCuvijMFGsEoI+zI+zD/0TrYhYlzW
 v8Iihov9ayTjNcy27i3RTYo2tj5iITHCbrK/s9SGu/mtthuJCu8EK7PflecFy2crDOo=
X-Gm-Gg: AeBDiesetmCqXpSSrm71xVKcWyBXtCsOMx7PmLsC7zuw1k+E7GEDp9LrMg+aVzP88JO
 GZTaYys50nCI1kEYQ4LQ1iaMU8O854RKQyErqbXurOYd3rRazA/arIzij064YnTiZKrAyBnWhQw
 cA7DqHnWfdCejp2nqL3xO6vfT+5LsGopeoczSGg3kD/A5ZioEZGdRrReR1zR3uBEAnrFtxZE6Q3
 VcB8rBb6L5fTJDYq52HXlGxYSpRe3g6ztwxqm/bgqju2aL5SZ+dT2jt1vxAkLlMWmJA/WQ84FQx
 zrOTrB+CoVbk+XGM9tFl1KpILElTJiY0Nyx0QbksYsplvuhLxK2fMhMgQ05dx62dA1BtTLHg4fe
 qdCTDyXn1MtbSq/Dftu7w3hGwG0pllCJ/Ur3nzsRzM7VRyMgM4hxuhzzK08XU3Hdb8pjWRw2duo
 oxC+MXwbcTnWBomgpYxJWVL9t0YOmTQl7BLCK8tnkq51KDTciNN1/K1MI9WPJClCGQjg==
X-Received: by 2002:a05:600c:a411:b0:488:ac01:72de with SMTP id
 5b1f17b1804b1-488d67ec72cmr187904215e9.5.1776167616992; 
 Tue, 14 Apr 2026 04:53:36 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ee019e44sm78591245e9.15.2026.04.14.04.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2026 04:53:36 -0700 (PDT)
Message-ID: <457318b9-94a6-4b91-a963-295bbf44c7e2@linaro.org>
Date: Tue, 14 Apr 2026 13:53:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/65] hw/intc/arm_gicv5: Create inbound GPIO lines for
 SPIs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
 <20260327111700.795099-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260327111700.795099-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 27/3/26 12:16, Peter Maydell wrote:
> The GICv5 IRS may have inbound GPIO lines corresponding to SPIs
> (shared peripheral interrupts).  Unlike the GICv3, it does not deal
> with PPIs (private peripheral interrupts, i.e.  per-CPU interrupts):
> in a GICv5 system those are handled entirely within the CPU
> interface.  The inbound GPIO array is therefore a simple sequence of
> one GPIO per SPI that this IRS handles.
> 
> Create the GPIO input array in gicv5_common_init_irqs_and_mmio().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>   hw/intc/arm_gicv5.c                | 11 ++++++++++-
>   hw/intc/arm_gicv5_common.c         |  5 +++++
>   hw/intc/trace-events               |  1 +
>   include/hw/intc/arm_gicv5_common.h |  4 ++++
>   4 files changed, 20 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

