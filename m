Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp827367wrq;
        Mon, 4 Jun 2018 09:48:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJngS3V9xki1xno5UXVQObiidSKIF+zRP2yOPRoxpbN0RtV6Ox0OYW6/14ImmqEiWcxVodb
X-Received: by 2002:ac8:3358:: with SMTP id u24-v6mr21319460qta.31.1528130897443;
        Mon, 04 Jun 2018 09:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528130897; cv=none;
        d=google.com; s=arc-20160816;
        b=dJNaDkYQPQP4VVk+4tzfC6ScsiyR/+6xnoZd8fAWrVJuB1APm0VD9OsphzA1m7by24
         Gip/ou0T0IBNZUeYby5lrvEDoKQP//tf8OTMb3TSthFfjfwRHT9NBVeyWaN0eDCKWoQG
         Ks+I6KOQr5qTgxBrzGVxcNuySWC5dSA5TjFJXQuCdMyEZZY/nffUD/2EY1AFNfDT2s/r
         krhvx5IVzkTUKSEU0HVzROM+ElBhPTxq7N+OXrOQDUBoN7r+OfAZ7CbMVN0uYJSeHce/
         wq+POQfjOnuVkGCYFm7cVpzbhZROUAJfLH0VI8uPn7DonEeuLy33uUB43nxQSELQFJvU
         ti4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PD+XHfoCEZgQO5nP4j2K1XEIF6SXnzGJads6NZ3hnq0=;
        b=F1e3fI0EoKi1wwCJ3H5zX4gyNePRs1LzcXQhFen7YGvEkBSlCtHdMnf+R5jcdlDWvg
         kbh1dVaB+Ns2SIYtTVtynl1Brb2rrROTw1DFwhcaSoQ2SDtwMX09lpaHDi4QbOGk735B
         FG8G8UhzwN16Illov4tED6q2sKmu86m/2X3whqlu2T+Tzsbcsac78M7AkOkDPcGYr9T3
         dAcaItIpFbpGRMiojt9lU8miZ5sN69LkA6VeSVntre2JWdlQ/NpCPdbMAhiWw1tRDdEP
         KifPxFP3lP1liFjjkI+YGW9+eGE+qgxvDosb6I/R1OnmUAGPhuyxKSrNWF4fKMiNlrJH
         DH3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HJmekw9k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m100-v6si19586392qkh.104.2018.06.04.09.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 09:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HJmekw9k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPseX-0002o7-0R
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 12:48:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPseN-0002mu-GQ
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPseM-0004Uj-NB
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:48:07 -0400
Received: from mail-ot0-x233.google.com ([2607:f8b0:4003:c0f::233]:43012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPseM-0004UP-IZ
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 12:48:06 -0400
Received: by mail-ot0-x233.google.com with SMTP id i19-v6so7915587otk.10
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PD+XHfoCEZgQO5nP4j2K1XEIF6SXnzGJads6NZ3hnq0=;
	b=HJmekw9kIRM4qLgLn+95qTUGecYk5swS5+mw6PK2K7e8hJadzsVa8/P+NnDEfA/dEW
	KxYTgEVTKDueKA5qcUKR5GHRaxZ2FKLxvPzQOeMqzQFLnsqnbCqbbGI1AovKLgArX37h
	ydro17F1tGXrcUqOlUFBS1VAg06qFIep4gLmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PD+XHfoCEZgQO5nP4j2K1XEIF6SXnzGJads6NZ3hnq0=;
	b=WUi54/C3ThFrzJvCDFx6S/QNVyeehz6+vLhzfSIj+UCsRtItnyYvTxAI6yG7K7PnAM
	5ectVEEtbmT9AFFPZWMNqOHaLPNrwakbr89lFZ6/vl4uL1pENopUQCUJhx5XUIwGHX7x
	xqPgOPkN2hD6/nZULZvKB027yRcB0BJQDfn4KPbkIX3XUAJh8HJnshC/z3sxNiEKC5QL
	7I3CKI/NGWGBq6Fsv41Az7MoAq1N9lTrvZwK4jazAvi5Q+yyQTzgGzuUzlYo0dq7hKxc
	FXjfmykJHv96zo8CSOhZ4s9l/r+Cvs2BeIpNTEKuO8zhho0I6RM2VT0ObIw0LMBNwqBK
	AaTg==
X-Gm-Message-State: APt69E2i2osA44vfVfJjC16rjBcL3oW2tOwkqJ02qSeh9uWPZ+6rPUcL
	WB4ZnbJGi8R7wdvvjZOovsX9scN73yi7Yp9JFYDxvQ==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr12631971otd.316.1528130885914; 
	Mon, 04 Jun 2018 09:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 09:47:45 -0700 (PDT)
In-Reply-To: <20180530180120.13355-2-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 17:47:45 +0100
Message-ID: <CAFEAcA8EPLL8+2hUw2-gkV-Z8Yf1wX74BcAMKe5T77-B=kUWqw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::233
Subject: Re: [Qemu-arm] [PATCH v3b 01/18] target/arm: Extend vec_reg_offset
 to larger sizes
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
X-TUID: M3s+vP8k4Gnq

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Rearrange the arithmetic so that we are agnostic about the total size
> of the vector and the size of the element.  This will allow us to index
> up to the 32nd byte and with 16-byte elements.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
