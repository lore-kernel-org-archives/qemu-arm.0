Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DE9CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 11:27:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJ8zv-0002j8-MZ; Wed, 12 Nov 2025 06:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ8z2-0002HT-Qp
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:25:56 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJ8z0-0003UJ-Qp
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 06:25:52 -0500
Received: by mail-wr1-x442.google.com with SMTP id
 ffacd0b85a97d-42b3377aaf2so399200f8f.2
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 03:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762946749; x=1763551549; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mEizBFDht0ll0J0V1XRv57eHY2kSVW5JoM7uZh78NhI=;
 b=y6g/N7eQL8Jdb4h58RYA19ytlXEGL91VwQHcxERtZ1ydys5xF6W5EdRE7XPR0dn3or
 BsFQ4+6aJZVScp4/gtrS10VPVYC8MK8+AT1pv7wV9Rq2Owk84/HJAQFgS03yQvsDKhmw
 pDjIySKEKj8gv6PdROll8xRa0R+gFgkmu3rpTVZsaThbNIPfCmSoBW12STKTPEzn/St4
 KvdIYGNYPiq0ZVq32Co2OgabD3Ik+GSDH+rIAvdI0R5vXmYRy5pQwca7aJpsw0ZceQyH
 zpuMjCJ5wgvrrQ8vqCJ2K6HZ5A9WXRwu1xY9I9kNruYTWdUTJiNPiBDRuSvP129Xfqfk
 qQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762946749; x=1763551549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mEizBFDht0ll0J0V1XRv57eHY2kSVW5JoM7uZh78NhI=;
 b=KV8z9vAxkd1yu4c30Yc7f8DZDcH86MU1uWFXprHFzo9taMIfujldwaeESJlmzTUi9g
 Hj/4ZL5yLwvzdeU7QKiPnztEWUkKdY59LHdsInpY8Te1NdWwJOtft5eI0+LwIk1k7Hwa
 RrSzgBFIC4mJ1GKK/GA5i9/nG/KrGMsh5EErU1nuN26HXlfPXPVozzC01PjZSPV2/AQz
 WmaQss3eVPodXUGR4ohQdcljgPcOR8Y8YAjJWobnF9uWYj9YcDfEQtMocZZhCrdYhPgy
 wC3A/DgNpjmnG3Oaqxo03lxHz+b+7Iy2lz9Rq1Zqc+aeeMernkfQrsOVxDpehq1un4Bw
 jD9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxl1tyF/c61Ix5BUbytcpu7jHziNmGQvnAi1bq+TE5Zd84zAOaeYvOxjTFYfCG2D0/uRWcCmX/vg==@nongnu.org
X-Gm-Message-State: AOJu0Yws9mI9fObFOdb3/4VXqIrWnQAjiFBA+1yRvigVAvM8A/MneOhl
 eLEBPqvJ3+g2xP2+rFZe+vF6MGKbRJioOtqtbf/60sch/ErTMCl/87qswTqVQ62gCc0=
X-Gm-Gg: ASbGncuPM/sN41PnImXWBwH3fGu+9blreIsfFVTIXFeu3RIrzSIghCHNGbM1SAsj3gA
 WzcPTFuG7uTycdRpNMahpfy8SNXSdK12NJUc51QxfH/rZqG6IfkUUjLitoyiH0STM+IhUsN7QAL
 dlL8bqYtAqJ+VVzmwNAtMu2377qaiiIon7L84tTyTz32Jw/hYccTVjhzny59D/sqnAbVjAM+1uI
 XvjEok+JNwAxruzDkhccmh4GXYXB9Cd4nFzY0G/IUIx8Mb6khtWJkgQs1BtU+hyi2YPYTbL3bDA
 346Oom5voSt/NEwKNey8Z+VxZ5S5/XyFwYIQ+VieSUqMLCcOo2AswwqpSC8F16+N9+tP5MywK8i
 3qhgSHnk2QNB5Ylus+tVOgmBgNHtaX9ifizsTUMEUVOrnKbxMlYsFep0LwiAAf5z+0KwEMIh8Yc
 q2b7F+LcHHfUDoChAeTktSNfCpQDJaT2QLNGKL4rAuDSs=
X-Google-Smtp-Source: AGHT+IFdVGBcAAUyF+eBY0O7x1fRuy8t93QfJF/q5Ci5DPi84pYxTrBvxpVmRp5KQjJdI4X3D8IHhw==
X-Received: by 2002:a05:6000:1849:b0:42b:4267:83d5 with SMTP id
 ffacd0b85a97d-42b4bb8f405mr1854322f8f.8.1762946748665; 
 Wed, 12 Nov 2025 03:25:48 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac675caecsm33616306f8f.30.2025.11.12.03.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 03:25:48 -0800 (PST)
Message-ID: <70da449a-e463-4475-b465-112aa7c22e60@linaro.org>
Date: Wed, 12 Nov 2025 12:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] hw/timer: Make PERIPHCLK divider configurable
Content-Language: en-US
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Kevin Wolf <kwolf@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20251111102836.212535-1-corvin.koehne@gmail.com>
 <20251111102836.212535-3-corvin.koehne@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251111102836.212535-3-corvin.koehne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x442.google.com
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

On 11/11/25 11:28, Corvin Köhne wrote:
> From: YannickV <Y.Vossen@beckhoff.com>
> 
> The A9 global timer and ARM MP timer use PERIPHCLK as
> their clock source. The frequency of PERIPHCLK is derived
> by dividing the main clock (CLK) by a configurable
> divider (must be at least 2). Previously, the PERIPHCLK
> divider was not configurable, which could lead to
> unexspected behavior if the application exspected a
> different PERIPHCLK rate.
> 
> The property periphclk-divider specifies by which value
> the main clock is divided to generate PERIPHCLK. This
> allows flexible configuration of the timer clocks to
> match application requirements.
> 
> Information can be found in the Zynq 7000 Soc Technical
> Reference Manual under Timers.
> https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM
> 
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---
>   hw/timer/a9gtimer.c            | 19 ++++++++++++++++++-
>   hw/timer/arm_mptimer.c         | 19 ++++++++++++++++++-
>   include/hw/timer/a9gtimer.h    |  1 +
>   include/hw/timer/arm_mptimer.h |  2 ++
>   4 files changed, 39 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


