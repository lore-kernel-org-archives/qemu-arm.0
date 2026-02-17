Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F55CE83831
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Feb 2026 02:34:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsAuv-0005j9-Em; Mon, 16 Feb 2026 21:34:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsAut-0005iJ-NE
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 21:34:23 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsAur-0003KL-UQ
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 21:34:23 -0500
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-8230d228372so2245281b3a.1
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 18:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771295660; x=1771900460; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XmXY1QviZxB2hKo7UR8Y0OZQaQwvQtFEtllw98Jpok0=;
 b=scjfVTDsU60HgqgW/u7swxwAjHy0KANwKGq+I9R0R4c5wCWaBU1SpNabqrA5NTwtJx
 M54i7qFKjuVEkzmlbq1UJYtN3tkOzm+ZgDVncIA8ZwDHxwY9GqYq72dk1jgv7KEA4dkX
 zTRTlFKWy8xutTUoIZ08xqQpLTyLtTPg7N/IDi4lfhZBdZoW2Z9stF2j2Jhu7TblvcAK
 /nqqnmVrXQNo1LXo4WSn+Lace1qXIRa1aZaTNPE8bXVe+/solgjJpW4QnXhqimkAICdi
 eC6xQ2uv0gf1712FROiy4Gl1X14vleO6cbqEQOiOWsl/A7sULFNCcQRSGgZx1GLLkkVQ
 6Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771295660; x=1771900460;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XmXY1QviZxB2hKo7UR8Y0OZQaQwvQtFEtllw98Jpok0=;
 b=Ao1s2G14w4/TY8g5hxF7XQgfCzSr3im/nG8bTEgKRYzF9HghrU3IM1c68ujoFa5N3n
 SAEwLGJL32M1u6kOdUL9opekoIrK1kLmUAnfCzSoVtHQT1+IzTtGPGx2baDiLYAUcac/
 FYT+pNBOpduEbzeuYQKpyRhPHBldUahvUk4chCMSMksc0YS4uM6fb5VxV+OGBcFo1q+6
 m3hWZAJNDTyFt4+Vn6nXIE+zatp+a7g4KZEX8GxLsUd0KKpJvZYQ6PJd5Q+qI10hEFPS
 9sZhIzCVgpzCXXW3drJM7YsNDDeG6c/0GkHRqZw0vJztiQBch3W3gA//6hKAdkqomqP/
 mP3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSE3dyvp+yJMfKV2P0SdAYvqCTjEkJ32mNtHVGiR4uAFlVXAtezbyc9/MslLuyZl1fPqWVA5gr3A==@nongnu.org
X-Gm-Message-State: AOJu0YyCxFBL+FKdfsbWvuUQ/WEh3+iVmmLPA9yWnxY26rMYr2/WfalB
 kZci82E9Wo4hiyVE5b7YAEEg3dlGJPoY6/OqLtHM8d5mRNDaPRzDdUcacxL4SP3kgBs=
X-Gm-Gg: AZuq6aJjNDhDa+7neiP2XpUXSKxlYlCWwFnpKDssW5JUbZz3Z3wv1RvQLGDpCLWxGRI
 knjuOZDRWRx7rxlx4sO/e0XmAxrxfr/Bg/jLFIlIT6xCAlo+uuDGrbulrt93xCrmvfNAQiM4VPF
 jSF8z0jUxJ9V9gBLzkzecWDnXq5zz225ciMNx0fm4WRAo9S7o8L7kLvq+FtiL3RnHZ+CZk2e7lv
 QiiqofO1oaFsElCfofA+VM++1FhlmsKjVqhCUsOFM4ECsJijQ/h1i3imEzlTkBg6VcdEJ9mTvlP
 +46mS5sCtyKiZXk2CUN9ayMM3VvoD9Hlx8wGNBurL1pPrW1LL/1pG6EkC1Fonks1w7hvaT182UA
 DT0GsFgUY0BWf/70kUlJA6BxFdh8LwfqHdT1PGKNJWge3Zx/6k0lwWei624QJ7xy+4iayY/VOCM
 0gawrYxjxlytuy+tBINFUVREVGelzA45fR2RkeytyNcouEe90yYXS3SavqDcyBvq2N4F3Y
X-Received: by 2002:a05:6a00:3e0c:b0:81f:41c8:765a with SMTP id
 d2e1a72fcca58-824c945491cmr12355955b3a.4.1771295660218; 
 Mon, 16 Feb 2026 18:34:20 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6a2e936sm11334871b3a.6.2026.02.16.18.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 18:34:19 -0800 (PST)
Message-ID: <ae364123-5b24-44cd-8330-9afde7e99ace@linaro.org>
Date: Mon, 16 Feb 2026 18:34:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] target/arm: single-binary
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, anjo@rev.ng,
 Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
 <93f8f250-7899-4528-b277-1ddd469c192c@linaro.org>
 <CAFEAcA9YUOxko51ziY3yAOaDfTCEAwqmXnifF=q_mkyotFHTcg@mail.gmail.com>
 <CAFEAcA8XCSjjb2opkf2A5WZwCa5THNswOOUO=fpj7kUJEc79qQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <CAFEAcA8XCSjjb2opkf2A5WZwCa5THNswOOUO=fpj7kUJEc79qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x434.google.com
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

On 2/16/26 7:52 AM, Peter Maydell wrote:
> On Thu, 12 Feb 2026 at 10:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 10 Feb 2026 at 20:19, Pierrick Bouvier
>> <pierrick.bouvier@linaro.org> wrote:
>>>
>>> On 2/10/26 12:15 PM, Pierrick Bouvier wrote:
>>>> This series continues cleaning target/arm, especially tcg folder.
>>>>
>>>> For now, it contains some cleanups in headers, and it splits helpers per
>>>> category, thus removing several usage of TARGET_AARCH64.
>>>> First version was simply splitting 32 vs 64-bit helpers, and Richard asked
>>>> to split per sub category.
>>>>
>>>> v3
>>>> --
>>>>
>>>> - translate.h: missing vaddr replacement
>>>> - move tcg_use_softmmu to tcg/tcg-internal.h to avoid duplicating compilation
>>>>     units between system and user builds.
>>>> - eradicate TARGET_INSN_START_EXTRA_WORDS by calling tcg_gen_insn_start with
>>>>     additional 0 parameters if needed.
>>>>
>>>> v2
>>>> --
>>>>
>>>> - add missing kvm_enabled() in arm-qmp-cmds.c
>>>> - didn't extract arm_wfi for tcg/psci.c. If that's a hard requirement, I can do
>>>>     it in next version.
>>>> - restricted scope of series to helper headers, so we can validate things one
>>>>     step at a time. Series will keep on growing once all patches are reviewed.
>>>> - translate.h: use vaddr where appropriate, as asked by Richard.
>>
>>> Patches 1-11 are reviewed and ready to be pulled.
>>
>> Looks like patch 12 has also now been reviewed, so I've applied
>> the whole series to target-arm.next.
> 
> I meant to send this to the list, but accidentally sent it to
> Pierrick only:
> 
> I just ran this (plus some other patches) through gitlab CI, and
> it fails to build on the kvm-only and xen-only jobs:
> 
> https://gitlab.com/pm215/qemu/-/jobs/13131658696
> 
> In file included from /builds/pm215/qemu/include/exec/helper-gen.h.inc:9,
>                   from /builds/pm215/qemu/include/exec/helper-gen-common.h:11,
>                   from ../target/arm/helper.h:7,
>                   from ../target/arm/helper.c:13:
> /builds/pm215/qemu/include/tcg/tcg.h:35:10: fatal error: tcg-target.h:
> No such file or directory
>     35 | #include "tcg-target.h"
>        |          ^~~~~~~~~~~~~~
> 
> 
> https://gitlab.com/pm215/qemu/-/jobs/13131658593
> 
> In file included from /builds/pm215/qemu/include/exec/helper-gen.h.inc:9,
>                   from /builds/pm215/qemu/include/exec/helper-gen-common.h:11,
>                   from ../target/arm/helper.h:7,
>                   from ../target/arm/debug_helper.c:11:
> /builds/pm215/qemu/include/tcg/tcg.h:35:10: fatal error: tcg-target.h:
> No such file or directory
>      35 | #include "tcg-target.h"
>         | ^~~~~~~~~~~~~~
> 
> I think the problem looks like it's in "move exec/helper-* plumbery to
> helper.h", which has put the "emit the TCG gen_helper_foo inline
> functions" into target/arm/helper.h, when they were previously
> handled by target/arm/tcg/translate.h and so only in source files
> that are part of the TCG translate-time code. helper.h only needs the
> prototypes of the helper functions themselves.
> 
> Some of the other new helper-foo.h files look like they would
> also have this problem, except they happen to only be included
> from tcg files. For instance target/arm/helper-mve.h is only
> included from files in target/arm/tcg (so it maybe could be
> in target/arm/tcg itself).
> 
> I couldn't see an obvious easy fixup for this, so I'm afraid
> I've removed the series from target-arm.next.
> 
> thanks
> -- PMM

Thanks for reporting Peter, and trying to fix it. It's definitely not
configurations I had under my radar.

Regards,
Pierrick

