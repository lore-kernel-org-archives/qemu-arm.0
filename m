Received: by 10.182.158.201 with SMTP id ww9csp389113obb;
        Thu, 10 Dec 2015 02:38:44 -0800 (PST)
X-Received: by 10.140.238.137 with SMTP id j131mr5328162qhc.88.1449743924808;
        Thu, 10 Dec 2015 02:38:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17si14186937qhb.14.2015.12.10.02.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 02:38:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:40376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6ycW-0004av-AU
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 05:38:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6yc0-0003jU-0n
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6ybz-0001Kc-4p
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:38:11 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a6yby-0001KV-Uk
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:38:11 -0500
Received: by vkha189 with SMTP id a189so77002067vkh.2
	for <qemu-arm@nongnu.org>; Thu, 10 Dec 2015 02:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=26VgJmWZ49x+JyQm73RhBm2XkrBwNhgdxs8ZGfVTZ7I=;
	b=w+G2IOXsX7F5epddWSLRx8mdUk308AYBoiFpyD8LfaSt9CQN5FHU+aYDl30h0pyrHw
	/bD+IXm7WbIgGzOXLOdN0ULCOS0EkxxjETaVzBbuv5umbdgai5c06qngIZDAla8DmgDP
	Vjk2nbFwMvMd1+1R5bSR7mq2obIHl9ISM3JcMhV287V6GI3WHmi81tec4dp7AF0S8JkR
	5ztBvoKuS2hKGDp0Eboo5aIb6uDmWRECAzcj/g0a6At6XtjNAjRSeYnWLx9ZcOr/kWvA
	2HnO8UgKrtBusTiyZDUoPkqMtsURD1IElbhFB9qZRt7Dph8IUHNET/ysFE+Gc0kzP8D1
	9NGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=26VgJmWZ49x+JyQm73RhBm2XkrBwNhgdxs8ZGfVTZ7I=;
	b=G2X9iUsxnn/Wf1gFIPabEbUzFWYf+Vbn9pJaSZvVPwMG+Vo6ribVX5uiUHAwJgj61I
	ah3GtMY+pejPk9keicnn1S1kcbB0dy5bkmd4p+g0Ya/LgBafGlZHbzD1ib3oszGnAn+B
	sxVvAxvsbmLuq173E9+KMQBeTp7qcI04/fsnPufgy1Hwi6+kh/qSW+i9R5ATVWeWVCtO
	7kiO8h7hN60ZOwMKPVX6HXkRU5l7t7L5PbAr7tv70uNxu4G4m1z9Mlfp5tnTlrZ1Lfyk
	23PllCCo24JvBpedtY5bC4mo61Q1dFFBXJAZQ2oEFVYCOKkwJBJK2IyOh8l3zWEAPsiH
	IzJA==
X-Gm-Message-State: ALoCoQniEDl6TKXVeeHPhfYMrlcZEgz9XXC2fL166rk90VFfMIrAI+LPXVvj9+oS6eYw4UwczGSq+aGvfTuEIPYRGVGoOTVxcuu+p93IwehtMVWA/w/Zd3U=
X-Received: by 10.31.47.197 with SMTP id v188mr9365350vkv.6.1449743890474;
	Thu, 10 Dec 2015 02:38:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 10 Dec 2015 02:37:51 -0800 (PST)
In-Reply-To: <1449743372-17169-4-git-send-email-armbru@redhat.com>
References: <1449743372-17169-1-git-send-email-armbru@redhat.com>
	<1449743372-17169-4-git-send-email-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2015 10:37:51 +0000
Message-ID: <CAFEAcA-hedUXdofT2_3ogpn_5GtOugDfQU84fOUC4YH5fdYr5g@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 03/12] arm_mptimer: Don't use hw_error() in
	realize() method
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
X-TUID: sPr9uv2w/qor

On 10 December 2015 at 10:29, Markus Armbruster <armbru@redhat.com> wrote:
> Device realize() methods aren't supposed to call hw_error(), they
> should set an error and fail cleanly.  Do that.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/timer/arm_mptimer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index 3e59c2a..f1a34ec 100644
> --- a/hw/timer/arm_mptimer.c
> +++ b/hw/timer/arm_mptimer.c
> @@ -220,8 +220,9 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
>      int i;
>
>      if (s->num_cpu < 1 || s->num_cpu > ARM_MPTIMER_MAX_CPUS) {
> -        hw_error("%s: num-cpu must be between 1 and %d\n",
> -                 __func__, ARM_MPTIMER_MAX_CPUS);
> +        error_setg(errp, "num-cpu must be between 1 and %d\n",
> +                   ARM_MPTIMER_MAX_CPUS);
> +        return;

I think the trailing newline is incorrect for error_setg, right?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
