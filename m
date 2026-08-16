Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C1DC5B572
	for <qemu-arm@archiver.kernel.org>; Sun, 16 Aug 2026 10:52:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvYTT-0001Uk-MH; Sun, 16 Aug 2026 06:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvYTR-0001SJ-G0
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 06:52:17 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvYTO-0003UX-N2
 for qemu-arm@nongnu.org; Sun, 16 Aug 2026 06:52:17 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-836ce5d6e85so35699467b3.1
 for <qemu-arm@nongnu.org>; Sun, 16 Aug 2026 03:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786877533; cv=none;
 d=google.com; s=arc-20260327;
 b=DdBI3RFiEBCpoDUdHhDotanZ+a2XagzmrkTEYf701EBoYTWWQyew+fEMktJOajwRsg
 Xgjgh8+PMeZsKkXlYT+a0z6roBOa/cwRPqG4pZJgu4a2AEVSVXWR92/SuscQdM3bdqFs
 VWIlMboq4juOaqY3oBWcJGkJcIv/9YUbTKjyHtq7kb42ZDR25hR9EnjGjdyZBrwK1NUP
 3PQD+JpxXOZU+Jz4Ki1E/BgrZ5TOsZk4uX9v5MU2vSxTl47xl0sJPDRuk2VrEzP7EBYH
 KPSU5hCu6Vj5JRrYwpWFw462g10pChE9o1y7cmNz9IREZAN4wZe4svgmLNgPPutCozla
 Q+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PqeRYrg3PrIaYtUYmtOa2SRBovFInGsZyhuU7JlXj9U=;
 fh=HvTHwkCBUUhJZFgui0v5IyO9E+5y2yS9YxBkNblb6iM=;
 b=kgkAhJcpLP7gu9DHxdYHPd+b6EQM5kv0ri3NsKUpuFTJWS05vL58bBhXR5clhNCqDW
 MDMR/NvxvT6pPdNqG2UJILshxMmgC2gpd7lBStQ0BnivHvT2W2Y71Gk+jdsoY/XkQosQ
 9apHzxz4kVTUvSHj2s2wmqyESviG+fl3xt8Hl8wKO0RcrRv4+PmQXfjXl6qPz60roLFk
 MhjbwjNN2sM9FBjSrqjSsyZMdpT4K4YR0B7IaSpBoQ0y0HnUZd3ic555G0/JMitR1rjP
 rQtrOjv/ncH+4/Ikvlr/MmCegB92/VhjF/TJSaeST+Uc4MiDmfMO06sLvqvrhCQYiSd3
 enEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786877533; x=1787482333; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PqeRYrg3PrIaYtUYmtOa2SRBovFInGsZyhuU7JlXj9U=;
 b=EKmmfn7sjqRimaq2C5UqIdmM4tYM9b9PvqTbHyEIimtiLi0c9+/zuTcEv+WoM6A4Is
 sqd+GNTZ7l0K0srObCxUsXyJ4wP0j9KJOLwOih4THud5VQwVcm9cE1XNngqbaA46DNBR
 ZWd9xToYGc9OCNiDzSK6fEzM3bYy3BN0OUmYa2vk+o4+ztMzCyntvAxfRLKmb3Og0+M9
 v0//s/lvFIFHSH1ORxmhZc2JviYN+/emUoTfoHU2zWjf0K/uFm3LQhCkn8L5tJqR16iy
 J6q3a74hhMFF26k9GH786+sRWG8eM0S88c4JalwLAI6aqrzfoHOMwYUy9YP9gUtV3cS8
 aOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786877533; x=1787482333;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PqeRYrg3PrIaYtUYmtOa2SRBovFInGsZyhuU7JlXj9U=;
 b=ICwbvns1RAyJCag81uMAamRML6CAdBLpO1YfzzPsbSdDABe/KTabUafvBznzE6MXne
 AmSVI1mG2vuUXCXjnFOkJMN54Zeg0dwBV/TWyRhQ9gmgcctPG/pi16FULVZ0T6xPJlVQ
 oqKDrggPmy3rKGUzL/9NPt/44+Vjf+zBZjnMCdsQTU1QSk4KOdEbBRmFRzYEE6cKhWeO
 rExhZ4U4I2e0kQnLj1oo5og09t2Zkmg2ZlOmILzIU/XhKIJfA9pYiZbQOUYtQz+1pkLW
 RRiN9x5I53GwDHeCU9AB8P/kN2Mts7QJkWpKDntDv+GKfaG23xPHeNiM3u8cnfkIipZS
 gIhQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvYnbHDl4BGSIU8t0Oc3DfEhEgcNw2FnsWzO+BSvhGdzjTKVkJr55Js7WrrpmZRK9ApxfVowUHhQ==@nongnu.org
X-Gm-Message-State: AOJu0YydV9stWp76JKFycj7ICDJaKZ9uxSQZtx7vlm24x+q8a2K4qKlf
 /NP120lirDny8t/hL52LUafykgQ0TYoz2JP3PRelfM+BJfCcbxi6Lz2YSZJmjrSxTT7ZY9W9nDJ
 nrhbeuPi9R6M8DpTHSlzpswO71+P/uaRiERyklXq9pQ==
X-Gm-Gg: AR+sD11SaNkq7cNOCLKgm5Qw91fZ9EBBTQFpkYEgq52IVnqGlhyFYA1+zMTXuk/iIF2
 +jtdg98VAch2jak5q0UE6MCgbEtyEIBVe/yzxOQfWGaf1MzcDrhSkDTN5GiHH0hcEOnLuMszztQ
 za2zGkqySiUNjy3T1WgHi0ik4UtQG30IrpCQVcWutxz8uJNkDxlci4Hj7UPyzoh80pZBnGxCizB
 NTHZ8umUbq0R8T3lAqFg+tW/YKIgu7NKpuI2sXlMwkN497/Imh1SnlvOr2E0HsvLeTaZ3UmQPok
 kTKTMLUdj/AQnPurP6QmRowiihNretu7gYpTQ1GQKnM96xSjznF2V9WtBdGEbb8AIg/tx7IJ3mz
 eZLppyc+Fl3lP1IOMAih6QvpP8khl
X-Received: by 2002:a05:690c:e1d7:10b0:831:4071:da70 with SMTP id
 00721157ae682-83712cacf29mr47930107b3.32.1786877533141; Sun, 16 Aug 2026
 03:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260812220816.94034-1-philmd@oss.qualcomm.com>
 <CAFEAcA-NUOtTPuvxKja+bNU6wy6EQFVMfX9nmQ_LbtAPKHqMXA@mail.gmail.com>
 <351e6d2a-20bb-48a6-a1f6-0800cf2a969a@oss.qualcomm.com>
In-Reply-To: <351e6d2a-20bb-48a6-a1f6-0800cf2a969a@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Aug 2026 11:52:00 +0100
X-Gm-Features: AcwNN1Uhj4niaA7rQZn1v_zCrGC7UOxqz0q01xaifXK6JFoe7mj2I_M_hGkw7C8
Message-ID: <CAFEAcA8x7QuxJcwzdJO29yQ7pkz9YFfUkc+2v2FyGhrHjFJCXg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Have GIC kconfig select GICv3 for HVF
 and WHPX
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Sun, 16 Aug 2026 at 09:52, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 15/8/26 16:53, Peter Maydell wrote:
> > On Wed, 12 Aug 2026 at 23:08, Philippe Mathieu-Daud=C3=A9
> > <philmd@oss.qualcomm.com> wrote:
> >>
> >> While trying to fix the GICv3 dependency on KVM and WHPX in
> >> commit 39a8c3941eb, we missed the Kconfig ARM_GIC symbol only
> >> selects GICv3 for TCG, not HVF and WHPX. Fix that.
> >>
> >> Cc: qemu-stable@nongnu.org
> >> Fixes: 39a8c3941eb ("hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for K=
VM / WHPX")
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> >> ---
> >>   hw/intc/Kconfig | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> >> index 097de4efc5d..05e697967d0 100644
> >> --- a/hw/intc/Kconfig
> >> +++ b/hw/intc/Kconfig
> >> @@ -26,7 +26,7 @@ config APIC
> >>
> >>   config ARM_GIC
> >>       bool
> >> -    select ARM_GICV3 if TCG
> >> +    select ARM_GICV3 if TCG || HVF || WHPX
> >>       select ARM_GIC_KVM if KVM
> >>       select MSI_NONBROKEN
> >
> > Is this instead of RTH's patch "hw/intc: Fix arm kvm gicv3 selection",
> > or do we need both?
>
> Richard's patch only touch KVM, so we surely need both.

Thanks for clarifying.

> I haven't tested KVM but rth's reported error is the same error
> I'm having on HVF and WHPX. The ARM GIC Kconfig are confuse to
> me, so I don't feel confident to review his change. My gut feeling
> is what we have is too complex and could be simplified, but I
> haven't spent time thinking about it.

I definitely agree that what we have is confusing; I don't
understand it either :-)

-- PMM

