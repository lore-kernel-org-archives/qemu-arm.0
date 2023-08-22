Received: by 2002:a17:906:f150:b0:9a1:ac8c:26bb with SMTP id gw16csp49153ejb;
        Tue, 22 Aug 2023 09:27:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0FM7aMKwCXv75ZDUDM3YBrdn/jKxE5vTTLmuFVLU6anMXbXS1TWW2x/njcSjyk+NPMvxj
X-Received: by 2002:a0c:b31e:0:b0:64f:4c95:89ad with SMTP id s30-20020a0cb31e000000b0064f4c9589admr3118246qve.9.1692721631267;
        Tue, 22 Aug 2023 09:27:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692721631; cv=none;
        d=google.com; s=arc-20160816;
        b=W54fHPYbq8DzHv2A0imlRO0KG5LIdg/mQLsIVlVhNhjFBscXSZ9uIzOwPH9EJ/vZ0T
         bwTmvNR7lac+LzXj1FPVeAHIHezgVD7lXMvjTA3002TqpgoFu86Od5MQQa9XFzOJ2PKS
         dvzGvLW8BTK4GbJPHEFDVd0zBp3KInBRpOJ8iezH+bazhPQsPIC2bg7GLGvNlkgdwEQ3
         Rd9235PM2M2HQRvjXoaTNi9v7YMj014ecWbTVUlaKS3iFWilAlV/0LWT8DDEI2hGIpcM
         aKiXKrfhTmMQJUlOzI1c6eSmvAsh/d7QtasvfilXQ0nZFbT1OFdvfCqu6St/uF8AJNnf
         E7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KQbt1N+xe74ITT69tg5yWz1GrQEUZduKDftwx0/q1QM=;
        fh=dkefky1LBC/bcaNGbVS7PaGO4rZWKHRyGYBpK2ITR6I=;
        b=vjN3mGJq7iNqSGcxBHqSEwgRJ8UEUwEnbJt72NkVv1eFV0TphjdU6B2cIlmlf76vRF
         Imn/p0gXcB5qivY7WqM9XjHMDJZQM+oe4KIBASP+2dfFvjw9iBonV9s2MrQRKaeTdG4z
         S3K4k42l/k8GBui1dihPbfpK+xLbOsuYx8RxtsmlaKNvAb7mDaUwED53gSM1xFBGEFav
         Ej4C2CuwDR7RypT+HozwGUeBmFxvT4tffUvBwBZmnJxtnd0bLJnKFHZJyiz8JdnEFDGl
         FlQxNS293i/aqq+upHoxh/UaKhGuwE0Q9/E3Wr2j7/Li/0/s8oh5+73bBYpJjBGL8Yb8
         Davw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EyfH2JBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a0cb403000000b0064cec5a2abbsi1487318qve.537.2023.08.22.09.27.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 09:27:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EyfH2JBK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYUDS-0008KY-GK; Tue, 22 Aug 2023 12:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYUDP-0008Jx-S6
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 12:26:48 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qYUDL-0002d9-CE
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 12:26:46 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-529fb04a234so4057640a12.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 09:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692721601; x=1693326401;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KQbt1N+xe74ITT69tg5yWz1GrQEUZduKDftwx0/q1QM=;
 b=EyfH2JBKCLAXa7NMqp/rf0izdawHW2d98fZ+OnQzHT+VgAhzlMvFFFLH9oQeOzRs+0
 /DZZVRlWZ1Yg5yiaGTk3JGFxXf9uqLJuQt2WhnA7I2uKoAKqGTEe3K+m4RAkkTdVs/Ha
 ibxKLdyhdy7sZ/0NOi8DifQx4vhB4/O4sIm9T/ScPNp79qSy3BoC6Q6cxOt9Ridhxz7L
 DQdTRSR4ubG7cRzj9r3Y5SPPBnvQMrhtx3z/Fy5+OFGrcLyC7bEg25Cxx8MuNHwZsz/2
 7rrnpOxUAmgvssWZXg+QwiIjSou6bN8cLw2n6zqEGjTBTIYLm3l3ZDs9fm46kmHSpiq7
 N+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692721601; x=1693326401;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KQbt1N+xe74ITT69tg5yWz1GrQEUZduKDftwx0/q1QM=;
 b=LVVUNr4Wf3PdqI1TTs0OtJzsSdAOLuhPPb72ATQk/rYliftu1Gd9QcyHSURzYK7fM+
 ar+7pnlkp4erARzLNkhCm1YSAJH27DCczllkg7KxJhafzem+9lmw/TwjHJrVkjCABx3+
 6mQC/5Uf8n6ROFeTvP9eFt7leTJ9plJuzmFchp06Y9HYlyTSPBa5ZQ+tJz1erkIvvGIm
 AlMwwhRtq0VYP9aV0pn7MJ9SbsWTT6jCGPKI4vioDHJ5LN0JvZa92xVKMmy2RLvZgSTw
 py4NqZj+04N7wFmUMRmrNyPBnfBQrOUBekdQsCFusCJN5f05uDwTzDxLZew2/MQiptQ6
 l98A==
X-Gm-Message-State: AOJu0YzhRGlQU0iyeiuhmNRaCTXSFbsQbDlXWgowIUxKINgp8rhQ/EQV
 STS3Y+G1b7YxZSxF1siifFOvHyoSkm3Pu7YZYCK1Lg==
X-Received: by 2002:a05:6402:3447:b0:523:1004:1ca0 with SMTP id
 l7-20020a056402344700b0052310041ca0mr9283237edc.5.1692721601490; Tue, 22 Aug
 2023 09:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230822161755.1225779-1-matti.schulze@fau.de>
In-Reply-To: <20230822161755.1225779-1-matti.schulze@fau.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2023 17:26:30 +0100
Message-ID: <CAFEAcA_j+2LHnmkLARcSuDJ4i0rRV0TdVkCDTY-22WUWLB4HZA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix bug in memory translation for executable
 Realm memory pages
To: Matti Schulze <matti.schulze@fau.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DEVSJSP+AxT+

On Tue, 22 Aug 2023 at 17:18, Matti Schulze <matti.schulze@fau.de> wrote:
>
> This patch fixes a bug in the memory translation for target/arm.
> If in realm space, e.g., R-EL2 executing code from an executable
> memory page currently results in a level 3 permission fault.
> As we cannot access secure memory from an insecure space,
> QEMU checks on each memory translation if the in_space is secure va
> !ptw->in_secure.
> If this is the case we always set the NS bit in the memory attributes
> to prevent ever reading secure memory from an insecure space.
> This collides with FEAT_RME, since if the system is in realm space,
> !ptw->in_secure also applies, and thus QEMU sets the NS bit,
> meaning that the memory will be translated into insecure space.

In the patch series
https://patchew.org/QEMU/20230714154648.327466-1-peter.maydell@linaro.org/
(which is just waiting for 8.1 to formally be released before
it gets applied) the ptw->in_secure field is removed entirely
in favour of only ever looking at ptw->in_space (among other
reasons, because it fixes this kind of bug).

There are also some other realm-related bugs which we noticed
but which again are pending 8.1 release before they go into
the tree. If you're playing with the realm support, I would
suggest you start with this branch for the moment:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git/log/?h=target-arm-for-8.2
and see whether the bugs you're trying to fix are still
present there. (Don't use that branch indefinitely, though --
by next week I expect it to have merged into upstream and
then it will just be stale.)

thanks
-- PMM
