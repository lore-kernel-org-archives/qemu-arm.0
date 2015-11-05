Received: by 10.182.105.169 with SMTP id gn9csp575667obb;
        Thu, 5 Nov 2015 08:55:22 -0800 (PST)
X-Received: by 10.31.149.76 with SMTP id x73mr7987655vkd.12.1446742522774;
        Thu, 05 Nov 2015 08:55:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v81si5285947vke.15.2015.11.05.08.55.22
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 08:55:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuNoo-0002Bd-GU
	for alex.bennee@linaro.org; Thu, 05 Nov 2015 11:55:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuNoh-0002BL-0N
	for qemu-arm@nongnu.org; Thu, 05 Nov 2015 11:55:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuNoe-0004Ia-Bw
	for qemu-arm@nongnu.org; Thu, 05 Nov 2015 11:55:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1ZuNoe-0004IW-77; Thu, 05 Nov 2015 11:55:12 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id A0DF936B365;
	Thu,  5 Nov 2015 16:55:11 +0000 (UTC)
Received: from [10.10.57.107] (vpn-57-107.rdu2.redhat.com [10.10.57.107])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA5Gt9Gq001801
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 Nov 2015 11:55:10 -0500
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446736357-17610-1-git-send-email-wei@redhat.com>
	<CAFEAcA_9bk0DONJPK3DtDN-_Ym53TDq-83pzGg9-JSt3LTdcNg@mail.gmail.com>
From: Wei Huang <wei@redhat.com>
Message-ID: <563B89ED.70606@redhat.com>
Date: Thu, 5 Nov 2015 10:55:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9bk0DONJPK3DtDN-_Ym53TDq-83pzGg9-JSt3LTdcNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH Trivial] hw/intc/arm_gic: Use pre-defined
 macro for cpu_num in code
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
X-TUID: aCivm1h7fEo9



On 11/05/2015 09:31 AM, Peter Maydell wrote:
> On 5 November 2015 at 15:12, Wei Huang <wei@redhat.com> wrote:
>> Given that there is a macro, NUM_CPU(s), defined for CPU number in
>> arm_gic.c, it is better to use it instead of using s->num_cpu in
>> this file. Code is more consistent after this change.
> 
> Hi. I think that actually since the NUM_CPU is just a relic from

Looks like the relic was from c988bfadc9cab. I prefer macro for this
case; but will fix based on your comments.

Thanks,
-Wei

> when it used to possibly defined as something other than s->num_cpu,
> we should go in the opposite direction, and remove the macro entirely
> in favour of just using s->num_cpu directly.
> 
> (PS: you forgot to cc qemu-devel.)
> 
> thanks
> -- PMM
> 
