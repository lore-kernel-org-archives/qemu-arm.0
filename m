Received: by 10.182.105.169 with SMTP id gn9csp591313obb;
        Thu, 5 Nov 2015 09:22:55 -0800 (PST)
X-Received: by 10.31.60.72 with SMTP id j69mr8307951vka.137.1446744175331;
        Thu, 05 Nov 2015 09:22:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p84si5395269vke.9.2015.11.05.09.22.55
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 09:22:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuOFS-0008I4-TW
	for alex.bennee@linaro.org; Thu, 05 Nov 2015 12:22:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuOFQ-0008Hx-ST
	for qemu-arm@nongnu.org; Thu, 05 Nov 2015 12:22:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuOFN-00052f-Ip
	for qemu-arm@nongnu.org; Thu, 05 Nov 2015 12:22:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1ZuOFN-00052W-DP; Thu, 05 Nov 2015 12:22:49 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 2B94FE7067;
	Thu,  5 Nov 2015 17:22:48 +0000 (UTC)
Received: from [10.10.57.107] (vpn-57-107.rdu2.redhat.com [10.10.57.107])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA5HMjbc022168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 Nov 2015 12:22:47 -0500
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, qemu-arm@nongnu.org
References: <1446743477-21579-1-git-send-email-wei@redhat.com>
	<563B8E48.8020407@suse.de>
From: Wei Huang <wei@redhat.com>
Message-ID: <563B9065.8060808@redhat.com>
Date: Thu, 5 Nov 2015 11:22:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <563B8E48.8020407@suse.de>
Content-Type: text/plain; charset=iso-8859-15
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH Trivial] hw/intc/arm_gic: Remove the
	definition of NUM_CPU
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
X-TUID: aQamj04qjyMV



On 11/05/2015 11:13 AM, Andreas F=E4rber wrote:
> Am 05.11.2015 um 18:11 schrieb Wei Huang:
>> arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
>> Such mixed-uses make source code inconsistent. This patch removes
>> NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
>> favors s->num_cpu. The source is more consistent after this tweak.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/intc/arm_gic.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> I don't mind either way, and it'll go through Peter's queue I guess,
>=20
> Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks. I sent out a wrong file which failed the compilation. So please
ignore this file.

Yeah, maybe through Peter's tree given that he is the maintainer of this
file.

-Wei

>=20
> Cheers,
> Andreas
>=20
