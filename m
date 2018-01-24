Received: by 10.28.71.27 with SMTP id u27csp424182wma;
        Wed, 24 Jan 2018 01:59:36 -0800 (PST)
X-Google-Smtp-Source: AH8x224y75C3sV7THXTM9/hCvdQN4u8z/GkHoSwrOH5uT3WiePkvmpJKOA2d2vXx8F28VxroR9f7
X-Received: by 10.129.193.73 with SMTP id e9mr4937269ywl.514.1516787976207;
        Wed, 24 Jan 2018 01:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516787976; cv=none;
        d=google.com; s=arc-20160816;
        b=juiH1PyC1ecQCVO7q3AkuQjRsyeH9XARAdbq8jv0oLa+ef1R9wh8Bkg7hwPA6D9v/5
         Lbp6HQNy7icSVdyQDETcmXaHd1KoGobvb3F7OOvDJ08TdmaUHr/LW2S0HKYSeZnK1hoi
         61PKHN/A+5zwNVZccNZe+MCeGgydXOr6ENJALA1ktjuP+GpwwfbRhv/2RUJZ7ozdSmEE
         dIYckbHrJy6fUaetq8ZU5n90SVykawa+IChkWuq1vwzvgOrJCVHUYLs/gB2np/Z1LSHR
         4WnoWmYrdGneueQVgRTeO4oTmJdlhypxNdG/O21j0/ydMGaGBA+ASKxp/aDL6KIBQf4X
         KX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=RlQWNoRe2B0Lbp1ZGnLG3KBMm+HSyQTisZT70nUA/V4=;
        b=Iuv0adEvaxtQwq/3ZMRG5sIFPDVbckNd4QhPP19ooZFMcrk48wLHkcKHV7H+FofzXD
         rtkda/6jJkffhFa6yHXB7r3x/WOjUyJL3oSpe7p8nO0Zq2lN92+vzZZbMrXy2rPsXZo6
         Y3mFSLhCDrcZqPcMqQzEew0WnPhayWobH5hSnerC8UzpJTg2L+guXf5r+PDFMU5V7Kub
         LcdHzdkGuHW+ptwu8HhVqral/GAig0Awu2B5T7RzVrhowvBjDE1Z08kob4NgPFyK9MZn
         KabH3DjiJNgT28oM42AQIBwvhNv9n+wnRgFYqLdjUxSSUXY0ORBr3I4WKtTqDHmnUOzo
         fZoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6si2348066ybu.303.2018.01.24.01.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 01:59:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeHqB-0007Ci-Lo
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 04:59:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eeHq0-0007Av-Vd
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 04:59:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eeHq0-00023n-3v
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 04:59:25 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50079)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eeHpt-0001ze-TM; Wed, 24 Jan 2018 04:59:18 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue005 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0Mb5Ch-1eLEqP3xlL-00Kf2B; Wed, 24 Jan 2018 10:59:07 +0100
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>
References: <39441aea4e2d05cc505ed3a373e81d3869eb994a.1516785202.git.agx@sigxcpu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7a025be3-2f5c-2970-339e-1dee6d80d15b@vivier.eu>
Date: Wed, 24 Jan 2018 10:59:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <39441aea4e2d05cc505ed3a373e81d3869eb994a.1516785202.git.agx@sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:QG/qaSOzaUZBrBlTxDNEk9gWqXOUCTr505LuHcpcy57CZ5MaXrM
	is9ViYq+92tPIcxrkjejXfdOpTLQZHTP+ALuq1fMn+t+KiRTyZaEg8JY6haLYkIOEY94k91
	fL5yvUWfqGCrnXibm1QHkXQTDYiASusWf82YcFKw7RQeU6iM9aT6B1+IEW7aZg1HuZ9NWJt
	G6BSMgzUOyhbmXSs7zIKw==
X-UI-Out-Filterresults: notjunk:1;V01:K0:hyZzkm1kAqU=:xHgXsX1EZ1nJeI7VRfuCaN
	iohxzr9MhAVqaKTeoekVIExZDKnb+C/p/GP8dZGP7wq+WTG9cRkB0oV0KjlnI9bdu2cpGWily
	vF6/H6aIyhpvylVWHFepnBzJzK3lQ0T3ECsHllui+PC2BUxrm5k/T2mJz0hh35ZH9UTMD1pAD
	/7ealV3JQcOHsEa7Gh1LSadDzxVAcDHwr8XWowLY7/or1osp3qntJWz1dWmfZ4P3oD+F0phSy
	NSdB9iVz9GsbFAcqcFJUdgWfreWcBiRmCtqp1rNZZ/isIMV6yziAjeMGd8XLc3IO7e/ydGtJ2
	Za+sxo7nXUoXsvlcBxF8nVRWdqF6+Z9CvlD/pM0pRGJJc3YLk9f6qU6AB0cmOw0EDXL4QQSg5
	hzn7oaf906v8eC3HHcZb+CQfUZuXlyjvRvTDjuMGai6d2RmbSAiqGhjzaDiMcRCQw945jBB+q
	/udihHavjWiF7yGZIwirxtjEGRdPw4qmDKdQnSv/iIy6mIJ07aCbrd1YuJpNCkwjpqsYjckAA
	h95CPHtan9UMYm3WUmBv0VKOHcz2CApua+8Fmj/KN5/8Dg+9s5qcMC5j7i1T0FxBggNrSRHVT
	rT8OcZxeqUuxa1MqlXw+IyMbY4sj3YJA8zg2MQqHMt9nq/pprEcwsC41c9P1vXs/3AmSYglo4
	5QdL67vk0FW0aCcHrKpeqkKlqHNL1nq7w0eChMiR4sefRutUn5MPIjhZRID73qxRoS1C0Mi3v
	2+I9Nt+B3VsEJ1+dURA3CpDELPKabRbWhqT/u6sHQ1N4N8ObwyoYsW7ouDc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-arm] [PATCH] linux-user: Fix register used for 6th
 syscall argument on aarch64
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bCGD4XlXAsGY

Le 24/01/2018 à 10:14, Guido Günther a écrit :
> Unbreaks the testcase from
> 
>     http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  linux-user/host/aarch64/safe-syscall.inc.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host/aarch64/safe-syscall.inc.S
> index 58a2329b37..e4fbc31454 100644
> --- a/linux-user/host/aarch64/safe-syscall.inc.S
> +++ b/linux-user/host/aarch64/safe-syscall.inc.S
> @@ -36,7 +36,7 @@ safe_syscall_base:
>  	 *               and return the result in x0
>  	 * and the syscall instruction needs
>  	 *               x8 == syscall number
> -	 *               x0 ... x7 == syscall arguments
> +	 *               x0 ... x5 == syscall arguments
>  	 *               and returns the result in x0
>  	 * Shuffle everything around appropriately.
>  	 */
> @@ -47,7 +47,7 @@ safe_syscall_base:
>  	mov	x2, x4
>  	mov	x3, x5
>  	mov	x4, x6
> -	mov	x6, x7
> +	mov	x5, x7
>  	ldr	x7, [sp]
>  
>  	/* This next sequence of code works in conjunction with the
> 

According to glibc/unix/sysv/linux/aarch64/syscall.S:

  AArch64 system calls take between 0 and 7 arguments.
  ... and any other system call arguments are in register x1..x7.

And it seems for qemu last argument is on the stack.
...
         x2 ... x7, (stack) == syscall arguments
...

Should we have something like this?

@@ -47,8 +47,8 @@ safe_syscall_base:
        mov     x2, x4
        mov     x3, x5
        mov     x4, x6
-       mov     x6, x7
-       ldr     x7, [sp]
+       mov     x5, x7
+       ldr     x6, [sp]

        /* This next sequence of code works in conjunction with the
         * rewind_if_safe_syscall_function(). If a signal is taken

But do we need to set x7 from the stack too?

Thanks,
Laurent

