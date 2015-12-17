Received: by 10.182.158.201 with SMTP id ww9csp586625obb;
        Thu, 17 Dec 2015 11:08:15 -0800 (PST)
X-Received: by 10.140.174.68 with SMTP id u65mr66931429qhu.62.1450379295929;
        Thu, 17 Dec 2015 11:08:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u144si12527883qka.104.2015.12.17.11.08.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 11:08:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9duR-0008Sx-IF
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 14:08:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50329)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9duP-0008Qs-Jn
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:08:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9duO-0003pR-Ca
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:08:13 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:32793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9duO-0003pD-9M
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 14:08:12 -0500
Received: by mail-vk0-x22a.google.com with SMTP id a188so52897442vkc.0
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 11:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Hkyl8JXfd46v0VRsJcoxBZxFn8GupSr8PjpP2Iodt+0=;
	b=MBpYGjW+B6F+H4NjFtVT8b91qUuAPVNsW6MTfgYW5dt1+cvMXoY4Ung0hqeW7xhvfb
	Md410NshqIjgKPx8+wCN6hrKCuzyBBbakrxSo0tEAmD5vD/ZYWNbeNaXfxTkI1cCDFFn
	tnCTXEn7il61zhJ8yKxeDdHCvceYFfUVdn6zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Hkyl8JXfd46v0VRsJcoxBZxFn8GupSr8PjpP2Iodt+0=;
	b=K+WfK1w8Eyo+iUtvGSKirmr5rrzwKJDE92BYk5dDmKuCUhZWXK+hTqF01eNlgDoP1n
	8QATeOgiUm6NcvmVKvThWfkd2ZjpLRVWC6vVi+02hlj1dZh+Gxkf7AH/6srzuzzGmVwF
	6UgYDzp4Vhl3GgwnelqtCXnL1xGq4mI9996476CHgbsyTwlIh5YqX7x9WsTHMhp0CVmJ
	w/xbZoLKW/a5TiF4w1D1Vs/pLS8rIUmK9OFhe5ei05EvMpS3Ku10Kpam9zLIbvHDJWFN
	66Bdw+J+5qXMCzXE2fj7fR55z/LUoHQ1O7qIKgiQgrnfqNi/8h2UP91DLjsjhcXdKX/d
	LEjg==
X-Gm-Message-State: ALoCoQlj8cvRxU+kAwsJDKThneBkbscNEE5A0bsjlXjNS13vp7DUfW4eK7TwadQZ8R5k5zzqDJuF9NbvNP0F5tYuMudMt5OfugdWTodcwafC9DGmqAXyujw=
X-Received: by 10.31.0.136 with SMTP id 130mr20837422vka.139.1450379292026;
	Thu, 17 Dec 2015 11:08:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 11:07:52 -0800 (PST)
In-Reply-To: <1449101933-24928-11-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-11-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 19:07:52 +0000
Message-ID: <CAFEAcA_s7OkNJ=suwsSqGCxK8w_jSK-n31cWziJhPDvP+WAkDQ@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 10/26] armv7m: auto-clear FAULTMASK
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
X-TUID: 3y58BZn+IEwb

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> on return from all exceptions other than NMI
> ---
>  target-arm/helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index d1ca011..b6ec761 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -5379,8 +5379,13 @@ static void do_v7m_exception_exit(CPUARMState *env)
>      uint32_t xpsr;
>
>      type = env->regs[15];
> -    if (env->v7m.exception != 0)
> +    if (env->v7m.exception != ARMV7M_EXCP_NMI) {
> +        /* Auto-clear FAULTMASK on return from other than NMI */
> +        env->daif &= ~PSTATE_F;
> +    }
> +    if (env->v7m.exception != 0) {
>          armv7m_nvic_complete_irq(env->nvic, env->v7m.exception);
> +    }

Should the "clear PSTATE_F if this isn't NMI" check be inside
the "if exception != 0" if() ? It's not clear to me when this
function is called with exception equal to 0...

thanks
-- PMM
