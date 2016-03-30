Received: by 10.25.208.211 with SMTP id h202csp2617774lfg;
        Wed, 30 Mar 2016 06:00:50 -0700 (PDT)
X-Received: by 10.140.106.11 with SMTP id d11mr9472572qgf.80.1459342850256;
        Wed, 30 Mar 2016 06:00:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a77si3613117qkb.23.2016.03.30.06.00.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Mar 2016 06:00:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54052 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alFjt-0003jL-SD
	for alex.bennee@linaro.org; Wed, 30 Mar 2016 09:00:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1alFjo-0003il-HC
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 09:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1alFjj-00033U-Gw
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 09:00:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53709)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1alFjj-00033M-9G; Wed, 30 Mar 2016 09:00:39 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C65B3C942C;
	Wed, 30 Mar 2016 13:00:37 +0000 (UTC)
Received: from [10.36.112.32] (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2UD0XSg028931; Wed, 30 Mar 2016 09:00:35 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
References: <1459341140-16892-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <56FBCDF1.3070909@redhat.com>
Date: Wed, 30 Mar 2016 15:00:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1459341140-16892-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com, i.mitsyanko@gmail.com,
	qemu-devel@nongnu.org, d.solodkiy@samsung.com, m.kozlov@samsung.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] MAINTAINERS: Delete invalid
 maintainer entries of the Exynos section
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
X-TUID: F6GJulPoM7hz



On 30/03/2016 14:32, Thomas Huth wrote:
> Mails to these e-mail addresses are rejected by the mail server
> of Samsung with "User unknown" messages, so it seems like these
> Exynos maintainers are no longer available.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index afbe845..12eb3fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -357,10 +357,7 @@ F: include/hw/timer/a9gtimer.h
>  F: include/hw/timer/arm_mptimer.h
>  
>  Exynos
> -M: Evgeny Voevodin <e.voevodin@samsung.com>
> -M: Maksim Kozlov <m.kozlov@samsung.com>
>  M: Igor Mitsyanko <i.mitsyanko@gmail.com>
> -M: Dmitry Solodkiy <d.solodkiy@samsung.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/exynos*
> 

As you have removed all the maintainers, perhaps S: can be changed to
"Orphan"?

Laurent
