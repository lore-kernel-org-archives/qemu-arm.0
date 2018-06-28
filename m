Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7614915wrq;
        Thu, 28 Jun 2018 09:21:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcTZqcbfPwEtjXW3YUTnt03csD04jJfUz7RcfYMkGEzzdEuCFE4AIGEftg4eh/HKqM2yn4K
X-Received: by 2002:ac8:2b46:: with SMTP id 6-v6mr9969469qtv.302.1530202894267;
        Thu, 28 Jun 2018 09:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530202894; cv=none;
        d=google.com; s=arc-20160816;
        b=cQZI2MWWFJb1gSw15XOd/cxse6XavYab0NNfS5UnxA9QXFwqLgk1LAi/ly3X//rSt6
         oJvLIT87dkt5Gg1ZNslxhIw8K7M4X6dEYr/WIDck9qvcYL5Y1ts2POfIurkrV38VAuRW
         EKaBDzVsAqfYBrJPbohn2Tz2YKpa9KQKdRRXcyR3YBSGSP1p3g9pVF5sJl0RjVfgExHn
         eZLfSuzoZDlMhGZPwbH0khmcMsia4TG5qikseKPkJJVJsjk2lN8Q45J7ZyRHrPiZTFGt
         DkIzkcBw4lUP7JapryYaeQzHGQqo4aWk9cmgmH8snclMr3hSDVzxTnn8emLxpg8JVdEp
         D2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=TVrgWhYqukCwHBm0DQD7ctQxxvV3Oawv0OpO+1G4gD8=;
        b=f49d3TjGP3fZbK2YqUcYCI7EzlZ8LCfgA7JfQ2NwyHNMKvde5HM1RxPImQ7Lihxe8u
         Jf349Mcnn983ZZSNBM9lPN4UEziBs5VORT4eUMIxOtBzVYi6LxgxNUi9UjMsS+lLOYyk
         2AlaYuFxQ2Zpqc/8e3f9qk+twZKfozeH4f7SDD53J9L9l3sLthABHKz1rfL9CW3Pt2To
         DKLeIdllZygQyeSrEgc5e0LAImIjlwB6ZIderzds6AFPsbrO2Vs+XrzPX7nsOIKa8aIu
         3doNUgHZeYKRnndtTu4UmNR/jRNtNlfgIbrf+UxFLSoYpJMNzyWT6DV/e+20K2Ucw9ZP
         +Gaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Syh2js6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s80-v6si3885636qkl.219.2018.06.28.09.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 09:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Syh2js6S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYZfp-0004Hj-Lg
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 12:21:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZff-0004H7-TF
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:21:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZff-0007p1-2P
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:21:23 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:37898)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYZfe-0007nT-Tr
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:21:22 -0400
Received: by mail-oi0-x241.google.com with SMTP id v8-v6so5734258oie.5
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 09:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TVrgWhYqukCwHBm0DQD7ctQxxvV3Oawv0OpO+1G4gD8=;
	b=Syh2js6SRo7SmNEI0HFzS8QESEp+rOAIn+1YZ8GFaZ8t3P4F/A+Afb2HlAWE8lkXGf
	jBDfRmvFNsGocAfq5+ZmOYGsqgYOByPNkPj7NHrQB9R89xLW31LY2j0ubohW/fDjXlZ4
	DoTkPsRVzB0ADkWQM7vTDCKNWCg+a+WlNaExk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TVrgWhYqukCwHBm0DQD7ctQxxvV3Oawv0OpO+1G4gD8=;
	b=PAb5vA/rpbJK0mbuA1+fusijO0kTWG5ua2cf10H372QwWK80n1cK5yeLkCNyqnrecW
	a/bW/p8Iw4+lNDKExTjWc8Az8XvFcUT3fDHwyS0ZOParVIG0ggzn0TKXJi5VW5HBLIP5
	+aCnLyxPLdTrSn5NKQmpMDIDea8Rxd8iG9u3CgqEmPefKY9BRglpHPrB9N3krlmDkJ97
	drqwBNJEw8hsVc/JY5bu1Cx7bIZNPLosd5yFvu3uyghxvyxNi/slXY9E2X1/bX5arU8h
	exis1i4u7EChbQ+VSG62/OmP2V+58I0FTiOwfVRxtcYtwAX5bEWTUgx3vIKY5yiWlsP4
	NXWw==
X-Gm-Message-State: APt69E0WG3+ZEWXq0tpTn6xnfz5pEjsJ+RgXNHxOOuW6S3IES+CfXQ2z
	L+PFyyfR0yQE7NZsTO0EW/n0F8fzIv0zlyXheNbKkQ==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr5737209oic.252.1530202882321; 
	Thu, 28 Jun 2018 09:21:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 09:21:01 -0700 (PDT)
In-Reply-To: <1529699547-17044-6-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-6-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 17:21:01 +0100
Message-ID: <CAFEAcA8S8hxQy0O8bqWjRSSaRLKp7QG=MWfw3XG5OupOsxEEDQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v5 05/13] target/arm: Remove redundant DIV
 detection for KVM
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: um2lRixt400I

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> KVM implies V7VE, which implies ARM_DIV and THUMB_DIV. The conditional
> detection here is therefore unnecessary. Because V7VE is already
> unconditionally specified for all KVM hosts, ARM_DIV and THUMB_DIV are
> already indirectly specified and do not need to be included here at all.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
