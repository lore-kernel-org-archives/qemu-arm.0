Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1281115lfp;
        Thu, 16 Sep 2021 09:28:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoC6cXG2HJhCXGTNZ3GOQ/gzx2i1u2pEOnLaeWQLXfTTF2wWcl6Gv1v1bx9miScQXQIcIx
X-Received: by 2002:a0c:9c48:: with SMTP id w8mr6066540qve.65.1631809701205;
        Thu, 16 Sep 2021 09:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631809701; cv=none;
        d=google.com; s=arc-20160816;
        b=ljHCXEClsWuGiT+F5Uj6ofCgKL8rMiFuocFe+i6+I2dS0BllgZZSoT4nmi0aVzFY6I
         T7BDY5mY19mB+AC/c9Ocp82i6oX+UQV14EA5Oa+9gk1czrz3FeIN8F1c8wXFrdQytcFE
         tnu2rgIfT/AY3QGrNaG0xarZBnn6Vb4mUMyey9SGiTyd2X3dcSzkSGcJ18eHui02IRe6
         9S7yAXWU1hXCGG33YbSrujbIGlCs0eIaYr+/9hcq+GDy7UtaG0k6V1OrfVfeQgOYED4V
         hoZ3IEUgs5yeXn8zn68Im6pu5B39zW4Jh2LLhiN/NVKlw/chN/PwK5hzI0HwzPC8Ip1g
         6R0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ly5kypNxv30jFPUE5GZsPD4a6yBWxm88w6L343wLSP8=;
        b=MLs4ZUZxH/r5aQUqYpwbzWk6aTPaVISAd087/gQC5V0tqbFT8tVhnDwlcc0eFCmsWR
         rkmcdOPaMJcaZYnpqGQ+3hv66HecNpj+wfjl5Q6/gxIlHzwKbEZkrSG/uun74dXHR4lr
         Ap05Ig964coQ9se/KNZ9/M/u1yOtEAMWKPFO0yx/25+obszJTCof47B26m592CaVqjKR
         OFb1m+GqbOPEi/ATSdeL711Ummkvtkwqdchw2lv9haTP19cY1zgkLt5S6OKIEC30V0pl
         62wQbtSSMN+CAcZ2djN8f0yqHUN31MmB9VeIthzQPaXMtHjeg4ROHEGECyipvNhKF1hg
         DMlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=hJrD6i5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t34si1988826qtc.133.2021.09.16.09.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 09:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=hJrD6i5N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQuFI-0005Fl-Ko
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 12:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mQttP-0004B8-Uv; Thu, 16 Sep 2021 12:05:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:60252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1mQttJ-000654-Rs; Thu, 16 Sep 2021 12:05:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 811ED61284;
 Thu, 16 Sep 2021 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631808328;
 bh=VzJSebYs1KUuC/ajUXKa/vXtZKo1ICr0zMwS9puvvqU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hJrD6i5Nru1B+yK6WWHH+W4Qy9xX8vSQHYEoE+/h/zDSAeZfo/NgkSyDqW/PHA3d1
 b53B4oJxnDzVfweieHLDj8y9WQBUVzYgvX6ORSSh+vuFNy+4FswFd7Sqo1WDmgOQLI
 HluOe97bNZv0wQ3zaOhkk/NuVDiDG3PkbG83kFcNFs/Oth124kTczlT/H+ATDJ64mu
 z2MOB7uQUW+rnSOAXMY5+luSjAXOmrVNJdbJSIxlqZypSetm74bOk4LhEmGZ+/IRnF
 bBEhVUuMI3m/WUAJVktWzAOSgxKqyEmuyjy/m+/GylhFzUbr6qn+SGhj8jjFMpeVNx
 IDNDgVpKyU/6g==
Received: by mail-oi1-f173.google.com with SMTP id v2so9688280oie.6;
 Thu, 16 Sep 2021 09:05:28 -0700 (PDT)
X-Gm-Message-State: AOAM5316tRJ50Z/R2Vsw7C9rRmufklFoXvjKx7t2rT3ik1j+vx5gue52
 WW4FAqXTO3+r+r5wQEl6D8z0pdmBKaaUUMWNzvM=
X-Received: by 2002:a05:6808:15a2:: with SMTP id
 t34mr9537589oiw.47.1631808327889; 
 Thu, 16 Sep 2021 09:05:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
In-Reply-To: <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 16 Sep 2021 18:05:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
Message-ID: <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Z/ZLP+zvvuy

On Thu, 16 Sept 2021 at 17:56, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 16 Sept 2021 at 16:30, Alexander Graf <agraf@csgraf.de> wrote:
> >
> >
> > On 16.09.21 14:24, Peter Maydell wrote:
> > > On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
> > >> Now that we have working system register sync, we push more target CPU
> > >> properties into the virtual machine. That might be useful in some
> > >> situations, but is not the typical case that users want.
> > >>
> > >> So let's add a -cpu host option that allows them to explicitly pass all
> > >> CPU capabilities of their host CPU into the guest.
> > >>
> > >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > >> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > >> Reviewed-by: Sergio Lopez <slp@redhat.com>
> > >>
> > >> +    /*
> > >> +     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
> > >> +     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
>
> Side note: SCTLR_EL1 is a 64-bit register, do you have anything that
> prints the full 64-bits to confirm that [63:32] are indeed all 0?
>
> > >> +     */
> > >> +    ahcf->reset_sctlr = 0x30100180;
> > >> +    /* OVMF chokes on boot if SPAN is not set, so default it to on */
> > >> +    ahcf->reset_sctlr |= 0x00800000;
> > > Isn't that just an OVMF bug ? If you want this then you need to
> > > convince me why this isn't just a workaround for a buggy guest.
> >
> >
> > I couldn't find anything in the ARMv8 spec that explicitly says "If you
> > support PAN, SCTLR.SPAN should be 1 by default". It is RES1 for CPUs
> > that do not implement PAN. Beware that for SPAN, "1" means disabled and
> > "0" means enabled.
>
> It's UNKNOWN on reset. So unless OVMF is relying on whatever
> is launching it to set SCTLR correctly (ie there is some part of
> the "firmware-to-OVMF" contract it is relying on) then it seems to
> me that it's OVMF's job to initialize it to what it needs. (Lots of
> SCTLR is like that.)
>
> Linux does this here:
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/kernel/head.S?h=v5.15-rc1#n485
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/include/asm/sysreg.h?h=v5.15-rc1#n695
> because the INIT_SCTLR_EL1_MMU_OFF constant includes forcing
> all "this kernel expects these to be RES0/RES1 because that's all
> the architectural features we know about at this time" bits to
> their RESn values.
>
> But we can probably construct an argument for why having it set
> makes sense, yes.
>

I'd argue that compliance with the architecture means that the
software should not clear RES1 bits, but I don't think we can blame it
for not touching bits that were in in invalid state upon entry.
