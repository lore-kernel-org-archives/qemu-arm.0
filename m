Received: by 10.182.158.201 with SMTP id ww9csp1069327obb;
        Fri, 18 Dec 2015 05:29:34 -0800 (PST)
X-Received: by 10.55.77.202 with SMTP id a193mr4895854qkb.48.1450445374441;
        Fri, 18 Dec 2015 05:29:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c191si16241619qka.29.2015.12.18.05.29.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 05:29:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9v6E-0007pG-4z
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 08:29:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9v6C-0007mx-DL
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 08:29:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a9v6B-0006bK-HI
	for qemu-arm@nongnu.org; Fri, 18 Dec 2015 08:29:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a9v6B-0006bE-Aa; Fri, 18 Dec 2015 08:29:31 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id F2339693FD;
	Fri, 18 Dec 2015 13:29:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-44.phx2.redhat.com
	[10.3.113.44])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBIDTTJY007456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 18 Dec 2015 08:29:30 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B11D7303F81B; Fri, 18 Dec 2015 14:29:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <1450370121-5768-1-git-send-email-armbru@redhat.com>
	<1450370121-5768-8-git-send-email-armbru@redhat.com>
Date: Fri, 18 Dec 2015 14:29:28 +0100
In-Reply-To: <1450370121-5768-8-git-send-email-armbru@redhat.com> (Markus
	Armbruster's message of "Thu, 17 Dec 2015 17:35:15 +0100")
Message-ID: <87h9jfc2br.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v3 07/13] hw/arm/virt: Fix property
	"gic-version" error handling
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
X-TUID: 2Ez0wk7hDSO5

Markus Armbruster <armbru@redhat.com> writes:

> virt_set_gic_version() calls exit(1) when passed an invalid property
> value.  Property setters are not supposed to do that.  Screwed up in
> commit b92ad39.  Harmless, because the property belongs to a machine.
> Set an error object instead.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/virt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9c6792c..2a120dd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1126,9 +1126,8 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>      } else if (!strcmp(value, "host")) {
>          vms->gic_version = 0; /* Will probe later */
>      } else {
> -        error_report("Invalid gic-version option value");
> -        error_printf("Allowed gic-version values are: 3, 2, host\n");
> -        exit(1);
> +        error_setg(errp, "Invalid gic-version value");
> +        error_append_hint(errp, "Valid values are: 3, 2, host\n");
>      }
>  }

Should be "Valid values are 3, 2, host.\n" for consistency with similar
hints elsewhere.
