Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F18CA5FD4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 14:47:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCeX6-00088R-3d; Fri, 02 Oct 2026 10:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xCeWz-00086o-Lz
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 10:46:40 -0400
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xCeWx-0003sV-38
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 10:46:37 -0400
Received: by mail-yx2-x0d.google.com with SMTP id
 956f58d0204a3-6737f0593faso6528025d50.0
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 07:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952392; cv=none;
 d=google.com; s=arc-20260327;
 b=Id6Qism2zocwUfpqrWUNz+drxvG8YKMrmij8FFfjAz61Cdn8veTWGTxGfml5xE6Fa8
 xzeFLuiDqaeImFZHE392BByArCj8O0YNvp5gG9BrIDpXKlwXG1JevLZb376X0F1N4Llx
 QJvZSZ2DVqI5h8d/3fSwyg+7XGKUYsZF03HyB4uxRD75buabc9Tk0JBrjaK4zB2coR7D
 Sk7HbbKTiu+XvksTLiAGHcn3/DYfFId+57ND8iucCv1j+pkL1PW9GeT+GGbgFxbGbp1n
 AJqZr3ax/YR5+ic4stvWN4sIlQRM5+VwB+8G+eM+48G4VEhETIpxVhqR4KFsWKNBomDg
 XOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=lAMwcizW1zvjHgl1QSKNa8I7V2eg1prWhDiB8byQ7nA=;
 fh=XrlEu6ZZ8eyjdZQtZwA4RSlU1II+Zk9Vlb3TbkWCq/g=;
 b=H0PVWoE1Y7x8Oagn2t12Itfo5bTCv5uoY6HWKn3Q0zWIp3ZLO9AcYbKJmbK1XLHUS3
 RhoJNI4RZt+9dYgJ4dGNDcb2ndWq8WQscUhaXGOc5fUONmvvCFsqtXVB2PhJMqUcuIBQ
 /GIXoGy2BoAMfXovzj6BGWxb6RBuYqh4hKqdrLmGg2yD1eibl1cWjq6YqC3+0oeGEk92
 Dvo04u7ErPkjmnFMgSWI9ahy3PignyrZh+3xwT1HglbQgOnGiqSS6nC/J5kO2Pn/U5My
 aJG7gSR2Cg1yh5t/NkxTCTljLwmE09LxUTJ44qGj+xNGfMtKFfxxZJXI/KM96JImC9I3
 FsSQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790952392; x=1791557192; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=lAMwcizW1zvjHgl1QSKNa8I7V2eg1prWhDiB8byQ7nA=;
 b=UM+bImMp1EcYgPmlJII+aPMkd8AZz3ROX1E7dt49XrYwF9vQFqbW6IvRa5MYXyTApt
 /77FRImcKboz/UmC2sP7XMdiDUfF+DPngptI8jGLWbXl63R+JaNX+5ZujLRcddncuvuo
 jEQNEfThHHLze60NpJlc7UVAG3BEZLYtkyFeSPMv9vjkmbxFPhxO/nNGRHvaZC7fwALv
 +dQS9n/kd9NUX8xLcca8oVwpGjcQOrOplAC/n4HZs+pnFdhSNisHkSx1MXhprFff+Zob
 xlDHOD1EPuts+mOyDHC+cw3lo07bL/k77B8B/dOnRD+98NU8afJwcG4VF3YPniF/gzph
 g6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790952392; x=1791557192;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lAMwcizW1zvjHgl1QSKNa8I7V2eg1prWhDiB8byQ7nA=;
 b=KpUz6nyUXOtgk14SOu9xNohUxQE5GWD5VcDdsUmuKVAFpI3CjtsM4nuZPbAHZNgHbM
 H3hWetoBo7cHqieouQI2IgfLCH52GxKb7K+QGXV6/J/0KYO+jy0XAwmnMmeT41VpoM7m
 BqF6pgSp4PLpvHULuY9+Huhh9MLCvhZQwZndl4fl3H9ALP+arQmQ8WmVMkGcAg/GhtgO
 c1y3H6y9KDIrLy+i4+Gwa5rT9t4a3Joy1VyX76uM4fcUBt3Jpf0CPCJzka+um2iuRwUQ
 NmlkBa1s1I5Md8R+KquuYz0fTFev/Wy8h7R8qQ2IjRZNRBJwNe0JWhku6jz5d7ygg6X+
 uMZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBySmGj4hL2HYB+ipTi5SqpGzLrfGlD54VClptBGIjjegw+2U5/JOYW6WGxDTZoZBMPi3h2MRZOOcg==@nongnu.org
X-Gm-Message-State: AFq9FYLIJo+vKnpREDVV3lgb4Y4nGt+vWnECsC3cqtsYxmmjJPXsdbzi
 hMG06b3m1Eh92QwyCDhtqOIwK6yRWj9Z97LgANHh5jL7XWXJqP+ao3n50tEsLOwvIwaj0nObip2
 7K+OjhSpe928m0Wb77TpX4sUuPYz+FHi6rx5IDIW4wQ==
X-Gm-Gg: AYBFou226Xi+t6ssaBFoHqPLrsfu0OH88HaJJ12l33NIhemVcD6qjTVa9CDbNbkOGWI
 /Hjd5dFZL6F4E4r06RU0/LNiYJpe+9uhrrDg6IKzBaPl/TuPk+7JfHLXm4l8AT2ZXpdBfWl/KRv
 rpRbnYDHP+vefLkY58R4xuKbAOKMOOFM1Ag0V2Jm8WImEDYi612ee5C5t9KSsEzuu6ox1VdZSnh
 VRTb67B0fDUINwBEDDGJD3vtKhmEa/shlV4n1TRpGpGGrzO/ZLLQjqkH/U8szUF/fBASOyTG1OH
 CjM/aXdo7mamjiC31QJTu+V6ooNq2S9wCMr8lpZG0T+QVMSJDcCWuL+IyetheFS8VKLMvKOe1an
 uppzXhPGQ2AO13W6bZ/nk4iiqksfAt5e/UAyRZNE=
X-Received: by 2002:a05:690c:dd5:b0:8ae:8d28:77b6 with SMTP id
 00721157ae682-8ae8d28827dmr2796367b3.41.1790952392226; Fri, 02 Oct 2026
 07:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260902152044.31291-1-philmd@oss.qualcomm.com>
 <20260902152044.31291-5-philmd@oss.qualcomm.com>
 <CAFEAcA-9R6ov530pA5FV6=ECr9qj5HP7yz=O4YtyCDJDP3qc6Q@mail.gmail.com>
 <19c91bbd-894b-4d23-86eb-00d68482aa8c@oss.qualcomm.com>
In-Reply-To: <19c91bbd-894b-4d23-86eb-00d68482aa8c@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Oct 2026 15:46:21 +0100
X-Gm-Features: AclHuK-N7jZnW5v3yjx5u5hYWXxHIx7oDI_Nuia5TNL-57X1H-xPAy_-gw54sV4
Message-ID: <CAFEAcA-7DDa1u4OsH05EuD6xt0rCVwTVeQE+ppRX3tdCqg9kxQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] accel/tcg: Document cpu_exec_interrupt()
 callback contract
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-riscv@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Fri, 2 Oct 2026 at 15:37, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
> Does that update sound good to you?
>
> * Called from cpu_handle_interrupt() with the BQL held. Identify which,
> * if any, of the possibly multiple pending interrupts specified by
> * @interrupt_request should be taken, using the target architecture's
> * prioritization and masking rules. If an interrupt can be taken, update
> * the emulated CPU state for interrupt entry.

Looks good to me.

> With the update desc I wonder if we should rename the
> helper as cpu_take_interrupt()...

Mmm. the "exec" in the current method name is "because it's
called by cpu_exec", I think (compare cpu_exec_reset,
cpu_exec_halt), which is not necessarily a very useful thing
to encode in the method name.

I guess my opinions are:
 * don't bother renaming unless we think we have a clearly
   better name/set of names
 * if we rename one of the cpu_exec_foo then we should probably
   rename all of them in some consistent way
 * a new set of names would ideally make it clearer what the
   difference is between do_interrupt and cpu_exec_interrupt
   (I can't remember myself why we need both or what the difference
   is offhand...)

thanks
-- PMM

