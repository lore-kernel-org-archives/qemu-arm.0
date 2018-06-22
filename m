Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp252979wrq;
        Thu, 21 Jun 2018 17:59:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIegAJzi9lk1NL3WreUSFupSG2eYd+GjG03qwd8wD/DijaVeRaNOYHmIxnvGYVQiHOnQfIm
X-Received: by 2002:a37:424a:: with SMTP id p71-v6mr24328619qka.209.1529629144920;
        Thu, 21 Jun 2018 17:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529629144; cv=none;
        d=google.com; s=arc-20160816;
        b=W2RwTxBS70LD1y26JruuZLzQpxw2fKXig7wGAao2Q7QWWCb7SxxHsh2cuP3sBYEy76
         yrUZ/6JqTzgN9fr6FU+IGaRXWl0KPxkE9BDdA3O4KTnu6ODzvfqv3G6b3P8qTKE8z4Hp
         B0rasFoy0EEaku1sSLTsmHUk+SCCWDouvCdUPT8nerfoBPS9EHZU3xFo+GT9rB0Jzueb
         SAZ2phquWtl3CgdNOPnfSVFZWC+gRKfGJtO5U0Ss3CWdznE9bQ1aXQKCUQ6bMO7Hiews
         1Q/+LsY+1UK9YBT582faz7owulgILZPuE8NTWv7A+oxzUgu1jH/ykXmFKhRmsHgHiMJS
         BtIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=YXVdYQmN7d4zPLOqWlFdRsbcRfgloVcuVkxTi2JQwiI=;
        b=F2FH8UtrHVaa53dt6LXY8jUFPsPfa1lispmigfotJCezGF0TWS+lvxxDHXuWwpZRy/
         LWzzJtOvqlkC9b0qYbWNBJovtcB+d3zBmJKVamwNTma6bn6itEKyYmxslDwiqp1YFmZN
         uNEyXAQ1QNQhoNmpVh5ziM6KFcgwjVBjQciz1FKQRnTJUNv9oeIn8RED/g21VTduBvoT
         kCyeRgZA3ySek1H6JIGgkKEmpaYpaGCr+2enI2X1FmI1YO20IRm9Ko71h6f4pdbWhew6
         6shVxOdyrPWyZidjSfXByP0ziAPHvzDRe0VIfEB2yeGhR/qs2tXuZkmcpgSzDCduzsXu
         U3hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VlywEBHu;
       dkim=fail header.i=@jms.id.au header.s=google header.b=FsqJocf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e63-v6si1216136qtb.5.2018.06.21.17.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 17:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VlywEBHu;
       dkim=fail header.i=@jms.id.au header.s=google header.b=FsqJocf1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWAPo-0001k0-Hp
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 20:59:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fWAPb-0001iE-41
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 20:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fWAPa-0006AJ-GF
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 20:58:51 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:39890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fWAPY-00069e-KW; Thu, 21 Jun 2018 20:58:48 -0400
Received: by mail-qt0-x244.google.com with SMTP id p23-v6so4630457qtn.6;
	Thu, 21 Jun 2018 17:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=YXVdYQmN7d4zPLOqWlFdRsbcRfgloVcuVkxTi2JQwiI=;
	b=VlywEBHumYIWKsvzstShMh9gRrLC7CUUZaL2VvobJoheq4LdXEYRWLrJH9q0uUYFFq
	jYSnLpIjoHVjKp+PKEXQj9kJdBUCURTjP1C2vYCWtmkZCYwN+OabA0VbGAyjjPLQaH4z
	M1GvGYMm5HF+2bO2Mbi2cLlxzEbf9xJGX7PB0EBlZgAiNxwCZM33Z30Ksks83u3DG4x/
	TwFrDiFRT0ttCg06YsWcMKb75Ac0o2fF2taBiAYyqBtkzLiJHTId+/dnt/gB/xLwMSmW
	1Dj+R8HQmBZ0h1zLjsVoVt4omhHkTQfmGfmQsM7cDJR9W8aLRNolUa9qjeCssThcJ7kD
	FadA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=YXVdYQmN7d4zPLOqWlFdRsbcRfgloVcuVkxTi2JQwiI=;
	b=FsqJocf14XtGpNLDlbWo12ktdzUNL8bb45WYRmW39b6f79UQhoBIVN7sLEhOdYZWV5
	hgs7IO3iguyAsU1fdD2KyvcZ5rtRS/lrslOmGgQhUt9LQWznF/lelWUv6T6gsDs5ZDR2
	VemylUG8AR23pihLhjnb4AImhLWrC9wszIh4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=YXVdYQmN7d4zPLOqWlFdRsbcRfgloVcuVkxTi2JQwiI=;
	b=pZVsdmq815Rx3q5qUgvdqSVdEYp45yGYtvcV26/2kFGCJaVU9KQahQGtbChoR4gryM
	bMbluFTMrawntuvPD0WBHDjwflmkVDzuZDeC60jGe4cb8KBnuzOkLWdIvVnRLPlZwvSk
	fqIrEJosS0nj26pS2kiVnzb6Bopkt89qsDz/ZafFyZdnd2SC+Ms+SI6C5oB7QgXXecql
	k6r4k19uuo281InPtiUhV7Vr1OqBzEoHP280r4wfB0ULRD+oiXc28baPY/gkozbTbtyl
	3oMhB5hmA4ngwEFvYwrCWckkvGENydoMNQAEUOyQaUWQ7nm1FiLhMHy6y9p2tP9P91X2
	lutA==
X-Gm-Message-State: APt69E2Df7RSXlNASDntCG7I2cvxNWkySXNtcqhxCO2GD6lwiYOB6elU
	wmgbcRbqTJuB0LPdwaA5fsbPkF0UsxeL1Ogl9Y8=
X-Received: by 2002:a0c:a2e5:: with SMTP id
	g92-v6mr24864692qva.60.1529629127905; 
	Thu, 21 Jun 2018 17:58:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:184d:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 17:58:27
	-0700 (PDT)
In-Reply-To: <20180621223946.20738-3-clg@kaod.org>
References: <20180621223946.20738-1-clg@kaod.org>
	<20180621223946.20738-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Jun 2018 10:28:27 +0930
X-Google-Sender-Auth: VqDVLU4kXbI3ilyCe4HdakRLCpM
Message-ID: <CACPK8Xd1+qziDk9TG0hjvTdSLfYs7nmTEm54_YDPK8O1x7nuuw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 2/3] aspeed: initialize the SCU controller
 first
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BbpMlj2C8Y80

On 22 June 2018 at 08:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The System Control Unit should be initialized first as it drives all
> the configuration of the SoC and other device models.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  hw/arm/aspeed_soc.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
