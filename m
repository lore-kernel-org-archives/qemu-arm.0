Received: by 10.182.105.169 with SMTP id gn9csp283827obb;
        Thu, 12 Nov 2015 03:39:54 -0800 (PST)
X-Received: by 10.31.142.132 with SMTP id q126mr2463408vkd.80.1447328394115;
        Thu, 12 Nov 2015 03:39:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 198si2080535vkh.196.2015.11.12.03.39.53
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 12 Nov 2015 03:39:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwqEL-00047r-Nr
	for alex.bennee@linaro.org; Thu, 12 Nov 2015 06:39:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZwqE0-0003mR-NP
	for qemu-devel@nongnu.org; Thu, 12 Nov 2015 06:39:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZwqDz-00068f-RE
	for qemu-devel@nongnu.org; Thu, 12 Nov 2015 06:39:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49414)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1ZwqDv-000688-Md; Thu, 12 Nov 2015 06:39:27 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 3DCEAA0B31;
	Thu, 12 Nov 2015 11:39:27 +0000 (UTC)
Received: from redhat.com (ovpn-116-139.ams2.redhat.com [10.36.116.139])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id tACBdOpM024391; Thu, 12 Nov 2015 06:39:25 -0500
Date: Thu, 12 Nov 2015 13:39:24 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20151112133747-mutt-send-email-mst@redhat.com>
References: <1447278167-320-1-git-send-email-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447278167-320-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] nseries: Don't use qemu_hw_version()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9N2ydtUzpdFW

On Wed, Nov 11, 2015 at 07:42:47PM -0200, Eduardo Habkost wrote:
> nseries doesn't use qemu_set_hw_version() and doesn't need the
> compatibility magic of qemu_hw_version(). Use QEMU_VERSION
> directly.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

This looks very wrong.
We should be reducing the users of QEMU_VERSION,
not adding more.


> ---
>  hw/arm/nseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 2a8835e..f1eab73 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -1275,7 +1275,7 @@ static int n8x0_atag_setup(void *p, int model)
>      strcpy((void *) w, "hw-build");		/* char component[12] */
>      w += 6;
>      strcpy((void *) w, "QEMU ");
> -    pstrcat((void *) w, 12, qemu_hw_version()); /* char version[12] */
> +    pstrcat((void *) w, 12, QEMU_VERSION); /* char version[12] */
>      w += 6;
>  
>      tag = (model == 810) ? "1.1.10-qemu" : "1.1.6-qemu";
> -- 
> 2.1.0
