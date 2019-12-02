Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp333643lfc;
        Mon, 2 Dec 2019 10:27:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxf4nx4zUdzjD+9KN+C//B9cXBQ25x38MEiQ0V7C7NjgEx/r0VDVl3mpY1bTlvcM3gUYTgR
X-Received: by 2002:a17:906:bfe7:: with SMTP id vr7mr566904ejb.177.1575311274022;
        Mon, 02 Dec 2019 10:27:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575311274; cv=none;
        d=google.com; s=arc-20160816;
        b=YRXxiR1qiFCdY262veI9oF6kDae4HcMnqBwyQN8WF3CjhWaCba4jAbDu2/FhgQLDJk
         sHljqe8WHL/g7ZHwLvcXkjYontPO3XnBsfGGSgiaqK6mzgYNyvQlxj10T6jtLEDSFmuh
         BwP7qdr9ANbOx9mAcVdevRhIQiEER/2CpkhCFiSutcujTcUEo0vyqoog0OKETJxmYVrd
         I3YFRFEUopEJAEOKxAOB2rIvmdmXI2/Qnhh3yXzRL8jUmFZgbq1jV6KYMS3JBsGO5+mx
         tMX2qq1X3hsBLHnQP8jqdOYZTDd57rndkLOfOIWUzdXYYYrqWcu9Y5Bvbhxch9xsT0eB
         b3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dP2JCQbWzYq+j6H+K0zSpsgH9pH8Yu2DiLKkze34i5c=;
        b=t33HxjS7BtqGQpwQh4F2b7J1+P5tnkVKpVeKpPOalxcZwtD5VpkbBXl2/RYfyPx2hq
         97UG6XLeY0MecTJRoQwdjZckfKfXY98gU9f/kDhCxpZCrxhLwAhxe8OXEUKk5LnCtRyB
         nNu9wceWBMxPMrtGKpKKHsMoaRxgPo7NM5Vlas8Owt9P3/bKheI2iSAuSxP/QzvBDzAj
         zpFm+FUJ39SOuiQGWOwJ6bnwAgX3SgtdvjwnXNWPsAgZCT7G2+Xfo7hFlauZkVUuolo7
         yFpldTPF4qohWyz8C6IoCBb2JComMa44PO4FcFOca6QuHTQjufWmt4CgwRfsyY6vaorD
         b5iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXaEndRp;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id n19si243806ejh.172.2019.12.02.10.27.53;
        Mon, 02 Dec 2019 10:27:54 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zXaEndRp;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbfLBS1w (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 2 Dec 2019 13:27:52 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39555 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbfLBS1w (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 2 Dec 2019 13:27:52 -0500
Received: by mail-oi1-f195.google.com with SMTP id a67so585083oib.6
        for <kvm@vger.kernel.org>; Mon, 02 Dec 2019 10:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dP2JCQbWzYq+j6H+K0zSpsgH9pH8Yu2DiLKkze34i5c=;
        b=zXaEndRpo940BmNkNAkaG6vBp7FBhL5TWuQQlK2FC9TCYW/TZ0ynoQO+5wlTMTzXn6
         bG4GbRuqtTqouOX40iBFMVnXfO7I/1g48C+2ag5kOYw4IG0s7mmbfrrWVZ5CJsfa+zqc
         Mdey985FaDxiu07xmI2G1Gz+8whe2ARv9+Qv7mdRxmcxEZiL6EbJ5QDPt/Pytv3f6bnD
         B2pJibyJzHzPvCnBY2/X9aKraz+F6iixJVPkEihesTLkgOydvd6ISSTReRoaPcfd22Vb
         CU1XSDlQefGLowhufDortNYAg872s+1ka5doOtHs4UVwWOu1s8f1EXdIgUK+/LOoKDHd
         Qsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dP2JCQbWzYq+j6H+K0zSpsgH9pH8Yu2DiLKkze34i5c=;
        b=j2kEzs0CeqJpgFAe+CrSm9GwlDmVfuaq/lsRTVqdW5W9qrjuEi5QAGknToxsEzILqM
         ltaZb+ETH0d1JaTUXtFdybmTZbgCot8l6zvMOa7zSMoaeh96rdbGP0oikOWWD/g7tbXQ
         05v2TWy1UtZI5EeCV8F7+NCqyVeddNKsvY5Uaf1GeWkdgMX/WtTBE2bBrNqU1+GLooVD
         F3yBpRPjAs6QOPY5rmXyiRlNAmNOkZGBNdDWWfQj2Hw+Ur4iz4JA+HCU/6Ax25MGdkMX
         43BDJLNVBdMOjrqcM9k3PPN/pAmbU41GhshZeD45yD0othq+XGpwhazbLRQYjgUrX8As
         HtCA==
X-Gm-Message-State: APjAAAVhm2ZFjMkLps/ODD4N5SE1cxv7hw9fYYam1eEkFbVmA2B8W2Yl
        CquxEPxbLWqwPzZaBxlkbgTv4B0GGH90rs7pH/VXuA==
X-Received: by 2002:aca:edd5:: with SMTP id l204mr369787oih.98.1575311271706;
 Mon, 02 Dec 2019 10:27:51 -0800 (PST)
MIME-Version: 1.0
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
In-Reply-To: <20191111014048.21296-1-zhengxiang9@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 2 Dec 2019 18:27:40 +0000
Message-ID: <CAFEAcA96Pk_d_T2=GL-QyEBwEXC2fV89K=5h4nEtSHUL0VKZQg@mail.gmail.com>
Subject: Re: [RESEND PATCH v21 0/6] Add ARMv8 RAS virtualization support in QEMU
To:     Xiang Zheng <zhengxiang9@huawei.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: FhgX5CTK2LdW

On Mon, 11 Nov 2019 at 01:44, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>
> In the ARMv8 platform, the CPU error types are synchronous external abort(SEA)
> and SError Interrupt (SEI). If exception happens in guest, sometimes it's better
> for guest to perform the recovery, because host does not know the detailed
> information of guest. For example, if an exception happens in a user-space
> application within guest, host does not know which application encounters
> errors.
>
> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
> After user space gets the notification, it will record the CPER into guest GHES
> buffer and inject an exception or IRQ into guest.
>
> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
> treat it as a synchronous exception, and notify guest with ARMv8 SEA
> notification type after recording CPER into guest.

Hi; I've given you reviewed-by tags on a couple of patches; other
people have given review comments on some of the other patches,
so I think you have enough to do a v22 addressing those.

thanks
-- PMM
