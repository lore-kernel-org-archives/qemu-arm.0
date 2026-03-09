Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5EDF3C264
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 14:12:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzbLB-0008B8-9n; Mon, 09 Mar 2026 10:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzbL7-0008AY-Tr
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 10:12:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vzbL5-000162-B9
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 10:12:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-439cd6b0aedso3877202f8f.1
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773065525; x=1773670325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DmTPFRZuZKZ9TcQYS/+Qyvea+nr1OW3qIC6tazTuNrE=;
 b=WjjvEgVq0kVlyzlyWDsXCI0geIXstJFWXIdSMgVKkG/aYo4gX+dOjbuwbRW37qXnS5
 jaG0pvKqZtRFAZusa/zeAzm7JGm8HawAFYlmAGGVCc/RllnEnl2z8Yce9wvdkb+1G/QI
 +cExt9Nx6HjKY17v//IwF6wW0VujMosS4dlq0NwkvGsti9IGwCrS7mh22RLtvgMVFHDY
 qrnl43lGMHUQVNCWr2D6BeOpNIlLScdKZuXoLeW5BXMTEozPIaT5Wi03uls4vY40CpFm
 ASCM7vt2UsBmtvGQfuzy7B8O0N7r+xrnSkLnN2tc2zJ887EkhFbyg+pUGqw6chStW3tf
 OyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773065525; x=1773670325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DmTPFRZuZKZ9TcQYS/+Qyvea+nr1OW3qIC6tazTuNrE=;
 b=DwWy6YbTjZ1gz4sPeVMYcQYQAvbmYrHUmYfApk7JeagaIvrgbZYGcSWUIS0taBUPl1
 W5+0erZ1KlIm2iGNjrpnD//zajfabb8YWckvGaDzf9TsFY9NgBettqJnfX9e2UQeNgPT
 kZ5Z/gccd93pufg5IkvtCIYdeCn0w+MGJUX+S1S2HG3UbHf26BMyLomJPkSr7SlIP/ef
 aupFEf2wVdkx0EquqDeckHlmUF/EnFgDfuOkLcAYTuMHiEnz/ZOPpJyT38L5YuI7oykD
 /6lyFEY5K7rct9zUK6UAk+MPTs9o2aPoOEbiJDuMS2NLyv7rFe8w9dGEi1+LW9qbhjY1
 R0mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS5mlnKJE2EsTjPxcuFemI1LMBKeEQYsHg0BkMm65qdmQq1TgObnUdfC6Zvjh03J4VYifnNmRRjw==@nongnu.org
X-Gm-Message-State: AOJu0YzIJ59JmuV89cfYSz3wM5J6KXDivrtQTq3Xc1ms8D9fQHK2Coed
 atJtQO16zXnzAqAIvSckaXViGWfFY/yRoTIZ3S5xi3PGgXZof1p5Wdp97gFuLR38SRwrS2orNph
 mYeaK5Ks=
X-Gm-Gg: ATEYQzyLOdELgtKVON3VqfU4qkMQkxUwB8+e3NRP0trQ2yfPcQIreYNghhH9+YkAoaq
 cfp+XD0EiSiWF+x/HitJ6cWtbBbf2H+SjzDGASF5V9atCBmA5fMeUxFwcneeAposquyVILV9fG0
 msyD1c3UjtaPd9H11ebbDKph24QJolYPeoYcP1fCYlQofSLpVmJs1PP/EFnHwIGq/Eu3t36oMBQ
 vd2IPo22x/8CvmPFXTCk6kSB9EmsFVfJ/zQM1/+Dn+ejG+iKl2BLWks91uGeurK/xVnaAfmlBzz
 wDIchQhjWEKTZo7f0qa6mTq3p13o5BFvAdfHTViQ6v11st1ksqGR0F88K1amaScOGli1hREo2Uv
 agwdKsxGJYyACaGc16vH93AQU4KeCdHOMNw22tjTMlt4yC6QcvlyL6aKaJ53xqcDiqnMxkKdMdn
 zWVxmVF2Oy/xbho8DpLX1UT9VmjLPzBGsGZ/siN1CkzV9ceOlIIsFr5bgiyK6oTK3du92xQmQ=
X-Received: by 2002:a05:600c:528c:b0:485:3d3e:167b with SMTP id
 5b1f17b1804b1-4853d3e20d2mr33537765e9.5.1773065525329; 
 Mon, 09 Mar 2026 07:12:05 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853438017bsm212850545e9.0.2026.03.09.07.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 07:12:04 -0700 (PDT)
Message-ID: <2d9826ef-1a72-4d9c-98df-601829fa43fd@linaro.org>
Date: Mon, 9 Mar 2026 15:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/net/npcm_gmac: Catch accesses off the end of the
 register array
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Jason Wang <jasowang@redhat.com>
References: <20260306154016.2194091-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260306154016.2194091-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

On 6/3/26 16:40, Peter Maydell wrote:
> In the npcm_gmac device, we create the iomem MemoryRegion with
> a size of 8KB, but NPCM_GMAC_NR_REGS is only 0x1060 / 4. This
> means there's a range of offsets that the guest can access
> that don't have gmac->regs[] entries. We weren't catching this,
> so the guest could get us to index off the end of the regs array.
> 
> Catch and log these invalid accesses.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3316
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/npcm_gmac.c         | 14 ++++++++++++++
>   include/hw/net/npcm_gmac.h |  3 ++-
>   2 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

and queued.

