Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3408111wrg;
        Mon, 10 Jun 2019 10:19:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwTfLgyiL+GB0embmpFQeS/8zYUhX91V2MbJqoegFLr3RJba3dVL7XNG8ZFE6gr5VaGcCEK
X-Received: by 2002:ac8:18d2:: with SMTP id o18mr11607687qtk.243.1560187140927;
        Mon, 10 Jun 2019 10:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560187140; cv=none;
        d=google.com; s=arc-20160816;
        b=aP8RuuBsL2QCy5uJ8nkj9Mvust2tUvWjkowjKs5Qe7wNZcwyccHOhPWLWhao+4kMZF
         Hd59DgM1plclm6GMCDpLMU3lQPDfX7NFA6eGkV7JjQCLiboRnhttPRZ4zW/n8qSb0W5y
         O5eQrQBcxw6QYaDFRak6V1G1fu7pkn4m8qy9Fvvz4Doc/FlDLPCPhpm80iAAbODNF9k3
         M6RF6ZZxDlpSY9X7VYcZI3/uKAv09tBeYR5qidIoJCHeAQ7Lyg+nRv/2xYMLHAAM6gqg
         oIrxnY3yG6cfV/1vv2duQA6Tz6qlO5YIbOPrmIMeQusjm/L4+UyyWTrlL2TLaXTPOehD
         O42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p/z1W1Ia8JivqEoVP3WBX7u7oTn3bQRsvUkNdqY2whE=;
        b=Ok/DqhUMYYOR1gkun67ij6Q50YIKLm4J+pOnfmsNsOwZ1jRpVa9pj7ENLraV1ZHo/C
         kFU4UCsKE9kFME0zp7aseUt4kydgsywqTgRjEfQYjRM2fFfgrRHDCXrVMXLwGbeJGVS8
         dP9Ff9k+6GiyCFCkKMSv3bJuvhak8JOZ7FuMEMHMZEWca3yTilGWACmJRQo4uxbXHe00
         iVR8BA3seykJmiS2xprxo8UPwhIAOEnfgRPB8Uh7DEe1pEIWy2x8OjY4tiII2WS1Nusj
         wGVKVDyAM0a/wG1DfFKUYEn0Ej/Payra0v07nv8FQZTjui8K2jw/U9H8INtdOThRiSyL
         0iig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U7ux2Nxt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16si2287652vsr.258.2019.06.10.10.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jun 2019 10:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=U7ux2Nxt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haNwh-0001eh-Rg
	for alex.bennee@linaro.org; Mon, 10 Jun 2019 13:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1haNs1-0008Q4-22
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 13:14:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1haNqH-0008Pf-IA
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 13:12:22 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39891)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1haNqH-0008Oz-Bp
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 13:12:21 -0400
Received: by mail-ot1-x343.google.com with SMTP id r21so9030785otq.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p/z1W1Ia8JivqEoVP3WBX7u7oTn3bQRsvUkNdqY2whE=;
 b=U7ux2NxttjgIEBAcHisLb4IDhyBtNgfcyec6WzEjb+XtbOV3TnEm8ApIKEBFaS8QF5
 TOafRa7YCElp+moTlszhSX1NFNiyKeYZ3x85+8RSkaz4u+pdHwoBSYJsbrqD7fMGF+Ub
 AK8UuiE7sXdel8xA87e0BRPg8d8UktiTbPwhh8C9jt4dEqiyHXYnO3NRdnDlKROOyrh0
 mP5WuSitZ4sIBJvL6vaoe4CkkMmeL5icbB9jXKq/Y8FsN/Y7h1VJ5t+8aPSAbbAf4Hjg
 yU1N/+J7ndfXGqzIsTBAe3ueGwU8bOfUil7opG3rYR54OxISZhrHg9LhGSHuZtGh/Cxf
 SXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p/z1W1Ia8JivqEoVP3WBX7u7oTn3bQRsvUkNdqY2whE=;
 b=AB7Esdpa0wHSJREBJ8ulJ1Ms9nQT5GVORkG4EHEP4vOiDOlLfPv0w2aHRSwowGGoI0
 tvNrNvcqm098GLXbFi+OKkHHTmtOxGvTh6a/xtFJlsUBt1yNpSUfXQwQ6vAX+QVjErZv
 LD1hlAwJLjvGTdf6P3255+KHvXhGJ/wF4irpYCbvluYyKJ1ZdZeAdV47CVmayLGem/7r
 5JaxzIxU9iJAVYWWz3btDB4ZoJ7m1Q8BfYp36EoOr7MLXwOYur+5GwWuedUPuni2NM3c
 XnAJ4cDLbMGVDpUc3X1uT2VsEig/yRmz8JkOM6c3dls8HNlvkTVJ7VW21/mYQgj59m0J
 XsBA==
X-Gm-Message-State: APjAAAWXTbs8eQgsPRmbrDTHoeNH+zufpXWcFhRcYkvJaygWK6K+Q/hK
 LlRV8g0t7EvSTeSNZ3KHqD/5tx9Rc+THSCzuedQl/A==
X-Received: by 2002:a9d:7245:: with SMTP id a5mr31498596otk.232.1560186740245; 
 Mon, 10 Jun 2019 10:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-29-peter.maydell@linaro.org>
 <da80c3ea-5a33-e7e0-209e-89a8413c8f06@linaro.org>
In-Reply-To: <da80c3ea-5a33-e7e0-209e-89a8413c8f06@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jun 2019 18:12:09 +0100
Message-ID: <CAFEAcA8etr7_rmQsQcUY+cPHZEZna-An+r5TPJtMb4OQO-6Dsg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 28/42] target/arm: Convert VMOV (imm) to
 decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kbXd18DuTwFl

On Sat, 8 Jun 2019 at 20:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/6/19 12:45 PM, Peter Maydell wrote:
> > +    n = (a->imm4h << 28) & 0x80000000;
> > +    i = ((a->imm4h << 4) & 0x70) | a->imm4l;
> > +    if (i & 0x40) {
> > +        i |= 0x780;
> > +    } else {
> > +        i |= 0x800;
> > +    }
> > +    n |= i << 19;
>
> Can we reuse vfp_expand_imm here?  Given that you don't have pure code motion
> from the old code (due to field extraction) it doesn't feel wrong to go ahead
> and fix this wart now.

I dunno, I'd kind of prefer to do it later. We're already
drifting away from the old code as you say, and going
straight to vfp_expand_imm() makes it even less clear that
we're doing the same thing the old code was...

thanks
-- PMM
