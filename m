Received: by 10.182.158.201 with SMTP id ww9csp1646338obb;
        Mon, 14 Dec 2015 02:07:25 -0800 (PST)
X-Received: by 10.140.234.22 with SMTP id f22mr18654340qhc.19.1450087645087;
        Mon, 14 Dec 2015 02:07:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e33si34272568qga.24.2015.12.14.02.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Dec 2015 02:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8Q2O-0003Oq-Jw
	for alex.bennee@linaro.org; Mon, 14 Dec 2015 05:07:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1a8Q2M-0003OQ-9R
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 05:07:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1a8Q2I-000516-97
	for qemu-arm@nongnu.org; Mon, 14 Dec 2015 05:07:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47026)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1a8Q2I-00050x-3V; Mon, 14 Dec 2015 05:07:18 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 0B13BC0C7CA0;
	Mon, 14 Dec 2015 10:07:16 +0000 (UTC)
Received: from [10.36.5.81] (vpn1-5-81.ams2.redhat.com [10.36.5.81])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBEA7BYg031611
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 14 Dec 2015 05:07:13 -0500
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1449743372-17169-1-git-send-email-armbru@redhat.com>
	<1449743372-17169-2-git-send-email-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <566E94CA.40202@redhat.com>
Date: Mon, 14 Dec 2015 11:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449743372-17169-2-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 01/12] hw: Don't use hw_error()
 for machine initialization errors
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
X-TUID: oT17lMQalmpl

On 10/12/15 11:29, Markus Armbruster wrote:
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
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/alpha/dp264.c          | 11 ++++++-----
>  hw/arm/highbank.c         |  6 ++++--
>  hw/char/exynos4210_uart.c |  9 ++++++---
>  hw/m68k/an5206.c          |  4 +++-
>  hw/ppc/mac_newworld.c     | 11 ++++++-----
>  hw/ppc/mac_oldworld.c     | 16 +++++++++-------
>  hw/ppc/prep.c             | 10 ++++++----
>  hw/unicore32/puv3.c       | 10 +++++++---
>  8 files changed, 47 insertions(+), 30 deletions(-)
[...]
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index 5ad28f7..8f08f07 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -33,6 +33,7 @@
>  #include "hw/pci/pci_host.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/boards.h"
> +#include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "hw/ide.h"
>  #include "hw/loader.h"
> @@ -532,7 +533,7 @@ static void ppc_prep_init(MachineState *machine)
>          kernel_size = load_image_targphys(kernel_filename, kernel_base,
>                                            ram_size - kernel_base);
>          if (kernel_size < 0) {
> -            hw_error("qemu: could not load kernel '%s'\n", kernel_filename);
> +            error_report("could not load kernel '%s'", kernel_filename);
>              exit(1);
>          }
>          /* load initrd */
> @@ -541,8 +542,8 @@ static void ppc_prep_init(MachineState *machine)
>              initrd_size = load_image_targphys(initrd_filename, initrd_base,
>                                                ram_size - initrd_base);
>              if (initrd_size < 0) {
> -                hw_error("qemu: could not load initial ram disk '%s'\n",
> -                          initrd_filename);
> +                error_report("could not load initial ram disk '%s'",
> +                             initrd_filename);

Shouldn't you add an "exit(1)" here, too?

>              }
>          } else {
>              initrd_base = 0;

Apart from the missing exit(), the patch looks like a good idea to me.

 Thomas

