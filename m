Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3419D2F000
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 11:36:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkhMK-00057n-5K; Tue, 27 Jan 2026 06:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkhMH-00057K-SU
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 06:35:46 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkhMG-00034J-Fj
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 06:35:45 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-7944693b824so32855587b3.3
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 03:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769513742; cv=none;
 d=google.com; s=arc-20240605;
 b=gBSXYm/7ovSq+en2ivXkibcMAuvcUNamPZUbDqefdMGWqWN/EenEs1SWJda8l9QXzj
 8RPngAwlF1B2rQH327N73wqbo2uSZlAz8TW2pDjHBN0VD7K1E0JFobc+X0wyWgroLlQ8
 06ph6/r/YIYQ+BcSfOTJgBSieT5j7KKT5U4LFT/PN+drshLAgNdBUahK2i2NmFVv2qYk
 ziwf1h0EtQE2o1JLhpEsf4xtMwDKFzIVySjEPqUx2vEo3lpgOpNIPERK7MGnsmAiDNAK
 lnYk3ZKW5vSaiLJM+hKM3TrubOAbq2Xi6SerxxliOka/QtQxW/liFlS6udXNSgSEcDUH
 ASVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cUweJ8DT60Gl9GcK3qFepAGSikpTeRUJX/nB/Re9BS4=;
 fh=u2o+ZcYDq02aMXVK+PeWWbjn9R7jZ8j/XmI81SI9TT0=;
 b=icHqxyQEtfZrYwQ8RgiWKBNt1BUQny5h3jaB2sckVkMiwkviygT3n+nJZ15yd53jvE
 cikw+bEaY0E6w1syHFQWwZbdBEYKvnQQqUtqJoxk+vE43A0daJfixuLHCrFI3UJyk982
 RvUduXCZyM9ZMmGBvxuxUSa23X93wrCuDF9gs9pTWPVw0puLiXVMo9P4/CIOIxYZvVY/
 cVaQWpl/BqFnoTG4wLRVeb7qBVdfVP4dt4N5U8KMAPXT2CcMMtfRT+hT1ykB3NFOH4Cu
 wq86Eu6WbY78hE//qzfv2bEb18qgR8t8YHNmVSJ7nCDjYIR9/iLOahkQfGyHwKZWw8tm
 +8ow==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769513742; x=1770118542; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cUweJ8DT60Gl9GcK3qFepAGSikpTeRUJX/nB/Re9BS4=;
 b=NkP1TdEk3M5WL+L1016GP/3CTo/D/TgfTs3XNOs6FGVr8Xfddx+t9eAxPWxeIypcH5
 K6o826nGE7xTjHBEnKbZVzdVAIxB1YMHDLts2ZyY+xzsGCwwLkh54Y9f3m1U1erl+UpB
 uT5oINNYX+mBoFQmT1cKgH7odnrNZQm2A8UAF6qIlkYTAaM9mTKVGyXiQAmHTrv3GwlL
 Kkr/10HNda9t0FPjDW9AYeXE9cdsC6PA6c4EPYSooccx/qOFSWYEJIjmia41/wMeZW/L
 bTJmUFKY+unsx95wEzUfD7skm5h3z/fchr2fOQ+CEwgEuQ5h0peYzWKImwLb/C/7oU35
 haXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769513742; x=1770118542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cUweJ8DT60Gl9GcK3qFepAGSikpTeRUJX/nB/Re9BS4=;
 b=WBZD18OR89xoKyMeSbFCgeUwU1F77esC9u+EKlliGn0xik/blklTH5PTJ3lkjKtTMe
 gv3eb5Dxupssgu9hOOZYHYfzJW/kVqpDwNEJLLUKrS4lSk62IGrEZhiucYoO8l1LUq7P
 U96yNnuS2S+jFCuab9F8auEU+pPxzjA0yKNh+KVvRcOLgd/pxZYL58DghcfVG/Kfh7wh
 QtVkQfnqZJvoC5NXdfkhkTfOTd7Z9oJtRg6asjLTiyrGNaU2fuZCHRUJIKiyTH0KLnA1
 rbs76Qr0Hd3o3+N6AH9sYWQlFM7ejRj7oA34egr3MUJmBOVTyOvABeNbz/Qu0xeClYUn
 ODYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXihU/s3+aCLg6GL/6plSnFTeiUOMlWlwGK2aWvr7W6CSzS84Lpy6v5rwOTBBSY+x++lf0po+GSqw==@nongnu.org
X-Gm-Message-State: AOJu0Yx8If9FfGlTSWV1kII5k8qO23LluBtqCrOeurupCBrgHgTJGtlq
 8xgZmZPLVhKOM53lb4RX1icIRsmnah0KKWwQzl0il3zAgef1YjLahFPGZ2r0LPERZli4LW4BfQC
 YqMvGYLpo2OtHovDUcdrogD7d5WSiMXj7matb0TtFrA==
X-Gm-Gg: AZuq6aKqo12/6CwFjIC0d9gsiLH4yOR8Q1k771tLmqg+8ZewoPyQiCVDhqj6GD2YEO3
 sCLuCB6WievvhhJj4Fz8s2uUeJLU9SUjl3XsoNZwmv5/3QINxv1C8l9Y9MDQ532LDBnVOYq0m8j
 xaE7BLC+jsxPRtMc5/Sg7I4KU+vEZszmLIp0T29xmUv+9XHixjtJf87N/uqS12u+l51Vdu0keon
 n6R/jeU0yn/yxW5At6aLHJQIUehTiSF2bbza7C1M0KX+R7rKcpek4s4vuDsdIwJF2Inew==
X-Received: by 2002:a05:690c:498f:b0:78f:cb46:4fab with SMTP id
 00721157ae682-7947ab47071mr7993887b3.27.1769513742113; Tue, 27 Jan 2026
 03:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20260125-virt-v4-0-00d726b27224@rsg.ci.i.u-tokyo.ac.jp>
 <11A957F3-794E-40DD-8E39-4DB8589B1657@unpredictable.fr>
 <52384324-11dc-4ee6-a059-c1dd245753d0@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <52384324-11dc-4ee6-a059-c1dd245753d0@rsg.ci.i.u-tokyo.ac.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 11:35:30 +0000
X-Gm-Features: AZwV_QguC7yjMwxQtlH6RD6sHtTVvanvzmRQ7dG-EUzAiHl2OODAqxC9FggD2NE
Message-ID: <CAFEAcA9UgwksjgW=BYWUSA7=pTK39fx51ox=tz2YrmKsfnRfzQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hw/arm/virt: Remove the lower bound of HighMem IO
 Regions
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>, Andrew Jones <ajones@ventanamicro.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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

On Sun, 25 Jan 2026 at 07:31, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> On 2026/01/25 16:23, Mohamed Mediouni wrote:
> >
> >
> >> On 25. Jan 2026, at 06:46, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp=
> wrote:
> >>
> >> Remove the lower bound of the Highmem IO Regions' addresses for the
> >> latest machine version to increase the chance to fit the regions in th=
e
> >> PA space.

> > Would it be a good idea to have a new test configuration that keeps the=
 old memory map? To make sure that older machine versions don=E2=80=99t reg=
ress
>
> It is a nice suggestion. I will add one with the next version.

Just a note to say that I have no objections to this patch and Eric
has reviewed it, so I expect to apply your next revision when you
send it out.

thanks
-- PMM

