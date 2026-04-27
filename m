Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4449FF8862
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 08:16:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHH8V-0006yA-5y; Mon, 27 Apr 2026 04:16:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHH8M-0006wL-Bg
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 04:16:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHH8K-0005YE-OY
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 04:16:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43d7badbd7dso4831683f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777277758; x=1777882558; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Z06+pVcx7dTOdJgKxJOhuDZYpBUcP95HGstRK2Dhu8=;
 b=jKNNs9vyPM543X2iFDhoL8syImEElaHrc4Si33hWXvyWgFlu6tHZ1pKABn3/oi5xlT
 bupDjxId9TAvV6YYR/q8p1KbUDi8C692GVsSlcVrukfveA1OJczO/T1NiizvcoLQbmeb
 tf5XJqFezBPZ/NZ50dCcPRBb2WXEnU3lkWZwQLxJaXAz8cSdKAS3pUZOtUBuXi01f4O9
 nOt5nZAmH5ySeSEyk55N44AdjvpP1HsfbwdwiGGjqqY/Hm8sqEr70fGUVUoayKY08omD
 FGGqiiVTckRfj2kFexkDe3SiOCvnAMIypbMw5iloUwq37llbx4Yd+Z2LBl52WbanHuJm
 0nFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777277758; x=1777882558;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Z06+pVcx7dTOdJgKxJOhuDZYpBUcP95HGstRK2Dhu8=;
 b=p2Mlpvtlh27iOgBzHNa0WoP3TVPVj1GmZkiwXyA8gw/O6gbEpW0H1IHcN/SeGVGI2o
 wEexKVk+2afWORjN5gYNM3AAFSxNDCFkSNCZFBekzUSh/EQllYDAXahbG13VYTtdm9uE
 LMuLjDtRozxXHEgFshlMZtLG4IeOh1TgVjhMajRBBwhemJFH7/fpX4k3xVVUpycTljnG
 0Va/IG4fXoTG1SOUwcgdaqDg1upA02CkSWs4LgW8hbgUj51UD+3vZjP9Hmbt4qSs6ZVZ
 d+5oigyUVLg1UglAO9Hm+ck7AdDkajnfjeSd4hzie7mTinPlUoPvkbOfAITPfpqtfPEj
 CZ5A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Sw4Sp2JGElMnQKV7PG0llPNlzJbZOyNfk/chBEKBwXBdH2hD19QhXV0GrmzBheHe5gUBw7a9QEg==@nongnu.org
X-Gm-Message-State: AOJu0Yx49Hiz8M2jPMxBJ6jqYrzH9h/dM1XRcHw5YohGj8kJn9L5LP+/
 SaWPHPt7z6r0VAqo2AuPnY4ssVa2n2WXawyJJ7j2PThL8ixFgClieWb9mOqSt8drwLA=
X-Gm-Gg: AeBDieskM91S638aVAwPesDBYDph90XgFy7ZXwNc2dLuDhUc8ivjGZ+JuUlXmanZU2O
 AeKOO/5bNzV0kOTXDzb7Q1ozOfKoMzYdie7dLUdqwByAMozCf5bhla4b27/YVdPNSqMVdmTxs1l
 Ma7NiRW3e2S85rmvfWG7aoId6By0X3LFSkDsIN9GH+fY+3ffT265/shYjsLa6+2+ssfMEEzzIJn
 VO8bwskVRQWKDi4hSpAmw2yz7NVYE7Ctgv7Wmml5eC1mcLaDAVtOUsRtn/PaYn5rV60Lvbfnk6U
 CtVEBIElZoY32z4ajDHbyLShiiD/np6PMnqX5UmVh4bucKvGFjRcER3vu3yZOWP+OQDSUZREndU
 YgPyh825AT3K3mXjcFur57eWDds+EQBx95tFxwpuEArHow8cxh0PmrrTddXYt31IXDRzaRlEsmg
 3hgYxfO7y00uxAGrQSCDzIAApJTur8fufZ807bgkHtNWL4lE5NKh89FFJeLrx7kmGNOyCIxjbx0
 VmiNJdeTim9op0=
X-Received: by 2002:a05:6000:2386:b0:43d:7261:8759 with SMTP id
 ffacd0b85a97d-43fe3dfd63emr66485312f8f.28.1777277758046; 
 Mon, 27 Apr 2026 01:15:58 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1365sm83761111f8f.7.2026.04.27.01.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 01:15:57 -0700 (PDT)
Message-ID: <54fa03d8-f1cb-4510-bc57-e18b6a048cb3@linaro.org>
Date: Mon, 27 Apr 2026 10:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] target/arm: Remove MO_TE to compile MVE/M helpers
 once
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
 <4a4ab25c-aad9-4383-bf39-00a22cd5d287@linaro.org>
In-Reply-To: <4a4ab25c-aad9-4383-bf39-00a22cd5d287@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 17/4/26 05:58, Philippe Mathieu-Daudé wrote:
> On 14/4/26 02:53, Philippe Mathieu-Daudé wrote:
> 
>> Philippe Mathieu-Daudé (9):
>>    target/arm: Ignore endianness when setting MTE tags
>>    target/arm: Explode MO_TExx -> MO_TE | MO_xx
>>    target/arm: Hoist MO_TE into mve_advance_vpt()
>>    target/arm: Hoist MO_TE into MVE DO_VSTR() macro
>>    target/arm: Introduce mo_endian() helper
>>    target/arm: Replace MO_TE -> mo_endian() for MVE helpers
>>    target/arm: Compile mve_helper.c once
>>    target/arm: Replace MO_TE -> mo_endian() for Cortex-M helpers
>>    target/arm: Compile m_helper.c once
> 
> Series fully reviewed.

Checking as of master=aa15257174d, this series still applies cleanly.

