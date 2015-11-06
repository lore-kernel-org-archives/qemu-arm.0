Received: by 10.182.105.169 with SMTP id gn9csp1107454obb;
        Fri, 6 Nov 2015 06:46:32 -0800 (PST)
X-Received: by 10.31.158.198 with SMTP id h189mr13940110vke.102.1446821192943;
        Fri, 06 Nov 2015 06:46:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m198si388874vkd.166.2015.11.06.06.46.32
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:46:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:39144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZuiHg-0004By-K0
	for alex.bennee@linaro.org; Fri, 06 Nov 2015 09:46:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiHe-00048P-5J
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:46:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiHd-0003RQ-7U
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:46:30 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZuiHd-0003R4-3o
	for qemu-arm@nongnu.org; Fri, 06 Nov 2015 09:46:29 -0500
Received: by vkex70 with SMTP id x70so15314919vke.3
	for <qemu-arm@nongnu.org>; Fri, 06 Nov 2015 06:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N72+kEzQKkZ4WZshf4JTm2/pMid8PsEKjNKKRNxJxGQ=;
	b=rxMxKxJWU6ziX5Xybs3QVWuU235ArlWYCQoUHS1F/94JwdI1PvTRZaXPy/6a+7WT5+
	y+Z5FeBDellnw/Ep2ShXHVTKVjV+bgSDHLKuzLjWQedDOnAqJKUqDn7yGosDkbgsNOl9
	njyH8TTHW9THY4utVvW7SEwMXdqEfHqzvq04OfbJ9GC5x6vK31AXqQXGALPBF2zYeVxW
	7AXSKQfHNfuZZK6/Il5zxYiBrWA4IGHHzSADsrCVL3HoBPfwFTM1AQgyOfW+NooACzQc
	ycfmUGeNLy3pv+HwkTvvTTjZ5CqNxxl0VqA8jlsSObXxAmuxS1oyMTJw7YCD7GGIgRYE
	6jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N72+kEzQKkZ4WZshf4JTm2/pMid8PsEKjNKKRNxJxGQ=;
	b=gnyEX7nxdDvIZpaZryA+uXrWZXySenJMcnW75+hP+d4MJ9nwy2BZUVHuyalRaqeUlF
	xPhzCEKKPSvruwrwtgvxh7lGz34/AnjLCMkGTmiRZKwq9zbVF68TI/8h/+95NBY9zPu9
	jP4Ax4pNbIXmlABFCHMVk8pQeop7k8R+HJwmKLqT08szIi3qCTbKHqB+859K3N5BnZVK
	MsKdhjbOlQKzvGwdo/X0FmYueyRwb3XSxdRoCQE49PRBr+zTIKHuNi1ZsIHVQ4Vqxkib
	IWE6SvjI43cTUfWqEwqUbbHBuz9mwT23RaxH0sUa7GQK3dt9f+HUMZihQNbKLrCEVyRu
	Z9Cw==
X-Gm-Message-State: ALoCoQmyJ6T9uZE3bd9f3OUJ/mbItmmO740MXWbgEcWzQgQ5MZu9m7dVRCwT0AqwZdX/bIDMqD9L
X-Received: by 10.31.136.144 with SMTP id k138mr13667944vkd.92.1446821188752; 
	Fri, 06 Nov 2015 06:46:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 06:46:09 -0800 (PST)
In-Reply-To: <633702099477eb5c12575260a763bf4e150217df.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
	<633702099477eb5c12575260a763bf4e150217df.1446428067.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 14:46:09 +0000
Message-ID: <CAFEAcA8egdw1svHp=eZRunR1VVqnW0r=PVsntKHaVwBu5scGTA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [Qemu-arm] [PATCH for-2.5 v3 2/3] arm: highbank: Defeature CPU
	override
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
X-TUID: Gytpk/VDf9F4

On 3 November 2015 at 04:30, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> This board should not support CPU model override. This allows for
> easier patching of the board with being able to rely on the CPU
> type being correct.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
