Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073DECD4F21
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 05:50:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wN2U4-0006rM-Jg; Wed, 13 May 2026 01:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wN2U3-0006qm-CX
 for qemu-arm@nongnu.org; Wed, 13 May 2026 01:50:15 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wN2U0-0002tQ-Se
 for qemu-arm@nongnu.org; Wed, 13 May 2026 01:50:15 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-441209fb77eso3823424f8f.1
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 22:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778651411; x=1779256211; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5Sf2tfuWuKlnukLq4+ktSa8pLfgoE3IU9Ogh6uxa01M=;
 b=BhPfXA2PliiWtE0kFy9uakaMZaWvHHu/LUc1ou1U8yfEHUCqlZxB9MlRKcTqf9CHZV
 PikMV4Vj3bzVlZ6LkOc14fsS62wz/24jPcI+WJznOat0xSBu2nKHJYTZms51SFR33ao9
 zc+xGB15Y4bo59sMsCVzyBrJSvUKAvojWgRWuSvAJL1e0MwoQP8uhOVMxs2y/Czai29C
 09bPBWvnscL/rV5aydsGogp1cse5Ol/b4pKKJZpZ8sbwvQr0YaIYkMY6Ir4/GkmyWuiG
 SaxBUQiiwzA0BhxJp0lYGmze/KAgv55kEL/QRkdeX/XJFRSPhyq3Z1NhvXFRBtX7jE4J
 lTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778651411; x=1779256211;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5Sf2tfuWuKlnukLq4+ktSa8pLfgoE3IU9Ogh6uxa01M=;
 b=jdtedEFvfkGTWoMs0ddACSCxD8hI47O02UNvDrW+D0mj96iCFGgAcfLvp2FNYqHvSd
 gbAJoCxazlg1S+E1chuRi4oadd7fKJ3k6wDeeHQStNFkgPJl0c/wVBt+3NW+J1rKqSVB
 ROJ3RN2xICYpAjo5tjxnzkU2BBFtMxnCQ1iIwmtnXthC2wpgSNMM2OeBrZ17z9Q59FNn
 LDiwbASSdPe0JjiyCmj+GSIqPfW884k2VyARDFg0OYNtS3Eh1HGkoiEDHBsODUuHA/nN
 ICmCSuku7GMnGZFbcka9p5NhSWIxD97EZ16Qxo4L4QjrQjfRZobx9VNZnnBqrf3cY5Va
 zQ8A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+ZKoW1z+yDZ7TDh3hnlfs3njO2IB7rBG3njy0hWosxjcIqU2WStHdntBnP3pNoPcF+NRQfqbREAA==@nongnu.org
X-Gm-Message-State: AOJu0Yxp5cZvXKOw2COUPWENlV/jvvHTWPUCl+rQ/grUCnJYAdA7fT6A
 +ncFPK8BgtMUtty0D0gZ77iwQ7czPs8Cnf2jVyOdIM0OHQXgVspW7puMkDJ2El3s+b0=
X-Gm-Gg: Acq92OHOl3JGTJP0EEOrObKdDmxR+sUERQIKdZcKm4UDWJDSZ31ABSSHFkzIcvInlVx
 M2NJwclXWJzbnW97yJVkkGG7GeXxA9C2Rwz1F3DVFyNghBLWxkNj0QarEtbVuI+kQjiFyaO5L2m
 RjDzSysaOYhCyU9M4lPHHihH+CNyD/rDkV+Ha9FyXmhWESD2R2fjpV7P7w7vpl9z+Q9w3jbU6uV
 XgF9e7wTMhm6umEV9AMfIi0kUERvyT8cL8dYiXYPszG7cFeTCayV36NtOQKSV4NRy/P3OSFUJvf
 E+1gvMGVBJFzOviFcTMT1LtRdbXJSoOdPfQ4l8WknkZBxlbFP2hZtFt96aifJM53b5CkvrJDUQ0
 PRXWWV5F0zho94XVRBD5vARC++ZcAS5mzE3VnN+QsEaNeNgyMNgy7s7ga9IrwJOquARjvE3bjFt
 4ITMUZUBoeJnhFX+5v7ZzkMJTcG6UEnecfETRQ87NW+zGjiCdTmMQsdczcZhKTnuY19Q==
X-Received: by 2002:a05:6000:2485:b0:457:ff13:b2a4 with SMTP id
 ffacd0b85a97d-45c43bec213mr2946543f8f.3.1778651411111; 
 Tue, 12 May 2026 22:50:11 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454922715b9sm40182522f8f.36.2026.05.12.22.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 22:50:10 -0700 (PDT)
Message-ID: <1c139eaa-bd0f-41bd-84da-b071a0656474@linaro.org>
Date: Wed, 13 May 2026 07:50:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] hw/dma/omap_dma: Remove unused ifdeffed out code
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260512203414.3633237-1-peter.maydell@linaro.org>
 <20260512203414.3633237-12-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260512203414.3633237-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 12/5/26 22:34, Peter Maydell wrote:
> The OMAP DMA device includes a lot of code which has been disabled
> via ifdefs for over a decade. Whatever this unfinished development
> work was, all knowledge of it is long gone, and we're unlikely to
> be doing any serious work on this device model in future. If we
> did, we'd likely have to start from scratch.
> 
> Remove all the ifdeffed out code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/dma/omap_dma.c | 94 -----------------------------------------------
>   1 file changed, 94 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

