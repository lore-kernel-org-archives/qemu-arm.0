Received: by 10.25.208.211 with SMTP id h202csp299416lfg;
        Thu, 17 Mar 2016 01:51:02 -0700 (PDT)
X-Received: by 10.140.100.244 with SMTP id s107mr12177967qge.19.1458204662574;
        Thu, 17 Mar 2016 01:51:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7si7042542qgf.83.2016.03.17.01.51.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 01:51:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agTe2-0006NA-5C
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 04:51:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agTdz-0006Jl-CK
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 04:51:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agTdy-0007OT-HS
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 04:50:59 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36164)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1agTdy-0007OL-CI
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 04:50:58 -0400
Received: by mail-vk0-x22f.google.com with SMTP id q138so2008932vkb.3
	for <qemu-arm@nongnu.org>; Thu, 17 Mar 2016 01:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hVSaBvCx8Lje56ZZlSuj0G3lCJGXUWR7NEcYsUY+1J0=;
	b=MZGIK4LikyoKkXWVETySQGihczc8Wx+g6AnpK8hVGAxRL72ZL5t/p8/8sfmsT225Bv
	fsL52KSiWT5a0712y86yE97jrnQr3buqQmtsMpBBaiGbYWUUtfY8+6961pyU9pI/T8qP
	BxNxqC6/X6wrbzAy7RTAd9Lu6SVokCs1KbcWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hVSaBvCx8Lje56ZZlSuj0G3lCJGXUWR7NEcYsUY+1J0=;
	b=gsJNON9Bkl23wUbJelZYkAwwroJ5XjOVNd1QjzT53ydelIXKxw9QMa+A/v2f3orMG0
	Y96CKKF4V0NORVKc/fZI1x+chc8/OTizOiIIP7FLH/TwFhv1dRnhEWDp/LVjLfeNy7fH
	1BCSO3A3Qb1K01kPzGBweM5dhD9e/MejwcKfE7ZMH6W4tFx8N3ztCu2RvM6XveEj05E1
	lahZAI0gkiK71Sf707tOaCd5GUiBcIPq8YcQCgN+xfYjTqWB7wHsw33W/6TZwWOUF00B
	EU1QYuJxWCkzhxLM1Hss5RAcQ6uww4SQFHA7Dtb8XUTOH3hq0Kbc7U7qrDfQjLwfedzv
	I6Ng==
X-Gm-Message-State: AD7BkJLdastrmdZ0L+d8Tp1ekWvW677JFDrcABJzMK6XKgWaOlmXAfb25Ueuaq1VvjexEfAeocd0ZYUNYErfHt5Q
X-Received: by 10.31.52.147 with SMTP id b141mr10236784vka.82.1458204657936;
	Thu, 17 Mar 2016 01:50:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 17 Mar 2016 01:50:38 -0700 (PDT)
In-Reply-To: <20160317040935.GE23495@pxdev.xzpeter.org>
References: <1457422582-28799-1-git-send-email-peterx@redhat.com>
	<1457422582-28799-3-git-send-email-peterx@redhat.com>
	<CAFEAcA9jCwLnG5QKTG9Hd+r8tVYSN6A8dwWp2JMPV1rMUAAjLQ@mail.gmail.com>
	<20160317040935.GE23495@pxdev.xzpeter.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2016 08:50:38 +0000
Message-ID: <CAFEAcA-jzgMHH0=sMqv8+NB2=xgEP-0jWmYzP0M1om=8uDR6Lw@mail.gmail.com>
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 2/3] arm: qmp: add query-gic-capabilities
	interface
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
X-TUID: EvVYYqI4awXy

On 17 March 2016 at 04:09, Peter Xu <peterx@redhat.com> wrote:
> Thanks for the review comments. Do you have any suggestion on which
> file should I add this in (or create a new one)? I failed to figure
> it out myself. :(

I suggest target-arm/monitor.c (we have a monitor.c for other
target-* already for monitor related functions).

thanks
-- PMM
