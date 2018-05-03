Received: by 10.28.4.212 with SMTP id 203csp1890946wme;
        Thu, 3 May 2018 06:14:45 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp+p6rXbGKZuXrbP7yqP1gFXvLybYqcD453kBiaGZkFspWYly/iMLKcYa0Y2xwMgmgH4IiW
X-Received: by 10.233.214.17 with SMTP id r17mr18258948qkk.117.1525353285635;
        Thu, 03 May 2018 06:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525353285; cv=none;
        d=google.com; s=arc-20160816;
        b=NLfxIAuJSkOHtZFsqcz9Ck7jrkw0n6BUGRv+RjHdhlI+Y1J+YdtOxOpmIF5LTuCI5w
         n7XtJIsSUWxw9qzqUEFJquMkdtoCZ5QBMJwp00lQa5w8mHQu8QuGCQNjOPTBfNKZJ4JD
         a6doAzwfwf3HcZh7L0HvYJng9KBqq9r9vF69fKFf0RKJzKkCPANIHaeqBrQKlGXKBeHV
         0XP6GdS0nf7m4sflaSFX2Tylch0BJTtJ5PyMCgNp+COLs0ex0MhloH6mNG0FyFDyLA8H
         KgdJF3iKEya/A/Z36DWRr5P7ZOrdYWtR0Jip7DHXnV1j6xuUbV1i5OtWQj64rAWKJeK4
         aczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ggbXF2lIoX3SkP6uoGjCAabY5KkrtB9mMa6yV4mm93k=;
        b=C8D1BYQ8UHaVeH51RpCDltebX8hmd6+zL4QQB9uX4Hyyy2oBDT/j3RCstxAY0/uJKf
         rrcBgnypYS7A3XWZT6T+7nGbP1ga8UvXJ1721FI+xatyVxAYB0YJzEyPx16Zz4oA/+pu
         5kUkAR9hMtu/WsEIVcn6Bvat758CgeS2hxYj8wHyaMJ/AgwJ2Jz50IUisrYyyC+ffO0N
         RVCVKEg1dG6U2TKPCLH9Abuo4WlZ9A0kNw7ihWEcGo+pqmU6A/Mp6GmcMNWHt17uVxV0
         cnUpeDdOeOaL2uITMHLKnbsHiX0dlCxyZCZpzxd0mXXs+j9rrmB51dTF4V3kR7z8z3SR
         cF4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JLy8n6t2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w2-v6si8128257qvn.267.2018.05.03.06.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 06:14:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JLy8n6t2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEE4L-0005PN-5x
	for alex.bennee@linaro.org; Thu, 03 May 2018 09:14:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60061)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEE45-0005PE-9F
	for qemu-devel@nongnu.org; Thu, 03 May 2018 09:14:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fEE44-0003a4-EK
	for qemu-devel@nongnu.org; Thu, 03 May 2018 09:14:29 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:36658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fEE44-0003ZV-A3
	for qemu-devel@nongnu.org; Thu, 03 May 2018 09:14:28 -0400
Received: by mail-ot0-x242.google.com with SMTP id m11-v6so14377211otf.3
	for <qemu-devel@nongnu.org>; Thu, 03 May 2018 06:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ggbXF2lIoX3SkP6uoGjCAabY5KkrtB9mMa6yV4mm93k=;
	b=JLy8n6t2LlFbm9LvBNoTYB6mSVk9vR5RlypmF2fT2hzGip0AkZRDQDH/d7bkRQDQNb
	fAanrA4fyBKnCJZ9uQjIbh11tG+FVGGxYcP3a+3m2qXfMNpmjaWNb+FfArJCXGA6n6D0
	hX+ZUCmGkmZydF6ubVcnJamFraiaZ5gYj1B78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ggbXF2lIoX3SkP6uoGjCAabY5KkrtB9mMa6yV4mm93k=;
	b=kqF2EkSrzsybsQ7/VI60qm21KKW/unjhSAGUN5Y/dys+DTHCcLvRCQZyLtv4u1BwQL
	Z7E00xW6W8RDaF+EfWWeGB1L7TRDWJikQRI/TMDRZLTUSQfRpvOKsTkdH6V1sJHU2RL+
	t9F1OsjUSUGdSDLqhzHqED7MT366D8xE2OegICN1WAhhoJbjOFJFqX5yxT4oIhiqBsQ8
	JmM6+dcO+ShKGWsXPKwPXMVezevi2+D08v6uTXhz9bx6fyPyo+wXJQVPR/iVi7OU7rc+
	EC3QLJdnxyASRrseYHTq5DjAFdVGSG4G4asA2GW4TLljeTD6dUmP3TOJrx3kpNhbacVK
	yVyw==
X-Gm-Message-State: ALQs6tCvP7XgwaKpkYnqJOj35jtCPK/Yw/ZQ8032C4rFMSY2XFc01GyM
	wZIDQyJq+RF/T4lkC0t6JqT/Bkx2AtIea/+P6gWidA==
X-Received: by 2002:a9d:16d0:: with SMTP id
	s16-v6mr17335238ots.294.1525353267761; 
	Thu, 03 May 2018 06:14:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Thu, 3 May 2018 06:14:07 -0700 (PDT)
In-Reply-To: <20180427002651.28356-3-richard.henderson@linaro.org>
References: <20180427002651.28356-1-richard.henderson@linaro.org>
	<20180427002651.28356-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 May 2018 14:14:07 +0100
Message-ID: <CAFEAcA8sB72ttJbid89g__dg1GbSSyiJBFbMHsnG8m49z-8a0A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 2/9] target/arm: Use new min/max
 expanders
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dQNgahAt5qMi

On 27 April 2018 at 01:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
> The generic expanders replace nearly identical code in the translator.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 46 ++++++++++++++--------------------------------
>  1 file changed, 14 insertions(+), 32 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
