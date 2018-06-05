Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp188644wrq;
        Tue, 5 Jun 2018 10:10:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLSEnQ+UUPWVWLgVb4BHCg7a8RO7W/EUVf05sg0eHHLUyobApsSDcou8MeS1EN7UrLBtX3R
X-Received: by 2002:ac8:948:: with SMTP id z8-v6mr9008308qth.211.1528218657008;
        Tue, 05 Jun 2018 10:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528218657; cv=none;
        d=google.com; s=arc-20160816;
        b=VJmJYPmibZ7FhaYs821OOU+7xoKRIsqFr5GrneT6tHcX484qnusjvT6j1OrRgzxbSJ
         uuuAKv1qS60znHbol3jMoSXOWxN3pNuCAsIoIOLmvQpeYSLYRzgFuGJq/i3EMywTERV0
         1edu/r3W0hQmYmy6TIoDOu3UHvDdKXgmQLBhNLopbXKROiYB8R4pc3KC10yP8TvnWbQs
         Rf4xlgGGzogasPXJnJN5HrXnVVxuasx7KlsbAVizsawaIs+ZMj8N7SsTwLzpm15RSn3c
         LZ8l2KfZYzk5OegM1erGZ2Q8mQurjccHwL5AJQyJuJuIGrwgB0h9yxVcSXtApGXpaVfS
         F9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dRZXz9bM1GxlZu9Xz0WALZBTRLMggTCVXOMXCRrAWds=;
        b=SOVool5k4XWC4UGQRM58kzVYFr9oRjJ5o5pL/XvxEKio0VD1kG8uwp6rS8yxMqHUzT
         mqf18UMSeeZNq3SodwcOi5J/Ki07V6BVATuoITNfWu19TnzN9KpDtJV04BZFlDpcXcpz
         KxIZ8xqgs2jKTvH2r2qh0r2Qg8kqMnmHCNhg0nxIxJ7/1XwjRZSVxQw7zICmEBytQv+J
         HXnDCQq7W3rTy4esgaTocl9Ss1SSo/PIy0TDFf4yfTzigWRyvtaIA6Nuag4WDa2rLOqo
         rpfwmmtiW50zIfIwSnuGVZ1VkyhlXpWzs6+xgk4Gc72mme16gBRCX65H5oc7oVYU7M03
         i4Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZYQJZjBT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k31-v6si17802774qvf.138.2018.06.05.10.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 10:10:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZYQJZjBT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQFU0-0000NZ-Hp
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 13:10:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQFTh-0000NM-U3
	for qemu-devel@nongnu.org; Tue, 05 Jun 2018 13:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQFTg-00035Z-U5
	for qemu-devel@nongnu.org; Tue, 05 Jun 2018 13:10:37 -0400
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:35197)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQFTg-000355-NW
	for qemu-devel@nongnu.org; Tue, 05 Jun 2018 13:10:36 -0400
Received: by mail-ot0-x241.google.com with SMTP id q17-v6so3724319otg.2
	for <qemu-devel@nongnu.org>; Tue, 05 Jun 2018 10:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dRZXz9bM1GxlZu9Xz0WALZBTRLMggTCVXOMXCRrAWds=;
	b=ZYQJZjBTOKLf9vlmssu8xT5dlYe4Fj676vI7VmET4baNILWvsnj3HH9gDwKAJaeTxP
	Tt63r3zvpFLmB2jDnwU8t3ustLfk8NqHrNPDypuQGR0H4CjFJNEmr5F8hrXwlA9V6PTn
	XuX7S682SxvxHelT72yF9b7EyO0Nj03deNpuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dRZXz9bM1GxlZu9Xz0WALZBTRLMggTCVXOMXCRrAWds=;
	b=aDUQrDq8vgxbpiorFprDI51eFzfDNWB5eeK6lth8oqIbDb4WhFnZQnMFCZQOxkJ92X
	fDGCr0032RXsM/JgNx+jPWe1jSd8GKnd5P7c4eanmn3GsBmX33iuxHHpBmariex3XMM8
	4EBeIQfRHVqg287XYOiO2f5Nve+upBI2p65FxvAzAkIvVv/EW/2L4yXe1+60Nlzpz4eO
	KG8/gFHHPzdN8S1X+Zr+ElntD6bxgHWIaaQqw2PsNta8GnNzo79NUKHO8hfbahRDtOW8
	hEnNArjZE/n+G1IdNn/6KJKLewWj4kyTJS/PsmjYuvkbzAuF5OLdK8ys1mjhlO/U4wNB
	qJLA==
X-Gm-Message-State: ALKqPwebYH0CUkV1GDVu8ycoCXDV1Pxr51AVl9qWoUmTKvg8UAprsn/I
	72LtPQuWoXHRb/ajXE5h/n9R5idqrxDYvqJE0bJrZQ==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr19417762otd.210.1528218635927; 
	Tue, 05 Jun 2018 10:10:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 10:10:15 -0700 (PDT)
In-Reply-To: <20180530180120.13355-14-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jun 2018 18:10:15 +0100
Message-ID: <CAFEAcA-OJhenKFwXtentkb-pgg87a_Lzf8WP6TuoVif-Uaj2tg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-devel] [PATCH v3b 13/18] target/arm: Implement SVE
 Partition Break Group
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
X-TUID: 325ZOBM0G+Vh

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  18 +++
>  target/arm/sve_helper.c    | 247 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 106 ++++++++++++++++
>  target/arm/sve.decode      |  19 +++
>  4 files changed, 390 insertions(+)

> +static bool compute_brk(uint64_t *retb, uint64_t n, uint64_t g,
> +                        bool brk, bool after)
> +{
> +    uint64_t b;
> +
> +    if (brk) {
> +        b = 0;
> +    } else if ((g & n) == 0) {
> +        /* For all G, no N are set; break not found.  */
> +        b = g;
> +    } else {
> +        /* Break somewhere in N.  Locate it.  */
> +        b = g & n;            /* guard true, pred true*/

Missing space before '*/'.

> +        b = b & -b;           /* first such */
> +        if (after) {
> +            b = b | (b - 1);  /* break after same */
> +        } else {
> +            b = b - 1;        /* break before same */
> +        }
> +        brk = true;
> +    }
> +
> +    *retb = b;
> +    return brk;
> +}

> +
> +/* Given a computation function, compute a merging BRK.  */
> +static void compute_brk_m(uint64_t *d, uint64_t *n, uint64_t *g,
> +                          intptr_t oprsz, bool after)

Comment suggests function should take a function pointer argument,
but it doesn't ?

> +{
> +    bool brk = false;
> +    intptr_t i;
> +
> +    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
> +        uint64_t this_b, this_g = g[i];
> +
> +        brk = compute_brk(&this_b, n[i], this_g, brk, after);
> +        d[i] = (this_b & this_g) | (d[i] & ~this_g);
> +    }
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
