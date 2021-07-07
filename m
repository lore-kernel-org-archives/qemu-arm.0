Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2686215lfk;
        Tue, 6 Jul 2021 19:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw16lrZD7Xiv+xwjOu5uI+AUzoKEeJlcQcwDgbq3KZQEUbTOQbyNDgAQQm/pe+Dj6KRTG71
X-Received: by 2002:a05:6214:52e:: with SMTP id x14mr21246727qvw.39.1625623729863;
        Tue, 06 Jul 2021 19:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625623729; cv=none;
        d=google.com; s=arc-20160816;
        b=OjzZ+r+TuHAkmsy8OsGbQirbmpV5CvB6RcHYNyP1D6amQUPmJahJyZxeRCgc3ki8lW
         N1xrtMq/5pJqzYceyC8Iw4q40kcm7B1bE/sx5soD1G61ZnjVb6rSwBrpyfJQjJIOy7AT
         yigd4GS+X5q9HAaI9CF+RuS1TxvyjEA71ctPBWLh29y+Vtn5ctp6C4D33HO0DfvtwTfO
         bth1NmV28O7qpZfgB02QH/bfdKw+iKvGrFHLbNex7TindqITNcgqgiDYFVZFW0Jklp1Q
         g6iLsuLEWdeqpDwfpbuW4LCIEIoUrGwITvUUb/hLX5di/OhtbydIsmzOjtpEOBjRHWUl
         +bnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:to:from:subject:message-id
         :dkim-signature;
        bh=QAbRfebMsmDFuN4i4xNyg5XICQTeIxdyB+NjCP2+Dy0=;
        b=Y6PwbjNBlg0wVgXNJPBJjJlKJAqeKeHh5I5ZSxAfs9HV91HTCMlQN7neGwYEFs9k6/
         1kyvudIseyMf9+1mwoTbBXZZ/gRxb4PDq+ILciHcTbbDPLRC1rWb7hHWqHCNfQBQCxKn
         Mp/lFkX223eB072GTwoc3RCr1Ai3VwlXUoERM5mUlpaC91atHbbeTdfKkB4w2fr23u2l
         JA7yRUQZXor1tcbt1GI4kjQYgxqg+SxPOI/cAqntpr3Qx96onA1RRkbpIG6X+NJzUGrC
         fmFp9rvX9UbPsQ1KnYCOvI7Yy7CLW7m2eN2zGNW2r/asz5Bu0tOiy9aixdtcP5veSrNs
         Qp/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MFdJscDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si2444221qtw.61.2021.07.06.19.08.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 19:08:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MFdJscDG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wzZ-0003eB-2l
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 22:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0wz8-0003cm-SG
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:08:22 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1m0wz6-0000Zm-JQ
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 22:08:22 -0400
Received: by mail-qk1-x736.google.com with SMTP id s4so434137qkm.13
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 19:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QAbRfebMsmDFuN4i4xNyg5XICQTeIxdyB+NjCP2+Dy0=;
 b=MFdJscDG0J6b6+geUK7lkQLZpqvGi0Cyb5SOoRYWhyLTtypFqRFdIHlxpNnlL31rVL
 IcR736i8D+WNiuHi1gylUQzcR2jbmXOZ/w4XQxO39YN6qtaZkGMXuBg7UQ8+wDmoJn6K
 gHadxvZDJHUhUPYAxFllEV7fq0vSfTOlvZTLtTIAarCv2yCnSyp5CNGTZTQjUW7BfbGi
 yVrBZUWPQdbDj2xmyQBOcM6l7T+CpivTP12e7xQZ82tflQT6dXd6uKDgfbNjCtOpRRzo
 3kbaHmoelqnA76mEx2bzOGS0UDHoxKytEyypKXa2NdlHMCDHSD4U2moT1kwMISGCtHFp
 F25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QAbRfebMsmDFuN4i4xNyg5XICQTeIxdyB+NjCP2+Dy0=;
 b=uUDOeZZXMZF9E1NB54PgnRjsjaVAyEYiXCLkO5y06KeQnggL1TAtEzboYcpCgK4ruT
 q+bVcWpM1XpuqcMwLzcb2fGVrU+C7Dh7PDSD5XqfA8b7uoGtGJeBiT6ZChAXyOI+dgt3
 /j5qEbXAvbDW+HumH1v7HaORzaMVa351RSAc9PJ0wK9KdCGs4jcUpVoKl+85JJasdSDS
 qqTGNh6oxk2G9ICglqyraCxgqm7YDi2hyHV7/J6arHlRThP2Jago+GetItIrxgsCOhQP
 +8ackGHh764IyYwLqoOYLynD0U7qZITLkS37EpaNbY+LPHbLMChq9HCf2DAjSqSpBRw6
 hRWg==
X-Gm-Message-State: AOAM531/HodJ6DXSVUlX01DvhgViwnn5hNaMQ5qLltoT8MbmlpGDVf6f
 gL4C+tonfUdIe8kGIa4XmJiLKQ==
X-Received: by 2002:a05:620a:4e7:: with SMTP id
 b7mr3441593qkh.446.1625623696753; 
 Tue, 06 Jul 2021 19:08:16 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-22-142-114-143-47.dsl.bell.ca. [142.114.143.47])
 by smtp.gmail.com with ESMTPSA id w13sm3457739qkf.72.2021.07.06.19.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 19:08:16 -0700 (PDT)
Message-ID: <8f1298fdb9e5a19d67456ccb59710c920173f6ca.camel@linaro.org>
Subject: Re: [PATCH v5 04/10] hw/intc: GICv3 ITS Command processing
From: shashi.mallela@linaro.org
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 06 Jul 2021 22:08:15 -0400
In-Reply-To: <CAFEAcA-+JxmqNrOSaMsZCkwOsPQn6SUOO9a_bGhzGqCr9GUvJA@mail.gmail.com>
References: <20210630153156.9421-1-shashi.mallela@linaro.org>
 <20210630153156.9421-5-shashi.mallela@linaro.org>
 <CAFEAcA-ZeKEMTp5X0VWXu+hip9ryzQLTLNwd_bsKQybyT_k7CQ@mail.gmail.com>
 <bbb32d79ed60fb90128b3662ec925f60ca258e8a.camel@linaro.org>
 <287eb50c0b99a3daec986ec29ede33cb2bdfd025.camel@linaro.org>
 <CAFEAcA-xC_v2z=QaD=_dkFWx2Hr+UFd0h_YTtSi6MNPhk6-Sbg@mail.gmail.com>
 <781518f186454dc31c97b34c088f89577fbb66ab.camel@linaro.org>
 <CAFEAcA-+JxmqNrOSaMsZCkwOsPQn6SUOO9a_bGhzGqCr9GUvJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x736.google.com
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
X-TUID: UfZvpHkzZM+J

On Tue, 2021-07-06 at 14:27 +0100, Peter Maydell wrote:
> On Tue, 6 Jul 2021 at 13:46, <shashi.mallela@linaro.org> wrote:
> > On Tue, 2021-07-06 at 10:19 +0100, Peter Maydell wrote:
> > > On Tue, 6 Jul 2021 at 04:25, <shashi.mallela@linaro.org> wrote:
> > > 
> > > But the pseudocode for MAPTI does not say anywhere that we should
> > > be checking the pIntID against any CPU's GICR_PROPBASER field.
> > > It is checked only by the checks in LPIOutOfRange(), which tests:
> > >  * is it larger than permitted by GICD_TYPER.IDbits
> > >  * is it not in the LPI range and not 1023
> > > 
> > > Checking whether the intID is too big and would cause us to index
> > > off the end of the redistributor's configuration table should be
> > > done
> > > later, only when the ITS actually sends the interrupt to a
> > > particular
> > > redistributor, I think.
> > > 
> > > (You can't rely on the guest having done the MAPC before the
> > > MAPTI;
> > > and in any case the guest could choose to do a MAPC to a
> > > different
> > > redistributor after it's done the MAPTI.)
> > We already have the "intID too big check" in place within the
> > redistributor processing when ITS sends the interrupt trigger.
> > "the LPI range and not 1023" is also handled in this function,but
> > for
> > validating "is it larger than permitted by GICD_TYPER.IDbits",the
> > source of GICD_TYPER.IDbits is GICR_PROPBASER because we pick up
> > min of
> > GICR_PROPBASER.IDbits and GICD_TYPER.IDBits.
> > 
> > If we are to not use gicr_propbaser,then are we good to just accept
> > the
> > intID value here since we are validating the same during interrupt
> > processing?
> 
> You should check the things the pseudocode says you should check.
> When processing MAPTI, that's GICD_TYPER.IDbits.
> GICR_PROPBASER.IDbits
> is not the same thing because the guest can set it to a smaller
> value.
Have made changes in code to check "intID too big" case using
GICD_TYPER.IDbits instead of GICR_PROPBASER.IDbits
> thanks
> -- PMM

