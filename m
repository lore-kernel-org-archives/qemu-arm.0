Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1221611lfq;
        Thu, 17 Dec 2020 04:18:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPodXfULnhKfkVypETos5BEbvNlmOlDJjFLGSOQGfGLbiGgtgG/zlRuyNCP4clGkAzDduI
X-Received: by 2002:a25:5202:: with SMTP id g2mr54115989ybb.311.1608207529116;
        Thu, 17 Dec 2020 04:18:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608207529; cv=none;
        d=google.com; s=arc-20160816;
        b=LcC3/yoYVHH0oLf9dxba608/6H5zl+aJMfCTgtt0koPTADiPAYXKSLNxHUBBHkpjNP
         X7A+LIHZ5QbGohyJLc5AHcDfl63u1pCZHUsLTviPkETRZRrbiyvoJX4bMARkz470yLGf
         4MaiKlxTurePgCqve8YvsVS5qFmujZGxPPcrVNoz5hlZfGJnyGgjOws7UPh69UGt4+jo
         qtQDhGRgtM/uQfqZLRkdBC6i77oNdoYhfIUh5/jXI6ZJSt5Gc23TGiAI2JV51yI7v2xX
         NJ+4PfwVqFMJ28kS0asb3JpbRhB6/JFNPgNP1sYamLMMSPFT/svOImID5xmNz+CPGBPG
         2nWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dRes++RHSuulpLSSqHAJiowTAkwOvnlorGrTKEWYAZ0=;
        b=QSvzhrMv4lTdKg7rN5FbxMJI2ASWhxKIgdEJcWw/LYIueQ4W9H0qExwFmS7OI08417
         WijnY+JA3ttO7h7XI+CgiUK1VDmS0azuNsRD0uk4zjzrvlKMVw+RjHLf/VxF1KZTKcGR
         gH7ZG2hZEm3eM1JCMOaNV6X1TjQ2fPID6bOiG6qpmThcpXNP+VRoGYujiIFC01ZbNcRs
         n56i5/q4HHw4OSQl7XOKC6CwyeF47heFT6xiEh2tDN9P7jah6BNYWFjQvUfbaTCBskny
         4VbuuNIGIxg0jMoHKGeVHM15zfqSORu6pM505PkUU7sRzo7Hd4YfPwBj+8BDCvYkPqiF
         AV2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jvFMcwVl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si4370820ybc.259.2020.12.17.04.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Dec 2020 04:18:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jvFMcwVl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpsF6-0008KD-EQ
	for alex.bennee@linaro.org; Thu, 17 Dec 2020 07:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kpsEp-0008Jy-5E; Thu, 17 Dec 2020 07:18:31 -0500
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1kpsEY-0003bG-5r; Thu, 17 Dec 2020 07:18:30 -0500
Received: by mail-il1-x12d.google.com with SMTP id q5so5039451ilc.10;
 Thu, 17 Dec 2020 04:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dRes++RHSuulpLSSqHAJiowTAkwOvnlorGrTKEWYAZ0=;
 b=jvFMcwVlSObq3RApq++RRFnT64l/3US9kjPYYiLlOj3EK0G6PzHT2ge4ZVn79PP6RI
 wBgJRKEfdXCcIVjIvroQ3UygTT88JeKw+3vzFKP7N12WLZecjkH25xZV5Aqi4nJG2uUR
 0V1CP5hyq0lW7SoooHV6KTMu02gUtYVJOjf2vrzRWx7y/ucnzu28Hf3OM7fPTmkeVOHF
 oLHxutWHS+C2h/9CwzqBM4WVXMlF8apcAi55DeVO0hHVyGvBHFjNN/akbB8+N6Ao9YUd
 YETdzy9YIP4mslk/0GHEmiK8pEDAViRoUJSH3UMuOpQiR1x8jGroxTHvRj/2tRtIgvK8
 KW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dRes++RHSuulpLSSqHAJiowTAkwOvnlorGrTKEWYAZ0=;
 b=PfxsTwT6CqNMlrnjFT55XuNvxo9ZlGKlxYWJOWwGc/Unb/9HegnRbDi5WjP0UDsKet
 E5VP1GVBeH1LOYXDogcndJVa9lHgJ1ZQP5K/bBcG26qzw7JCIbhfCkbftyUC5XidifHX
 aYcPbOyvjDHWz8G4jttj57GdRYUBN6XuDxs/QFa3F2DT3BdbF2LY48EfZdUmacVupSJ8
 upQRkAnQ3EM3qSTnxmza1OOlXUHSZkAa4N74XaaKfwmwoF5+WKNxHTy3KLU9nL0vn9VM
 VfUfkwCSVLCAZE6VY2CI7qKvLxs1vOdtbzemmivylcP9aX0mVnHT7onMbWiOabt2u9TN
 4MNQ==
X-Gm-Message-State: AOAM530Pao+vrqyeMfNmVlw+CcaO4JDD3RoAQG+0XMP5dDBYRCwFQogN
 Gx1BVg4jp24kRQO/K1tlAkC6xZzwkU1JHi08w+o=
X-Received: by 2002:a92:c052:: with SMTP id o18mr50534081ilf.245.1608207492620; 
 Thu, 17 Dec 2020 04:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20201215114828.18076-1-leif@nuviainc.com>
 <20201215114828.18076-4-leif@nuviainc.com>
 <CABoDooPXUC585huW0-1Md1WTAO0AwhKvOe20FioU=SbOJ+FdkA@mail.gmail.com>
 <20201215164904.GY1664@vanye>
 <CABoDooO==m2SiE+6t6idGjMsM71d1C0=_BBNJBriBkgg+eAXDQ@mail.gmail.com>
 <20201217121031.GK1664@vanye>
In-Reply-To: <20201217121031.GK1664@vanye>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Thu, 17 Dec 2020 13:18:03 +0100
Message-ID: <CABoDooP_uW-w5JaMXmo6AzUomFp5BuSS27zn6x3hu1VKbNbEVA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] target/arm: add descriptions of CLIDR_EL1,
 CCSIDR_EL1, CTR_EL0 to cpu.h
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5ts1zfNDaOS0

On Thu, Dec 17, 2020 at 1:10 PM Leif Lindholm <leif@nuviainc.com> wrote:
[...]
> > > > > +FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > > > > +FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 21)
> > > > > +FIELD(CCSIDR_EL1, NUMSETS, 32, 24)
> > > >
> > > > The positions and sizes of the ASSOCIATIVITY and NUMSETS CCSIDR fields
> > > > depend on whether the ARMv8.3-CCIDX extension is implemented or not.
> > > > If we really want to define the fields this way, we perhaps should
> > > > define two sets.  Or at the very least, add a comment stating this
> > > > definition is for ARMv8.3-CCIDX.
> > >
> > > Urgh, sorry for this.
> > > I added the fields only to make the CPU definition more readable, so I
> > > think we don't need to worry about runtime handling of this?
> > > But I don't think it makes sense to add only the one form.
> > > Should I use CCIDX_CCSIDR_EL1 for these ones and add
> > >
> > > /* When FEAT_CCIDX is not implemented */
> > > FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> > > FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
> > > FIELD(CCSIDR_EL1, NUMSETS, 13, 15)
> > >
> > > with a comment that
> > > /* When FEAT_CCIDX is implemented */
> > > for the former set
> > > ?
> >
> > Having both would be handy, but you need to have different names for
> > the fields.
>
> Different names for the same field?
> I.e.
> FIELD(CCIDX_CCSIDR_EL1, LINESIZE, 0, 3)
> would need a different name for LINESIZE than
> FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
> ?

I was thinking about changing the field names, not the register name
because the register is the same, only the layout changes.  So
LINESIZE -> CCIDX_LINESIZE, etc.

That's personal preference, Peter might have a different one.

Thanks,

Laurent
