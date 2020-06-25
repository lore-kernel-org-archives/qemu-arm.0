Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1496571lfm;
        Thu, 25 Jun 2020 10:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyVnDblGhFoRl6co0NqehSDlO8OO8VKzzGztIdrAXkH4G6U3z/XFC2Z42aihOcKA+cb7mB
X-Received: by 2002:a25:df0b:: with SMTP id w11mr56561039ybg.449.1593104995060;
        Thu, 25 Jun 2020 10:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593104995; cv=none;
        d=google.com; s=arc-20160816;
        b=HpqYnE/dk0Yi0MSuW+4CcWk1+5nDVn7I3m0Gn9brMK9U4DBMPWndtg+2l13zHSUBwH
         CdLJmhjdj2Mz+wcBPRN5mSRu2txqTJHtpRdIEbjhVvoVwFTvmb4JcjNTcW4JpdfswkF8
         UI6Y4MciBaIRCTWhpIWwJN4w50vci2HixbdlayrdKP4U3e97OaG2bKNlUgLoO5Hl/9Fa
         R0WroGLlvIMMx0M6mHo2CJvYb/yVLoN06GnnlqLM6RrV/r9NkZTG0PxONOieR84spR/q
         lKfxhAZ7Bd/z5m90j/CRNBbEsi3YzqU7wPEVanPo35Oe+GwfCNBYGneMxKFfNoASJNRY
         dFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VCtLKjHDdYEXKPaRNYd1QCINSZ6kmh4o8EMfO046g/Q=;
        b=R7Wp8NUHO1Gclg9fsCL7oFdgVTiOzPP+jTmD8pHnyrhi1Kl2e2/bPjlJwgiL1RPcXW
         4/eauzEcpFupjHNwlKSSVuZ5SME4wDT5rQFeE0XHaWZa14ZuEcJOWxnTEXeJt/kOOLnH
         DqIln/pSrEBk6jQoy3g5Tn4qnXaY0H+YMg7xbjdP+ryu8Loc6XWdGFKVyJIDJEgWEI6i
         7HjycOsRPXOR5t7pH4yx/9YIK+1BdR0f0XQtOua+qsV3PhTXwwwgZUrkfrcpitCo1uPG
         L6whlgzR+SEX9S/vl9SgBoDdcbehE15AVIUmPTbWGMUr1Ttqd0lAYmDFZU28+0Rkp5wS
         K8NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vrM/RykY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m128si25226608ybc.425.2020.06.25.10.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 10:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="vrM/RykY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joVNq-0005DM-Gf
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 13:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joVNf-0005Cu-TX
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 13:09:44 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joVNd-0003f1-8d
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 13:09:43 -0400
Received: by mail-oi1-x241.google.com with SMTP id w10so2110177oih.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCtLKjHDdYEXKPaRNYd1QCINSZ6kmh4o8EMfO046g/Q=;
 b=vrM/RykYT5oBdHbi6tF+ifhoZv2OxITIgVJueoVhbJ7XsV3/y6rnOfdd85NNwMsY4K
 /h6w1PQOxypOMmPcS2jENmRYnZE/1HGgUUy+oFg2340iMaWOzJh8giZZVObwOeVdzDTc
 TzH4CcuCjHjZJFWlrdVl5VGYB8OcsZtXb0D6abx6FI457Nv8YWwwpZIA09sABH7ga0e6
 PzJFYoPyP2Y0PTTZMg21rj5d8uKXjm7QcFc9kXh04DwRwTXnUYGFVRyez4usWJlkDoxf
 NlXynPD63SuWChx/MhDarwrpC119ALIBvMxRcSYs4fpWGS/4vFsntgS2tci5Cwd4qu28
 Bbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCtLKjHDdYEXKPaRNYd1QCINSZ6kmh4o8EMfO046g/Q=;
 b=DC3wCbDYsyTnsh2ZSBaCoOwllqJeH2KmDfiQrQ3D2gbqK4/jWNAqtwOasoti1bHQ9O
 knVbXi4ogNozMNTAZfVJAM3EO5x1/gfA2zqpqwOCtKIyyzXXHCjmtE+2teJ96xKBMIcg
 VpLpYflHt/Pk/UkvTWZg5TTmfVA9I2rOIwXAqZUs+1ryUG4q3Q+KTF4SukO2YVCgOXF/
 /GNxnAxcO44SPoXHEw0h4VRbLQNjPpZ9WiSHhxDt0SNZO8V+k8irG9abSlsJXPMiJ1Zz
 +wk+2p2Ka327LAfriGKYKK06yno54b3yLrt/wNevOa6vfN1TsBjnK5oHick9m5pUbKgl
 gbxw==
X-Gm-Message-State: AOAM532Jj76z+pycxI3pt8OPfTJLN1O/XICF54oQKHGjxB6t0UYr7O2V
 DsysjHqfL4QXo4qc4jTCZRTWMcZyqWdlBBdpb0agwg==
X-Received: by 2002:a54:4694:: with SMTP id k20mr3018771oic.146.1593104980015; 
 Thu, 25 Jun 2020 10:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200623193658.623279-1-richard.henderson@linaro.org>
 <20200623193658.623279-45-richard.henderson@linaro.org>
 <CAFEAcA_svDHEDP5g3aaEL6_b-8hy0AB8oRBWj=y6G1K_r6E9nQ@mail.gmail.com>
 <f15d6bf6-03ef-70fe-2f40-0665d49b0851@linaro.org>
In-Reply-To: <f15d6bf6-03ef-70fe-2f40-0665d49b0851@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 18:09:28 +0100
Message-ID: <CAFEAcA_qOznfoAWtXGh-85C86fSft5ccSKQKv_uVw6-9bD4Oag@mail.gmail.com>
Subject: Re: [PATCH v8 44/45] target/arm: Add allocation tag storage for
 system mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Spickett <david.spickett@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BxgWLys1o3RM

On Thu, 25 Jun 2020 at 18:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/25/20 6:03 AM, Peter Maydell wrote:
> > On Tue, 23 Jun 2020 at 20:38, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Look up the physical address for the given virtual address,
> >> convert that to a tag physical address, and finally return
> >> the host address that backs it.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>  target/arm/mte_helper.c | 126 ++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 126 insertions(+)
> >>
> >
> >> +    /* If not normal memory, there is no tag storage: access unchecked. */
> >> +    if (unlikely(flags & TLB_MMIO)) {
> >
> > Comment says we're checking a memory attribute, but the code
> > is checking for TLB_MMIO, which isn't the same thing.
>
> Comment is not trying to allude to Normal vs Device, but "ram" vs "mmio" in the
> qemu sense.

Oh, I see: maybe "if not backed by host RAM, then" ? I tend to
assume "normal memory" means "Normal memory" :-)

thanks
-- PMM
