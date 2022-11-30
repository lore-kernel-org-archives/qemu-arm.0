Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1175142ejx;
        Wed, 30 Nov 2022 04:39:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7obldX/Cdd6l599iFfD20q4smFUSMfQ2AIf2vL0HRnMplxgzTZ1BYK8CrAElF8wxexaLq8
X-Received: by 2002:a05:620a:989:b0:6fa:fc90:b4f5 with SMTP id x9-20020a05620a098900b006fafc90b4f5mr41583531qkx.485.1669811962372;
        Wed, 30 Nov 2022 04:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669811962; cv=none;
        d=google.com; s=arc-20160816;
        b=tGuDg/qWeNH5UNHFgnj4+BF+70B4P/zTTFyfj93ebzOoz3Ew2f3lkF0c4tJgOgOBSo
         2mkheckh7hm/nvh4UYrj7sEXbaC9BHwMTiwgPaPvIRsKQw58tMzhZd5Lom0Gq/5/pCQE
         XGvF5EKqvZLj14fdfspcIu+nn0h/9Fkqira0rgIc5k8k2ys2ivmdUNpicjrGbAIlT3ZA
         Xz/xuUaq8ZFsVegQo0H4lPv3VBvKvi0ZuuH7A/4E+w0kgIFZGrlmi+F2n4rDoG3u2Tbu
         haGQYACAcI1KyAjh41GUgYynXo4RBtXlZxm0O6QnRkxJUk6WiJV/LPKB7ZjAYx/cb8hI
         nfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+op9WxRRkXJ+LjPnK84cqiJ0WQi5cT6x57OVRmVw6hc=;
        b=GogzPwCxWPZ7wPvQuKCysH/nTq24Bn36a0mlq7VxQDel7TyfbZTfHb6wMLF37Fnlb9
         WpS/yHsxGwQpLFBk9wKNcgV/hNrEy2IXgfD8pvdZ2NVNW79cr7Fjws3VWREUR+Jlkjt8
         DuS6SjA+GrLmQg/5HTz04X3bXQaC8es8EV3rV1wN7BmEsiGIh07AgYoqo62pz3WFbyx8
         l1AkRcZx0WSl1MUhX/HzyVcP5V8ZOF3UGHkaMGmD1JbOymvxtkqBWsDwG8M6mdQjw5bb
         kFrJdAdI7QlZOFW7i5Gc/XlpzSjYcBCY99Un5a3pLvs7+Ek2awZI9D2MzKC18Grh3DCo
         foUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRZzCYR5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fx5-20020a05622a4ac500b00398480c1ab2si735249qtb.675.2022.11.30.04.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 04:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRZzCYR5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0MMB-0006M9-CO; Wed, 30 Nov 2022 07:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0MM9-0006L8-CO
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 07:38:29 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0MM7-0004tS-PG
 for qemu-arm@nongnu.org; Wed, 30 Nov 2022 07:38:29 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 140so16704397pfz.6
 for <qemu-arm@nongnu.org>; Wed, 30 Nov 2022 04:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+op9WxRRkXJ+LjPnK84cqiJ0WQi5cT6x57OVRmVw6hc=;
 b=SRZzCYR5PSEF59q2de27fktl/1KRCJdZKg4YCdK1uioTHMAEMhg4/KWHOwOMzh3P21
 NgZXhynwjWYQpBl//Nbe0M1E/H/uGgEZSgQll/EHE9ECLLZag1YC5Tv3QXDod4yBh6Qf
 pYQPjR+In1GFp9pU8BQJiSTZTGgP6T4mU7mLP/RmIyFGsf0jh4lI67GoZb6pJOkS/lPc
 DTB7RrvB6eyj4cv5gvTA8RyL2Vub+5F6GXL7GOvOnfbvcODrquBz3JIHenVNqLsZP4mn
 rKKxvG1PcKTmedJNojnPqJvFaBZbsHwDavHeSywf7pXEkZ8cSVcL1jKt1NUmLk+T75vC
 GZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+op9WxRRkXJ+LjPnK84cqiJ0WQi5cT6x57OVRmVw6hc=;
 b=SB3MiVMXXB1VMCa9WZOsHcIIuGGLJkLM1mHPTm4aPwdPOEUNTGKadxIReGI5tm3acN
 r9sVKM/nT90qvvjrn187cSRHMJS2kW/7fuGmSmIH+w1Ie7DsAi1fgzfBm/2lPLtaxi43
 qCfLB1Aczb2YXXp5WaYUZNUOSaYg1v1QRAnUu+muXC7OtUEURtYjYPrzbzCcHaY10mZ6
 sirnEg1pKUzaIZj7Yf5w+HX02CKgORm0wC357CYs1/XkWwGuXw+mgPYLHC8751m3bf+G
 8sCuFt0ptdRqvmESRbOWGkvzUigB57wQCdXdbgytVY0qljMHvBBve4KaJ+86lqv97NmR
 ZjJw==
X-Gm-Message-State: ANoB5plesUgZzQRnGTgW8gq06Af/mrgNcFY8Kf+rKeoH4GsN0KdD27Gp
 Mlyo5ATgdSyuPHbBDYGFGEqS2tv6o0lKQcg5tlPgUg==
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr38521448pgr.192.1669811906124; Wed, 30
 Nov 2022 04:38:26 -0800 (PST)
MIME-Version: 1.0
References: <20221124115023.2437291-1-peter.maydell@linaro.org>
 <51024464-6fd6-4181-633d-1e261c19917a@linaro.org>
 <0f9b0728-d6b5-a37b-2dcb-7b7fbee876a3@linaro.org>
In-Reply-To: <0f9b0728-d6b5-a37b-2dcb-7b7fbee876a3@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Nov 2022 12:38:14 +0000
Message-ID: <CAFEAcA98mDNWMhT+-2rsevpXAaAUzF-PF74LJ4871yxJcAKFNA@mail.gmail.com>
Subject: Re: [PATCH for-8.0 00/19] Convert most CPU classes to 3-phase reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, 
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: mjWVG8pE6x4y

On Wed, 30 Nov 2022 at 10:51, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 24/11/22 14:46, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 24/11/22 12:50, Peter Maydell wrote:
> >> This patchset converts the TYPE_CPU base class and most subclasses
> >> to use 3-phase reset. (The exception is s390, which is doing
> >> something a bit odd with its reset, so the conversion there isn't
> >> going to be simple like these others. So I'll do that one
> >> separately.)
> Note, we can then remove scripts/coccinelle/cpu-reset.cocci.

What's our usual practice for out-of-date conversion coccinelle
scripts? That particular script was "we'll never need this again"
pretty much from the moment it was checked in, because we did
the conversion of all the targets in one go. But it's still
useful in some sense as a "this is an example of how to do
this kind of change with a coccinelle script"...

thanks
-- PMM
