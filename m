Received: by 10.28.71.155 with SMTP id m27csp731909wmi;
        Thu, 22 Mar 2018 12:18:38 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48uu6EPWRpclptb9GniTNUmHZxdiA9yOdMn3N+OikomsaDtTcty+S3mgCdA40O/DZeWtiJW
X-Received: by 10.237.45.132 with SMTP id i4mr8652842qtd.64.1521746318123;
        Thu, 22 Mar 2018 12:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521746318; cv=none;
        d=google.com; s=arc-20160816;
        b=lvHofIjiqW8785tWO9nhj46oRxyMQz82E/RJssOaFocgfAS8GFrTk5FHsfTZbSexfS
         aRL9eoHnmr2sdqugte8bZdU91LZJHOfOEYweMlZByFSHpbIsPqb6AjOdqb4FaZ5ygCD9
         WME3GfSCGB26CfNPSToBtMrHqFBC41BQ8dOAzdrEeJATcNuWoNo5BmKq+Q6R2aG2jv1R
         RakqKBMZu1wdJQwkZB/sOw3WSD6mXby+IrIm8cdV7DC1smH9jlBRxbXKqi73HVtfpWDF
         IR/ohDcw0HMK0semJ30F0nrCaGh9a1wiOzzbR4/rxHLYfrI6mATqefXVTxk87XkZGWzn
         b5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6RxeY6euEZxhYAbNdzMXC9j8BvCtveMDyLGwXgNGgXY=;
        b=gg7dkBOG1rTRB+n//47dgg1oLl/jyr3kQDgF9YyRAe/0WZAM0FdWGP3OsaP2FeXE0/
         VrgDzNKuqe0NCpOIF4sQS9D13BeMC804pA24oosQ6rm0LMkjqiYa3+dCOI9h/qDpeXHF
         FXJixbiQ/qvNEpGVmQDU/H9BJNU+y9aU64G1BTTXL731ISGMpDS9VObrgv5CztP3HihR
         zKDeo0XVq2xNfe9BTNg7t6mh8P45E4v9hVf/SOLa8pNON/a0+l33HEBBXSltNXcZHv6h
         6dbGhFzF7uNKh36R8yvymm2+OaYe4I2WxhrlV6nbqGkqMuIeLbjMP/A1LCPF8en2ExQF
         E2Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OIcNWpT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s77si1246158qka.318.2018.03.22.12.18.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 12:18:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OIcNWpT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez5jR-0002JE-Iy
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 15:18:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez5j9-0002HY-Kz
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:18:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez5j8-0002FE-RU
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:18:19 -0400
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:40536)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez5j8-0002En-Li
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 15:18:18 -0400
Received: by mail-ot0-x235.google.com with SMTP id l12-v6so10701649otj.7
	for <qemu-arm@nongnu.org>; Thu, 22 Mar 2018 12:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6RxeY6euEZxhYAbNdzMXC9j8BvCtveMDyLGwXgNGgXY=;
	b=OIcNWpT7AiHfIDXqS2ni4b/et3JdiuSP3UQSoPpYhXMB0AGT8LDBZ3EYFeccmCohJi
	W/I00oGvcILmhd9+MNjbAM7UvXgfIrowu/u5rgfniEMFqgUGMQts+jEHuJaoged4KMa1
	QPV6noy9GgnhOaXnCFO+Ff/nNRUgk3/LfKnsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6RxeY6euEZxhYAbNdzMXC9j8BvCtveMDyLGwXgNGgXY=;
	b=ClaHknQfd69aYdBCr8RMctrpssurGyNqh7yVpmlVYRFCwd9Ps7JpkNHw7BRo4+lHJf
	dkiYvcvoZLaJ3wA02YQN3ZARsZVV7q9dF4uL7NU50JfDmmGvHaVTHxMcChA6A/O1bAKU
	Nw547m8gqEA2SixkmU8IyjTztgwzLzLU2GxLkrIpbY9evmn5ayW33eAfLVLQBh0ueQsS
	9kILrFvPyd0qYXnBfQbu8I2zmXX+Rj1ydx1TvR0odt0Nmi3KCBFBu2Cj4I1EvHgYqOvy
	QWKTLu452TzPzRseCzwBdVN+n0xd/j3kv3WjjFVvG5gKeGAi7bu9hFWPOBs+gIJhjjzn
	wt7Q==
X-Gm-Message-State: AElRT7H3Y2mrK8MTIgUNrNAX6Sjx8l9feCntlKc2SZ8XULzAePwZbW1r
	qqhzYbdZGoSD09CRV4H0CWjVZ/Uetfp6J8qbbNrNrA==
X-Received: by 2002:a9d:2ae1:: with SMTP id
	e88-v6mr17171317otb.308.1521746298042; 
	Thu, 22 Mar 2018 12:18:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 12:17:57
	-0700 (PDT)
In-Reply-To: <6137f1be-98a0-1b3f-6bed-ca94be1b5d1a@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<152174145840.240.3926671265619235661@71c20359a636>
	<CAFEAcA_Uxhrh2L+FghG7y2r7n36rfo41jKw9vdGZYo32nk28cg@mail.gmail.com>
	<6137f1be-98a0-1b3f-6bed-ca94be1b5d1a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 19:17:57 +0000
Message-ID: <CAFEAcA8K=dBh1SJUWCZtPGphDngiYMjqeVJG5LurSXOZ-KDk+g@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/4] coccinelle: re-run scripts
 from scripts/coccinelle
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Jv7E30CpdzM

On 22 March 2018 at 19:12, Eric Blake <eblake@redhat.com> wrote:
> Or if we don't patch the false negative, you can bypass checkpatch with an
> ugly hack:
>
> return 0 + (...) | (...);
>
> (I'm NOT going to do that bypass - it's too ugly for my taste)

Yeah, that's definitely not something we should be doing.
checkpatch has plenty of false positives anyway, ignoring one
more is no big deal.

thanks
-- PMM
