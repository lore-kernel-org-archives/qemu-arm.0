Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2172751ejb;
        Tue, 30 May 2023 06:20:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4vlczPN5xb9A+WVJWHFps1IlXaemegPGT+pcCL55OThD52V1L+CP2ibItTM/z6u/3a6x+B
X-Received: by 2002:a05:620a:3e87:b0:75b:23a1:3659 with SMTP id tv7-20020a05620a3e8700b0075b23a13659mr1650332qkn.26.1685452847254;
        Tue, 30 May 2023 06:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685452847; cv=none;
        d=google.com; s=arc-20160816;
        b=gEDrZOiN7kdD9iAyrSWdbmwtXjKkdiIkbCi4//AOzEi7CmsW/4MT38cXebDPVBmYPa
         roksup1x1iT55lPkFEOsFn73HXya1GlWfEh8B+M2ByPSJKSym3vCjAkiX5LaVVOYsq01
         TNBElsSA+rZPuJvNs2TPtR+6i+m2O5J6PIVyyOqizMniI2l3M6HwKgvYTy2CFbjeRgYC
         Fh5UJd+ayFahF4iukONHbzQbGuVFMj1Wb+bNVmMQ8HSfg0cJYdFzNGG6aIjgxfw320uv
         kOMUirhcco9f4B4YG+8Vx/sLn65ZloYEwHA3509GZCez32JdZmw/qXDjnjqcD7gJVU0V
         qQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ILix0CPgry29EmQk+KfMSmwRrkQ9Bgg2StiqsuopACI=;
        b=ICK5La+ncEsiXARTVN3rhPwq7GFAiTw2F8RxuQZwBlMfLz73tZdatBUDwZBtOEN+dm
         5wDFy4ADO1S1V4Ga6tnJEeM53lu7EVXYFNYxSzjcJrOIufzzUzmFpk1ZawP18N0OLls7
         ssDy/7KKJ08s7AxilsW1Z5BXq1Wh2Ac8y0laDgrjxWqsKasYHOy9uzDJQLafiQqbXvPz
         2gfC/LIrwPlpyfeZe3mhWFqvqxJR/yV72vGKo5Y1BJYIJRzrBO/f2oun+keYr+YKKOFl
         IQg6s7gsvhJrm1IaRvduaBVkTbVjAxUu3P/5Draa53z7J32Xu3sgc0akaEV/+8/dpKL1
         IvxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2Uy2ALW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24-20020a37de18000000b007591280836bsi1047038qkj.745.2023.05.30.06.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2Uy2ALW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q3zGF-0002HV-Cp; Tue, 30 May 2023 09:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zFq-00022p-0R
 for qemu-devel@nongnu.org; Tue, 30 May 2023 09:19:17 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zFi-0006x2-KT
 for qemu-devel@nongnu.org; Tue, 30 May 2023 09:19:09 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51496f57e59so3814451a12.2
 for <qemu-devel@nongnu.org>; Tue, 30 May 2023 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685452744; x=1688044744;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ILix0CPgry29EmQk+KfMSmwRrkQ9Bgg2StiqsuopACI=;
 b=l2Uy2ALW9+QqTEoNfeeumUwDmLVL6cfzX0EeMrP18eFk0bp93J+qPHHrgRcOcAu38f
 HazLCWIMipO2gCco9CyHVOilj/zADc7kqsoQoaZJXFoZPQFz9KvbWB5MTO4KkNC2zIrM
 ucJOPD1aJ9o0OmevZ9eDBhqQeksbgPU4Pk0fbTuiw1RBB6adZf8VM+HNkVwItvm2v4ny
 UYe3+zyvScAqc8+iL5bbNt+xlS1fhJcW5kqq575LFplDGeratf4QjJ95Xtr0TPpIbD20
 uAuDUEmTvYsVmBGMnXHGxQaAYDYKoR3ZFPxR4N5LXf+ib1MXvq9W+P0xvdfeQT7ievZV
 yqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685452744; x=1688044744;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ILix0CPgry29EmQk+KfMSmwRrkQ9Bgg2StiqsuopACI=;
 b=HXDnupSj07JTcMKMyywl49o7FaaSVHejLGeL0ZE03KXSbE36EKfD4VzRQzNc9J+LHW
 bUn+Wc9+ZVLVV8sLg7IvoJNeZ1jf/5WLCoF046W+p0n7rmkUNeyuEJQpfpumTpUar3dt
 Ubc4EwyYumzpQeYFQh+L7f6xCb5UiJLG7YSeo/mCbI+i0SOMm3poGrJLXkIZLAFKHxmN
 a9OnpTs9WPmPQg333T2Y1PeGGo9H38gXDHoAkj/mZh/gG/08tuhiVtU1M9V8xLxpU8g2
 y/nd7e9Y0gYYfYImf4THZ/fCWr0pQg34CugrCsvfspdrZ0lKDxLZ8HR6sCjRG+Se5kkE
 RPbQ==
X-Gm-Message-State: AC+VfDyuVwmWVGMJSKvZvgjVb7elm++tdJ8GLXBJdUZGStfsTyuZ02tf
 2ozxHnzLRXZQBCLhPsWbdUO5Zi6l4vXLJk3M4YuypQ==
X-Received: by 2002:aa7:d6c2:0:b0:50d:82f9:6867 with SMTP id
 x2-20020aa7d6c2000000b0050d82f96867mr1851105edr.31.1685452744307; Tue, 30 May
 2023 06:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230524191438.172019-1-sergey.kambalin@auriga.com>
 <CAFEAcA_PH8yAT28s3p7_0rqK9NodJ6gTXxv63J+98XoMQ_nJTg@mail.gmail.com>
 <15c444063e114814807551c36ea3389b@auriga.com>
In-Reply-To: <15c444063e114814807551c36ea3389b@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 14:18:53 +0100
Message-ID: <CAFEAcA8jJ5wQ7H9jR3FJzF3mCjWvaKOCTyho6yLoZe8v8Y3M3A@mail.gmail.com>
Subject: Re: [PATCH] Prepare bcm properties for videocore 4
To: "Kambalin, Sergey" <sergey.kambalin@auriga.com>
Cc: Sergey Kambalin <serg.oker@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: YY2JYqeQLVN/

On Tue, 30 May 2023 at 14:00, Kambalin, Sergey
<sergey.kambalin@auriga.com> wrote:
>
> Got it! Thanks!
>
> I'll split this one to three patches:
> 1) replace magic numbers with named constants (refactoring)
>
> 2) add new properties for VC 4
>
> 3) Add some unit tests to check the newly added properties via mailbox

Are the VC4 properties supposed to be present on
all our existing raspi models? (i.e. is this a bug
fix for our existing models rather than stuff we only
want on the new raspi4b?)

As a rule of thumb, stuff fixing issues with our
existing code can be sent in as its own patch or
patchset; changes which are specifically for a new
board/SoC should be put together into the patchset
which adds that new board.

> (Sorry for wasting your time by inappropriate patches - this is my first experience with OSS)

No, that's fine -- the project's review/patch preferences
are a bit confusing for people coming to it for the first time.

thanks
-- PMM
