Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp688950wro;
        Thu, 14 Mar 2019 03:58:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTcwI7fahNibhmmdwsyaQTSwUoJalaSsHUISpMCwvLQC2A2Jg23TKzMkbOKTBaAYSIcKX4
X-Received: by 2002:a81:7c54:: with SMTP id x81mr37873302ywc.12.1552561081862;
        Thu, 14 Mar 2019 03:58:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552561081; cv=none;
        d=google.com; s=arc-20160816;
        b=UIqNIKcvL5BXZd8z5YPq3GmzUI5ELfomZLR07ASEE3qlB06h4YfPEbq12h6ns2aPOO
         /jzQqSSr4B3um6Zs0rAjVo5LBacnTqBDNn26OVWHnMK+e9Sgjaz7WshNsC4jv4eeZ04j
         pXu0eS/szOCtSPfqaGXgkTtp/P2CmjZcN1XMxobakEYtfrFn+xyMYqZl7Y2Rrx4IYww1
         exI22u/BIBKThGkHQkcZgcQj+GErioGbnxeyoXL9txgV7d0ZYa8Etq71k+dW1XaD3U0O
         HNwp/MCRIA0CAlUzDGY7pYK5nXp2TAuGslT7ELsCn+g1X8vqgqZZhKtH8kUiOXJVJ75m
         Y/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=RsewdT+73fe97clQejY9Co1xlOOg1NaB/DakbfuzrtM=;
        b=uyB7QMUxJX+azZOrBDUTomV/4Qd9fiVn0KqRn7sk+zVqs+ujemeXr/eyRRn8YtUjgI
         IxjaTcJ9NXRRy/Nz5ZGHTfZeeEqz+TcevNLysCOnXw5KlpGRgN4Aq3GKZIrTkPoflSPI
         pgZu5PuSEZIldTBLejJkwBac7pBIa5DLAQYZKr30/8rSlLwurVL0xNNEt54l6Gn5+v4J
         cmgm78n3i8owbWK61X1VuicJVw2tgTkI9LUC3PZ97oq25QQ9V8TQrKMX6pSU8uSjB/x3
         RbHG1oE6ajg7BCw2QpC3cIFutqZICUtIWJaMceCaHo+exoxMb2CQiLo6ZnLgJhYUxAUz
         C04w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Szu973FZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s196si8454593ywg.441.2019.03.14.03.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 03:58:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Szu973FZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4O3l-0004dr-9T
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 06:58:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4O3V-0004c4-O3
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 06:57:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4O3U-0001Kk-Ux
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 06:57:45 -0400
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:51218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4O3U-0001K3-Kz
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 06:57:44 -0400
Received: by mail-it1-x144.google.com with SMTP id e24so3922757itl.1
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RsewdT+73fe97clQejY9Co1xlOOg1NaB/DakbfuzrtM=;
	b=Szu973FZvDpqtqsqkW9kT5+Ryq8ElzKeKyxRHXYqgGilWN0HbwPjWHPi/qLx3RytCH
	i5xf8e27HGkvdZrOy1zEerjwgpWPQsAQw5iY/xVZEE/3MvhZbeOYSdYvEq+PC2eIwran
	7PIpfw5yEL5pp0OaXY2je3iJ47ha8f8YggzmIsLFh+kT0NkGoviwUqZK+aJtGrixP1oP
	Wgf1pNUn9OQeqjcgI2MPnidqbZ/FmAfbvjvBMHq+8nOAXe70sM/JcMwG7VSmoka4Q6nc
	EUDmVNt/PO4oFb3vAIZcTOdyPGH7RyWwqGbM5Y4CRfjASJFSLfnyzbk8XI6Ah6aBe55t
	irnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RsewdT+73fe97clQejY9Co1xlOOg1NaB/DakbfuzrtM=;
	b=VwE5921VktMPMIifa/m8F05xMI6XM3vgxTLHuQVz2bWKwdrqMwVRdSqZm0TeV/LpjQ
	9gt/8VFhUaAC6wx5+XjChOZHNH7Z4+DLtMCDB4HHZJJCOi33F+k2FiKkO3b3Ls6awHow
	5XXkNOxnMb7PmHY6IA7IIJKLDIxnrW6WPq5dN7yT5OoKPhMKX0wGH6gyy8T/88xK0mO7
	hm7jcMh5SdfGqkaOkjHQ/pNZKraQTf0CXDymcDtf6VDf6Jon3wUgk5B61DVhcurCLsBj
	3WHkEmskD0x2GBkxlPtLRE+FOcEs6wGY9rijA9zIvZ9lxLAOk6O91lzeUCdekmaL8Hy/
	efoA==
X-Gm-Message-State: APjAAAX/UbWx+YdbPvXQyRB212yZF1hIK/yauziOLNaqXjtGu6Jn4+GU
	HPO7yUfVCmF1vdhWy6o6D64N5vGHbiCHMiSsb06r+g==
X-Received: by 2002:a24:7d8a:: with SMTP id b132mr1771421itc.66.1552561063515; 
	Thu, 14 Mar 2019 03:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190314084235.9887-1-clg@kaod.org>
	<20190314084235.9887-6-clg@kaod.org>
In-Reply-To: <20190314084235.9887-6-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 10:57:31 +0000
Message-ID: <CAFEAcA_5rXmNEW+Yms8BhaFBn3UaJKNYhhO8xf76qWh6-zHj_w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-arm] [PATCH 5/5] aspeed/timer: Use signed muldiv for
 timer resets
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, Christian Svensson <bluecmd@google.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Jx+dGyJrWky

On Thu, 14 Mar 2019 at 08:43, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Christian Svensson <bluecmd@google.com>
>
> If the host decrements the counter register that results in a negative
> delta. This is then passed to muldiv64 which only handles unsigned
> numbers resulting in bogus results.
>
> This fix ensures the data being operated on is signed before it is
> ultimately casted to the final unsigned value.
>
> Test case: kexec a kernel using aspeed_timer and it will freeze on the
> second bootup when the kernel initializes the timer. With this patch
> that no longer happens and the timer appears to run OK.
>
> Signed-off-by: Christian Svensson <bluecmd@google.com>
> [clg: - checkpatch fixes ]
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/timer/aspeed_timer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 9988b8fbbf17..0b16eac8970c 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -275,7 +275,8 @@ static void aspeed_timer_set_value(AspeedTimerCtrlSta=
te *s, int timer, int reg,
>              int64_t delta =3D (int64_t) value - (int64_t) calculate_tick=
s(t, now);
>              uint32_t rate =3D calculate_rate(t);
>
> -            t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
> +            t->start =3D (int64_t)t->start +
> +                ((__int128_t)delta * NANOSECONDS_PER_SECOND / rate);
>              aspeed_timer_mod(t);

You can't guarantee that __int128_t exists. If you must
use it then you need an alternate code path for the ifndef
CONFIG_INT128 case (which is going to be complicated enough
that this should really be abstracted away into a
signed version of muldiv64().)

But overall I'm a little sceptical that the aspeed timer is
really a special case that needs a signed version of this
when no other timer in the system does...

thanks
-- PMM
