Received: by 10.25.208.137 with SMTP id h131csp223974lfg;
        Wed, 4 May 2016 08:21:03 -0700 (PDT)
X-Received: by 10.28.154.73 with SMTP id c70mr10251610wme.12.1462375261381;
        Wed, 04 May 2016 08:21:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y79si5744126wmh.22.2016.05.04.08.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 May 2016 08:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1axybU-000237-2W
	for alex.bennee@linaro.org; Wed, 04 May 2016 11:20:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axyb7-0001PS-R1
	for qemu-arm@nongnu.org; Wed, 04 May 2016 11:20:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axyaq-0000By-3U
	for qemu-arm@nongnu.org; Wed, 04 May 2016 11:20:16 -0400
Received: from mail-yw0-x234.google.com ([2607:f8b0:4002:c05::234]:34592)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axyao-0008UF-Tl
	for qemu-arm@nongnu.org; Wed, 04 May 2016 11:20:04 -0400
Received: by mail-yw0-x234.google.com with SMTP id j74so86592583ywg.1
	for <qemu-arm@nongnu.org>; Wed, 04 May 2016 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ihqo5Gi0zgSJnRipv1qqxkLWTZEkq7APlTh/X0+xnZI=;
	b=DGzDxjmW+JShLQ2B9qxvpVwTMihZqvD85F+odCdjSJI0rlAFOkZ24a00Ld9SrChXMv
	kSkuwsJ/ep8xpc7WuYwcPJMgkKQ+3i4so1vKloV0RN/dBaDAI/AC5Sywzli41FRo8VrV
	P6ANFCBrksWu5yBJs0FQli6s5+ENoqu9n4Y6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ihqo5Gi0zgSJnRipv1qqxkLWTZEkq7APlTh/X0+xnZI=;
	b=AsKoLTgie0NZ1DICiYIRX/4YqZqanc9OeAu3xxErGGaKAuStI0y04rQj/vRb8lYtGE
	poV1R2CHcBnNWW2+jRC0tG8yN/3MezmbvMFAjOtN6N+emyjrLRqsgWSt8bC9Gfn9XpfG
	XS8MhjOO/adkuOkf2lyhJ9GZZ5phvgrBoMGE8iP+Q41VKCBnL1FpW3okIMnP0cSwRyxf
	mzhFeVGJ1+HMvJKPlm50HazvHu5o0wy8QwzJlQH6nR9w6xEcpZB1yfO4YF88gintq6hn
	4tKH0gy7i4GssMtQLANHiMsNAehGBW7jWebQGqUgh3E3qK1wOKS2fTB6nm9OF4CPgeuP
	h8Yw==
X-Gm-Message-State: AOPr4FXh4+aaATuAViMLjzfhFRydjG3yeQrQVZ4lcEmoBC5mCMItL/x/OHl1fi0vFp+qDLG0OFIUAQZEXHK6ugC7
X-Received: by 10.176.6.166 with SMTP id g35mr6051272uag.147.1462375181035;
	Wed, 04 May 2016 08:19:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 08:19:21 -0700 (PDT)
In-Reply-To: <1461325343-24995-1-git-send-email-sylvain@sylvaingarrigues.com>
References: <1461325343-24995-1-git-send-email-sylvain@sylvaingarrigues.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 16:19:21 +0100
Message-ID: <CAFEAcA80e3=4T6zJsxQNhZzE_a1A=sn6i3_qajk4naKBm03Mhw@mail.gmail.com>
To: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::234
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SUXgeACyjtpG

On 22 April 2016 at 12:42, Sylvain Garrigues
<sylvain@sylvaingarrigues.com> wrote:
> As the framebuffer settings are copied into the result message before it is
> reconfigured, inconsistent behavior can happen when, for instance, you set with
> a single message the width, height, and depth, and ask at the same time to
> allocate the buffer and get the pitch and the size.
>
> In this case, the reported pitch and size would be incorrect as they were
> computed with the initial values of width, height and depth, not the ones the
> client requested.
>
> Signed-off-by: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
> Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
>  hw/misc/bcm2835_property.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)

Applied to target-arm.next, thanks. (I folded a couple of long lines
that checkpatch.pl complains about.)

-- PMM
