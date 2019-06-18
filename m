Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3688099wrg;
        Tue, 18 Jun 2019 05:50:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNbeObitgvTn1jeFubHNT/vISSIL3wxbgQL7kW5MBOyVgtChkdjbO7rc1cxT/Z28u4K5U1
X-Received: by 2002:ae9:de81:: with SMTP id s123mr24894838qkf.339.1560862242027;
        Tue, 18 Jun 2019 05:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560862242; cv=none;
        d=google.com; s=arc-20160816;
        b=yHOyiC1Epz0FBF3aMPw58MezuDV3PLXmtYWaqGyfJWOLWmFLUGEQU3b0pLYVz4bR53
         eBDlJQqeQjmM3N1LcAzsLoXhUu4Sw3RforOARD785F7rKq4TxqY4mhdEtG8XxKBdszsL
         4Kjcu5Di+8fAzDdXhGWlJiC9ABUchzwXQdrZztVynp0K28OCHuM8HQOYzpkyd/1438TT
         +hQMGafneKYIFL4hbRZKL7EqvB1oP0BgJ/36HrcPbArmAFRSCVoysI1VIpS4B/S9QvrH
         nNkiU3NwRzvDgy/0LCLkHJKB/Pi1+VXTyWnWEGBsWRDo63f8kVUiWghCOWALSz+otAy0
         HqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=pZcVOJ3OLBnmVlYxUbHYazi8HDqTjx8fxxClNuScYmg=;
        b=zLcXS8MAkY/uZskvONwh7W/p093xX309g/N7Z+s9juJ9mDcCqe/63dSSPXYYcIutqP
         JrZYm0m1PXFgAjUC5Y61ixCeYscFiTAu6lg+um3TyZOlDiWMKo8azhMXg0PQ6qSI+cem
         I1OJvG896M56L+1eMKhU/7uLz+CTbjEj+Tq4G62o94evMzI+Fx2MLhG6ycNUpVbQID8p
         fJj1xEQvFvk0ohu0FMAUqKAmp6asVan3IR9EeTyySWYqEot7+sWgey6mslyEvq9Bv6Ed
         BWfeeviA/B9NpMIhCXWtzY8yY6NzTGnIsG9qmAOTrUotPB+6spX2qa/0oYXdClB7MpXX
         YPcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si9836005qkf.76.2019.06.18.05.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 05:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdDZR-0003c3-Gc
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 08:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37269)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hdDZ8-0003TT-Iv
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:50:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hdDZ6-00072A-S6
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:50:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40782)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hdDZ5-0006z3-GQ; Tue, 18 Jun 2019 08:50:20 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C7ED9356E7;
 Tue, 18 Jun 2019 12:50:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 030E817CE5;
 Tue, 18 Jun 2019 12:50:17 +0000 (UTC)
Date: Tue, 18 Jun 2019 14:50:15 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190618125015.ury6wbirdrqrrwdl@kamzik.brq.redhat.com>
References: <20190618083442.10407-1-drjones@redhat.com>
 <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
 <20190618115558.uhygiqryxo4lbb5u@kamzik.brq.redhat.com>
 <CAFEAcA-66=jnVrdKAkY8EtY7BjoB5EscG1S15ABUd6yQij4YFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-66=jnVrdKAkY8EtY7BjoB5EscG1S15ABUd6yQij4YFw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 18 Jun 2019 12:50:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: fix direct kernel
 boot setup
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 37y/T4r76dew

On Tue, Jun 18, 2019 at 12:58:30PM +0100, Peter Maydell wrote:
> On Tue, 18 Jun 2019 at 12:56, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Tue, Jun 18, 2019 at 12:02:37PM +0100, Peter Maydell wrote:
> > > On Tue, 18 Jun 2019 at 09:34, Andrew Jones <drjones@redhat.com> wrote:
> > > >
> > > > We need to check ram_end, not ram_size.
> > > >
> > > > Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
> > > > DTB off the end of RAM")
> > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > ---
> > > >  hw/arm/boot.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > > index b2f93f6beff6..8a280ab3ed49 100644
> > > > --- a/hw/arm/boot.c
> > > > +++ b/hw/arm/boot.c
> > > > @@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> > > >                               info->initrd_filename);
> > > >                  exit(1);
> > > >              }
> > > > -            if (info->initrd_start + initrd_size > info->ram_size) {
> > > > +            if (info->initrd_start + initrd_size > ram_end) {
> > > >                  error_report("could not load initrd '%s': "
> > > >                               "too big to fit into RAM after the kernel",
> > > >                               info->initrd_filename);
> > > > --
> > > > 2.20.1
> > >
> > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > >
> > > I think I missed this because my test case doesn't have an
> > > initrd -- direct kernel boot works fine if all you're
> > > passing to QEMU is the kernel... I think we could clarify
> > > the commit message a little:
> >
> > I found it using kvm-unit-tests which uses a small initrd to
> > pass environment variables to the guest. All the tests started
> > to report FAIL.
> >
> > >
> > > hw/arm/boot: fix direct kernel boot with initrd
> > >
> > > Fix the condition used to check whether the initrd fits
> > > into RAM; this meant we were spuriously refusing to do
> > > a direct boot of a kernel in some cases if an initrd
> > > was also passed on the command line.
> >
> > Actually I think we need another fix for this error too. We
> > weren't actually refusing do direct boot the kernel, but we
> > should have been. We're missing the 'exit(1)' after the error
> > message.
> 
> Hmm, so we are. Do you want to send a v2 then, which fixes
> that too and fixes up the commit message?

On it's way.

Thanks,
drew

> 
> thanks
> -- PMM
