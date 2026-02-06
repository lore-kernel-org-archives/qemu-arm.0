Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E216EE20AA
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 14:34:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voMuo-0005OT-HW; Fri, 06 Feb 2026 09:34:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voMun-0005NM-6x
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 09:34:33 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1voMul-0004IN-8P
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 09:34:32 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-794f701a3e6so22021787b3.2
 for <qemu-arm@nongnu.org>; Fri, 06 Feb 2026 06:34:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770388470; cv=none;
 d=google.com; s=arc-20240605;
 b=CzK/HRXlX/dgpg03lUdPScoxoE/+2ZbIOG6b+EMPO10LgaMuFF/Nl0ySnXq19/E4I9
 PzyDIrbJa/VcXr4LBkD0ESmaW8DfqdSmCPlKz8/zyINuqEBjPjuH7ETZ1Qz08wAZg/PA
 bscdB64KVa69zkj1sXhC+Y98Jkkm6ET8F+1aIXd+Lkx345Q6DJRi5Oiub7cZgKWYvsd8
 3BQf4nNwX2bSBW+BkxU+6cPRIKHMIA1Sb3R/zUin8+nUsRWLnITgPOam1VkIx7ItNh4T
 h+87m6L/0L9+/xS09qfPNvJbOeBUwtYIx9gu7q4/r2mOMBktVPMsde1FPiT9LkEd1n/t
 mlgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1QF+DrOZ92/2UckmnvCyXlTNYdwhzVhQX7vJx1YPgPU=;
 fh=ACBXIW3EPY6r6IjG5JweZGG8E4WSPjtImaVQJ3S9kNA=;
 b=bCi7MIu5H7GXvP9iteIHx/IheKzN4MSsWv+I5C/fssd3Sgh8mGQXREQ8AcAZnyWN0g
 8htI/gThHloPi+v/g+8dzWJqXNEaC6TRKxoTa/Dedw/sRlRg3QBZ6wamsWzWN69pFNSV
 SNeIWNoxbYDP+5DsHiXLV3cNYYhW5PT7kKyvremFUEmExPzugILMQ5ZGB7jBtxhuRo95
 bRzogJAY2me/mlCJCjNYdb0LFVmRFJNLBPXeS3GYDW2XppGRT/aVoCELkjZsWZWHzink
 bRd5P/jUd2WDWlzDAgD0DRBDqpEW6dm6rBRQ3Ni+eD4KmH8JbVtcc1qDry6+iIO2fi2f
 hinw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770388470; x=1770993270; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1QF+DrOZ92/2UckmnvCyXlTNYdwhzVhQX7vJx1YPgPU=;
 b=h/rCTMl64fUNThXTjxjfIc2RzNrba9oeeIEasJwv5Y4IA3fHXE+9vgJ1q3wU31ifpi
 rdmIlUtIMcjB1w/1zPcF3W8Xa+Ok3O420aLgk9A1xyf6D2EOnKCnvfRYuhSNYr4gI++Q
 dzesJgrp00YHwOQ1z3q6aKInkq9vimeIBknQWJgrmvRxfQSYPlWUV+njJTNWJGXfiXzL
 PB49lGY89G1b4h0TqYVH+gZTtSQ5M90JtK3E/WjtFLd3D94ZtEgQaZ1jSYKIb2VrGpmY
 W8HtOqGlUn24ddU9OUnQtwwrSTP72gyKAFXe3RYQJfZ8NNUYuCs50yuvyaRglJpM59of
 cfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770388470; x=1770993270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QF+DrOZ92/2UckmnvCyXlTNYdwhzVhQX7vJx1YPgPU=;
 b=BWoo62hQEr6kf4B299bEU5yQs7dB2x1wS0e4xLHV1QAHwlX83Uc8B7hnUbR/oz+kgm
 u7epIW01GSr3a4oCz0Z4YjjQT1yKXOIkQQJgkOCmCS0xKzX1XbtCMkaXgQexkkjucJcV
 U+zfqxzMgLbcxc+BC1zwngb6eBw8J12RT+veJx9SKZ7lEfZ/GhLHK9plGZI49RVWtTEp
 fE33I2Plaw3aRwuFO6/JPFqDob1Y9e5+YEzzmOGYOkw9PV/n5pHp9sxcE3aTMPNYjLsL
 d1jdmT0L21wozsbpEtZZhc0e97uEcEbP/siXVAl/cw3J6q/Xn0Ps/LWGgYh/5tkTeiZr
 4n/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8kFhnSPpyegZFtd1DolRuzBRtPKGFw1Sk2b/EFTd5ZUoYlVZ9Fb7ow8m87qCXd8pLYFEQXTYjDg==@nongnu.org
X-Gm-Message-State: AOJu0YwCZTab0IxVpyiVXOqrL7iI015x3GqKcZw9JFYxS8qtRylIUgxj
 vCftAmjRTuxQCc481HXx8d8y2ea1pS2F6h01J8iy15Qo1viuAfD6fM0pEXOWvKcbSgJOPiiKJNn
 Ee33PFshETmU+Kx1pMpeBg7X3/xiC6Dra2jAcNHpZMA==
X-Gm-Gg: AZuq6aJLv5pZl0mvWmPCAHNQa/hSegxU3ffVt6QsIVCs49M1rNw7YeRkWCp4LbFZspA
 3o3jumTzq4BHRNOkr2UrKwz+jhFuufPA2Z3NwqWqQQnaeh8/KRWFRO6CbIQvfrDQlOILeJU2tBo
 RW8QYi9bRjCrWRRUz8iVaEreUhONo7IFFyFgQq0NcZ+r3avTWjXX9POwq+sy7TZ8yoWfPsGuqZp
 c0KlMnk/Mjk44E/+V568fKovwxdjHyr1j+f7F9nc2deuP2YK2RuZqCmchfsYBViwdv58IthJZdw
 LblZL3NQQ4miFrxVLkwU6ZwTHRniY/IbgS3Pc3h5vT3oX9etq+3fbU9X8HEC2GAc0g==
X-Received: by 2002:a05:690c:f95:b0:794:3068:255a with SMTP id
 00721157ae682-7952ab3f631mr27280127b3.40.1770388469281; Fri, 06 Feb 2026
 06:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20260126165445.3033335-1-eric.auger@redhat.com>
 <20260126165445.3033335-2-eric.auger@redhat.com>
In-Reply-To: <20260126165445.3033335-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Feb 2026 14:34:17 +0000
X-Gm-Features: AZwV_QgonnCeAULfz2vI0ip10Vy7G8wO8jNB96Hhllk6OH5AuvA-LjMjnL_SzG8
Message-ID: <CAFEAcA-AtNZWhcRh=p63krT3RemqtSq=MbWjwQvhqk5a6GK_pw@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] hw/arm/virt: Rename arm_virt_compat into
 arm_virt_compat_defaults
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, 
 gshan@redhat.com, peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Mon, 26 Jan 2026 at 16:55, Eric Auger <eric.auger@redhat.com> wrote:
>
> Renaming arm_virt_compat into arm_virt_compat_defaults
> makes more obvious that those compats apply to all machine
> types by default, if not overriden for specific ones. This also
> matches the terminology used for pc-q35.
>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Having our function name match the pc version seems sensible,
and this patch isn't strongly related to the rest of the
series, so I've applied this one to target-arm.next.

thanks
-- PMM

