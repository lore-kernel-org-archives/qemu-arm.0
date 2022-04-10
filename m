Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp914550lfq;
        Sun, 10 Apr 2022 01:49:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnB2XQlHJ6MxKJeUPoAnILAkE5OTbS5a91rrA6+YhUk4JMOGouXX8EogUZSIZpcI91RCs9
X-Received: by 2002:a05:622a:8e:b0:2e1:fee4:8ca2 with SMTP id o14-20020a05622a008e00b002e1fee48ca2mr21779425qtw.431.1649580566773;
        Sun, 10 Apr 2022 01:49:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649580566; cv=none;
        d=google.com; s=arc-20160816;
        b=K9b87dMonVlulzMclUbnop2blosykCZ+sayH6rOCV6scfhxW1Zyr7i6B9SLXbwswvS
         LmVTPS/k1THdjnQFT9QCBIAH0hufGiVcOBUarGrP91Jccwe9fGh6U1/DP0RrVj8Iifqa
         0km/j170UqIeXfgGv2wwPM30kwEWwIo/im9WIgfbSnFuw0oG4XrcssS/MJWGA+/AOM7O
         OrNCRmSn0EY4aXH9lPxtut/3e/UGRTt87K2nR9bWmNGSCL0Li2TbSxZuXhU//Yi/GH3Z
         FlzAQUewZy13i8E8TZwoporPNc4YpEUI1n/3HbvrwMTdQGv7pePxkvTrRbyaf5v6C+nN
         HN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5HgaylN3bXv5i5n3r84vgryFTa0e6OlQHTzQOmP6jUM=;
        b=bNF+u0xHZplVX07uhXeYvPq42ONxmIwSIwIdxeM9lRHBN3zgcakRr8F4SCYRfwHD1z
         4CDRkS6lKpmJx2EppaQWyFDX8gEXNNPyX7h25Vop7rvlMf2SKX88aH4fWRZ8z5nv9mST
         7l0+ApfCTnUj3Ayw57N7mAH6KaSUGY3+qtJx0TShqkyKJANW9r86my83saRP1XOUkHB2
         T82WtpREldMT6Jux1nBzJtHu8WBHh7BCgOFYCg8MUuAxPhIe7Lz8HxpPX36ipWnYgWra
         0SqyO8+j+7D4/nLNEJpJPwpyPUkLrz7gd6YJCvq89EUKZGmgPO+LwLa+WFA824JCI00F
         +6hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cyWbvHRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a0562140c4d00b004444197c8d5si184381qvj.461.2022.04.10.01.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Apr 2022 01:49:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cyWbvHRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndTGA-0006wN-9q
	for alex.bennee@linaro.org; Sun, 10 Apr 2022 04:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTG0-0006vj-MN
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 04:49:16 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:35652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndTFz-0000ki-2B
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 04:49:16 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2ebdf6ebd29so65360807b3.2
 for <qemu-arm@nongnu.org>; Sun, 10 Apr 2022 01:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HgaylN3bXv5i5n3r84vgryFTa0e6OlQHTzQOmP6jUM=;
 b=cyWbvHRpzGkGvaMnKKYfNr/Y2UluvsYv0PwIgNCsNUjNzljy8rq6e2nQkIr5pv7tyH
 +DkmkEcBCse4yyzi3p7Iy8WhuDaAPosbUgXrNuSkwb97OsdFQuH43XaVB3iHBOmFQ698
 xCIZC9CsE9fF47AgkxlBtB9+3Ai5hLnYj+40oNP7hP1mL645b6CLJrsFOQqvTsmt8dj/
 ClExYT+NWMYGaGlCf9CqoEEgrBYY+i/zwWCmQM30NaL2BYAedikegxL9rPxbaQfSDYDE
 SCet6FXZzfalVO6X4mrTmTKN/o/u2Vqbdnn7AiQKjXhvNwiIpOc+f6ctr/wheiAmRxId
 sS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HgaylN3bXv5i5n3r84vgryFTa0e6OlQHTzQOmP6jUM=;
 b=fA10XBON8fmeWaLLwajV1PxYTM0G/8PifQ+NO7wtQT3aTdZubpi8/xHZy0UbuSARqg
 2thuh5/rTpYc4PszE36CwDt+H0ZPcmYTzXEa7sL7xEpbNAONkKisDE1vby0S9QvUc/0j
 7M93gQLNc3GF1mgFvmso9h+zQduE7lIKOy24DkI/0Hs7qCi9btwIr+6pqMpth5piFv5R
 K6n9QWBe2ui/2PMZEWZ3ozn/3cEl2j1yiAyz7qhP9V8OCURND7yXQ6XqVOy+MgsBJQZp
 RntEaTtuBEEeQ70AlWzfPyvelV9abr0U/FpRNxVdw6hD3BEDkhb44llYwEmUKl5ILFBb
 kD2g==
X-Gm-Message-State: AOAM530q/weqODdRXsfzP7kWhDlE4Y+ub/wHN7KnkcsQKphlyDw/AjEP
 s41OCBcWCKg0jg2uQWZf6RI5LthlM1L5G0kYmSnGhg==
X-Received: by 2002:a81:1592:0:b0:2eb:5472:c681 with SMTP id
 140-20020a811592000000b002eb5472c681mr21814153ywv.10.1649580553712; Sun, 10
 Apr 2022 01:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-26-peter.maydell@linaro.org>
 <3a9e2d33-8174-d480-50e4-4da0985bc486@linaro.org>
In-Reply-To: <3a9e2d33-8174-d480-50e4-4da0985bc486@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Apr 2022 09:49:02 +0100
Message-ID: <CAFEAcA9hU+M6gYJPO+x4Kv1T9G=XPmuJkbSYGkeZq7GiQb0wZQ@mail.gmail.com>
Subject: Re: [PATCH 25/41] hw/intc/arm_gicv3_cpuif: Support vLPIs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oY/IYXSp52L+

On Sat, 9 Apr 2022 at 20:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 4/8/22 07:15, Peter Maydell wrote:
> > @@ -2632,6 +2735,12 @@ static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
> >       GICv3CPUState *cs = opaque;
> >
> >       gicv3_cpuif_update(cs);
> > +    /*
> > +     * Because vLPIs are only pending in NonSecure state,
> > +     * an EL change can change the VIRQ/VFIQ status (but
> > +     * cannot affect the maintenance interrupt state)
> > +     */
> > +    gicv3_cpuif_virt_irq_fiq_update(cs);
>
> I'm a little bit surprised this is here, and not in arm_cpu_exec_interrupt (or a
> subroutine).  Is this because if a virq has highest priority, we have to find the highest
> prio physical interrupt?

It's because if we switch from Secure to NonSecure that changes
whether there's a highest-priority-virtual-LPI available (there
never is for NS). This is a change from before vLPI support:
when there are only list registers the calculation of the highest
priority virtual interrupt doesn't care about S vs NS and thus
not about the current EL. (In other words, what
gicv3_cpuif_virt_irq_fiq_update() reports on the VIRQ/VFIQ
lines now depends on S vs NS, so needs to be recalculated.)

thanks
-- PMM
