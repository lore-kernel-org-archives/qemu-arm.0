Received: by 10.28.71.27 with SMTP id u27csp4943182wma;
        Tue, 27 Feb 2018 07:25:28 -0800 (PST)
X-Google-Smtp-Source: AG47ELuyCuwhSn/DTv3U2G1aSwtxlMBv7vSOEQJuE1Onr2qqJ5Mc4MG9rQ5PedXhdjKNBMJoM5Xc
X-Received: by 2002:a25:a349:: with SMTP id d67-v6mr9725514ybi.455.1519745128723;
        Tue, 27 Feb 2018 07:25:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519745128; cv=none;
        d=google.com; s=arc-20160816;
        b=O3N51OE4J83AV4Jbuh1+L3NXkIVhV08r0Guus27qjdvnv/9ogB5gfQbL3s8dpYjYJR
         EUr09FyhYc95ZRhRQ1KVL+KI+poe7yxWtG8GuJopeMsQ80m0lVtSQnN6Rit0LdUaBcmc
         9LYRnRB6QKG/5Xo1pDLagy0OkO6y6xsJ5fpxs5Pk5fcDS2CIbIP4Ft5CoZfyT0aKOA0q
         VFvyPiaZ4mkibJ7T1V8eQ/0wc6pYQG9xaWF02xo4FltrBs1yVmwN07Ws3CeppfHVqWxq
         Lcwvnnb6bn7/3uom3gTOh/gIF4uxClehKSbXsfaid0Z/+3LjC/Ora6cUlbj+3etVCdSq
         fCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=uXOPw9Sm5dfJsWjhIYeQZE5DMUYsxI+r8Q2d/0gyeJM=;
        b=hfdytzpeiwgDHa04jEFHI2CAkR2e/OqW+iYEO7SxbCOuzzYXPE1r/l6I6eAFZKcsdY
         C0S73GJVWkMS0v0LoiQfF7tY3Al/jQ+lKmi2Ce9ADO5MPpgnK52AM3xK1NfWzy8hRNaE
         jZDqmZkv6TBl/zonMcwyzVEpl6YerEEb3KeCVIifyy78aaIz7aaD5pViDZr3eNiixA+Z
         9AlAu5XLuDNv5sDmfUyn4LEaSA1GO2OUNdgDz/ZBBKBmK/4CgEYIuNnvQ/DZZ1Anq7pf
         etl/2vnpZu8/RHDwj7aWCsCslXziPX5sB2SnSzev5mAD6a4fJsXsP7iKWVxMTC43aOn1
         IdIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jUBqbJ2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g15-v6si1403385ybk.206.2018.02.27.07.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 07:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jUBqbJ2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqh8C-0001HU-3q
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 10:25:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqh7e-0001Fn-6S
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:24:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqh7a-0001Lv-8B
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:24:54 -0500
Received: from mail-ot0-x22a.google.com ([2607:f8b0:4003:c0f::22a]:45973)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqh7a-0001LH-2g
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 10:24:50 -0500
Received: by mail-ot0-x22a.google.com with SMTP id f11so4078774otj.12
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 07:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uXOPw9Sm5dfJsWjhIYeQZE5DMUYsxI+r8Q2d/0gyeJM=;
	b=jUBqbJ2MTebuuEUfXXo2vfBD8izu3hT7bVF+Yy3rrPpjgJeaZmmI5Az+jGosSejULd
	mW87+2T0B3Q8zVhh+i41Cf/BE94xQJoAIb7w7BXRYmjhoa9R/uEKlXZbUvxmkfU6z7of
	JorBnwDi+8P7ZjABA2XUvnERLQpsWel4cXQlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uXOPw9Sm5dfJsWjhIYeQZE5DMUYsxI+r8Q2d/0gyeJM=;
	b=GV6zftk4jR9mZoRBS05MKy5jF7JjK4gQNQ/GYtMkmSyAeX0wd0QLk6JAsDdHpTvoBB
	jr2re3uJqTGLkFo6l3hUGcIM/H2OrWcyTCalyf6n3oWZSy6+9sn4UdSjDTSzE5w33f7J
	FAgYmSRLQtAm3C3TLJ8fGhRLuOiYYwU8HpyLpo4POx+i4rTczkaIxxrzu/DsEjq2Fpsv
	QFHt99UNyO6VexVDQIyiKbkCGKeWu17s0p2uZBRzA5kmu46BLGeJl3Tf1RcA9X6SaTgf
	INV+2vLk0rpSZPUY2l2klpjA44Xe0nZbtFujXZXl9xXxaRmcvseaY6f2YmFJOLir6ilR
	JgSg==
X-Gm-Message-State: APf1xPBjAt0wbeGWwkiQYpcJnkCFnzW+9syLVeW12Cwpc0KhypFr2h2y
	VoWnmyF4X2XOc1YiVJ+0ixP9QT+nxoXEKvikRblSJA==
X-Received: by 10.157.34.2 with SMTP id o2mr10962669ota.316.1519745089351;
	Tue, 27 Feb 2018 07:24:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 07:24:28 -0800 (PST)
In-Reply-To: <20180217182323.25885-61-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-61-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 15:24:28 +0000
Message-ID: <CAFEAcA9Vbir97mF67SE9wPpQ7x2qFfKP8nub88-Eph4xJjJYkw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22a
Subject: Re: [Qemu-devel] [PATCH v2 60/67] target/arm: Implement SVE FP Fast
 Reduction Group
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
X-TUID: 3DtFb43fYuh9

On 17 February 2018 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 35 ++++++++++++++++++++++++++
>  target/arm/sve_helper.c    | 61 ++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 55 +++++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  8 ++++++
>  4 files changed, 159 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
