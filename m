Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5203309lfg;
        Wed, 3 Mar 2021 01:33:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4fXr6rmDcMtF78q7xAW1MQgFmT0jYVKhZ7uHkaYEbTI7s5kh7wER374LvMWBvHL+XuatI
X-Received: by 2002:a92:d686:: with SMTP id p6mr20861488iln.268.1614763986300;
        Wed, 03 Mar 2021 01:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614763986; cv=none;
        d=google.com; s=arc-20160816;
        b=zG8NafDKncfX1VGWt9DFZtwGdDJrGaOO/9qH6khXPaETZoiAbm2zYJpAsnpFDbTQgE
         bne2O/ScdM24H02ymBaA1alaYoWb9aHBI0du5AyYxvA6M+tlJpVQsU1Ky3oNiXJZnzsF
         9iY401TsVVWbWlV1/y4hRxdrHjE+y5wV6dddLqD1a+o3EYVJkBdCJnq8V4nvL9AsT1os
         zYLX+b5Sm2jnaoNg0/qe9dRjBlYCZjGbsxWsyTaJ3WJllpFL6UnWFE30wT8Kejfg3yOK
         N3gY2USoZxjinFzsUhyPbrIxxyTx0zAG0mukEWQLsRwPG5sDqV6/HJtebZJx2G1cUWg6
         7zKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1bBm9GJ1NAFbiDcai0I8grI5W5LJQw4ssRg52deZ80w=;
        b=yidovrc+hBu2Npocup7FrM+IGcqFEHhOA7wfhfQnJzLmTkDYKyi0KbDEwn6ZEyAqut
         hgFu4IgioPhtvQyUIsCxpF3n2RiI1o8eSJPd3VfR4QNpFEUF1zftIrOqnzJROMUSPyZt
         KKeMxRopiY/XUynMux50x0TBv1de/2bYduxdCKqeedG0icHR4eamZj0bPNqkI/mFXqNs
         XgStZ4K9ag/zq3n55AWSjslIpLWDYTE33vHUDXlGTCN/YLuuQWAzlwFobr0pcHCI9jsx
         q5rQKYE/d8hlZPjh9Ep1qHAsy+9L5bhX4W9MhTSnx0S2WoOIlud2qCKin5Im41MYRsBb
         Je3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=mb9jMgLX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si21573026jaj.16.2021.03.03.01.33.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 01:33:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=mb9jMgLX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHNsP-0001EU-G8
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 04:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHNrj-0001C9-MP; Wed, 03 Mar 2021 04:32:23 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:44115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHNrh-0004aA-C3; Wed, 03 Mar 2021 04:32:23 -0500
Received: by mail-qt1-x82c.google.com with SMTP id b19so174081qto.11;
 Wed, 03 Mar 2021 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1bBm9GJ1NAFbiDcai0I8grI5W5LJQw4ssRg52deZ80w=;
 b=mb9jMgLXKTNLgsR4a64cb41CPHGlDoz1dUMQWUPoD1Ng3H9n6qUIPlI3qYjTz1pP51
 B5ney5+c4GF/4XiuaNmTY7BbkPtFPgqdEYtzEr1W0UJar+zeZNm/x6vOMImJBDWEqMBZ
 8sXGbewgcsjKX1LEfEA2UM5X90Pip1Z31cSKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1bBm9GJ1NAFbiDcai0I8grI5W5LJQw4ssRg52deZ80w=;
 b=i6QiPPz12kjd2fIMmiI59U5w1Fg+NchB1DT1HGV5hkW1wVLNutMJp4ONao8lhReVDc
 nPT1ak82B6ov0Y0ACj5heFGzIPeToNaAG/3nUdQYeMv+6HyoIN6aaum4xa6bwOj4Vksg
 4or4fZyYGs6YnbU20qiBIHhlWIIz5a3VTaz1udEA8uA1pfpApwtwG6i90L1Df8Qxj/DB
 SIMh6bsUGXMe4nkTITwzwMaMJ2Bj7r6vg2urViZvG/1n/9CyUdfDVVElINVOiEYZLzrr
 0WmgaUtcoOf5K93JZFeG2b5UlGZrKooRzThzcDTGABs5vzK57dOD30tk4in/xq/OcG9B
 gkkg==
X-Gm-Message-State: AOAM53063fgfCVll/g2leWIWFfhvee6rXns3gfaiA0sWs8BV7Y66Jjpb
 Dq+CvNTP9meWMw2oBDNiaJPuh9R4PwB4odg5rOc=
X-Received: by 2002:ac8:7153:: with SMTP id h19mr458911qtp.176.1614763939774; 
 Wed, 03 Mar 2021 01:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20210303012217.637737-1-joel@jms.id.au>
 <20210303012217.637737-3-joel@jms.id.au>
 <bacc0fb1-1030-c3a3-6b59-079b858698bd@kaod.org>
In-Reply-To: <bacc0fb1-1030-c3a3-6b59-079b858698bd@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 3 Mar 2021 09:32:07 +0000
Message-ID: <CACPK8XcoUMtod4biATSnzcG-6Pc_R1qNWndZgwPDzDdf9=QZ8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] tests/acceptance: Test ast2600 machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=joel.stan@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TyDP7vKbh7ed

On Wed, 3 Mar 2021 at 07:43, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 3/3/21 2:22 AM, Joel Stanley wrote:
> > This tests a Debian multi-soc arm32 Linux kernel on the AST2600 based
> > Tacoma BMC machine.
> >
> > There is no root file system so the test terminates when boot reaches
> > the stage where it attempts and fails to mount something.
>
> because of that, the test always fails  :
>
> console: [    3.615193] No filesystem could mount root, tried:
> console: [    3.615269]
> console: [    3.615688] Kernel panic - not syncing: VFS: Unable to mount =
root fs on unknown-block(0,0)
> FAIL: Failure message found in console: Kernel panic - not syncing (22.45=
 s)
> RESULTS    : PASS 0 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 | =
CANCEL 0

You're right. I must have been testing a different setup when I put
these checks in:

> > +        self.wait_for_console_pattern("ftgmac100 1e670000.ftgmac eth0:=
 irq")
> > +        self.wait_for_console_pattern("VFS: Cannot open root device")

The second string is different to what we see with the kernel we're
booting, and more importantly the first string doesn't ever appear.
This is because the kernel driver is built as a module, and with no
filesystem we don't have any modules to load. IIRC the test is still
waiting on the ftgmac string when it sees the panic, so even if the
VFS string was correct it wouldn't save us.

This will sort it out:

 -        self.wait_for_console_pattern("ftgmac100 1e670000.ftgmac eth0: ir=
q")
 -        self.wait_for_console_pattern("VFS: Cannot open root device")
 +        self.wait_for_console_pattern("No filesystem could mount root")

I'll send a v2. Thanks for testing.

Cheers,

Joel
