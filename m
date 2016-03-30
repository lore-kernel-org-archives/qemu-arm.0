Received: by 10.25.208.211 with SMTP id h202csp2619625lfg;
        Wed, 30 Mar 2016 06:03:32 -0700 (PDT)
X-Received: by 10.140.223.17 with SMTP id t17mr9999012qhb.65.1459343012682;
        Wed, 30 Mar 2016 06:03:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c93si3560253qgd.124.2016.03.30.06.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Mar 2016 06:03:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54061 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alFmW-00059q-0n
	for alex.bennee@linaro.org; Wed, 30 Mar 2016 09:03:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1alFmP-00059Z-1c
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 09:03:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1alFmJ-0003il-Ed
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 09:03:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54550)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1alFmJ-0003iR-90; Wed, 30 Mar 2016 09:03:19 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 68D618E223;
	Wed, 30 Mar 2016 13:03:18 +0000 (UTC)
Received: from [10.36.112.32] (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2UD3FNE009339; Wed, 30 Mar 2016 09:03:15 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
References: <1459341140-16892-1-git-send-email-thuth@redhat.com>
	<56FBCDF1.3070909@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <56FBCE92.8000207@redhat.com>
Date: Wed, 30 Mar 2016 15:03:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <56FBCDF1.3070909@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, e.voevodin@samsung.com, i.mitsyanko@gmail.com,
	qemu-devel@nongnu.org, d.solodkiy@samsung.com, m.kozlov@samsung.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] MAINTAINERS: Delete invalid
 maintainer entries of the Exynos section
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
X-TUID: oCvcSXxlqlVq



On 30/03/2016 15:00, Laurent Vivier wrote:
> 
> 
> On 30/03/2016 14:32, Thomas Huth wrote:
>> Mails to these e-mail addresses are rejected by the mail server
>> of Samsung with "User unknown" messages, so it seems like these
>> Exynos maintainers are no longer available.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  MAINTAINERS | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index afbe845..12eb3fd 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -357,10 +357,7 @@ F: include/hw/timer/a9gtimer.h
>>  F: include/hw/timer/arm_mptimer.h
>>  
>>  Exynos
>> -M: Evgeny Voevodin <e.voevodin@samsung.com>
>> -M: Maksim Kozlov <m.kozlov@samsung.com>
>>  M: Igor Mitsyanko <i.mitsyanko@gmail.com>
>> -M: Dmitry Solodkiy <d.solodkiy@samsung.com>
>>  L: qemu-arm@nongnu.org
>>  S: Maintained
>>  F: hw/*/exynos*
>>
> 
> As you have removed all the maintainers, perhaps S: can be changed to
> "Orphan"?

Sorry, I've missed Igor is always here... I should change my glasses.

Laurent
