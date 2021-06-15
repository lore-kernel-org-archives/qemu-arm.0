Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2710643lff;
        Tue, 15 Jun 2021 01:05:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgX1OpoM+rGSP4PzvtiLYVbWmzIvN0IMPbF1CNRwy+/pG5rcIkuntiu5jLGWHJWkJ3q6gA
X-Received: by 2002:a1c:f717:: with SMTP id v23mr3635806wmh.32.1623744337570;
        Tue, 15 Jun 2021 01:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623744337; cv=none;
        d=google.com; s=arc-20160816;
        b=DsO0uHIj8G/IDE5jyK1fSQM/CGmqtc9OSh58/HHX9GXsqfIPXEKv3rYp0BnTBt6/h7
         dL9dDPSkv71uZoRVE++iZ+fJPYCF6Guu7X6UvItEWaBS9Kk+408QoPbRmscl1R971bf9
         iy4zFiXWbyVfHwt8Tr/dHU0wtZTCGCSNkbUpELnFscz+5QcbR2J+ip88wjVX8EKdWozP
         0678QiULxA9NOox2dCKvqhhJleOq8BncHGCqm/toEYv2fgKIfEzHJRIMV6JFz18UVvmX
         B5+dmh7iz/E6Y9ATyaC2owVzHuCUMlh3TA/2ckybJ8DUMhP8CWGjAY5TCX1r3gDsRqei
         cR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DDxycEP+amo/2i66FxzZSk5sT33AMu/ZG42ZpU8J0Bs=;
        b=in34dHeM02dOhl00AcIVtD3QIFepBGlVKCDze8NjrSqwA4T2pxt3QFpUVCZ/89HrrU
         tg1OStSKTnAdM56vWTmtKybiEJ97jZCj8LbPjQJQR+2757nBuzn1S5SXkr0fNHBivgnu
         Ge4t9C87A/xTry2omUwHOTUL/ubfBGvJK9FhjtxZ6MQ1PZ+REpwKI4lPo+N3pbWGNqzV
         JDrMWEmQT1VgxpmDvuK6gn4kjmbGk9dWYQZw5yadFULapBQUCEaPKnvWkTZOA+sYXJGr
         Wakm/C5E4Ak9kLOxehdpaRp8VpeH826/gsTHaa5sgbETyHU9Be86PNCI4axIwYgo+927
         Obeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bhRNpDsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16si18236305wro.399.2021.06.15.01.05.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 01:05:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bhRNpDsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt44m-0001h4-N6
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 04:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt44Q-0001bJ-OF; Tue, 15 Jun 2021 04:05:17 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lt44O-0002XP-15; Tue, 15 Jun 2021 04:05:14 -0400
Received: by mail-io1-xd36.google.com with SMTP id s26so13318800ioe.9;
 Tue, 15 Jun 2021 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DDxycEP+amo/2i66FxzZSk5sT33AMu/ZG42ZpU8J0Bs=;
 b=bhRNpDsTExs3EAVGYlYRIPxNzj6QPVvBjtJ3wV4D/taut6jP0LnUjRtSF3PAN+LIM2
 T2tB+w/Bu60RjaeSQZx17IL5r/99BNuVcWfswYUqey5V17NEJik+p5ui/D9cl3LTYbOz
 yOrPyMsLj4NYRtVyErGVc30E8mqz2u4ADXQLIkAAlO3NPNri2oJcrW5ESJYcQRDNh65r
 aLuA8pKcXrmj9OJFg4xE+y9BiB979DN8emq98TiyDtNac9WtTgWGTgNKnbj1fqtXgwET
 Hm7i7mX2eFikFs/A5xRIux4O3PhY39aRGklEb8Mawt4FvTsYZbDPuMEjSNhwkEG2H58E
 bGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDxycEP+amo/2i66FxzZSk5sT33AMu/ZG42ZpU8J0Bs=;
 b=CKNpyqa5ymY33XoWXvMI+1FfX2lcbtnNDbJvyfy1BDywwqp/XulvarP8XV0+wc0KI8
 KVcHTsI6PBYLiEoPx9TZD0BItXMfW9rXR6++N0deZ5fz2vpaFm+HWqDB6QUxVTIZp11M
 JTwo1Qb81f9vS7pREXWNnKqnQXlICvS1PwN4p6ipVDoE8dpni8jk1P50SgGEPxoh5a7C
 4+PgRSERDVOu8rZWry9t8fMgkvBU3lehPt5Nwi2Cq19ukvI2ox0QZ4aXQF9NGTvT4nsh
 CJvo4GUadsThPmaNRbXVvdOSPkhYSvcFru5AgB8fphap5n4VEx17+SwbgOEAt3wvyCnj
 n4Rw==
X-Gm-Message-State: AOAM53230mPzWaOtj8axoxmiagRotatqgUjfDJ2nNcTh/7vFkFx26qtS
 5JwpT12/+rtCicizI3cMhBjaGAwq6ZinrHxfmWg=
X-Received: by 2002:a05:6602:722:: with SMTP id
 g2mr12041011iox.118.1623744310485; 
 Tue, 15 Jun 2021 01:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210608161028.4159582-1-erdnaxe@crans.org>
 <20210608161028.4159582-2-erdnaxe@crans.org>
 <CAKmqyKMs4Sr9oXR8k3jeXo=Umy3F6k-CfQW4Fz3zB++uFKkmDg@mail.gmail.com>
 <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
In-Reply-To: <6bcf8d1b-7caf-ded5-937a-4c1bf96e2d85@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Jun 2021 18:04:44 +1000
Message-ID: <CAKmqyKMETmc0sJbG8FdUokg9Ke_hg5ohZ2YnLzyQO1xwzpXMRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] stm32f100: Add the stm32f100 SoC
To: Alexandre IOOSS <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:STM32F100" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yb5Ss49m8ScD

On Tue, Jun 15, 2021 at 5:50 PM Alexandre IOOSS <erdnaxe@crans.org> wrote:
>
> On 6/15/21 9:41 AM, Alistair Francis wrote:
> > Aren't you missing some timers, like timer[5] 0x4000_0C00?
> >
> > Alistair
>
> I double-checked using the reference manual and the datasheet and there
> is not timer[5]:
> - page 36 of
> https://www.st.com/resource/en/reference_manual/cd00246267-stm32f100xx-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf

Strange, https://www.st.com/resource/en/datasheet/stm32f100rc.pdf
describes Timer 5 and page 282 of the document you linked talks about
timer 5 as well.

Alistair

> - page 30 of https://www.st.com/resource/en/datasheet/stm32f100cb.pdf
>
> I believe ST is skipping numbers to guarantee that timer[n] will have a
> consistent address on different STM32 SoC.
>
> Thanks,
> -- Alexandre
>
