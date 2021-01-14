Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp886408lfq;
        Wed, 13 Jan 2021 16:10:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE20XA09s92rhHyNKnNPJb87bXA7b36ODzHsxkNk9QZYSCZ3dy6Kikzf+/luj5KvfjlCiu
X-Received: by 2002:a25:9b45:: with SMTP id u5mr7145714ybo.331.1610583046897;
        Wed, 13 Jan 2021 16:10:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610583046; cv=none;
        d=google.com; s=arc-20160816;
        b=k+at6tKMADMNfh85wm+nqRq2NNR2LbEeRfmXcnQgns9HMIVIzp/Po2sOIZfa0+aBhb
         0o9S26OfCOczkpPqX9N2Afgt/cKjyoDf0cAI6m2ePWowm20yakxsuwC/r35MSITdwPKc
         jOOxM6ytjUki5jX8fya15Upo0aE4iI3Z7UpHitoeLZQYI7jfrnrIszKLW2VZntIUwZRa
         pbuYeIrhmVIEw5+ts/4ROeF0zOji8hthDLICzCB5/EggFqX4YIUwCHZxDDNlD4fWU5Mi
         04uWm7J+4zCmZ+TroZYf2tY33u5zUO4+zM9CEACM0nnejc/xXdEkQlcF0RcAiRiYj+T7
         wTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=6exoz4gE1h9IzidTcM0FsUollCqLpu8lLTXxxJuhK58=;
        b=RUpttoGFdD4VDsAlKdQKjRA4dO1FJBsurJEqp4CqmeL3fso7KqsRKGRkkldNKTp4L8
         Hm66ZgLAxYK6RBEeI3WJzPIoBBn3SgQ9j1g/PabsJatvoKyFkLf+NtAhsKQGKbNBvdXn
         ruA+yK/aqm1zowZjXsZBl8shptPgfLF11yXJkAxMpHokVQVn1AlIjFogXoWJwyA2aFk9
         UUfVlTvVUW9de+M9k2U66RYQSi3xd/JrXjcyJXGs/RpPKWABofFR4DQuvKJpxdCZMc0o
         NpyaA+Z9PU7t5bLBz5WHko2xHACKAeyhR6btW7ugxH3VMP9AbyLEUjm8pX81x+l3EOSd
         SS/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fX48nfRr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l131si4191901ybl.481.2021.01.13.16.10.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 16:10:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fX48nfRr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzqDt-0003Vt-Uv
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 19:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kzq8F-0005gP-8c
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 19:04:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kzq8D-0000OO-71
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 19:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610582692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6exoz4gE1h9IzidTcM0FsUollCqLpu8lLTXxxJuhK58=;
 b=fX48nfRre1KCJcABWW1MZtnEsuUzFvW1Wj6qlyr2sG0eZu++hkXq1gnKJXMHwqVZz9ATti
 EZc5/x/BHmS+oDnsQXc0sYCP77nXW6pKnRpKG6dt+o1fkThjKKEW4vpzUjtYjEXVOh4OtN
 44XhQyETDJ26DvLNyIGTRSOZ4w+3V6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-bV0LLfvzMF67Cu_PqcjAxw-1; Wed, 13 Jan 2021 19:04:50 -0500
X-MC-Unique: bV0LLfvzMF67Cu_PqcjAxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE3B68042A2;
 Thu, 14 Jan 2021 00:04:48 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-112-138.rdu2.redhat.com
 [10.10.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 375D15D9C0;
 Thu, 14 Jan 2021 00:04:47 +0000 (UTC)
Date: Wed, 13 Jan 2021 19:04:45 -0500
From: Andrew Jones <drjones@redhat.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
Message-ID: <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jose Marinho <Jose.Marinho@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9mFv0AxKhadd

On Wed, Jan 13, 2021 at 10:30:47AM +0300, Maxim Uvarov wrote:
> - the same size for secure and non secure gpio. Arm doc says that
> secure memory is also split on 4k pages. So one page here has to be
> ok.

To be clear, does that means 4k pages must be used? I'm not concerned
with the size, but the alignment. If it's possible to use larger page
sizes with secure memory, then we need to align to the maximum page
size that may be used.

Thanks,
drew


> - will add dtb.
> - I think then less options is better. So I will remove
> vmc->secure_gpio flag and keep only vmc flag.
> 
> Regards,
> Maxim.
> 
> On Tue, 12 Jan 2021 at 19:28, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Tue, Jan 12, 2021 at 11:25:30AM -0500, Andrew Jones wrote:
> > > On Tue, Jan 12, 2021 at 04:00:23PM +0000, Peter Maydell wrote:
> > > > On Tue, 12 Jan 2021 at 15:35, Andrew Jones <drjones@redhat.com> wrote:
> > > > >
> > > > > On Tue, Jan 12, 2021 at 05:30:58PM +0300, Maxim Uvarov wrote:
> > > > > > Add secure pl061 for reset/power down machine from
> > > > > > the secure world (Arm Trusted Firmware). Connect it
> > > > > > with gpio-pwr driver.
> > > >
> > > > > > +    /* connect secure pl061 to gpio-pwr */
> > > > > > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_POWEROFF,
> > > > > > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));
> > > > > > +    qdev_connect_gpio_out(pl061_dev, ATF_GPIO_REBOOT,
> > > > > > +                          qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
> > > > >
> > > > > I don't know anything about secure world, but it seems odd that we don't
> > > > > need to add anything to the DTB.
> > > >
> > > > We should be adding something to the DTB, yes. Look at
> > > > how create_uart() does this -- you set the 'status' and
> > > > 'secure-status' properties to indicate that the device is
> > > > secure-world only.
> > > >
> > > >
> > > >
> > > > > > +    if (vmc->no_secure_gpio) {
> > > > > > +        vms->secure_gpio = false;
> > > > > > +    }  else {
> > > > > > +        vms->secure_gpio = true;
> > > > > > +    }
> > > > >
> > > > > nit: vms->secure_gpio = !vmc->no_secure_gpio
> > > > >
> > > > > But do we even need vms->secure_gpio? Why not just do
> > > > >
> > > > >  if (vms->secure && !vmc->no_secure_gpio) {
> > > > >      create_gpio_secure(vms, secure_sysmem);
> > > > >  }
> > > > >
> > > > > in machvirt_init() ?
> > > >
> > > > We're just following the same pattern as vmc->no_its/vms->its,
> > > > aren't we ?
> > > >
> > >
> > > 'its' is a property that can be changed on the command line. Unless
> > > we want to be able to manage 'secure-gpio' separately from 'secure',
> > > then I think vmc->its plus 'secure' should be sufficient. We don't
> >
> > I meant to write 'vmc->no_secure_gpio and vms->secure' here.
> >
> > Thanks,
> > drew
> >
> > > always need both vmc and vms state, see 'no_ged'.
> > >
> > > Thanks,
> > > drew
> >
> 

