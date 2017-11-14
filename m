Received: by 10.223.150.237 with SMTP id u100csp3747488wrb;
        Tue, 14 Nov 2017 07:48:02 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYYtcTfRUC0U/H7ZgKhlxHUbptlg+SoTEG0+Fpo0C9/3vwvYBnLr7SGtOXjBGK4TGwC2ch1
X-Received: by 10.37.31.9 with SMTP id f9mr3921045ybf.161.1510674482630;
        Tue, 14 Nov 2017 07:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510674482; cv=none;
        d=google.com; s=arc-20160816;
        b=m6A8PqeovAVQmZzNKVXD6snPSlBr6S4QeaTBqp1K2C2usTbVMjRfgBqQNjBLKrnl+l
         fAPJxfFggRJAHLwpbZ8/+QMuSXn9t9DNxy5UgRCX39/typ/yHcwSWrJrLkH1AgWI43C3
         fvwylZtJmScnZOeNPBWHOHyQ5crVDIQu6dhqtgZMk2nh/GHuJ3cW/TELS0lIqqXoeYOe
         ok6gKePtbtvDv5osYmP4zncq/Ox09TYJefaE+GTWnTyxkjql/RVjvAW5uNE5tqssJau5
         V/UtdWCFE3gjJB9Kr3S8Nj70ZrKecV9IEydHGpzWJecIdMzm3LgFTy17xaGD/YDH++Rw
         6Hlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=CYT0ZqxmMWz5IhiqIf70LpXsgUtzBmz45Id6Jm65vJc=;
        b=FMKZ7GMnWDKJuxQlL3C0BFgFoJlNfoaM6oJMuOgkybzzyzUCN4STMshiEu9iOZr36I
         RwmsVd1fwZY6r3WZFJlctOX4I6naze5M5MEJaG4YBkaaykYhFV2g278u3ju3lwQ6PrNl
         JGHDiSinaBON6xFtQA53uD7JkRQRChJtjBQB6Jq8veyi82yjAQ8vmypDsrHFEvP4a+JP
         GclEBtD8hqGsWHT8g1aYlngMUcljwwBSwoKUD/ETx/H59ejPTb733pmKFy6bKlq3jo1l
         oenpleSKxTlFVnFwRfbYga9GWDaSP2DW3icKne3t0XfTZPx40lToiQdpU03KXCLtOdO6
         Ll6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d72si4165015ybc.432.2017.11.14.07.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Nov 2017 07:48:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEdRS-0006Ki-3j
	for alex.bennee@linaro.org; Tue, 14 Nov 2017 10:48:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1eEdRF-0006JN-Ty
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 10:47:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1eEdRC-00017m-Ne
	for qemu-arm@nongnu.org; Tue, 14 Nov 2017 10:47:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1eEdRC-00014B-HL; Tue, 14 Nov 2017 10:47:46 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4FBC68694;
	Tue, 14 Nov 2017 15:47:40 +0000 (UTC)
Received: from t450s.home (ovpn-116-16.phx2.redhat.com [10.3.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CD4BA2923;
	Tue, 14 Nov 2017 15:47:36 +0000 (UTC)
Date: Tue, 14 Nov 2017 08:47:35 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: <zhuyijun@huawei.com>
Message-ID: <20171114084735.68e87546@t450s.home>
In-Reply-To: <1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
References: <1510622154-17224-1-git-send-email-zhuyijun@huawei.com>
	<1510622154-17224-2-git-send-email-zhuyijun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 14 Nov 2017 15:47:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 1/5] hw/vfio: Add function for
 getting reserved_region of device iommu group
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org,
	shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R3PG9VwZ9Fo6

On Tue, 14 Nov 2017 09:15:50 +0800
<zhuyijun@huawei.com> wrote:

> From: Zhu Yijun <zhuyijun@huawei.com>
> 
> With kernel 4.11, iommu/smmu will populate the MSI IOVA reserved window and
> PCI reserved window which has to be excluded from Guest iova allocations.
> 
> However, If it falls within the Qemu default virtual memory address space,
> then reserved regions may get allocated for a Guest VF DMA iova and it will
> fail.
> 
> So get those reserved regions in this patch and create some holes in the Qemu
> ram address in next patchset.
> 
> Signed-off-by: Zhu Yijun <zhuyijun@huawei.com>
> ---
>  hw/vfio/common.c              | 67 +++++++++++++++++++++++++++++++++++++++++++
>  hw/vfio/pci.c                 |  2 ++
>  hw/vfio/platform.c            |  2 ++
>  include/exec/memory.h         |  7 +++++
>  include/hw/vfio/vfio-common.h |  3 ++
>  5 files changed, 81 insertions(+)

I generally prefer the vfio interface to be more self sufficient, if
there are regions the IOMMU cannot map, we should be describing those
via capabilities on the container through the vfio interface.  If we're
just scraping together things from sysfs, the user can just as easily
do that and provide an explicit memory map for the VM taking the
devices into account.  Of course having a device associated with a
restricted memory map that conflicts with the default memory map for
the VM implies that you can never support hot-add of such devices.
Please cc me on vfio related patches.  Thanks,

Alex
