Received: by 2002:adf:f011:0:0:0:0:0 with SMTP id j17csp1125807wro;
        Thu, 14 Mar 2019 10:49:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyVbRmMAV7x7ozS3ElVhEjKxGB3oWkvuLGH5VjaTeVCC3MSfu3tlT1jDSa3yxmelg5nn2Eh
X-Received: by 2002:a81:4993:: with SMTP id w141mr16143844ywa.126.1552585768026;
        Thu, 14 Mar 2019 10:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552585768; cv=none;
        d=google.com; s=arc-20160816;
        b=WSvLLDFc6+0XMk7Z9uo/bjOnlSEfT+ecH1bqcGgPc2It1W5sJ8FsCL3t18K7DM6ph2
         rZ1xf4AUYsZQ42coowBPE0V6p05SzdAgasTFGNz2GcsZWSwsPumdebGSjqfi+ERfsdub
         oX2mHprsG/ItrcAufN6C8IjmC135B7BsAkforxe5AjG7gU4MKGXUqMShQZNB3EUzdVeB
         US/+Q9T8f7Sf5GGEVpgiy44KF3QSK4nfBz0QcO40MZXxFahDvOv93IZNUj2E7OB23qe8
         wwjCEo8f0GbxOAC5VYt9EvOHrDtUXvUfFSAgEUovaAmfzQFrewp6RSmEM9QTb46H5mv1
         /btQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F86ZUF2r1GTzeVpOKCfKI+UlHTlf4bqu+3kN0+sqVXc=;
        b=ndz7aVI9IUnW6GgLv5Qkxb3lWtsRoa7mBhpVkYOPoHgzD8gObVF8R4UwCqUP64BdtR
         Wg+l6sUtXcoIJK9mmJSVQjFhS6VYh+fphoxytl55wsMVJMj1FlvuQ6QuBSwVi8aZxzU9
         VRTXUiaNLPf1mpmrS7tAV6TFFn1oYcKYlVgf1SfTPqGBp84EgF8MMvWm6M28dTnpYgkx
         oGM0ZPKIQCnYBg3j9odiMqmBtgjslAA5AuZVJs2rHAuTaGGlEbY1WOhhjENDGgoyMyYo
         aXoRd1XhDC+cUZREivYrd+DzS2qgA7k7Zxf1q7MFSQ+uIT2A7MOkrHp0pentJzzOqgbG
         bHmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pTgGcQbH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l127si9132157ybl.327.2019.03.14.10.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Mar 2019 10:49:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pTgGcQbH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42849 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h4UTv-0005eb-Gx
	for alex.bennee@linaro.org; Thu, 14 Mar 2019 13:49:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4UTh-0005eI-O5
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:49:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h4UTg-0005YS-MP
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:49:13 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37657)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h4UTg-0005Xk-8o
	for qemu-arm@nongnu.org; Thu, 14 Mar 2019 13:49:12 -0400
Received: by mail-oi1-x243.google.com with SMTP id n7so4957828oic.4
	for <qemu-arm@nongnu.org>; Thu, 14 Mar 2019 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F86ZUF2r1GTzeVpOKCfKI+UlHTlf4bqu+3kN0+sqVXc=;
	b=pTgGcQbHGSoDyEPCa19o7MmwK4e+Cr1NS5yc52rK2LIXU0b62I6J3s0cOHTaB4GIo1
	/Y0zdCATU40esgVG6e4at5l4tmTGp6rt1FtupD7EtKGk93nRXdbJBevKqy7/MavIe3/J
	pyvqGHew/NRq5lrAvMr0ZXNxiRLp653Fh08sxO/gOi3yW6Gyj1AyjSoxGlYtanWEvm8z
	taG5W/2rv7aadkZSgra/Bvu4deD2r88pfLRrPHZi0fQyEBi9qC8K4L/ux2kW3+7hM3Y8
	hsSHTL7RyshBO6NWGxj26b2IlJVsipFTfsPOChDqKxSiz8kbBx+c+e2Q8U35w3HHpS9o
	DZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F86ZUF2r1GTzeVpOKCfKI+UlHTlf4bqu+3kN0+sqVXc=;
	b=OZ/dq28BSUEJx8XVwWTLa5s8ugx4xl+rZhMcYCrKVIr60Wxxk3ldWR6qKmyUlepdKa
	3oTmBJpu7Pj+oGc4gdgyohnwS0tr9DwnXfMrVJ0ehISfQUNbay431HMBQFbtoowSCikO
	IJSCZ/njJV0No5phxbWSh/yiyWym8Y2DeAaxROqWicrwDTzPGwuIYEG7U44R7g+q1oes
	LlpbCwscVZ1kIlLxlmtJBqM4JMF6WDmsH+64tlGmXastmMqjHXMbSdS60Pzn7UQWGrlS
	5excCDAnNp330XVRhbpm4/SAq/zTX++VC8iS8mvMb07sK5urZY+1wBf5qdGDL9BJC5J5
	cR9w==
X-Gm-Message-State: APjAAAWTPTRsxv3fXaUJsPViqS588KUac7J29dFhlTzjO1GZLAGus/TB
	34sc1MN1J+eRY/gYj5jHiGmE30JNaBQPe8sO63734g==
X-Received: by 2002:aca:4c88:: with SMTP id z130mr1569081oia.170.1552585751249;
	Thu, 14 Mar 2019 10:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <1552579248-31025-1-git-send-email-amir.charif@cea.fr>
	<CAFEAcA8dGr6gPGUcLhMqWKoC7aS40A4NssqFzHiKu0XhRKyE_Q@mail.gmail.com>
	<4daad4a8-93bc-05bc-1dfc-5652da3168bd@linaro.org>
	<6c85b09f-9c72-579a-5e63-7c5624311b18@redhat.com>
In-Reply-To: <6c85b09f-9c72-579a-5e63-7c5624311b18@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Mar 2019 17:48:59 +0000
Message-ID: <CAFEAcA9bRrW=PsHeCLqvMsz_p5eVNQSWyh5JABjEV5DJ-rsyyw@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] Check access permission to
 ADDVL/ADDPL/RDVL
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
Cc: Amir Charif <amir.charif@cea.fr>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PV28GybORSHd

On Thu, 14 Mar 2019 at 17:44, Eric Blake <eblake@redhat.com> wrote:
>
> On 3/14/19 12:34 PM, Richard Henderson wrote:
> > On 3/14/19 10:21 AM, Peter Maydell wrote:
> >> Richard, Amir -- it looks like you both sent exactly the
> >> same patch at pretty much exactly the same time. Any
> >> preferences for whose version I apply ? :-)
> >>
> >> thanks
> >> -- PMM
> >
> > Hah.  Bit of miscommunication there.  Might as well apply Amir's and have my
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Great minds think alike!
>
> My personal preference, if it counts for anything, is to apply Amir's
> patch, because it's always nice to have first-time contributors added in
> a release.  Welcome to the community, Amir!

I usually tie-break by whoever sent the patch first, which in
this case is also Amir.

Applied to target-arm.next, thanks.

-- PMM
