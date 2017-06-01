Received: by 10.25.0.6 with SMTP id 6csp872245lfa;
        Thu, 1 Jun 2017 09:19:08 -0700 (PDT)
X-Received: by 10.200.52.39 with SMTP id u36mr3080798qtb.231.1496333948198;
        Thu, 01 Jun 2017 09:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496333948; cv=none;
        d=google.com; s=arc-20160816;
        b=ZzAiTadCPqEOvYPI7tJfeTHze9/BfxqNwSQNulVc6mN9WSxdDVL0xU5/7CKHeem3+x
         f72fV/DsSbjDtAKkybgjZfDEwy0YhjSrs7HB+pM4ibqSmgk4gOKNWIavO+OGyss3AbcK
         oRq904AIEIlEqJSB14fDZfwWEFgFmujdWevfoJriE/3F6pdlPZ9ugkQFOJIrcAZHVc4r
         hD19thoRBsbY2NkpSeCn7FJu3F62R/oAcQ2ZDilAwgBgqlwAfjlmd+obIV4QOJJNiqQ/
         f2TTkrWXa0z94nnRZQfNNRN3y500OT2dnSzS2ICUchXkrcKDjj+3gMJAB9T5OzAO3nci
         xqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ZGbFv8ylSAeZNfqr+96uWJkD4HcQiSuK/JBfsBvu4mM=;
        b=Bbst1tdEXgWDQiDCZKgRcWNVPNeVApTZWq+ylJWyDOu2yXlPEKHhjfKh6o7zyD9YVJ
         KMePO35wbj6Vemxa7Q0kTkooh+f2Evg+ZZVyFuOAwM00TRa19AyWUwXM6OVGUJWKpGCw
         sFP8IVryWdO4Z+CErtFYCM9YdEy0Db5+jcZA8S6f35sAfAwSqQ7osZgacXxZS4lEnrzl
         5ihRN5qaUyrOihNo5XycxPBAylaYlcl+DLfx2VmypgpJGoHnzDVMPdb9Hc0GvnIkmfh9
         TveaPC/QQsSXavosM4JesvKzqte/NeZx9KQVGU824PQutXaEMuAQxqwfPI7jCJAQM/Lu
         3LpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 27si20454500qty.321.2017.06.01.09.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Jun 2017 09:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45625 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGSoT-0001UL-GY
	for alex.bennee@linaro.org; Thu, 01 Jun 2017 12:19:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGSoO-0001T5-0f
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:19:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGSoL-0007k5-ON
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:18:59 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:36826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dGSoL-0007jH-Ec
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:18:57 -0400
Received: by mail-wm0-x235.google.com with SMTP id 7so163984754wmo.1
	for <qemu-arm@nongnu.org>; Thu, 01 Jun 2017 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZGbFv8ylSAeZNfqr+96uWJkD4HcQiSuK/JBfsBvu4mM=;
	b=cdgZh+tovKysLye3gbpOvL3h9yHdPM1+BkPpx7I1OZMsc7pJTU6EoTndpImT+RocQt
	P9qlq/MCd1oW0Jakk4xdi7sCvyhE0CzTBWU7aY3M2lvMEmBEjc9cGEmhLRJndDEhQwAv
	hhh8pAk4yg6sMdARGnT0ai5JlfI5ulTMXpR4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZGbFv8ylSAeZNfqr+96uWJkD4HcQiSuK/JBfsBvu4mM=;
	b=ld7ERFUh3r3OPCzpmSE0jZsgroi+R096cMFmb1uSztR/Umw4tqmbudjSxbgE+bjcxV
	5IkKi9m4DBJGEuTm83EbVQsYo1QgPKt5lHgJx3OIznyJUT1tMmkwS3JmtoduWw/U60xN
	5Srlus+wP3LeYIXKDadZGHpSKw0+ZgPO4ntdZce2GerIJDObJIz5ZRHAmIRKky6g3HwU
	KL3mWlbrLGLss4CZ32hWehcexkRLGfSJEWSvhM1rTZuOLz2UItAynbYfL6+AREXvm6F9
	v/8hcg945B48tNCFkFckqpbrQWP2lZGfAHmIR4uOcZMtDtCiAx4IK1nyQFniEp8eYu9q
	3gqQ==
X-Gm-Message-State: AODbwcCi7vcRW42zeNoTfGnOCv3+//GFk3sB9eHcr94EYdydiTjFrB2o
	4HTr7s4/DFxYlzhOGrK7Ht9f9xrwsB8Hzjg=
X-Received: by 10.223.150.139 with SMTP id u11mr1883678wrb.195.1496333936337; 
	Thu, 01 Jun 2017 09:18:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.178.66 with HTTP; Thu, 1 Jun 2017 09:18:35 -0700 (PDT)
In-Reply-To: <1494827476-1487-1-git-send-email-clg@kaod.org>
References: <1494827476-1487-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2017 17:18:35 +0100
Message-ID: <CAFEAcA9ex_kcN8JRcBw7M-cz9mZvQDb4AsD-3ra+97aui0qFfA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-arm] [PATCH 0/6] aspeed: I2C controller fixes
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JCRMmKJKljxO

On 15 May 2017 at 06:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> The new Linux driver for the Aspeed I2C controller revealed some
> serious limitations in the QEMU model. This series fixes these issues
> and also adds a couple of well-know I2C devices to the Aspeed
> machines.
>
> The QEMU model now supports the recent Linux driver and the older one.



Applied to target-arm.next, thanks.

-- PMM
