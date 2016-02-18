Received: by 10.25.208.211 with SMTP id h202csp737210lfg;
        Thu, 18 Feb 2016 09:46:42 -0800 (PST)
X-Received: by 10.55.214.213 with SMTP id p82mr10143283qkl.54.1455817602501;
        Thu, 18 Feb 2016 09:46:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si6919456qkh.123.2016.02.18.09.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:46:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWSf3-0004LF-Vx
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:46:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWScZ-0007wf-6f
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:44:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWScW-0001nb-0L
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:44:07 -0500
Received: from mail-lf0-x22c.google.com ([2a00:1450:4010:c07::22c]:35456)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWScV-0001nG-NF; Thu, 18 Feb 2016 12:44:03 -0500
Received: by mail-lf0-x22c.google.com with SMTP id l143so37788625lfe.2;
	Thu, 18 Feb 2016 09:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=lCBOHiy6Vge6b4unfRQzgBav22F1Bz9235uPL+uTXuw=;
	b=YgpA//nRFF42MxF7UW0IS/vHiLL49rf1RbQyDDF+AKSJ2US8U6uE2dPe+FdLZLduu3
	E33Fmu3AuXeKxkdfEWiQQJPK5cP3c9P6anTjLH9WWGYDBbuodfIO+7LfrfaYRn7L1zXy
	QgiOlcnX0VjxKKi4j9T6OE/g+jV+xY7sP3kqVbdniSZr9LdDaSIggFlWQd4d19BhHXbd
	vo3MWTSCa5WvmSkVIJGoTMKoM7F1uDbMx7U2BX6rIRGS/WeJJzf1j+8xMsa/mtHA577q
	UDD6iWYPwDJHBSm67JK+pOwnqRwnyEl82jrJofegJ43RIhxt3ccHzjFdz0vaXGY2dD2k
	TfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lCBOHiy6Vge6b4unfRQzgBav22F1Bz9235uPL+uTXuw=;
	b=YCpeUfH6kTaFbVtsKMQkwvrGRPIGfSMp3B7cCts+Y4fY4ZYkapz5hTRrdCS1t00EQz
	JqepZRZ1KMN3hv59yR1lT4a6f3V+S7+u3ku1Amgf/RwFiGbQersAWrXayGxzvm+ywMnT
	zRGqqK0WQDexbNfc0IbHsRBjPOe5o7VBacH4zHC6L2y3VmjBpdA3g8I92Cg6USUwbro3
	OmAyzK00zaLNiCbrhVgaU0KrZpE5wtEeV7adz3WX/d1GOsbtI6SOV7LLKW8tTScPK7I+
	5KfII+zNa4kITg/2VVpYTGVNMgudPAuiqZrKwRoA+VGm39Lya21xUtM8ASLGfzQHfxvD
	Ihpw==
X-Gm-Message-State: AG10YOQIxVu1QpU4jv6J2a3Q1PKKy0Ce9R/X/9bVRQnV4wVedwBbVKlBifSuEwdZ6Xkt/Q==
X-Received: by 10.25.84.7 with SMTP id i7mr3115349lfb.44.1455817442892;
	Thu, 18 Feb 2016 09:44:02 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	pi5sm1039701lbb.41.2016.02.18.09.44.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:44:01 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-10-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C602E0.2080403@gmail.com>
Date: Thu, 18 Feb 2016 20:44:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-10-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22c
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 09/11] target-arm: In v8,
 make illegal AArch32 mode changes set PSTATE.IL
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
X-TUID: 8+rdpJgFmc1m

On 15.02.2016 20:22, Peter Maydell wrote:
> In v8, the illegal mode changes which are UNPREDICTABLE in v7 are
> given architected behaviour:
>  * the mode field is unchanged
>  * PSTATE.IL is set (so any subsequent instructions will UNDEF)
>  * any other CPSR fields are written to as normal
>
> This is pretty much the same behaviour we picked for our
> UNPREDICTABLE handling, with the exception that for v8 we
> need to set the IL bit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index e7b3eb3..69e93a2 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5291,11 +5291,20 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
>          (env->uncached_cpsr & CPSR_M) != CPSR_USER &&
>          ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
>          if (bad_mode_switch(env, val & CPSR_M)) {
> -            /* Attempt to switch to an invalid mode: this is UNPREDICTABLE.
> -             * We choose to ignore the attempt and leave the CPSR M field
> -             * untouched.
> +            /* Attempt to switch to an invalid mode: this is UNPREDICTABLE in
> +             * v7, and has defined behaviour in v8:
> +             *  + leave CPSR.M untouched
> +             *  + allow changes to the other CPSR fields
> +             *  + set PSTATE.IL
> +             * For user changes via the GDB stub, we don't set PSTATE.IL,
> +             * as this would be unnecessarily harsh for a user error.
>               */
>              mask &= ~CPSR_M;
> +            if (write_type != CPSRWriteByGDBStub &&
> +                arm_feature(env, ARM_FEATURE_V8)) {
> +                mask |= CPSR_IL;
> +                val |= CPSR_IL;
> +            }
>          } else {
>              switch_mode(env, val & CPSR_M);
>          }

