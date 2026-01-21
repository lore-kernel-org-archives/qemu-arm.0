Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE55C44506
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 21:21:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vifdW-0007Sx-EF; Wed, 21 Jan 2026 16:21:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vifdV-0007Ob-HX
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 16:21:09 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vifdT-0006a3-Vd
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 16:21:09 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo3244535e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 13:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769030466; x=1769635266; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ORVjiz/m/2XsSeSwpvcyE8nim/jyoNM6xAv4uhQ5SJ0=;
 b=n1mmXott0L5i9K5fued09oB+m2KxaouwceXYSSw5wKy6u45iLs+9n4t2INfPv35UiW
 s1X7XeAAK9Lio3Xwbi8l7WJHfQeFmgIV8lPlLrjFu4x2SVe56BIYEnjkx1dDmxmNl9o0
 ZqgMiIEXdfXq9g63ogWI9yYcJFjMV5ZDfduB8yMpHqVeVUeWVILV7GfyLElMX1MTO9UA
 B7KTAFEjkhmZ9X6+avWcbtZxs7dIh16WvYu3S7GLIY/sev0Bz5rNR4RoraD8ts0grs2x
 jM7ftQNBNVDDIX776wPs1w/VkufEc0jytBFWfBZUuNVcqTNrtqJGs2bOj4FQTem9CSbq
 yZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769030466; x=1769635266;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ORVjiz/m/2XsSeSwpvcyE8nim/jyoNM6xAv4uhQ5SJ0=;
 b=BxDHJssZcskeVDiqlwjywBjuWkoValW8uk6UHo7pA5KYKh6P3baPKPCPjaL2rJWCQh
 heiAdPzwUAt64dp8kFPkMbq4ezTUsniYP2l3YhDLsKfOtb/utOAtUZJxlRgTX4dUkqKC
 TQw4Ceiyq2Pj48BEQJpT43mzz0L6iZnCIPJGkHlxXHua0rPxqdCx4atNJakYjEPfZ+By
 udNmtfKT5A/RMzudvM8sfr4101RWw+2N3zgzfZYvh4W5PZwX4MAsEhHJEFaxaVjkKypg
 extjb0FUIPAFAvbgeVox9pvjN3RN8GGdiHzqgNTkW8UhHDBX+B5Zp9hi+npFe18JEE8R
 8UhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3egb20R1YQcl4/HfjSALiz8JZH42LmLyyxkSaoktI2zAOxaeVvKLNbHR2Pep/Uk9JZYPOxgApGA==@nongnu.org
X-Gm-Message-State: AOJu0YwGYnWG8Ag+qQFfR+ydJ8IFl3smQXwPS4nV62plSaTf0Tnj6Qv0
 BL8CwBdvEKnA7u4ePCgFlIqAQhFgZ5uNwwhiey4cGs3Uzq1X2npO4eRwA+BgduAnZfk=
X-Gm-Gg: AZuq6aJ+5NHEv4h1AzI07rCM0E/nGz4UmPylt1DV9+CVdlVIlxdY91XT4GcVafGunIo
 CpfyXKcejPwUk7d8n6m603hW6plGJkIjCVyCt89BZNqyLA+095Tboaz+psCuRUiYAfydHW+X14g
 S0T4WJBxefUzXoJlQ8gXQdFIgN7vRqZHwtwyttlIrt7zCwJqDp3KzaelXJRw689oLBtN8v0TiSt
 xeMpLSX6ydaB0GAzZaYCcB4X9UGcIhf9lf4T/iArFY7fSiK27Y1AeGPkO4nMEe23Ap/tyxCXuSq
 1KdirsnwHgVcaNrJe/556/lcgYPts/zUXkqJOq9akmj0YonVx8X5exOmmFYicdsGv94rMvWSlHx
 LKm8THM8yqwhjVlbAY6vw/JjTGjObST6NFqSQTlTapMDNMz8ySCoXEv3R4e9kigxIlf8JN+M6ba
 n0gxx3f9Fdh7ZgaHeYw/cXcEcW33Ru19uvSgVkW8lj6Az3bxvjganiIj2CJakreFmn
X-Received: by 2002:a05:600c:34d6:b0:47d:3ead:7440 with SMTP id
 5b1f17b1804b1-4801eb131b2mr280552775e9.32.1769030465997; 
 Wed, 21 Jan 2026 13:21:05 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435924ae723sm12654862f8f.41.2026.01.21.13.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 13:21:05 -0800 (PST)
Message-ID: <e32c09de-85f7-4b71-9d1f-1af9a51abd87@linaro.org>
Date: Wed, 21 Jan 2026 22:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] vmapple: making it work on the latest macOS host
 releases
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
References: <20260114152220.89640-1-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260114152220.89640-1-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Cc'ing Akihiko

On 14/1/26 16:22, Mohamed Mediouni wrote:
> Support for newer guest OSes isn't part of this series.
> 
> v4:
> Rebase and resend without the RFC tag as I didn't get feedback.
> Drop patch 1 (version I posted was incomplete anyways). Last patch isn't worth it too tbh.
> 
> v2->v3:
> Remove the Apple M4 support workaround part for now, to be part of another patchset perhaps
> Address comments
> 
> v1->v2:
> Remove some lines that shouldn't have been present...
> 
> Mohamed Mediouni (3):
>    vmapple: apple-gfx: make it work on the latest macOS release
>    Revert "hw/arm: Do not build VMapple machine by default"
>    vmapple: apple-gfx: move legacy memory management APIs away from
>      inline
> 
>   configs/devices/aarch64-softmmu/default.mak |  1 -
>   hw/display/apple-gfx-mmio.m                 | 70 ++++++++++++++++-----
>   hw/display/apple-gfx.h                      | 13 ++++
>   hw/display/apple-gfx.m                      | 47 +++++++++++++-
>   4 files changed, 114 insertions(+), 17 deletions(-)
> 


