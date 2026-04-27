Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F94FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:41:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHISb-0008BT-4K; Mon, 27 Apr 2026 05:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHISS-0008AS-II
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:40:56 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHISP-0002f0-Ct
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:40:51 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so131525785e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777282847; x=1777887647; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OI/XUUmJ1k9bCiqYw7ZrMT82uZdii8WejCNlRJKGRqc=;
 b=xCx0WNjpYydS+6Iqx+KLOHmnSEPJjMxCoM/kF+UaQO1bmSPvG5ALAicYZciinpo+Ty
 4qaHJMDMAnhs7+no99m0owIWU8m3GQpGLKvTyAHZgVmYBCP2cRSDF9Tq82bf6TiL7ZAH
 hutyWAHRw4rmHofnGf9T2Pc9z3qgabDo8YzuovTRlJxqObpj5DkAez3AvGIqBK1t74U5
 4Axgm49n/v4C3deXhUeU1FG05ne/05GXAgAT26NP4XsHCun9H3H4zOOTOIiknwEWIS45
 1Vtg5yEuTSnI8twWL+NTL84dM2wEvc+UkOf/IU7umWnOJmnODZ0cmKS2lRWUmEn6jCAK
 ci5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777282847; x=1777887647;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OI/XUUmJ1k9bCiqYw7ZrMT82uZdii8WejCNlRJKGRqc=;
 b=VVpLDS0OdfYEBzqDGunfJ55IsR82LoLbo8quN/uDwX/gXtcX87zDs1YHcLiRpiCYVP
 vxQXyzC7HzoqReSgm/pNaUbclaTrfso3ZM5UyEyF1+Hj3xUjDpTUVLZJPZTFzRjLBF6Z
 siU/dC45hztluhaFzBk1vFhbEIoRTCtQhC/0aU0OFEtI+D2FExIUMTMdwpIF2BYGxzmf
 VXj4g71ai87ZRgSVOCSMxLJ8DyFZR2aa3t67AwTmWzyLYbia0/olxEJBpOSGGmjUgRY8
 dIOehqgb/Ho6A7ygCfXWPUBOeght55T3DtuW2iPlIrgXi6cSQcZ02enzQSPBhTVrT22W
 NFEA==
X-Gm-Message-State: AOJu0YyvbrEQkeg4BGcHp28JN3Qgj+al+YvZ4Qur5B+ekgqdrnZQF33K
 xXeh3lTsxVwAfM2CAMo78+oVOwUm+jh+k3/qLEAD39b4lcoYmvAx6LsX25sK/s8IMvk=
X-Gm-Gg: AeBDietH7KFVlEJHaW9ANJFCkhHexbKrU+XA6bjtqk2C6LekzZhfO3u9Cpau5m3X5n1
 +kspwDx+XoYBftteQjYcNq0k9KNibNDLzDm5m7xmkmJXlYPWWRefHb4vwPIbqZHcZgEJnFkdnAj
 QwZ0fSyus4HcS9x7eStcUdpJqamBT/F1Fardw2GfZY81GPY0SFCwwrmQPUWxKKDx6/Ctyv/zJmB
 eqBna7f8LREaMd942bjuR7Fg2Hj0679T2ruwpvMPt4EQx35E+2kpsE5ZM8/z3bAhF6D0LI9qBn0
 lI2HwiEEX2Zvwow+ujGQcBZ43+W4dHVt6XWpjSK0kXnfV04C0YdbmttAGLZSYbTu0DBLYduV6RX
 dGEoCrwhFdgYvjzTUo2Z3UjOS2hZGmH68hm2k7qGjft+aYoRXjFdz03XO/7+cLBGBUobX4pjUDs
 hIZF4QZwrHaKIsCH2dkX8VGHI+Au0jKxF2hVZWN8kdPMio3p/wdww4BNcC+8fEJ4onAv4wFJzTG
 wxX
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-488fb771613mr456821255e9.18.1777282847172; 
 Mon, 27 Apr 2026 02:40:47 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc18bccfsm704168415e9.8.2026.04.27.02.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 02:40:46 -0700 (PDT)
Message-ID: <8a4865a1-3641-434e-bd65-6b58f5d336f6@linaro.org>
Date: Mon, 27 Apr 2026 11:40:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/84] fpu: Drop parts_addsub
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-12-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_addsub at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

