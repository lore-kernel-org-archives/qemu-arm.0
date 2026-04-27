Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572BCFF885E
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:37:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHIOd-0006QS-0D; Mon, 27 Apr 2026 05:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHIOb-0006Pn-2n
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:36:53 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHIOW-0001TV-1h
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:36:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48374014a77so131006755e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777282606; x=1777887406; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gUtLMTp1VVoYmJCEI83vJPhbSQ/45E8v9vR8XyLJMUE=;
 b=iM4riVqdA5ZOFKnqrs6iy4rKQeI1iluBsoCj/KukQuK+yKOgWmIyleCR6a90pdS4K+
 zXL9UUa/YKLAU82APkpapixQxA4RLjAAne/fFMjF/dwfCc1pvqMya3fSGuiaNQBv6eGt
 1SBWbJlxOodCxYr/Y/xNMhWDV3JiZmkOLJANYrHW7lkUQIOr2nCL0yHFl88m1hhmVysN
 0do1sDXDMQp7yrs9rL4FAYUQl7WwY2DJEAweiXXSWJ9Si4E/7MEI7zwbWWVIjnxG86Ml
 gaT8XJmTbhIF47FVGwRDJlfmFRvZsHh4BPO31ADaLNBSylBV+1BRUTBp8DV++3v1uF81
 p7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777282606; x=1777887406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gUtLMTp1VVoYmJCEI83vJPhbSQ/45E8v9vR8XyLJMUE=;
 b=brPFzvOSDQgQRMpka6JepvCuCGr/5hcTUs7CfE6lfgooc3YR4mug+ra3Rg8LUw8iF4
 T31LgWzXbBK5s+O1W+ZTGEDEQ832oAAVU3yA11Ud7UV9kOP46oTuKk+8RqnTp+zKWPGW
 myjFvTEXgGxuD3NHZZ5jWpUFLgpwlsQhLzMm15i7EsWUPAvlUw5f3JUc3lPbYnjG1eie
 irbNf7JFQntVTfdh4MzknF58vbffrgBLyH5mvzl25F3GbH5TTnCZwlImOoaifJh49hSz
 qYJwa+h70nANjW99mIbs9EpurfyeWqUA4li7WZGvlvDmE4D+EjAy7wQUnGGs+DbfS1es
 94Rg==
X-Gm-Message-State: AOJu0YwsXubcPAgASAUwKP0ex/WpfjOdaA6bWWTNq+ZKh3vT2xBlQuhC
 W+2MryVrsYd2DufcxUCWHrnjyce2Iy1z7tHljOngVwoarT+fgovEk9W35eNydaBdYSwtQu0VoSX
 eVjkW5vc=
X-Gm-Gg: AeBDievSEFzGE53hCEDkC82HBIC4w15fko2akGSBh921BehZysItHtmEOZ6fvh1HSe8
 anS7GufqwsiNk5mgwkFZSzzu8IQX78LvCNnr0Nct06PPFMhk6opbMyfLVicULFRj2MIjdvO8req
 0+S81s+/aJqbJr8RxH2ChI7zj0/gNjYQ7Sr+lvjv1OY5f4ptWikQfJKZ+hpaCUD/2eHx7c8ecT5
 Sr3roVX5txNfbBwGy773hZlMWuFI7uoz+IgkoRRL/11lO4ryIETaEqYfNRtrkKGTeljsUOAFuQF
 SgjcECIrHVG/PwMocnhBvLmcyjFRd9u+xb/rfXZO8UGl1Vg9PzW7e794BNxIdHqQKjIM4912r9C
 YWrtCC1GP972gXPVflcapUpsVV3CqcqmPCK7rZ/rTB5KR4NFG8HmMtUSDrzBz4Lehm7FC0k6Bwr
 l/VrwmweRALEsp5wcg297Q134/psfyVaIuA2Ix4ImrvUdUIg8NejMefbBuAdFZAR8Q5Bd+BRQ2H
 syR/yeNeF5thCI=
X-Received: by 2002:a05:600c:4714:b0:48a:5574:3a5b with SMTP id
 5b1f17b1804b1-48a55743d05mr374823345e9.27.1777282606079; 
 Mon, 27 Apr 2026 02:36:46 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891df9e50asm475030285e9.0.2026.04.27.02.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 02:36:45 -0700 (PDT)
Message-ID: <1c0fdd4c-d2f9-4013-8411-ab73f74e815a@linaro.org>
Date: Mon, 27 Apr 2026 11:36:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/84] fpu: Drop parts_uncanon
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-3-richard.henderson@linaro.org>
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

On 26/4/26 15:38, Richard Henderson wrote:
> Use parts{64,128}_uncanon at each call site.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 44 ++++++++++++++++++--------------------------
>   1 file changed, 18 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

