Received: by 10.25.205.13 with SMTP id d13csp1567013lfg;
        Mon, 12 Dec 2016 02:57:51 -0800 (PST)
X-Received: by 10.237.61.98 with SMTP id h31mr88678698qtf.243.1481540271246;
        Mon, 12 Dec 2016 02:57:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n66si15955809qkc.25.2016.12.12.02.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Dec 2016 02:57:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGOIo-0001nT-Oz
	for alex.bennee@linaro.org; Mon, 12 Dec 2016 05:57:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGOHx-0001Tp-Uf
	for qemu-arm@nongnu.org; Mon, 12 Dec 2016 05:56:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGOHu-0005vm-UZ
	for qemu-arm@nongnu.org; Mon, 12 Dec 2016 05:56:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGOHu-0005vV-P1; Mon, 12 Dec 2016 05:56:54 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B435D8553F;
	Mon, 12 Dec 2016 10:56:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBCAuoxR022956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 12 Dec 2016 05:56:52 -0500
Date: Mon, 12 Dec 2016 11:56:50 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161212105650.3nguwm6yswqwlzqc@kamzik.brq.redhat.com>
References: <1481301020-21777-1-git-send-email-peter.maydell@linaro.org>
	<1481301020-21777-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481301020-21777-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 12 Dec 2016 10:56:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/4] hw/arm/virt: Rename 'vbi' variables to
 'vms'
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z39OWTcALfFE

On Fri, Dec 09, 2016 at 04:30:19PM +0000, Peter Maydell wrote:
> Rename all the variables which used to be VirtBoardInfo*
> and are now VirtMachineState* so their names are in line
> with the type being used.
> 
> Apart from the removal of the line 'VirtMachineState *vbi = vms;'
> this commit is purely a search-and-replace of 'vbi' with 'vms'.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c | 489 +++++++++++++++++++++++++++++-----------------------------
>  1 file changed, 244 insertions(+), 245 deletions(-)

We obviously need this patch, it's just a shame that git history
digging will become a bit harder after it's committed. While we
may be pretty confident we won't need another patch like it
(vms forever!), we could add another patch or two to help prepare.
I see that nearly half the uses of 'vbi' are for 'vbi->fdt'. We could
add local 'fdt = vbi->fdt' aliases in all functions that need
it. We can do the same with 'vbi->memmap/irqmap', which would
eliminate another 57. Finally machvirt_init could easly replace 9
'vbi->bootinfo's with a bootinfo alias. That would only leave
about 60 lines (currently, and not including the new local variable
definitions) that would need to be changed on another renaming.
Of those 60, 45 can't be changed, as they're referencing just 'vbi'.
So we'd only leave 15 lines exposed to risk of additional renaming
churn.

Thanks,
drew
