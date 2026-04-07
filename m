Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (unknown [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A7710F996B
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 18:32:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAXhI-0000Us-8m; Wed, 08 Apr 2026 14:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAXhG-0000F7-5c
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:32:14 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAE5I-0000yj-7F
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 17:35:45 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4887f49ec5aso73622625e9.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775597742; x=1776202542; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3W8HqqTxFOh4MkmTfwH6twPO7RF/ZB9to8jMJklt6Bc=;
 b=vxNCfNTXGSZLRTTIcV/m2FCWi3dFGX09FHMP8vW3gVpMsjN7sZYZ0XZhTtxnt1NwHF
 fbWZn4sf61zaZAhOAPU3Z7/S8aL7xUttxTXRbXlLevSjk9DUl1JqkngXjkLKp+JAzJL9
 hkEz8EnmIIog/FT2f6byDyGUtymOBk9zAogksBazZhWrxJctrkjPgmONgIvMXYcONRIL
 kvhBUAAxXl7EcYyl2rMD/W+eTQAx/91aw+HA6QDGe5HdpUAFywk/hUGdnaJKbwLL2idm
 E57CIIGhm+Gyg1PxfSMlQ9TsOi8pT9hLz6pLI2jwGS3ye+mZXIHUq8YI8INO+h/jj5zu
 zlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775597742; x=1776202542;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3W8HqqTxFOh4MkmTfwH6twPO7RF/ZB9to8jMJklt6Bc=;
 b=SP76F8OGpLDUPB/UgUQLOZ12JOLUtatUK0ct1r0JzWNvbIFjU8/mdPTd+CtjDTRR7h
 87tSONJX13WiBm7yJUkI5vfnQPS9mQjRR6FK++QJTWgqTFjkHuiL3EbhNu5tSc/NSAnB
 UpVe/E6xrJL2Ry/rNPJGDnAQTFism33ZH08M2bZx3Dh8xRU0spgQlQO8zfd9IFDqtllv
 4t4gSfBxSU1JjaoqIedU0H2GWjClQ2z3doF2m8luXj4lCKT/6775hcOBIKINVsYJPCth
 N5aNB2CE8xArDjQW+N0PfLtq+AJbVTDCSLZMPIjreIzJ6J4crQiCuMxPFJFdU4QHz0V6
 m3AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPotxuy6pMg4rQHVi6qA5CcLoz/xBnQ0+I8Ev16SIydBYySxDqKwXEiwc7IpDWFfuB7Ds4+vpKWw==@nongnu.org
X-Gm-Message-State: AOJu0YwNZV/Lp1/r/XxzgocTdwK+S/XktsguBKUfolO3g3mTWhdePUcZ
 r6mgpFQJttx7G/8cmqBMAPNQt2h7z3Z9+YrEl2EOGY+Gusjmgh79bfwumZyNmeh5rIo=
X-Gm-Gg: AeBDieutwmUCbWOlO55CcOPuC6iI3fGAaff6jmoYvwV5McG9EQeOZdENecTehgQCIEp
 Ktow46VLuGsl1M7qJYwRBC9dCF6NgbtCPasxrHTsZ/1NsLHsT/bogEq2moO/3NPtZhMr5fntDPS
 fu69VwbuwhOVJ3YgINMCFu8IjJLvuTsKc08fKTw1+HCPQGj4cJeA0v0ECnG+gfoZsayMA5bx7jb
 /mlwo5whp2nvNIiw49SMx3/Zpkw+y/QJQxkppoNF6H+kO6kjqQTHhBU13ObX3M3Ixd5Hc4QE1Ug
 UwIOrupHCetOi0nETtxXPOCdL19KefQd1hBUnX/b8gKaoiXRxaNCptAUiUiA26tIyWQ1T+Sftr7
 vXjGHhVOLfVCAMx1ADNNS+SflOdd3MeeBKjQjE1pKMA/09bJLEsNYxWV7zJQ04qlwRRUEdnKpsf
 w931SKqc3K9ZdIBxCu7bRRzwuQNqo79D/N/WM78bjJ6VVPv+j/0pUzQv7HHIXumJg1fQ==
X-Received: by 2002:a05:600c:c11b:b0:488:be58:bb5b with SMTP id
 5b1f17b1804b1-488be58c8fbmr45325305e9.24.1775597741690; 
 Tue, 07 Apr 2026 14:35:41 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488940e075esm471801215e9.9.2026.04.07.14.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 14:35:40 -0700 (PDT)
Message-ID: <58f386b1-ae83-4faa-a05a-3f36d3bc2e51@linaro.org>
Date: Tue, 7 Apr 2026 23:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/21] target/arm: single-binary
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 7/4/26 21:59, Pierrick Bouvier wrote:
> This series tackles (most of) the rest of target/arm, especially tcg folder.
> 
> We extract tcg memory operation in a new header, with a new type representing
> virtual addresses.
> 
> Initially, I went down the way to have a dynamic definition of TCGv, which
> required much more boilerplate and runtime checks. After discussing with
> Richard, I realized it was not needed, and that could simply split 32 and 64 bit
> properly in different files instead. This approach will not work with other
> architectures, requiring something else, but it's enough for target/arm.
> 
> Files left are:
> - target/arm/tcg/mve_helper.c
> - target/arm/tcg/m_helper.c
> - target/arm/tcg/cpu32.c

I remember having an issue with cpu32.c when it registers TYPE_CPU QOM
objects, "max" overlaps with cpu64.c one.

As a kludge we could rename arm_max_initfn -> aarch64_max_tcg_initfn
and move it to target/arm/tcg/stubs32.c =)


