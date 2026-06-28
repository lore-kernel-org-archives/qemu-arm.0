Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C12C43458
	for <qemu-arm@archiver.kernel.org>; Sun, 28 Jun 2026 01:53:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wdei3-0001Yq-MA; Sat, 27 Jun 2026 21:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wdei2-0001YI-0j
 for qemu-arm@nongnu.org; Sat, 27 Jun 2026 21:53:22 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1wdei0-00048s-GT
 for qemu-arm@nongnu.org; Sat, 27 Jun 2026 21:53:21 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-664a2c7b579so1750499d50.3
 for <qemu-arm@nongnu.org>; Sat, 27 Jun 2026 18:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782611599; cv=none;
 d=google.com; s=arc-20260327;
 b=OZLhSyIl7EB+Qf8MvMX7aCFY2hIsnWGvTzxXy/qOkDWsaagLcDp97/p0MvpbYWLK2s
 G1N8nI2ub8hssUkQp1K/qd7Nr30unJI+RT03NtP3FIbpfkSZKiLpLFq/w4yJV98a3wsO
 tu5L4qC1G3iuoKp+fhDm6wPOf0P0P1mk5+dvN8sXDmQYGfZkL/jstbyl9hYb3l4N4cYN
 z6fo1ZLwX1oMDYzf4SBUGeRK/3TtVrexsRYzVuhjFZzdH3wvsbm5VNC4TULHrGqds1Qv
 lJw7lXwkoH4TRlidW4ivuOeHorRFXEcI0GJB8bmmLYOfpfjizXzB1F/Y2mvv6AGcb5J9
 8lEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=oa3EY445Xm3vq1WBLUQ1mJJXFbKUlHgKxrRyZUE2BaQ=;
 fh=Evjs5buq6dBDWz1LVk04TEKq7LSymW0u9cdaV6oJyOk=;
 b=LQ0A0CySK7WxtbCqyB/dkBpOV2pAm+Zl1cVuKcqqigiIGgLlcuOUuwgvv9rF1WV9md
 9PHGvBYNmOmfRBEWX/ESuZ0XDoitL/xAD7kAR0AnauXh25L+ouyp1pgk/GElJ5LknNY0
 66IfTVSkZq3Jocp66+pCarScAVWf+jP1nXqjJCr7uoyMqLiE1Rc4jfJYY7NtPyewTPMH
 8CAsHeOuXWf2CnSe+nSd5ysDYT8AEoIOXBjuvwl/jyDgGZEF6nvZ+slTxRYKU0PyG9t/
 OwQjpCDbpB587jXv105k3MMq57WIS5rXDp8THMFTBE9qllxonIHB9kdFIh03/6gxc9/o
 IwlQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782611599; x=1783216399; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oa3EY445Xm3vq1WBLUQ1mJJXFbKUlHgKxrRyZUE2BaQ=;
 b=g9moiV1xIhVNJNF72zY+34kVvKI8i7YmI7lDDEI6X8uo2I17RhhrbBFV7tlyCOzpbK
 4BKT5p2QdEGNCtnDkgDQGrK6dv8XtUKcrjZz+oQLmDF/J4poT72JjyX61bE94h6MnNkJ
 r8YkiNRNJPeo0LlpkE9J11F7g9HrNVCE7gZVYu7t0DmS6xYlYrad0ZlY1pLT5sZR4fqd
 HUViIvc8yGBbPXKpxnzee2W1uSlEr+gtHfhTH18ghzBWrk7uel7LU/1boai4NjMbAMiL
 LcE3Ysvl9N5GbC0LGZpTVqAKjWvVvjRpNZOUehBkTA0onbUq5P0HFLDtvmdtWVGNx/QT
 DCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782611599; x=1783216399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oa3EY445Xm3vq1WBLUQ1mJJXFbKUlHgKxrRyZUE2BaQ=;
 b=ajvEUMDzit1LU/ypOAmA0bODZST76W6p4qOg5ipfYBuUvdnK7p9rb8EMJ2xNbSIiRr
 femMLy8OgG1DdyTxbbdPLpMtbXU+JLpkF/vs+ShFpt+7GrsB6w5hlGrd0SvVd+fg4sjV
 wRPIoQoolyzX73Ga25Q4XRijePcSkiawgEoKTp4k7jLRSkrc2n/owtL++f9hRqnS9aVq
 7M4TY7vnBybQzeC1m1xAdt3a2z8YOgjjuqgbzPLEkYhxfgeYNbLquZybg0L47oltuaAC
 lDQsfvETtoD9UURvsDAkV08KH1Y8sl5TAaboZ1i3QGwJh21N0gBHSa4lLsj9OVjHse8H
 cErg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rou8S099mX4pJAPpfuN+94XkL9FnKQn7Y3HFm3iAqhp58yyqgZm8P1bigjdgUU+Ax4ziwGIsl5wnA==@nongnu.org
X-Gm-Message-State: AOJu0YwuwB1EXtiG3fOq1lFiEK1HF/rzndpeLh3CuNsAX2ZZoizT/En/
 wwxzmI1N9TVVk6YAY1JykKQqAZBtCsuENXHcpHiTNKQ+kK8DCUo0TYDoKNxmkC1kajufGzbQFxy
 SdhiwxOcYlLXk4tffumvT7oK0FmqzLvM=
X-Gm-Gg: AfdE7ckgZqnHUFu23cE2KzOPtHEG1bshkXk+IEPyNkUGYn7uiHbV5OVThAsss4XuWgX
 iRE0VNq2NljkcAWiIJsCfleNTtneADx/FPjKeSqN9RriZuZTceEvgrYCesRHZQrorpffTgImlo1
 5bh8TCXvpL8YgoBZNaiVbg2/aqp8IFowWY1Yfv0nDdaqzvjydcdtvKC2oXFn8wOdpl2rwt1Q6Kn
 xZILTQSHogEPFInLZK+b+iOZdev91ZwTpYTOWlRDeiGxPdAXGc0DHqBPKJ9nhLcaLo3pdtCn+rr
 7o/j95xbZg==
X-Received: by 2002:a05:690e:419b:b0:660:eff5:e8e3 with SMTP id
 956f58d0204a3-66487f419camr10401712d50.2.1782611598076; Sat, 27 Jun 2026
 18:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260627055848.28279-1-bin.meng@processmission.com>
In-Reply-To: <20260627055848.28279-1-bin.meng@processmission.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Jun 2026 09:53:06 +0800
X-Gm-Features: AVVi8Cd6KHeCx2COg5v5AYAlEBqCqyNTdt8HlRudpD7ymvk3KME45mdGtlgxK8g
Message-ID: <CAEUhbmUPpS6VBiCncdKDgr2T+22L2u8Ldz8zVtzDRTBQODeeVw@mail.gmail.com>
Subject: Re: [PATCH] docs(arm): Update Nuvoton OpenBMC image guidance
To: qemu-devel@nongnu.org
Cc: Hao Wu <wuhaotsh@google.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb12b.google.com
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

On Sat, Jun 27, 2026 at 1:58=E2=80=AFPM Bin Meng <bmeng.cn@gmail.com> wrote=
:
>
> Describe the current OpenBMC target naming and release status for
> Nuvoton machines. The latest 2.18.0 release no longer includes GSJ,
> so point users at older 2.14.0 sources and explain how to find
> Jenkins MTD artifacts.
>
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
>
> ---
>
>  docs/system/arm/nuvoton.rst | 54 +++++++++++++++++++++++++++++++++----
>  1 file changed, 49 insertions(+), 5 deletions(-)
>

Superceded by https://lore.kernel.org/qemu-devel/20260627063208.33642-1-bin=
.meng@processmission.com/T/#u

