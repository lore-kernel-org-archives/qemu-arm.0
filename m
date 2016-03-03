Received: by 10.25.208.211 with SMTP id h202csp2650454lfg;
        Thu, 3 Mar 2016 03:56:11 -0800 (PST)
X-Received: by 10.140.160.214 with SMTP id g205mr2474194qhg.88.1457006170848;
        Thu, 03 Mar 2016 03:56:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t90si40758179qgd.103.2016.03.03.03.56.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 03:56:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abRrW-0000ey-99
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 06:56:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1abRrP-0000dB-2e
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 06:56:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1abRrJ-0000z2-Vp
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 06:56:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1abRrJ-0000yi-Om; Thu, 03 Mar 2016 06:55:57 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 60D34C00F231;
	Thu,  3 Mar 2016 11:55:56 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-251.brq.redhat.com [10.34.1.251])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23BtpYx028078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 3 Mar 2016 06:55:54 -0500
Date: Thu, 3 Mar 2016 12:55:51 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20160303115551.oaswd6litrm2tz3v@hawk.localdomain>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
	<1456993272-32292-3-git-send-email-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456993272-32292-3-git-send-email-peterx@redhat.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, mdroth@linux.vnet.ibm.com, armbru@redhat.com,
	abologna@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/3] arm: qmp: add
 query-gic-capability interface
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
X-TUID: 5aVmhUtV9ZTR

On Thu, Mar 03, 2016 at 04:21:11PM +0800, Peter Xu wrote:
> This implement the command "query-gic-capability" but not implemnet
> it. The command is ARM-only. Return of the command is a list of
> GICCapability struct that describes all GIC versions that current
> QEMU and system support.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  monitor.c            |  8 ++++++++
>  qapi-schema.json     | 11 +++++++++++
>  qmp-commands.hx      | 26 ++++++++++++++++++++++++++
>  scripts/qapi.py      |  1 +
>  target-arm/machine.c |  7 +++++++
>  5 files changed, 53 insertions(+)
> 
> diff --git a/monitor.c b/monitor.c
> index 73eac17..3b34feb 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4241,3 +4241,11 @@ void qmp_dump_skeys(const char *filename, Error **errp)
>      error_setg(errp, QERR_FEATURE_DISABLED, "dump-skeys");
>  }
>  #endif
> +
> +#ifndef TARGET_ARM
> +GICCapabilityList *qmp_query_gic_capability(Error **errp)
> +{
> +    error_setg(errp, QERR_FEATURE_DISABLED, "query-gic-capability");
> +    return NULL;
> +}
> +#endif
> diff --git a/qapi-schema.json b/qapi-schema.json
> index 0b2de6c..f42c8f7 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -4157,3 +4157,14 @@
>    'data': { 'version': 'int',
>              'emulated': 'bool',
>              'kernel': 'bool' } }
> +
> +##
> +# @query-gic-capability:
> +#
> +# Return a list of supported GIC version capabilities.
> +#
> +# Returns: a list of GICCapability.
> +#
> +# Since: 2.6
> +##
> +{ 'command': 'query-gic-capability', 'returns': ['GICCapability'] }
> diff --git a/qmp-commands.hx b/qmp-commands.hx
> index 13f158d..5e843f2 100644
> --- a/qmp-commands.hx
> +++ b/qmp-commands.hx
> @@ -4852,3 +4852,29 @@ Example:
>                   {"type": 0, "out-pport": 0, "pport": 0, "vlan-id": 3840,
>                    "pop-vlan": 1, "id": 251658240}
>     ]}
> +
> +EQMP
> +
> +#if defined TARGET_ARM
> +    {
> +        .name       = "query-gic-capability",
> +        .args_type  = "",
> +        .mhandler.cmd_new = qmp_marshal_query_gic_capability,
> +    },
> +#endif
> +
> +SQMP
> +query-gic-capability
> +---------------
> +
> +Return a list of supported ARM GIC versions and their capabilities.
> +
> +Arguments: None
> +
> +Example:
> +
> +-> { "execute": "query-gic-capability" }
> +<- { "return": [{ "version": 2, "emulated": true, "kernel": false },
> +                { "version": 3, "emulated": false, "kernel": true } ] }
> +
> +EQMP
> diff --git a/scripts/qapi.py b/scripts/qapi.py
> index 8497777..9dc8f73 100644
> --- a/scripts/qapi.py
> +++ b/scripts/qapi.py
> @@ -46,6 +46,7 @@ returns_whitelist = [
>      'query-tpm-models',
>      'query-tpm-types',
>      'ringbuf-read',
> +    'query-gic-capability',
>  
>      # From QGA:
>      'guest-file-open',
> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 03a73d9..b3fa64c 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -345,3 +345,10 @@ const char *gicv3_class_name(void)
>  
>      exit(1);
>  }
> +
> +GICCapabilityList *qmp_query_gic_capability(Error **errp);

I don't know anything about QMP, so just offering a superficial
review comment. Is the prototype necessary here? It seems redundant,
considering the function is defined right below.

drew

> +
> +GICCapabilityList *qmp_query_gic_capability(Error **errp)
> +{
> +    return NULL;
> +}
> -- 
> 2.4.3
> 
> 
