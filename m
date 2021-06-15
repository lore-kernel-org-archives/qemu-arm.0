Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp3181597lff;
        Tue, 15 Jun 2021 10:51:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqK7LZbHSiZV2LaCPVKcrBEaFLtqldpXUAjBRA2KgH8wwUjLF2FOC+RwvD9q50jSqTVKwM
X-Received: by 2002:a17:906:670c:: with SMTP id a12mr787216ejp.249.1623779505116;
        Tue, 15 Jun 2021 10:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623779505; cv=none;
        d=google.com; s=arc-20160816;
        b=xHrhzR0Ga7F3IQhDdq5pjHY+PDQY4ZTjxxiIVOn5nchEXVdBSC9+F8kh81tWN3IYnW
         +h+6mxjcRGlBVz/26JlDBAOvr3BzqmtzVn6sfHgAUXx2I2iWzcJR+fQK/xaOIEBqcrkr
         HtaOnDKBlqUGmMAnB1t3fZonRCGvtenvNm4R4x5hDUh5M0QFhKIFK8SYWdENvfs5L+JG
         aChcsYc/ipmVTeaehNoEUtW6Hd9Kms95oAjSG0SVJuWfOgO3dLhcojOI09+el9TtEG7B
         IK1CYvmnKhya/vBs3nP3QOB4fhBJEaH7sYHV8/6T00vCaYqLXfY5SEeCJkKWzvS8Q9wr
         fjtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=el11CozE8yeNVNCbwDjL1qnzArid1d8P695r3nmjEas=;
        b=a9b9fFzup2t7H0/agJRTP5H/ufBaq5/KT8KNSmwXfPmzhvPn24m/vdxYa06JoUNhyi
         TcY5bIr1B+/BRwbot7o6ITGzGJjKUtAfdW9Fo01e8vccnSNsPxgEE5UsX3zQr3GEE7/J
         Vno2Jre0eTXjmOzrarlFPbkZtRmu6Ca+GjEbKrwRsRwTHu+mbBpHvOL58x0sWfHWadkx
         QgjeWSYnpZ0DbNqfc8Uvv7HJVnGo7Z6hbnZUNGdinUC8k96EMJKCex9gIkGWKeEFLOGm
         pREjHGO2l6EqtmSlttlPRhq4P1YT1gGKDnQiBA0YbXP+mM93wNRmnK2h3L7r9Uzzz3GJ
         nQCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=OjFOjkxk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t26si15237182edq.83.2021.06.15.10.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 10:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=OjFOjkxk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltDE0-0007Ir-98
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 13:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ltDDr-0007IT-5e
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 13:51:35 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ltDDp-0001fp-Gg
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 13:51:34 -0400
Received: by mail-qk1-x730.google.com with SMTP id f70so27683507qke.13
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=el11CozE8yeNVNCbwDjL1qnzArid1d8P695r3nmjEas=;
 b=OjFOjkxk87hwxQQwc3FAIcAuKCJHU3BsJDg3hB/wKmO3KXzJ8tPrLEVFKhJinEdspJ
 6AwgiWiaOq5wtRfXu6FytD3owplD9BvHuhHgwp/xPDsrQfcnSzxoLe+e3VryGmZspU2K
 TemUyYiz5uecuBomJWdj4Mraz5bT2r/jfpw7BNLxeshyfbtxF4U3uJoTY17NiCk1I/Ph
 P+wcanh7XHOcZ2giLsC4PbaPXlPDw2eFcr5cVlrd0jj2kHExGoIXIGH6KSm8JSjyufMN
 z1UQ6WtDbunWYEyeVp2gEWfUQhmjhSsG5DGQkkSDNaStuy+UjHTfssIWGI48aHlkgNxg
 D7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=el11CozE8yeNVNCbwDjL1qnzArid1d8P695r3nmjEas=;
 b=ZwnE5D2xYciFEuv7VolENanNsG/3fJ7qJ//cr78TUXjBvzpoQB7WHw5+HMNjP9aFDD
 lK4RQryjOG0CCB5MuFiVXZASjl1kacoY81fBG+oZqfgsczgMLaWY6ww0q7qfAvjkZYQZ
 MPCFGUOlnaz5Il1NvHOoS9ZFxL9DWeYoBEYksVR5SDm7/zuoY9lRywwbSFtTxtYsqrn0
 qsO1iDJghjbVR4RbKxgutHQYl3UFgsHEwLcrJVuQrThthTIL5oUKc924LdY7yvD3e0l0
 WY/LPCrG5LTUEe3CGBrEh0NEAHchsAtVMiLuS/rflXoL2YGq/nRU/fHA/IDxykzaf3s3
 hLTw==
X-Gm-Message-State: AOAM532xQanPlv5MZdH5FtSoWahj+hXtBAwKONuwFmO09ixa5FAybhvN
 HMcBln68qoMvS4KHjFZC6vS+YvE/vx4tJecn+aa2FQ==
X-Received: by 2002:a05:620a:2058:: with SMTP id
 d24mr875162qka.472.1623779489963; 
 Tue, 15 Jun 2021 10:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
 <CAFEAcA_gbkwwZw36UuA5VC3dTn345bxcHGBiJrnunytrphq7Jg@mail.gmail.com>
In-Reply-To: <CAFEAcA_gbkwwZw36UuA5VC3dTn345bxcHGBiJrnunytrphq7Jg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 15 Jun 2021 10:51:18 -0700
Message-ID: <CAO=notxMQVaDykBrcseHQyZfC-m9NTkfdYLPdXZi8mpruJ-eZA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=venture@google.com; helo=mail-qk1-x730.google.com
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
X-TUID: B5MKmNlv6YeZ

On Tue, Jun 15, 2021 at 8:46 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 8 Jun 2021 at 20:36, Patrick Venture <venture@google.com> wrote:
> >
> > This is a board supported by OpenBmc.
> >
> > v2:
> > - Fixed missing hyphen in Cortex name and dropped TODO on hardware
> > strap value.
> >
> > Patrick Venture (2):
> >   hw/arm: add quanta-gbs-bmc machine
> >   hw/arm: quanta-gbs-bmc add i2c comments
>
> Forgot to ask for this earlier, but could you send a followup
> patch that adds documentation for this new machine to
> docs/system/arm/nuvoton.rst please ?

Yeah, I'll try to get that this week.
Patrick

>
> thanks
> -- PMM
