Received: by 10.25.205.13 with SMTP id d13csp3229851lfg;
        Wed, 21 Dec 2016 07:23:54 -0800 (PST)
X-Received: by 10.55.101.151 with SMTP id z145mr5088375qkb.35.1482333834221;
        Wed, 21 Dec 2016 07:23:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j33si15231865qtb.178.2016.12.21.07.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Dec 2016 07:23:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cJikB-0001hO-LP
	for alex.bennee@linaro.org; Wed, 21 Dec 2016 10:23:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cJiix-0007j6-BA
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 10:22:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cJiis-0001yN-VL
	for qemu-arm@nongnu.org; Wed, 21 Dec 2016 10:22:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cJiis-0001wu-Q9; Wed, 21 Dec 2016 10:22:30 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6EE8A34156B;
	Wed, 21 Dec 2016 15:22:29 +0000 (UTC)
Received: from localhost (ovpn-116-3.gru2.redhat.com [10.97.116.3])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBLFMSra018747; Wed, 21 Dec 2016 10:22:28 -0500
Date: Wed, 21 Dec 2016 13:22:26 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20161221152226.GH3808@thinpad.lan.raisama.net>
References: <20161201170624.26496-1-lersek@redhat.com>
	<148227487620.73.10055858460424473693@790289a7ca88>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <148227487620.73.10055858460424473693@790289a7ca88>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 21 Dec 2016 15:22:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] checkpatch.pl false positive (was Re: [Qemu-devel]
 [PATCH v4 0/7] q35: add negotiable broadcast SMI)
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
Cc: peter.maydell@linaro.org, famz@redhat.com, mst@redhat.com,
	Eric Blake <eblake@redhat.com>, somlo@cmu.edu,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	michael@walle.cc, qemu-arm@nongnu.org, kraxel@redhat.com,
	zhaoshenglong@huawei.com, pbonzini@redhat.com, lersek@redhat.com,
	imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qogJXayWGgOi

On Tue, Dec 20, 2016 at 03:01:17PM -0800, no-reply@patchew.org wrote:
[...]
> Checking PATCH 4/7: hw/i386/pc: introduce 2.9 machine types with 0x20 fw_cfg file slots...
> ERROR: Macros with multiple statements should be enclosed in a do - while loop
> #126: FILE: include/hw/compat.h:4:
> +#define HW_COMPAT_2_8 \
> +    {\
> +        .driver   = "fw_cfg_mem",\
> +        .property = "file_slots",\
> +        .value    = stringify(0x10),\
> +    },{\
> +        .driver   = "fw_cfg_io",\
> +        .property = "file_slots",\
> +        .value    = stringify(0x10),\
> +    },
> 
> total: 1 errors, 0 warnings, 119 lines checked
> 
> Your patch has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.

It is a false positive, but how exactly can we fix it? Should it
become a warning instead of an error?

-- 
Eduardo
