Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2161360ejf;
        Mon, 26 Feb 2024 08:25:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU/OM4TEQOdhVMuUL7Ei5ZObAGd6rWvEKk7GPr2wr1qf5pofdrE8+dN8anwKR5hCkwFCRI15KCRBcILWw9gsUmudUs7LFX/
X-Google-Smtp-Source: AGHT+IHJuIogBVe2urNuzrIzIcfRTOA1CPNCiqHi0bxm9RhauVaS49aV8/zn1CjZKRxzwJRRccwO
X-Received: by 2002:a05:622a:1055:b0:42e:7557:83ba with SMTP id f21-20020a05622a105500b0042e755783bamr7861993qte.18.1708964742695;
        Mon, 26 Feb 2024 08:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708964742; cv=none;
        d=google.com; s=arc-20160816;
        b=B+AjR4FhWOz/S35i/f7lpsopw/uVV64IF7UNKcwbzcPvI9syASIMSs8Bkr/rCsQnMO
         o9iXRdBNwI/qZeMCQxx9JejLEzqk6YF3wwyk9DOYG96CVdYXfwJv6g9gr4VIN9qmIcG2
         snlx66Alt/FL5ASW8Ksg25NzgY1rjGposxoLYfKxzaj8HRB2PBrEcxHjRBvQBZiAWAEK
         mEU2r0V9MNFwArszihG4/328o3F69nuO68Y9wtxyEjpF+7T3jv7ec0xXrRhh7gOEx9xI
         a4qY/65RAaoe4y2OCs2ifdue9lRDW6rGf3ErRPb9vL4QKBTTqtqT015Qq+Mm8YaXbaZH
         F4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nElDGtBS5T/6qd8QCponMvUB3AnJDsvyWP+1b7EH2jg=;
        fh=8/buHX1QSviNvimTjijzOn/AFbPh5KyA4Fg4Tqx/cI8=;
        b=yAO6Uz6GhftWWuf+BpiBe4VCXBdBVbOFnOOx0uzf8Tsmkj/sThsgB18bdYlR87seNT
         2DEJ+2JEcCOkz5n8esQccW8P8ZbgA/4Nwfjz8I/QBLwYAkWSAQeR2BmNpqGxQq7h1BB8
         HFbDBh3vt2SEFCUYrhmlwXDUc2iuu3JMN0eHDvE9gAY9kDGMYHEkgvIkbYGSCdqetaM6
         FJyYeKdqesJCZrpoFbTpKR2B6oNeMoJ2iAIKT4gTtxZNOEV0sYN+z/4kPhPmqdm2h1Pj
         XVL/zu/PCnEqgUrmcS2TgaYDRaagKALDb89D5Qnlb7l4A6fcnWA+nE6wmPiOHTu2zCiY
         AxxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eIdRicZA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020ac851ca000000b0042da96c1c18si5153423qtn.551.2024.02.26.08.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:25:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eIdRicZA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rednQ-0005Hg-Mr; Mon, 26 Feb 2024 11:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rednO-000548-Hk
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 11:25:38 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rednK-0001gk-Hx
 for qemu-devel@nongnu.org; Mon, 26 Feb 2024 11:25:36 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so4415433a12.1
 for <qemu-devel@nongnu.org>; Mon, 26 Feb 2024 08:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708964733; x=1709569533; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nElDGtBS5T/6qd8QCponMvUB3AnJDsvyWP+1b7EH2jg=;
 b=eIdRicZAMGGwwibwqB5oymlzxW5Ph8SKQPVozfRezoUJtXS1yx3POHGF0ZNlJ16x03
 YALfqOEhNJpT98wNKVGohwHkwNMoRrSL5eyw3avDLEbZ1jjpYu0E4fK3c/NSmGpD8/qk
 iIF1nzIjapsw4hPawijPL6LQrY18gjt72TcrOHszyh8LaOsFNOofW0/44aQTJy0SqbZx
 3L2XAcBSvDEtivurzI1TAiN4vz+9t5sMV7/wmuMIgwLRDfYRN97B1tqyAJBOUH2wQ2eT
 NQAdjNnUQGBeT/iWSVtzBDPxuTpWySMp6dhEFhfMuCMVJgh+0zLat4ahxjMOp0Qcgbf0
 sjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964733; x=1709569533;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nElDGtBS5T/6qd8QCponMvUB3AnJDsvyWP+1b7EH2jg=;
 b=dlQi9X/+964qrJ3ZWaDDHQt7Kd6JLW3b4Ot4PCOVcHLwTMI2RxB9oZL73h9h4i8ZL/
 VjPcUqh5PSgiQtyWmIwjEu6KyzmeKj8fpVYCj8JAR9H3RA5Mth6pM7L+GO4n7ulUlxpE
 prvpJEOzm3/HGbpSY8aue10BVDk449Qap5ZBozDgcxB74qZgvIcIPY3htOTABUHC3vL1
 JLSUZh2jLRFyhhjue+1km5IgXt82NUR9ta8yVvUDzVRYHRTlsNqwVeIGrhNWu3aC8Uzq
 yQJumArUDZTj7YmPm4SBEleb7oqwpBECFI1gue9ObdtHpXH/ihs9gQVa11GZWerm4oXq
 AEew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNYTqAv0VyUqhcmkycEfi3pK5bywbaUG7KCdTzTS7jalR9XhDKNcLScz95uz9ocHnuthPyvHH47brwshLSlNWWWcnnfYo=
X-Gm-Message-State: AOJu0YwK+a7e6Wd4yZMLmd6vtXJrjj/5cYF4xZ5BoDmcpkDVvLpC7dcv
 Kxsav3W0oA9hQYy3NCH2aQKraYN6TvWDXYKmKu8UojsOjB6b6yWTqwScPyiRfCh446R8GV4AgCw
 pokv5X9RZANqZWzVMK+qt37IOUhn0TjP3Z2MfWrBhFb1BxqEN
X-Received: by 2002:aa7:c898:0:b0:566:1745:162d with SMTP id
 p24-20020aa7c898000000b005661745162dmr1064889eds.24.1708964733234; Mon, 26
 Feb 2024 08:25:33 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-40-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-40-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:25:22 +0000
Message-ID: <CAFEAcA8SEGvDOW0swyTYJiOPjmd+buoYPGVHXYGjTEY8nTAFWA@mail.gmail.com>
Subject: Re: [PATCH v6 39/41] Add missed BCM2835 properties
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pgjPyZyu1joc

On Mon, 26 Feb 2024 at 00:09, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/misc/bcm2835_property.c           | 21 +++++++++++++++++++++
>  include/hw/arm/raspberrypi-fw-defs.h | 11 +++++++++++
>  2 files changed, 32 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
