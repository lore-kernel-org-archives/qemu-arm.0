Received: by 10.28.71.27 with SMTP id u27csp50053wma;
        Mon, 19 Feb 2018 07:26:07 -0800 (PST)
X-Google-Smtp-Source: AH8x224ZW8xcZotUFtVnwaTi3gAqMwfafvgRz4CjXJNGNde1CZCQlxlfFLw7/j/GZ25cLAb/DGYr
X-Received: by 10.37.187.206 with SMTP id c14mr10781300ybk.408.1519053967632;
        Mon, 19 Feb 2018 07:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519053967; cv=none;
        d=google.com; s=arc-20160816;
        b=nHDvcbfSVNM9uPgEq2a5sF9LSDLwfl54pdiOHxKqwD9PgYUls42lZ8eAjn3XnUtmbQ
         l9Bk2/czisiFlaSnNVZ5Bk9TILkZmZ8IS3nIldgwze3ni+Tkgb31g2uPwNsfPROTLqwW
         m8qGVwJb5H63IGXKyE93XOnB1xtn2Lw6JYtTpu4mBU5l1ag9oPGBUlaZoB5xkrbnk6Rd
         q88bxWHpBQMbLeLQtutsUqDxon+9zbujJ9He3JzDFtDXupuRzyIYfen35bv1FW+a9V82
         rcJA5Ro3DQUK9YOOgs2itvLYg/g/d2GjUF1lQtDU0Prk0vUfOuVdKAmJAtJDSz7alTxY
         xTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ahkdUIsMKqDl7y49Yu+3bv7xoFa9mTzF5AoLkQ3Tsiw=;
        b=SwwpJ+m71om/2V4dvnambdiFl/5wf6WpfTad9nVKVhbrWHAiv8Xa4BEb2yw3gOlGWY
         digeWN9P58nAj0zJuFtLdOxuuutSaRAjP2nJ2HZiTtu8sUlIhtg+bjmOQQ5qWoj/63ZM
         mKrD8i2i1ZQCwXTOcPcavYBfv7tjgXkt7u8j408USOvB4HX2fEwJXIsfkFprf31aUkEe
         J98gBsk3KKwgchwWxmJQuyKQy4RkeIyQbPLysmBn2WbnE2t5ee6sLf25D87meXUPZhkg
         F1fvuQDVn2wGTRCQGJ5JO0R3cucA822Z/dvqdvhVKNcaQKQkybxEibRq3BZizXDhiM7U
         utWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C1zEqqvy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n128si23093ybc.134.2018.02.19.07.26.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Feb 2018 07:26:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C1zEqqvy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ennKR-0006rB-3j
	for alex.bennee@linaro.org; Mon, 19 Feb 2018 10:26:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ennK3-0006px-FH
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:25:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ennK2-0003Ww-Ki
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:25:43 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:45143)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ennK2-0003W3-FA
	for qemu-devel@nongnu.org; Mon, 19 Feb 2018 10:25:42 -0500
Received: by mail-ot0-x242.google.com with SMTP id f11so3233360otj.12
	for <qemu-devel@nongnu.org>; Mon, 19 Feb 2018 07:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ahkdUIsMKqDl7y49Yu+3bv7xoFa9mTzF5AoLkQ3Tsiw=;
	b=C1zEqqvyZJHzVRSSz0c/m3VIQZlQYE30Q9fA0be4XXipFallqdw2zTt2zn3cNrZsU1
	dtEiiUntAxfPIBLgvPzcH20gM+y0J1PcgUKnyO11D3Gfmdjn9gETpI4lF9EnVXuJnOSY
	0HMO6q50kkB909odoAV7hKL8X7iPLBg2XU6Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ahkdUIsMKqDl7y49Yu+3bv7xoFa9mTzF5AoLkQ3Tsiw=;
	b=s6NY69IGHqy6nVQina9ohdeFfhptMPEivFtuWjAB9J32SNse2gcV8vRSJT2sMryGgr
	OgAiVUOIdpKHf3pxFiKPKea5BaSzchF0low8vDMuWXzxr8ZtRzeYwYHaJclUttzvj3LU
	HLcaw2zZRJMMCsJGEbgYEExgxGArUtqIG1f2LjVWkZTy/2G1NHs7zpwF/909uIFyU2rJ
	nSy8xpFKZe02T1Gv0/oF/8uI7XGE5gmKQiT6hk8yjolvQbTCt6T/77gFVfEw82uYeqy3
	RilUy8KKbq6MxIkfzxzrpDBIJ0/kV12bMGWnoDUWLw2ouHDRw2K/K7cVHcqMqmQS8p5B
	gKIQ==
X-Gm-Message-State: APf1xPAjJt0JPBNAttUV8uCa3no0aTydlHjOyx3E/A6E+1mlsxQMLwYk
	PIeTk+p50BtSxSMNbTt7WowTba6FYtr4qAqGUVdd4w==
X-Received: by 10.157.46.143 with SMTP id w15mr8568636ota.205.1519053941866;
	Mon, 19 Feb 2018 07:25:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Mon, 19 Feb 2018 07:25:21 -0800 (PST)
In-Reply-To: <1519053606-9817-3-git-send-email-minyard@acm.org>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
	<1519053606-9817-3-git-send-email-minyard@acm.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Feb 2018 15:25:21 +0000
Message-ID: <CAFEAcA-jTZMDNTF2rPn20DjSxu=z7n9M+2xo-pNfAYoha_LuzQ@mail.gmail.com>
To: Corey Minyard <minyard@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [PATCH 2/2] i2c: Move the bus class to i2c.h
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
Cc: Corey Minyard <cminyard@mvista.com>,
	Linus Walleij <linus.walleij@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6G5XDxIFFiQk

On 19 February 2018 at 15:20,  <minyard@acm.org> wrote:
> From: Corey Minyard <cminyard@mvista.com>
>
> Some devices need access to it.
>
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  hw/i2c/core.c        | 17 -----------------
>  include/hw/i2c/i2c.h | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
