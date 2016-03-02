Received: by 10.25.208.211 with SMTP id h202csp2326789lfg;
        Wed, 2 Mar 2016 11:19:29 -0800 (PST)
X-Received: by 10.55.72.135 with SMTP id v129mr35144206qka.72.1456946369149;
        Wed, 02 Mar 2016 11:19:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e17si21484157qkh.75.2016.03.02.11.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Mar 2016 11:19:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abCIy-0001Go-Lc
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 14:19:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1abCIw-0001Ge-4w
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 14:19:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1abCIs-0006F0-1u
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 14:19:26 -0500
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230]:33590)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1abCIr-0006ER-Qf; Wed, 02 Mar 2016 14:19:21 -0500
Received: by mail-lb0-x230.google.com with SMTP id k15so13134851lbg.0;
	Wed, 02 Mar 2016 11:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=HHfyUlGfKwBrfojHcvo3KDZ5f7jGekFgLDRgni4Ad7Y=;
	b=dklTsq9PAyO6HmB5BpybXi1dRoF1H8FklWaw7yGcZGAdwdTkJg3BTV1akaAN/wLHNy
	xVD+1WVsPOdf8wpVW2eKFPnWWLfRwma5vKFCmi9LKD0mA/3uVGu4vt3iXe0q2ZNZLfp1
	e/rjZOjS1afTDG9u6h1LxxN/soCDliPfySOJPRgVNoR9KeCYbmxsu6gNOzuKLS9GAttH
	Q7HhSa+kY2y7+oo67Hnisci5L5erB8ZPiCtMno7lUlyQg8hfzMPSetkHszjFJ5FOkVHb
	G+qIi/GxDHuQd/UzhFbZHMXTp5/bbWEWacxlu+JcSJVw0S8MN65LXtg4nCxv9eAHZBu1
	DpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HHfyUlGfKwBrfojHcvo3KDZ5f7jGekFgLDRgni4Ad7Y=;
	b=ONggY2/NpzqzzhvVtbTEglfH5Yhz9lSR96JMJSaSCBq/7kcR/apj659PHv7z0sdZUa
	5POb5AMSgYP26T4r139PQS4eNqjkpTaU0/V2flhP0E7DayWzQUaZjPB73kI8URprrqf3
	O7k1ef48OywO64jEUCsnyWEczePcZoJpc8bDNAxfdzcgzg/Suu8VwuP4s74FmzLEzQds
	7pIejg8LessIMsOVlbLZ682NIhCG0p89hSJFL2xwJ4bYxiWuGcM56wcHzPjoISQLM57F
	gnyDA3v8dwxiHMslhFiC5C8TA4yEXQSVN8sd05aODzIapxI8xkymlIIQt5vbPHhDyiep
	hE2Q==
X-Gm-Message-State: AD7BkJLeE4lgkTnpDFLjHZMlW17yOxu12kZCEeBrlkrty7GjqE7x+QVMH2/KaKtFmwxUHQ==
X-Received: by 10.112.26.145 with SMTP id l17mr11182496lbg.106.1456946361006; 
	Wed, 02 Mar 2016 11:19:21 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	k3sm5934729lbp.9.2016.03.02.11.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2016 11:19:19 -0800 (PST)
To: Sergey Sorokin <afarallax@yandex.ru>, qemu-devel@nongnu.org
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56D73CB6.7040702@gmail.com>
Date: Wed, 2 Mar 2016 22:19:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::230
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix translation
 level on early translation faults
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
X-TUID: 41CEeF3aSQd+

On 02.03.2016 21:04, Sergey Sorokin wrote:
> Qemu reports translation fault on 1st level instead of 0th level in case of
> AArch64 address translation if the translation table walk is disabled or
> the address is in the gap between the two regions.

It's probably not a very clear description in the commit message. IIUC,
level 0 fault is reported in case of any fault from TTBR in AArch64 state.

Best regards,
Sergey

>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
> ---
>  target-arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 18c8296..09f920c 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -7238,6 +7238,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
>       * support for those page table walks.
>       */
>      if (arm_el_is_aa64(env, el)) {
> +        level = 0;
>          va_size = 64;
>          if (el > 1) {
>              if (mmu_idx != ARMMMUIdx_S2NS) {

