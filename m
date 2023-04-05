Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp72502ejb;
        Tue, 4 Apr 2023 19:31:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350b+aQMeIMpqpmdjsDdlC/v+XyC3lZKRSDIB5g6X3qn4yXg57YgUUcnsrgCxGSITTO1w0uQS
X-Received: by 2002:a05:622a:24e:b0:3e3:7d6d:f5 with SMTP id c14-20020a05622a024e00b003e37d6d00f5mr2733008qtx.29.1680661891746;
        Tue, 04 Apr 2023 19:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680661891; cv=none;
        d=google.com; s=arc-20160816;
        b=dcQy9PQM2wciHpOm/7z9zMPgDJ4sdGT8Rizh7DifZJ+DF4VMfC4hXmEUP9vy8oWW26
         FPJChFWFNOv8nRGho5O5LGYBJuJpfh0Hwl47UL+bjAcgewx4NEXj8i3ZCIxInVERGUQG
         7MUyQbJdYEF2ZDEf+NNFK1yOHqKdgVw5xwveN/CTBFNO+5MZ3w9RsdKA9mNASoZbH/zb
         nxP1P38KlIZvyy2tmoHfxuesHa0hdh6s1G7qmw/IZkkzF0UKPjYVHK23uDWOUIxRqkLV
         +/m7pDPcvxGiR7lwoTOOKokitGZObF04aPSAj8rmLkmjHkQai/MTAt8Vp+v8AhkLBcxP
         S9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jnP57dC8rylB2761bWqyuNL0r4Jsti2x2iE31vPHG2U=;
        b=S15h7N0ZMORUoU2w6+oAvnM0FUrfOdd7enheU0JO8IGYJcdy+j8Nm890D6cgWHwwfd
         v33suHmLeWm1jLIVoLGxhVceQ2yOGpLEf7zGSx4qlNe583OfOiFAY3BLUr3zNdYFfiqQ
         IsnE+D8YP8iEbZ7FOwx3qRwioRv7wBDXZH/vX4du2dhrCtbIwY/a/BzXFkOzm62Nq65Z
         x+dtXuTqpNXk/ESBqbOtIsZ8lhhPHzXOYL9ND996lWcFn9E3eTISRUOtNFLxbwIyCIlE
         KCfzQnZHf3M0Y8NpqqVlgRnpYr5mpTgvkjgnz44TbJ1eYLLpbPr8ge7gktDX/Uywbkxp
         eMpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=W6aRPiwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020a05622a105500b003e0ad3c2bd3si8684879qte.304.2023.04.04.19.31.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Apr 2023 19:31:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=W6aRPiwp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjsvO-0005sY-2G; Tue, 04 Apr 2023 22:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pjsvL-0005rO-C7; Tue, 04 Apr 2023 22:30:59 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1pjsvI-0002rP-Fs; Tue, 04 Apr 2023 22:30:59 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-93071b2952bso12181566b.3; 
 Tue, 04 Apr 2023 19:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1680661853;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jnP57dC8rylB2761bWqyuNL0r4Jsti2x2iE31vPHG2U=;
 b=W6aRPiwpDjHHuqf52E5wfQWXwaHas0VACvNM2cacMLwC1U9hY50EjDdRuusUxCaPaA
 TUnIG0mT4GJKx3yn8X7JciMWutfoTRItooBvQUgYO4yA2ZMLXIZtIcubtAgfJELFolUP
 ICS69/C2tBErilkyOlnNREPWEP9S2Tp8QBoQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680661853;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jnP57dC8rylB2761bWqyuNL0r4Jsti2x2iE31vPHG2U=;
 b=enQxxuT87ZEIFXLGp2MMvAAcQ24wsNSyyLafpp4V1E4lvw5bVJRABfska0QhaasRkl
 gP9JqGggvgJ1pDG4pr+Sn6sm+3lOJTLsWYfinily1zyKqaPd1rtoTf5tkGfcM1PuZw13
 Y6MHWrUS4FzzknVxxmKYbmn8CKMMvgWj4KR0OpkqLfv1Excl/QyfDndTPwrOmwAvcT9B
 mpYgm/xA5p63Ya5111SGlgKsnPYku+A0JI9tnRR1lCQldG38kohtjNZlfGscMqHtVhTH
 ZhTsuDejHinHjv10yQWdLfF3B/m9CKejYCcZUYSA9h1Tj2zgDzb+HkQZrdTH1vEQCijA
 CUaA==
X-Gm-Message-State: AAQBX9f9mtzfccsDr9m1k8dWpQywkY9HNIa3KdutgWfr3nJvDSvEojHQ
 Ua200HhyU86ti3eiJ0qmD82FDHm0ZF82dulJF/g=
X-Received: by 2002:a50:874e:0:b0:4fb:7e7a:ebf1 with SMTP id
 14-20020a50874e000000b004fb7e7aebf1mr318318edv.6.1680661852826; Tue, 04 Apr
 2023 19:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
 <20230401172825.tvmfms6qbh3tmi5s@hetzy.fluff.org>
 <74148c47-8232-02d3-2c37-d12c1fe156e2@kaod.org>
 <50b19eb8929da77f150c34585f805345e460daed.camel@codeconstruct.com.au>
 <CAGDLtxv3z69dmDMpA=7dk8ADHwTaMPT-a3BceTvyidXk66+8oA@mail.gmail.com>
 <0f44daa680719e06071e3a56c61fff18f3918139.camel@codeconstruct.com.au>
In-Reply-To: <0f44daa680719e06071e3a56c61fff18f3918139.camel@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 5 Apr 2023 02:30:40 +0000
Message-ID: <CACPK8XfdPhYdsg6T3Ux2++3ogXi_0ZJSMrqZu_mQwAEKh7TBZA@mail.gmail.com>
Subject: Re: [PATCH 00/16] i3c: aspeed: Add I3C support
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Joe Komlodi <komlodi@google.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Ben Dooks <qemu@fluff.org>, qemu-devel@nongnu.org, venture@google.com, 
 peter.maydell@linaro.org, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Troy Lee <troy_lee@aspeedtech.com>, Graeme Gregory <quic_ggregory@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c6x5wATqEZZ2

On Wed, 5 Apr 2023 at 02:07, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joe,
>
> > > > Jeremy, how different is it ? Could we introduce properties or sub
> > > > classes, to support both.
> > >
> > > The differences (at least from the view of the current Linux driver
> > > implementation) are very minor; unless we want to be errata-compatible,
> > > you could use the dw driver directly, plus the ast2600-specific global
> > > register space.
> > >
> >
> > This is my understanding as well from an outside look.
> > From a QEMU standpoint I could split off the dwc portion into a
> > dwc_i3c model, which the aspeed_i3c portion inherits from. I can do
> > that in a v2 if that sounds good with everyone.
>
> I'm not a qemu maintainer, but for the record: I'm fine with the current
> approach. I don't have access to any of the non-aspeed dw documentation,
> so verifying what should go into the dw model vs. what is
> ast2600-specific has been a bit tricky.
>
> If someone needs a non-aspeed dw model, and has a bit of documentation
> about the underlying dw hardware, it should be easy enough to split back
> out. Maybe just make sure any "known" divergences - like the IBI PEC
> behaviour - are well commented.
>
> That said, if you're keen to do the split dw+aspeed models, that's also
> good :)

I think the split makes sense. It will help other platforms who have
the designware part add it to their system in the future.

Joe, when you send out the patches again please be sure to use
get_maintianers.pl to send it to the appropriate reviewers. Thanks for
sharing your work!

Cheers,

Joel
