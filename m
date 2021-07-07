Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2682598lfk;
        Tue, 6 Jul 2021 19:03:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww350lSQSqdxTfJxpIo/c1iD9/utlJnM2bqNApOXGxb7POmyIEHdKGvrRXWQ7t3MxZ5+es
X-Received: by 2002:a05:6102:2131:: with SMTP id f17mr242724vsg.1.1625623390042;
        Tue, 06 Jul 2021 19:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625623390; cv=none;
        d=google.com; s=arc-20160816;
        b=A2D/0J94+vSJ5ZIQ/4HI6rDhqgfYFDdS6i64Ew6RUgWoPxDBl81dhoUZu1ObEaTd4H
         Ob5ke8B/vdvDTkHZ3xROhT5o35gY8t5b6rLWjtIDXuCFl1I8Gu89jh5MUIlm3CeJNs5+
         1+vot0rYJqlOsj3qHAwaoAB+BYL3J2yd3RoMMMRuE5+F6kO5eDlv/6FXTJOkPkJfPZEh
         fxZ5hdkKjmN/oz90rjbFYw1Fzxzm7mSnmjl/zOuA4QEA9lrnfYmpCpbX9NutIZIQ5LIu
         /3dIC4NGD5UcPGiEftnoyPrzTqrUI4kUTXUKYqfCUERrqOoReY3ePdwE7O1fso1t2+2B
         YUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=6PVIRHW8sa9jivo0FxuO00g+kimqLQ8lcPUrYTTykbI=;
        b=vC02j23yQ3bCNGi5keDRouTAuOwOWp3Y0ILWpjdik/AN1clErtr4wP/pftLWPsKUvg
         bRndMS56bhR4H635vEOTdekSfbGLd4xtXd6J5aT0jjTkLVtJCdhuTgzecX+yOYdK4w/F
         QFXk8IFmCYotJdDaELsh9mQFF4lIIFMvLWlIQtQRUFaUNYjYjdUsfnbt2n+oPWyWbfVj
         PPGZG5JcgWH62YiYtuYRmgA4fa1jSWvn0ZOSz6SztKK0J145mHb0V5xwdLHhIKVKG9ZU
         SGvpFkSHxUyUVlzf43hdNzms0bFcBBg1gTlMdtUruZImeZG28Cmgpm0efihoo5IvW+KH
         N6Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkmggiMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si14803520vsf.425.2021.07.06.19.03.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 19:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dkmggiMG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wu5-00004s-A6
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 22:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0wtv-0008W2-P1
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:02:59 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:41919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0wtt-0000F3-2R
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:02:59 -0400
Received: by mail-qk1-x72a.google.com with SMTP id j13so442122qka.8
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 19:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PVIRHW8sa9jivo0FxuO00g+kimqLQ8lcPUrYTTykbI=;
 b=dkmggiMGdBcAVB7W1cj0Pz64/iSFH8wZ690jECFnUd9Qi7YcGr+y89u8KNUd/Ozk2O
 PNt+pWNi78kChxSUAkq+Kv7YusggjrcnyedG8P18J7tsM8cl4LuwcZ0TuqZpEwVHu4ZN
 mXI34fdVrdbj+kiy8j84d29+F+BGCrzGQGVeWvXayAS1Cto1aRbMhP1kHYtfn6f5Lukf
 Yv/RbK57YEu7+YKiieWM2/StxuOicKI5hu4oow0DEVgZHy5R+lOVy/V4waisE/bSsYzm
 U+eFw18ja7XTm5rHIMR2YRAN2cDJemEM9jId2LqIc65ZC4+1SLQL9ntNdGUQv5hWDlj3
 01HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PVIRHW8sa9jivo0FxuO00g+kimqLQ8lcPUrYTTykbI=;
 b=mKuYtTxgC3BYgIo7O3KHbD2p4mZ3/uR7BARapv7Pw0GxfSUMilTemkgtNXKyujR6m0
 bvZScT/0g76eluNVzfENDHslDizUaQD/aTzZ8dAMuBOUyLUHzy3DyewIqLmIXL2kTYG+
 dlDZSnqATXxtIyI9yXNGVFJ8Oxp//Tzod8DepgWH71UKUrhntMeAn40VDCA+FXROiTkb
 VWOyCWaL4QFrCRc2W1y1QDbFAGIzU6Tl3DoeiIquhr9Hk6QfSXgkksZeN7JR2Q0hyUaj
 EdTxyZzS1d3W+ZKG7kipGCL/6TdXJOhhUM5brZt/eP2Hi91G1JgljJv8lclhKgM0RCpA
 apBA==
X-Gm-Message-State: AOAM531b7y2MtESvkhal6ju848Q7Hly29r1cLPnnXA2HjrBkMcGoFti3
 GrQj/uTvTPvoYA6n7pKzn7uBtw==
X-Received: by 2002:a05:620a:1919:: with SMTP id
 bj25mr23415424qkb.388.1625623375112; 
 Tue, 06 Jul 2021 19:02:55 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id n22sm6045364qtk.46.2021.07.06.19.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:02:54 -0700 (PDT)
Message-ID: <b029697448632a17491499fcb5b047d4a83bfaba.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Eric Auger <eauger@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 06 Jul 2021 22:02:53 -0400
In-Reply-To: <ad4f6ee9-baa3-c328-a412-62301c5228e2@redhat.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-e9-oBgK9wi6DOp5SGGd4vm-3sQY-fFn7HdTM842D1mg@mail.gmail.com>
 <ad4f6ee9-baa3-c328-a412-62301c5228e2@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2oCCI0nMHJ2S

On Tue, 2021-07-06 at 11:27 +0200, Eric Auger wrote:
> Hi,
> 
> On 7/5/21 4:07 PM, Peter Maydell wrote:
> > On Wed, 30 Jun 2021 at 16:32, Shashi Mallela <
> > shashi.mallela@linaro.org> wrote:
> > > Added ITS command queue handling for MAPTI,MAPI commands,handled
> > > ITS
> > > translation which triggers an LPI via INT command as well as
> > > write
> > > to GITS_TRANSLATER register,defined enum to differentiate between
> > > ITS
> > > command interrupt trigger and GITS_TRANSLATER based interrupt
> > > trigger.
> > > Each of these commands make use of other functionalities
> > > implemented to
> > > get device table entry,collection table entry or interrupt
> > > translation
> > > table entry required for their processing.
> > > 
> > > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > > ---
> > >  hw/intc/arm_gicv3_its.c            | 361
> > > ++++++++++++++++++++++++++++-
> > >  hw/intc/gicv3_internal.h           |  26 +++
> > >  include/hw/intc/arm_gicv3_common.h |   2 +
> > >  3 files changed, 388 insertions(+), 1 deletion(-)
> > > +/*
> > > + * This function handles the processing of following commands
> > > based on
> > > + * the ItsCmdType parameter passed:-
> > > + * 1. trigerring of lpi interrupt translation via ITS INT
> > > command
> > > + * 2. trigerring of lpi interrupt translation via
> > > gits_translater register
> > > + * 3. handling of ITS CLEAR command
> > > + * 4. handling of ITS DISCARD command
> > > + */
> > 
> > "triggering"
> > 
> > >  #define DEVID_SHIFT                  32
> > >  #define DEVID_MASK                MAKE_64BIT_MASK(32, 32)
> > > @@ -347,6 +368,11 @@ FIELD(MAPC, RDBASE, 16, 32)
> > >   * vPEID = 16 bits
> > >   */
> > >  #define ITS_ITT_ENTRY_SIZE            0xC
> > > +#define ITE_ENTRY_INTTYPE_SHIFT        1
> > > +#define ITE_ENTRY_INTID_SHIFT          2
> > > +#define ITE_ENTRY_INTID_MASK         ((1ULL << 24) - 1)
> > > +#define ITE_ENTRY_INTSP_SHIFT          26
> > > +#define ITE_ENTRY_ICID_MASK          ((1ULL << 16) - 1)
> > 
> > This is still using a MASK value that's at the bottom of the
> > integer, not in its shifted location.
> There are other locations, pointed out by former comments, where this
> kind of unusual masking scheme is used but well...
Have taken care of masking scheme as desired in all relevant sections
in v6 patch
> 
> Thanks
> 
> Eric
> 
> > Otherwise
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > 
> > thanks
> > -- PMM
> > 

