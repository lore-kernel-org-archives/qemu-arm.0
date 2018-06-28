Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7384696wrq;
        Thu, 28 Jun 2018 05:49:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeJbdOO/Sln0AnOFv5KzECIUbBz+y3BxspoLDESX7lzRVZ0aPOxRSTglCv4gQrjimk2capm
X-Received: by 2002:a0c:9615:: with SMTP id 21-v6mr5721673qvx.147.1530190187485;
        Thu, 28 Jun 2018 05:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530190187; cv=none;
        d=google.com; s=arc-20160816;
        b=zYIInf+l/Xo2JPcPSMJV4wFYULfdK130+LJzyyWUq6TYA2kXQOEJUjLY1Rv8m+ruOh
         PCtKilwxffVae15wnsxNqjwvU17C5VUFJPn+h2dOsWMVzjhg1CxkuSiP1Azb424+FpAT
         DSf8EEZ/8n7ZolYdTXaRHi3Z1HYpD0XEyjkP/snLxceNGosCTpIxKUYvgUNaMdWspeo/
         5Up9EiovVtxVMN08UrObfjnxNVh8dID5qJdk5TmU/pPpNdZSE+c855j0sQ8rdCIqC1BW
         h087xpc8T6K+jDlyPRx8lSa5yPwK15NMLje2wOh/nUwk4xNJvxOhjMWlsqb/Ij1OamQE
         1++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CtKzQDm0Dp3HXmjdQ6w3X/Y3/qFLd+VGZm/qBX4/JiM=;
        b=hlbVJ1hZRhPpSAQBBPTtLo2e4zFW6mAF6VXTh/WSiGoZO1BZempXOSXp1chhHlVJaP
         50KhvhlB5vJX4f5A+7ssMdBYneqEk/SUTTnclc+stzSRtfFYLvoepJc/VrH1Z2tBX+dV
         dR2kLvJqzG9EWI1Syq9meYj/QN3GBwJEVQ8Pu2wQzp1PuNxiXaaHeitwCgaX0GxI8dKF
         D0vdLfOj6GhiZvU7QTcVx1oohR0YHy6Rj5vy4FJEMA4KIHS3d+rV/LZQfxjyeEajI2xN
         nckw9tmMfkVtqvDUmaKgORLj6nzkvRT+qtxJQSNuBuU5RVsbsnebiK/iU7EYyfwOxxqI
         t2fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EvJsmw24;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v184-v6si322164qkd.398.2018.06.28.05.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 05:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EvJsmw24;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYWMt-0001RF-3m
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 08:49:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYWMc-0001RA-9v
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 08:49:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYWMb-0004yD-Ik
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 08:49:30 -0400
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:37218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYWMb-0004xP-E5
	for qemu-devel@nongnu.org; Thu, 28 Jun 2018 08:49:29 -0400
Received: by mail-ot0-x235.google.com with SMTP id q11-v6so3766904otk.4
	for <qemu-devel@nongnu.org>; Thu, 28 Jun 2018 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CtKzQDm0Dp3HXmjdQ6w3X/Y3/qFLd+VGZm/qBX4/JiM=;
	b=EvJsmw24e9RKXWzTWpfxufQIFe5+kC/TUzxS+mEKpfeUexdqMa7kTGtLsnkza1jl/k
	5QDPAoZ9e7EP/exfbC9SeaebB1oj21/jCvvmCCzNZUr0G8RW8hPvnQCSiVDU2Jb1acH5
	kzn3cbDS1Ibqx9O6JI21UoVayJPXc6nC1MLmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CtKzQDm0Dp3HXmjdQ6w3X/Y3/qFLd+VGZm/qBX4/JiM=;
	b=E2W/IsQq4sivXTiKucLdb2xoML18V6PYwHccdA3X/Z+JcfdBpwXzWZT6SRjKkiSr7V
	DBR0tk4J38LGh/cuXpPzqnZY1VSDEQVZdAFhBm3EHMBhIEkRdzqQbQXTao4vROqiBw6J
	LzgsIbRRa1CU3pPaN2ES8TOQ10t10pRmtNwHvUdSIYrGVRI9KpHtTXcI8pcD3KWXtMXK
	EO0aNhy1k/MN1/a+guNyOO/OEDJBSs/7O1n1WceP4+GhrLA8OCxY0cUvGgktYsX9Zccz
	UOEMlL1eKhDerso9LBu0WuGTKQTxNC0kYLQcNd/BpNFch0QDdh7c9KLta680e1LnVwh1
	Noug==
X-Gm-Message-State: APt69E0tkqMJMhTkF0P33g6xZuR9M7AN3mcRBU+ESNHtq0FYqA/GZB6y
	BNBsy6U6XT6226I76fB2MdGlcSK0+3XCweq2E9bJpNN1
X-Received: by 2002:a9d:1a0b:: with SMTP id
	a11-v6mr5501860ote.205.1530190168738; 
	Thu, 28 Jun 2018 05:49:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 05:49:08 -0700 (PDT)
In-Reply-To: <20180627043328.11531-6-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
	<20180627043328.11531-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 13:49:08 +0100
Message-ID: <CAFEAcA8a6AkKB=x5YUyS9WBCK4gB9Na2n4byeiuAbOgTt9bfnw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-devel] [PATCH v6 05/35] target/arm: Implement SVE integer
 convert to floating-point
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
X-TUID: yPn0FL70LOFO

On 27 June 2018 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 30 +++++++++++++
>  target/arm/sve_helper.c    | 38 ++++++++++++++++
>  target/arm/translate-sve.c | 90 ++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 22 ++++++++++
>  4 files changed, 180 insertions(+)
>


> +
> +/*
> + *** SVE Floating Point Unary Operations Prediated Group
> + */
> +

just noticed this typo in the context for a later patch:
should be "Predicated".

thanks
-- PMM
