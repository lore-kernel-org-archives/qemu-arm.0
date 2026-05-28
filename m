Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDE9CD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 22:20:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSj5O-0000mg-5t; Thu, 28 May 2026 18:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSj5M-0000m4-Mz
 for qemu-arm@nongnu.org; Thu, 28 May 2026 18:20:16 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wSj5L-0003km-0C
 for qemu-arm@nongnu.org; Thu, 28 May 2026 18:20:16 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-c796163fac5so10126591a12.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 15:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780006813; x=1780611613; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=veNuRYhgs4KrAydLkx8OQVE0JBYIgppnw37iEjmm/mU=;
 b=RMjxeKCdMak2Nrunslcl9+Q1Q4LzM8BPPqhtBhr/T466EJvfvo5MydKMC/LspfWn8k
 1JuZM8WyFoUSwgAJxGmefjoO6nSJULvK6rJ4rQhjeNT9zou8RletZ9UTF1j5zLZE0LzX
 3+ulwmZVs/bUS+UvrfF9WLO0/xbaPerrkVIdSUqV9BxQApxEcDPCu+N5tLK73vihtS7R
 MjvgkHtvIDOmhURUEoiFqh0MWXKOfbNFlqls92BCXJXVz0Hu7CHhVMtKNjHUKbY+1xhS
 yXP/k8LtNuLoibUz43394xwmgLQbkVrtasHFPAV2HaN2qGIV8wQvJ9MuRNlqDYXQ0zr4
 ZQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780006813; x=1780611613;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=veNuRYhgs4KrAydLkx8OQVE0JBYIgppnw37iEjmm/mU=;
 b=MXNxBHkvnEASIaJaMoPuJNfguOZmGkx2dkZqGJ6+5oVT63wNZZWzmawfJv4qB93IOe
 UUKjJ07yo9doki0sWfgFDSoukk15e3wXAi4OvIw0SBoxg9ueQSQISmlPH0iS9mhfAGu2
 nSbbKIj9L+Y+qvm2aDLmPz0hF4u8vRK6H9lDSF61bdxjP+eOSf89a2zQgUg4n/W6E6Yc
 vm2iq1tnuEWf36JwB/f57sBqWFR0OvJHdI+/TbyTGq9+ZyZ/qjzqz1tgG3Sm/6KzB6cX
 /Ft5UYQ9aOsC25bb9MmfakToFB9gHgD43Fu0GWD/5qqMGX0m4PhsYs+4eQAhkFROdU57
 wqOQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/X+zvlw1LNz25P5D8RZC3v8MY/SLPB9xAEuxmS1qB5kw7LQuFD25kD3KXVfTaNDS2kS2adIM/Y0g==@nongnu.org
X-Gm-Message-State: AOJu0YyaJzKbuM3jf633kHQtOhmB2G9A+WT8rOLclHVon7ouODBQ70mq
 zMlB5b0zfKPhDacrE85yktxKIy7INrtNmBjy4/bKR93O3Ij8VI3Xo06RL7OWiFTGwLg=
X-Gm-Gg: Acq92OFKV9+Cv2zij0zFb3Fx1Bj+xQDdbArqns8I89Ugj5tIOYx4DM0ep4bE4L0SmoI
 sD9REoYczTJYRqEXSiJjPOaiqvjk55H2BsoGzttXeCM7lioJ+4MHJYQZi7NEiZ3AaUzwmdEx1z6
 bm2gjR9koEG+JTRaBICRkWuI27SmkXtMKth7vnYkCRnrqTE1rCYqcnuWQu+Mg6a3MHtxg0QMGQT
 3dG3zE4PeVaDlR+ngY7O8DugPEH8qP8+7Te601egXromwEFpfHeB2YORdF5utb6Cpw9RkVVdm6O
 vV0QOT6uC89ZZSIsQ8Q4Ro1oed+rWTJBCtufr2eVpCeHVQ3n3cnq2fppwnCRu0kVFK6jhyEQfJl
 2g5L6h0I7qaI1XJ5VjynYcLUcaYL6xF+diFSko4gXLZw7z6XykBtd+ZPralmRH+7eU5+J9wbksE
 1kSafLWefYu8Ghy/x46SiD0/Sm9l+KqXxXdzJxpqbWT2YO1Hk=
X-Received: by 2002:a05:6a00:8cb:b0:82c:6aee:b21a with SMTP id
 d2e1a72fcca58-84212c02133mr92897b3a.45.1780006812967; 
 Thu, 28 May 2026 15:20:12 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.142.33])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-841f3cbce53sm2637888b3a.3.2026.05.28.15.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 15:20:12 -0700 (PDT)
Message-ID: <ab73ed68-bf97-4587-abaa-96cf97679b5e@linaro.org>
Date: Thu, 28 May 2026 15:20:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/15] target/arm: add support for MTE4
To: Peter Maydell <peter.maydell@linaro.org>,
 Gabriel Brookman <brookmangabriel@gmail.com>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Helge Deller <deller@gmx.de>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
References: <20260511-feat-mte4-v6-0-8557cc1313b9@gmail.com>
 <CAFEAcA9J0DVUbgKviEjwEN8K0M2aAJTLaOpkndus6HNCPNRH0w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9J0DVUbgKviEjwEN8K0M2aAJTLaOpkndus6HNCPNRH0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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

On 5/28/26 08:08, Peter Maydell wrote:
> On Mon, 11 May 2026 at 15:01, Gabriel Brookman
> <brookmangabriel@gmail.com> wrote:
>>
>> This series implements ARM's Enhanced Memory Tagging Extension
>> (MTE4). MTE4 implies the presence of several subfeatures:
>> FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR, FEAT_MTE_STORE_ONLY,
>> FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM, none of which are
>> currently implemented in QEMU. This patch implements all five.
>>
>> Testing:
>>    - Included for FAR and STORE_ONLY.
>>    - The MTE_CANONICAL/NAT test from v2, modified so MTE_CANONICAL is
>>      enabled in user mode (removed from tree in v3).
>>    - A bare-metal testsuite that sets up page tables for S1 and S2
>>      translation, to test the Tagged NoTagAccess fault.
>>    - The bare-metal testsuite also was used to test LDGM and similar
>>      instructions not permitted in user-mode.
>>    - The bare-metal testsuite also was used to test the mtx related
>>      patches.
>>
>> Thanks,
>> Gabriel Brookman
> 
> For me this series causes "make check-tcg" to fail, because the
> "mte-10" test segfaults:
> 
> $ ./build/arm-clang/qemu-aarch64
> ./build/arm-clang/tests/tcg/aarch64-linux-user/mte-10
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped

That's odd.  It works for me, both with gcc and clang.

r~

