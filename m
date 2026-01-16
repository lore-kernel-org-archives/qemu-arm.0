Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68C9D4A607
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 07:24:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgeC6-0005Zz-N8; Fri, 16 Jan 2026 02:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgeC4-0005X5-Qu
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 02:24:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgeC3-0003T3-Av
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 02:24:28 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso11167065e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 23:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768548266; x=1769153066; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mMk1mMXM/1BYpuv7saOldeCOnI7xUVgMTVKqOVLjr5Y=;
 b=WgX2pJQIJ7v4QGrCDK8HBkG0ovWuyfSULdlmxW8rbrwt3H993sp5E3G5AkcNdXRdoC
 s5Uf8rlORbM0nBF7l95uxFp+LFh3kYB4I4yI+I7mbj7ipCTBv56nzi6J5vwayirub0HU
 Dn8L7UQAneWe73RA5qaX8x+Lu3He2arpBxKI3TMsRanCHiLZTFA0n6ZfDIdudHISfJHj
 4snnP41nPX15MYPYlVZZt31wcERnzioj4U3Dqrl+S0Hjaa58q18HzIXENZsM9b8SWU2v
 OdGo03jfCO/IO1O2FOqDXgDDCoUsbIenabIGjV/au6kw0ipALOqbPhN42sGMGZGabpGB
 aSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548266; x=1769153066;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mMk1mMXM/1BYpuv7saOldeCOnI7xUVgMTVKqOVLjr5Y=;
 b=shdgOd+091gkRn8ih47HQAXDje/mDFaTUQz2gdMbrPjGYq3HSasS3oa+NVnFf5de6G
 bCkUXl3b78JyX28O5wHn6WTiUdAGQtPKiOrVIILzEHW46s+8/OlPMJv0gdCdGJ/RleFZ
 IAV56aZA7sEeH98AnzaKeNIeJ73j9Y9w46ofbKyUSAlKTRnFTl4Z86C2s85cLdyg0JZR
 D11lEaHBJOa56yA01+Nbyumr3SjG1DoCAgGVrdJF2CCjgFlBWQiXm/5eoE3UZZsu33se
 +thHzI19Qb9CZlybElcZGaUDLj9Y4UxUyd3Ab9TvzePUU+dSTowcJfZByabifExTW7M+
 xrmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWOBKRIAlHuZoOllnMgm9MqvWhewnD2pD9WFGW6TYv1y87JQSvVc7GX0VLsNiUYj9Em87gNMpYog==@nongnu.org
X-Gm-Message-State: AOJu0YzfxcV1uxkoY1YV6Up60Pr4LEQa2FXIqcFp3GVZaXL1ue0bHyIR
 MhhYY5VkvkCb2U2doEjfvYCeWkszUWhgG20bezzBBDMXQ8QGOLhTD8v67dVkDmVxKpE=
X-Gm-Gg: AY/fxX51K8sTUp/IrUQfWwJHimkhZA8RWSG3bL+sAUjDfprfmKRlueWy5COoazqc3or
 3MjVwfnwcNgdszd2WGu1j3TyBPDbcKzPzlgpfShlYWk8egUXp880/C6kZ8dd4DkNwEFAYNEqm+7
 J1MeJpb6YX866aC56RM8Uchkhw9+M2/cMlTbIZWYjaHV9+5cPyrtoBnqTzAJ84Hs63mRpqPxlSm
 HPAdQyTXXlsyWMnizoJOeQ2yckiSjbgr7JgrJmodJ8cUnEU9yW+ctV79XaLbEWJOYwvi2KWxByf
 uF/U0UOECM4SoFmXHmxg63owg8/GGgWSWU7pRJJcWYndYcXvqtB/d1e44FCYvMTZYOMVBxEe+ed
 jH/9raV1udasqBbwBQ4BZZVQQYu1Gk9W2QLvqQt5b3WbDbX4LOhxp4T1KfpRD45ReBFOlzJgV6+
 omthineenJci5/DsC+JSfxekifu9DmJWgG2Gg79jPq0EKnhfNmGJrf/Q==
X-Received: by 2002:a05:600c:458d:b0:47d:264e:b435 with SMTP id
 5b1f17b1804b1-4801e34209cmr22200515e9.22.1768548265680; 
 Thu, 15 Jan 2026 23:24:25 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997e664sm3164206f8f.30.2026.01.15.23.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 23:24:25 -0800 (PST)
Message-ID: <3a191a82-3131-48f2-8910-e424e2921572@linaro.org>
Date: Fri, 16 Jan 2026 08:24:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/19] target/arm/hvf: Consolidate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>
References: <20260112103034.65310-1-philmd@linaro.org>
 <CAFEAcA8YGQmc8-bdpRhtV9igq=M=ONc94vtf316Hz4hokPdg5g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8YGQmc8-bdpRhtV9igq=M=ONc94vtf316Hz4hokPdg5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Hi Peter,

On 12/1/26 18:24, Peter Maydell wrote:
> On Mon, 12 Jan 2026 at 10:30, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Series fully reviewed.
>>
>> - Patches 1-11 fix migration on HVF
>> - Patches 12-14 remove a signal race with WFI
>> - Patches 15-18 correct guest timer frequency
>>
>> Since v5:
>> - Rebased on top of 3bee93b9abf ("Fix i386 HVF compilation failures")
> 
> Would you like me to take this via target-arm.next or are
> you planning to send a pullreq for it? I don't mind either
> way; I don't have any convenient machine for testing hvf
> with, so via my tree it's mostly just avoiding possible
> conflicts with other arm patches.

I took me some time to go back to you because I ran exhaustive testing
to feel confident enough. No I am, but I only tested UNIX guests so far.

I updated patches to strengthen our HVF testing on CI, but this doesn't
have to block this patchset (which other depends on). Since you already
posted your target-arm PR I'll take on your kind offer and send another
one myself.

Regards,

Phil.

