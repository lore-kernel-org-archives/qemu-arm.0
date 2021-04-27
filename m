Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4959938lfb;
        Tue, 27 Apr 2021 09:51:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIPpmk//bbCPR9DEdp7+bKBuHTAyRQ69UBbDqdXUfnZTv+cGzRiskMKvQDqZMQpQFXbScA
X-Received: by 2002:a92:d650:: with SMTP id x16mr19075329ilp.223.1619542300054;
        Tue, 27 Apr 2021 09:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619542300; cv=none;
        d=google.com; s=arc-20160816;
        b=bDElYvWBy1E74zzLCHgAXpIwQgZc9J0kANrKGLzOUSWlggTfLXqYKBje6AgyslomOm
         1u9gQ6HoAMFqLRP7QcinZRxCYIfWYehC4M1e7GRT5suuZfSXD7tIKDU31TNJTbBhIC3P
         5KFVRsr1zD2mrm5b6GHZQMSXsLeN/TPwn5sJGeauhHt/TUoUlYMdHlfUMd7fuUEAHLun
         Gx38jJNG3tD+SLzWGfhGJD1cXDR/vfC2rwiluywcMRdeW2JbGJxOIi6F4jbHmXaKwqYP
         9QzG+c/zgIpgt3oF6mEcTXnmY6fLQVLUef0jDQZxFrMwakOfKRioLFk18fWZzHk6CAx/
         gBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PIkHYGZ8ur1vpArbXiX8iAZ0hbUSvpCYqP3mVAXDxPE=;
        b=Yj9dDiO4PB9uVjA7xcOxlat9x/umc8qTkzVjoH5JPkXQInqqFUphkXKwrqRU9/N6GG
         tfvtqTF5iywrJkKHHL6QYSiFwbAfnWoEkE24372O2kEsEPW4PzKlK6aBEAsw6cu8s45v
         TYW1whpnzxKuDjjVW2mcX1HMsRGCa3ZVUbTOAwe0cSNvwngI0yQRrC/MhEACmFgSLKlo
         4JKXx8HZSLwOun9kFsWeJ9z6zp9x3akmdFPY2EfJ0KVOC1rKHiQZkkBuPbm00Oqm0WED
         yoEzJXqF10wWl2ymzQvnfLAatO5jLiZX4eY/AyLMI/KAnSoqT5/LSqHNXtnCFlTR4agb
         SQNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OXHhEs30;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si4044749ilv.72.2021.04.27.09.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 09:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OXHhEs30;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbQvz-0000FA-BV
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 12:51:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbQsC-0005wX-KN
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:47:44 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbQsA-0006TI-5p
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:47:44 -0400
Received: by mail-ed1-x52e.google.com with SMTP id c22so7117880edn.7
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PIkHYGZ8ur1vpArbXiX8iAZ0hbUSvpCYqP3mVAXDxPE=;
 b=OXHhEs30yfW2POshdsEF3AdmYDTbD0jwSXr5XN5BFAHSKOsMHuWCxvi2UgBmVvgPS3
 IpbkhJOkivIuMplz+6F7R2zYSY0x6gxplo8nCxy1DEHU3DobYNWrj/GKW2Mper3jkkAh
 0k2FY61igbc1P/nS6pClXF/9CV/Epa45dw0IjNMu4pk/3aS+tfR8rYBQLO/5o+eAYhnB
 wNAi2moQGnj+h2b7jAdTccTXLN9t4cGngzU2+bw9YAGpW2hXUyVp0pmda/rPRGJ7F18R
 fgjxsEkGg/AVT8gekGBVEAl0+h9ZRKaL9LVBhOmKO6YKQZolWqJPvj3YvYVVPgM0V6xz
 cgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIkHYGZ8ur1vpArbXiX8iAZ0hbUSvpCYqP3mVAXDxPE=;
 b=jwh1cp7Id+YAgLlj9jdcuZ/N/Eh8+tTUppmtDbrlzwBiVDCrKcAWnyUf0RpSPiDiD4
 7oMnLIA3mVvc74OnIPuJYcAfjOYcqmGSm8dU9NoE1wCFulcjDgZou4dAPLiQVLepN3SL
 2wKYviRgD2V0E42ldtM028MxCJF+hf5qOdSSIiosMIpypC0oEeU80rzyemo0UDf76D1u
 n5mAYBNQ57uP8Xs3SwiDoWqtkksBJLCTbwoRF7e1Kk3xtwAnw/s7HiHrTkopzCz1WjWg
 8GHo4mLofUAz8BqVenQP107RxJ9qanv2sdOEvcUsMVRxiqMo9wbS0G6V+UOF45Q7DoJi
 aK6g==
X-Gm-Message-State: AOAM530Mcp/fPmISLWgbbMaxkEhFsTU5XU82LLlKf7VMHcI2aukYV/JA
 +LlmmPW5PYRLelwb85x2r2u46lMy1Sd3Hapw5rmZ9w==
X-Received: by 2002:aa7:c0ce:: with SMTP id j14mr5431479edp.251.1619542060237; 
 Tue, 27 Apr 2021 09:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-6-peter.maydell@linaro.org>
 <3413dad6-67ee-1715-6e19-06adac14bc11@linaro.org>
In-Reply-To: <3413dad6-67ee-1715-6e19-06adac14bc11@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 17:46:40 +0100
Message-ID: <CAFEAcA8CrunFV3RWShGUyFdQPDYNmsW2x4U70kgWd7kMU1JsRg@mail.gmail.com>
Subject: Re: [PATCH 05/13] target/arm: Move gen_aa32 functions to
 translate-a32.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: 8ZS5zT4VQEBI

On Tue, 27 Apr 2021 at 17:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/13/21 9:07 AM, Peter Maydell wrote:
> > Move the various gen_aa32* functions and macros out of translate.c
> > and into translate-a32.h.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/translate-a32.h | 44 ++++++++++++++++++++++++++++++++++
> >   target/arm/translate.c     | 49 +++++++-------------------------------
> >   2 files changed, 52 insertions(+), 41 deletions(-)
>
> These functions go away with my alignment patch set, fwiw.

Yeah, I discovered that when I did a rebase on top of it. (I'm waiting
til the alignment patches which are in target-arm.next get into master
post-6.0-release before sending out the rebase.)

thanks
-- PMM
