Received: by 10.25.15.230 with SMTP id 99csp836331lfp;
        Thu, 6 Apr 2017 09:34:50 -0700 (PDT)
X-Received: by 10.200.53.237 with SMTP id l42mr34062518qtb.264.1491496490598;
        Thu, 06 Apr 2017 09:34:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si1805478qtb.242.2017.04.06.09.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Apr 2017 09:34:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cwAN0-0001yt-1t
	for alex.bennee@linaro.org; Thu, 06 Apr 2017 12:34:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwAMv-0001x6-Vs
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 12:34:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwAMv-00056O-3K
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 12:34:46 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34242)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwAMo-00052u-U8; Thu, 06 Apr 2017 12:34:39 -0400
Received: by mail-qt0-x242.google.com with SMTP id x35so6355553qtc.1;
	Thu, 06 Apr 2017 09:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=wwYL4G7z2aF2sPqsnEqrwoBCDGGZjOiOaL4mIM7n7q8=;
	b=A8w/6KyE8kX0CmufqQYXgFjvigKyOd3nNwl/Uky9+l72nzbb1yvXCjR9aToYZwVmCL
	YNGLdJ3QuGG6HqnJDZbFdDgP0d1eYFCac5rP7IUTz45vIv61iQBUnEnggpUqkIBPk+Jk
	wqZZjjErmq6fpAd0ZOj62aGYlEWk4I3YjDvmimQTYLA6vrcsu1BMLPJ/gWoQT3P8EQlu
	/wDFxPx84/eTxFprBf+7gMtbb72jmX0YDf8v7v9J3KL3bxypQ03cIlNtDjrOTQZgw+K1
	ZzUVbcfezF3ozCB8M9DDWhq7FguMR/+uVWKMfeM3QcKXSYyuoz29v5dZCA0JU2Vc/7jB
	7ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=wwYL4G7z2aF2sPqsnEqrwoBCDGGZjOiOaL4mIM7n7q8=;
	b=Wz037GmEIPF6mlcGM8YZsIwixoMBr//5oR8BeXI1j9MuwidbjaZhWrmcm2OfCQQsmv
	X44kt1slOUT6kJ36ROivYumZ6KKUmZENtwRqkis+GIqXMSjwQxuXvucp7mr4xG6UH9mT
	Ryv566lLwex8mjHZu+jb+fkef0pjOw2JTppz2apm1fBapoT3iCaPKiMQvfAMNc6sqoe5
	ut0u4oiD2rwHO9ideBKTDfQGA+FLufrXw8+U4d7PZFEtfSgOEhw6aKidDbpb5PT5vDYT
	zx2ZHVe4LaEZuCnFiNMv6bSggraPg5XPyFT31A8+vNk56U3su3n/nLMnXpkeRHhhNWkW
	NwdA==
X-Gm-Message-State: AFeK/H1dUJ5TDY/WOoYQR0CT91mTxGGVUg5fN+SSXOhoGX6Zh/6cxJvgGbnu4K4QHsZ63g==
X-Received: by 10.237.36.172 with SMTP id t41mr34202773qtc.142.1491496478213; 
	Thu, 06 Apr 2017 09:34:38 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	s10sm1254843qke.53.2017.04.06.09.34.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Apr 2017 09:34:37 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491486340-25988-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <30f2db0a-2132-4f6e-cd06-f5505f01db88@amsat.org>
Date: Thu, 6 Apr 2017 13:34:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491486340-25988-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH] target/arm: Add missing entries to
 excnames[] for log strings
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PfOWWyQqwYen

Hi Peter,

excnames[] is only used in arm_log_exception(), can we move it there?

anyway:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

On 04/06/2017 10:45 AM, Peter Maydell wrote:
> Recent changes have added new EXCP_ values to ARM but forgot
> to update the excnames[] array which is used to provide
> human-readable strings when printing information about the
> exception for debug logging. Add the missing entries, and
> add a comment to the list of #defines to help avoid the mistake
> being repeated in future.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       | 1 +
>  target/arm/internals.h | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a8aabce..e6f05e2 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -58,6 +58,7 @@
>  #define EXCP_SEMIHOST       16   /* semihosting call */
>  #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
>  #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
> +/* NB: new EXCP_ defines should be added to the excnames[] array too */
>
>  #define ARMV7M_EXCP_RESET   1
>  #define ARMV7M_EXCP_NMI     2
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index f742a41..97ca034 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -70,6 +70,8 @@ static const char * const excnames[] = {
>      [EXCP_VIRQ] = "Virtual IRQ",
>      [EXCP_VFIQ] = "Virtual FIQ",
>      [EXCP_SEMIHOST] = "Semihosting call",
> +    [EXCP_NOCP] = "v7M NOCP UsageFault",
> +    [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
>  };
>
>  /* Scale factor for generic timers, ie number of ns per tick.
>
