Received: by 10.182.158.201 with SMTP id ww9csp451478obb;
        Thu, 17 Dec 2015 07:19:01 -0800 (PST)
X-Received: by 10.140.228.68 with SMTP id y65mr62968816qhb.78.1450365541230;
        Thu, 17 Dec 2015 07:19:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y128si11709467qka.62.2015.12.17.07.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 07:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9aKa-0003DA-Sc
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 10:19:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9aKY-0003BH-F3
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:18:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9aKX-0008VY-Ly
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:18:58 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36735)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9aKX-0008VG-He
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:18:57 -0500
Received: by mail-vk0-x22b.google.com with SMTP id f2so9474884vkb.3
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 07:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NG2xLnuRXobikaTSFfc404W1Qkd1UgsmQyA0MO+6J7I=;
	b=L5LDaxyI9AqQY0OfYJWnisLOoCbAckeLRmFGJszEwwFCJMfaF789N8MgeJOEhOH4j0
	HIiLWI+MrlY7cptzuKTtY2YE8OC1HuE+xZN5tqwW/vHtVesN3XEeBWfvw7/P3C51S7Sl
	2q9T/HWRFWobYgH6AC3kEjeVYDAPCO4t/QiHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NG2xLnuRXobikaTSFfc404W1Qkd1UgsmQyA0MO+6J7I=;
	b=Bv5xoMuSZH1AIsm/eQJ3FZvBXCKuGKm7GvB9HjOXFrNz+d/XfRLSgjoR7puQzwJrSg
	RQGGqwcPgf9FDzAFTfoimDXCsfdNT0PTYSb0Nk4LWVv4YAf4Izraf1jS/eOlmITdHKlB
	Jt+2NgBezkI8KnwK+YYaaU5xB0SiFTrh0iI3hgeTjGKE3znM6orsjmHHCcy7KGj10Nkn
	6LheyAZSntzTx7wMFv/JxI5ZwoFei9hwoLyrnqfXUx3upbjXenoED5kc9BwYefhgeZCJ
	J/kg+l/bWIh3SDnqc0krl6sDlz12MFUxv3voA8eaZS/dUw3LiKs1/B0/ITA756Y8lfmP
	9QYg==
X-Gm-Message-State: ALoCoQnbO/F/QUTpD68Qe96BqQqgFsgbmpctaIPvdOM6nxg3uQ7EWLDzAeZYkutB7rNOQKkzKo9Y29q3QjNjKJcRNehXTz9KE28QqbbERUNy9OT0PIhjuAY=
X-Received: by 10.31.52.211 with SMTP id b202mr38961202vka.82.1450365536068;
	Thu, 17 Dec 2015 07:18:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 07:18:36 -0800 (PST)
In-Reply-To: <CAFEAcA_qbaJjuZQB91dsN11U3pJRBXCJ25i00U1G8gu4OQFCtg@mail.gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-7-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_qbaJjuZQB91dsN11U3pJRBXCJ25i00U1G8gu4OQFCtg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 15:18:36 +0000
Message-ID: <CAFEAcA8gajKJgAfGn3DZ432+a+KVFDziarpnsG2jRH2e-4pavA@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 06/26] armv7m: fix I and F flag handling
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
X-TUID: ekAngmZ8weXf

On 17 December 2015 at 14:39, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> Despite having the same notation, these bits
>> have completely different meaning than -AR.
>>
>> Use armv7m_excp_running_prio() and the highest
>> pending exception priority to determine
>> if the pending exception can interrupt preempt.
>> ---
>>  target-arm/cpu.c | 16 ++++++----------
>>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

...except this breaks the build for linux-user:

  LINK  arm-linux-user/qemu-arm
target-arm/cpu.o: In function `arm_v7m_cpu_exec_interrupt':
/home/petmay01/linaro/qemu-from-laptop/qemu/target-arm/cpu.c:316:
undefined reference to `armv7m_excp_running_prio'

because the function you're calling here is in armv7m_nvic.c,
which isn't compiled into the linux-user binary.

thanks
-- PMM
