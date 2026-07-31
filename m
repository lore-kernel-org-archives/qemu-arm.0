Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641EAC5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 14:30:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpoF5-0001Cb-KN; Fri, 31 Jul 2026 10:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpoF4-0001AW-5x
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 10:29:42 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wpoF2-000410-1o
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 10:29:41 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-cbb8b54fcf8so939191a12.0
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785508178; x=1786112978; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=E/noXmKlbngrH62CJOPqLkKBMDdAy4WXHVEoX0aD4ek=;
 b=xkUSo/lQld+s7iVlAl7SOdajj27n9eshOigFB8vgsXL7WCvRh6gWTHsJO/70vCq13e
 OOVfENplg5ABnoG6iPOjyogYrnprXxglbzhsJ94HACo2VJrJPn5xfvLZCNYvHNtaOG9e
 QdvORAKtvCsZeabBXVRlAnnZIL2atdzIL9N6hAlIat3WLCkHnqxa8Uru/7TP/9KIOzRG
 lAtR1Y9qQMp43eVMoY4dqWQnxgl1K9PKxAxLHAY89xdtkcezAwuZ5IWaxeO/ZwCTjs12
 nlIEd0AxP6oSH0W3UU8pODEAmKtoV6sjG8DHegZGdLCtCNX6RKtbCig3sL7Ztu4rSsPD
 X1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785508178; x=1786112978;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=E/noXmKlbngrH62CJOPqLkKBMDdAy4WXHVEoX0aD4ek=;
 b=CNCMPrr4k6XSu27T5dMnloKJtG6p4qoemyG/SSAVMwFlE4UvcBHoc4pglhA+cmWe+U
 7xfUNlz26G1eU1zwK9ZKdF/bf7saxNAYM7wMBaclSWRFFViu+qhVX8SfCaiClqtKEGQw
 rrXfdUi6dcd3cvIYo2eZ/fqmLFGZomSsl1nWCZx+mNqQwEPuswUZ5zvtXGZwe4DgvJEB
 fRnkLHpKEc8O41iu7TtZnHTeJlQ3cRkESbzuPZ0eTc/ibeERoTpZSvJnf1vfr3lX/E99
 N3o98ebtWvHBmpdfCD/2Huf1O9ul56tDGHsysR2cl4ClhVnNleENBVxnHdlx2DWMIeKV
 ARlA==
X-Forwarded-Encrypted: i=1;
 AHgh+RprChlpPztU+Hu5FmqnVndLYvxptIHQG27uDTJhCN3A1p462z9Qy+1axIBK+yHul2/AXmOHlR8+Yw==@nongnu.org
X-Gm-Message-State: AOJu0YyYyoI742XRR032k9S2dV+bj39Bp9aYvRVQWhWPvi3TCG+JLdHf
 Yenfgi3WxGyvFqz6RC5BJ/t18mekL6Cx+OyPeYJ3TuhZJRbfah6ONmFyylCZUefBh74=
X-Gm-Gg: AR+sD12V1maalT2yzDpU2FhEeVtkt+WbglzPY81STrfoNHI4Uo0BKQwtc/OVJl1ypha
 huPXrt1gEuKFdbTiq8fMgHzu52VgZjPrD890GxnPp88BEm96SHK2xxEFzaM/ad6MJqST1rEOSLk
 fkdKqcSxgc5ludu/LVkCSlMCqBgNwQcVRNvIAUiNtolX4rVWL9uMlN1dLMlf/SgWZlvZLjFspH0
 NtAwjA5icZsKg4yPNHTrVXk0O+7mtTSfZrlqQm8nhS6oXXEDoscJspTQ4nDkRypb4kvuBti6EU2
 kScQ6uqR8Yn77+CFAm5eWD4EeOtFSbPaido2WNvjiEFsPgBAJk3qyM4Rp06OxB2S4AeZM3VTvO9
 vr19qpCVDW4gOXayNijaMwu8xtcxL3DS2y/JnV9z60G8roMNgxK31vVVBCfRKDvvFf8G2iq5G+3
 GOcaMoCjobJ0EaWtiaYvDuAdsfzmwfbchHU8cR04aFi5Kgurh5XAguHYk7X6YE7vQ0Os47JydTS
 fbUprn4bY33uCJ+Fyo2gZ7p7lws
X-Received: by 2002:a05:6a20:7293:b0:3c3:6af8:ab24 with SMTP id
 adf61e73a8af0-3c91b375288mr2561768637.56.1785508178576; 
 Fri, 31 Jul 2026 07:29:38 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe3963da0asm653988a12.4.2026.07.31.07.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2026 07:29:38 -0700 (PDT)
Message-ID: <0be76aec-54da-4d5c-a92c-0a8520e39e89@linaro.org>
Date: Fri, 31 Jul 2026 07:29:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] tcg: Add tcg_gen_revbit{32,64}
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: anjo@rev.ng, qemu-arm@nongnu.org, git@xen0n.name, 17746591750@163.com,
 maobibo@loongson.cn, lixianglai@loongson.cn, philmd@mailo.com,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260731000503.170446-1-richard.henderson@linaro.org>
 <20260731000503.170446-3-richard.henderson@linaro.org>
 <348faafd-2346-43dd-85d0-4ed7fe965ebb@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <348faafd-2346-43dd-85d0-4ed7fe965ebb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 7/30/26 23:49, Philippe Mathieu-Daudé wrote:
>> +void tcg_gen_revbit32_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
>> +void tcg_gen_revbit64_i64(TCGv_i64 ret, TCGv_i64 arg);
> 
> Could the bswap flag be defined once per target?

It is not intended for bswap (or revbit) to have a set interpretation for any target, but 
to be contextually correct for the usage.

For instance, TCG_BSWAP_IZ would generally be only known at the call-site, because of how 
one has prepared the input.  It's usage within s390x follows forced zero-extension:

     C(0xe31f, LRVH,    RXY_a, Z,   0, m2_16u, new, r1_16, rev16, 0)
...
     C(0xe33f, STRVH,   RXY_a, Z,   la2, r1_16u, new, m1_16, rev16, 0)

Annoyingly, s390x should have these memory insns updated to perform the "reversed" 
load/store via MO_BSWAP.

> - output sign-extended (TCG_BSWAP_OS):
> 
>    alpha, hppa, loongarch, m68k, mips, riscv, rx, sh4, tricore
> 
> - output zero-extended (TCG_BSWAP_OZ):
> 
>    arm, avr, hexagon, microblaze, openrisc, ppc, sparc, x86, xtensa

But note that arm uses both OS (aarch32 REVSH) and OZ (aarch64 REV32).


r~

