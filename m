Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2D9CCFA13
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Apr 2026 18:44:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wI9tJ-00005s-SH; Wed, 29 Apr 2026 14:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9tH-0008PN-Cg
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:44:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wI9tG-0001vo-2Z
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 14:44:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43cf7683a28so78977f8f.2
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 11:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777488244; x=1778093044; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0W1iPJWDnkJlimZv5pxeThwtL4TRFrhvZK8ZpaKMxo0=;
 b=FtJUTJ0e4+SLU/bsMJkDLZbPQZb1AHYOxN+VAugTf5Zgv3S48AKQZSztLyMUEnOt14
 22XGFedHjaaqZYblUynSX8jnfRANaQBiccvD5SnUUtG7087BS0f36GfVce79hjx/ktRo
 2P7Vd0xivDL3lURLb+D9716CamU2+UXvwwv9zHD9Tp9YhTckXCDRbSnKJ6vpxOWwmUJv
 qKB4kEvgYmx3NGZs2HJA+TPfW5ewwOwV1xSebwJu9kz1ppSX5efS8UPhTrN54HoKZRen
 IK2U9qhNwjNK/Ix6rBZBFRO6f01wlClBO1ueSRTOuflUR/L+2777P2Dm/13+K+XSkv4s
 6wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488244; x=1778093044;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0W1iPJWDnkJlimZv5pxeThwtL4TRFrhvZK8ZpaKMxo0=;
 b=Khcf0/5tHQP+03z5VC+ccFt89eY0uNE9OSC7lymnokcgHOm6OIZLX1HCK+X6/xKAMv
 NbFI80vBcCKmuai4Egct7TAwT6Uvox2Zdp4fVMfZWIBakfn14FCKve/XZIk/bDt3bTxs
 vCgfW0oqdWXLfXx1s0lE2HdGniCDzh8BsVvq7+3nl8rwJGog2ycGKLYpSMlAuh7hWoMv
 74uQ3mMQFJZHqY6qSWjgKY40mJ+cW1IsCzc4UZuaUYzSxnRN/FPBWuUOic4xE0JtNIOW
 8I1gmTil/l5iXkLFoVoj2ANiAKN/d/9cE16N2270MMKkmgTbe7qDt8m9liljQ8aI77I+
 gZCA==
X-Gm-Message-State: AOJu0YwK6lN/U7+XcaHJw/cy9kQ1B/luqapPOvhdMwlZsrNSZ+ymFdot
 /qn/QKPNQG9zCQTIaBza2szeEuLTCYSbF8Alu60YVb8SRHRx+GQ2a0ZZ70ptFN++voI=
X-Gm-Gg: AeBDiesmU67IQMEvI4OrT37584b3xKkzzcWVVax1TgVmd387PouD/2qLB5UqT2hbmNR
 l+FrEFt0IaS5tXlXkASFeklx2RFsrT8MnOL2sfOsi/5DJsbdBi8wikUp+VLrmww65FyGNgGQdPS
 XAuFGw6OuiHLrxrJ9W9BK/ThUXRhD0qivpVgYEF5PHrnEu8Zs8q50hDGoo3WX377cutqMNOylUJ
 4V8r8ek+GnSQ8hVnDseoMZVSZCmudXVKweQuJrw7qN2V7ZwTHpcY1eDMFkznWaQ+WNsgh+DgOWx
 u11wDx9fbNfdwhp25bu3LGC5Ic8RaOlF9DJhtlZfpou+GpSnrMT3Gxhd6jrdpKcJl44TKIxrWbm
 z5I6PH9CflDP7kSHw6lve0BYCV/pQVIRc3cLfjz2aTLauvYpy+WgcZg/+21Z86MKghVtXXIr36d
 nOrcR1/5zEeyXORjptkbHTA1zbiW/MbuuNOgsC/shosk8LncKQcamEH/MWrCMdFM5bUxRfzbnMo
 /jDGBbwGJXrnII=
X-Received: by 2002:a5d:584f:0:b0:43d:1cec:4767 with SMTP id
 ffacd0b85a97d-4479065eb4emr9240460f8f.36.1777488244481; 
 Wed, 29 Apr 2026 11:44:04 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-447b7218622sm7240642f8f.21.2026.04.29.11.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2026 11:44:03 -0700 (PDT)
Message-ID: <f0d98db0-3be7-4007-b0b3-e65e17009ea0@linaro.org>
Date: Wed, 29 Apr 2026 20:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/84] fpu: Return struct from float16a_unpack_canonical
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-38-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-38-richard.henderson@linaro.org>
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

On 26/4/26 15:39, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

