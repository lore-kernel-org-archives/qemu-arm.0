Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637D4FF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 14:40:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wISYg-0003za-GQ; Thu, 30 Apr 2026 10:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISYe-0003pj-OT
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:40:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wISYb-0003LN-UL
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 10:40:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso367833f8f.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777560000; x=1778164800; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ts9cI2gqtYsZYFh/1UeW4GmwV46pLpuX7ykP8d7YV3E=;
 b=IOdM5gmApTvJyObVWVmCkbVNgIqx0iCb9QsBvaht7uY7CkQU20fkjZwxOBKH7G3W8l
 gskMegf319PmIgwQ7xq+doQ5KRTav9pE4TWHbqGzHRpyMeYm47ckaNkLTroyy428rJvJ
 LWLyzdwrGDfPfCEdaOKXuUgO9VN6/D5oC+j7udS45VNx4poBvG260W5VUEKx6Q05Sxz2
 hGWEMdcmOE0MGz2a+I41PK4OaJv92Z3pTQQAyIMGckPVR5kygIsESAkisyDNz42lGjwC
 l/t9z63i6KrNkH0ZyeIaSlrVW0LE3CzjroYTxbY9bIsOOLhOpK+uLVMcrF66rDvrqlQz
 tQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777560000; x=1778164800;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ts9cI2gqtYsZYFh/1UeW4GmwV46pLpuX7ykP8d7YV3E=;
 b=PVNZIO80T/mokzqO+XZNA3nJoZex16bIqEanNpjIKtr448yWTZYhOaXDnz6CUS/kUU
 Ll5EUEAvXtTTn8rTkBrE3pkvSdIWFiQoxmfnVIzQKdC7uis/WTwzQwn6UuzNcNqIkq5F
 A+QpYA09rMRPciTyiZL5o/YXAYO4UQ6jt1VGep9Ga7BX+7iu9PCkU0VcMOSEMj9wOBzR
 bdojiZk60Bw+94E07TXuMuHPGUMTbOIif2COskanU4Ils4VC0they9p/nFJhJk+o5hwC
 p+6eq7FaSpQgA5G9rfHECq6buzpak4h5QOH+0O5ijkodL+Jol50yd3oiibDdEFUVNRlL
 9NTw==
X-Gm-Message-State: AOJu0YynzNeqyTZwyato6oLT7Dvs7QKts+6pKbiX3kFBO07KZtSA1tP2
 wldq8rZxXlx/XAr50xZyIp4ZXPscJeaoMIHox1AKcOJsTNHtv0GNx/eqDSiwSdir/iE=
X-Gm-Gg: AeBDieu7VZnwGO5pT/LzPKlgdAddTGBZFdtmmcOef6WDRm1WCPjYRVrgzcGJSuxu4cy
 swjY+gCh6Q5X9jqp8kTsWvAomubF3Br9XpjzEmIRbt6Ad1wCvauAtbTBzYCWQsWW7lltCuuIoju
 A1P6lj4ZN6GLYiqd752B/hOgkZ3bYe27xC6S985RHjmK9Yo72WJTpTXpnuHFv0yctQcW3SGyi5n
 OhY/GbchauQAMGphybkxcxECsXCKqIBUah2eM7I9aj5jTW/V+PpmtTOum8DeSZu8/H3DdxXMK9d
 bs3f3w2QueFqqoTXnFOVnkj4/lhE1DOpxlCZYHM+Z6rhEtcLxvGsusrR4v84IV9Ee/wTppiVM7h
 ssMLHvumSfbJ5hdxuZCGWDQKZ5Ceo8Ri92xb//pxcs2fXYwyisHWZ1UbwANqwgGgacIg1hVQrN7
 nJCzODRq9a/maFQ18+Un7W8wg/4KbBKP12HH0SMBZSMqX2/X90zIq3mcYD7s12Nd38MnIVR7VfO
 Yzt
X-Received: by 2002:a05:6000:1a8b:b0:441:1e1e:a050 with SMTP id
 ffacd0b85a97d-4493ded5902mr5468908f8f.16.1777560000244; 
 Thu, 30 Apr 2026 07:40:00 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b3d4843bsm13113482f8f.7.2026.04.30.07.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2026 07:39:59 -0700 (PDT)
Message-ID: <df7125a9-a3ac-4127-875d-b2e81978ccc8@linaro.org>
Date: Thu, 30 Apr 2026 16:39:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/25] Remove cpu_get_phys_addr_debug() and
 cpu_get_phys_addr_attrs_debug()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
 <20260430093810.2762539-26-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260430093810.2762539-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 30/4/26 11:38, Peter Maydell wrote:
> All the callers of cpu_get_phys_addr_debug() and
> cpu_get_phys_addr_attrs_debug() have now been updated to use
> cpu_translate_for_debug(), so we can remove them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/core/cpu-system.c  | 20 --------------------
>   include/hw/core/cpu.h | 34 ----------------------------------
>   2 files changed, 54 deletions(-)

Yay \o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

