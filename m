Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAB7FF8867
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:34:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSee-0007GZ-Ag; Mon, 27 Apr 2026 16:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSec-0007G5-GG
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:34:06 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSeb-00030b-61
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:34:06 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso6245470f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777322044; x=1777926844; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OCDuvjDGoSWu7UCMymvBuyHnvqaEwyTFQxwjqx2CURg=;
 b=i3zeYhsUFAiIg/ZiETLZ9TtUY1P6RqYMpMvQfolL/OnZx7OZkLNiKT2txzdVh7X8eh
 jmKJ6us4TKnfIePGRSldG71oBjFGjz3sbjePd8luHvJ3elXzejt7XagP4uPUNzjs0fUV
 ojrDGyepVbhRE2IsSf1tR4tdPxoL70FTgHmtq8qvjUPSRS3W7d+wMuZvDZ1cpBTvr7kv
 xIGRSbAu4Fms/biohV+a70CmpVBrso4BC8rA7LgFO41DOEDrWBPerLoD2A8PnAEJo37U
 +v7qTo4RMk0J5RQmNOZ2fdnmbz923+ATqwrqUPuHdG3C4fiWd4UQmsM0pocZGqn72mI7
 oOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777322044; x=1777926844;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OCDuvjDGoSWu7UCMymvBuyHnvqaEwyTFQxwjqx2CURg=;
 b=pp9lsiGdXPxH9p6VmwtaUuduyg1bRvpvHJaOvEj/pG5gjOCHWBz4cn2sALSUIlVWo1
 zZdtsvH9EP/Jx3jludHsHyojXiexoBUdqpmaPIog9ncWflgapsjkA/kAapqcmameV0Dc
 gBt5W5feWE9fkH81WTRNK7N1oqOHm7818w8LUmQ3iLsoIPt7Xc//xw+t94o+7BLBMyhi
 PPBScPexR2G/9PpmYLcRPsEFPzaAzkV1eDsWUHnfA3EErJbd4/XyLBt9d8Bk2vzIrYpa
 NKw+4RJqnJhLRYaHGGPteMvfQuFg3ADsBSC/tNIyMIWiuyHUjfi/kcBhp44skOcKRhUk
 u+8w==
X-Gm-Message-State: AOJu0YwSF9/+mshmSdVogixT91bSZonrWRolQjxLKh25gwfprmtEIywd
 csQEI3n3U0OfK9g62vkAUcazuXwNC1UB4cJKYUwyNJnz5I5SzjghEe2Aa5TLocP9OxcK9QCpnGo
 eEbMZD08=
X-Gm-Gg: AeBDies7dsqKt3z7D0HsDezn1MrW13385VDPHMybVhyKSuhV0JznQ21jRVA2VmLiXaT
 uMGgZZG1ifH6akhE7XUJBYMZ650X+vjz1dmD+RC7+ml4fE9CnkHZH73a+Qxbh+0ogbkOKYaW2SC
 4+LozmfDSAmrnsFCVMOdiYg1ihKM5uTgqjq2LYUuE7keLL8xddKR5ZCytWbdmwimkIxo6p5aP79
 CklFT7gJRzNV0G6N86Z1p+UbNCCMhDysdUNSuMHYUm/8j6GIsf7URqt1k298Q5X+gIcBNhHudPV
 6iAYrkD93UWgRrWkAHp6c5sGI8SS3WTKRWppAfsdqVysldOrdvShmE58eTmEYR82FugjQ3qVJYA
 ep8w9uyte/NdkUczzMJrsQ1V5NhKXwrDTVQtOyOZ8/X1DLXmPX2s9uaX+pRmYZyNOegd13ZAZPN
 V+CPq39GeFrTiCJcYxORWsNvBXw6HQkzioLOkCk4pi2usMpzmabso/eIc9O44pPxp+kYGMrvMEs
 PKsI8ssWgInYbs=
X-Received: by 2002:a05:6000:2f85:b0:43b:8f38:3b88 with SMTP id
 ffacd0b85a97d-446494ea255mr543614f8f.25.1777322043694; 
 Mon, 27 Apr 2026 13:34:03 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-446401431d9sm813557f8f.35.2026.04.27.13.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:34:03 -0700 (PDT)
Message-ID: <9bab4801-3c11-43bb-99a6-44469a683a17@linaro.org>
Date: Mon, 27 Apr 2026 22:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/84] fpu: Drop parts_round_to_int
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_round_to_int at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 22 ++++++----------------
>   1 file changed, 6 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

