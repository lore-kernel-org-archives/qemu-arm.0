Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp677842lfp;
        Thu, 14 Jul 2022 06:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tobVfqm4Hb4vJn7W+ypnGZPYMES9F16rrf13B2znZFUA6IlIkY6seyrHpad3SuN5h44Kcv
X-Received: by 2002:a05:6214:1c8c:b0:473:408f:ddd6 with SMTP id ib12-20020a0562141c8c00b00473408fddd6mr7881731qvb.74.1657806745335;
        Thu, 14 Jul 2022 06:52:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657806745; cv=none;
        d=google.com; s=arc-20160816;
        b=XrxwRpoIc6Cr0nr8CYYCkkBtI3DHRmoQwKh3jHz91Wfo05E8a1WNLKbFHIJ7D6O421
         f/mv+ltiTLDQEh0GLD8Qwi2UQnC1dnj7gmvusaZXF4nUym78QCvWLUMlpO+Ur8HRaolk
         PxdcmWnhV+5PVvcmcMkL8vHgSnGO7e920wOkuwdR8cK/vuteUjIeqpHKV/leCnAxVHNS
         seKgIqPu3dBGUc1k6iNma4rbO68fcFfTuE/Vh7gN6rm5/M4SKRyKqZP+PeKyIMVWFF0T
         v2CB1GNTS7BFscmannBXU6yo4N2I6mRd3/brnbgBEktF9zImlggn2fPK+wnTGll7Bjk+
         Yv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oOCJOlVY09Po+YJO2FJacNmTU1B/Df4uqACOL2QQFS4=;
        b=jukMH/J1n9ayMBrHiWP9vnyaBN5AWm+EZ3n2iL87OsTn/nWkVYSc8ZSzluMQeXdyq+
         1Y31OdEFTAWdsfmwlxn3TPMCfYdprCTCFt2veunhigRmX91elc/Td4Dfo3Vm/VVAJ5vl
         VJkrRpILGogi1Zz3sV1j/IsTT3pvHTLNz+gRA9qSmtIs7Ks6fd482SIGmtdbhlqupqX3
         x54+d+Hy50gWKwT020/aq/kBm/Ks+9Sqqz5cWvVlig7WYvCbQPrybSHjXMqiXwOPyP5E
         glhLrTDCxoONkzm0mwcCtBeiBSjDROVDB+/09n9r1HxVhldBYCtyU8P9cLc+DfAI420C
         Nq1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRNhgiDY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a05620a438600b006b5920ccf79si993145qkp.369.2022.07.14.06.52.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 06:52:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRNhgiDY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBzGR-0000Ni-SM
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 09:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBzG7-0000NE-Kc
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 09:52:03 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:39621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBzG5-0008Ln-Vr
 for qemu-arm@nongnu.org; Thu, 14 Jul 2022 09:52:03 -0400
Received: by mail-yb1-xb33.google.com with SMTP id r3so3302535ybr.6
 for <qemu-arm@nongnu.org>; Thu, 14 Jul 2022 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oOCJOlVY09Po+YJO2FJacNmTU1B/Df4uqACOL2QQFS4=;
 b=BRNhgiDYRLJmj6LpQDzFFX/4mUbyorakF2qjxcTaaXIwJVT1Dw2wnalo7HkOyhG7gb
 t1OwA6yI+QgIIXrRQ9JvdAjDK6h+Opz+uqls0O4Wy1Xiv221Gk+8giQSI5aYv3ufLfBu
 61lfidvoWynAFr1LaYKpdrmbZ9fxTrmJn9olJ0DMOuSQx4H3SxiaFOLk4OWstzGlnh5L
 ow/2p3j9oghuh3j2h2nKHhSJlo+DAIGExVGKsMF00DxIRn8tQSkLoQFEBzSI9zl6KrQG
 3oteeWxV5ESXKFDBGd3+v6IGqpKLaA9m2UCJoH3UdzNd1FBRA3QOfAYgY/Ke004B+d7F
 oQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oOCJOlVY09Po+YJO2FJacNmTU1B/Df4uqACOL2QQFS4=;
 b=JhsYmtQrqY2qiiWWy4Z5fPsfm2svDL9G5pFORbtsw4yeagJmjxoh9v29mLaLp0AUw+
 Avptuzzl+Z0mpn5m6wyNB6s/xYqwkoJ88ruowwax1ole5chwQRXqQVUBZ0NNxXsKrM2v
 jHkB29jRnVKQDExkMZXdLKElaQ3N24W/LprzczT/bafc3EzHZFJD2nArVuEDnUFQoSEd
 M9FuCxsVPdQHp0oaJ5yoNmXHOrCZycyX/5y2NGHHAKgKsFY/THhqOeUjTJn8RlTX3aBC
 roC58V0n23d4gdifeW7HfmtuZR+OsLzDZvkgspICp9gslYEECQojOR7AqqU0w0sBY9/H
 XEKw==
X-Gm-Message-State: AJIora+24TRmuf4USjBSB4Di422i0eRhCDTkgpX48+YkRWpo7zTQqhvr
 6ytFFsbk2+sSuKL44ydqNgNXmCh85x74dbTrEAU83Ez1MdAatQ==
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr9250140ybj.479.1657806720631; Thu, 14
 Jul 2022 06:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220713075255.2248923-1-clg@kaod.org>
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 14:51:21 +0100
Message-ID: <CAFEAcA8xxt3k932pgAj45ivZWq3VQoc2GSEQy1j9PtrP42ig9g@mail.gmail.com>
Subject: Re: [PULL 00/19] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qml+dPldd9V+

On Wed, 13 Jul 2022 at 08:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f=
82:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into stagin=
g (2022-07-12 14:12:15 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20220713
>
> for you to fetch changes up to 053b2ee5629d1b822127cc454634ec272624bab2:
>
>   aspeed: Add fby35-bmc slot GPIO's (2022-07-13 08:16:46 +0200)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * New ISL69259 device model
> * New fby35 multi-SoC machine (AST1030 BIC + AST2600 BMC)
> * Aspeed GPIO fixes
> * Extension of m25p80 with write protect bits
> * More avocado tests using the Aspeed SDK
>
> ----------------------------------------------------------------

Build failures:
https://gitlab.com/qemu-project/qemu/-/jobs/2722152320

hw/arm/fby35.c isn't passing enough arguments to blk_pread().

Your pullreq probably collided with the recent merge of the
block patches including
commits 3b35d4542c853 and a9262f551eba44 which add a new
argument and swap two of the existing arguments to this function.

thanks
-- PMM
