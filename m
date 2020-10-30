Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1654905lfa;
        Fri, 30 Oct 2020 08:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFbTVVMM5EhDKlpbCqVc+FJwCq0yEQ7NOm+m51atO6c1I6JvnaSy3lnbfT+NwtHGe9AFWx
X-Received: by 2002:ac8:2c21:: with SMTP id d30mr2712599qta.156.1604072641277;
        Fri, 30 Oct 2020 08:44:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604072641; cv=none;
        d=google.com; s=arc-20160816;
        b=A5T2VeamPncEjisPeegMP6f7cXynREA/Gqvlm5pS5b/2vTef9GZCAd+nHWSR4Zqx4X
         uGfQvgy8WRmSCmcJd/Rr/aYETn/MrG2lIMDSTYGxKbqJAToDGyvMxYVeLhslyA9in3s4
         ALq9P36oy+BIB56JdtT2CZ7j9WodpK5OMTBKYVGWYfWu7cRzLcsyKyDyWxyesS4BFf3h
         siPeJ8s0mZAwhRGJKutZI6rsDB+0j4XbE2xJ/58LPQ9ZMAx4iANh+bL65IpBvkwUmm9L
         TR/ywEOCcnTv7+5RlzXbSRXUs0OCQ+MhS1v6AA2XELElNqg6ar0D34K8ORTc5k1aRqel
         03lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ie4q/AZ9xU5WHtB60yeUPPVLsiUe10Ly8FqHCFyuUbE=;
        b=Di3CBW3Un+paVYq0LEc30pua//z7hm/f0Q6HwesX3foYfes2JtenWv1zU7A2VG3pmO
         +2T7D2nUQzfOqQaVZgk3OO2Je0WT7Vv+Vrw6lPf5Yn38fIYKIYdig/mvINCv8yiGFjeK
         +w+i9Hqc+gRcAjyQhu32h0Fxz1WtQV6s+nIDxQGn75io7nH7h/Lv52lJpWRNgXDp9ROz
         +35cIg8bvaUTomUFaEnMSFxiukAfI/LmCA96h3Ivgjz83LUkq7eP6IDxddM2S6DsnLg/
         u6Meep0UkDFwey90Tzbeu44bCpO/km1uWjqeDNDCcae1pUfZyZVQBpOxgnYmtI2fEUAa
         KIxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=ZeHiA9xu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si3643356qtu.259.2020.10.30.08.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 08:44:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=ZeHiA9xu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYWZM-00067M-MC
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 11:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kYWZ7-00064e-P5
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 11:43:45 -0400
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942]:42842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kYWZ4-0002US-GB
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 11:43:45 -0400
Received: by mail-ua1-x942.google.com with SMTP id f15so1842774uaq.9
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ie4q/AZ9xU5WHtB60yeUPPVLsiUe10Ly8FqHCFyuUbE=;
 b=ZeHiA9xuCRLjr0yZICr9NyhWdm1UDnSgajjLltADsIvH6GOQKVlTvcFVYzD8wllwM5
 MnUDCaeqJ0MN+1Or4Pz570UWBRAnJx5FnDGEEfTR4RG76vOPVmiYWoFyBe+gTUg/c2f8
 PTJNfegAKia9MSSHxeo2f36ukIptT0LRZ04kB+pzKOSEJi/Elq2EVqqDx09K0W8Lhf2U
 zj8+bksriKtuOQkhXHcK0HGPzG82nIZEf63WCHfewkka9Lgy/4nmuQR75sgonxfuy8XU
 ef/ALYLoc2CCEUvty3aNjaYku6WVj9yFRyuRlvSbX7fTlQkdHakHw14dO+KSMcXMWf/j
 OamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ie4q/AZ9xU5WHtB60yeUPPVLsiUe10Ly8FqHCFyuUbE=;
 b=XFOoIlPFBcJ3qd+n6YQj4CSSqYTZO4jWi8aseE52D8GnnkufL0SqWqChMApVtzUoYO
 odEXs3Eyg2gosd/Z8Kj7fRZl+MUgnvZIqOVrGE7os/L0IxO1F4HZbTQ8nxZrjrbcldYR
 6UJqBrvFsdsdMpy0n2cEk9qU2Q/QhszZJhAk9trRKTQL9A6vgEDxYYPL1/bnbTYMcLzM
 0V/ZgVVfuyKuVJBIk8nePcgWK8PP12AlJm2XhXHP9ro1W0pwK+EyBEzG3iHpzxrX+PjB
 qcFUm5niqWh/ajG0X18Z554y/3oLpE/MFmHmzvNM1AjNBtc3gd79lHfYIbgTRsGGAWuD
 XXIA==
X-Gm-Message-State: AOAM532oEqBEINYL21wYMn5Gu2nhwAGIoooomcAQzFnvqzDnZB84zT65
 s7Of9xeeGVquhrDIwlsz7XelJrthxsbCVTrSAb/H+A==
X-Received: by 2002:ab0:8b:: with SMTP id 11mr1930000uaj.15.1604072620640;
 Fri, 30 Oct 2020 08:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201023210637.351238-1-hskinnemoen@google.com>
 <20201023210637.351238-5-hskinnemoen@google.com>
 <CAFEAcA_w5j47qz+L02H10UbmyxwD4sxHPu8h2mAinME08Mjkqw@mail.gmail.com>
In-Reply-To: <CAFEAcA_w5j47qz+L02H10UbmyxwD4sxHPu8h2mAinME08Mjkqw@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 30 Oct 2020 08:43:29 -0700
Message-ID: <CAFQmdRaWBfRXJptN2xiT6x4_9GGEKivR5CGLkWtiX0vb1AYusQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] hw/misc: Add npcm7xx random number generator
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 Patrick Venture <venture@google.com>, Hao Wu <wuhaotsh@google.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::942;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x942.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2rS4X+oPoG96

On Fri, Oct 30, 2020 at 6:34 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 23 Oct 2020 at 22:06, Havard Skinnemoen <hskinnemoen@google.com> wrote:
> >
> > The RNG module returns a byte of randomness when the Data Valid bit is
> > set.
> >
> > This implementation ignores the prescaler setting, and loads a new value
> > into RNGD every time RNGCS is read while the RNG is enabled and random
> > data is available.
> >
> > A qtest featuring some simple randomness tests is included.
> >
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>
> I've just seen some intermittent failures on the rng tests
> in this patch:
>
> PASS 1 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/enable_disable
> PASS 2 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/rosel
> **
> ERROR:../../tests/qtest/npcm7xx_rng-test.c:190:test_continuous_monobit:
> assertion failed (calc_monobit_p(buf, sizeof(buf)) > 0.01):
> (0.00800994233 > 0.01)
>
> (on OSX)
>
> and (on x86-64 Linux):
>
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/home/petmay01/li
> naro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-arm tests/qtest/npcm7xx_rng-test --tap
> -k
> PASS 1 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/enable_disable
> PASS 2 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/rosel
> PASS 3 qtest-arm/npcm7xx_rng-test /arm/npcm7xx_rng/continuous/monobit
> **
> ERROR:../../tests/qtest/npcm7xx_rng-test.c:211:test_continuous_runs:
> assertion failed (calc_runs_p(buf.l, sizeof(buf) * BITS_PER_BYTE) >
> 0.01): (0.00198053202 > 0.01)
>
>
> Are these just "we got a bit unlucky in the values we got from
> the RNG" ?

Yes, it looks like the randomness is a little low.

> If so, we probably need to disable these tests from the set
> that we run in "make check" -- we can't really have "there's
> a non-zero chance that the test fails" tests in our CI loop...

Agree. Is there a way to disable the test by default, or should I send
a patch to remove it?

Havard
