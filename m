Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A13EF8FF4
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 15:22:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxo38-00085n-S4; Wed, 04 Mar 2026 10:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vxo2k-0007pH-VR
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 10:21:47 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vxo2e-00050M-35
 for qemu-arm@nongnu.org; Wed, 04 Mar 2026 10:21:42 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso63704555e9.3
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772637697; x=1773242497; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QlRN3GtoWoriKA/xgEvwpTDc9i0Ng4RtW+yCde57ww8=;
 b=RtVWGW8WnYZeE8mJIJogiTaTrY9DI1Mz6MDfVrJYepknY/Gb4Vlf4ee3J+4JwuGG4u
 yv3xTM53/8ENhyavowEMVptQahOALBpZIHpOHeIucSIuqqcYlIM718feQPruIwidIalj
 lmaeWZN+1aFg7B4kHoXKmUS0zW6Hvo5PwbIN+bT88MLqfsWhI1Aq2Zy6EhDZGuA1IWur
 oyf23I4aplveiQGKrvAYlabqS7+TM/U5TwQZe3gpK55ymhKaJ5UXHe0SD8y1Z7NT2WW+
 +8WcIQxLaPcGq/O6sFg4ToPBesZMG2o9bQMuidyW1sJQoTuCCHXap9JGXEFGjozSOSBq
 iSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772637697; x=1773242497;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QlRN3GtoWoriKA/xgEvwpTDc9i0Ng4RtW+yCde57ww8=;
 b=rnbKahoctcRW7SGxuoOPvnLgx6+y6Zr+Fu98GbCf3IdSxpsjPCU1Tmy7T2Iy5Byqud
 PE3+Yd5DTrHMZN9YxOlPFiCrNoKikP6ZZN6FWIg3JI39F8JC7lba1/LptmGiHmcW9Rry
 X7zeLt3z1qm8clkJmkJ8LSdPAKNErgBhPCS4/dbdTWszbHQN3/Her3glC1mQ71fyMCEM
 AHVFUbRBKF/8TzyhhTTpoPurhtRVdPkh7sg2wRW6dYd6pG4fjl6LdAGgO1N3CKLftGEB
 3F+3bUp4BS5AnCHxZNX7Sg4JZoTijUs5dT5R43NbSfriNYv+BTa4fUnKWfiUhv7nfVx3
 ceKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVTkafE+jJGEz5o19nnQBOcXd/AXH+ehJr+W5bplgi1khiYA69bU8KvhVPg4pjqtTkPcWG+4R7Qg==@nongnu.org
X-Gm-Message-State: AOJu0YxQCcghJlwv/iy+7JMGrfNXVQrdaLwU1qg36Yq5Toci1keQReJY
 8cwkQBEoZ8Tw+BFrPfM8trDvkz8/yQA/gloLjxMqqMjthuR+5G544fWR/0YODTL5AaY=
X-Gm-Gg: ATEYQzxJiH+mqpVmUPTs+nO06hVnRDMl8lgGvvstf15YnAz06SO4QIyazwS8ELJbx1A
 Nup/nc3bhqndHkKVB2hqNh3cq/tulMDMB7YCT34n6/1yPABnHp0NKJ0ccjrOrOyGJl5x5xb+1a8
 B+VC0/hs/+2md7sHBpeF9+Ml5yiEJHQQWjxpkoho9pI8qWRZWg+FMMuotx6QANPJHX4nsNeUEGm
 P+5mTDdqikz5TIKD6HkkW388r3CCKpw+5WLgX9DXZHS6/QnerOKcC429IOamwYRwk5wvlF4AlWT
 rMFxbdcvkmvryhbrcYipWQYdXpPnx9eOMG1EFkbXqyZnggHLfmmIRV8cZCJLbFq9CusAxZBi4+W
 Z4VHkJFV1L3HClA04EoSAuj+z9Q5lp9te2K2gmWaudUss9T3tvuFnU+6VQqkoa8KkODzdSbI2ab
 gfCDIrpjgfmpRh8UWSmeXYv2b9kgZjIS2wN2TElMUmjctmDesVh9DOA9e2j97Q/F46SYz1kPwHq
 Xra
X-Received: by 2002:a05:600c:46cf:b0:475:de12:d3b5 with SMTP id
 5b1f17b1804b1-485198cb8d3mr36710915e9.34.1772637696864; 
 Wed, 04 Mar 2026 07:21:36 -0800 (PST)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851aceb94dsm21466615e9.4.2026.03.04.07.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 07:21:36 -0800 (PST)
Message-ID: <397483a7-0c58-4573-b3ef-908894b570cc@linaro.org>
Date: Wed, 4 Mar 2026 16:21:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] hw/char/serial: Avoid implicit conversion when
 tracing
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
 <20260303222143.142741-11-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260303222143.142741-11-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 3/3/26 23:21, Bernhard Beschow wrote:
> On 64 bit targets, the MemoryRegion API passes an address and a value as
> uint64_t, so use that for tracing. Keep the uint8_t for reading since
> this is what the device model produces. On targets with less than 64
> bits, uint64_t is wide enough to avoid narrowing.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/char/trace-events | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

