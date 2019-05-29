Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp9591027pjq;
        Wed, 29 May 2019 10:19:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw77jLgW3XrUsHgPIwfmhqenRZSEa01h9YPok84N/G3h4bERXJcJQx+hekIXDSYLnMaxdzr
X-Received: by 2002:a67:d68e:: with SMTP id o14mr48528327vsj.140.1559150389010;
        Wed, 29 May 2019 10:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559150389; cv=none;
        d=google.com; s=arc-20160816;
        b=qsGepZGalXWtN0xWF/4YKJC9UUuFDRoVaHPYsC9xlPZI83d3+7H5eK5dXMrk5/pcLn
         XoqE/pdZmztMgpj9O4svIE+Z5ZUhdL6uUu5nJ0a7w56bHyG6H1Vh5aBZP3WF7d9UYI/H
         +OQ3ap9IHISqoDrZtcSf9fx6XvaQctHTSRMRMh4P6zQrZNr7mzxM8Aya9Omiy2wHmzm5
         1Mi5HJkC0Cwx1D7k8wIg96dnTDwbx7XTQk2LgUNClTkdZLiZCVW7+b7PXFp03NcUMKt1
         jUG4Sr8H8PJl/hQ+N1nWRpPLK3WVAh6rjWybcVU1rgWaIeQZ6w1L+70SF7rg8ME8vBie
         221g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=s2Vf3XUHOtrZk+kyek2qQBzgKAlez1r7ITBpE4sqocQ=;
        b=Y5s0rZGd72RgSXg6V63xIe/XF4tkVfCVGYoeuX5idvJsAxpaIuDzjKmG762dtDWgwK
         3QqSq1EGiyk0mHjB1/3df7eGNPWcI05lQBbQxJ3fCJX5//Yx74GFJtL3PcJh1tBc333P
         ZFHTeGuwIXyJBOkNgqs2T3hA3ZTEJNHCZbb7WUTsDk2Oo62R+7y5BxkAino+hmMjvWmG
         RKamRCfOwWlxOHJhNRIEi758jTRyiDdRRM0raqQA4pYMhRBejzsUucFuCymhX45msI8l
         ktOMfwVjWH/5GStCgTQwTimZ8bWyCX5Q9W60lZ3U8U5UtGHDnCVRlYmtUJkZu5BNsJyP
         PrHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M4DniTv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si19271vsq.222.2019.05.29.10.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 May 2019 10:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M4DniTv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hW2Eu-0006gp-FR
	for alex.bennee@linaro.org; Wed, 29 May 2019 13:19:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <claudio.fontana@gmail.com>) id 1hW2Ef-0006fi-3b
	for qemu-arm@nongnu.org; Wed, 29 May 2019 13:19:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <claudio.fontana@gmail.com>) id 1hW2Ee-0002mq-5m
	for qemu-arm@nongnu.org; Wed, 29 May 2019 13:19:33 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:38057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <claudio.fontana@gmail.com>)
	id 1hW2Eb-0002kL-Qz; Wed, 29 May 2019 13:19:30 -0400
Received: by mail-vs1-xe41.google.com with SMTP id b10so2425777vsp.5;
	Wed, 29 May 2019 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s2Vf3XUHOtrZk+kyek2qQBzgKAlez1r7ITBpE4sqocQ=;
	b=M4DniTv17P19RZmh+ZicoUJSIOZ5JRiVr8U3HQa2t5KihSDG7+0qhKWZ9u56plmkwL
	33JSA4v2iICr3rPErgV8pQsBTlKsxZmMzf8eNpzg0xZhCPs4Dbh5Te9Sf0Ix6qVHR6JU
	d2ZEIqGFC6+pwF4Yl1OsY7g1EaXzD6oteV6oYEOxds33YaThAsIc839U40NR5r23T/ao
	0Ry/O1kcQsnJuCqiNN1TEweERMWEgumVNOEth+njDjE/J7i18RqYX2SPqgZT4xjKq0Un
	aHGvS5n+QNH57vYpiDBr0HSSepUFUQ7HAPTzz61Uq4L14Au8OvdcjuqvRxswtsTeSbv/
	td/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s2Vf3XUHOtrZk+kyek2qQBzgKAlez1r7ITBpE4sqocQ=;
	b=RRJcBBB31frokYazYpjpCUU/MPBG5ceqfFyVy1hkfUulvGKucpvekEli8Xl66V8fOM
	aNFd5NUh1MMYwzATh8oE4eyi7CFGBOBWac0FXpYFLG1A5ty31EGf0IpFnrgl1MHvdp5F
	Q2WBTyzq0L/GdP1sXnZdK8SOKBkp/btAVFbNSgjqzgk7NGym33vT/ia55ID2Z+kNmWXO
	7n887Er3kphTUymJiKvhSaq2+r8eDjUlk3vpUgnd5smTSkZYK1sBFlRz4RDGIcugP+qZ
	cUpId22lyePqUhrl7xesEfwxpC0JWkdfD2JYe/f5kgLXRnhwrS0+MpOp9EQFShpPdUyJ
	JHxw==
X-Gm-Message-State: APjAAAUWUuldRpoJp8xDqka9fwZcp/Te3Gim0K+AFXE6Eng0qt8sBQF5
	1+Y+EGtcjY9CCJ5eH9X9eZjZRHEq881GzoGoVC0=
X-Received: by 2002:a67:c111:: with SMTP id d17mr57768556vsj.176.1559150368772;
	Wed, 29 May 2019 10:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190529140207.20719-1-philmd@redhat.com>
In-Reply-To: <20190529140207.20719-1-philmd@redhat.com>
From: Claudio Fontana <claudio.fontana@gmail.com>
Date: Wed, 29 May 2019 19:17:59 +0200
Message-ID: <CAJuRt+q+KPJGTFoHyNaqV=ZxfLtdLu78xtRS_GV-JHvLJU7uCQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e41
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Remove bouncing email in
 AArch64 target
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
Cc: qemu-trivial@nongnu.org, "open list:AArch64 target" <qemu-arm@nongnu.org>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9rtYmdexWVH

Hi Philippe,

On Wed, May 29, 2019 at 4:02 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Claudio Fontana's email at Huawei is bouncing: remove it.
>
>     From: Mail Delivery Subsystem <mailer-daemon@googlemail.com>
>     Auto-Submitted: auto-replied
>     Subject: Delivery Status Notification (Failure)
>     X-Failed-Recipients: claudio.fontana@huawei.com
>     ** Address not found **
>     Your message wasn't delivered to claudio.fontana@huawei.com because t=
he address couldn't be found, or is unable to receive mail.
>
> Note that the section still contains his personal email.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

I think you can remove my personal email from there as well.

I think that Richard Henderson has been maintaining it in practice,
and that should probably be formalized in the MAINTAINERS file as
well.

Ciao,

Claudio

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1f5f8b7a2c..5ed917329d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2290,7 +2290,6 @@ S: Maintained
>  F: tcg/
>
>  AArch64 target
> -M: Claudio Fontana <claudio.fontana@huawei.com>
>  M: Claudio Fontana <claudio.fontana@gmail.com>
>  S: Maintained
>  L: qemu-arm@nongnu.org
> --
> 2.20.1
