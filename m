Received: by 10.80.166.35 with SMTP id d32csp2608968edc;
        Mon, 24 Oct 2016 05:23:47 -0700 (PDT)
X-Received: by 10.55.24.214 with SMTP id 83mr13818066qky.237.1477311827844;
        Mon, 24 Oct 2016 05:23:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 89si10760491qku.328.2016.10.24.05.23.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 05:23:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byeI6-00080p-M2
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 08:23:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byeI1-00080e-9h
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 08:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1byeI0-0005Fr-FF
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 08:23:41 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:35459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1byeHz-0005FV-QX
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 08:23:40 -0400
Received: by mail-ua0-x22f.google.com with SMTP id 90so9868212uan.2
	for <qemu-arm@nongnu.org>; Mon, 24 Oct 2016 05:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qoMHNLsxnXa2yNlV6ykmhGhx6quGRxjscd9ty3fAQLI=;
	b=NFHJqxD8ZNbcxhJwje/7i+6ihC+h2cdZtmLLAgiL5YVQ/2jjeRg7u8MFzH5h6p9pey
	y9D7BjEmek0S8RbLpTIxg8+B+hnbgo7/EBDQt1Vlnk/L7UHCRAF7UoCeMJexH+UomKZd
	31r6ckfV+HYww1XNGiVVRx2PNqvdkUSdGSk30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qoMHNLsxnXa2yNlV6ykmhGhx6quGRxjscd9ty3fAQLI=;
	b=QlpRD78nUbNR6hWGGMgGH7WcfgUOE8T0joB+qbRKaoR46lwkqjhcM4Frkd5hqYphB9
	2ZZVz5HUQSI6FXcXIbfx2F3DI/3w3BfZhVYXd2F+eXg3m+hIkBVIqbFySJDVh9EwI+rV
	Gz3al1SC9hbYxlGFe+cJXU6E6Ifk0VHeFaFh2+B9umsfumzF3jdUr+b5R8vgjQWI4v5f
	2sUxbOhBqfx9zoth7p8T7NVNLagoa7wUuU0DM4lb5Jeh1BpfzAgHoMOy0Twp5tJT9H9Q
	EU/dW6Odcc35HyPusP1cbhyD24DmqLj4/KilkbODrtcRUksJJp6QjVWyfVuX71A5TO0G
	dsrg==
X-Gm-Message-State: ABUngvctRU+8FP1zftiiVe3A84HxQWYippBtfwL6PSBcqsjhmAesomBMAiW00CEuG5vtCUJ5FrYrDAqq9v/LxnsI
X-Received: by 10.176.2.50 with SMTP id 47mr4224096uas.8.1477311818654; Mon,
	24 Oct 2016 05:23:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 24 Oct 2016 05:23:17 -0700 (PDT)
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2016 13:23:17 +0100
Message-ID: <CAFEAcA_d_25jOmWYn1SPm9-_-+f6fsPUv+QzoKXEwTUojChrmA@mail.gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-arm] [PATCH v17 00/14] PTimer fixes/features and ARM
 MPTimer conversion
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9z0ZlFrPzusv

On 2 October 2016 at 16:53, Dmitry Osipenko <digetx@gmail.com> wrote:
> Hello,
>
> Currently, QEMU ARM MPTimer device model provides only a certain subset of
> the emulation behavior. This patch series is supposed to add missing parts by
> converting the MPTimer to use generic ptimer helper. It fixes some important
> ptimer bugs and provides new features that are required for the ARM MPTimer.
>
> WARNING! I based V17 on top of the Paolo's patch [0], however I don't see
> the original mail of that patch on the ML nor in patches/patchew.
>
> [0] https://lists.nongnu.org/archive/html/qemu-devel/2016-09/msg06734.html

Looking at the code we end up with in ptimer, we seem to do an
awful lot of adding and subtracting 1 everywhere. That makes me
wonder if we're missing a simplification which would collapse
all of those out (it seems unlikely that hardware would really
ever want some of the policy flags but not all of them, since
I think they boil down to "timer==0 is a real one-timer-cycle
lump of time").

That said, I think the behaviour is right and this patchseries has
been around way too long already, so I've applied it to target-arm.next.
If we can think of a simplification we can always apply it later
as a refactoring with a fair degree of confidence given the tests...

thanks
-- PMM
