Received: by 10.28.173.206 with SMTP id w197csp873388wme;
        Thu, 11 Jan 2018 10:48:20 -0800 (PST)
X-Google-Smtp-Source: ACJfBosMsjU28Zx2tEjSeFxK8HiD3PSYxNAUbg1QnYL4uQGiwe7Ay2tlQWj2HWP3BTopEEdf4568
X-Received: by 10.37.203.140 with SMTP id b134mr21617041ybg.470.1515696500167;
        Thu, 11 Jan 2018 10:48:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515696500; cv=none;
        d=google.com; s=arc-20160816;
        b=VloO+m1CmjNO8UPoEM/E7K/PXhKA3IVQ1eCD7VZJl8hYNNZjVr4MGxZg57swD/hBYS
         HX32yDRpt8wPc//HaoLixbWzs2rQbvByCr63W+bvvG6RclBNpGX9SpeYxo/eTmQg6ai2
         NetKwjUFwyvO4ZseNHL00GlgLiw4i0TQ1ys1zD0IpKnwlyxASzIhn2rRJAMzE56WtP3m
         L6SFYVT3cFl1LcNknU1Xpq3DSvDBf//43hTM4XGq06NCEvOwVqykb2siS4MzXIPF9bT1
         vPYGnE1tGs8a4jT3StgAGk2dJsGMDVmVibW4yXKu9dS+Ckcj3whAaIRVuZ6QOzxUBy9J
         n7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CC2cl/q+iocJ0xe6pan8MayYEyvo92d8huu0/5j3jkc=;
        b=yyu/CdQpKOHn/wXhvfqpk7Kp4AX2SAyvlUSyCrmsCAH5SY6qNq8gaXbeCiyMdMgYAM
         fFWDqqfcCCYmSAElZULJ/OoLw7YwdvWRZV+6wH+8DhCFsGLoccO5VkXPNhy5rA5Os53A
         BgnNefCe0g7z1FgWxerYDex68CBJMxR6FiSBd96eQ68R/Bgqf2Pu098nICGzIiMYYVTN
         EWfiXuWQApXJVPhURMkN/sBMVLhx/zIx1GGeV2KvFUhY+zXGbgTddePsspiimyyoyZ5/
         ptGnXBKEDogkyWjsnNop+cdVw0IBB+7OQYaf8zGuPUhkMjjZhe59qSYwhoC1EkHM4gGa
         jqxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=STkunJEe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 142si1735780ywd.206.2018.01.11.10.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:48:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=STkunJEe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhtj-0007Tv-JD
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:48:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhs4-0006Cp-E0
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhs3-0007hi-MI
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:36 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:43314)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhs3-0007hM-HX
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 13:46:35 -0500
Received: by mail-oi0-x242.google.com with SMTP id t16so2281221oif.10
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 10:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CC2cl/q+iocJ0xe6pan8MayYEyvo92d8huu0/5j3jkc=;
	b=STkunJEe4pSdFQYIk1CiTWDAkjbc8oRhegU4H50hBWG4Xu+IGXNfP5MKEdBjfJCeQ0
	JFYHjgTlcZgLvLrLs1yBwlBG91uxnnLW7C6IRX5h5MmvyytnyYPM5TIOvISzd9qaF+Jl
	LMk57Ty6yR3RMQaako+qhXeHjFCDDyYZuAk6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CC2cl/q+iocJ0xe6pan8MayYEyvo92d8huu0/5j3jkc=;
	b=MkyhgqugA/JTAQ+obBe5dlHechFideUJ4LP0H1mYf4B+3hFYWGMbkmc6AjU2Nee9sV
	K04VYYm18HyZRTRuGaSVvEeZWsAhn5IvtFh1d7aXK+PQUGTc1oRA+3p8V0+aEP1rYWVt
	rp2h+nJ8h9/rOBB26Ah31bVkE3WN/L3gDOvPf5nCiBf3/vYhZlPjgA0yXI+kDTj1XUmY
	cFyRjC70WL/TI4c3lLSo1yxtFqJRy1xJqwOOgiruChOX68BoD5x18ifZ9h8A0sIIVveu
	fRA57eC11+SLXXTBffsBJr6kG5kvRS8aK3zMa/gy2LkuaUPP914JI7UhxdYqycf6Kb9s
	pEtg==
X-Gm-Message-State: AKwxytfHWtK2HNWEPOy8y3bR8Fs6KZYfJ2D41bRs7Uay2XU9eDnoJ8uw
	xkcSjAPnH1NePUqt9uNL3FJVcRTXatmT3EyBmbc1xPZQ
X-Received: by 10.202.192.69 with SMTP id q66mr4918955oif.305.1515696394842;
	Thu, 11 Jan 2018 10:46:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:46:14 -0800 (PST)
In-Reply-To: <20171218173022.18418-4-richard.henderson@linaro.org>
References: <20171218173022.18418-1-richard.henderson@linaro.org>
	<20171218173022.18418-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:46:14 +0000
Message-ID: <CAFEAcA8fVCuZj+9-vZbdJS7pZVY9dRsS09f3WLjNNWaDH5RLJQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 3/9] target/arm: Use pointers in neon zip/uzp
 helpers
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
X-TUID: G7mUbDma/OlL

On 18 December 2017 at 17:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Rather than passing regnos to the helpers, pass pointers to the
> vector registers directly.  This eliminates the need to pass in
> the environment pointer and reduces the number of places that
> directly access env->vfp.regs[].
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h      |  20 +++---
>  target/arm/neon_helper.c | 162 +++++++++++++++++++++++++----------------------
>  target/arm/translate.c   |  42 ++++++------
>  3 files changed, 120 insertions(+), 104 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
