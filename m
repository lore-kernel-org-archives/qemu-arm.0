Received: by 10.28.71.155 with SMTP id m27csp771915wmi;
        Fri, 13 Apr 2018 06:41:42 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+8sGmvC1XvJD/i8wbwyJxp0EzXswWqIjhzur/9DdxR3UAkk/dqE4HJaMF5p1tt2vfio3sG
X-Received: by 10.55.17.132 with SMTP id 4mr4438621qkr.86.1523626902565;
        Fri, 13 Apr 2018 06:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523626902; cv=none;
        d=google.com; s=arc-20160816;
        b=d8+/f0BG7L5NEalxgWvWaHcCWpJpvkGw1ga/ZqMWCKUaxJPOEl+tojxipBxn1OzEyR
         pQHbbkDTWdZuxy+LEvdsLQaZesTej8/KE6xl98AYNEv9KFfs4dJyV/u5w98W6PyCHtlN
         FwmLu/myevQKQkKpDZdTMgwG4OBOWhF5wHDMI4JK2SaxHftErY8lt7icAVlTV4a/8PdL
         U2jycQ5T/+qzZty+9I/CkfpeMwYMW10haTBgJTlgqC5CKIMudOvPL4EkzyunPyam4nZM
         a66/Fu1KV5iD3Lz8SVBG6xfv6WiOu+9g5nPg3qA1ScaqBu6JvbMwltjeL4fPyxZrq8im
         Odtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=ln6NSgVf63tcNNpX3OCNAHKzP82jnQw8MVPdn7/QNFQ=;
        b=yl6StYrMsHQZpidiq3W2ulniMqqKPsTtTVkr+Rnv6PrBjV3HZ6B6yCny60uYpXgGk9
         NqAxJW757GKfUNSOfZ8/obq2ZhRCMh7v0kyGhgak9urEFF0I8oKdHjwxY+200aWfpO7S
         2hrfRUudNrZDTNMgxKjxz3ia7Z9KLcwtxwBXIFslvLbGOit8boLVsNyjn/nV2VYmvERl
         dLcpfzYT7iVHAx5xErPvRiF9uPi5P5RqZis5wiD125S0D2kyTXFxAuiIwJ11+6+YaNhg
         ihBfJra9GwIwoxDv3AaMkYsjzBA5adIT5WnUdf2Gca2T7gDAlw8/TrwrYe/cQ2Lokctl
         yIHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 133si5482604qkg.77.2018.04.13.06.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6yxP-0004PN-Oa
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:41:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6yww-00048f-OR
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:41:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6ywr-0003Es-VN
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:41:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34792 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f6ywr-0003Ef-RW; Fri, 13 Apr 2018 09:41:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 660954040856;
	Fri, 13 Apr 2018 13:41:05 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C78B0215CDC8;
	Fri, 13 Apr 2018 13:41:01 +0000 (UTC)
Date: Fri, 13 Apr 2018 15:41:00 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180413154100.1731a448@redhat.com>
In-Reply-To: <CAFEAcA9LVUfmHGor=OmnXf0Dhj5zP_e++WELKwtx0Ru7VcRA-g@mail.gmail.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-2-git-send-email-imammedo@redhat.com>
	<CAFEAcA9LVUfmHGor=OmnXf0Dhj5zP_e++WELKwtx0Ru7VcRA-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 13 Apr 2018 13:41:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 13 Apr 2018 13:41:05 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [PATCH for-2.13 1/4] arm: reuse
 arm_boot_address_space() in armv7m_load_kernel()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +rX/r+Fj2n/Q

On Thu, 12 Apr 2018 19:22:13 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 12 April 2018 at 17:40, Igor Mammedov <imammedo@redhat.com> wrote:
> > reduce code duplication by resusing arm_boot_address_space()
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  include/hw/arm/arm.h |  2 ++
> >  hw/arm/armv7m.c      | 10 +---------
> >  hw/arm/boot.c        | 16 ++++++++--------
> >  3 files changed, 11 insertions(+), 17 deletions(-)  
> 
> This minor duplication was deliberate, because hw/arm/armv7m.c
> is for M profile cores only, and hw/arm/boot.c is for
> A/R profile cores only. I don't think that saving a
> single if/else in armv7m.c really justifies blurring
> that dividing line.
I'll drop patch on respin

> thanks
> -- PMM

