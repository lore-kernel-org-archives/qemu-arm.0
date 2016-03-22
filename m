Received: by 10.25.208.211 with SMTP id h202csp2038386lfg;
        Tue, 22 Mar 2016 11:29:51 -0700 (PDT)
X-Received: by 10.140.107.118 with SMTP id g109mr28228857qgf.89.1458671391378;
        Tue, 22 Mar 2016 11:29:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m80si12137050qkh.76.2016.03.22.11.29.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 11:29:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiR3u-0005Gb-S7
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 14:29:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiR3s-0005E7-1n
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 14:29:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aiR3r-0002DI-6E
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 14:29:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52421)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aiR3r-0002DE-0c; Tue, 22 Mar 2016 14:29:47 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 97DF4C049D60;
	Tue, 22 Mar 2016 18:29:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-41.ams2.redhat.com
	[10.36.116.41])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MITjuj021052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Mar 2016 14:29:46 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AD7A2303F90D; Tue, 22 Mar 2016 19:29:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
Date: Tue, 22 Mar 2016 19:29:44 +0100
In-Reply-To: <1458271654-23706-2-git-send-email-peterx@redhat.com> (Peter Xu's
	message of "Fri, 18 Mar 2016 11:27:30 +0800")
Message-ID: <87zitqjrhj.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, abologna@redhat.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 1/5] arm: qmp: add
	GICCapability struct
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
X-TUID: D1EEnta+vrWo

Peter Xu <peterx@redhat.com> writes:

> Define new struct to describe whether we support specific GIC version.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  qapi-schema.json | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/qapi-schema.json b/qapi-schema.json
> index f253a37..da9671a 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -4134,3 +4134,25 @@
>  ##
>  { 'enum': 'ReplayMode',
>    'data': [ 'none', 'record', 'play' ] }
> +
> +##
> +# @GICCapability:
> +#
> +# This struct describes capability for a specific GIC version. These
> +# bits are not only decided by QEMU/KVM software version, but also
> +# decided by the hardware that the program is running upon.
> +#
> +# @version:  version of GIC to be described.
> +#
> +# @emulated: whether current QEMU/hardware supports emulated GIC
> +#            device in user space.
> +#
> +# @kernel:   whether current QEMU/hardware supports hardware
> +#            accelerated GIC device in kernel.
> +#
> +# Since: 2.6
> +##
> +{ 'struct': 'GICCapability',
> +  'data': { 'version': 'int',
> +            'emulated': 'bool',
> +            'kernel': 'bool' } }

Are all four combinations of (emulated, kernel) possible?
