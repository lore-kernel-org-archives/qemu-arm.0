Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6281336lfp;
        Tue, 18 Feb 2020 08:12:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqzRppAn5kGSp2apUxxtyshw4iuNqXA26bQLt3nfjoRpRpyCmz3HQYtm06fW/3XHx92lqE85
X-Received: by 2002:a37:8046:: with SMTP id b67mr19329750qkd.218.1582042349187;
        Tue, 18 Feb 2020 08:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582042349; cv=none;
        d=google.com; s=arc-20160816;
        b=iUgdheoPj1lnfan2emIj1dXZt5qoXgBcB+tsM/qLYmgV55dS6Hk1vb62Pq7NjWuTOV
         zeC8uTe9J+7asN3oL5fvR0uAseVY3Eqj+5e+dBwFY5RqDEzriCCwKqpHtlUaEFDwof2A
         1RrfwqY9xKG+X6nMfMzlubeXnn1Re79YBxIx4dzC/Wz8bWzWpGWe3CsvIM/cudIWH4AT
         WiLigjAGcODfl0pDOs/7bK/VTQPO90R7+4LlQ+dioTnKTZbcn6HIr4xy8vd7R+5dWWEp
         3acvtXindgLlJ/7gTyVcWadYl28M9kqyazTIfkBjt0tFJQqVgDh91IslhgQMk3EROxDH
         FWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=diqUIbnas6JmCw7SoalRilqZps533oNRD6uGhMaUQlw=;
        b=d2Q3Kfkvp+KgOz6YY+4jKBXoExi6ADDhEd23r2KSVfFJ6ZP43enOYdJZWcmDN8JJPp
         oaEapJU0+S6X/oNAtt+ZNubI7OfP6gbSded6/GqIv+fwKfhZquAHAe1JOF1IrgbEHQli
         6+iCGtiEXJ80VRw2vYnC81Qc5yQAIlUMVgPWFAN5iWnD90odB41sKjF+DpPDm6xm9ucs
         g38V4C1RE1z7E49h9eg+7RM98epEKAeAnJT3ZVFaTic28RUf8XJpRDNkIbaY2oNLKgZt
         E2zI+wMhzsqRrENMDSq5F3rIx1AWCXyI3rFmIpsrxNM8BNlBUH8aHxRRjFSqeqtGkGDI
         Uf1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kzP+omZv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23si2028324qkg.204.2020.02.18.08.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 08:12:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kzP+omZv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j45U4-0007LH-KT
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 11:12:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43243)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j45Tw-0007Ic-7o
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:12:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j45Tv-0002FI-9V
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:12:20 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:39934)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j45Tv-0002Eo-4K
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 11:12:19 -0500
Received: by mail-oi1-x242.google.com with SMTP id z2so20616870oih.6
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 08:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=diqUIbnas6JmCw7SoalRilqZps533oNRD6uGhMaUQlw=;
 b=kzP+omZvhGZ852gQPXMJ3qVbxVkXOroRU6D1nPDX6uOvL2V5HKmghUuSi3Hz0WlkHI
 VPMgVCW46p5e/uO6xfu8OmRxxRvWPiOQvsrWuJqE9A04X57j8Up55Mq69H/CNKfnIC1p
 Lr+3/IKKxMZrXpjjoythhVDRAX4cuTNM9AmicHgd+hWXPrd6eNGRc9PswOwf3WVHZk9T
 CcNCClXUKaaRO6sSRjvzdULmuIV7xLS5WRUqCKcMzQJF/G5aoF6d7SiIj/SHvmOtdJ5/
 Mkx6GaDS8AeqI8gM4Vbh85G7BhlUK34E7vqrVAj8Ve4aPAqrO/Mye30q4bPZhKnNicqh
 ftgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=diqUIbnas6JmCw7SoalRilqZps533oNRD6uGhMaUQlw=;
 b=hOEY6qz040G6dSXSJc3wBTXiPu18ng4uCWKYzEX5etPpYVhvcPkZ2IzSlp7QE/zoIn
 evPlpHgyQVrmDz/Zd+vLNJ9jO00ZLULJS6FF2FzhcrlqtTxK8NSWPa1jFkqaUjm+iuzq
 DIcb2gmNv9hkEzw2ZEiGELHf/4eoxKjd3l/BOn8Ag3UT6T5CgSKW2d4aW0Yd2h3GKZWg
 lsqfYC92tXDegfmdBv7OtjfciXySc0LnBW8hppnUTtLMQ4+POuzGZ4rvsTc90pOWEa81
 WpoygDk5/4CYnzlOMM0zOyQ6cErbGd8WOP6K9kNybdxkSaMh38CVt1ykjD9H+T5jsigb
 KLag==
X-Gm-Message-State: APjAAAVHWmz7Ap69UzBDN5VG0WV9ttmektcX8YWe3RIc2nx+mG4XmvIK
 nAZw+2nvgBQxXSJ8y5wRL4OIrV9fHsTNU6V7FBZx1Q==
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr1728254oif.163.1582042338286; 
 Tue, 18 Feb 2020 08:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20200217210824.18513-1-linux@roeck-us.net>
In-Reply-To: <20200217210824.18513-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Feb 2020 16:12:07 +0000
Message-ID: <CAFEAcA_Wu62uLmopZ4Kw6usJOdihaT+mT5XyudxsZ9cqRDmWBw@mail.gmail.com>
Subject: Re: [PATCH] mainstone: Make providing flash images non-mandatory
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A3xC4glEkgCM

On Mon, 17 Feb 2020 at 21:08, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Up to now, the mainstone machine only boots if two flash images are
> provided. This is not really necessary; the machine can boot from initrd
> or from SD without it. At the same time, having to provide dummy flash
> images is a nuisance and does not add any real value. Make it optional.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/mainstone.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)




Applied to target-arm.next, thanks.

-- PMM
