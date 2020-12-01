Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp255626lfb;
        Tue, 1 Dec 2020 07:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkj0qx/SHC2B6yP9nYTSKWKW92UcGGKx3f4kezJTtqPt4QKoLl37BE6f/S41hq4fvRzo6t
X-Received: by 2002:a25:d305:: with SMTP id e5mr5000090ybf.358.1606836202913;
        Tue, 01 Dec 2020 07:23:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606836202; cv=none;
        d=google.com; s=arc-20160816;
        b=e6qR9u/A0HNCrAqgWo54rNZcIHctJ/lXNlpSt7up4r/MdJ5IK5+R2ZkONeAndFMuUM
         +MwegedGeiLE3TxX3SLK3YedNEk3FQCZCamuuTnBITjkZImxL09YDaVBYQvL/Sfe6HTS
         LCKoIFQPkbKIA59VF0BPOvSuall1+83VVR8Zp6JFSevXYLF+ATK4d5dWfI+r3zafpBkl
         hWSyjJnKT1aVB72JXUCd3HBsUvpz630AmXTl0x5Nab1fsFIsjUno9Tzo29iqA4RhGFYR
         SUQqCfVWxCXeKdgFz6iQpmvIF7nqUxhP2UnEiE3waYgxC3mK2VP7J1uTHG04Nb2eZgkW
         vg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kn5Jkuqs9nQxhHPFBkhSnlGGjc44mW+fTIcqVI9sqEA=;
        b=FmI7gtjmMPZOkYGIKwOWHSFmMpf6n9KsyiwgZLxiY7aRR/Eqj9hLuFcFmrIx3v4AhA
         MvFTnrkceDl/o6El2YMUYb0fxa9WMv2W1i/JnKJS3bnD7GwaMVAH+1fmDFMqo4psr2rS
         h1DeeE2BsdhjLGQtikyxEtva1sPRXBJKOz+p55xI5oDdBe4GYAarqUSh7+0Z3njY8Lr6
         2DRPF8XpuA8YJzXY8Y9JmfVyamY2PRu5U4kc2orEhZh5CO51OIPo1+9kXwuTOEfIlvUj
         rIayeiOT49bWgrGc3Ajo7vrWuLQY1Z4lwbBTGD8HVMw9d1Xg8SjFAynkB4i2w6yFCoVj
         OxFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YXH7qpTs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25si101936ybj.21.2020.12.01.07.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 07:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YXH7qpTs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk7Uw-0000MP-9q
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 10:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk7Ug-0000H8-4Q
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:23:06 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk7Ud-0004TF-AN
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 10:23:05 -0500
Received: by mail-ej1-x644.google.com with SMTP id f23so4930771ejk.2
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 07:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kn5Jkuqs9nQxhHPFBkhSnlGGjc44mW+fTIcqVI9sqEA=;
 b=YXH7qpTsUkZBweRjCv6ishi+ePlovPKXC1ufDbxMnLCykq+eBznMg9v6aBMc1Knlbc
 XNIOD7CZgzUa7LpoD9H6XBtV8kZPPLN9cu0ZO4tNE4oLxVP0EuFP+HvAPVdKFeJQJiIY
 6lpFGoYwTtYIGTbglz4wwScE/KwIJcA9qFFfcVwWs3YR2nmEy90Npp8G9KT2cXqofRsP
 8HVPjIKMknSfO63rsDPqmqAoXUx3wFXied59Rg0Omem2QA46tyItadDtTrYViq3fu1f2
 k/uNpDUqwIIwL3ndfRbvaPwnIugZaq9BZ5aiLNuqOUUeMgUWjHDyLb9M0IM5gJikwaES
 e2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kn5Jkuqs9nQxhHPFBkhSnlGGjc44mW+fTIcqVI9sqEA=;
 b=EYB8DdKS1Q3n4MZnDXtfghbx1/7Af5aQpbAgHOggN1rIn1BoCTNF/aNEZP6G/tsUh3
 pkvjtUSfuHoFlbgpiPsFU7waurdn06jqe+Z75v7seJmh3YFZBFA7NTauX3MwlDY73ymL
 t1/Se7vCsOEC/BL/ODH5AcvDlZwowrimpWGaDpYQZ7qitM4BcTBYXqHf1YQZeI2LJYOQ
 y3Sqko275FsuO1xl3+g7kOePO88MPhbT7cylw+X+JT9CNgs+LOPHaXvhLkx4YvDgJX9k
 nWWLwlSd6A+yH95/GNSxgL72dsXwEwrpnMq4FoFIwP2bIs+mmc3IKO6I9vcJdbf1A3Ja
 T4RA==
X-Gm-Message-State: AOAM531akIPm2ICa4L/AXvIaAVQg1MwiJXatRsfq0SzflT1c1FjtA/KA
 +o+qPK5oSSErdFrRgy9oyntawLAFs4CpSWoJmvhxlw==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr3230670ejr.482.1606836180969; 
 Tue, 01 Dec 2020 07:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-22-peter.maydell@linaro.org>
 <3c036611-358c-a824-2a27-841b8ba8d897@linaro.org>
In-Reply-To: <3c036611-358c-a824-2a27-841b8ba8d897@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 15:22:49 +0000
Message-ID: <CAFEAcA_VhkospGJ1MDcn2_or_ErM+mOSNrwvYc6uHrUXGoLQUQ@mail.gmail.com>
Subject: Re: [PATCH v2 21/28] hw/intc/armv7m_nvic: Correct handling of
 CCR.BFHFNMIGN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CflU9qpr+OZx

On Tue, 1 Dec 2020 at 15:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/19/20 3:56 PM, Peter Maydell wrote:
> > +        } else {
> > +            /* BFHFNMIGN is RAZ/WI from NS if AIRCR.BFHFNMINS is 0 */
> > +            if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
> > +                value &= ~R_V7M_CCR_BFHFNMIGN_MASK;
> > +            }
>
> This isn't WI, as you're zeroing the bit not preserving it.
> I think you need to merge the current state of the bit to preserve the value
> for secure state.

Oops, yes.

thanks
-- PMM
