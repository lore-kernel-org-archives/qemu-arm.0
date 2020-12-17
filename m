Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1128822lfq;
        Thu, 17 Dec 2020 02:03:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZEJbz3Zm2cjAPxVeWZu0EEhWQa9ZOOjxEsy1geL9wBNbVgRpb2h9aMtOoDI5p3QibL398
X-Received: by 2002:a25:748a:: with SMTP id p132mr25935135ybc.268.1608199436471;
        Thu, 17 Dec 2020 02:03:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608199436; cv=none;
        d=google.com; s=arc-20160816;
        b=OGv3jHnw+aZgDxWloBRHduWucrL28xOHhxdPNFM4/sSl9qHqtXu0SQ1M56rTdK+iWH
         Bt8i2McKZ+Aqy9Yu4OesoeVhWnLKPWCN8ew9HvIzL7pPI39rx2zAIjTxGQrr9vS6dddh
         cuhIhDxkRdWQ2IerLySw3Yfusrxf00c2AVuwNC2kGbM5VfTy6nqjdbNeC/2s3cw53fsl
         pqseSg8YjFQoe4u9t4WHPwPpzl7Dx0XyWVlkInJBA53YYUJHoS4yqBgAh28Ztw1uxs/Y
         agLHAZ6c8m9hD1uzz1qj2v7PfBOuY0R5MMr9ZoqnceuKxcdBNVH/0q5oGNDWcrulErXW
         3F9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzMg1As+4geROGmYg9xh0fovFzhoiP0dQ6E6/NxxbaY=;
        b=geyicGu4d4PhPlAyDKRC+Q22qCdmWXWU3wZGM7hiIbhh1g4F1uB4QNtmX+IDJ3e+AD
         GaDl1xrDyfYovEnC5EBxZIASNGoWUqhpYvjWKa4HmnWtXKFCUX3/MuWipOEJhgoQcEBN
         ZnVx/Nhq1oOCkFFvJ5ll8eafvM0k/mD5nKAF+OCBA6EHfRGzVK8f5HAeSXvF3AJ6+eq+
         jAm9LUKOZQDrciDAsfL6D4jdv/p4JiijuSXAc+Bi5zBfCej+rBmCdS0Lwe536sTtlZxE
         LLC+20XheuIH+p3VvKdLJb2D6FzsY+mkxLeIwF62ivpKCN0z3OXEekAxio1W+eaYKpU+
         d8bA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hpmIr2OO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r9si4104994ybk.389.2020.12.17.02.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Dec 2020 02:03:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hpmIr2OO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpq8Z-0002I0-Q7
	for alex.bennee@linaro.org; Thu, 17 Dec 2020 05:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kpq7J-0001B3-IF; Thu, 17 Dec 2020 05:02:37 -0500
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:41190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kpq7G-0006Wy-AM; Thu, 17 Dec 2020 05:02:37 -0500
Received: by mail-io1-xd36.google.com with SMTP id t8so26928119iov.8;
 Thu, 17 Dec 2020 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dzMg1As+4geROGmYg9xh0fovFzhoiP0dQ6E6/NxxbaY=;
 b=hpmIr2OOlm96ZWjnQUT7pH5h0kdDs9IfpfUNDxm94F69k1wb+2U/WvVNtu7Ex/EM1s
 wPkcmHwEQtd4W962mFf6JBgUP/8bIGxCExC9tOqGW8eqvF3EDg2UTYZHcfLmP7FXijb5
 1J89TBkrvyeoe/rq2O8eA5SzxHfyZq7wRp1nUpeq9myFETUHwbkcW7A9V9X37nRVPXXO
 qvn7OxzLJ5ZzZlc24PAh7O2ReEnq+JjZYw7GUYvpYZjDvUEkOZ+1QJuuRceQf1brwLQ4
 UJO+vGNvYL9a6iK0cKBv0hAgp45k4uLE+kQPC+oq6UqsDr19cJ53Y6EqFw/gYikkn8tb
 r+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dzMg1As+4geROGmYg9xh0fovFzhoiP0dQ6E6/NxxbaY=;
 b=Ca3A5DoQd1m0hhU1jhCA84N8htpcLXIXjy1PdKLRXLZOqaBVQJUDTxxx8FFrm0KG/f
 MWd5/EqETEyT1GzHSZxZxlc/s6fI9Lv6Tz0YQqu/LVnvXbYulIi7/9QGuPfiafnLs/M1
 vk2SQcwkf5LbOJaiqP+B3vpRdwvnf+5qgK6n83bBnPNmhzhBlW19FjLjF+5GOK4665yL
 YHJqTm6c7R5xctXcj0A3SIoQ1MRL3GQ9rJckFpMckGA2iElS+U5YtAXirfhqF4nCIDzv
 7hhVXlAFAwpGe1FZzF6amosoUiEbYuRqSsOeCBAf7YLKYB1ki4aWr0Rs/ikLMt4X9TR7
 StvQ==
X-Gm-Message-State: AOAM533GofPzmyjfu/BxXsUTN1Um7aFWiwrod3aGzaJUkhmQd2sVHBNe
 9RsKefJsTGQwLWZfyJztUfznH2GJJI/uOxrSGPU=
X-Received: by 2002:a5e:9512:: with SMTP id r18mr46090123ioj.86.1608199352349; 
 Thu, 17 Dec 2020 02:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-4-leif@nuviainc.com>
 <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
 <20201215164904.GY1664@vanye>
In-Reply-To: <20201215164904.GY1664@vanye>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 17 Dec 2020 11:02:23 +0100
Message-ID: <CABoDooO==m2SiE+6t6idGjMsM71d1C0=_BBNJBriBkgg+eAXDQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mwvYJ1u/qN+u

Hi Leif,

On Tue, Dec 15, 2020 at 5:49 PM Leif Lindholm <leif@nuviainc.com> wrote:
>
> On Tue, Dec 15, 2020 at 13:23:58 +0100, Laurent Desnogues wrote:
> > Hello,
> >
> > On Tue, Dec 15, 2020 at 12:51 PM Leif Lindholm <leif@nuviainc.com> wrote:
> > >
> > > Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> > > ---
> > >  target/arm/cpu.h | 24 ++++++++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > >
> > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > index fadd1a47df..90ba707b64 100644
> > > --- a/target/arm/cpu.h
> > > +++ b/target/arm/cpu.h
> > > @@ -1736,6 +1736,30 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
> > >  /*
> > >   * System register ID fields.
> > >   */
> > > +FIELD(CLIDR_EL1, CTYPE1, 0, 3)
> > > +FIELD(CLIDR_EL1, CTYPE2, 3, 3)
> > > +FIELD(CLIDR_EL1, CTYPE3, 6, 3)
> > > +FIELD(CLIDR_EL1, CTYPE4, 9, 3)
> > > +FIELD(CLIDR_EL1, CTYPE5, 12, 3)
> > > +FIELD(CLIDR_EL1, CTYPE6, 15, 3)
> > > +FIELD(CLIDR_EL1, CTYPE7, 18, 3)
> > > +FIELD(CLIDR_EL1, LOUIS, 21, 3)
> > > +FIELD(CLIDR_EL1, LOC, 24, 3)
> > > +FIELD(CLIDR_EL1, LOUU, 27, 3)
> > > +FIELD(CLIDR_EL1, ICB, 30, 3)
> > > +
> > > +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
> > > +FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
> >
> > The positions and sizes of the ASSOCIATIVITY and NUMSETS CCSIDR fields
> > depend on whether the ARMv8.3-CCIDX extension is implemented or not.
> > If we really want to define the fields this way, we perhaps should
> > define two sets.  Or at the very least, add a comment stating this
> > definition is for ARMv8.3-CCIDX.
>
> Urgh, sorry for this.
> I added the fields only to make the CPU definition more readable, so I
> think we don't need to worry about runtime handling of this?
> But I don't think it makes sense to add only the one form.
> Should I use CCIDX_CCSIDR_EL1 for these ones and add
>
> /* When FEAT_CCIDX is not implemented */
> FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
> FIELD(CCSIDR_EL1, NUMSETS, 13, 15)
>
> with a comment that
> /* When FEAT_CCIDX is implemented */
> for the former set
> ?

Having both would be handy, but you need to have different names for
the fields.  For setting fields up in cpu{64}.c that'd be acceptable
as you know if the CPU you define has ARMv8.3-CCIDX. In the rest of
the code the use would be more complicated as you'd have to check for
ARMv8.3-CCIDX before accessing fields.  But the use of those fields
outside of cpu{64}.c would likely be extremely limited so I don't
think that's an issue.

> > > +FIELD(CTR_EL0,  IMINLINE, 0, 4)
> > > +FIELD(CTR_EL0,  L1IP, 14, 2)
> > > +FIELD(CTR_EL0,  DMINLINE, 16, 4)
> > > +FIELD(CTR_EL0,  ERG, 20, 4)
> > > +FIELD(CTR_EL0,  CWG, 24, 4)
> > > +FIELD(CTR_EL0,  IDC, 28, 1)
> > > +FIELD(CTR_EL0,  DIC, 29, 1)
> >
> > There's a missing field:  TminLine which starts at bit 32.
>
> Ack, oops.
>
> > If
> > implemented, that would require to make ctr a 64-bit integer.
>
> As far as I can tell, this will be safe with existing code - should I
> fold in a patch extending the register?

IMHO it'd be better to extend ctr to 64-bit.  But I'm not sure of the
implications in the rest of the code.

Thanks,

Laurent

> Regards,
>
> Leif
>
> > Thanks,
> >
> > Laurent
> >
> > > +
> > >  FIELD(MIDR_EL1, REVISION, 0, 4)
> > >  FIELD(MIDR_EL1, PARTNUM, 4, 12)
> > >  FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
> > > --
> > > 2.20.1
> > >
> > >
