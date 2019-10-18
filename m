Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1021181wrm;
        Fri, 18 Oct 2019 07:51:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxr6vr2zolySKkvYV+6n1cVq/NYg1fTcJONB8QOQ7YiXZHJRs3+ldSJM7wyFvYtzHeot6Cy
X-Received: by 2002:a50:955e:: with SMTP id v30mr10046285eda.221.1571410305758;
        Fri, 18 Oct 2019 07:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571410305; cv=none;
        d=google.com; s=arc-20160816;
        b=Lo/MdbSCzWWjhBd4pXpjdmlljSMN/9NcQKLL8oPQe2zamMqZfysXgqLXf5HGLlGk+Q
         Xp+HMKh2WhDYougKBVX1AE1Wxs658MOcKIxcdYI7yhDPBv7x/Y5I/vVS7oOISlH1upkt
         renLZiwdbcai21bHuwy9rWXgKHwNyAdE1iZ6G4ri1XPPAv+27sWDRyNVUBgWez8bfwPu
         ODcDvuvZta/s+pwbGIRwmpIpS04CA/6T2+5cLQ7BTgmDvEAN/6GQWesam16eJSyAbXsR
         dMZYsqnVvKlhyAOE61Gcu6dRfOrErCvbZ10mxqbOC7Z/TE8s2Ct6rV7dY6PjwFTWb/lC
         e9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkCsWf/uuu/qdKFvNKTwUrfpKbLIs7U3HQYRpVg9+tQ=;
        b=NYh3V+0M3r6TLn6hZbgJLGqIQ7ZAO9/NlL77VrJJxcEfRVJ7HVIY4wOlyJILp//Q4x
         J96ZhIdLiiYx75m0TIGnp1HjuSzwKP9VT6w/iWjI/CtCoZijN238LGo6UmcQF52ATegg
         a/y/dEKfFtVF0GgvLTst05HTbzLguiQ/+f7ihV55OqnsL2Ht5YsG5dxtmGO6DUdxngb0
         eXeDRUCyQcQ4xbDD18BbrZ4jTDBtEzRm3OEh4a0GEyNQTo0KnOm2J3RWU4guMbcOaC0R
         AG5iB0ZRIp6LODRBjHn93LFfH53aVC2EW6YVk5rB1qPzr5BEdFghmdWHZEgE2XupJ3GV
         FCQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rZM04pFY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b21si3508572ejq.343.2019.10.18.07.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 07:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rZM04pFY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLTbU-0001f6-A4
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 10:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTZz-0000Iq-UV
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:50:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLTZy-0002ct-Lz
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:50:11 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43140)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLTZy-0002ce-FG
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:50:10 -0400
Received: by mail-oi1-x242.google.com with SMTP id t84so5397375oih.10
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lkCsWf/uuu/qdKFvNKTwUrfpKbLIs7U3HQYRpVg9+tQ=;
 b=rZM04pFYiuq2groX3GfVdEVnB04jSJNV6+w+DP8I6nkCluaf/2n+cFemCQeKR8uR4e
 0h2nxKA2dMxHOx0jVBdvMLI5HwzsSqKYvmyWL2+jZwyF3H2EGh4UnOraG4OSDOEyqvEO
 VfBbjEs6z8VHLDTT5pDOwD/GAIaWBiV8BmfFhxPmpTHZPLt8OS8AetbpiR/f8Q/gLlrg
 TbT2b9oRGbLHs59MivZkrlPmetzVj3PmstAMBzNB3UMyvn39GKX/fOzqZEC9Z/P2oSkO
 wAC+Coi0bI4vgLjFKpph6Y15jG3lhE4gm163Es/H1VSJCauXPo3BWphewOpwCv2YXyR1
 0vUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lkCsWf/uuu/qdKFvNKTwUrfpKbLIs7U3HQYRpVg9+tQ=;
 b=HE5Ss3Q+vEcDD3w9Jr8II/ZFO/tPMey5x1gWpLBTOI0msO0wcktbvqmNNg334Ly9MS
 t/4cK2et9Ki2v3fkjQ2FxSDl11ZYO5Z22BRhgzx75e7rvRatqBHNtJigsFSJXAKZIjXW
 4li5KRILUg1JuoNdxusB+XERaop9lcCba6ksmkbX87OhH5GRAm07N/NFflI6XFdCyeQo
 fM/WFC4pLdmackTjPcTtH1CJyHM6ol+lmeUGuYKHPExV43GyNfxOVXCneUd7/c+WTWLK
 wYnByq9Yw+OObIuLLkIpIqWe9Pxv4YbBpBf8ilb+9PJMRrrejCoqXqngfXBmmVUTLhSM
 kBmw==
X-Gm-Message-State: APjAAAWHIXv86Ru8wRa9+ZUKNOong9yVDIPK/0DiWjG5fVFlSvrMHJ38
 ydCyHbZqpBgE36RgH77yUu2A6vKWrE+AABMy8WDNZedlEXU=
X-Received: by 2002:a54:4e83:: with SMTP id c3mr8517084oiy.170.1571410209515; 
 Fri, 18 Oct 2019 07:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191017185110.539-1-richard.henderson@linaro.org>
 <20191017185110.539-18-richard.henderson@linaro.org>
 <CAFEAcA8h9CN_qarQdfXRonE8KYO2=s+Jh_o+LFs9qk9M20pweA@mail.gmail.com>
 <16af4176-3acd-14bf-5399-31e5bb882120@linaro.org>
In-Reply-To: <16af4176-3acd-14bf-5399-31e5bb882120@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 15:49:58 +0100
Message-ID: <CAFEAcA-Fwx8+miMAHrRT2xwA9U6v3BbSMAt3YUQCOzba3wUEVA@mail.gmail.com>
Subject: Re: [PATCH v7 17/20] target/arm: Rebuild hflags at MSR writes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jB0vOsFURll2

On Fri, 18 Oct 2019 at 15:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/18/19 5:32 AM, Peter Maydell wrote:
> > On Thu, 17 Oct 2019 at 19:51, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > Why only rebuild hflags if !ARM_CP_SUPPRESS_TB_END ?
> > For instance on the Xscale CPUs we set SUPPRESS_TB_END for the SCTLR,
> > but some of the SCTLR bits are cached in hflags, right? Do we somehow
> > arrange to rebuild the hflags when the TB does eventually end ?
>
> No, we don't.  I assumed that all registers which change TB flags would in fact
> end the TB.
>
> Why did we suppress tb end for Xscale?

The comment in helper.c explains:
            /* Normally we would always end the TB on an SCTLR write, but Linux
             * arch/arm/mach-pxa/sleep.S expects two instructions following
             * an MMU enable to execute from cache.  Imitate this behaviour.
             */

This refers to an older version of the kernel code than the current one:
https://elixir.bootlin.com/linux/v2.6.11/source/arch/arm/mach-pxa/sleep.S#L166
which assumed that the two insns after the SCTLR write that enables
the MMU run from cache and so don't need to actually be accessible
via the addresses that the pre-MMU-enable code runs from.
This bit of kernel magic eventually went away with commit 4f5ad99bb5331c57
(kernel v2.6.39) which converted the PXA to use the generic suspend/resume
support, which presumably handles the enable-the-MMU transition in a more
sensible fashion where the address it's executing from is valid
both before and after the MMU is enabled.

thanks
-- PMM
