Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp76378ejf;
        Thu, 22 Feb 2024 09:17:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUH8Hj9gEujlUIJqHt87rfJnx88GXzPAph394BvoL6Dg3l7yDbMustrWzQpN4MBgaT44YG2e0Ljl7f+Qq3hm/XZSC+N4sIb
X-Google-Smtp-Source: AGHT+IHibttRK8Pms+pG4QhB6iArN4tP067iB1gMJoBwyM/YsEigKV4w/hF6Cc05wRWCM+oWu5wh
X-Received: by 2002:ac8:57d0:0:b0:42e:4b4b:fc68 with SMTP id w16-20020ac857d0000000b0042e4b4bfc68mr2663536qta.55.1708622261468;
        Thu, 22 Feb 2024 09:17:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708622261; cv=none;
        d=google.com; s=arc-20160816;
        b=I45yvJtJfcmttcNWLXrsEWP1M/dFSlxD1QtDP+qjeeZXYxw+9X7FMXSqIm05HK4Egl
         tkYRAyZktyescIXgNMoNjwfIWAwfgatuznrp4c4SIwogpqA/Kl7wNlx6YdmcIBiWtrLt
         SRcyNKYoeEbkrvofm97ppUP7nHmFj3KpXS3/CfGg7A/Bzx+KSMfnItUgwdcBVGI02Q5/
         oJeyAB+5UQ5vCgL+fu44O6ZvcdRauNCS9xHfAr5GO4cvezHcvnUolI+McpuUckanh5hk
         VNBScwQ6tsomCYKVZCB7wVX/QtIfvkBP82PHqK5SB3Dr69Gmctin2elbioeYFYf1QeV2
         OnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=APtQ1w4RyEN4SoAmVY3OlRegokxIVcpkwFrVOmRN52w=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=ynfLMw3N3WfFmCia4YizHA0fr89jw+ubRNF0X/aMutnPlvHJ5+v/2/+yUS0mVMbuX8
         Vu37rO5kyDhoWTDg4dmvqC01J/RU/kmAeq6R402ZIpsMhcw8ReB8XIRInm5N4IzHiI3z
         6KIM/e482WtWLZpe73vQRNQOjnB128PpPz37IGIfTlpkntpAGJ0FelPxOLp22mCgf3zH
         KiedMS+KFbUmSGbdF6qwGQgvdWECKmLFeG6f9zZnavCd3JCSxuVRe9LWiJM9SlNAzQQG
         Fsey25b5GAyFWCW9w19jwpwbHPYoqptk9RlTl5qipCci9xhgnstEgGNDfmROUTDHdxK7
         3kmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MfluM/aQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020ac87209000000b0042e2aa4a8e0si5599994qtp.49.2024.02.22.09.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 09:17:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MfluM/aQ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdChH-0006aE-1S; Thu, 22 Feb 2024 12:17:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdChG-0006Zw-C4
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 12:17:22 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdChE-00017y-OS
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 12:17:22 -0500
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-512e01b3da3so843531e87.3
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 09:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708622238; x=1709227038; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=APtQ1w4RyEN4SoAmVY3OlRegokxIVcpkwFrVOmRN52w=;
 b=MfluM/aQR9s0fMhyKvJcC24e40MS9KougjkIOdLl0zLvf8Xntvl3OSbD1753AfiX8i
 pOJW+LZgIhH/gZyeVNkhLNuqWRwOLlSHnZcby3bDOa6xW/HixOChX+JogmUEFpEmZ20H
 S5E05HbzIBtoVXWuVDoZez+qXviSWEKzLB91d5kDWV8kkUvzchIsBTeGcsIk7IF0tD3m
 KxADo6tv+51MLKS5P/R7w/ba8yNZc4UX76qdJFZdjtgWUVPihW1ddTIQof28i475jS6l
 6xsbxaCKmIYfXcJtJvT7JxJYrhLVkcdPRtNpsDg9a86eX6HeNo85wLk6XEGA7zzi4o9x
 lC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708622238; x=1709227038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=APtQ1w4RyEN4SoAmVY3OlRegokxIVcpkwFrVOmRN52w=;
 b=MLfhlg9wy+4ElxR7AUURhq2pB4lg9RIW32aK74/XTaFHqVDedTgcWlGMIXxzyPLcct
 m8O0Ny1Bd7MfRU2m2CW+D7hAu9DsxI6q2djX0zad59+TIODjsLkZVdqO86Bqz5WXE5ma
 0xza2sxy87dgjRUgWQtGPg4Ieq0BEcDejQA3TpoPgTzPKb4ewKC8cm6la2wpDRK6xiGB
 eB9YzpLB8OKbQa103yltVOjAp6l7cpeSZfrx0Bo0fxmgfcCQ+EHUFPgkeOvjbmOE/URR
 jm3Gq9ktISD6T1QAy9TveQm54banXhxZe2IGSumyPuzIzF/u7JD7w5G9qp9nJyi8oaPJ
 PLZw==
X-Gm-Message-State: AOJu0Yx2l7VxNiwrwe54VMLzDKFr8uJbh0/ZY1qkGOylCV3HxoyScWiq
 HB/MGBIH+o1SdSYcnPR2iTuzXGf/GUry5jfEPTJXNQV3N3Pa46/CliHo4vLjb7GqhQKzFVLBrxL
 l2CCVMMJcJuxH1rTr3QEiVJ4B0nkd7r02zPYevA==
X-Received: by 2002:a05:6512:131d:b0:512:b187:ae0a with SMTP id
 x29-20020a056512131d00b00512b187ae0amr10414137lfu.6.1708622238063; Thu, 22
 Feb 2024 09:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 17:17:07 +0000
Message-ID: <CAFEAcA-Wir3M7dVV5247uMPxCtrYs8j4Z3S7nucCx3Ha8pA1dg@mail.gmail.com>
Subject: Re: [PATCH v5 00/41] Raspberry Pi 4B machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6uvYTCLIpZmZ

On Mon, 19 Feb 2024 at 01:19, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Introducing Raspberry Pi 4B model.
> It contains new BCM2838 SoC, PCIE subsystem,
> RNG200, Thermal sensor and Genet network controller.
>
> It can work with recent linux kernels 6.x.x.
> Two avocado tests was added to check that.
>
> Unit tests has been made as read/write operations
> via mailbox properties.
>
> Genet integration test is under development.
>
> Every single commit
> 1) builds without errors
> 2) passes regression tests
> 3) passes style check*
> *the only exception is bcm2838-mbox-property-test.c file
> containing heavy macros usage which cause a lot of
> false-positives of checkpatch.pl.
>
> I did my best to keep the commits less than 200 changes,
> but had to make some of them a bit more in order to
> keep their integrity.
>
> This is v5 patchset with the most of v1..v4 comments fixed.

I reviewed quite a lot of v4, but I don't see any of
my Reviewed-by tags in this version. Did you really change
every patch so much you had to drop the tags?

thanks
-- PMM
