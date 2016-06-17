Received: by 10.25.21.96 with SMTP id l93csp462253lfi;
        Fri, 17 Jun 2016 15:23:41 -0700 (PDT)
X-Received: by 10.55.146.193 with SMTP id u184mr5309058qkd.13.1466202221417;
        Fri, 17 Jun 2016 15:23:41 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f128si33481568qkj.174.2016.06.17.15.23.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 15:23:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bE2Au-000190-Tv
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 18:23:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bE2A2-0000GR-2l
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 18:22:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1bE2A0-00059m-5S
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 18:22:45 -0400
Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236]:35282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>)
	id 1bE29w-00059R-Ok; Fri, 17 Jun 2016 18:22:40 -0400
Received: by mail-oi0-x236.google.com with SMTP id v7so25870793oig.2;
	Fri, 17 Jun 2016 15:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=20kL/MP7+Q1p8kVeXDGSTKN+Phw0HUD6a37z0u+dsx0=;
	b=KT0bXAM+BFPe7WfBzwSdjLIsAFuObnY9G5BNkWctq88s+j9oajq2731Xq3Ob27YiD3
	uaJzn++yKUvwthlnbJYlVwnJPc+oyZNJEdQrXNhDUUr7+xl9Ap9NUGl4ztpJEWn8iW8r
	cNp52zmiGmNlS9rGYhTOlxLEz1ukwn/Qt0HM7nOVLw43lm8NBcEhZGE3tONv8efkvZ01
	uEtoM5XrYatn4ybuu96EYcD0JZWu0yzDlHUUBcGQ6OJQALhugQ1gcH/2jyNdQQlrcBo3
	J73PDAnNkDBW7ymwL3T3xAaHXnrUtDl8uy4lW36XsojKJX0C/B54Kr7OODr/RP28nlG9
	Kk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=20kL/MP7+Q1p8kVeXDGSTKN+Phw0HUD6a37z0u+dsx0=;
	b=LJpCG8S5D9YgI8jgptC9TbZGXGB+Rw3YcfNpRYvMm659a5nLtJ7luurjzp7IUdyEpV
	gFm33O3ynXvxzToNjT82WHH+bKtegeXiJiy5zNWNO+yyx3ZdX4D9+Xf/WRVl6awyh7dl
	+UrE+RsKW+TU+MKCKJn34eIz8PhsLokdtUMr+gTisXhoZTbW/WY6wnnLCZ2xrh5Yx81T
	VFI5ZwIsBjWzRtJQnodI0chVtvo/prnB0tXTCCBbdEbdgL1DSuHLSAfc/N6+P0mRhcI0
	DGPeQLGRUMb/4eRC1/museUVy/3JNNFZoMRo/cmcOkh296KhV8PwwIeHzKo4qjKVtMZQ
	r7Pw==
X-Gm-Message-State: ALyK8tK5Sg9HHMCqzuCkoX1zIjJSYzF2edyDodHIG87cSAlq+UYAR3YEdVqGa9njcmrPglN0V6N60AKvJHS2Dg==
X-Received: by 10.157.13.45 with SMTP id 42mr3345394oti.194.1466202159952;
	Fri, 17 Jun 2016 15:22:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.58 with HTTP; Fri, 17 Jun 2016 15:22:39 -0700 (PDT)
In-Reply-To: <B8CD3C5F-E177-460D-AD9B-4636681ACFAA@livius.net>
References: <1466131046-25516-1-git-send-email-tsunghan.tw@gmail.com>
	<B8CD3C5F-E177-460D-AD9B-4636681ACFAA@livius.net>
From: Tsung-Han Lin <tsunghan.tw@gmail.com>
Date: Sat, 18 Jun 2016 07:22:39 +0900
Message-ID: <CA+BS1oGcMDdG_j9M6zMV3gqV-Gjg=rEMdkCSzp3J=VXw5bu7QA@mail.gmail.com>
To: Liviu Ionescu <ilg@livius.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::236
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
X-TUID: EMXYHD0gLQDb

2016-06-18 1:22 GMT+09:00 Liviu Ionescu <ilg@livius.net>:

>
> > On 17 Jun 2016, at 05:37, Tsung-Han Lin <tsunghan.tw@gmail.com> wrote:
> >
> > Hi, I made some changes to TRY TO fix the ARM semihosting issue ...
> > This problem has been bothering me for quite a while.
>
> semihosting was the first thing I fixed in GNU ARM Eclipse QEMU, and since
> then I use it constantly.
>
> I don't know if this addresses your problem, but perhaps you could also
> take a look there.
>

Hi, Liviu,

Thanks for the suggestion.

It seems like to me that the issue is the default address assumed by qemu,
which is 0x0.
(since Eclipse QEMU uses the same code, I believe they have the same
problem.)
But it's not always the case.
For example, zynqmp's ram base address is 0x80000000,
and I have to tweak that address in HEAPINFO handling code every time I
change to a new HW config.

Regards,

>
>
> regards,
>
> Liviu
>
>


-- 
Tsung-Han "*Johnny*" Lin

Page: http://tsunghanlin.github.com/
Email: tsunghan.tw@gmail.com
