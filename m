Received: by 10.25.227.6 with SMTP id a6csp3077689lfh;
        Wed, 28 Jun 2017 06:43:35 -0700 (PDT)
X-Received: by 10.99.134.199 with SMTP id x190mr10658424pgd.127.1498657415632;
        Wed, 28 Jun 2017 06:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498657415; cv=none;
        d=google.com; s=arc-20160816;
        b=zNIjevss5V7PzbAnPzSZIhFvy2fhf7TNP2uw7M4dMcShffHU32IAY2/ALi8mvf0D62
         OSGRIMmFMeL23Lza4srw3XTe/nfkzEQ5owwsaxy9Nc696PHOHUAszcbB25pHnP2N8WKl
         7CB2d5JXioSw9/vbrI8Ke51pXn2A33r0zIvyl/thDmIFprLNZU9gvty7RL9eXxNNCgCj
         GA9IfYWMpVEDKWJpN4Oa200TsHC1K/wnF9QoBTy2rgq+iPIB1dpFaDxq2/N1cp2QmjXW
         OcC/gugnYB16ZpIfM8E8o4wdN1bbg9CDeG15OoCkgmwuhDNK9AqRBV2ZfOKLx7JxCZrv
         +Vpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=4dCdGH6LkKvmuki83MlrMK7QxRsHRCe1uQ129TfBaOs=;
        b=MN7wGjKFGeaVXhjqDRaZFd5wSK982sGbHSzKFed4zxXzsD15dr0RTuhycSHnHZptWb
         jOBLIPWTUvnx273bFN9D4vSOYOW/LU7ewdo82VN4/rqoeNSIYmmx0GgADbXEVFTzlsUR
         1C0QXrcweRxi914hiZ80KSUlv15RPxY6/ryl6qfz39kdzDv/IljIZ/YVhxpg/BIv4DKn
         YlbIEyxmjn2LCcTPiyMcr9SE8+TPYw8u+tBRsd+/yzPyWErhLZ6Fb/gX+KrDPWa8wVAz
         cg5FU4ZHXceBA95//GyG0QrZmYgvho3VZo/pFDNJ71Ls+yePJqYnx5i8rlZHpPEqPJ2m
         gRaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v61si1755906plb.389.2017.06.28.06.43.35;
        Wed, 28 Jun 2017 06:43:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751910AbdF1NnJ (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Wed, 28 Jun 2017 09:43:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60108 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751745AbdF1NnF (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 28 Jun 2017 09:43:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C7F4EC05B1E6;
        Wed, 28 Jun 2017 13:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C7F4EC05B1E6
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C7F4EC05B1E6
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2124C5C3FB;
        Wed, 28 Jun 2017 13:43:02 +0000 (UTC)
Date:   Wed, 28 Jun 2017 15:43:00 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Alexander Graf <agraf@suse.de>
Cc:     Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
        cdall@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3] ARM: KVM: Enable in-kernel timers with
 user space gic
Message-ID: <20170628134300.att7dnov44aiidoe@kamzik.brq.redhat.com>
References: <1498577737-130264-1-git-send-email-agraf@suse.de>
 <20170628115110.nq7wdsrhxxjelzq6@kamzik.brq.redhat.com>
 <9e3a0693-d69b-4ae7-c449-457f7428fbff@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e3a0693-d69b-4ae7-c449-457f7428fbff@suse.de>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 28 Jun 2017 13:43:05 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 7wG4HZdwkPFQ

On Wed, Jun 28, 2017 at 02:36:17PM +0200, Alexander Graf wrote:
> 
> 
> On 28.06.17 13:51, Andrew Jones wrote:
> > On Tue, Jun 27, 2017 at 05:35:37PM +0200, Alexander Graf wrote:
> > > When running with KVM enabled, you can choose between emulating the
> > > gic in kernel or user space. If the kernel supports in-kernel virtualization
> > > of the interrupt controller, it will default to that. If not, if will
> > > default to user space emulation.
> > > 
> > > Unfortunately when running in user mode gic emulation, we miss out on
> > > interrupt events which are only available from kernel space, such as the timer.
> > > This patch leverages the new kernel/user space pending line synchronization for
> > > timer events. It does not handle PMU events yet.
> > > 
> > > Signed-off-by: Alexander Graf <agraf@suse.de>
> > > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > > 
> > > ---
> > > 
> > > v1 -> v2:
> > > 
> > >    - whitespace fixes
> > >    - use !! to determine whether bit is set
> > >    - call in-kernel device IRQs out by their name everywhere
> > > 
> > > v2 -> v3:
> > > 
> > >    - fix last occurence of calling out timer IRQs explicitly
> > > ---
> > >   accel/kvm/kvm-all.c    |  5 +++++
> > >   accel/stubs/kvm-stub.c |  5 +++++
> > >   hw/intc/arm_gic.c      |  7 +++++++
> > >   include/sysemu/kvm.h   | 11 +++++++++++
> > >   target/arm/cpu.h       |  3 +++
> > >   target/arm/kvm.c       | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++
> > >   6 files changed, 82 insertions(+)
> > > 
> > 
> > Tried testing this on a gicv3 machine, a ThunderX2. The guest kernel
> 
> Did you patch QEMU to automatically choose the gic version?

Nope, I was just trying to use a pre-existing guest config on that host,
which had gic-version=3 on its command line.

> The upstream
> default is to have gicv2 as the guest gic type. And gicv2 should work just
> fine.

Yup, works for me now (with its limitations - had to reduce the number of
cpus the pre-existing guest config had configured to 8.)

Thanks,
drew
