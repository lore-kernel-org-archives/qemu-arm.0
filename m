Received: by 10.25.85.209 with SMTP id j200csp314301lfb;
        Fri, 10 Jun 2016 23:54:50 -0700 (PDT)
X-Received: by 10.237.56.97 with SMTP id j88mr5443942qte.94.1465628090114;
        Fri, 10 Jun 2016 23:54:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w30si2950323qtd.46.2016.06.10.23.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 23:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBcoj-0002o2-Jg
	for alex.bennee@linaro.org; Sat, 11 Jun 2016 02:54:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bBcof-0002nu-D4
	for qemu-arm@nongnu.org; Sat, 11 Jun 2016 02:54:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bBcob-0007QO-9R
	for qemu-arm@nongnu.org; Sat, 11 Jun 2016 02:54:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36419)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bBcob-0007QC-3n; Sat, 11 Jun 2016 02:54:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14380D4019;
	Sat, 11 Jun 2016 06:54:40 +0000 (UTC)
Received: from [10.36.6.20] (vpn1-6-20.ams2.redhat.com [10.36.6.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5B6sZpv030837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 11 Jun 2016 02:54:37 -0400
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-8-git-send-email-drjones@redhat.com>
From: Thomas Huth <thuth@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <575BB5AB.3010509@redhat.com>
Date: Sat, 11 Jun 2016 08:54:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465580427-13596-8-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 11 Jun 2016 06:54:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 07/16] qom/cpu: make
 nr-cores, nr-threads real properties
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	Bharata B Rao <bharata@linux.vnet.ibm.com>, agraf@suse.de,
	pbonzini@redhat.com, imammedo@redhat.com, dgibson@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ymRQve1UnH0Q

On 10.06.2016 19:40, Andrew Jones wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  qom/cpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/qom/cpu.c b/qom/cpu.c
> index 751e992de8823..024cda3eb98c8 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -28,6 +28,7 @@
>  #include "exec/log.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/qdev-properties.h"
> =20
>  bool cpu_exists(int64_t id)
>  {
> @@ -342,6 +343,12 @@ static int64_t cpu_common_get_arch_id(CPUState *cp=
u)
>      return cpu->cpu_index;
>  }
> =20
> +static Property cpu_common_properties[] =3D {
> +    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores, 1),
> +    DEFINE_PROP_INT32("nr-threads", CPUState, nr_threads, 1),
> +    DEFINE_PROP_END_OF_LIST()
> +};

Are you aware of the current CPU hotplug discussion that is going on?
I'm not very involved there, but I think some of these reworks also move
"nr_threads" into the CPU state already, e.g. see:

https://github.com/dgibson/qemu/commit/9d07719784ecbeebea71

... so you might want to check these patches first to see whether you
can base your rework on them?

 Thomas

