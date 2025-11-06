Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE52CCFA13
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Nov 2025 21:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vH76q-0006n7-O8; Thu, 06 Nov 2025 16:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vH76p-0006mo-P8
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 16:01:31 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vH76o-0006zI-5g
 for qemu-arm@nongnu.org; Thu, 06 Nov 2025 16:01:31 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-33067909400so63901a91.2
 for <qemu-arm@nongnu.org>; Thu, 06 Nov 2025 13:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762462888; x=1763067688; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJurBtOHMpRkyyKRKaw+0zxl4ugatfn4lzr1n7ZQhNg=;
 b=Sfmr3AYrxGi8duOYb/PA7GPkuaSUiZ7ddGVfOSYA0dVjAlIiexuJXzU0/W66aHeWjo
 cvL2qIax3yKNjEmJXIQ7G99JxdWpGHjsejc3IYrBHDediOamPDnZzl8MrCBkklHN0YWu
 GtylqIYfW4lwyn310Pmdbpi+szkzOv4iIPOFCsU66s7KX92DlFfSFb5W0xu7FjBYD5Xs
 mZIig1TogVSHGAVC9gm4kxYxBt7X7X7CRuS9P2EcLUZFA3A/gWlzWI9QestHOs53VXJZ
 BDNzY6sf1i1/IXz+OsyD340rxrQo7bs9eep4wZWD9NxLwCin8GWPMcseaFKMHseNd+kp
 /myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762462888; x=1763067688;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UJurBtOHMpRkyyKRKaw+0zxl4ugatfn4lzr1n7ZQhNg=;
 b=AKC/3lpeahY6vkQ+9V4N3RVzOEA0PSakPdVQP7USGaTx1lz2BPmz/noJW31/kkvjSk
 2/2ZXi938cX/esNHqcCnEPQnvrzICR0SJw8ecEqqOdiwuA5YeAP3f7u6vL+j3pmnEuK2
 BVtwL4m3n94FGwi57fNTZhixlexk6d3S133QrpSDgobYveW02KfIQGPylFqGHamwka4e
 j8tRDTdakxZZtD5TzL6qURxy97SZ61z1kdOV5IDvIkoSbxsILBSWt24hNQXKUEJepr0l
 c86qc6xgNwi3t8wLLShY1w3H85RUdcpy5kVK3HyAxOOTZSrt/Vrx1aRm/q+uTqddtNcr
 eAKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0tn2qpNlnskBFeWwA7FnSO2ux12i/BpSyOhCXP3ADiOffBQsdkk+V0mi8taIR5l7RJEQ+OiSqiw==@nongnu.org
X-Gm-Message-State: AOJu0Yx6JFzaCw8QwFAjiR2sSgH4P+218Vg24QB4tTX6tVaKJoBOgUa6
 6z3cml6DtQEnAWaEGePYxglW2JB6MV3g1DKE3yos7wX1SyCi11GYP3w5yknPBnPv4y11CNBGusY
 xf46QWFrjhtjuig+PwuXF+2jjYqBz4rE=
X-Gm-Gg: ASbGncszpMg4YIvXRpHRm+KLXwJIDXzx5yHyEpQY/x0pndH4n2sTjCD6qJWXc/MUOkW
 9ExFTYGYyrYh7xe2L74N48/7QDt6x0a9PrHhrzMhlZ2x9CXcvE0cwFWYgTCpCwyul7lWT8LNriu
 hpqdy3WvLuKn71TdhuTJoE/00KQ6KpmLbOI9chL3Zw1swuu7Qxv0ZE+FFfpuURR4+krG2V1HMS1
 N3Bx3+b/Mqwx4Tbz1y1QNeep/7+OGaOdNghAaozU60BPxUj4ITAf9Z09N3A/Y0=
X-Google-Smtp-Source: AGHT+IEd68uD1kODaH+y82zJ5ELtmXy3wemopKID3Fa5npTuk7IetyFyUGqzzIHGy0o+TdgnfDqkd0LiC0p9l8AGZ3A=
X-Received: by 2002:a17:90b:2785:b0:33b:ba50:fccc with SMTP id
 98e67ed59e1d1-3434c54da81mr585626a91.18.1762462888009; Thu, 06 Nov 2025
 13:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20251104-feat-mte-tagged-far-v1-1-cdfd7db40397@gmail.com>
 <9b196058-a0e3-422e-86a6-7c405681bf42@linaro.org>
 <CAFEAcA_wOPO-BsMUB7_CtLKgb2HQEx4K62WJxoekabQ5Mo=Cpw@mail.gmail.com>
 <a5fe4478-2a86-495a-8bea-9b524aab3dbe@linaro.org>
In-Reply-To: <a5fe4478-2a86-495a-8bea-9b524aab3dbe@linaro.org>
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Thu, 6 Nov 2025 16:01:16 -0500
X-Gm-Features: AWmQ_bnBKgDR08lnYgO-E0rnmJcmdP_GuG7kdxOmtQeCLF-cMwR6oPFmbpZCOTI
Message-ID: <CA+1f7BCx6OTir00u3mBKiJHooBMBmu-tbSFera7x4qa796uPHQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: add support for FEAT_MTE_TAGGED_FAR
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=brookmangabriel@gmail.com; helo=mail-pj1-x102e.google.com
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

Gustavo,

Thanks for the review! It makes sense.

On Thu, Nov 06, 2025 at 12:44:23PM +0100, Gustavo Romero wrote:
> Gabriel, given what Peter explained above, although the patch
> is correct, the best to move forward here is to embedded this
> patch into the additional series that implements the others
> "subfeatures" and, as a last step, after the patches that
> implement the features, you enable all the features in 'max'.

Once I finish FEAT_MTE_STORE_ONLY I'll send a new series, which will
include the changes from this series, the STORE_ONLY implementation,
and also include patches for the updated documentation and tests for
FEAT_MTE_TAGGED_FAR as you requested. As I continue to write patches
for MTE4 features, I'll add them to that patchset and we can merge it
all at once.

Thanks,
Gabriel

On Thu, Nov 6, 2025 at 6:44=E2=80=AFAM Gustavo Romero <gustavo.romero@linar=
o.org> wrote:
>
> Hi Peter,
>
> On 11/6/25 11:31, Peter Maydell wrote:
> > On Wed, 5 Nov 2025 at 17:49, Gustavo Romero <gustavo.romero@linaro.org>=
 wrote:
> >>
> >> Hi Gabriel,
> >>
> >> Thanks for your contribution.
> >>
> >> On 11/4/25 21:50, Gabriel Brookman wrote:
> >>> FEAT_MTE_TAGGED_FAR is a feature required for MTE4. The feature
> >>> guarantees that the full address (including tag bits) is reported aft=
er
> >>> a SEGV_MTESERR, and advertises itself in the ID_AA64PFR2_EL1 system
> >>> register. QEMU was already reporting the full address, so this commit
> >>> simply advertises the feature by setting that register, and unsets th=
e
> >>> register if MTE is disabled.
> >>>
> >>> Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
> >>> ---
> >>> This patch is the first step toward implementing ARM's Enhanced Memor=
y
> >>> Tagging Extension (MTE4). MTE4 guarantees the presence of several
> >>> subfeatures: FEAT_MTE_CANONICAL_TAGS, FEAT_MTE_TAGGED_FAR,
> >>> FEAT_MTE_STORE_ONLY, FEAT_MTE_NO_ADDRESS_TAGS, and FEAT_MTE_PERM,
> >>> none of which are currently implemented in QEMU.
> >>>
> >>> According to the ARM ARM, the presence of any of these features (exce=
pt
> >>> FEAT_MTE_PERM) implies the presence of all the others. For simplicity
> >>> and ease of review, I plan to introduce them one at a time. This firs=
t
> >>> patch focuses on FEAT_MTE_TAGGED_FAR.
> >>
> >> I think it's ok to add these "subfeatures" separately.
> >
> > We can add the implementation of the subfeatures separately,
> > but we should not enable them in 'max' until they're all
> > present.
>
> ah, true. I forget that when we do that we enable them in 'max'
> as a last step.
>
>
> > (We don't always adhere strictly to the architecture's
> > "feature X implies Y exists" rules,
>
> Thanks for confirming it ;)
>
>
> > but in this case
> > because they're really a tightly linked bundle that add
> > up to "MTE4" I think that presnting only a subset to guests
> > is likely to result in them not behaving correctly.)
>
> Gabriel, given what Peter explained above, although the patch
> is correct, the best to move forward here is to embedded this
> patch into the additional series that implements the others
> "subfeatures" and, as a last step, after the patches that
> implement the features, you enable all the features in 'max'.
>
>
> Cheers,
> Gustavo

