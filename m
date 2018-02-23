Received: by 10.28.71.27 with SMTP id u27csp486935wma;
        Fri, 23 Feb 2018 03:43:56 -0800 (PST)
X-Google-Smtp-Source: AG47ELtQWWUNj0psTBUlY5Xlm65YFIi9cADbbRQOwwYA8yygV+5L1B4uzvBFxWnFxqsnVL93MLyh
X-Received: by 2002:a25:42d7:: with SMTP id p206-v6mr764854yba.27.1519386236061;
        Fri, 23 Feb 2018 03:43:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519386236; cv=none;
        d=google.com; s=arc-20160816;
        b=aMC+Cy6rAUOAigkOkE/00HEqOM9o1mIZL1ViVJHgjLFLxdQ/P61Pba7sG0bEg7mE9d
         gHbNWG2I5RI+48MYNkddDK+xzinSRhyBrZK72ohVAwVdDkAzEw9yLxbmmnB96BIvV/Ct
         GB53mFk5cCJZ5Mvtmm14wp6voJ+7CAOK0msb5Y2/z/b2GCPSTR6laNs3mzsznyLQ6Iqm
         AARjAbiVFHJjx3r915EmlGUXtwZGw4IPmfjLEgDkiw7CJFR0DzI5VZKNnp9K9frrx/yy
         PZ+fb4QNSCL5lGXH+mO9E6ZWxkVLvWYWL0q42fSrpoNaNqbapzhIsIcBV3GPG7cA5yYg
         U4XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IPBz31nz9qyouYLqhK2BB4k6iW3XElnI4tyHjLmymyY=;
        b=YXLuxA6LAF2x2Z7KMiXDM+IfPJIf4dwDXqvKdLG2JrezaSVg1r+lFebLko3/fFq/5I
         SejXmuAEpg1xt67nfGkzyZHm+lb6Z4eEiOdQqvii5ZpFvdbZ23WZ6cxP7Pmjj10zRz5W
         qkKDYpFU6Rah6zAih0x74Jn691ISPzk3DiwWONKQtOI6qSl/W41u4GT/5B3GPuMe3VSn
         V6tLBimss+7iYcv6S/FOI+awabwKP8E2g+BNaMjzc82M/GuDQVc2BbCD2vM1Msnbz0i0
         DVfamnae5Tfx6H/U2PbeFIsZVcu628gAg8XPGAyi1Og/sERqFpCmXz0/QGBlBv/faB8D
         /v0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NZb0GOg5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189si361242ywc.558.2018.02.23.03.43.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 03:43:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NZb0GOg5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43859 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epBlb-0008Jf-IB
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 06:43:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBlS-0008Ir-AA
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:43:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epBlR-0001NB-Ke
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:43:46 -0500
Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e]:45702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epBlR-0001Md-EN
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 06:43:45 -0500
Received: by mail-pf0-x22e.google.com with SMTP id j24so3405595pff.12
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IPBz31nz9qyouYLqhK2BB4k6iW3XElnI4tyHjLmymyY=;
	b=NZb0GOg5nS/kdjA+THJ3Tn9O25rreONWnM/TaFUcIeMKafItlzYIGKah4s7srShx4c
	QIa7WrRBa32Ej9uGpna2rurrJ4Qx362/LCjIvCnZDeUkNwESC4eJOL6cndSWOje0N+3+
	iUC1EUNjTvsIGwqULWqOMYkwLZFcZ9bqWDoOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IPBz31nz9qyouYLqhK2BB4k6iW3XElnI4tyHjLmymyY=;
	b=YryXLF9CDHbDOe1vV03xBcVu2To3Fp1MlJCHbhPGloORbJltvrplYMpI6Rb0UBhL8/
	Y6isEZK7I2bcVQ9LCJGITd8GdQAXoaeVteUgeCTEmqNyzHNsmo5ou29Mosjr6I8nHYzn
	NFpEa8dIZYgFd1ZobT+pGEbo3VB1bDB0infSbyJwuG97y1kuXD2CL+4QMwx2xhU18zH/
	vJS4+0wYPbD36o51fhz0buoQWCQxBZ7knTq0Iremnc86mq8aY7hMI+jeJORj9RChI+CE
	n/yQWXKgMOgAWI7OGV82JC9t43BrJuitFERqZamzaXW5d2BymmUY12GaSS7yNv1Be9Kk
	kPwA==
X-Gm-Message-State: APf1xPCdsi5kSp8ps+ztSzZszPOa9ZGagDd2Uaj+Q0z9m9uyvMyUCQDR
	9CB7YUKAwkpCfNvzMX1oymPxgYkhsJEU6CdY7oMqGw==
X-Received: by 10.99.120.13 with SMTP id t13mr1241903pgc.35.1519386224487;
	Fri, 23 Feb 2018 03:43:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 03:43:24 -0800 (PST)
In-Reply-To: <CAFEAcA8h-Y8_zDL1mQuZTarMqWo9LwDgvgwEmpPbmYLfBvtRyw@mail.gmail.com>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-4-richard.henderson@linaro.org>
	<CAFEAcA8h-Y8_zDL1mQuZTarMqWo9LwDgvgwEmpPbmYLfBvtRyw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 11:43:24 +0000
Message-ID: <CAFEAcA9T-sqz740ux0YfhM357-BS6ONs4cYX_iMiy0NLzM1yWg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22e
Subject: Re: [Qemu-arm] [PATCH v2 03/67] target/arm: Add SVE decode skeleton
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
X-TUID: 67IsD7lOZBKp

On 23 February 2018 at 11:40, Peter Maydell <peter.maydell@linaro.org> wrote:
> I realized while working through the rest of the series that this is
> too early to do the sve_access_check() and fp_access_check(). Those
> only apply to instructions which actually exist, so we mustn't
> do the checks until after we've dealt with all the unallocated_encoding()
> cases. I think you need to push them down inside disas_sve() somehow.
> See also my comments on patch 8.

...I meant "patch 9".

-- PMM
