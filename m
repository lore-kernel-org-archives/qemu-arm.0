Received: by 10.25.205.13 with SMTP id d13csp6354088lfg;
        Wed, 28 Dec 2016 05:14:39 -0800 (PST)
X-Received: by 10.55.112.66 with SMTP id l63mr28481145qkc.23.1482930879190;
        Wed, 28 Dec 2016 05:14:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v80si20225556qkv.311.2016.12.28.05.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Dec 2016 05:14:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cME3w-0000mu-CP
	for alex.bennee@linaro.org; Wed, 28 Dec 2016 08:14:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cME3r-0000lU-TI
	for qemu-arm@nongnu.org; Wed, 28 Dec 2016 08:14:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cME3o-00053D-Px
	for qemu-arm@nongnu.org; Wed, 28 Dec 2016 08:14:31 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54228)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cME3o-000530-K4; Wed, 28 Dec 2016 08:14:28 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE7C681229;
	Wed, 28 Dec 2016 13:14:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBSDEOOf001922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 28 Dec 2016 08:14:26 -0500
Date: Wed, 28 Dec 2016 14:14:23 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161228131423.jeyywk3uh6snkiqu@kamzik.brq.redhat.com>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-23-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481625384-15077-23-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 28 Dec 2016 13:14:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 22/23] target-arm: Enable EL2
 feature bit on A53 and A57
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
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kADpPpnXS4Av

On Tue, Dec 13, 2016 at 10:36:23AM +0000, Peter Maydell wrote:
> Enable the ARM_FEATURE_EL2 bit on Cortex-A52 and
> Cortex-A57, since this is all now sufficiently implemented
> to work with the GICv3. We provide the usual CPU property
> to disable it for backwards compatibility with the older
> virt boards.
> 
> In this commit, we disable the EL2 feature on the
> virt and ZynpMP boards, so there is no overall effect.
> Another commit will expose a board-level property to
> allow the user to enable EL2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h     |  2 ++
>  hw/arm/virt.c        |  4 ++++
>  hw/arm/xlnx-zynqmp.c |  2 ++
>  target-arm/cpu.c     | 12 ++++++++++++
>  target-arm/cpu64.c   |  2 ++
>  5 files changed, 22 insertions(+)
>

Reviewed-by: Andrew Jones <drjones@redhat.com> 
