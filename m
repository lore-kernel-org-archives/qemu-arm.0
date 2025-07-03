Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp430844dyc;
        Thu, 3 Jul 2025 03:14:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1Szc/yqNZuFK6MCpwf80AWesEjSSWla3KfEjlbeegVVjMtGlrlA+SmYruGoXdbI4/dY7Ax8qwgY3vvw==@linaro.org
X-Google-Smtp-Source: AGHT+IFwV1JmWXP8/8FoGFdAjmBqvqL6D/4CO3+ea+NNO2ngyKz28z8Oxurhr52TLo6YBQbbv0QR
X-Received: by 2002:a05:622a:341:b0:4a9:8232:cb24 with SMTP id d75a77b69052e-4a987bd7fa7mr36077861cf.7.1751537680930;
        Thu, 03 Jul 2025 03:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751537680; cv=none;
        d=google.com; s=arc-20240605;
        b=cr0X/j7DoCQvWrzZt8ZkAVQoUEQElkgke7DbHHbMmERqSSvLr5+4PIwERRBDGqMMrN
         XPIQx0GD0cxBYLhi56cpPIVZWIir9g2/9zd9YnVmTpodLIGNr12p7Xu7BPwyKk14NxyR
         5mY6NuR9cWPvOYZGD5nrcNTAn7VZjat8udUQiuJOAH++gqkLWIyixFHU0tm9Qd0KmyD1
         XWnTvPSz6omNa5/oT0sFnZz0+C8ydmJWvVgMHxsMKTX3NZGTeFpDL411kt36gVb9Xuf7
         eOSCARMIlH+E4IjwXcFnuWyp/0qsTYIKcczej08iQHrwKoh8P0THENHl9OeoKwcup9ZU
         xZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zFI9XTu4SqR5/5krjtdStjyPwuW/mKvuZtIJbLHd3yc=;
        fh=F+8miK8BSsDRRGFpb/BlkCIfbeZ+n5qdUoUWzDSveAg=;
        b=NLInHGpS3zOsTaYMNhXDyb9eVVTkfHMZxAxUm0LMsTqSNFqJyxJSFwC+2mhqHFhWDd
         vVoi+ezbTS/YGRqK7T3rPjs2gGSOxaS5J8aQ4jAXvszk1SpkgUtadBzYQemH25DU7uPl
         NmJJaYl/TQhGqvguETMLILCuKzrXbODZMA2mGM5dbHi/0o60NK+6xsQV7ZgzvLe5OOxk
         HF0fYp/JTQlbVvAWcfqf9QT6p2CfDt3bn8/syN3/Gz9EXsGuib2lhmDFa1YWrVoDh5Mb
         vGUm54gmpTY6zXtSj+0dDOBF7c8vsvm0hMRLsvzhpFvm7a0tj0YK/IKbXIhXgkagaw6j
         f3tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rz6LD7in;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc3698c3si149437031cf.453.2025.07.03.03.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rz6LD7in;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGxU-0001jf-Jq; Thu, 03 Jul 2025 06:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGxT-0001jD-Ff
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:14:23 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGxQ-0001DK-Dp
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:14:22 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e7dc89108bfso6883251276.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751537659; x=1752142459; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zFI9XTu4SqR5/5krjtdStjyPwuW/mKvuZtIJbLHd3yc=;
 b=rz6LD7inDPDKfuZVLTxZT/0QFKVN/Uc4cuHSQ80NZ+RZ0QxyR72M8ZzvQf4VEb8b0/
 fQaeQEXjkYZ2NGeWEyjxNJe149+mJNdtEOVU1i11fDiT+gvpozW5BwaFMDni/9JKn2bc
 EzjgTdLYEQzmj38eesNfQXSgghQwdz5DB38h9WUyQSUdLBWxW+kl5QC+BPVYi3FkTZd5
 WmiF2Su8PtxNSa4k1lYW9/YFw58LldTI1mcAfXS6GqZ398Vf56CZAt+bB/YGU1juHonx
 Zs9xus6OP9glGPKqjdLmjqt7Rx0tmzXA5JJzO/giDkch5gfGDq7i0Xx2TGUAM5M0KQ3I
 CYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751537659; x=1752142459;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFI9XTu4SqR5/5krjtdStjyPwuW/mKvuZtIJbLHd3yc=;
 b=GEIPJtuVS71U6plwA7L0IRxMnmiuA+moPzM8zCr+g2KQPBnHEfrMD0ldY8+qg4KrEC
 FMfeRaLKOHV0LZ2GN2NaEzO0CaixSRguoQic69RuIBz6oVm7WIjUPVLOtLFuozT54dTd
 ACjZox8OVOfR4pEx04bAxkpHM3p7CvLug+kBNo2cUj6+DEYx/j5PLqCbeURNrhAh5gVJ
 ZHU7pYR230G0hr8o5xuheUGszRcuqm9U+81ydofYo60CCbDQdQJTYOhWQe2kJb9uRke1
 Ysd74v3OxVzOdf35Ksky6jpE/nE+aA2F7m2Ev4lRqfLVZiEyae+wsb2dc5t+qQSJLSo+
 eGbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCAg1S/+FBEzZAJe/HcF9A7nNSFdYFVkQCAZaQ/H6aeU0OdT54kuWV3UjKw+4rFtQxpR7QVGf5sQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz2D86z7o9A+bD+POJvQ1Jj0X+8zmc89Eubf8+jSaY60S+9nu7j
 r0zSgxsE+ldbfMPbYNpjMFrYl/s9Tyld2Pm0xO3eprSuzZwHahuEeUP5vvYOCqTUlFgJfG5wRas
 XxYmS+Ijd0m66CkuWpyV63dztgtUdCiZazZP9DUb/uA==
X-Gm-Gg: ASbGnctT4QPq4mbtnh18aHonDpoUeapcYcl4uAa8PxCJkitR/lyKczVr27O3jniV6ih
 +TH5zb5HMdFPnIJpWwZs5B/y9LyHjnmLzJ5OMLpXpYlecHMU01XyxCf0qp4aMU8+PAckvOeVfTJ
 QCVtAc/cj6yi/jYLOjjQzIpwnjymhUcitqXh19Sk9nLx63bUBCv+ZX27c=
X-Received: by 2002:a05:690c:4d08:b0:711:16d4:60dd with SMTP id
 00721157ae682-7165a3b79dbmr36323797b3.19.1751537659263; Thu, 03 Jul 2025
 03:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-44-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-44-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:14:07 +0100
X-Gm-Features: Ac12FXxLjxHlL1VoQ7JXfYWs6oHslT6_oIwg1ZW3-J4PAt961ywFYuHv8Wh_ViQ
Message-ID: <CAFEAcA8Zyu7iqJzh43Br9M+5RLQ0S8nbVgttcLY=npOMYv5PGQ@mail.gmail.com>
Subject: Re: [PATCH v3 43/97] target/arm: Implement SME2 FCVT (widening), FCVTL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
X-TUID: ShqOB0NA4Lnl

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sme.h    |  2 ++
>  target/arm/tcg/vec_internal.h  |  1 +
>  target/arm/tcg/sme_helper.c    | 38 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve_helper.c    |  2 +-
>  target/arm/tcg/translate-sme.c |  5 +++++
>  target/arm/tcg/sme.decode      |  5 +++++
>  6 files changed, 52 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
