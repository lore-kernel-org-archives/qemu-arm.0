Received: by 10.25.159.19 with SMTP id i19csp1395800lfe;
        Mon, 8 Feb 2016 07:30:46 -0800 (PST)
X-Received: by 10.140.145.72 with SMTP id 69mr36854628qhr.95.1454945446132;
        Mon, 08 Feb 2016 07:30:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si22780151qkr.25.2016.02.08.07.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 07:30:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:45771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSnm1-0005dO-IN
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 10:30:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSnly-0005aA-Ub
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:30:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSnly-0007YJ-1A
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:30:42 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSnlx-0007YC-Ke
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:30:41 -0500
Received: by mail-vk0-x22a.google.com with SMTP id e185so97280916vkb.1
	for <qemu-arm@nongnu.org>; Mon, 08 Feb 2016 07:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=J9eAVUq+6xaXXcAOD+Xd02O18h0iNubTVb9ZurD4t4k=;
	b=bll+xVB9KmEnsOxZipzBbbH3TmukVxJcBUyrvf4ViotEefZ2Y0qC6g+igPbDDCPCXH
	3NOgUeEop+n41t5KDDFtxD9vgwtZ+PAFvnAqDDbEcQW3G0UT6z+WEe906zlQVZ0m2T4P
	OCF3ayoHsWDd2WGkN1+lloPwhKqoILwcRRc7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J9eAVUq+6xaXXcAOD+Xd02O18h0iNubTVb9ZurD4t4k=;
	b=MsokcpcCNpktKZU3bvQplu1dP+5bWO+w3Vsh/45pcDBEWSkWM2E9Hom9hhf7AtGlIl
	gykp9O+ghAlaq8C4IMZnzGty3ei7Xz7ED/DswEPYsnxmTgxKg9xdpgi1PWel41U9NUGc
	ubOapUq+Mrndo1m8JJXcYUYor2HIY005eCBbzZeptckCjza5UuCkxTZ/gdHYbM+Oa6mA
	xyzCjDGIm4NuJxUo3dcQsj/WIymAOV0Nn0nbDEUdHwcHaAMDI+tagCsD8+79/b1daO4l
	1GnRtBcBJDNisRr0OQ3rk7SWfNIhPUaalqHplRBcHCzODklgpxgTfFAAw0JhuaDRlGvU
	1NGA==
X-Gm-Message-State: AG10YORXCs+RerSIDApI4mJB75240mNncjyRFj/WWDXGyvkaI6K6MklWXGHBeJ7BL9NWNtK9pqLcqtIspqCliag0
X-Received: by 10.31.194.130 with SMTP id s124mr20454654vkf.92.1454945441060; 
	Mon, 08 Feb 2016 07:30:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 07:30:21 -0800 (PST)
In-Reply-To: <56B8B366.1040203@gmail.com>
References: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
	<1454690704-16233-2-git-send-email-peter.maydell@linaro.org>
	<56B8B366.1040203@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 15:30:21 +0000
Message-ID: <CAFEAcA_t77uSZrT7fCvAKNeSPbJDyF8om8eMvHW7woXEvMcrvQ@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/6] target-arm: correct CNTFRQ
	access rights
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
X-TUID: GDMOt3tsse8f

On 8 February 2016 at 15:25, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 05.02.2016 19:44, Peter Maydell wrote:
>> Correct some corner cases we were getting wrong for
>> CNTFRQ access rights:
>>  * should UNDEF from 32-bit Secure EL1
>>  * only writable from the highest implemented exception level,
>>    which might not be EL1 now

>> +    switch (arm_current_el(env)) {
>> +    case 0:
>> +        if (!extract32(env->cp15.c14_cntkctl, 0, 2)) {
>> +            return CP_ACCESS_TRAP;
>> +        }
>> +        /* EL0 reads are forbidden by the .access fields */
>
> s/reads/writes/ ?

Yes.

>> +        break;
>> +    case 1:
>> +        if (!isread && (arm_feature(env, ARM_FEATURE_EL2)
>> +                        || arm_feature(env, ARM_FEATURE_EL3))) {
>> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
>> +        }
>> +        if (!isread && ri->state == ARM_CP_STATE_AA32 &&
>> +            arm_is_secure_below_el3(env)) {
>> +            /* Accesses from 32-bit Secure EL1 UNDEF (*not* trap to EL3!) */
>> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
>> +        }
>> +        break;
>> +    case 2:
>> +        if (!isread && arm_feature(env, ARM_FEATURE_EL3)) {
>> +            return CP_ACCESS_TRAP_UNCATEGORIZED;
>> +        }
>> +        break;
>> +    case 3:
>> +        break;
>>      }
>>      return CP_ACCESS_OK;
>>  }
>
> Maybe calculating "the highest implemented exception level" could
> simplify reading of the code a bit? E.g.:
>
>     int highest_el = arm_feature(env, ARM_FEATURE_EL3) ? 3 :
>                      arm_feature(env, ARM_FEATURE_EL2) ? 2 : 1;
>
> We would probably want to have a dedicated static inline function for
> this similar to HighestEL() from ARMv8 ARM pseudocode.

Mmm, that might look neater. I'll have a play with the code.

thanks
-- PMM
