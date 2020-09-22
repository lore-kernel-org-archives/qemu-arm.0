Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5244903lfq;
        Tue, 22 Sep 2020 13:47:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLXPYLrXzbKznLhNQM/9JYdFRLmfOm//1Jzgqx1PD3rLVhax7RmnPYIx1qdfEYISHI08Ys
X-Received: by 2002:a25:2481:: with SMTP id k123mr9567245ybk.139.1600807626321;
        Tue, 22 Sep 2020 13:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600807626; cv=none;
        d=google.com; s=arc-20160816;
        b=FvJIaak5lgYgeUZ4T9uzDS6IupwgDMV/3K9JJlTkaK5lB0nAb6C1mCcRWctt6OupG9
         BCKrKt/Ni8W2ASawahzoQmSTXoJNZSOH+jtpKtNvO8x4GUP1AmBFiCicOcM5i5BnONUq
         aaEoo/hvaRbUeRmLdfZxdmrB33PH6t9xghVelGY8P8S01NRoYZrQgWpQz4628SoQfmkB
         88KVixKpM0275PRJqJ3P/Oq808S8C/kZ2NIsri5rFgd0mufynuI4d8UxbGECiaRvMakG
         msVnaqMTvx6VgXxaEHoGMPmKuKpK9qGdbbOkZuWW703yshBCEfok3/jOjMLJFBEr65ff
         b9mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=masqaAXJYbIMuhR9jhcknVf69byHp6IRGu795aYnFjs=;
        b=TqqF8/4PtxnJKqv5XXDLy99aznJoQ6+jUYjs5uXsh3or96JyOFn6525ubfiuxUZs3O
         PVan+XLbWy4KbZFoMemO4TKK+fSufBaqdqqtwFQrcCiJ08wfCzz5LUbCvtF/Z0ZosWSx
         PoibuWUqiyIQ8KwRwbhqgL3DMcr1AGPVFfcga80DRUlrJ8BDKCKuMVW9IyVZaEjj4JGe
         lkX10EKJdlrDe4HsjyNIMHMlH6r4TDZiA+OryPX+J7ETVsx1hCMfS6+BY0G2PyNi6iTP
         OKCjOXwPRlH2ZOuWeXCUSuVYrP6bJnb6aK8y+ZW9YJ5jU3FqmoHqbF830qyaGbCrU2RP
         TlmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q3bXDr1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k134si16601014ybk.215.2020.09.22.13.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Sep 2020 13:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q3bXDr1Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKpBp-0005QL-Ni
	for alex.bennee@linaro.org; Tue, 22 Sep 2020 16:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1kKpBP-0005QA-Gj
 for qemu-arm@nongnu.org; Tue, 22 Sep 2020 16:46:39 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:32815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josemartins90@gmail.com>)
 id 1kKpBN-0002uq-Kg
 for qemu-arm@nongnu.org; Tue, 22 Sep 2020 16:46:39 -0400
Received: by mail-il1-x135.google.com with SMTP id y2so7979054ila.0
 for <qemu-arm@nongnu.org>; Tue, 22 Sep 2020 13:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=masqaAXJYbIMuhR9jhcknVf69byHp6IRGu795aYnFjs=;
 b=Q3bXDr1QnCFCEjDbgBd0t/GX4LndG+jy0x4xCWofXiTNZgVs6l8doCsvhYzxVx78t4
 O+78HLuWKm9zbPCXGeDK5DTstf233xDoFG9TMAFZOHDQFc5xP5VubOOkFNZc27qnypDa
 RDIBWkRmFESguVJ3FF8XJum2cGc9PETJhClo3Cm3NP+Q4vXp+08uEzbI5p/4Zis4w9+8
 lsime3MsSWGPGB6vMpeFxAQJPCKLAb6LYpIjethfkODK9PWJZqUb5uWRCxLVBRpRxCL0
 tNg4HDTLwAS5GvgKoNHMvDSkhNy9mOHy/rDSCsv7K8EuJe4NujAzwtNK0woCyWfQWUBM
 5cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=masqaAXJYbIMuhR9jhcknVf69byHp6IRGu795aYnFjs=;
 b=NjKNTD7tqhD90Ca3Y2ZrYISGR1k1lf4OAKuNILwLiAMIVdXswJuEMCOC2PkvSf2sRE
 qiJYuUsZTtokmz6zOAAJ6D2B1/qnri8tY4caT42yoGBJ88mFXBBpSsyU+XVEOZUQUY+R
 dJzx6gjTh4NLozRGf9e98Jj/1hDRdlhfcaT0XiZ2zbsgzRqC6ZDAULX4e3wAoTF5OoC9
 OdVFj51ld/yJ/siSsochtKIPX8sXAC1Yz9QL1Dpe6LdXQIdH+k1yS6CrajEyoUYK+dUx
 PRPWmZPFXXJWQN9QIuTqB3w688I5U1mMxDbweB16DjSeIYH/+KcwGV3kU8y8WRuxkgVY
 W/Ng==
X-Gm-Message-State: AOAM531YNeEXAW+FByDjoru9gPUYRzxkTsahaWqPeGAvMNsO3YAGom2v
 h4FCeYhz/9BGtuaM04bhM2WR4qxl0xE2WqohH5c=
X-Received: by 2002:a05:6e02:8e2:: with SMTP id
 n2mr2653510ilt.289.1600807595945; 
 Tue, 22 Sep 2020 13:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
 <CAFEAcA-gMfOntN=up20vjF00Mbf0MOeWyTWufmcZ9E=AKKYWEw@mail.gmail.com>
In-Reply-To: <CAFEAcA-gMfOntN=up20vjF00Mbf0MOeWyTWufmcZ9E=AKKYWEw@mail.gmail.com>
From: Jose Martins <josemartins90@gmail.com>
Date: Tue, 22 Sep 2020 21:46:24 +0100
Message-ID: <CAC41xo0mWv4LoHbzvxkq+vhw=kn8iyi2vhgZhv4vxODmJcnngQ@mail.gmail.com>
Subject: Re: gicv3 maintenance interrupt not triggering
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=josemartins90@gmail.com; helo=mail-il1-x135.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YjKPtrvHWfPM

Hey Peter, thank you for the prompt response.

In reverse order:

> (You don't say what QEMU version you're using or what command line
> you use to start QEMU -- those are both always useful information
> for "I'm trying to do something with QEMU and it's not working"
> queries...)

I've compiled QEMU 5.1.0 which I configured using: ./configure
--target-list=aarch64-softmmu
This is how invoke QEMU: qemu-system-aarch64 -nographic -M
virt,secure=on,virtualization=on,gic-version=3 -cpu cortex-a53 -smp 4
-m 4G -bios systemimage.bin

> Given the MISR and HCR values you quote I would also check that
> you've set up the maintenance interrupt itself correctly, ie that
> it isn't disabled or similar such that the GIC asserts it but
> nothing happens.

If that was the case, the pending bit in the gicr.ispendr0 would still
be set, but it would just not raise the irq line to the cpu.
Nevertheless, I know the interrupt is correctly setup because if I set
it pending by writing to gicr.ispendr0, the interrupt is triggered and
the final handler executes.

> You might like to (a) enable some or all the QEMU gicv3 trace events to
> see if they provide any insight into what the emulated GIC is doing when
> your guest prods it, and/or (b) run QEMU under a debugger and look at what
> it is doing in gicv3_cpuif_virt_update() (and in particular when it
> calls maintenance_interrupt_state()) to see what it thinks it
> is setting the maintenance interrupt line to.

I'll try to dig deeper tomorrow. But just now doing some basic printf
debugging, I've noticed that cs->maintenance_irq is NULL which results
in the call to qemu_set_irq returning without calling the
irq->handler.

Thanks,
Jose
