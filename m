Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62685CD13D3
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 18:59:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIWba-00017B-6q; Thu, 30 Apr 2026 14:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIWbT-00014V-Mn
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 14:59:16 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIWbQ-0005lC-KY
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 14:59:15 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6530287803cso1398101d50.1
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 11:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777575550; cv=none;
 d=google.com; s=arc-20240605;
 b=jcQ5UEFD2TpfjzPjwImMH/8b2+i7nFT0a1v10FCBKjAu7q1J1TK29bkzKZUGcoxSaZ
 RzE0Cx8wkgIgD3PQJTqcqdoBRajFbQHMAGDOryjLcKdM8n8AaEQQOUSYnST1ezm+dPPD
 APFcf+ORG20Bzyy7PLFGk7++P3PrMq9TIr9wkzykXiHl1RSAMVPrNkNLgrabwT/IvOpT
 2UaeUJP6BXUALvmpwOYs5O6mHKgQqRa5cl2ESg/JsL+cXLa09ntVthkVF0VGLFMJkDob
 5S7baPVn7TzX7upQ8mmhqZmWLwNfoBpoVz2ogzgvV8DauIafD3CMNhKu48PNw5Ko7qT1
 YHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=QMWsypGprU2vf2WaeRTAV+hObzHLR83YenxHnUaqiMw=;
 fh=keDragsZNOEWa9BHffne2C+VD/T1spk3zDfJkf7eCeM=;
 b=lGeEZNuFylFBnwjS9OMZgRllj2Gadqi73OtNfPRXWi+lv0n9lZuI6egbzUs/i7zfrp
 nroy+ztKvv29SK1WeKAr+X1Hnblwv/Pmm4gHn9XRkSFYCPEfB171ZzyXb3w+sADNrQkL
 SR8t+IG65SFF3CnNLi4adqhL157LNOSqqDSUAEXPK6USQVnDCIlJ+8xuBTTI7rKssqTr
 I1Ekwwut95iJAf3FjzbNrfGy1avuXdi1D44oTxmVOzQbTIa7X8yngPjWOoA6IIxuwkDk
 F1vS85OJd/18ZJd0zwAXUr7qoNSKzuf9rb1cQ4YWrPz1WoqE3yFeRb+B5j1ut9pR6HKx
 tPYQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777575550; x=1778180350; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QMWsypGprU2vf2WaeRTAV+hObzHLR83YenxHnUaqiMw=;
 b=rD5fiEXIXbnP1Hf5gt5+xkyuIRzB9VgwzrCo/A8J2k85qeR8Kq7pxLIcXNA3EBCWjn
 fojQR0cZr9sH+jADrizfClu8fRwqDkxjyGG6tietYq9XYREeyaDcIzBAEZbRypZSQUJL
 49D3Q8LKVocepCA3uHbXcdYVwcwoBPslPaLsvkvLMtgBMKtvMAyFg6kBSJ01Suwc/ZIl
 /qqetntBHFHxmhkbbTtqT6uYMJ6Od4C4LLiJ1EMeYShG+Q0CB396tBWgx9YgCtGssKSv
 /Ixd9fNOPcpD3fNbWItc8NP4kYp2uKBEDGtyWHjKMC71IU8ZJhOLzq3qgi1pDOIEbEhU
 fAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777575550; x=1778180350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMWsypGprU2vf2WaeRTAV+hObzHLR83YenxHnUaqiMw=;
 b=YUAs4uM7suP1k7lMWcDHW6TB1Pv3tr7h4ma00JT7INv972CYytw3OIp08Yu+jVxNnn
 eQ41EhytSLmA93XEcpHmEtCEGZSiWdzkeZ10XT4a7rZzieJbL2w/weTuUmdETUWHj02S
 pxnRyB4mPvj0d0i3VpCf/lBygdwdXtNX++uTCkvGuqpFrwjsMvT9lHfIUH7e01osMmBp
 Ant1JdFl/M+QORKd/iye7q8E6xqqAh54l60hL7tuO2S2m2CG78RThoIwcLKzoOAsUz73
 DC4VotdV9m6z/PQcF8MVhXlEEyJplaBggNeu9J+9EiwXTIEAu4YuM05LgZzR5klj7U/2
 3Xfw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9bsPhvb1QR9zwvdxgJ1FB7epCldZQ7Yosr/kCSvrVtzpDcrBaMhLlTJ7nivs9S9wyolEWRRx6NWQ==@nongnu.org
X-Gm-Message-State: AOJu0YxLqtyeNgZaljyRbozWdJ5upoLp9YwskJL8MKyA/AM407WWQY+S
 rEON+8w4OHAWIsdM0JmBXdaR+bwL61CfJoq/PtnqqyFR0Xs4ni/IJWD2rD9U9UFswwqbIbNaU4E
 GyASTZJ6pPaxEEAfcZD0YQzvMp4KUPyDF/EG7cRwcWQ==
X-Gm-Gg: AeBDiets5HB1tFa5EExtNAOxq+zYLGbZgNR6XaFrqX8gnNqYBxo+17mEe+kL3yVfR3q
 KoRgNrrq4ZhpxOGek1Uuv+GTwfHs2VTiD/O7IUZOonohGIAfp5gyCRHraDLzBrPhJe5R4Di+M0H
 JzYf1pvyqQ8vOfColR2Iwhgt8Q4dHk2vkcaEN4t6iYHGja42tTRO1QRGcm/7n73yuP4qulxmpqI
 G1Sw00f/sbLBscMjVCOZRjIaDQiJXF/ThWg2Y9Ng9K+y/ouupW27beFQSkb9TWIGX64q2SVupCy
 O/tKTfiNZB+IFzVWnUn6kW1Eonov7o4Y4BoT3UUobwBlzAkkDIPXsDdZbOb85J5bAkbmJdH4Udh
 J6A==
X-Received: by 2002:a05:690e:43c5:b0:658:7513:5ee8 with SMTP id
 956f58d0204a3-65c30584863mr24561d50.21.1777575550014; Thu, 30 Apr 2026
 11:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260428083119.1400110-1-gs_liugan@163.com>
In-Reply-To: <20260428083119.1400110-1-gs_liugan@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 19:58:58 +0100
X-Gm-Features: AVHnY4I8zCXnTDxY2b4ksJBdjV5c-6MxSMh8812SItYPoloSnXgfhrDIVi1U85U
Message-ID: <CAFEAcA9HADVEBT=6pQSAr93G6uSmVo7Tz54U7nk0AKG57RXFGg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Fix NS write to ICC_AP1Rn_EL1 when
 prebits < 7
To: liugan1 <gs_liugan@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, liugan1 <liugan1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Tue, 28 Apr 2026 at 09:31, liugan1 <gs_liugan@163.com> wrote:
>
> From: liugan1 <liugan1@lixiang.com>
>
> The existing code uses a blanket `regno < 2` check to make
> ICC_AP1R0_EL1 and ICC_AP1R1_EL1 writes from Non-secure code WI
> (Write Ignore) when EL3 is present. This is intended to prevent
> NS code from claiming active interrupts in the Secure priority
> range, which could block Secure interrupt delivery.
>
> However, that check assumes prebits=7 (4 APR registers), where the
> NS priority range (128..255) maps entirely to AP1R2/AP1R3. Since
> commit 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of
> priority bits for the CPU", first in 7.1), all QEMU AArch64 CPUs
> are initialised with gic_pribits=5 (one APR register), so NS
> priorities map to AP1R0 bits [16:31]. Blanket WI of the entire
> AP1R0 register prevents NS code from clearing its own NS active
> priority bits. Machines using hw_compat_7_0 (e.g. virt-7.0) still
> force pribits=8 via force-8-bit-prio and are therefore unaffected.
>
> A concrete consequence observed in virtualisation scenarios: when
> a guest VM acknowledges an SPI interrupt but does not perform EOI,
> is force-killed and restarted, the new guest's attempt to clear
> the residual active state by writing ICC_AP1R0_EL1=0 is silently
> ignored. The running priority (RPR) remains stuck at the old
> interrupt's priority, preventing all equal-or-lower priority
> interrupts (including timer interrupts) from being delivered, and
> hanging the guest.
>
> Fix this by computing the exact Secure/NS boundary within the APR
> bank based on prebits. For registers entirely in the Secure range,
> keep the WI behaviour. For the register that straddles the
> boundary, preserve only the Secure bits while allowing NS bits to
> be modified. For registers entirely in the NS range, allow full
> write access.
>
> The new logic produces identical behaviour to the old code when
> prebits=7, preserving existing behaviour for machines that use
> force-8-bit-prio.
>
> Fixes: 39f29e599355 ("hw/intc/arm_gicv3: Use correct number of priority bits for the CPU")
> Signed-off-by: liugan1 <liugan1@lixiang.com>

Whoops, yes; thanks for the bug fix.

Applied to target-arm.next, thanks.

-- PMM

