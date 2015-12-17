Received: by 10.182.158.201 with SMTP id ww9csp388115obb;
        Thu, 17 Dec 2015 05:40:15 -0800 (PST)
X-Received: by 10.140.42.164 with SMTP id c33mr68659119qga.66.1450359615440;
        Thu, 17 Dec 2015 05:40:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a97si11373949qkh.49.2015.12.17.05.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 05:40:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9Yn0-0006JY-Va
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 08:40:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9Ymu-00069N-KE
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:40:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9Ymt-0000Y4-P6
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:40:08 -0500
Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c]:35481)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9Yms-0000Wy-IG
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 08:40:07 -0500
Received: by mail-oi0-x22c.google.com with SMTP id l9so13981303oia.2
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 05:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PWvwBJTtbPiPVjFEjhDKSVEX3rucV87Q88Mwtk6+DCs=;
	b=ZYcbd51uAgIYLEqMMOGq0esLwnzcS3EU+jbLGKZWORvOJ4HZdVU7TBAXu+bjC/2dyV
	dG0hgTokW0D+j3JxbnIRelCMJ+2F6onPtw/qQuAdK8XokyUgsrEBFFeFlpjQvQiOnacP
	jVp8vytPtEyoldva5h4KqYwfSOGOMx3Hr2Qqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PWvwBJTtbPiPVjFEjhDKSVEX3rucV87Q88Mwtk6+DCs=;
	b=NVTmVk1IbNtF29eNdfDEZdFBbjAtCaZBelO7Ho4mhg4ZTKAPw8vV1bUMD2pEFRLJKb
	sr2K0kpnKroYpl6AWEF5JAQNhMKEMkTwmTibZxrfF08P1qjmUuTZnP1TdA+VpRixvnUl
	GQwLAuR2l+ujgNCf5YZrvRFB+ZPpuzevGylJqKu/TU11S4sxa7Ec+26caPorTsx+OHEK
	XTreKeXfiDQBfwxz/9Wmr095dmSWG/5UGd5EJImk3LcTxPj9iSdm3wPzT07RrNaiTbEc
	IbBjiow6ztDpDfdO/gT+z2Rb//qAG9nCU1OxY5paJNLMljEOec7+PFpAc6wKVN5X33nE
	7Vlg==
X-Gm-Message-State: ALoCoQm6Qeqdk5YN+p//GFow5fq5HYxv6OoqYxAQWAc5F7BRIZvseopHiSN3pjn6ODCdFK/rpdoFwryev9kGflpEi2FzPzV8R+Ndnnab/QUCbZHUX1qCYKk=
X-Received: by 10.202.49.9 with SMTP id x9mr18354869oix.75.1450359606031; Thu,
	17 Dec 2015 05:40:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.52.97 with HTTP; Thu, 17 Dec 2015 05:39:46 -0800 (PST)
In-Reply-To: <1449804086-3464-11-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
	<1449804086-3464-11-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 13:39:46 +0000
Message-ID: <CAFEAcA8mxByuG1tTWKpcUUXKCh7yAH=AbB2WvgeyC2=9+0GJpQ@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22c
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v5 10/10] ARM: Virt: Add gpio-keys node for
	Poweroff using DT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Vh+4OIFgtGom

On 11 December 2015 at 03:21, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Add a gpio-keys node. This is used for Poweroff for the systems which
> use DT not ACPI.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cb1d45b..bd6781bd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -52,6 +52,7 @@
>  #include "kvm_arm.h"
>  #include "hw/smbios/smbios.h"
>  #include "qapi/visitor.h"
> +#include <linux/input.h>

You can't include <linux/> headers -- this will cause the build to
fail on non-Linux hosts. You need "standard-headers/linux/input.h"
(which is what I suggested you use initially).

I'll fix this up in my tree.

thanks
-- PMM
