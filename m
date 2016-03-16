Received: by 10.25.208.211 with SMTP id h202csp1087067lfg;
        Wed, 16 Mar 2016 03:25:03 -0700 (PDT)
X-Received: by 10.141.5.137 with SMTP id h131mr4047530qhd.47.1458123903738;
        Wed, 16 Mar 2016 03:25:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si2702532qkb.17.2016.03.16.03.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 03:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag8dT-000538-9W
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 06:25:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8dQ-00052n-Ge
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8dP-0002EN-Jh
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:25:00 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ag8dP-0002EB-Ey
	for qemu-arm@nongnu.org; Wed, 16 Mar 2016 06:24:59 -0400
Received: by mail-vk0-x22c.google.com with SMTP id e6so55711878vkh.2
	for <qemu-arm@nongnu.org>; Wed, 16 Mar 2016 03:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i6ENqaUZ31Bp1pxtosQjZO4Lg0pLpNfd2+C2CvNZmvE=;
	b=ON6rYUJBRIlKJXxbEcLoW5ahSSg1+Ajh4ixXO7hk/F37b1wZDXoRPM9DebZhMzpMWU
	+HenKAfJaSWjTnG8Oz95hrvejkYO/AQbbbNfwf76msTuWAPp6/Ex+Fcks7IfOdoqNZE4
	oM50307CDPkNj3bJh3tCct+YATx6eFYjVvVLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i6ENqaUZ31Bp1pxtosQjZO4Lg0pLpNfd2+C2CvNZmvE=;
	b=WJaeJHEe4RkUoe/DvnnYERJwAJCSqZ1PYgbfyPXHmR3mj/NOvUlt7zlx48TYwGPXQ+
	/QHdnA9dlTLUK8/T2fuid/6Kh8SXrz1UgkqZW2PkIG4rD+LI5DuDqChazTpFyfH5ra3o
	eg1edegqZRDCq+040esO7tuMxORcVhDIDT7aPYKDAT8ADgVeDWZWvWN/q+5Tl8pgdORt
	gf0vznfWyn88/1VfUcxaJRn52N8PuAgnELla9B5FZP6UAOWMCP72uqtyD4TzJ00a/WKh
	bB1H6SOHQPE1aGBgJ+LnSofc+eSb9GHPvepfC3BZXQbYjBNuq5jzcAEAOOvwmotX679q
	X3+w==
X-Gm-Message-State: AD7BkJKCIzGeYIjr7LellmY3f3T/Op8C7bv3nhURSonYHkkJdIqjDd/FcW2sNd9p713WwwBkk47+AoE6+BIU5rW2
X-Received: by 10.31.47.207 with SMTP id v198mr3384272vkv.6.1458123899061;
	Wed, 16 Mar 2016 03:24:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 16 Mar 2016 03:24:39 -0700 (PDT)
In-Reply-To: <1457422582-28799-3-git-send-email-peterx@redhat.com>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
	<1457422582-28799-3-git-send-email-peterx@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 10:24:39 +0000
Message-ID: <CAFEAcA9jCwLnG5QKTG9Hd+r8tVYSN6A8dwWp2JMPV1rMUAAjLQ@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 2/3] arm: qmp: add query-gic-capabilities
	interface
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
X-TUID: A24HRVMNF/Mi

On 8 March 2016 at 07:36, Peter Xu <peterx@redhat.com> wrote:
> This patch adds the command "query-gic-capabilities" but not implemnet
> it. The command is ARM-only. Return of the command is a list of
> GICCapability struct that describes all GIC versions that current QEMU
> and system support.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  monitor.c            |  8 ++++++++
>  qapi-schema.json     | 11 +++++++++++
>  qmp-commands.hx      | 26 ++++++++++++++++++++++++++
>  scripts/qapi.py      |  1 +
>  target-arm/machine.c |  6 ++++++
>  5 files changed, 52 insertions(+)
>
> diff --git a/monitor.c b/monitor.c
> index 73eac17..9e8cbdb 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4241,3 +4241,11 @@ void qmp_dump_skeys(const char *filename, Error **errp)
>      error_setg(errp, QERR_FEATURE_DISABLED, "dump-skeys");
>  }
>  #endif
> +
> +#ifndef TARGET_ARM
> +GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
> +{
> +    error_setg(errp, QERR_FEATURE_DISABLED, "query-gic-capabilities");
> +    return NULL;
> +}
> +#endif

Given where we are in the release cycle I guess we need to do this,
but longer term we should sort out a structure so we can add
target-specific qmp and hmp commands without having to add more
TARGET_* ifdefs to common files...

> diff --git a/target-arm/machine.c b/target-arm/machine.c
> index 03a73d9..813909e 100644
> --- a/target-arm/machine.c
> +++ b/target-arm/machine.c
> @@ -5,6 +5,7 @@
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
>  #include "internals.h"
> +#include "qmp-commands.h"
>
>  static bool vfp_needed(void *opaque)
>  {
> @@ -345,3 +346,8 @@ const char *gicv3_class_name(void)
>
>      exit(1);
>  }
> +
> +GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
> +{
> +    return NULL;
> +}

Why is this here? machine.c is for migration code.

thanks
-- PMM
