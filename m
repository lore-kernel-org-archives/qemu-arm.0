Received: by 10.182.158.201 with SMTP id ww9csp427055obb;
        Thu, 17 Dec 2015 06:39:57 -0800 (PST)
X-Received: by 10.55.79.207 with SMTP id d198mr64883817qkb.49.1450363197156;
        Thu, 17 Dec 2015 06:39:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si11595015qge.32.2015.12.17.06.39.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 06:39:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54088 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9Zim-0008PZ-RX
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 09:39:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1a9Zi9-0007P0-QX
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 09:39:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1a9Zi5-00071I-UJ
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 09:39:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1a9Zi5-00071B-Oj; Thu, 17 Dec 2015 09:39:13 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 2E9A1C00126A;
	Thu, 17 Dec 2015 14:39:13 +0000 (UTC)
Received: from [10.36.6.136] (vpn1-6-136.ams2.redhat.com [10.36.6.136])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBHEd94N021716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 17 Dec 2015 09:39:11 -0500
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1450354795-31608-1-git-send-email-armbru@redhat.com>
	<1450354795-31608-2-git-send-email-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5672C90D.5060304@redhat.com>
Date: Thu, 17 Dec 2015 15:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1450354795-31608-2-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Markus Armbruster <armbru@pond.sub.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 01/13] hw: Don't use
 hw_error() for machine initialization errors
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
X-TUID: zshP3GNaKj+w

On 17/12/15 13:19, Markus Armbruster wrote:
> Printing CPU registers is not helpful during machine initialization.
> Moreover, these are straightforward configuration or "can get
> resources" errors, so dumping core isn't appropriate either.  Replace
> hw_error() by error_report(); exit(1).  Matches how we report these
> errors in other machine initializations.
> 
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Signed-off-by: Markus Armbruster <armbru@pond.sub.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/alpha/dp264.c          | 11 ++++++-----
>  hw/arm/highbank.c         |  6 ++++--
>  hw/char/exynos4210_uart.c |  9 ++++++---
>  hw/m68k/an5206.c          |  4 +++-
>  hw/ppc/mac_newworld.c     | 11 ++++++-----
>  hw/ppc/mac_oldworld.c     | 16 +++++++++-------
>  hw/ppc/prep.c             | 11 +++++++----
>  hw/unicore32/puv3.c       | 10 +++++++---
>  8 files changed, 48 insertions(+), 30 deletions(-)
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

