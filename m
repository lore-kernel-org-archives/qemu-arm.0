Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4865162lfb;
        Tue, 27 Apr 2021 08:02:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcK7UEsuyBc0eJUXn6jO1N3djZqX4suMUsMOdzgXJgqab+2DYIrj8nudqW/pcitIL28zYT
X-Received: by 2002:a05:6402:1115:: with SMTP id u21mr4857303edv.383.1619535759586;
        Tue, 27 Apr 2021 08:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619535759; cv=none;
        d=google.com; s=arc-20160816;
        b=mQ6ARspZyEpGIfY245Nrl36pwFbolzcd6CPDVWTnAmp/IcG1OIE1EocKMnO8BzojGk
         RtU+Kf7teIA1NPrQ7Cb7IwMG0EW1nLkpzYDZ/Y460DydMlsdagmwr58gzD23elHqpvq3
         Thl3xYf4n4vcfEg2RT9XJXNmr6HwBF5Nix0raLSmGX1h/sGwPK5mcvtGkvowzgP8ELJO
         p5jVMjt3QYIIyh7+FDWUGqZEPdR5CG8qgNFyGg3dkMebyWjw68tqC38u+EbNAtq8PMdd
         Wo/TRveFEzYXxsBvn+6fwAYorD7o2e1rqzMcltAI2xXPK8N2MSuKzN4a6HvUoyZyBpFm
         kdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oJrVBDHex5YpvXWAveYMDCFlbK1GPSpZNZ8ojedwoQM=;
        b=JOGct9wfASGpgWvHptFy2Wrs29nrNa9Yy4v0LyBGWi+IZRl+NrdH93iXArOYRQBCe7
         LMjsrq8Si8kYr6RYxBeDAFNgn46LDH+/ntL8tVm1QUhTxPTUS0pF623+X19oFA0JrVDJ
         Lc9uFYwtoFOxfSAttQMb1JGOxbiZ6q5qJz81cpdScT+eDr6oEOHX6cMDgRWorTleRnDn
         Q1221cNbzin/sdxqAlQoiYcjXlr/uCtRxBUniwXMbYGn0qTyVXpvu9tSUv2ruzg09r74
         eF6r0j/CMXG/fxJ5DklJjk5M1vQvSiYFTvOhRayqUAUKESVcaLKTdrMJVSLFw2B1HbPp
         KHHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ih0sLAuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2si84503ejj.541.2021.04.27.08.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 08:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ih0sLAuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbPEU-0005Dh-GE
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 11:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbPE6-0005BE-ML
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 11:02:14 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbPE3-0006f9-7s
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 11:02:14 -0400
Received: by mail-ej1-x635.google.com with SMTP id r12so89955754ejr.5
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oJrVBDHex5YpvXWAveYMDCFlbK1GPSpZNZ8ojedwoQM=;
 b=Ih0sLAuk3aCX4v0aXRbtWJRmi/Rn0Dh4oLHnikYDU1utC/i21JdHsqlN/O4DBvXj+M
 c56CwuECdr7sBiLpvQrm/Py+KoSjL1M768uujqsTdio648HjM2zc1d87mpSGh3hWWAKM
 MiNsAvTx7AshxiLQBD0rBCO4PLkTBq7RRDYXehnueIl1F2vJilshJ05lNU/r0CpVEfod
 1wsmaXkBZOKJpc5cihthp8fretFaScDIgWErlN0LH0tW6wePbnACx8Uufb+6j98tyoHn
 N8QSMqYy5HXdl+0PJ4XX6ILfB/4MR21hrekzoYj9cRy9DX7X3fTt10f5tbAtIEYhtXmO
 +aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oJrVBDHex5YpvXWAveYMDCFlbK1GPSpZNZ8ojedwoQM=;
 b=GKSNSyzQBVn7XWPdtj8zylEPINjdW9+JdXnd42mF4M2zB83uDeLYkuzMrFkgYduupX
 iFGRKrNFx/TvzTPnpjK4yyVKQThKIu2PnI83R0Cm9hOBqqYcr8jPxX4EjSMgJxoo7ouM
 D9GbLpxG9lb+QhqAzf03aoGxkUlfOPYg+RGl4ny1Td0Dc3uPWvA7CHyGEgEjW2DOZzyS
 z8YLnWcw2d4Nh+sErFy1oMwtlhl4dddclcRIORvv5EMOlLJyTP8FuuPQNZVaz0R4Bdqz
 rOu0GnZOq/P+/RMHIPVEsf4PBsUV9FHHhL1UIILHeyAV1eyuzu4afUgvJ22GvSOnZtpw
 zI0A==
X-Gm-Message-State: AOAM531ZxlytfRiNhwsjYNkzOEC6pQmLF0kLKZ7iq9A5pX9USuN3rUjs
 i49pCvznqj1d/9OhFwkY24SBvBiRgW4xiITuIitOmg==
X-Received: by 2002:a17:906:93f7:: with SMTP id
 yl23mr22769482ejb.407.1619535729876; 
 Tue, 27 Apr 2021 08:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
 <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
 <20210427144819.fiecdpdgre7tznvq@gator.home>
 <CAFEAcA_hvxAmodWKdEUQH4as4vMuaDVGDK7C6KeZ3-TBbPxEFA@mail.gmail.com>
In-Reply-To: <CAFEAcA_hvxAmodWKdEUQH4as4vMuaDVGDK7C6KeZ3-TBbPxEFA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 16:01:10 +0100
Message-ID: <CAFEAcA9CoW7JSdF6mT3gJOterYDAFQrYd5Czt0rZOpogTewNNg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jI+hH5MkcyAJ

On Tue, 27 Apr 2021 at 15:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Apr 2021 at 15:48, Andrew Jones <drjones@redhat.com> wrote:
>
> > Since these types of features seem to blur the line between being a CPU
> > and board property, then I think I'd prefer we call them CPU properties,
> > as they come from the CPU manual.
>
> Conversely, I prefer to call them board properties, because that's
> the way it works in hardware: the hardware board has the necessary
> support for the system-level feature, and part of that is that it
> has an SoC or CPU which has been configured to have the properties
> that are needed for the board to support the feature. Having a CPU
> that nominally supports a feature is useless if the system as a whole
> doesn't handle it.

...this also means that we're consistent between boards: some board
models unconditionally have support for a feature (and always set it
on the CPU, GIC, etc), some don't ever support the feature (and always
disable it), and a few offer the user the choice. Having the user
use CPU properties suggests that they can, for instance, plug a
has-el3 CPU into any board model, which in general won't work.

-- PMM
