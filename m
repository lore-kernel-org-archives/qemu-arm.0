Received: by 10.25.208.211 with SMTP id h202csp736172lfg;
        Thu, 18 Feb 2016 09:44:24 -0800 (PST)
X-Received: by 10.140.91.109 with SMTP id y100mr10320970qgd.42.1455817464749;
        Thu, 18 Feb 2016 09:44:24 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si9047629qhq.26.2016.02.18.09.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 09:44:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43729 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWScq-0007y8-8d
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 12:44:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSbr-0006bO-VL
	for qemu-devel@nongnu.org; Thu, 18 Feb 2016 12:43:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWSbq-0001QX-Ns
	for qemu-devel@nongnu.org; Thu, 18 Feb 2016 12:43:23 -0500
Received: from mail-lb0-x235.google.com ([2a00:1450:4010:c04::235]:33134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWSbl-0001NN-Ut; Thu, 18 Feb 2016 12:43:18 -0500
Received: by mail-lb0-x235.google.com with SMTP id x4so33394442lbm.0;
	Thu, 18 Feb 2016 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=dRk9YgK12sboFtjx+nyhxKysY3sTyScdSO0MQe7wlwE=;
	b=cQ/sGxJhN5POPHNzvYfKEt51mmHgFMA59liNS7BL1S8EFkrlL6EwyNk6DWoog5GIvm
	3gXZKVPObguU+pewzpgNBM3yQGfd6o3scx+A8sqjWayOlPVmEIFtMUgR4n9Ryv6ZJl3+
	k6QM17pZLU44On78R6+gvwklYOkBzGnhV4t0u1CUuNUuMmWt9GPdDrOC3ef2wPc5mTzh
	ClDsireWuAV1CIz2zsPNWiAKtsR8Zj9zRr9tyzOx6mighvR0qehhTAKOspyoON6NLxGc
	43u6T61LfXGhe8g5NTW3cbVS9K/m/A6uxFyfmfxnpYpCNSsp69jQpZebchb6GbzyDqM+
	UpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=dRk9YgK12sboFtjx+nyhxKysY3sTyScdSO0MQe7wlwE=;
	b=YjslWAMr3nOhv41pCBmR1uRejwsM1/mTLk7JhWH9l1SikRlFsj1zAuiQox/MXwLdgU
	rSydLHvQPd3ww41FYFif4Kbxijtxmkmc0veyp6WCf0jKGMjvXt8HWUVe6/Kj9bRsvgqd
	C3HhRxxTbmIlie5HNStQwkeCvSol/sHCVgI4huPQW/vrIXibhZHRTcWtu+lkGeQS2h/E
	pjcRTdzfWmLap5Tu7kDK7FPbdBO8PVTJpWKUwKZMoVU75KxMY1m9u1hZ0Uaz6B6Mhhks
	TGorx6COdPfNrv0SW1DjMhwb9AZFkpErALJ9PA2095VxJlcgSzCZx5hkdCPNcS9+VXfL
	P9RQ==
X-Gm-Message-State: AG10YOS4+o3OjvlN1azUg5DpNnMaQ6Q6pvbgXG/+vamQODyZ7ZZ17v4bn1Y8dd5cc9JuLg==
X-Received: by 10.112.171.134 with SMTP id au6mr3748768lbc.27.1455817397241;
	Thu, 18 Feb 2016 09:43:17 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	y63sm1082279lfd.10.2016.02.18.09.43.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 09:43:16 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
	<1455556977-3644-7-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C602B2.50700@gmail.com>
Date: Thu, 18 Feb 2016 20:43:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455556977-3644-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::235
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 06/11] target-arm: Add comment about not
 implementing NSACR.RFR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N/Y4IgrBwEfi

On 15.02.2016 20:22, Peter Maydell wrote:
> QEMU doesn't implement the NSACR.RFR bit, which is a permitted
> IMPDEF in choice in ARMv7 and the only permitted choice in ARMv8.
> Add a comment to bad_mode_switch() to note that this is why
> FIQ is always a valid mode regardless of the CPU's Secure state.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 9998a25..37b5439 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5180,6 +5180,9 @@ static int bad_mode_switch(CPUARMState *env, int mode)
>      case ARM_CPU_MODE_UND:
>      case ARM_CPU_MODE_IRQ:
>      case ARM_CPU_MODE_FIQ:
> +        /* Note that we don't implement the IMPDEF NSACR.RFR which in v7
> +         * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
> +         */
>          return 0;
>      case ARM_CPU_MODE_MON:
>          return !arm_is_secure(env);

