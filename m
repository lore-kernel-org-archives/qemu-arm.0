Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABFDEC1431
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 11:26:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxNta-0006ay-Tp; Tue, 03 Mar 2026 06:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNtX-0006Wq-S3
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:26:32 -0500
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxNtV-0006SS-7b
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 06:26:31 -0500
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64c9707fc11so4003701d50.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 03:26:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772537188; cv=none;
 d=google.com; s=arc-20240605;
 b=O8/qCD1qnH/nQivck7SDIwmJ/DRYvugxuFc2Qm2MD86KBk7cy/fKR0eqmlUZo2h0rt
 KcNUhwvOlq0S1wbLMmw8DxBHKuUVQOu3fZCYc2jphfc8QfDTfBBXxMahaCdqAQIP7gWo
 c758AaacQzh1HqLH1x88ZbkGHi6snDMp+YYRugAzs8l0pEC9ylxf7um9xkqX2HIfms/e
 Nd0gjZee68EK3Cw8nh8eaXyAInwidZzHOQXJhh8KYcgb8Q3HjLHRe/72XhZ7fnpgRoi+
 Tk0/6zB6hFNHFba8bR/tN646CqjgZqx8s4bMNjJ/CUBdoC76CmyVsVgYbInxhRAEy0ad
 zOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=A8Z6WB7nAHorDaDqaWbnYplt3Wv86qfzGUQ5z4nwdrA=;
 fh=kSUj+axzb1GH2On1mzokkZ3kYbgZ/iw3sGPe68iojVM=;
 b=ZHPTc6ZtMu3vHqgP8BXP0etH+p7IcSK6gL8UrIYj//ydCcTJ/xo034EtZsgOuYtnOM
 pwSbnQf+fpgxnl8y3K9VbYJaONfhl4j8Sxn6Av9uEZg51E7PKwVRELWcHV9/K/0IPhjP
 92CAP7z8o6FiHA7SMM9OgPrFD5CePV+WR6CyvQTaSUtzwyBGyo4pcvZwfrKe/DkFajW+
 6IM7rJTvqo6mN4zSpvP/EYHAECXUL0N1G6zDxbQzENLdaNcX02z2WQ9WY+nGC2IfEY9+
 0FWp/0KsGZ996hMCrIvGaQHSfYPsOAAsWxBxYHAJNxgLQ4S5XPhTBUGBl0L9bCdLqtWx
 gV+A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772537188; x=1773141988; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A8Z6WB7nAHorDaDqaWbnYplt3Wv86qfzGUQ5z4nwdrA=;
 b=LbBrhFxYq08qq7IFB9tPXPssStJKjbxRpY4ihq2sQGG+8qBY/yPFBubVpvxwpgp3mI
 pod2r3voZl4BJx+n3dUS/zw3w0USKrHDyncLxNrwIMc1cgPe92rTS3j4wcvNhkq2NP6m
 H14OpmYQicd28YKjxz7n8m88gNjLS5HvXaGKPKxTBHTJpr5mjNLRzXL4O9pigNaEaJMP
 kEHvqrCc13009J8VkXa+ntRUTx+nl3cJciqtSBNOQw2HE4cAyC82CFOgAgov7yiJRLu4
 ehsUilVbb/5pygLYFuxNgLOrGV7zdOmobPkRrbJ/e2WVkri7Ml5MIuxAyafNVY7sPP7a
 zygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772537188; x=1773141988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8Z6WB7nAHorDaDqaWbnYplt3Wv86qfzGUQ5z4nwdrA=;
 b=jkeGdrLmvx4bi08uznde1fGPNAnENfSYvF5NPmXk4oHSpM5I/0JripoGKGrb3R2c/N
 rmPE8gfboMDfgW6rQqKsySCEt+FlVGuvvoxcufwg+7bV3ToFUb6NlmBwvBP3FnpJvagA
 eUWYWI2yH8A2zzaOKzTHMGIgZ3dKUSXqMieZlvdd2djvLh34MtKfXHR8BxqGvz3ZmpdL
 fkLj3+GihU/E5JxutFrlLhxpCbTM6GsYt0va2mnj8rlMdsNQvVF04lYZJZUB0CneWqPr
 4f53BWv/YVl0meZ6wlmbcR1DsHsHynoygp/mrCjHR3DXHZS23xDT/aG3kFBXzFkErh7k
 fGLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnRudVVjOAMPh280L6logZk1TI7go8xZW5W11VxqP+zPHkg75EmdttN5bQfXXvRut8batoVDpNBQ==@nongnu.org
X-Gm-Message-State: AOJu0YwmTAXXMq7Gaj3NiipJCVc6Gfyro2o8Z0yi8uQTFKOpDC+JEKfl
 vp4+TArkaeGru8x7AWfRzQvf5cwyKmKNS7u+H+XUDnTlDMp9MBm2DZkqpeki+MzInVJ+JkLuhNr
 MLJSGaeiE2mzB5/g2to+bDZY4sUb4JMaSDnqfmqb2sA==
X-Gm-Gg: ATEYQzwMHsXHqh0nxuqON87M7DFptQW6bOjGh0TSLIY0aCOPSIqXw8ZhcOrwjdpTvgd
 biYGd/p9dxG7gzMKShhEUbLGifqkN0VGBT0zrhdPqvKAbaSRLll6SLP8FJK7ymKgI5jroRhwgSL
 eHFnVJEAR2aOOt/0KLeWZhJcw8jFg1iinFBYbKa9geLY2Njh9QAuSUoruNrZMYriw01v9KW0lfP
 qQWEKJS7Uc+qETQgEq+rGoZQtF3+rT7gx4uylx3Fqb+cr2odNUR6Yo7budqPU5B3qoqFFlmycbX
 8iRs2Bwp8IdFKXpyhgA31Y3OMT3p6KADJEvy7lYASCoLtP84Fwrb172Rx3i1becY9nFL5hB7G30
 SmA==
X-Received: by 2002:a05:690e:200a:b0:64c:9a66:9a15 with SMTP id
 956f58d0204a3-64cc1f48e32mr9005665d50.0.1772537187643; Tue, 03 Mar 2026
 03:26:27 -0800 (PST)
MIME-Version: 1.0
References: <20260302220254.1166849-1-shentey@gmail.com>
 <20260302220254.1166849-5-shentey@gmail.com>
In-Reply-To: <20260302220254.1166849-5-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 11:26:16 +0000
X-Gm-Features: AaiRm53ag7NYA0odo1z328R2rygl5caJ5bc-pave17NaE3VxBF2clreQwFRtOag
Message-ID: <CAFEAcA9a+HSvZsX0MbqMbEEcJrVEXpg-Exu7FLxJgMWgotzjHA@mail.gmail.com>
Subject: Re: [PATCH 04/12] hw/char/serial: Reuse fifo8_num_used()
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Mon, 2 Mar 2026 at 22:03, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Avoids accessing private fields of struct Fifo8. Now, TYPE_SERIAL only
> accesses struct Fifo8 through its methods.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/char/serial.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

