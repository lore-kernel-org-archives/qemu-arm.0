Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp397357lfg;
        Tue, 17 Aug 2021 03:47:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB4OFZLpoNm/fvdSlG50GkElUgiFojc6mXrwuPV0FkHio2mwQdiqzkcI+FM/Df/SPDlD6/
X-Received: by 2002:a37:58b:: with SMTP id 133mr3121179qkf.146.1629197256763;
        Tue, 17 Aug 2021 03:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629197256; cv=none;
        d=google.com; s=arc-20160816;
        b=zxHZwYRM8xWdEo6r/3G4Dd1lfDfKPCsr1JFi4UshnweGOSPjX2XEz4LCzeTa3l3CUN
         OqI2So8LaNHl6PH7EehbFXABorpo8ydac8QHqR/tZ/uElB58KDCvsScwoprSbYKaR9NG
         2oXqoQS1z9o0RwRiMAE5adCCIw98ugMvLYQahdXQSlHrxteHrlQW2nJuV2NvfYYkvr02
         o5EPhSQcjrS5sD+wrT0RXxJs9y/P9ZsSU5OlR97O2wN3M3NaFmqGxgOHDnwqY8zoA3US
         3fPxN9KXV4gF5mlJl3Xdzr4ZhA1LNg92AdHd55Pl2Gxu9CCN9Dm/EoaLjUWbJuaQEN7F
         oMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lCmMLF1B5PMUUlvFw+laXWpCMvWq314GNcH272VKiYk=;
        b=sdJld/Ov/DGXnvvKcbj9uvvHjVAmB6xMuglfeQY7IjLmtXyZubCFZ34/nCCkI8R7cc
         9SP9SoSRFMphX48k8LzMXV2g5bpoTxG78G27NR5WqJD1Dcxwn2/SxEwiL9n0496/oHni
         TS4Ym0nWLEGQUB/6C/7oTk6RFtl7BtHhEQ3heGo/gtYiKyBXgsIkuQLvcHxG+aLPAcf1
         koqzF8tnrgVmx/4P9zPN3EYJ+sNDVMap2GPDZuW82uCvHU1W33WsozumVTyPjubN8XHM
         Nfg07pdP+3VoMOKPEcYwi15TD+EaSYJ0JjyZOtSfYy3GLtJGjQbnSeR5y7ifF7NLUbTw
         ZFwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JrsTkG6+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j190si1405032qkd.372.2021.08.17.03.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 03:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JrsTkG6+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFwd6-00031K-3b
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 06:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFwcn-00030h-0S
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 06:47:17 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFwck-0000Yn-I2
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 06:47:16 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bt14so21931099ejb.3
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 03:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lCmMLF1B5PMUUlvFw+laXWpCMvWq314GNcH272VKiYk=;
 b=JrsTkG6+Vup36vTJfULoFdrxd8HQ6sPWq4cU8L9Pcz71eREwtLwF8+UBiDjUOZkyD3
 anWCBU2+6lmVaGedsa7G5K/LFXlsSmyfFLvpjSv53pwBKmkHERYxF4iRkLLTcZrytoBW
 liYl7mQwMdGoXmITuCEe+9aZ5muTxwdtFTMyjlEob+AgknGfb04HYbShxWkmfPmrzYYr
 CVXAJeEd50VGsbC5tVyMtG2sPU/6YuErT0+fa6HRT16jWGdUr6F0I0NsW1A5/SFaCGtU
 sOZlh10wd87Q610JUytFLii8DM8uAFlggTawlkbBoHJy2WjsLkuV9rkV7W27bldZMdGY
 pjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lCmMLF1B5PMUUlvFw+laXWpCMvWq314GNcH272VKiYk=;
 b=Mvut64FKF8YnSTbpDcfp9HO9qZrauo+HARWreEmyLVQjDaZwKv6ERBDfBW8QbVYNWT
 QYljDxUsR5/7q1F5eUEJ4FPoArfBaBD/dsfyodRkHq2lZeSfmH/ShZ9Tyn9XgnA1c9H3
 UGexCuQq1pqs5wLDte7Wuttp3T8t0MO68GDa/+5a/JuVOgswiCNsEJBbK+AOhjL/RISc
 caQUJ93ajUzvn6oFJMEQG9QWN8YiFK9HX32PASARxBO0Q/yf0IBNAWFXnzYj40ALcFok
 azgHEkKTecU6WHWxmBwgD9oQ3iuKb1asXZO3vxK3+57dVrDeGRYtx33+SIuof42e1SMW
 /8bw==
X-Gm-Message-State: AOAM533lDmYFtq//4rILhb5JX6Oj2zR3HpQpjrzw63MNOSUoYXgkwMjg
 eb/oR1d+r2Fdj86srFFQgk6RAslBj5PJigVQj5zEnQ==
X-Received: by 2002:a17:907:1048:: with SMTP id
 oy8mr3205778ejb.382.1629197231874; 
 Tue, 17 Aug 2021 03:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <37605028-f1c7-93d7-ce51-dc78f4ed8d8b@greensocs.com>
In-Reply-To: <37605028-f1c7-93d7-ce51-dc78f4ed8d8b@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Aug 2021 11:46:25 +0100
Message-ID: <CAFEAcA9eU8h586eiK9dy_Jy7aDaeQzLC901SYf68FCi_LC+6GA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O0ou5a7xBNET

On Tue, 17 Aug 2021 at 10:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 8/12/21 11:33 AM, Peter Maydell wrote:

> > +void clock_set_mul_div(Clock *clk, uint32_t multiplier, uint32_t divider)
> > +{
> > +    assert(divider != 0);
> > +
> > +    clk->multiplier = multiplier;
> > +    clk->divider = divider;
> > +}
> > +
> >  static void clock_initfn(Object *obj)
> >  {
> >      Clock *clk = CLOCK(obj);
> >
> > +    clk->multiplier = 1;
> > +    clk->divider = 1;
> > +
> >      QLIST_INIT(&clk->children);
> >  }
> >
> >
>
> Regarding migration, you made the vmstate_muldiv subsection optional. I
> suppose it is to keep backward migration working in case of simple
> mul=1,div=1 clocks.

Yes -- we only send the subsection if the mul,div are
something other than 1,1; an inbound migration stream without
the subsection then means "use 1,1".

> Do we need to ensure multiplier and divider fields are set to 1 upon
> receiving a state if the vmstate_muldiv subsection is absent ? I
> remember there are post_load() tricks to achieve that.

I was relying on "we set the default in clock_initfn()" (by analogy
with being able to assume that fields in device state are at their
reset values when an inbound migration happens, so if the migration
doesn't set them then they stay at those reset values). But
thinking about it a bit more I think you're right and we do have to
have a pre_load function to set them to 1. Otherwise we would get
wrong the case where a board/SoC/device sets a clock up on reset
to have a non-1 multiplier, and then later the guest programs it to
be 1, and then we migrate like that. (That is, the mul/div at point
of migration will be the value-on-reset as set by the device etc
code that created the clock, which might be different from what
clock_initfn() set it to.)

So we need to add something like

static int clock_pre_load(void *opaque)
{
    Clock *clk = opaque;
    /*
     * The initial out-of-reset settings of the Clock might have been
     * configured by the device to be different from what we set
     * in clock_initfn(), so we must here set the default values to
     * be used if they are not in the inbound migration state.
     */
    clk->multiplier = 1;
    clk->divider = 1;
}

thanks
-- PMM
