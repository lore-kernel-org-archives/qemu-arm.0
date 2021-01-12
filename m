Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3687676lfq;
        Tue, 12 Jan 2021 08:26:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbI43jm4C/av6kFvOAbkMH7j1/NVBRwAN6EiUfOkmNXCjLeUeUcQ4P7eN0eBYPssDg3Mmp
X-Received: by 2002:a25:730a:: with SMTP id o10mr396217ybc.16.1610468764662;
        Tue, 12 Jan 2021 08:26:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610468764; cv=none;
        d=google.com; s=arc-20160816;
        b=ZYtS/9ZBU0c2EBNImtMBjvlq44GjjiuIVnbqnNQwvWL9obQIdyWq4424RAhMepa6+c
         Ji7UneQKL8c0junhXHCRIWobWHf7FkJtsmu2ZVPq82EKayWo4s2oq18UssmJb+/VfYdX
         2GIoqWbvD8VawSMNphxBbNYymFYuIkI/Yq3RDmo52u+vRmHgzFVvTnIQN5D+WFfAasHI
         LvaHcPRROCoyf6qu4Z3iv6gkF5syWmvsTThMTH006e3XmPv1arnlUjHEfMaV8mZes1Gu
         ABLIbiIU9Ae1suSxqCIar68CxHxMsc6z1Y6Ok7IRcy5JMpeRVgYEVEPCoFRNVD87Zfy4
         ovHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wyQXJM0qz40sCwA/MHJ4EUEzKOyoFh5FbZaw7u1eSr8=;
        b=gmKx3PEIrfswelq5c682jBOrkZ/q5EbFBp63IWzRTmcJubmx4Vthtbjf7bVr6qPrA2
         Z2Z54yqBiizYlyyRFT6mnY4YziXphrvu9EXnaTHS7ET3X2jq6TL+iTP9mj96jQX1dIip
         Ph/pXr8zvODy5zChi1P+cp4pi3bIkWsx3yqvWMJjE3/O42YI1ACxiCnF7ppiWjYMdZ77
         xKYJV85P2xQMKCzlfbVIx4M1hvLmZdQ9COJe3A/8dYLrIcDd39iWI/de98AlL+8lDLwu
         Nl6FJVMJ0gQeCdc6q2sMEldo/feJYXkb+dt+bjZuvc6+a8mBDDwsFzJc0i5mEl+D+qFi
         CeXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hS5jhz7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j63si3014559ybb.463.2021.01.12.08.26.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 08:26:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hS5jhz7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzMUe-0004A2-12
	for alex.bennee@linaro.org; Tue, 12 Jan 2021 11:26:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kzMUF-00048x-Dv
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 11:25:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kzMUB-0003Po-Fd
 for qemu-arm@nongnu.org; Tue, 12 Jan 2021 11:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610468733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wyQXJM0qz40sCwA/MHJ4EUEzKOyoFh5FbZaw7u1eSr8=;
 b=hS5jhz7nSHQvSc+/KzX9/Rr5YJkz5O16Gc6epARgmTR5onD8dIvA7dKvF9x+rbCRS0th/6
 goMu2RoyUn9AzNJZPyCNH3nqXRzaRoA3oyG2a4zJ4loDEYzPFPwAIXYycKmiUmCBCTm8jc
 JBrVJ8eb7OtBsT7HN6As/PdwmCBUhik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-3PDR9FtePtW-FgOh8lV1oQ-1; Tue, 12 Jan 2021 11:25:32 -0500
X-MC-Unique: 3PDR9FtePtW-FgOh8lV1oQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A667A801E70;
 Tue, 12 Jan 2021 16:25:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-115-10.rdu2.redhat.com
 [10.10.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C801219716;
 Tue, 12 Jan 2021 16:25:28 +0000 (UTC)
Date: Tue, 12 Jan 2021 11:25:26 -0500
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
Message-ID: <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RplaR8TI8pxo

On Tue, Jan 12, 2021 at 04:00:23PM +0000, Peter Maydell wrote:
> On Tue, 12 Jan 2021 at 15:35, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Tue, Jan 12, 2021 at 05:30:58PM +0300, Maxim Uvarov wrote:
> > > Add secure pl061 for reset/power down machine from
> > > the secure world (Arm Trusted Firmware). Connect it
> > > with gpio-pwr driver.
> 
> > > +    /* connect secure pl061 to gpio-pwr */
> > > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> > > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> > > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> > > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
> >
> > I don't know anything about secure world, but it seems odd that we don't
> > need to add anything to the DTB.
> 
> We should be adding something to the DTB, yes. Look at
> how create_uart() does this -- you set the 'status' and
> 'secure-status' properties to indicate that the device is
> secure-world only.
> 
> 
> 
> > > +    if (vmc->no_secure_gpio) {
> > > +        vms->secure_gpio = false;
> > > +    }  else {
> > > +        vms->secure_gpio = true;
> > > +    }
> >
> > nit: vms->secure_gpio = !vmc->no_secure_gpio
> >
> > But do we even need vms->secure_gpio? Why not just do
> >
> >  if (vms->secure && !vmc->no_secure_gpio) {
> >      create_gpio_secure(vms, secure_sysmem);
> >  }
> >
> > in machvirt_init() ?
> 
> We're just following the same pattern as vmc->no_its/vms->its,
> aren't we ?
>

'its' is a property that can be changed on the command line. Unless
we want to be able to manage 'secure-gpio' separately from 'secure',
then I think vmc->its plus 'secure' should be sufficient. We don't
always need both vmc and vms state, see 'no_ged'.

Thanks,
drew

