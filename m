Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2977565njc;
        Tue, 5 Nov 2024 09:14:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUcKu8zeSilM48/7aeEWGZPrVxWfWDsQOVhuYhAT6bZ9WqfpSZeKGhL6/q29x0RQm3HvO+DWUvZ+oroKw==@linaro.org
X-Google-Smtp-Source: AGHT+IGF6APJUIOjjhyMwZttIMfZTsWSq4f0x7v3ycSCAtsERjTCuzUPU7tEQaQK66raJ1bsJaay
X-Received: by 2002:a05:6358:5286:b0:1c3:39af:62b1 with SMTP id e5c5f4694b2df-1c3f9f674e9mr1836819455d.17.1730826848556;
        Tue, 05 Nov 2024 09:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730826848; cv=none;
        d=google.com; s=arc-20240605;
        b=bAAdPPzxzEY1IyD5E69/KdDkK6RKAZbfrggkB6yydo5t246uZknd61fJwp18jg4vWr
         uxEEVocacaMAqEpjPYiSUVqQ6If4YB82CaCk83M2Ae5wlfchfRsXHDKWd+I0diLP96ct
         hSP3diHe20f5JWeMe5dPy9wC/k5TaskvSI4miK5e+F6smFOkM0vY7f9XYe/8RjT0VBge
         Xfi8ghSmQvTQJj8qTEMhTGrcRN2lnFNnIEK2++ZaXARv4AanjiGe2RBH6lDLCqMHFnp7
         QVjMdSsLOtHhp5qtLX3d0Ea4NFuIoVoll+DcFT5Mf6IECFJgGKcHObzTLLJm30KFTdRN
         l7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=no9Y8erOq0EIaiTxgO0OXZAI9WlZQZuBOlovtynxEjU=;
        fh=g3G+rNt+++wQTv1xKm740yF2v2aayNgTFrlAmLbJ2PU=;
        b=L3Ixj+8J1Y2AykIOTVmCAAKehcscZc6nAMgtd05sjHBPf3z+I2acjVjBFvJuXS3xLW
         N6tdGnNnvX6xbNB3fr25bWN3CsQceAeowGeQZ+pBmucSJ1Xz2rud5GLpVtYuG1SWxKgP
         RKise668LJ+RX/R5poZfbDGjMMwWKJGE6RwFY8xmQegXiQMK7j4lzexWj9ZR5Fd/fCb9
         6D2rMv1Usth4276nUSqoYwEMh7vIC0DMxTtSmUPq4bfo5sI+kjmMP6ADiJ8TV/ePL80g
         sRto6bgvcdt0IerjKnjJrwtJDSMvwadO9aKTCJ+utoF6oVVChMQms6z0dhchRvHR+3Ye
         c+/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BuDJ1qQD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a95748fe54si2506827137.215.2024.11.05.09.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 09:14:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BuDJ1qQD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8N7T-0000hJ-CX; Tue, 05 Nov 2024 12:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t8N7Q-0000gt-KH
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 12:13:28 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t8N7P-0007J7-01
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 12:13:28 -0500
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c984352742so6885346a12.1
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 09:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730826805; x=1731431605; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=no9Y8erOq0EIaiTxgO0OXZAI9WlZQZuBOlovtynxEjU=;
 b=BuDJ1qQDL248KuncL/6DtNrNA86euM3eyvsy6kNhaCPpO4H1pVbJ0mF946dVlsR9e0
 AEdzabzIVPw+b9uID/j8QkD5PlKT9/USCXRibq2dYHJbW1eEH086JKrxwwuX9pXA3dHj
 iW6k/M6ZcF7FJmR4eGLa8Tx5JyO9fNbwQfhap/rzhiwE7AR45dtNsoDMREgzEFGcy+If
 tpWzarICVX1TEJQQ1U4qNm2E1UwHcmFzlY80iTHX4+3HXd1FS6j0aGEvK03x/TNKJyRP
 jOeLJqffnlOJd0gpFI0qmdX1+0IMEoNDFnFottcceeqn24ReVRLlH+ngAsG0UIMtm3C4
 C43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730826805; x=1731431605;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=no9Y8erOq0EIaiTxgO0OXZAI9WlZQZuBOlovtynxEjU=;
 b=TYtxHkwMk42L/mgRcI6ezMZxlqzlyPqGZAKeiEbfi36c7vWcLP5THPKDM2wHGSoJKC
 4tDCAzoC/N5qOObwm285uYDtpU7ldFwyoE75a51Ngly6Bh+LBxhsN1BpP3NDvN1SMzR7
 HBq7ODz0eBrcfKoX40qNsauHHAcRQspylPXfmCzvsIX/seOHI+5stIBL5CNSoUsvlAlO
 QkkXc1p4Yb1scLd6Bws9mLYqNOAI5F/11pQ25yqfAsueV7hSwW5fV8UBh7l6qhwInk88
 XKt9lNtjfYwqZ2kLdUtpDHMN//pmN2hxy0Hi52/IdEmJLlSOqxit7Hqv5sFot7YZFWRB
 XpCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXti7pHOPlrK44dVByt710xk81o1o+3IRLnW4l8stM8KojB8PZ9i1pv+gkAhcZa+f/GPzvTt7n91g==@nongnu.org
X-Gm-Message-State: AOJu0Yyhuf7Ktv7vLOmVUr+XkDCKxGycZFlsjNghVCxy3JoIsmRx1Eap
 EAVt8qRg8D+/TSN+EPt8axBGhYLtclB4ESMLUQp399hw29wYIaOFTvJSrHsJnA+2n3RXncRR4gN
 fGnB3ya4bB3AC5sOty8u5iGY2eFYXO4Sl/rzGj7LHE0LtyzP7
X-Received: by 2002:a05:6402:90c:b0:5c7:2122:6ad with SMTP id
 4fb4d7f45d1cf-5cbbf89a142mr30683017a12.14.1730826804974; Tue, 05 Nov 2024
 09:13:24 -0800 (PST)
MIME-Version: 1.0
References: <20241024063507.1585765-1-clg@redhat.com>
 <20241024063507.1585765-11-clg@redhat.com>
 <CAFEAcA8A=kWLtTZ+nua-MpzqkaEjW5srOYZruZnE2tB6vmoMig@mail.gmail.com>
 <91c2ac92-66b2-45c8-b4fe-e8f8587b0e9c@linux.ibm.com>
In-Reply-To: <91c2ac92-66b2-45c8-b4fe-e8f8587b0e9c@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Nov 2024 17:13:13 +0000
Message-ID: <CAFEAcA84hhWu2ouirfDPbCpq_=QLQxAf3k47h0Pij8iEnOVj+A@mail.gmail.com>
Subject: Re: [PULL 10/17] tests/functional: Convert most Aspeed machine tests
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rhcfk/aZaesm

On Tue, 5 Nov 2024 at 17:02, Stefan Berger <stefanb@linux.ibm.com> wrote:
> On 11/5/24 11:14 AM, Peter Maydell wrote:
> > Q1: why is apparmor forbidding swtpm from doing something that
> > it needs to do to work?
>
> What distro and version is this?
>
> The profile may be too strict and not reflecting all the paths needed
> for running the test cases. Ubuntu for example would have to update
> their profile in such a case.

This is Ubuntu 22.04 "jammy" (with swtpm 0.6.3-0ubuntu3.3).

> > Q2: is there a way to run swtpm such that it is not
> > confined by apparmor, for purposes of running it in a test case?
>
> Try either one:
> - sudo aa-complain /usr/bin/swtpm
> - sudo aa-disable /usr/bin/swtpm

We don't have root access from QEMU's 'make check',
though (and shouldn't be globally disabling apparmor
even if we could). I had in mind more a way that an
individual user can say "run this swtpm process but don't
apply the apparmor profile to it".

> > Q3: if not, is there a way to at least detect that swtpm is
> > broken on this system so we can skip the test case?
>
> It's not swtpm that is broken but the AppArmor profile is too strict.
> Above command lines should work.

But this is a widely deployed distro in its default
configuration. We have to either work with it or detect
that it's broken so we can skip the test.

thanks
-- PMM
