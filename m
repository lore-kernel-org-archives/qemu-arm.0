Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5694788lff;
        Tue, 10 Dec 2019 03:49:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvpWFLTRKQ5v9MwqCfBVPuCQznoUvcdqU6SJlxT754i4wD2Ck5qe5ZKXncjFa8r7SvlsXq
X-Received: by 2002:aca:2808:: with SMTP id 8mr3665112oix.27.1575978544732;
        Tue, 10 Dec 2019 03:49:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575978544; cv=none;
        d=google.com; s=arc-20160816;
        b=dJqG9+v+dCGK9+EWKMu56g5TWblvUAyVOrK4uLwNdd9WcHpgzCSN2OTi4VO8FZwOTH
         FGo1AAz+5RUqBYihSva4rSIfAHj6DUiZAK3h0A0zSJejnYI8enHIeDOYisvlX7O6j4eC
         hpGdvSM/KCtDvZNMyuoVMpoyphaHI5zS/DPWVrT2idm1WY4rJ9+pENChL+bcx4qmufbI
         q8elzXSz2nGLxyzToteSv7H6bc4aC1INRODVdRfN0+/wepVAD9xYn6xUOcBTlptHmwMO
         mOcGGmbhCuqYDiXkQsI6ItgFPbqVrf6w1yN78wrcUEL0T1wRJ0Ix+M4GPYLwxI/NpxDN
         6csw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SfXh7eKZqdpO2LGEgz3P0HSgLknLGqn+asJn+CHcrPI=;
        b=M57vszeY7gYvePA81tK2Pz9UnQOuxr+5NFWRcfTnFCDmm/hIu0wZzmcgjyB+G2AoV1
         Xi4SZCCwlzLN+SBxIn2SA0AZUJfpLWRndhGY0dWX6T3vEI8w/zPJQU/2Ye1VPZCY+GPR
         fMCdxHmjmuX8kcvMhqzpPEbllIuA7RNhnmwWwkJYS+JxZf0X5MRZINVIuTBtJ2eAIJs8
         lDB7t67VRFWic3sXUOGM90zgg6FxZHsXn50YIIjjTobhGYAzDiKdRkrZfPvrA3ZFPLtE
         1DhPrC8SdAKbC0P+K9v9Ij3XaSeOyu9goTHjKjv1tRTT1tC9MFj16DfBz3AcEF27GLxh
         a7Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tE2Bm7qH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20si1804059otl.159.2019.12.10.03.49.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 03:49:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tE2Bm7qH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iee0l-0003ZX-Qu
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 06:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iee0Z-0003YT-L1
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 06:48:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iee0Y-0006qH-EE
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 06:48:51 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41887)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iee0Y-0006pU-8K
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 06:48:50 -0500
Received: by mail-ot1-x342.google.com with SMTP id r27so15199874otc.8
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 03:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SfXh7eKZqdpO2LGEgz3P0HSgLknLGqn+asJn+CHcrPI=;
 b=tE2Bm7qH6GjY2mQXj1MWvgEieR2tcKUidD2+T4ja754WnhBE5poHvZhfvZk96rQ5S2
 ot2BaTtcY3DY42tK0z50hv406f57UoY7CIRrVDAwSk7/+YmaqNynl8/s0807+AgmdMcN
 qeKd5mpmh42vcCbxaUjAGhnzH+Fyp2gcCkdi9bAIAHhg+LdQd1EwriUvZeRcmZ1YteRK
 tlb/ayBCDE1x3f4pJyCP/RXMcyH7YTwW2dU5RF5ec/8ws3xgfU72zeJqC41XuS6IuSI/
 KwF0F7NrVQc+czEmGXwgkIIL9YLUS2x1tu6eu6kBkzMN9shDKY8aYc3+91OXMdGyoYFA
 MhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SfXh7eKZqdpO2LGEgz3P0HSgLknLGqn+asJn+CHcrPI=;
 b=GOy1+dHOX2CTU8c2+J2HbwYgG6HUwEhMWej6Rp6qNfRbIPmAemIzak5b/wXZiLV2gY
 6MOM6Y9Ww1zzQftsiDjQdWBj+QyR7KCUgVFmy9q/aTeM8ftu4l5UX+G6njHCOOG+4GOh
 N6ZiVQtSQ9BQZzZCcWfi+TLw4KEdr465PrRrBcY17pP6Z4XWHlQgRSZeBjCpBwq/hUFs
 m7WtRnfDN+FoQRneWiuwFKMBaz9Zq2hprzuctuqpBCUpdTHvYVsfN5vT7wwbRYSHYYgp
 YRIFbZuvV2x4HWUcStlge1lpjwEqr4gfFR1SfST5h/ym9G4kNk6kFzlUwjAWlMZ6ZQ/c
 uhsg==
X-Gm-Message-State: APjAAAUSH+nU4PoyU9jT59AD/O18qK8WRX1H6LtURYOJld3aPG3tvGR+
 Auvjq6pI7cbdVht0NSA5Yr1ml9eYOeDlxTrWUnTCfA==
X-Received: by 2002:a9d:4d8a:: with SMTP id u10mr10486979otk.232.1575978529096; 
 Tue, 10 Dec 2019 03:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20191016143410.5023-1-drjones@redhat.com>
 <CAFEAcA8j8M_J8Ocdpms8a2XufigVQ6oB4JBy2BcYAkXfJX5y5A@mail.gmail.com>
 <20191206155327.7adiyjjkjh56mg2t@kamzik.brq.redhat.com>
 <596d07e933cb4da48dbba5b492e81a2438e78a2f.camel@redhat.com>
 <CAFEAcA9+G0jprsHRQp8g=Aso+2-_GhoWkDGx4WWxoC88maOKEg@mail.gmail.com>
 <20191210110531.psjzlikir2ep2omo@kamzik.brq.redhat.com>
In-Reply-To: <20191210110531.psjzlikir2ep2omo@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Dec 2019 11:48:38 +0000
Message-ID: <CAFEAcA_M61hTzU=qCiUbR4V9Mnwd0phFNqTJG9pCWKreVmjy6A@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust
 virtual time
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: bijan.mottahedeh@oracle.com, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TrHET/4dLlVi

On Tue, 10 Dec 2019 at 11:05, Andrew Jones <drjones@redhat.com> wrote:
> x86 developers could easily add this feature if/when they need a way to
> disable their current default behavior. But, since the kvm-adjvtime
> default would likely be 'on' for them, then they'd probably prefer the
> feature be named kvm-no-adjvtime, and default 'off'. Should we try to
> anticipate what x86 might want when naming this feature? IMO, we should
> not, especially because I'm doubtful that x86 will ever want to implement
> it. Also, what about the other KVM capable architectures? Which defaults
> do they have now? And do we expect them to want to expose a switch to the
> user to change it?

My perspective here is mostly that I don't really understand
the ins and outs of KVM and in particular handling of
time in VMs, beyond knowing that it's complicated. So I
prefer approaches that push back to "do everything the same
for all architectures rather than having something that's
arm-specific", because then things get more review from
the larger mass of non-arm KVM/QEMU developers. Arm-specific
switches/interfaces/designs just make arm more of a
special-snowflake. I don't really have a basis to be able
to review the patchset beyond those general biases.

thanks
-- PMM
