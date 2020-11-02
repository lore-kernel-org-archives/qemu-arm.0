Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3842312lfa;
        Mon, 2 Nov 2020 03:28:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXe4FGhbwsHhMcma8dkyN+tL0iB4EOxTzha2Zs3YUwTyqxV8d357MU0fZmXzo1KRDAraqe
X-Received: by 2002:a05:620a:a14:: with SMTP id i20mr1980349qka.215.1604316511900;
        Mon, 02 Nov 2020 03:28:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604316511; cv=none;
        d=google.com; s=arc-20160816;
        b=O2OUsFZCcnVTEcsR7RKk0DtKNb7DmF0wqiBdxQVhM0w8VkPIiRZvBwb44n5S+Stme5
         pP6gR0DiAbm3AogrjRYTFhKTxJGRfhxRiLGP+7tEkKLoFKuZUZusH7gQoVDMjTFQSkYJ
         JXYzevaFOJ6M5ewoFeok5xEjN76ZFglnOoH7ilWVO3Fi9cfeNA1e4NkL1v+pHK5RDnCG
         6J0aAle7exxK3c5pg4n0f0Bhyaw1IVmy/sdgQGHD6yvBZorPIGx73+MBZ83oVbaGhsEM
         c/wR7tIUxAPw19JMXNN/Y4ZjpY4vaYZ+TwehSo6eryOu0bti4luzvyAVvn1pJe+48RxG
         NFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ds2wWP284UEUKBYpqtN2b4m+SfiFSXhhPK+Nj+v/mE4=;
        b=we9QJPHhLqNk/rhcIsYrfpvDrTnJrRZnCmP9GGEFyn2Y9+NWztq2CssGwA3R5hBZhp
         Znz+JnVhBWLLgaoKdKWxLiDcSMO35TodTBISPq11zZsLmAi2WABxIrAredLUn/d5aUxJ
         byuDTdck7UNvasijoBfmuaf/yq8e/ifW2q1AH98pg05d6UaCsH+1Xn4HXNR9rcwBNtHv
         i26DmQdcKAyofLzitVhrhkMH7zl1vta17j1HVhvaAT8TD6tXFicrcfIUSu0X1E86ncw+
         H1Kuai1O9873x/AlL2J8LwpsqlC7ZrHHNn/Mzomhw10EU6fS/ER8KbUqMimApfvLM/ZP
         Dxwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GbHWu/J+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb13si9387491qvb.82.2020.11.02.03.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:28:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GbHWu/J+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZY0l-0007n5-Ab
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZY0A-0007kz-M3
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 06:27:54 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZY08-0000qu-T2
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 06:27:54 -0500
Received: by mail-ej1-x641.google.com with SMTP id gn41so1099711ejc.4
 for <qemu-devel@nongnu.org>; Mon, 02 Nov 2020 03:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ds2wWP284UEUKBYpqtN2b4m+SfiFSXhhPK+Nj+v/mE4=;
 b=GbHWu/J+dY04Kr7KQqY1qUokza+KRnBAu05Y4DINxDSF3eXeeDoWgpFrZGoWG2nE/Y
 oStP9vOOASSnPWXVxBYj0QAh7StTvyUN/bBdysnAzjcOzDnBIFSzPNc7cIOlfPWCOd8y
 aLKbMZdGswCTvrPa++IfLZV78kK2vbeX5tifMtLczlQtrj8ZW3g/Z6sarDHnuuXLr+4x
 VV+qzbo4X2pLW5FpnVpUyOA2MWkRITBagkkPuWZIHPCMS3SVAoMm0s75FwPTFBUzxxiI
 srAPl1q/fCAc/4VafAihdUYOWpatUK+Yu4LEnZUomrq8Irr5oUb6x+uqjCNADwH/6edu
 EzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ds2wWP284UEUKBYpqtN2b4m+SfiFSXhhPK+Nj+v/mE4=;
 b=eG9mq339QmfAWzl+Pb4F4/UyRXm3YXfw/5/30VKEIUz9cvjV0QZC1PxxXH4UvFkhCb
 b67P5eThhnb34dp4YVwXJk1C+ggC8boERaRyHypidAGdV+q+2MCRG7Y0E/h0ohmLQ3UH
 3mrfA82TfCfhQsmDwcoOjEgk4n233wPyu3KG+epzVnW4txpPXIVHAyPXlWK9PUUJQVhQ
 rlz5tdOhvR3aJqSQq3/4Np9FsMOris3Mfe7IpzgJap0aPPWeuYVLWHtBCLlVLwcQj7cf
 8/DinRGHIDx5GTJM1jHHwKsV7vOAP5CFA8Ek3DjFoEbhR65VE7Ra5L4TCRbkpsGNN5gh
 7rFw==
X-Gm-Message-State: AOAM5338LGod7jZ4CfbcA3pq6Wp/9T9diIpRIfkjvjCMemM54B21u2fQ
 H2MXq+nJUfUsIXb/IrbiN1GGFKqbwCYSouDH5Dnf9Q==
X-Received: by 2002:a17:906:3a97:: with SMTP id
 y23mr14853270ejd.250.1604316471367; 
 Mon, 02 Nov 2020 03:27:51 -0800 (PST)
MIME-Version: 1.0
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-1-remi.denis.courmont@huawei.com>
 <CAFEAcA9xhfhGToCXk9H+M5=HQKC91o-ED6eWTy32nvjwpFeJOg@mail.gmail.com>
In-Reply-To: <CAFEAcA9xhfhGToCXk9H+M5=HQKC91o-ED6eWTy32nvjwpFeJOg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 11:27:40 +0000
Message-ID: <CAFEAcA8xrk1Yd3GbkYRMjBwGjZ-f7bSp4gHGGk=tkhKNk5CqRQ@mail.gmail.com>
Subject: Re: [PATCH 01/14] target/arm: add arm_is_el2_enabled() helper
To: remi.denis.courmont@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CP86ZbBtbHnQ

On Mon, 2 Nov 2020 at 11:06, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Mon, 2 Nov 2020 at 10:58, <remi.denis.courmont@huawei.com> wrote:
> >
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >
> > This checks if EL2 is enabled (meaning EL2 registers take effects) in
> > the current security context.
> >
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com=
>
> > ---
> >  target/arm/cpu.h | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index c18a916766..aaf3671806 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -2040,6 +2040,15 @@ static inline bool arm_is_secure(CPUARMState *en=
v)
> >      return arm_is_secure_below_el3(env);
> >  }
> >
> > +/* Return true if the current security state has AArch64 EL2 or AArch3=
2 Hyp */
> > +static inline bool arm_is_el2_enabled(CPUARMState *env)
> > +{
> > +    if (arm_feature(env, ARM_FEATURE_EL2)) {
> > +        return !arm_is_secure_below_el3(env);
> > +    }
> > +    return false;
>
> You could usefully add a comment mentioning the EL2Enabled()
> pseudocode and that we'll need to adjust this if we implement
> Secure EL2 in future.

I replied to this before the cover letter explaining what the
series is doing arrived in my inbox, so the second part of
my suggestion would be a bit pointless. The first part
(mentioning the name of the pseudocode function) still
seems worth doing.

thanks
-- PMM
