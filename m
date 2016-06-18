Received: by 10.25.21.96 with SMTP id l93csp568001lfi;
        Fri, 17 Jun 2016 23:12:55 -0700 (PDT)
X-Received: by 10.55.97.14 with SMTP id v14mr7537788qkb.39.1466230375227;
        Fri, 17 Jun 2016 23:12:55 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m71si11016040qki.262.2016.06.17.23.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 23:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bE9V0-00013N-MK
	for alex.bennee@linaro.org; Sat, 18 Jun 2016 02:12:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bE9U9-0000PU-IC
	for qemu-devel@nongnu.org; Sat, 18 Jun 2016 02:12:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bE9U8-0002cW-7k
	for qemu-devel@nongnu.org; Sat, 18 Jun 2016 02:12:01 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:34068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>)
	id 1bE9U4-0002bu-4T; Sat, 18 Jun 2016 02:11:56 -0400
Received: by mail-oi0-x22e.google.com with SMTP id d132so145778342oig.1;
	Fri, 17 Jun 2016 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=97H+EO3SpBwvBtXA0uaAvdAjZ0xAHhWNAIsa6bhQWRE=;
	b=THMOTGohjtM7owB/jk0VRFTKzjf03FY5tT1oLh/3atwNl6iwg++qyUyPbUiimsXtas
	RDQIHVn/KMK+HlYSNZR1BYtgE+f2as8oMAJ76+IHL24/m/ysq/JPBNDjGU1GuMqBnQ3P
	7wVZ3IwbnMqYR77MiBeKUfVDlt/bCPT9YRIcsFPA213oWEIqpZhRl1COyzBChcFRPjy0
	AVeWsMH775fnjziix8dtxHU2enaFd0zm0qHsQ4TQUFM4RZ6tE5NP/wXP2kag0OziHoWu
	Ryj4o67LTXUUaRUWjtCNqHlXFPF8L7jPw+51AAD7vF/H4ZYPuW/kNmpxTegRKPLyo3lM
	TR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=97H+EO3SpBwvBtXA0uaAvdAjZ0xAHhWNAIsa6bhQWRE=;
	b=iDUTxDH0lkI62UGdt9Aj+6G3F0Ywp4rVwlW/GtvVo+pQIaephcmIHCpdmZZf+fg80F
	d1SpeWxxL6h3M6QDd5aS1Mm1uJO36rjNJ8qutljD9QFL49dgN0HZSGQnihbGAlyslGss
	/pksRjnJbw38vJKDDC4xdm4PkEYruePrlAxA+kJMCSLX3FnSauoI11WF3xLFQudq982n
	QdoY9cM6vJSdEYYaY5+mQMIWl2fa/eOwSqxo2+YKDhS+7ukiaWmdw4BMNeGWwk6m0QO+
	afvnNyHi+Gq3Nw55HBy7v9wByjZ/XAhQsnGHRWK/mc+vUJ2fHPQyaQDwn4iMOAA9pbnU
	jJNA==
X-Gm-Message-State: ALyK8tKD3oZB2o66+iGhuZC0pSNZZjTcYGJcTW0ffvuduWfInq3mGJ0OqGNa9aQ2EcUKX4MlgbAfuwX3JYmw5g==
X-Received: by 10.157.16.43 with SMTP id h40mr3245751ote.36.1466230315368;
	Fri, 17 Jun 2016 23:11:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.58 with HTTP; Fri, 17 Jun 2016 23:11:54 -0700 (PDT)
In-Reply-To: <630F50C7-F9D7-457A-8FEA-62CBED76E86F@livius.net>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
	<B8CD3C5F-E177-460D-AD9B-4636681ACFAA@livius.net>
	<CA+BS1oGcMDdG_j9M6zMV3gqV-Gjg=rEMdkCSzp3J=VXw5bu7QA@mail.gmail.com>
	<630F50C7-F9D7-457A-8FEA-62CBED76E86F@livius.net>
From: Tsung-Han Lin <tsunghan.tw@gmail.com>
Date: Sat, 18 Jun 2016 15:11:54 +0900
Message-ID: <CA+BS1oEq+So8xFBYNjCYLjXnmvw116sKBcC2c8g7wUDy=vVeMg@mail.gmail.com>
To: Liviu Ionescu <ilg@livius.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22e
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [RFC] target-arm: fix semihosting ram base issue
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DhnCsKgDmJJ3

2016-06-18 14:57 GMT+09:00 Liviu Ionescu <ilg@livius.net>:

>
> > On 18 Jun 2016, at 01:22, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
> >
> > ... It seems like to me that the issue is the default address assumed by
> qemu, which is 0x0.
> > (since Eclipse QEMU uses the same code, I believe they have the same
> problem.)
>
> it uses the same main code, but with many improvements.
>
> if I remember right, for semihosting there were several small problems
> requiring changes, but they were all fixed now. you can give it a try (
> http://gnuarmeclipse.github.io/qemu/options/).
>
> in addition to semihosting, which I use for running the CMSIS++ tests, GNU
> ARM Eclipse QEMU also implements graphical animated LEDs for a selection of
> boards, which might be very convenient for simple blinky tests.
>
>
> Hi,

Thanks again.

Actually I've tried Eclipse version, but I couldn't find the option that I
need,
which like I wrote in the previous replies is the ram address part.(not
just Cortex-M)
I need to change it to some of my customized created boards's defined
values every time I change to another one.

Also, since I need to work on CLI environment to do some semihosting tests,
I would really like to have this ram base issue solved in the mainline qemu
code.

Regards,



> regards,
>
> Liviu
>
>


-- 
Tsung-Han "*Johnny*" Lin

Page: http://tsunghanlin.github.com/
Email: tsunghan.tw@gmail.com
