Received: by 10.28.71.27 with SMTP id u27csp573135wma;
        Wed, 24 Jan 2018 04:41:14 -0800 (PST)
X-Google-Smtp-Source: AH8x226/kFSe0c7xgQap3nnEwAcdoLFsKWxxj1d7xwYGNuxltxYi8vJzyGBGBAj30vbMIhumgKFy
X-Received: by 10.13.208.197 with SMTP id s188mr2339931ywd.217.1516797674403;
        Wed, 24 Jan 2018 04:41:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516797674; cv=none;
        d=google.com; s=arc-20160816;
        b=XI1ecEmVs/RKH+YzxV2ZPme5fW6AJ+o6aTkszNKu3OHvG0XdFnxSpC8xnGQzpC+plT
         SG6iK/QiiiUQ4OGxTt1Y6W81gUV5kAwdJFkF8neXSTpOg7FlFtfsSEDz8udiZbqXRCXG
         +bcCZH/N1AioUCR9A7bxNg4B1DO1sqHX2CYqBdS0KYCt7IH6ZBy/VshAM6V9AlnWrbrs
         xA5ilM44I7gN6wYmA/5m/hGNkEIG7DWiXulhFtp3gfOXwgvEttzIq89l0KmRB5y6g+UR
         N793bg+iHwrV2bwOAkehNZ/FOkqp0yFM7/Wb2ewCCH/TxHqbNJ8H3tKbHNY90o/AuSvD
         5whA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=0FGbrJ1vXWA6VnoUykL+jXD2HuYkP81yegyigGH3UD0=;
        b=TpnxvUp99ldbr/Xf9MsigXzfhG193JnW04wd3tfyD0f/W6xhMjgsDykGrvJdBjIpU+
         X1t2Nwu6Tf4XaDwjiBGOnAQkBectamq99LmGN8kioEz+aAyD6BTLgMSaaaene5+hKzRC
         ZIOrfLw5dZlemJmsrTEWR8KUeumMFOzNhxbSHiDafPQVlfNNI3PC0I9WAxjZpEfGKTzl
         lLgmkUTNT21ZbupHxZoPNTsQp5KcQhx2/fTxfHk0Gq1Jp8E3iDm+Wyb2K8G0i20P9YeV
         /DigmkgBSqvxL+L+ZBzSt6xWHYjCUA7PuUskzfUmCJqV7is7o047hMwm+AgL6e1/0MCp
         JR2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p184si29533ywh.791.2018.01.24.04.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 04:41:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46284 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeKMb-0004X3-TG
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 07:41:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eeKMP-0004VA-5a
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 07:41:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eeKMM-0003ZM-0l
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 07:41:01 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:49653)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eeKMC-0003RY-De; Wed, 24 Jan 2018 07:40:48 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue007 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0M9RFK-1eUvdb1290-00CfCP; Wed, 24 Jan 2018 13:40:37 +0100
To: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>
References: <20180124101358.GA5028@bogon.m.sigxcpu.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <309602cf-58cf-7b1b-25f0-1ab01f3fbaa1@vivier.eu>
Date: Wed, 24 Jan 2018 13:40:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180124101358.GA5028@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:vc0MxsJcnafRnQYuYf8p8jvOqQSkuQDdutoB2jOC2tY4eZI7//x
	qCgQ/+o0QF+7nnlS3BGAhKvV0ruG9O6HrA+kSpcr4mA/MmWwMh0jZoQSyiiKxpZaSdOH5mD
	ZbrZZye/TmIh+wFdpkAZNf9QBRfpcDP5aT6ghvuJ2yZJgVRAjh81WYjZyKn82gXijTwFVqU
	pXBzzubkfelotoyYPkA0Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:CQA685VO3gU=:U0c5at1GB7KBseKd7xFsVs
	NYvpfT6HOIZDzwbVWvQOvTl86tbANfxAMdESdMhOP+XduEYPxYf22a+2rDsEDL3yUWDR1gHVK
	RLN7xtChV0yFdqs+CYUwlj1uwczR/Te9bMHIxs1F6bSXdw43zrgSnmXvB9XpFiB67O6ULkO9M
	rego5s0qv31mZKHSUpQGia2lHeDqEYEvk05GxtxODaOVxEaj223YneLf0R35oh+OLHDtk+ny4
	ehP8iJEl3BgHqCe6ZWBoy9W86kQooOf0mKQ6jwIJPXIIGy41qeWXWnL33TLX6QBxcpI54Uhh7
	4of0kvpJLne8chCKyrdyX1Y/MasSqQO667xXVcNUTJ8B/bvn4PBIo2qvn3auHqP6Q1GftIHJl
	CgNpCVl58Lb5aD0oyrAAmOkeJQnheND61XhI6ewyKSFF+fcdD+s8xCIY5X0BfW8AxE+AHUnkM
	Hn8ZF4GddICbcULHe+56Mm1WQskfksG7YOjtzZN5xh8IdO1LjigSvYHUpWr8BPZlNUOXKDycV
	D2xVDswK9aO+xsYBEXeQrRgIM0XgoMnI0lm/hies2LV2vKwRsICX5E7OT9RnMdRQ8zr5I3D2J
	TA0elsItkpZWHPcMFVJKuU6o8NJ1ubdstSt+cswrguR4ybsqDGTS0CBoyx13lZPdpGWuqwI6m
	Ei8A6cr5oI2TRdDSRWaYGoZY7Qpb5u88Yx9EF9bmMMTGrekQfRA1c1C5m+lKDG6b5jT6W9LIG
	DIEAeIBTKrauAkzHJ32g4Mf1STjl+Vp3OXdVOY0MQ4Rp12qswGrdf17nuBj3nToaUC8e4HKjf
	zy4Omww083YWj5I4SrEVjxIbGTlovzhz092THx64MU77F5+Grk8i5Numv7b7Ob5IQNTP1Rm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] linux-user: Fix register used
 for 6th and 7th syscall argument on aarch64
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
X-TUID: c/eM2za5t73W

Le 24/01/2018 à 11:13, Guido Günther a écrit :
> Unbreaks the testcase from
> 
>     http://lists.nongnu.org/archive/html/qemu-arm/2018-01/msg00514.html
> 
> Thanks to Laurent Vivier for spotting the 7th one.
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  linux-user/host/aarch64/safe-syscall.inc.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/host/aarch64/safe-syscall.inc.S b/linux-user/host/aarch64/safe-syscall.inc.S
> index 58a2329b37..bc1f5a9792 100644
> --- a/linux-user/host/aarch64/safe-syscall.inc.S
> +++ b/linux-user/host/aarch64/safe-syscall.inc.S
> @@ -36,7 +36,7 @@ safe_syscall_base:
>  	 *               and return the result in x0
>  	 * and the syscall instruction needs
>  	 *               x8 == syscall number
> -	 *               x0 ... x7 == syscall arguments
> +	 *               x0 ... x6 == syscall arguments
>  	 *               and returns the result in x0
>  	 * Shuffle everything around appropriately.
>  	 */
> @@ -47,8 +47,8 @@ safe_syscall_base:
>  	mov	x2, x4
>  	mov	x3, x5
>  	mov	x4, x6
> -	mov	x6, x7
> -	ldr	x7, [sp]
> +	mov	x5, x7
> +	ldr	x6, [sp]
>  
>  	/* This next sequence of code works in conjunction with the
>  	 * rewind_if_safe_syscall_function(). If a signal is taken
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

for your future patches (I hope there will be), if there are several
versions, add the version number in the Subject (i.e. "[PATCH v2]") and
version history below the signature mark ("---"):

   ...

   Signed-off-by: Guido Günther <agx@sigxcpu.org>
   ---
   v2: fix also 7th arg

     linux-user/host/aarch64/safe-syscall.inc.S | 6 +++---
     1 file changed, 3 insertions(+), 3 deletions(-)

   ...

Thanks,
Laurent
