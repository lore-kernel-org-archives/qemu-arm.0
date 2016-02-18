Received: by 10.25.208.211 with SMTP id h202csp737225lfg;
        Thu, 18 Feb 2016 09:46:44 -0800 (PST)
X-Received: by 10.140.93.166 with SMTP id d35mr10211917qge.29.1455817604342;
        Thu, 18 Feb 2016 09:46:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 79si9037148qhp.80.2016.02.18.09.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43779 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWSf5-0004OJ-Rr
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:46:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSd4-0000bv-Rx
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:44:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSd1-00023F-Jz
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 12:44:38 -0500
Received: from mail-lf0-x22a.google.com ([2a00:1450:4010:c07::22a]:35606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWSd1-00022u-CH; Thu, 18 Feb 2016 12:44:35 -0500
Received: by mail-lf0-x22a.google.com with SMTP id l143so37797603lfe.2;
	Thu, 18 Feb 2016 09:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=42E60irDMxo8PPQ9CanoTJCoHPqBqSPzs3V5FURvoUY=;
	b=m4uByL7VZ4iHwDO/BTJwwc41um5NCe/JCrqkf8iuhml77cCiv4TGpK7rp9XmTb4J4V
	+1fvtAn0/worsWv4IgMwNk0okJXijLJQewlmd7dMYZlYwiSi4Sd+iKWAWc0jOZ3cabsY
	FmrBdQixAj9/ZKfKE0uTwBHRnTyHlx60Y6lOhW6ZdkBDNhdru0QM2RHRjBLXYeC6vnfO
	ElhrnWjKSFE/wZt6ZsMVxjyqeyrn+F6Nng3hjSKVDl5FEQuuNufmc+cLmlayuszbPaj7
	gZXTKq7ReyyQ2LIyAIepJUygVv1G8O7U8alzSDVMvYOnlKEcxgJZbTaDnyyCxgGgzCgh
	O5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=42E60irDMxo8PPQ9CanoTJCoHPqBqSPzs3V5FURvoUY=;
	b=c1U7xpGCvEFp8NJLyzKm1Ej0cPPg1mHR7WoYSHL4LO7fp3zRLzl3767pbhloAIimlk
	YAVeT80LrmEN0kfleHkkbKoX/GjD+JOjWWHYsrujhoF7xPu3Z8IqOQ+i27i7vzrqny53
	9M7cd9LKuToqhoT0nUuYOINUoYZXyk6iMux2VYa7dBrLiQwBNiE68B4Pn8uIBE5kmNr1
	tPSJ4crOsXMhKScF4ntL0Pfb+sr2W0xVIa9oSETKraYAWF8kv7h7gEeuq7WrI/33d90U
	Io1VeCZcE1MopZZU9sagr0z3fqsLEsnN22YYhr+OW3cxGIT1iHk9bFyN66wjW/++9LIw
	JdBg==
X-Gm-Message-State: AG10YOQQvCTfPP+eezPUAQT2AI5YQxeZAsNkbw8LpkWFGtMnbpuVyDuwrIEbdBQV+bNgAQ==
X-Received: by 10.25.1.65 with SMTP id 62mr3712318lfb.89.1455817474588;
	Thu, 18 Feb 2016 09:44:34 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	88sm1057993lfr.44.2016.02.18.09.44.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:44:33 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-12-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C60300.5000405@gmail.com>
Date: Thu, 18 Feb 2016 20:44:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22a
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 11/11] target-arm: Make Monitor->NS PL1 mode
 changes illegal if HCR.TGE is 1
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
X-TUID: 03aobRJqBHes

On 15.02.2016 20:22, Peter Maydell wrote:
> If HCR.TGE is 1 then mode changes via CPS and MSR from Monitor to
> NonSecure PL1 modes are illegal mode changes. Implement this check
> in bad_mode_switch().
>
> (We don't currently implement HCR.TGE, but this is the only missing
> check from the v8 ARM ARM G1.9.3 and so it's worth adding now; the
> rest of the HCR.TGE checks can be added later as necessary.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index e1af9d5..93a0b63 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5182,6 +5182,7 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
>  
>      switch (mode) {
>      case ARM_CPU_MODE_USR:
> +        return 0;
>      case ARM_CPU_MODE_SYS:
>      case ARM_CPU_MODE_SVC:
>      case ARM_CPU_MODE_ABT:
> @@ -5191,6 +5192,15 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
>          /* Note that we don't implement the IMPDEF NSACR.RFR which in v7
>           * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
>           */
> +        /* If HCR.TGE is set then changes from Monitor to NS PL1 via MSR
> +         * and CPS are treated as illegal mode changes.
> +         */
> +        if (write_type == CPSRWriteByInstr &&
> +            (env->cp15.hcr_el2 & HCR_TGE) &&
> +            (env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON &&
> +            !arm_is_secure_below_el3(env)) {
> +            return 1;
> +        }
>          return 0;
>      case ARM_CPU_MODE_HYP:
>          return !arm_feature(env, ARM_FEATURE_EL2)

