Received: by 10.25.227.6 with SMTP id a6csp1720687lfh;
        Tue, 27 Jun 2017 05:40:34 -0700 (PDT)
X-Received: by 10.101.88.13 with SMTP id g13mr5043859pgr.180.1498567234011;
        Tue, 27 Jun 2017 05:40:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498567234; cv=none;
        d=google.com; s=arc-20160816;
        b=AFroWjq7IPk7liX3PmW+XO79QQaVdACPxzEDDY/xpkFpT8tgpVXavAQBz+tD/V56Bq
         yUJUQLcTpYdWecq1L1zkUUthHUAYwqGDELGeH/lFajq5ZLt2CiJ7DEX3LnofsOzn3ejr
         q+tc9dpu9oLDF/44j/7ng8JQlkSku/5mxlK/AGp15CNaBdU9qlDkyduQEe9Ak+wNVpQG
         0FpV/4mu/H5snhWq2PAWqlggwRKhbo0N1/psiTEm61N/WlrNUbxdHIsTr2F6nAK849td
         TPyMFETRTsia93WV1Rh6TbfoP9xtMWa5+5T0NxIPxUVz7et+kYpFfpmauHHfJ0H0x6zx
         6muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=OC2h1GaRv3nuRpZFVUpwPKaZbEJ1OQQTBcYtVCMObpA=;
        b=UDEwoSckE/EFK4L8ZeoelSZ/hTMhAsWpsCcynwcNIPFycBopctHgdke1NoyhnxuRw/
         InY/1pLD6KlEoPJR8INaDr1BfEGI1O9kV0DZR9AIF8TFw2IS9HklvTk5awmSZMafKYlU
         Trf+HgcLMHdJlrTYSrmr5DDss+AMHtm2c7HP6a0iq7yaZcG8jPRLMRZTdCi/sLIqXiSp
         +kRcH2mvhHqpiv2lauZs79slG6UXw87Zl1tmKEKE7gjJDVnWjbSJR0SrkooeHw56+owD
         QPLaxO7SoOTS/BHej1ogwUXIfmrBcGr/XCUaAcX6KfMv5hm3b/tnQroHHFYM3VestOMK
         wpug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j10si2019665plg.641.2017.06.27.05.40.33;
        Tue, 27 Jun 2017 05:40:34 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752802AbdF0Mkc (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 27 Jun 2017 08:40:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37710 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751632AbdF0Mkb (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 27 Jun 2017 08:40:31 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E5FE16AAEB;
        Tue, 27 Jun 2017 12:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E5FE16AAEB
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E5FE16AAEB
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C8E277BF5;
        Tue, 27 Jun 2017 12:40:28 +0000 (UTC)
Date:   Tue, 27 Jun 2017 14:40:26 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Alexander Graf <agraf@suse.de>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, cdall@linaro.org
Subject: Re: [Qemu-devel] [PATCH RFC v2 2/2] ARM: KVM: Enable in-kernel
 timers with user space gic
Message-ID: <20170627124026.acnrfdkop42zxzuw@kamzik.brq.redhat.com>
References: <1479133935-63848-1-git-send-email-agraf@suse.de>
 <1479133935-63848-3-git-send-email-agraf@suse.de>
 <CAFEAcA9yW+pOcdE6d6-FUxtVZtEcEXZyEkjwACZa89CbnJ9Y8w@mail.gmail.com>
 <20170626150334.fba6stzqzto4nvcb@kamzik.brq.redhat.com>
 <afd9127e-1b06-cced-714f-f55ab8dffdad@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afd9127e-1b06-cced-714f-f55ab8dffdad@suse.de>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Tue, 27 Jun 2017 12:40:31 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 4emdhIn+uZ8v

On Mon, Jun 26, 2017 at 11:32:10PM +0200, Alexander Graf wrote:
> On 06/26/2017 05:03 PM, Andrew Jones wrote:
> > On Tue, Dec 13, 2016 at 01:20:50PM +0000, Peter Maydell wrote:
> > > On 14 November 2016 at 14:32, Alexander Graf <agraf@suse.de> wrote:
> > > > When running with KVM enabled, you can choose between emulating the
> > > > gic in kernel or user space. If the kernel supports in-kernel virtualization
> > > > of the interrupt controller, it will default to that. If not, if will
> > > > default to user space emulation.
> > > > 
> > > > Unfortunately when running in user mode gic emulation, we miss out on
> > > > timer events which are only available from kernel space. This patch leverages
> > > > the new kernel/user space pending line synchronization for those timer events.
> > > > 
> > > > Signed-off-by: Alexander Graf <agraf@suse.de>
> > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > 
> > Hi everyone,
> > 
> > I probably missed a refresh of this patch, but as I didn't see anything,
> > I picked this one up today in order to test the KVM support recently
> > merged. Tweaking this patch a bit to fit the new ABI allowed me to
> > instantiate a KVM guest without the in-kernel irqchip (tested on a
> > mustang). So, FWIW, this is report of a successful test. Is there a
> > refreshed version of this patch someone can point me to, which I should
> > test instead?
> 
> Sorry, this did fall the cracks way too many times now. I've sent a respin
> that hopefully is slightly more future proof than this RFC :)
> 
> If your tests passed with this patch, please extend them to also cover SMP
> support, as that was broken with this RFC.

Indeed. I retested with the old version and now see that secondaries were
not booting, but they are with the new version.

Thanks,
drew
