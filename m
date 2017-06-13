Received: by 10.25.0.23 with SMTP id 23csp251645lfa;
        Tue, 13 Jun 2017 03:35:55 -0700 (PDT)
X-Received: by 10.237.35.37 with SMTP id h34mr8644480qtc.148.1497350155146;
        Tue, 13 Jun 2017 03:35:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497350155; cv=none;
        d=google.com; s=arc-20160816;
        b=aBA4SFvS6qNoANOs/S1epUhtls35NXpt0w8ZqAKPthLZ91oHqbc5DL7CBvVejl6uTm
         JODbJReq2pFL1N0wgaWypBIj0Mn7cyEApLQs9fNEbm5p4zIc1YvfB5UsTgG4mumpCHSc
         qQY4l1J/uPwMU3xQiCmCi5D2ZuYvA7pbRBFD4KaSvZwGst+5Kv1AOekxRptE6cJKKNSb
         2WwT/2rW+unPZWtAG9Mc+HTOq/d09T3kVsupaGGoasVKRnPBqCyr6L611tma6ctof9nu
         5WCBxUjWgOR36NfvXhM6Z5KAuS7T0vK/3PSj2nFNLS6iDr3cLkTt5spCUCJC6hEmx2Ox
         A81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=QVx5YwY+W9VCZNoCEgGHWN+aaQP6ZSslC3fxFIwbS/c=;
        b=ZJE7JdL5W2mfMtSXPCK8clIE2kcsjIliLqtF5CJmP4PlYlxtpJwq1a0BeQFhCHKAPG
         HzTXZkEKNNilKwtWwW9Gt3AFbeGPN9kS/3BD1//tk9HG48iPD5e8WVI9H7CZLiftSYmY
         P3vVf7wt7z5cQoM7VfBNJdBTmF6PocnyaOZUFJVEul6NF1aXqKlwoZB9OXrk4+ZnEYPs
         Bv9TkyiXZqHqz6okelYFK1f5RtJNPTviJHNw5yJr2jDFzTtukI6ejJsjxcYrpOo9hZQa
         nZrVe8P6W7WpVD71JmXqvN1gAbIMW3zDEX0FgNAUaZyZ8XRUIP59ZltJj4oH4K+1xIRZ
         IsOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u23si11338265qte.158.2017.06.13.03.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Jun 2017 03:35:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKjAu-0007k4-Ea
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 06:35:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dKjAq-0007jJ-HB
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 06:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dKjAp-0001o7-Sf
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 06:35:48 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:35783)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dKjAp-0001ni-DY
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 06:35:47 -0400
Received: by mail-wr0-x229.google.com with SMTP id q97so136543622wrb.2
	for <qemu-arm@nongnu.org>; Tue, 13 Jun 2017 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QVx5YwY+W9VCZNoCEgGHWN+aaQP6ZSslC3fxFIwbS/c=;
	b=ZNPR9gqh/os3Oc2Z3eK3XGd+x1OyvtgnHjKrgpzdugQAvhFSJPKOjMle+OMee4W5Iu
	qHgSfsr9WAHKHZR60OeD1/1FaGjf/yPcIBX12WYYrdysqqPuV6ofUyFtwTz/QvTFPKaj
	mlsUnRf7B6jhkcJYJq/Dn9icGT1Ikd4GIwwXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QVx5YwY+W9VCZNoCEgGHWN+aaQP6ZSslC3fxFIwbS/c=;
	b=GHzGec6qSSvixzxEe/x9jQq1GfbE4xJNBqRPrQIUrjW5Ukwkm2UBT28Q1S9JT2Ll9g
	rxSEG9BUoxhWVY77mdMAEKUM5+4Tw+AsUo3gla2mzQ6rZ1ApL+ajLr75yL6Bhqdg1zfa
	gblVVOHEkK+7YMV823LmABCbO3jCp16qzWMK30L2DJKiRsT/4osNGS1oXnI6nMgwUALz
	oo9h1+C9/Rws9hr7FUzL24tgrhAnv9qrVtYLIY9yx//hlNgyuyuJuUjbZPNP+CxdZogN
	hlQAW6OXm8ZwXzqjj8eK4I+fNC3+d0Ier690u6zK/XHp/QcsCIMtgOd7l90Yn6CrfPYG
	3JRA==
X-Gm-Message-State: AKS2vOyh2xYqSUi/H1oqs0itztEdKDz2JzQWAFtHygZaN0lm99Z9Bfv2
	vU8Mx01tcjtSUFx82bN5PF9nlb1CyhYl
X-Received: by 10.223.136.131 with SMTP id f3mr2549438wrf.151.1497350143695;
	Tue, 13 Jun 2017 03:35:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.55 with HTTP; Tue, 13 Jun 2017 03:35:23 -0700 (PDT)
In-Reply-To: <1496739312-32304-1-git-send-email-clg@kaod.org>
References: <1496739312-32304-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jun 2017 11:35:23 +0100
Message-ID: <CAFEAcA83mqkBv+=d9SH=zLRUu01ajTOXiQkZXtNbmvHw1HHLRg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [PATCH] timer/aspeed: fix timer enablement when a
 reload is not set
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7PY0jk5Cikmn

On 6 June 2017 at 09:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> When a timer is enabled before a reload value is set, the controller
> waits for a reload value to be set before starting decrementing. This
> fix tries to cover that case by changing the timer expiry only when
> a reload value is valid.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/timer/aspeed_timer.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)

Applied to target-arm.next, thanks.

-- PMM
