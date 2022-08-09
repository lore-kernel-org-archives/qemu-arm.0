Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp3305455ejf;
        Tue, 9 Aug 2022 11:56:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4xVspck/DkatgodCW4mIyJDiee3LHdjf30wJAailEegNSoRkE4XMH/gUZM293DlJtTJUJj
X-Received: by 2002:a05:622a:196:b0:342:f454:9c1 with SMTP id s22-20020a05622a019600b00342f45409c1mr12604921qtw.155.1660071369866;
        Tue, 09 Aug 2022 11:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660071369; cv=none;
        d=google.com; s=arc-20160816;
        b=DLO3RJedu50TiZZcbM94KjbUTbW2tbK4wQ9UB7k5iEWr+E+0c2gstgR0Oyw0o9eSR/
         VHrkiV9Yfar2uB17z42vK5FyttnPALOvVu1KLazFh4fbza/QGor41dre0IOFwRtjPs3D
         UVwoUbJPx+0lSU4Pw4mXMEAog51D6l2VSPrm1u+orDE+V01h/OSIlnk7oe70Srqa4mq7
         r9G6EpcL35SMLsu4rjYetpmuXh7dgHDe+dLHPkivqaaPxjSlJVCnpDNKUqK788ueFhPl
         hkTb4amkXysWbfPvsQs3d/PAz35OJHqyTSEboyYxUPDNCqTusMjaC5eEHdpTAlJxlzCH
         s29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=VMY2QADQyCAv3ZOa6i7/abJfSsXTzyndqlI+rr4BqUI=;
        b=I6ixn/kpjDylvDNGQC+8QggRNhZCeAHBtbZ3UxQXgVW3N3+FbQbqyGZ3I1TqCRbhat
         AkP92MOBajd6aSA1oNpJZ3fvzIOSeP1UKDJZPBaVcjRBRYPuA5Q8U3w1+ciU1T/755QP
         TavCJ51FuzpvRwz5HE5F2AWCRxdd5GG14IcGyKgwRXnGbLlVavEFZxoeEvTwjX/Y3MsY
         X4X+FUdQLHxGtbBtgiYUZpNwXeBs1WLCGkFyGrpSuUAMzk0nzth3xkSxY0I66BmmuqAf
         4CXi7fBGbwzUp28Vi9/bV9lVdeHcfuHk3fB3M6FE2TaQx7xaFWl0guCEWXt70h1ULlK/
         sTPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020ac85242000000b00305323a1001si3586876qtn.656.2022.08.09.11.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Aug 2022 11:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLUOf-0004PB-8L
	for alex.bennee@linaro.org; Tue, 09 Aug 2022 14:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oLUJ7-0008CQ-Tz; Tue, 09 Aug 2022 14:50:26 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:40874
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1oLUJ4-0001m5-95; Tue, 09 Aug 2022 14:50:24 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1oLUIy-0007zm-Vh; Tue, 09 Aug 2022 19:50:17 +0100
Date: Tue, 9 Aug 2022 19:50:16 +0100
From: Ben Dooks <ben@fluff.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Ben Dooks <qemu@ben.fluff.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH v3 3/5] hw/core: use qemu_fdt_setprop_strings()
Message-ID: <20220809185016.kyw6kzlqect4h5rp@hetzy.fluff.org>
References: <20220727223905.624285-1-qemu@ben.fluff.org>
 <20220727223905.624285-4-qemu@ben.fluff.org>
 <CAFEAcA9QxwtyB1muGCJh9THdGCu3gEvFAqemvYMUHca6Z1PvAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9QxwtyB1muGCJh9THdGCu3gEvFAqemvYMUHca6Z1PvAg@mail.gmail.com>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EnpE4sN6Tt6B

On Mon, Aug 01, 2022 at 12:30:22PM +0100, Peter Maydell wrote:
> On Wed, 27 Jul 2022 at 23:39, Ben Dooks <qemu@ben.fluff.org> wrote:
> >
> > Change to using the qemu_fdt_setprop_strings() helper in
> > hw/core code.
> >
> > Signed-off-by: Ben Dooks <qemu@ben.fluff.org>
> > ---
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I've had to make a second version, so assuming it'll need
reviewing again

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

