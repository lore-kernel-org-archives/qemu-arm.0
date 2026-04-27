Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FADFF8867
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:30:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSbK-0004Z6-J2; Mon, 27 Apr 2026 16:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSaw-0004Pu-Mj
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:30:22 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSau-0002NO-SW
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:30:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so181316995e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777321815; x=1777926615; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/vr2nD7lUIqndoI+VgeGAS8cqZVHxRIMj5oyAoMldzM=;
 b=GqFv7t8/lkC2OZFLmzYIEGrXpU+lASb5Bx0T8qDwfeQ583d9McrbZMbUc2+pLg5V3T
 AXXc9O+NxZRH/oAglB4s9u0hOmmuBKd4lU+8zYX7Mdjltqb3g4Kx2398jJp9I6VaNEZq
 epYX3x2+3zt1ITJa6O50xGWukXYZFJEvW0xEv+4hs81a/2kbUXMpHLF3Cpdc9TazulCF
 0LIzsNAs8FVQE7SEgHLv3n2IG8aRfcRvlTPynS0g6Z29YCnnD8ra6E/j8ybXHWDhtSxD
 B1U/lryE+tX+b3OlANwwM0mv4AA2vUuUNppzUlBYON2HL+sIlXnvkj8O7Wep39Oat0wh
 sbEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777321815; x=1777926615;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/vr2nD7lUIqndoI+VgeGAS8cqZVHxRIMj5oyAoMldzM=;
 b=Oh1TgaHwkO+sAx0g1jbszhSS10kbbyqeCpIWeXswW0CrRqdX7+E1YzOK8ioOkNfu3v
 hHuGt78ZzxP1vHVjR3eoVvjp4ssthmLyLy5G7bCz/jOrA1yzjMSakGyFsCMMuKGrxFfc
 PljsbrCNlAxPY3wTgaka+/hjGKV3AbjULBTWuh1XrAjz6hfkNyvSYjDeTjF4c1FrEwUA
 U2UAJNcZP2yxZDClXd9aXgnnHVRurOgO1xouWYOpcf1w0PP3T3NkHGpO6/+jZDixrtzp
 ce236decZY3LHzBG5sFsmn//cHIeZGY8nSsn100RoxFRznMFoR7EZkuS3PB6i4AjtKt3
 NbUw==
X-Gm-Message-State: AOJu0YyB91/1snkROegYD/YXiTICJjm9DXAw75s48Wgt7utetMmkbp3f
 sEVaj+oU4lSP0iHp1TJSZZQaR7NsP58iYVJ6M8Sz/O07J/sMNfkMTZAmeSNv4QRJ3uE=
X-Gm-Gg: AeBDiesVaWNWoWSahE3G3UWZPxsXuCBr1lQISVch6oq3Nwft014/dZGzRu7re42nMbu
 uMHxKLtyvZzDdBQJ2LMSeXUtQlfkqW2Kk2IhqxWIDo4oDZ7f2MHmOO3b8bPVIE3vrQLWWNxptl4
 XTMyAtIHuxdgEA4fr0YH4FJYVRtxdK30cFLd9bbdOOpbm/n3uGG4Vt3M30kyG57dX4YsIVWLdjy
 5UemjkKsqD+5cWc52TWY5szWZwsvCcQXx2JOLLxPfWqEOq5KBlkB9wj6hGqSxhoZryIwrbo4Zgz
 hF3XrreaJTqE8IneWUBOXwii/v0JSIr0ZMQdbYVCZ5c8CbCLyu3Op0zuVGPQidS3cMcZMdaf2Rt
 TL8rH10lGuec5z/u4lrWzorY92lAWYDRU+UTcUnbSB00bmKaNSKXopc+/FXwvDFuw/cYYddcq0V
 SpBMkxYvTRKrZa9EMNxyRUWoqSupmaa46RIgOYmAj+0R+TFQ+afnGwMce/bWtbtN3wlf8xxDvud
 Ix3
X-Received: by 2002:a05:600c:3b15:b0:488:9439:881a with SMTP id
 5b1f17b1804b1-48a77ae5448mr3806575e9.2.1777321815361; 
 Mon, 27 Apr 2026 13:30:15 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4463f5b4fa2sm700869f8f.19.2026.04.27.13.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:30:14 -0700 (PDT)
Message-ID: <40707f62-5b49-4559-be1e-e1ea5ce22a0d@linaro.org>
Date: Mon, 27 Apr 2026 22:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/84] fpu: Drop parts_round_to_int_normal
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org
References: <20260426134002.865628-1-richard.henderson@linaro.org>
 <20260426134002.865628-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260426134002.865628-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c           | 22 +++++++---------------
>   fpu/softfloat-parts.c.inc | 10 +++++-----
>   2 files changed, 12 insertions(+), 20 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

