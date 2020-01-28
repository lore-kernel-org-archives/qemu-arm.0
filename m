Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp324283lfp;
        Tue, 28 Jan 2020 02:59:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7+tOOksyS0r1p9ANt/LzTGDQKlAz5Z+W0rbJYXx+fdHVD26HJgO35/dd6qPdgW+epQz/1
X-Received: by 2002:ac8:7243:: with SMTP id l3mr7769993qtp.139.1580209166429;
        Tue, 28 Jan 2020 02:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580209166; cv=none;
        d=google.com; s=arc-20160816;
        b=J2PrY2DzsPUMsUlbXooJZuDxyJ5JnhDVJOpbEsVF8WLC4u0foQawOcv8XyqYlxi07A
         79ME94e203/j4duuXGgymJTm+359WZg+cMryk6+cJBtXBSeFruQVpH+LZcBbVdQp46Jq
         BYW0IThwy6TWAnKUQKCeQggrOCS9z9nZF9wFJ5tCl5ygzQjg70DpHQxoooK/phjgKsrO
         GL8PVU1gzj0/S87jMd1jwA8UEnB0NDsHLQKBmlzhrqa1Xzo5nBxYevcoodmegCJ6go6U
         uJRNeca3PmJXznzCFVPfsQbHJqV33DKHiAl1ajdn8AdRypEj6jFgRZgs9LY/LAfR7kz6
         s6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pf7eaZKLcykzv5YZVmlfAWZvxYouEa7qWG2IX0om23c=;
        b=Wt4h6i0IfTUgDHz/Y8NLyhwpTVBIt/NvY0urggH20ifjWwLvnRB+LDe0yZwhqt1wrR
         cE3eiU8HA1dLsYJPRHnqeS70dfIKNIlCcWeIwCbNhduNAQhjiXHhOOHvtbofmtZadbci
         TcW0/18WQTxEzjFMCtGFGVoEru+QYE63xO3QT/R2J/60L/vXYOoNrWHAF/ZG6dL7psNN
         3tTy6YMDxaAb6BngowVZ9ZKXJCJ4cIjmUcclubR1v6OP2SSUuZHlRWzppQCvsgy38v4G
         +NCOgbZ23pAy7vpB86/iVyklEjn2a/0RmT9HSGTDlE1RcYChZQTNw9R+e2Ajaw6XKE0y
         8HDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="u/7fV+kE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v25si12052520qta.106.2020.01.28.02.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2020 02:59:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="u/7fV+kE";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iwOab-0004sR-TR
	for alex.bennee@linaro.org; Tue, 28 Jan 2020 05:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iwOaS-0004mM-8C
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:59:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iwOaR-0000qh-CI
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:59:16 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39940)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iwOaR-0000qD-6b
 for qemu-arm@nongnu.org; Tue, 28 Jan 2020 05:59:15 -0500
Received: by mail-oi1-x243.google.com with SMTP id a142so8291181oii.7
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2020 02:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pf7eaZKLcykzv5YZVmlfAWZvxYouEa7qWG2IX0om23c=;
 b=u/7fV+kEc4082Xu/zXeBLxbhysD+bJv4HsWcQ2+Fn2havJmtvFrLBcGtEn2M/7dBPl
 6W25JVEHawF9/KsmriQyjzuPAAS2edFOkO4rzAH5BdLtVm/F7pdOZVNkhr9IxjuYo4xp
 lCQmV3G+vDxdFoQy1btFrTpmms6LILufC9MZ94lOZZ42ljR9vdjbuOw3N8xwGldSEty6
 lT5zlr/ce3vPb0kuKD+CRiwE8R4mDmZoYroiUf2hRjEVBcj1lByoEcBORnEsSjo2oaMN
 pjVWQ8OOtFk1UfyFuv7LWDZ91lznED9NX+weWsB0/4FXRlM89VsF3OJurOZ5qi6SeGpN
 266A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pf7eaZKLcykzv5YZVmlfAWZvxYouEa7qWG2IX0om23c=;
 b=JSwA2Y1hdAEWfERH3we7xydL+GM3oQjoAXIJWI1PHiB78Q8zdqwz1PFs0X1ZwUGtEB
 pY+eQDJrNt8Mjh1ZZ4KDuTCrWLnIBvs0y5TLhXJK3w9u8blJ5Zqd9jqz2cDdIaT0qkvq
 TJn4BGAMQ5oKdcPwxWNX5hWgGwTEuCBY+dEpmRlNvkDnEP7aaM9S2wrg/YpVSJQWy6YG
 ccfk2177QhrbUlhCV3YKVSKDNNm6m2ufsfGffI2HHQhQ4ZHqj4b8B6LaGvWnbbCWbY2r
 U0COaj+FqmGp2WXutaYIKbkyfeX0AvYYJjPK1DSaBFUIAtisBR85sDGngMnLMFC6o/FE
 NtWA==
X-Gm-Message-State: APjAAAXufL1IMH5BGNO0NMF0SBjE/G7+uU25/0zU8ilSHo+5uN1JXEwa
 0v3sjMhV835SlS5cskxckJTcbo57yXWu9FST7FBEpg==
X-Received: by 2002:aca:3182:: with SMTP id x124mr2461998oix.170.1580209154191; 
 Tue, 28 Jan 2020 02:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20191219040612.28431-1-gshan@redhat.com>
 <d972631d-7db7-b6d5-61b8-244ae2c85882@redhat.com>
 <1b718429-c74e-fbac-84b8-379f3291db40@redhat.com>
 <ff78ed012e7b8fbd656e7e4b477ee0a4@kernel.org>
 <3ae0557c-c289-8a23-d62f-3dc2a12c0623@redhat.com>
In-Reply-To: <3ae0557c-c289-8a23-d62f-3dc2a12c0623@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jan 2020 10:59:03 +0000
Message-ID: <CAFEAcA92URHhhm8TiGqijig_jM1=94PZz5Ptmfg1JrWSP7mSHQ@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/virt: Support NMI injection
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Andrew Jones <drjones@redhat.com>, Gavin Shan <gshan@redhat.com>,
 jthierry@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Marc Zyngier <maz@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vwnRMnWb/tvq

On Tue, 28 Jan 2020 at 10:56, Auger Eric <eric.auger@redhat.com> wrote:
> On 1/28/20 10:25 AM, Marc Zyngier wrote:
> > You *could* try something like SDEI [1], but that's a pretty terrible
> > interface too.
>
> Thank you for the pointer.

There was a patchset recently that had an SDEI implementation,
but I would strongly prefer not to have QEMU itself take
on the job of firmware API implementation, and the facilities
provided are somewhere between awkward and impossible to
implement from within a guest firmware blob :-/

thanks
-- PMM
