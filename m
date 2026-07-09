Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20734C44503
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 02:10:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wheC5-00085L-6y; Wed, 08 Jul 2026 22:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wheBf-0007Vq-EL
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 22:08:27 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wheBc-0007z1-Q5
 for qemu-arm@nongnu.org; Wed, 08 Jul 2026 22:08:26 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6675db463b9so1150876d50.3
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2026 19:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783562903; cv=none;
 d=google.com; s=arc-20260327;
 b=gHk/yI5UWcGTbaDiugdupUYrF+0faFGKuXUDD/XQYbYa4D6m8OUdscOGV2ROA4EsOT
 26fvPvsw054c6adRetpd0J3woRflt3MQoCO52asdZ/D6JlXVLaBKnK3fFw1uCtASgRw1
 MLkJ1LdrI51WLa8a+DytD+TF5DNFnox1/dbwLJDFi5H/tIPAnIq9fmSdjSSjZ7rC2PfV
 5bRinOEo3o6CHLmPP8aNJVVEFH2oAtYesVUwSpGyYhdbBH27UeVnMNCNo6pYp58mXYLd
 /lyNSw+LTHxJoXh+Ulip1xw2EyvtM0dFsAFo/ahY0YjqBZrztCoXIuHot6Q67ogRNKkj
 kufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=snbydXFuW40Gh4poEDUHI1UONkA95bN3Yg9hISD38XM=;
 fh=phxG1yyi+V6Fa3aA6OkiLCrFsSBuGhodtCMr0KyD+UI=;
 b=UEl/K9mqf/wnhYWxz7ifNTDvrhe1r82ljLh7t2ljfb2tn14Km8XAJJdFXo0GA01FBe
 LgrgYgFWwYT+QZnYt6jdk1k7Bz+q5GKCjr4Oy56lm6ojUdriezEybHsuDolU8f+CxGW3
 DF/jfX/u3kSLYxDXpXbokuKNesVSwm1y342tEclxjJwQ1FuMNd7tEh6paeOR0SFNYjB3
 4qbeg65pRldYOxQSVI4jhAtPEr6Na4oZxjZF4g010rsJhTrw+IEQorB5YXxqUHhYomOu
 Kgg4RC9PSedwWBRlF7YXjklqSB39PRpItaWrRgzwh8Ei/FME8yxhnW+ZCwFvVtIPvjhS
 GijA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783562903; x=1784167703; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=snbydXFuW40Gh4poEDUHI1UONkA95bN3Yg9hISD38XM=;
 b=SM2+7yqd+G9My7ytUhCxFINMPoZIGQRmRLc5/SWD6gQ39hIWmkzVPzg/XrVKSIDNDx
 nfNvZA2kl8QMt+BLzH4av+P6J8lYkvckwTdlkHg0+aRlrdE42WNT9NmGOQ5nFwd54bYK
 UNo0fZp8mFTCkuqHC7brSnAvWkc9HK8VL83K+Uilu1oCJVPJhsGTME90anTFQlcNaRYr
 ZnrdC4HTrdoJJrFHnQT1ZBTDWNdjZRsxhPEPnmCaJYEy+R8mClCLnxRq75BW/uCOqGvP
 /eSyodkya6X/q2eSqBxfcVUdGG0oL3ehR9qjEwdKNj+vbBB9H7vzLYtM9xRqb2ieKs12
 6r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783562903; x=1784167703;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=snbydXFuW40Gh4poEDUHI1UONkA95bN3Yg9hISD38XM=;
 b=p+DpuhCdDryrhnjVVipoGOLE9K034lGNWL5L2uaMbKIoZQuD6XyyhPGg5+C7q/B4QQ
 tJWjHanv1SVSi9MeB6wcTLCMO3CZwSNjH4DKpE/gM04dNYratXYvcCCkDgLHNGuLCzvA
 j8TGeDhnaJEwPUv3QHeb+jpPRtgTXfrdZ6hRjx4WZQ1QT9PRoVU2WDWDh9gV6LoIHzoL
 jQvUrtVtbt/06dOk8XGVE9BdsRSh3/DzlzJyCykFgVn1wRZ7MI/LbjN+fQFuKtrYL1is
 1pQtVc1rXrpwbnOqyAvSWRQ4zDvfEV1SwtWkYneYG/FYPScnjonBnBwEDdWNtfwqRS/G
 vOJQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rosa5EIBLZYH/G99a/q6UeTU+IeTlH54TTLyGNtumSWot24GjDpEMzI/k+8TEvsPB1Cckgizyqdow==@nongnu.org
X-Gm-Message-State: AOJu0YxV0tUCdivZIU+O4sdKL9x2IdWXdUVQ2jWWQX90z+AQt++auBF7
 0N20b0jCtxHcBHInmYy2h/uLLU74T3fBmGoqpd3D+7etoHXrAmynlsVjfgVaSwI6ZiLKEaEDyha
 A4zyovxGBwEkj3/T1D0lwqSgYlBWbgfQ=
X-Gm-Gg: AfdE7cleYKRqUFkiN2Fh6iyOYS5L3Gh1IziHF6k7s3Rk3alGiiTUOgsUcTfzHHEhgkg
 KmznaMCQAnlXqWQeeDqNuBy8XPtLPYh1ZVnGkJ9cqTB/Io5VTRg8J+awSqghuwxytEi9cGRuyyW
 3P4geM0mpQysVgN6nEC/qFhx6Zc7HzmOmZNSWXwIKLj35y5OwSPtKqGBXLWsnXviQ1eaVNOR1k1
 JTFOXL+qe/UYsTggS7PSXeFtiqFBfE7UXqXdxr8INbo3t4yCYXCCJc2cj9YwHDVTOxbyEVnXnTy
 I2rAzA==
X-Received: by 2002:a05:690e:1917:b0:664:da95:cf4d with SMTP id
 956f58d0204a3-6679f2cda01mr3740889d50.18.1783562903179; Wed, 08 Jul 2026
 19:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260708111544.1440761-1-clg@redhat.com>
 <20260708111544.1440761-4-clg@redhat.com>
 <CAEUhbmV0Q2xpwVLUxv9NEDbb8pMgnjdChupPngtPvCuFFedv7A@mail.gmail.com>
 <6e33a168-4311-47e8-a153-f364a2c43bf1@kaod.org>
In-Reply-To: <6e33a168-4311-47e8-a153-f364a2c43bf1@kaod.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 9 Jul 2026 10:08:11 +0800
X-Gm-Features: AVVi8CeKBU8zsEgdrd9CL9auslSqxZEHLygkFE3hKG4nlkhLM8jtr3S_ArQNPjY
Message-ID: <CAEUhbmUNmo72DUbx+Kyu0UPxo1-iMFgz2oJw9Vz=zC4U8XFxAA@mail.gmail.com>
Subject: Re: [PATCH 3/4] tests/qtest: aspeed_smc: Add Dual Output Read (DOR)
 test coverage
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bin Meng <bin.meng@processmission.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Jul 9, 2026 at 12:43=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 7/8/26 17:32, Bin Meng wrote:
> > On Wed, Jul 8, 2026 at 7:17=E2=80=AFPM C=C3=A9dric Le Goater <clg@redha=
t.com> wrote:
> >>
> >> Add read_page_mem_dor (CTRL_FREADMODE with DOR command and dual data
> >> IO mode) and write_page_dor (user-mode DOR) tests.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> >> ---
> >>   tests/qtest/aspeed-smc-utils.h |  4 +++
> >>   tests/qtest/aspeed-smc-utils.c | 50 ++++++++++++++++++++++++++++++++=
++
> >>   tests/qtest/aspeed_smc-test.c  | 16 +++++++++++
> >>   tests/qtest/ast2700-smc-test.c |  4 +++
> >>   4 files changed, 74 insertions(+)
> >>
> >> diff --git a/tests/qtest/aspeed-smc-utils.h b/tests/qtest/aspeed-smc-u=
tils.h
> >> index 5a86514caf35..fbfb94e831d8 100644
> >> --- a/tests/qtest/aspeed-smc-utils.h
> >> +++ b/tests/qtest/aspeed-smc-utils.h
> >> @@ -44,6 +44,7 @@
> >>   #define   CTRL_FREADMODE       0x1
> >>   #define   CTRL_WRITEMODE       0x2
> >>   #define   CTRL_USERMODE        0x3
> >> +#define   CTRL_IO_DUAL_DATA     BIT(29)
> >
> > This macro is already defined in aspeed-smc-utils.h:43
>
> I am confused. I only see this CTRL_IO_DUAL_DATA define in
> hw/ssi/aspeed_smc.c.
>

Sorry, my fault. I had a local tree that modified some of these qtests befo=
re.

Regards,
Bin

