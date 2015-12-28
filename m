Received: by 10.182.158.201 with SMTP id ww9csp6503208obb;
        Sun, 27 Dec 2015 17:59:12 -0800 (PST)
X-Received: by 10.140.251.215 with SMTP id w206mr68224563qhc.73.1451267952398;
        Sun, 27 Dec 2015 17:59:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f48si62536199qgd.70.2015.12.27.17.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Dec 2015 17:59:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDN5c-0002ho-4r
	for alex.bennee@linaro.org; Sun, 27 Dec 2015 20:59:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDN5Z-0002hR-4e
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 20:59:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDN5V-00067c-VO
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 20:59:09 -0500
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:33963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1aDN5V-00067Y-Qh; Sun, 27 Dec 2015 20:59:05 -0500
Received: by mail-qk0-x22e.google.com with SMTP id p187so191087845qkd.1;
	Sun, 27 Dec 2015 17:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=iMCp/oJr31zaNJIYdhAvkR5knsS/dthQ4xmg4fhAq9o=;
	b=ki/ZCULJxz5SMWD6ifxrGjCWKc0ZxC1Mz3WZurgYE89DL/dR0USZLOZdv+5rCM9T1d
	2/UymuVAy6ALO3s7Z3EPE/XdwE4MghjwIEp1LkyrkIKWhEPu8nJpGVkiaX2pRdWF1hp9
	UX7RJD1G5k/TXbrzJLCGTRsab0daoxIKCqnixz0uakTlAkTS1ZqtYxZl1ieZswDgBmA9
	wzRHlJponk6kmLyLvd+SLmVIsciSlPv9muV2UZiRA6YNAT6YPe0gD0o7rcWMdcsDJo1b
	JoRZcLZqelp7WJLkRKqTAUPahINd6TZObpOrNfM+d7JssM+KwJjqep8zjwMTduq2Mwj5
	v8Ig==
X-Received: by 10.55.221.21 with SMTP id n21mr57751540qki.5.1451267945315;
	Sun, 27 Dec 2015 17:59:05 -0800 (PST)
Received: from [10.0.1.200] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	y129sm26617859qka.33.2015.12.27.17.59.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Dec 2015 17:59:04 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-7-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA_qbaJjuZQB91dsN11U3pJRBXCJ25i00U1G8gu4OQFCtg@mail.gmail.com>
	<CAFEAcA8gajKJgAfGn3DZ432+a+KVFDziarpnsG2jRH2e-4pavA@mail.gmail.com>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <56809768.3070902@gmail.com>
Date: Sun, 27 Dec 2015 20:59:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8gajKJgAfGn3DZ432+a+KVFDziarpnsG2jRH2e-4pavA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22e
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
X-TUID: M1kqZZpx6WS8

On 12/17/2015 10:18 AM, Peter Maydell wrote:
> On 17 December 2015 at 14:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>>> Despite having the same notation, these bits
>>> have completely different meaning than -AR.
>>>
>>> Use armv7m_excp_running_prio() and the highest
>>> pending exception priority to determine
>>> if the pending exception can interrupt preempt.
>>> ---
>>>  target-arm/cpu.c | 16 ++++++----------
>>>  1 file changed, 6 insertions(+), 10 deletions(-)
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ...except this breaks the build for linux-user:
>
>   LINK  arm-linux-user/qemu-arm
> target-arm/cpu.o: In function `arm_v7m_cpu_exec_interrupt':
> /home/petmay01/linaro/qemu-from-laptop/qemu/target-arm/cpu.c:316:
> undefined reference to `armv7m_excp_running_prio'
>
> because the function you're calling here is in armv7m_nvic.c,
> which isn't compiled into the linux-user binary.

Is there any reason to include the armv7m code in linux-user at all?

