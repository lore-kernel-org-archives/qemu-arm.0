Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4264525njb;
        Wed, 11 Dec 2024 10:16:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWUf05KvdBT18+VgAYO3kXZRlu29XDKQ5kRfO+i3/OJIyy6YHr9LkzH+183P/fVif8CIPbjLJue2TPfmQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH4EMiUNlbDhUjBh8WNOakezvU4ry4vmqab+ACsU4yDVMoZaFxTXXJ5oX4G08fi7pJuboz9
X-Received: by 2002:a05:6214:1d2e:b0:6d8:96a6:ec27 with SMTP id 6a1803df08f44-6dae399a5ebmr3751156d6.35.1733940959529;
        Wed, 11 Dec 2024 10:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733940959; cv=none;
        d=google.com; s=arc-20240605;
        b=FIJoTlEbfG2jsF1pDoJn0bdM29KYWCqZcj/kNE/5OHPNi1lqyGs/MbGpqq5/r9zSt1
         sTd18co8f3FtFNg95pfcZv53Ki6CYwYb67S8lIxJrxYZJtD3ig4LtmWK3w/ku4A2lnKr
         koeU2chAQuFHWw4cTxcw6ADKzWkeuYn3/d8LyHC3eud131qnI3E9ZHWrOTzoBI1b3NJ0
         0jZxSXW6uGRa0YbvnGGpzXXMSKl+9NsRYkhwJ5VgwOtFTnus6UxUm8FMVP5fvmXm5ErX
         BZGnPhE4Dwq887d9K4gWu/QK6VdnjVn0R+7fNYYCflxOMVn8MnNSQV59jk7mw3Cu5LtH
         HVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2vOBzHdzQEMcT/6325YZG7aVBpNdncbLX25LSjSteyU=;
        fh=prPakgyb2vFZUEoq4zNwt8sKLnvRPT5x2KKyKPXjSZw=;
        b=CzDRcTtkNzlBt5Ig5NqZR05fI01PxxNzH5ePGyAHEx8l6f2Mr/b28WvP8eg1SXJHdI
         u7G5T5DXGUEKg+2djEUywJYdUvaMl6/sRD0IfaNkPwG24eGqbj7YI1bb+3R241xKfMWR
         wP5ePwOVfW8BHv7B3oHIRRJD9/KbbUu4rOE0fz+tJuNpiNK2e+5BgEoSeXah4Jpkc89G
         J+ZXLEXtzf3Kgm8O4OngP0jBM2EI1E7cyeZQ2UAYUS1O4jRM+aNKcsWRPeV1sQACE/JO
         PbFpfUCirrgpSG+uNyLHyLqF5vXQfbSe/28eY9UtFaREe8kK6q7KbNhBm0JDpv87F5Bf
         hdog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XVSHSzT5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da67eaedsi170322196d6.110.2024.12.11.10.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 10:15:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XVSHSzT5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLRFN-0003L7-B3; Wed, 11 Dec 2024 13:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLRFK-0003J8-Ch
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 13:15:38 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLRFI-0006f2-RW
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 13:15:38 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e3c8c572309so1111421276.2
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 10:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733940936; x=1734545736; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2vOBzHdzQEMcT/6325YZG7aVBpNdncbLX25LSjSteyU=;
 b=XVSHSzT5iuRb6V9gWgTO37mM17iBsQ9vtKRQveqEYFUcg2pJ+4BKWFZwOJNYwU2MlD
 luOeL2QUP4u6Nw/JcWx0b2m+oIe2OuyHlVLbY3zVb3y2OCEdzvWP+OSSeS1r4ZfNXZa7
 jWBq4eak++jIcj5hHgPbf0zXyCWG4X2yWt/SXJkSuOQrFz78hD51+YZemMJIPHCz6dHF
 1Mf6+Mk74t0NUdr+S8f3P1ilya2z8uf9dgdsEn6H7gddg3w548mOR6Op5ufKtYpyBuON
 vcGSksxNZWfPyjdYTY7uq65SsALdknSG0ZG6gFF6V0a5v6Mrnlo2wpqMY6IxJQE6pmpt
 nQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733940936; x=1734545736;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2vOBzHdzQEMcT/6325YZG7aVBpNdncbLX25LSjSteyU=;
 b=IFarNtp6UnmLiYta/f2fznLpG67SZsdO5It+ympr0MnRei0R0/uh1foSn3FF06O+qd
 0MmciPAQ7qt8lpT8geR3Gli2GGROlbPcE7wEEDwg6MR3Xqk4+gQC0leoQFoUhZpSQQ2N
 1ayRUcAv7m4MXjfPHwTLbD2Z8cR/3jaOuK5btjomdhqIYg06p7gNOPmn9mRvPC1TTlHP
 83Rw8pP8b3KlkEVZXH85rNTYIwirj03uGlRpC9tA9kPGZ9UgWiw58YQU/ylK8SPxYeWi
 a4vRe4WV5+TNpJlXquUD6VI9jv9XtUBkOv/JYuJkXAS8m06EiJChSmS5xzYYaHPqsgwO
 ah6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu63W/cJt5grX1xdQvUFLwNgEp+LFd/4tumFQC4QbVo9aNfEMHAtvhQ00m/pUGigTkp1NXwApGvEjX@nongnu.org
X-Gm-Message-State: AOJu0Ywgw3PmIDf439B43kBu0veQ4e/+Iec0aJGPJbTf9Oia70pEi2iK
 zS4rWu7n7AnNBXgjraBpedhdVkOwg1fiB51rm3gvghBgd082zCMY7IG+w4ksceBv/bbrZp5pG+8
 igZm4MftD+71SuaMlFfkdw/RSnJM46Y1hF9LrQg==
X-Gm-Gg: ASbGncsvvYv2aZCjem3lhiEqMqQx+0wA4aXSfBub6Mx+r9UBMInqD42dlgrlQDnTWhw
 GL3P8ju6CEE1vXH8K42jYEB0BzkJ8bIFeLcqV
X-Received: by 2002:a05:6902:70f:b0:e38:a031:bbd5 with SMTP id
 3f1490d57ef6-e3da0d555damr316111276.31.1733940935861; Wed, 11 Dec 2024
 10:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20241211063058.1222038-1-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 18:15:23 +0000
Message-ID: <CAFEAcA9U4SbLWjQa5baZb=izbRZcMV0K6+7aJt0Lwp9kgyA5Vw@mail.gmail.com>
Subject: Re: [PULL 00/24] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yb5FMVhFO1Mw

On Wed, 11 Dec 2024 at 06:31, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The following changes since commit ae35f033b874c627d81d51070187fbf55f0bf1=
a7:
>
>   Update version for v9.2.0 release (2024-12-10 16:20:54 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20241211
>
> for you to fetch changes up to 124f4dc0d832c1bf3a4513c05a2b93bac0a5fac0:
>
>   test/qtest/ast2700-smc-test: Support to test AST2700 (2024-12-11 07:25:=
53 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Removed tacoma-bmc machine
> * Added support for SDHCI on AST2700 SoC
> * Improved functional tests
> * Extended SMC qtest to all Aspeed SoCs



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/10.0
for any user-visible changes.

-- PMM
