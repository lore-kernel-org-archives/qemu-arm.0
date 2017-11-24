Received: by 10.223.159.82 with SMTP id f18csp2180561wrg;
        Fri, 24 Nov 2017 06:37:14 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYsp87Ig9z0tE1tja9PC804J+ORr8IB9yaZLui/nYajZNPN8vOqo3kbcaFPbOfuqh7R9iEe
X-Received: by 10.129.49.84 with SMTP id x81mr5553428ywx.191.1511534234185;
        Fri, 24 Nov 2017 06:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511534234; cv=none;
        d=google.com; s=arc-20160816;
        b=BKPIMKBusbHheOED7562DNdb6xYgCId8XfQHZdQwnbhomjMmPHfzL1E9racb5u0edS
         JJdeXKVBvZ9gB2lkGx8vw2MgzKt3mOJ9pzOdSnQvDzrN8m6+STaId2Jf4t7aoWco5ygR
         hgmQPW7ReaKY2X/2Z9uwwx7KTVwIi6EZ34fh5thEsnT3PF3swbVqN1uFrt4IFAKonshT
         gYx8Eory4cztYhMhECbmAEDXWsrtf2Vw4ZV6SqtyhnDdRbDA4jyNcsepVTkHGR3uIv2d
         KQ8Y8nrXb+1Z/B+HXvGbAFEckuU7hf1rkvurUz0WCN0nhs7DN9/hRaxBY6pCuK6HHjlY
         whbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2GO01TH1W3ZtPCYDUnYtweE8EdJ0NLYH8JOrQWYzCT4=;
        b=jZeFfJGnlO62wIe7BlrSjWHTX3XIaLxvRHAypNgoGdNqjYsR3pu7SFLW8goDuHMGdW
         pjFhZKWHEKtpRdOQvXdWm79Wy6ZKwNxyGW0rXrSJjNKZ8PiqV/ATPjMdpavTKtAFm1Jf
         CBk7/zEjta7U1e/aRM/6jy+0wniHKZ5R0cxWi2I5VaR05+qy9pOFYZmLD5LiYmMYGSBG
         TUYKevQsJLdr0arn6VJiLFTi5ILKcTal08+luQ+pEK4kr143pwmusqsHdlmZ5XJUDcHB
         Mp2bfceLVqCWwcXH1/3ERN0PGrKaWPP7vWAWZJFQGVffzYq811KZNB8we6QDoYevG96H
         puvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SH3hKhgL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u63si3787470ywf.154.2017.11.24.06.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Nov 2017 06:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SH3hKhgL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49605 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eIF6P-00054p-If
	for alex.bennee@linaro.org; Fri, 24 Nov 2017 09:37:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIF5R-0004kH-BE
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 09:36:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eIF5Q-0003tJ-LM
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 09:36:13 -0500
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:40275)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eIF5Q-0003sg-FS
	for qemu-devel@nongnu.org; Fri, 24 Nov 2017 09:36:12 -0500
Received: by mail-ot0-x236.google.com with SMTP id g104so18947430otg.7
	for <qemu-devel@nongnu.org>; Fri, 24 Nov 2017 06:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2GO01TH1W3ZtPCYDUnYtweE8EdJ0NLYH8JOrQWYzCT4=;
	b=SH3hKhgLfbKtiuMpvD3zVfUQMk9/wd8umIsHZd1tw6vIzSlZh7ZxZG0yrKhIr4o7ty
	orZE2Aba14xBYKIB5Oa5CRDlM2Xz5TlLRaXw0JiFxvZWXd3FXI6P1Pu5+P1ljR61X93+
	3AYTcreXk9ysfL44u4uGgG2oEGr8W+8YbWg70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2GO01TH1W3ZtPCYDUnYtweE8EdJ0NLYH8JOrQWYzCT4=;
	b=RZGQuR8PRuAKgojSn/FafY3ppgxINZI61BIuP6kpURxBEaaHLDM0AzNnhXJrzDWzSs
	xC7GjUBUWV5HAitv35DRNvkibstqUAKBAGjlx52lYg15JCB4X91oMeYZzeRlZYDGRK+J
	IY7sArneINBizRG5Vy5q/pGExnL1/srNH0mgHObAXnbI9biaSfbrZLnixzG4/4GEWJ9y
	i0Dk5H/LY44NvUpZOP5tdXkwE5HSwb5BZ5ygmpjPVF8fOfQdRJJfM8wGzcRbhHBgxYtE
	ak4EWdZm4OPYOm7TUVBeNheaijkmGRD872Bg0C11K5yp2y51v0j0Vu0o2fKzaEvHEuLy
	YWaQ==
X-Gm-Message-State: AJaThX6TgE/X5OWY6SHhph//xCP7lCSalab8eYEJ8F1VjhkFN2W/iKvL
	Qrv5DDFg1jXAq+nV9Saaqk4zV8to4yYHqGFO+BQy9Q==
X-Received: by 10.157.90.6 with SMTP id v6mr17988096oth.54.1511534171697; Fri,
	24 Nov 2017 06:36:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Fri, 24 Nov 2017 06:35:51 -0800 (PST)
In-Reply-To: <dd80f8f3-26da-5893-fa4b-cfa31790394d@redhat.com>
References: <1511533107-5315-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_K4f=mmuoEbyuFCHP2dor5p2UPyedteELQoxPYFzAcEg@mail.gmail.com>
	<dd80f8f3-26da-5893-fa4b-cfa31790394d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Nov 2017 14:35:51 +0000
Message-ID: <CAFEAcA8mqRsOYPVOu=tPqDuXyHauKpoF3AQ-bQgiqv5514o+Xw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-devel] [PATCH v5 0/4] ITS Reset
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
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y7WHGOAN8z84

On 24 November 2017 at 14:32, Auger Eric <eric.auger@redhat.com> wrote:
> On 24/11/17 15:20, Peter Maydell wrote:
>> Thanks. My remaining question is: how important it is to
>> put some of this into 2.11? We're getting quite close to
>> the release now so I'm getting gradually more reluctant
>> to put in changes.
>
> I fully understand.
>
> Anyway clean and comprehensive reset modality would require v4.15 + full
> QEMU series (otherwise you get the scary error message even if full
> reset can be achieved by individual register writes).
>
> This means the migration of guests while they are booting will not be
> functional in 2.11. However it should not abort QEMU as it did before,
> with a kernel >= v4.14.

...so overall, what is your recommendation for what we should
or should not put into 2.11 ?

thanks
-- PMM
