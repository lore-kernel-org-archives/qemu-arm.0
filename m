Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57915C43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 09:21:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjCqO-0004y4-RM; Mon, 13 Jul 2026 05:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCqN-0004xk-B7
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 05:20:55 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjCqL-0000Kz-SY
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 05:20:55 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-667f1390f58so633630d50.1
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 02:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783934452; cv=none;
 d=google.com; s=arc-20260327;
 b=M/FOVzYTuAIiT+TG753jWhXp+yZOabqg2id+rMoAAz6b8ExWT9FUXkRN2r2VPMpM5e
 nf9Dww3P+nDoZYb2dbBaSE61AxPw/lUc2H6SfrSqYE2v1f3O3VcoSn3E4oInmz0V1EV5
 NgwSQQqx3bWDsqAQzhHp8sL5w0UFXyW8hmAz4E+c5wQ+775TBSPm0sTFUP4ss8BpRYEB
 PkppmtboL4M+s9w5fG6ppPXhSYckp3kJhHTs6SqFuHjOytNkWP3FZJevgUS/Uvb2gCp3
 NDD4FpWVP+x197rlZbDdMb83rqI7AoRGp5dxTqRuQ5lJ8/JRsa2azYR46HY/E2ONCm1A
 VvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MrpU22+X0ZaKyu9LA7o6w1HLaM63b0FI1gvr9ub0fTQ=;
 fh=6Ahql51eQZqo1iKuQGWAhiskj3HWBI4ruVCK9FH0yeo=;
 b=UAVtHJpX6Y6mHwC7qGdg1Av6i4Dvj0gfNHAEm/Yk0oWz46/VJaTl1/5VGhILxUI9lT
 35yuNyinW9HYwQFOwEEqOCWQPZUYjyFta+Cboe/1Wy/QYlDc+hSPQ7I3HQBG460D1cNg
 +Id/qWuUN4uMJmoTQgefG9dyRzH15f4vZ5x6qY0xEiBJoNRhdLsEgEwAiO3tGyeLBwO6
 UVNMMsyP4QxwA6WNpLbO0deKXI41LHEh1mn5nRT6dz6WS8CcGok3bWujWyWERBCkBEYw
 08wB99owVE6VXpy1HCW1b7bxpd7Zh5TXbX4uL8Jezk3lUhKWvlCckfgIs67nXkl61sN0
 63yQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783934452; x=1784539252; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MrpU22+X0ZaKyu9LA7o6w1HLaM63b0FI1gvr9ub0fTQ=;
 b=bNa88/9mmYaNMoFCCTdWkbm9OQ6RZhqEFtUKw6cxZDeb8YOVUMPLveUgWOI+z+NaU2
 t9tivRvI8J0i/oPjfcDEVA1fMP7Mrkx4+Ag6tTTDrFpAQrsebnhUsHfEZZpUHLlrhI6Q
 dGya4UQQw3tio4+UWSPxRkNAYTsVnlQzp9erSs7Bf1s0oz4HtQOb2oFRNxuJKgjURTNJ
 RI2f7yu19r6W5jpeqpV1L0VXSNb97k3807NtnV//b1ZBGdLdnBTAMOLpY/XhF5rJXnLT
 V8ETNZS6rywgsx8sOKdF3I++1TRBvFPL4gG3Agf+557uJgiZNwKEtv/Y724Bu2dUUIML
 JrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783934452; x=1784539252;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=MrpU22+X0ZaKyu9LA7o6w1HLaM63b0FI1gvr9ub0fTQ=;
 b=GE8qpCrbRPBeUkhqar5IZmmcU7hjgd04SSzZDEPYexevFyFxt4rdrsTji01Qjw9I7l
 ilfILepiaF8SwJpS34dZlZo602YHsGA1WegnqYw96QBXqWSg6iMj8HCxSGxmcwj5U8fV
 HE9d6WvnGoRUuY8HrYkIBgoJ+aVbKUt6f/ERx7UBHMJQpErtpo5gX29sRGwNm6zefodO
 hvudabqD8XnnFHi0FYxYrdL/cFIiHpbkcz1HxQFh+JRzs2KWR24CHXrahOUZZQ7XZT1o
 WNHx4lsGJa1do4N261WE80lXBU0O6QUA0AvfpXCjuf+u00BO6o8DlWy+FLrZLWJ3SPzp
 3nlA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrTpdZpUiSwIE34mPjOw1i2ihFnpozGd16dA+Z8WAfZhRGEyFv4VYpQKHkvWWeRULsfR2H7jI1vdg==@nongnu.org
X-Gm-Message-State: AOJu0Yzfkeu1xoHPiBVHidLUEzfarlRVNbRI89d8uQMxOQ0rww++jNDH
 bd8XtdDboE0nepQrChAimVrXpHsT9doRcq6vLVKYuqvmIgO+sGWzuqQjqfY2Y0cnAh+HbJhIyKw
 quGuAYdTdgjGaJdTAdyXP64AkWNhupNmNWTh2H/y6tw==
X-Gm-Gg: AfdE7cn+NWU7SArpGArnnjJKUIlDD0u5XupHrDMt7AnH92eldD0lEeWGwVjVkWZ48qx
 BlB42M38u9OS6N3Zlcaq0H7bEA7f2O0X6iuybIeHh3TYLQbmrJhgKcmcdu44ARN/sPRK94jiAvO
 EZgJ6TGn5HZ7R7MGn4vwm2KY98du+C/a7HZVFgxKYWXbYfZHxCEtzi8skxw1SvMAVUfOOkHKD5y
 qsIYi477zG3IA6jXyZgXtymsQENtnw6Ff+k8julZC2V0V3ZRwG04jALXR3+ZMkHRhnogru+XeoA
 8y5lnY/McO+hXGSfnmO43gghWqlRl4hKh7nbF6jUfMfuudrqh90Drr8c
X-Received: by 2002:a53:acc1:0:10b0:667:8b90:2e5a with SMTP id
 956f58d0204a3-667d7f073bfmr4784101d50.102.1783934451570; Mon, 13 Jul 2026
 02:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260627063208.33642-1-bin.meng@processmission.com>
 <CAEUhbmV_BfLT9_F9OPH8VvwCZ_8Th+swHu833E0sjYCkj-k_=w@mail.gmail.com>
In-Reply-To: <CAEUhbmV_BfLT9_F9OPH8VvwCZ_8Th+swHu833E0sjYCkj-k_=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jul 2026 10:20:40 +0100
X-Gm-Features: AVVi8CcJd17Hnsj7pHZCeFcZ9uEzSvrA86fZ62vPIR6lfjWCt7z2ZfzRyt9bUr4
Message-ID: <CAFEAcA_or9830t85sHAq-PJegJ4OQ1ef=1wGpfcmiHFmVO0Jkw@mail.gmail.com>
Subject: Re: [PATCH] docs/system/arm: Update Nuvoton OpenBMC image guidance
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Bin Meng <bin.meng@processmission.com>, qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 8 Jul 2026 at 16:50, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sat, Jun 27, 2026 at 8:12=E2=80=AFPM Bin Meng <bin.meng@processmission=
.com> wrote:
> >
> > Describe the current OpenBMC target naming and release status for
> > Nuvoton machines. The latest 2.18.0 release no longer includes GSJ,
> > so point users at older 2.14.0 sources and explain how to find
> > Jenkins MTD artifacts.
> >
> > Signed-off-by: Bin Meng <bin.meng@processmission.com>
> >
> > ---
> >
> >  docs/system/arm/nuvoton.rst | 54 +++++++++++++++++++++++++++++++++----
> >  1 file changed, 49 insertions(+), 5 deletions(-)
> >
>
> Ping?

The docs change looks OK to me as far as formatting goes, but
could a Nuvoton maintainer review it, please?

PS: if quanta-gsj is no longer supported by OpenBMC should we
consider deprecating (and eventually dropping) it in QEMU ?

thanks
-- PMM

