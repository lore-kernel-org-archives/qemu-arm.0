Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1829801dlb;
        Thu, 20 Jun 2024 12:01:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp6tUiDSzMPpPYuGa0MD47A8ZdvnDvDpMKD35GWOhriF5HrdYjNnYqFFWL7JPzeG3hRV/C7JwYf2OgleOVEKG4D8JR0pQq
X-Google-Smtp-Source: AGHT+IEbA6XtwrkVNT1RhNhzGWOv0pTQMgzS0Uj1wH7zz4vMMNcyKdX/Xwv41cC29X/uh/4E+lIb
X-Received: by 2002:a0c:e7ca:0:b0:6b5:faa:3b5 with SMTP id 6a1803df08f44-6b50faa03e8mr38612876d6.26.1718910093109;
        Thu, 20 Jun 2024 12:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718910093; cv=none;
        d=google.com; s=arc-20160816;
        b=QlpHyFyCP7de6fgmXADTYsMZ/AsqzMIYeu3+NtHEmdITLjVtbHQMofa9lDPL5Ady/0
         6BxmE4kS/4TGuvsqgW6ExV0jJCCOEhAln6SnUbFklF5GU/siTB2BJiulj7yFDlTRa5il
         i0LfKAxKoxY3PS8WN0+XrtEprfi5ctTUbHZSSL1ZVuGHTZh2eNtqpne/Q7j9M2Y2fXSx
         igAs0YXOQR5wd2rNi6gZZypn2LIVge629N9n0RlaKnd14FKxG6VY2ZrI1cYVXQH/3VgO
         /RxUz7bQb/8CbrfrYQvSQGYNd5GYt766rfYltkpF8oBFGiQMoj8vKKHCZvhkZ2Zeknut
         Ffxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gTzdX5i1gK5T9S5q6ncHTjeUoQ5rRfQBqxKZAfFTfKQ=;
        fh=zHrZ+OPAnPw37IVTZwashe2UspIXG0Bi2qJTtd8+rqA=;
        b=Qb2Qqzqm7olpkSgVAuW9CrH3jO0BFS3xkZoxiKtuFTQ7Ai0wCT3GDzEchZCIJrvyD1
         0Kyf3V2HfzwMDfTUpF37STSwiG1+OBXS9cA3aMes/edvkbcq+08zynr+gOU3guvEa3t8
         tjU6A4IUAkor4Cx+RZX1TrdOSCzjY4gh6w9SFoYqN2pWGg4Z3Owd3oJULeXvbicY0pc3
         2u5ygP8zvJpJ2+q3N0K5S9UkWfn24qD2rycHdDhaPO5c92bRiE8DlJ0VCRDQvKlMOk/d
         DGd1mqk3olW61h1TmkHFLYP4Ynkxd1gifWzjd3bQMeVXBstyEdcZLcJnB4qAI37mLvw6
         dCUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wpQUzmxp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5b7013fsi176448806d6.500.2024.06.20.12.01.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 12:01:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wpQUzmxp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKN2A-0004gp-0p; Thu, 20 Jun 2024 15:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKN24-0004cK-Or
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 15:01:16 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sKN22-0000FC-6X
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 15:01:16 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2e72224c395so12884301fa.3
 for <qemu-arm@nongnu.org>; Thu, 20 Jun 2024 12:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718910072; x=1719514872; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gTzdX5i1gK5T9S5q6ncHTjeUoQ5rRfQBqxKZAfFTfKQ=;
 b=wpQUzmxpsLYRLtRhjyzRkwXtcu2u7joWFm3A7AqwY3m6auBqW+nLv0f/hNL6BgXLq4
 jmzWcRJgoLyJ3QyQIVZTy67+zHuNntF9GyeXT7VyRJCxJ3rLA6qveafllt+T1XHcGJco
 qb8+z1OSIX8QY3ZpGj8SfF44tUVUrK6MmjM1ZGZQV5b134okBwR5yiZl761aIwXQzFlc
 EtsASH0QditIIYzb0pSoWKHllRjS86w5RaqRwLtzsYaIrW20U88AyxT1y/WocWJUggeG
 8bBNJK4Qz7B0UvSRPlM/8l9k+3MJes7NMKDBQGRHFLVXCQKktOxy/jOPvJpTIl8TWGOK
 6C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718910072; x=1719514872;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gTzdX5i1gK5T9S5q6ncHTjeUoQ5rRfQBqxKZAfFTfKQ=;
 b=L7dyQ0ehcTqAnH3yXqI8iZIqL8bQOpqK55esCnEE6qC4yh5AxGGjC68jzUDuZCqaoG
 Wm2azY7Dd2f57ddPurAOJmNi0V3YE0SZYfV7f1I4t3iOomBHPDbHudVtKXtslQC48EaH
 Kpy7GG1pNFj9HoIep0wEMyrVYYv44PehwFGONIiA7ct9QZCp8nMcuuQIygdXFkqvaUv7
 GU5WJxFSV/cyeMKaUiecSRA2r3Qjh797PFND9/YkcTIv9sd5fbZochNtFH1O8psc+g1d
 rwdHzkVAAjtSIhJwyjr/SDdkeZyhGFcTaLJLuqyUo98TvpJJvVXnn4Qn9C72mZQXFQoV
 /Vow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWq+DItXHd7Jez1wZN2lkgZO1cBj5l2oOfxl2jIQYlLvT39s1c8B16EcJQNQ/wLgcXJaVyxnGtx0JLQDVMLaWUBMxdo
X-Gm-Message-State: AOJu0Yzzb6b4HAIVvcGp+FvvgpOot3VgtpEwmM7EL1EaX7/ak3bdcn6S
 S+Rvr/3g9iDRFXuTlh7dahOulRgVjB/8wADHoGgWzWPeTkT4tjasPI3eAfXwoG/4z9cnyCXkmG2
 XpXNzgIuL83LkxdSOFgZGG4weScnpe3nsrQYUlVOmMIWoreA7
X-Received: by 2002:a2e:9e4c:0:b0:2eb:e471:dc39 with SMTP id
 38308e7fff4ca-2ec3ce9a910mr43665901fa.10.1718910071937; Thu, 20 Jun 2024
 12:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240615185423.49474-1-florian.lugou@provenrun.com>
 <CAFEAcA_+WrzM4fXQMUxMi3L5yiUWMrUGTSZH=NDdYDKUCP+8NQ@mail.gmail.com>
 <20240620135627.qxcrkdx5v7wdurx4@flugou-latitude5401>
In-Reply-To: <20240620135627.qxcrkdx5v7wdurx4@flugou-latitude5401>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jun 2024 20:01:01 +0100
Message-ID: <CAFEAcA-ngrrEUDD7eA_sOLGF+_wRCuQVxTwuCA4pXjRcuJucmA@mail.gmail.com>
Subject: Re: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
To: Florian Lugou <florian.lugou@provenrun.com>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
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
X-TUID: 5aknixhVN5Lk

On Thu, 20 Jun 2024 at 14:56, Florian Lugou <florian.lugou@provenrun.com> wrote:
>
> On Thu, Jun 20, 2024 at 11:43:17AM +0100, Peter Maydell wrote:
> > For this timer check, we're doing I think the same thing as the
> > pseudocode AArch64.CheckTimerConditions(), which does:
> >
> >   if (IsFeatureImplemented(FEAT_RME) && ss IN {SS_Root, SS_Realm} &&
> >       CNTHCTL_EL2.CNTPMASK == '1') then
> >      imask = '1';
> >
> > so I'm inclined to say that our current implementation in QEMU is correct.
>
> Indeed. I got confused with the specification, my apologies.
>
> I am facing an issue with QEMU freezing waiting for a timer interrupt when
> running with -icount shift=0,sleep=off. Bissection has shown that the issue
> appeared with f6fc36deef6abcee406211f3e2f11ff894b87fa4.
>
> Further testing suggests that the issue may come from gt_recalc_timer. Calling
> gt_update_irq before timer_mod (as it was done before f6fc36deef6a) rather than
> at the end of the function solves the issue. Is it possible that timer_mod
> relies on cpu->gt_timer_outputs, which has not been modified at this point to
> reflect the timer triggering?

I don't *think* it ought to care -- timer_mod() tells QEMU's timer
infrastructure when to schedule the next timer callback for,
and the gt_timer_outputs qemu_irqs tell the interrupt controller
that the interrupt lines have changed state.

Do you have a reproduce case?

-- PMM
