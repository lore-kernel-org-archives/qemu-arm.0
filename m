Received: by 10.182.158.201 with SMTP id ww9csp426885obb;
        Thu, 17 Dec 2015 06:39:37 -0800 (PST)
X-Received: by 10.140.216.14 with SMTP id m14mr62410683qhb.90.1450363177752;
        Thu, 17 Dec 2015 06:39:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 64si1890030qgj.38.2015.12.17.06.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 06:39:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9ZiT-0007uj-EU
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 09:39:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ZiR-0007rA-5X
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 09:39:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ZiQ-00075x-BW
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 09:39:35 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:35923)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9ZiQ-00075V-1P
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 09:39:34 -0500
Received: by mail-vk0-x22f.google.com with SMTP id f2so8732682vkb.3
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 06:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JyEvFwBQne+dtzCGID5ZWAmNGCYnOm0wfCc+vRmkOSQ=;
	b=NMElNtH2fkJ9uTNjfp8c0GfUbXX+cNi7MQJKeNUT/IFRyvLITg6SoofnHZJAGvJ+9A
	7e+rLXWfO8w7T3P7QqnAbkxZtI0WTTeiJK9oZ3ejHRajfHQTI9U4J5fHTdHlIuOIE8Vn
	GQ85MPF4sJA9xAX7xOAp5nVXYQNeiYH0/2SNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JyEvFwBQne+dtzCGID5ZWAmNGCYnOm0wfCc+vRmkOSQ=;
	b=idxqkptiMwAcUnHapmLmPTKd7hNdQi05ip5E5ex+3YhGzIcebTfCNNCKmJR+zuO4d3
	SYfImxu36TFn8mBwzb2AYkEBQr4q75pZfvwKWJNCetnkNlCBAjyUIbvJidoW5ZHFOg+F
	OO0bxEXU7kcho/cKXgiKn9hE9gYhnJwJ2/0dhvUvRj4A2SFttNhFJed8LIVRCTAE+cxM
	dh/xJ+ZVlWLPGwCqBOxUWD6k7Fs2/uskChaHsqzI7oHi/D7jfO8dnOhsF6CydlT/6w0Q
	ZtSJ2/QuOu4kdQt+ESrdtnbaYF7vr+gcpGJ50R6jDTOixedtLhySNmUhfqUrxI34GKDi
	Zjqg==
X-Gm-Message-State: ALoCoQmBHC1gfnL/PZIuHZirfJ1XVCJAO7X8gSt8q41UvaqE2Y0GCqUTrvSj77xCNhnztH8L8SIleWvRqwKBdiYEzqBuTwI5CsR1jDKN6FGcl3bBUfZlCZo=
X-Received: by 10.31.180.145 with SMTP id d139mr34718408vkf.83.1450363173661; 
	Thu, 17 Dec 2015 06:39:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 06:39:14 -0800 (PST)
In-Reply-To: <1449101933-24928-7-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-7-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 14:39:14 +0000
Message-ID: <CAFEAcA_qbaJjuZQB91dsN11U3pJRBXCJ25i00U1G8gu4OQFCtg@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 06/26] armv7m: fix I and F flag handling
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
X-TUID: BvkIhoR15D1Y

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> Despite having the same notation, these bits
> have completely different meaning than -AR.
>
> Use armv7m_excp_running_prio() and the highest
> pending exception priority to determine
> if the pending exception can interrupt preempt.
> ---
>  target-arm/cpu.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
