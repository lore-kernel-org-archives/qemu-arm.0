Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEFDFF885E
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 11:07:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHJnw-0004gJ-G7; Mon, 27 Apr 2026 07:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHJnt-0004ek-Ir
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 07:07:05 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHJns-0002Sg-1h
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 07:07:05 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-44261378651so1195499f8f.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777288022; x=1777892822; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QO+YMX5ksgG5zht7IUY/nYqzuFqNiuOUp+FXTuB0MzQ=;
 b=IC/3EoktDZ/lG1RDzPJy8omVpwigzEv55hd2KHqMuuItcuv0m2gP/t5Ao+0zOC5g8Z
 VoBhQgmjF4AgvUwpe+EDbBx4IF2/IhAsVWlcOT+S15MyCG+ieonwyGce/GUwPKaUkZuL
 SE28h2ar4I+IZmLclKwUJwEfRAUpfPW0PtGDXRuzU1rl3KtM288Bypxb25M1LdY3v2oP
 vJ2YhN8ymJmbHQPD9xIfG8rmtJC72lgpN0enN1O8U3Nguo534H5a9/eJSohnDmc6tA7K
 EhhGrvnPNJGVvRDJ57cvNr4TpQQQsXydaHFGz7FxxtznNWHXjVzd/l+L4Akqv0Sf2j9R
 v4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777288022; x=1777892822;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QO+YMX5ksgG5zht7IUY/nYqzuFqNiuOUp+FXTuB0MzQ=;
 b=WgwYvNSfMtLo2JW/2ol8hhANpCqO3tYAKJWVJ91OwDuW9lCklHhNPeD7KWarCa42m4
 SIPMUpxix0I/WKnYZVohfWzSPEHHncPO6Fnc03iCG59yehi2Kl897ywmfhKgvm48l7da
 Q8BwE7LgmFlTTGCK3EN1OlXQFWDEgOip4s0uIxBcS2eQ3QoCKPU4IGCo8fujKZxsSR/s
 PS/EcVuv2LTo+TLW1yu2Hp00UqrynJME1qX1Q/SmwY/F40b/pB0rPfhcSqXhGHDVhW7N
 U+mpMRuYNltr9tOJz4x5HrUgSGTwPTpU3Y4Q0eRPdmFZCMx5D6gfZUhukYt6AzM6jvCa
 mMJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9rtCDZcHyM3aZJ+9UTaOMrn+HIm4Tx7hDVJji3LBbIwF2OGFr1tYfCP0Cnim0LXiJXjAGtBClt8w==@nongnu.org
X-Gm-Message-State: AOJu0Yxs40m7pt7G5DWc7u4Fc2KDUjc2wXJowttC/cpl6BKVtrxtTKyB
 Lx7Maxo0EgaFCsnzQgaPf0V1XjAAOZ4QASQ+MSg0YXyPbP3WuUt8Phr9xn/DoOvQD8I=
X-Gm-Gg: AeBDietUNVOFj1EHbM4+t6rzwabyWQ3MfM72RcoGp2pY4h4N7Yyk5n5Q5YFgv1cNtdv
 /crb3ou4zhsVJo4O2VlFr0a4lXiDavzBkN+Z3wUS/oKgLaEkiRgsuZ6z45VJY5SU5S7cebMSoky
 ETJDbmepOtrdEgC6Cp7H17H1MpEsW0pl4vS8T2Gh7LWSQl/zKiGo3oOexF15+fLGpKpXcT/1ne0
 wT0nLMJ5xvgH/I5edxn21ArMCmfvoGamL1BwunWmTrV3UkdGAdKnqnQUfnQvFRdUi2AKsdbf/+R
 wJmEcQwzyqmyR8hyy8M92vES0zFTf/Wg/0SEdM/bClFrvxlILgO5y5u0v8TB3STnTNF6bUMQgR8
 SB7FpkaBKliTM5D1Izr8R32OvXf5KHhaGWCJbJDuHqElMAM4ItgIvCFvqLHrEdL8YfXCfoxpIiW
 SUL7TXCuH6bcWr4FnG6Uy/By/WnoaIUwf+V9gkxl2DwFoO82KI4POeRchGCsOfEeIk9Xs1vyaQe
 gU4
X-Received: by 2002:a05:6000:4550:b0:441:37b5:d788 with SMTP id
 ffacd0b85a97d-44137b5d7c1mr9028199f8f.8.1777288022206; 
 Mon, 27 Apr 2026 04:07:02 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412e36ff8bsm30877308f8f.26.2026.04.27.04.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 04:07:01 -0700 (PDT)
Message-ID: <9a0a42c7-a36f-48d1-9eb1-008d2565c342@linaro.org>
Date: Mon, 27 Apr 2026 13:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/raspi4b: NOP all DTB nodes when removing
 unimplemented devices
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20260420162114.308519-1-osama.abdelkader@gmail.com>
 <CAFEAcA_29onASJ7bOs6jFbM9Mmj_X-SrJ85hSWxCOa-4WbFA8g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_29onASJ7bOs6jFbM9Mmj_X-SrJ85hSWxCOa-4WbFA8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 27/4/26 11:53, Peter Maydell wrote:
> On Mon, 20 Apr 2026 at 17:21, Osama Abdelkader
> <osama.abdelkader@gmail.com> wrote:
>>
>> fdt_node_offset_by_compatible(fdt, -1, compat) only finds the first match.
>> If the blob has more than one node with the same compatible string, extra
>> nodes will remain active. using the same loop as imx8mp-evk.c
>>
>> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
>> ---
> 
> I wondered about whether it would be worth abstracting this
> out into a helper function, but it looks like at the moment
> only this raspi code and the imx8mp-evk do this. If we get
> more places we want this we might do that, but not worth
> it for two.

IIRC you were first against the approach of "use a real world
dtb and patch it", recommending to "generate a dtb with what
we emulate"; and we merged that as 'temporary kludge until we
properly emulate the missing device'.

