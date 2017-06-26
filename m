Received: by 10.25.15.197 with SMTP id 66csp1429124lfp;
        Mon, 26 Jun 2017 08:03:42 -0700 (PDT)
X-Received: by 10.84.178.101 with SMTP id y92mr670749plb.116.1498489422848;
        Mon, 26 Jun 2017 08:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498489422; cv=none;
        d=google.com; s=arc-20160816;
        b=M5FE2Ca9gz/DcHjl05vbdO+L2E2VkFHMGFFLsQSHLLM2s9ocChkFgWY0oDEkPw96Af
         Ym981M1zCLffYOKKx+JLv4YMjj3nbQpTH3L61qWAFbwA1/VsnvGB4YEmtmWJ9RYRALCI
         Eq/ZDi1VZ7DmFfHbR/9hlYxygKX3diXkBpBOK0r6tOMqJvSDts8/9fZtbDn/0hN26F0G
         p/FtOwGzFBoNwOWvsBKX3PVnl1vdOrsRbJ4+Okw47hozTiY+jkL05dUpgGmhsBFb5631
         Y9GoUq5cCemmi0J7xbagSL/g5HqUx03/tS19osIqN+0G6WpCAdy5XMjAyKK1UlIYeFax
         F6Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-filter:dmarc-filter:arc-authentication-results;
        bh=GoYyTuZ2FvadkWpTQEi/ZNFcNJ3GEsL68SlPd2SMY2Q=;
        b=hxWkda0fhdxGBwdNt/K8w4KQuPdMw0qUO1SDqHYhSP6wMQozA+CWxBr6dbEU2MPmCZ
         DQhhvPSGkHuoMKk+LyS79uYt7czwY+/Rf0K3kM/fEXJ/AZT/CWGwtxJGyIfwaKmCLlQf
         ieBcDWUgjRrtUYQqGoy8lyE21RrJeXcy5DGgkGCABEZKiSI4qlyWD3hzvLktn37GMnyC
         QUJF5lh5lh77jvSiv5wIUzX6PA43Cnarv68KmXDP//q++QJye2qSyGbIfSaORNWh6/Xc
         jFBr66NImtntLhzBlx/5u/tVBrGeyZCIHVg0vBDz7N/2oZCzWBbWNgwHXydy9G7jSWPK
         us9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h11si193825pln.492.2017.06.26.08.03.42;
        Mon, 26 Jun 2017 08:03:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751393AbdFZPDl (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Mon, 26 Jun 2017 11:03:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58376 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750852AbdFZPDj (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 26 Jun 2017 11:03:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5D8324ACC7;
        Mon, 26 Jun 2017 15:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5D8324ACC7
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5D8324ACC7
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AC8A6031B;
        Mon, 26 Jun 2017 15:03:37 +0000 (UTC)
Date:   Mon, 26 Jun 2017 17:03:34 +0200
From:   Andrew Jones <drjones@redhat.com>
To:     Peter Maydell <peter.maydell@linaro.org>
Cc:     Alexander Graf <agraf@suse.de>,
        Paolo Bonzini <pbonzini@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        kvm-devel <kvm@vger.kernel.org>, cdall@linaro.org
Subject: Re: [Qemu-devel] [PATCH RFC v2 2/2] ARM: KVM: Enable in-kernel
 timers with user space gic
Message-ID: <20170626150334.fba6stzqzto4nvcb@kamzik.brq.redhat.com>
References: <1479133935-63848-1-git-send-email-agraf@suse.de>
 <1479133935-63848-3-git-send-email-agraf@suse.de>
 <CAFEAcA9yW+pOcdE6d6-FUxtVZtEcEXZyEkjwACZa89CbnJ9Y8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9yW+pOcdE6d6-FUxtVZtEcEXZyEkjwACZa89CbnJ9Y8w@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 26 Jun 2017 15:03:39 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: R8P/G6xk1urc

On Tue, Dec 13, 2016 at 01:20:50PM +0000, Peter Maydell wrote:
> On 14 November 2016 at 14:32, Alexander Graf <agraf@suse.de> wrote:
> > When running with KVM enabled, you can choose between emulating the
> > gic in kernel or user space. If the kernel supports in-kernel virtualization
> > of the interrupt controller, it will default to that. If not, if will
> > default to user space emulation.
> >
> > Unfortunately when running in user mode gic emulation, we miss out on
> > timer events which are only available from kernel space. This patch leverages
> > the new kernel/user space pending line synchronization for those timer events.
> >
> > Signed-off-by: Alexander Graf <agraf@suse.de>
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

Hi everyone,

I probably missed a refresh of this patch, but as I didn't see anything,
I picked this one up today in order to test the KVM support recently
merged. Tweaking this patch a bit to fit the new ABI allowed me to
instantiate a KVM guest without the in-kernel irqchip (tested on a
mustang). So, FWIW, this is report of a successful test. Is there a
refreshed version of this patch someone can point me to, which I should
test instead?

Thanks,
drew
