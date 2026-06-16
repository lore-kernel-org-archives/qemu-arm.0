Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D48CD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 18:06:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZYBL-0003ji-IC; Tue, 16 Jun 2026 14:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZYBG-0003j6-6A
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 14:06:37 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wZYBE-0007IA-DR
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 14:06:33 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-36dd65b95f2so144809a91.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781633189; x=1782237989; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6LUZO63LNckr6beiHepFrqsor24yBTCPVlLmOTvhLuo=;
 b=QEo9rkk7jAdzltHjabybRWD4UuAQkjFfrf5C3tB+CeHE9ANlwI2RVaicU1lQpmEQVM
 60oFF4fwjLx9RYjDUYFkryRN/qrfzo/UfmxFBggHjbjtK5GDg0aFE0S86dnhjv/Xp5Jz
 TuNPxSB3TvkB4PZhYhPRN0QH0yxE6+pt3exAPdoPHy0IHBBLhNktaHMYuVDX50SpKOfr
 0UTWqUCC3mjHP6RP4U+ILFNhMdLXRlBk84+i65C3H60MSKUkwtTir7kpIOFP/4EFwiBW
 olPfVIwYLpjY48rYLJERbPsqYm51VE21fetD6k219hsag1dTvlnrN8bXcKu9uuooBIiU
 Au5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781633189; x=1782237989;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6LUZO63LNckr6beiHepFrqsor24yBTCPVlLmOTvhLuo=;
 b=k3/c9UiBoYKBtGEscGuCOvu5G0Bcw+2X3KpW4traDF4J7ZDUqalawbhz3yxeJi5DgM
 v9iusWFhIP289NHjuyRuaJA3EWh2c/RIlQiVCRRnPERkce612JSLCE81ri6lkMp5Jk0h
 Ss19la7RxZeM3WwgM9+2icXKvgarWlvJ+6moY9Y1uNlg1jdsuSuga8p9rmez7fm8bIA3
 OvuM6FilyfuG08TWy5lXFxT09dDyzkFyF4Jq4zhR9H2RpKOStequ9qw8ThHaSPVpSGSt
 0EYtsA/eHznXxaPYOlw/aoPr6fz59j1TpoNYEIqMfimYlqQWKijlwYcZGME40AphbREe
 ym0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+X+gkd9DihjUw4MqaAIKop4eqh0rbXvn/fGoZUC5+FonJIeTYjNpVUwJ/wx8kXs4jTwNRaaqKiKg==@nongnu.org
X-Gm-Message-State: AOJu0YzhdbwZ0b6QZKNGJMWuoRmdM5dAsFcer5WvUvA82z8thAtnJw6X
 FiDabgabfbCUt0Jx23clggNphUG6WNR539yoW+1qxSeUSm7WRN9d5pHLCJq7tk2SkaQ=
X-Gm-Gg: Acq92OGtxTPi05ytHVj4s12UzBARMTcjm3UHvA4w6rBmT64Q2WyevtzcaRo/ehz6ZGA
 T6M+dIc61f3oY77Eb1uCTFDKDZ+KFoANZKaiE4H6z2CFOyQQ94BKVamU1coKiQSSziC9gQ8Kqwq
 ny0m+CNVGGrGQOLR5BYVb3sc3QZ4ecJB7GWkd7snKLgB7EpcbGo+FPqQ+uorvaq+ZupxH0uqDbB
 6YfzUJw5dmIJvhg598ZUPDtbt2kJdUp0pCN/lGcQilR7j39EnBmO/waveYvIuZKECbJFEMakrsC
 chYlf7xc+z4EfKHHyCiUECPdVVjsIiotziKNP4t1+wYP0xgCaExysiCQXHi6aRmijA7maIsoSXT
 h3Bjcy9iEWQOc9SwQdOLVX9FfzhHd1DDynbj+zQBe5gCRQDRpLYyCe4U6wiDzEnljWyhRWEn4ZH
 X19gbC1xeoVFFDgBO6BCyUYvJSML90saY0X/EM8hqEyBqIMIQaiHnjQwJTjuqIMIxPAV+9
X-Received: by 2002:a17:90b:2701:b0:36d:86a5:5b8 with SMTP id
 98e67ed59e1d1-37c8e7e6d10mr540357a91.11.1781633189128; 
 Tue, 16 Jun 2026 11:06:29 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37c521ca7a7sm3597906a91.7.2026.06.16.11.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 11:06:28 -0700 (PDT)
Message-ID: <7a0eeb3a-a9c4-4e69-847e-28763ef1e09b@linaro.org>
Date: Tue, 16 Jun 2026 11:06:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/25] target/arm: Implement FIRSTP, LASTP
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-23-richard.henderson@linaro.org>
 <CAFEAcA-HfpZcg6Lqsu+GO=h8i8wOYRB-0A37jdkfSgmbiXCfng@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA-HfpZcg6Lqsu+GO=h8i8wOYRB-0A37jdkfSgmbiXCfng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 6/16/26 08:27, Peter Maydell wrote:
>> +        if (t) {
>> +            return ((clz64(t) ^ 63) + i * 64) >> esz;
> 
> Why XOR? Shouldn't this be the same kind of expression as
> we use in last_active_element():
> 
>              return i * 64 + (63 - clz64(this_g));

True, it could be written that way -- it's logically equivalent. I think it's an ingrained 
x86 bias on my part, where an RSUBI type instruction doesn't exist.

>> +                tcg_gen_clzi_i64(v, v, 64);
>> +                tcg_gen_subfi_i64(v, 63, v);
> 
> ...and we use 63 - clz64(...) here.

With this one, v might be 0 and so 63 - 64 produces -1.


r~

