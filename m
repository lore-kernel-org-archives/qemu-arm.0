Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3629178wrg;
        Tue, 18 Jun 2019 04:56:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdYmrAP44aOBKPhe/jhYisrebiSioZMs9Ew/u/pfV+ECHi1ulU5n/WnmI8c1H3hBGXvZ3w
X-Received: by 2002:a0c:f9c1:: with SMTP id j1mr26442183qvo.235.1560859003163;
        Tue, 18 Jun 2019 04:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560859003; cv=none;
        d=google.com; s=arc-20160816;
        b=DdzOT25ttBOOUpMrHqCJGdej9mWUC0qFtKvzf+Uk+K0eYnMb3jkB43dXJKcsYqn7JV
         4e9BtBkYyELR34oYAaqeWwprQL85EHsjoIdkLs2/Hv6Qyjo4Ta7hDsalbFVTyK11jPn7
         QLam/qQrN3Ro5XYAxjh5K03CNJjD0KsiOjqWqkov1jscPCjVtyOAo0SI78XfNn/I1nyT
         KcFQ9MKVI0H891KLsB5zLfJntjiBBDJKwZ9iCe6Xxxz5GN6jvyw/O7yGdoTKJdixW2/k
         ZbBU8h1LFKiu9QMiRSbiByCSZIJ/dihfO3scP/z1JC/PuVjr/sT4JAjAn74Itjdo94U5
         u1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=wm6u49yhGE1hjkj46WRvOxhazZKjctBTnOz8WU5QAPg=;
        b=kM/g8fJayvLt7UyFHIihCDGEyRCUA7pdJA5sLe74aA2osLEvjw/epu+DmF0Cvj+M3c
         6Uk+20z3dwiWY0ILglET5B+ajIR99ULkxIp7xJf3k3WtARWUqp6bmsZSshLPTVx64yLH
         seMeEjIfeMO+cbSuSABrDCdVKdYqtSO4kPd9XqkGsyUbSFkRzEseL9dCLgLuMCTyKrSy
         m6EHJ14JPudZxu+52CmQewufVIdfWxhFCwl2R7UlIGBvGBnFa2s978UBGv/sWe/zNN3y
         Tj0Vc4DNl95Ogi+HpQ4j9ffWuiItVrLlCskD7C5vjTG7G7d00Hl9ZtSe6EUw9rTrzvuA
         EfSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c80si10121359qke.221.2019.06.18.04.56.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 04:56:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdCjC-00005L-Mj
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 07:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51946)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hdCia-0008I0-Ji
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:56:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hdCiZ-0000Jr-Is
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 07:56:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:29387)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hdCiY-0000FU-TL; Tue, 18 Jun 2019 07:56:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5617531628EF;
 Tue, 18 Jun 2019 11:56:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FD3B1001E61;
 Tue, 18 Jun 2019 11:56:00 +0000 (UTC)
Date: Tue, 18 Jun 2019 13:55:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190618115558.uhygiqryxo4lbb5u@kamzik.brq.redhat.com>
References: <20190618083442.10407-1-drjones@redhat.com>
 <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9bwbev3efZ=LJPGgObBCbW-WX19fySMusLyMNC5ZExvA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 18 Jun 2019 11:56:01 +0000 (UTC)
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
X-TUID: j8kFjfVT5VYu

On Tue, Jun 18, 2019 at 12:02:37PM +0100, Peter Maydell wrote:
> On Tue, 18 Jun 2019 at 09:34, Andrew Jones <drjones@redhat.com> wrote:
> >
> > We need to check ram_end, not ram_size.
> >
> > Fixes: 852dc64d665f ("hw/arm/boot: Diagnose layouts that put initrd or
> > DTB off the end of RAM")
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  hw/arm/boot.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index b2f93f6beff6..8a280ab3ed49 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -1109,7 +1109,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
> >                               info->initrd_filename);
> >                  exit(1);
> >              }
> > -            if (info->initrd_start + initrd_size > info->ram_size) {
> > +            if (info->initrd_start + initrd_size > ram_end) {
> >                  error_report("could not load initrd '%s': "
> >                               "too big to fit into RAM after the kernel",
> >                               info->initrd_filename);
> > --
> > 2.20.1
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I think I missed this because my test case doesn't have an
> initrd -- direct kernel boot works fine if all you're
> passing to QEMU is the kernel... I think we could clarify
> the commit message a little:

I found it using kvm-unit-tests which uses a small initrd to
pass environment variables to the guest. All the tests started
to report FAIL.

> 
> hw/arm/boot: fix direct kernel boot with initrd
> 
> Fix the condition used to check whether the initrd fits
> into RAM; this meant we were spuriously refusing to do
> a direct boot of a kernel in some cases if an initrd
> was also passed on the command line.

Actually I think we need another fix for this error too. We
weren't actually refusing do direct boot the kernel, but we
should have been. We're missing the 'exit(1)' after the error
message.

> 
> ?
> 
> (if you agree I can just fix up the commit message when I apply it.)

I agree with the improved commit message if we also add the
'exit(1)', otherwise "refusing to boot" isn't the right thing
to say.

Thanks,
drew

> 
> thanks
> -- PMM
> 
