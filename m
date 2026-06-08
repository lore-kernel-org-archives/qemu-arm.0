Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D8CD8C9D
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 15:54:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWcIK-0006s0-Tp; Mon, 08 Jun 2026 11:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcIJ-0006kq-13
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 11:53:43 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcIF-0002L0-9K
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 11:53:41 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-66049669d78so3834756d50.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 08:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780934018; cv=none;
 d=google.com; s=arc-20240605;
 b=S++yTy0CnE6vSCOKIBaKK9zaFXKjyY3FFvSPp4cDAitSXr8q/38YEi6V3GzQ3Bdy9u
 bnG4CwDuOHvPBMMBxsMk8xyU08aDshIXi1n560dvyvUT4bHBsfXf0Jl125v3GWDVk83D
 zBb/y/AlEtLuw9Vuas/uvwiSbxdJNXFBLGUwG0sjMooi0bZRAPB1fcrZjKKEbdKeM2e3
 iujqW/yW3obJRGzOJHKOPgVOEMIiAwkWHKb+K7SK1daEcca1xUzRpWc1KPu93Nn85M2F
 DnBVozzvu104VcHPo6/L6J/LXXjp3wn2jy+aRppFAByaId/WvntV4WkXsWOJrbGJ4+8m
 +D4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cGL/9b07z0rUpS/xzmbUfcBuKWYi/7ZfhvMUt1pJ48A=;
 fh=0xdH7+FUIdH399DggLVNN9wjOIGRRLyn1gf5e5HMq7w=;
 b=YH9Ap++/MxYjtvkTZe+ct2nxbJV/5BOCswjgmEAJft8ORemLulY2S3Yq0Q7Uasj4m2
 8LiPsrpjIqf7HcxAkpvbN29FE0eXIEdD+4vdBMEvej5MkQVbqXVNelt766RHcFpAns1Y
 4U0BrHbilpyWE0GiueL6mUoxHcQnpB6T5F0TjY7wiIVLfhXJNdpojxQo8cvnSbafzMav
 PtW9WcAONW0hTbQLKRH8Ctmw35IjMcMSdi5Y6shKEdfa/SusLLXMI7VQe04CKotp5Suz
 UekU4IsZKKMa2hV9k8aig1p1+1SCsCw6MpgD2uLcyJA11UuH7XlZ0nn5+ibDG7Td5CeB
 +e9g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780934018; x=1781538818; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGL/9b07z0rUpS/xzmbUfcBuKWYi/7ZfhvMUt1pJ48A=;
 b=GEWgf820YHsVr1wZryeifC1630n6h6ZeNcE2Z+JxYF2imoO4brzhcQ8/0PbrDsbXjc
 0Ogli8m3m0lQZFuS/LTJDABFKRN4NEJJPxCHe8zhmwKr+mKss0KKxI15RM+LYyZQkjvI
 TfUJiJPuK6j1WekJ6EzNE+qOF2tuOxXMCZL5NVwMErtpUlZh1Aiq0T7utuDcRKMO2ud9
 4X5/bcnweL6b380oY+JrA95O7ZCpAfmcA0Qxc9GzHLfhxKBO3A7UX1xlNDHZZfAAiEvP
 ifdQ9q2MaRPXy8Oa4WBIDIvoniQUaj3wDvn1EGl9Cehj3FXKU4neQsNuOAAJ/h02BtnP
 gk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780934018; x=1781538818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cGL/9b07z0rUpS/xzmbUfcBuKWYi/7ZfhvMUt1pJ48A=;
 b=ENciQCRnUMAwl6DzuNIjjsg+8w3/rv4CheeLhY9tAO1Hhk9nOzLcldwIF/0b/2vnoY
 Yn75xvRmpe7B4ftzujIvMDEZSKS3fIkx41kjDnnJkqLAuPPjvS9LYJVnM3hAuIob0jcz
 8YiKR9O0sWm2JhF7+wcSAgKFwMZNixiwUBLPolSodzmkG8NBut/spQgZF72Pd4UdysZF
 aSR+K+k2qnsfQObbKYDtdhzUQlhBEM/uA7OK8lmHP7IL4ql7PJ3VCVfQza0hwbIVpFXL
 dZ2AwNuvExDAdXvioU10bwQdFFs3pGaGdFVyG+ngooRXIOZ56lg0d2dxhAhE9SB2Ncqk
 PjJA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+sWU3GVInZcGr3MWJQyzAz2cklrsHuIZVmeoMvicqvscHnDQtVuzAd9Ob7I9OMKTT0wPivFKDdsg==@nongnu.org
X-Gm-Message-State: AOJu0YwXph9/SZslNZMIh9IPEdrZeJmUXTR+IkIyJOMD4TRJm1GcqFBh
 n9TYuxOyryS+pKFi3f0CxhEjw+WVoqnyd32zYIzG2kQNHCK+pugkFxG68Xu941rJ9yBAdXVmxRA
 +tTSw/0XS8edtdzKdGuCKgKkDTtVPL8b8fBn+dZNgoC+v2yc17Rrv
X-Gm-Gg: Acq92OEk0KSdWmJcoVz0CdftsrVt1qzpk4IJz2Vymc8GO0hxTe3YPJKaHqQxLWL6cqR
 wBueGcjkiu09BfvHTdHqXScGOSzKgArWQbr1MU0Pog8geQ9oMaYn4Y3LNcO/aewsqx7BfeczN5v
 NJiILsdaV3e+dDQE4v8nc0Agz0KZbFSkS0N5L7p9/INrALAIEiBj1p3XX0O04+UJtkr5BJNf7FC
 64MOmIIoPOb1miowZuSJ8yOZbV2jfJqDKFgdHZPK7P6Q37ae6DaHsvyzj0AV9e4LT/m8Oq4HTFV
 nbivspIYTzKmd/0sMd15w7fpbHH/zQ2/bobU4N9R3MG2K074NQsH8eM071/KN0q1+Hjpd0BULmy
 c0rw1yP9ls+0+
X-Received: by 2002:a05:690e:144b:b0:65e:39d1:d9f4 with SMTP id
 956f58d0204a3-661073da66emr12684719d50.9.1780934017770; Mon, 08 Jun 2026
 08:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260529082948.363931-1-alex.bennee@linaro.org>
 <20260529082948.363931-8-alex.bennee@linaro.org>
In-Reply-To: <20260529082948.363931-8-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 16:53:25 +0100
X-Gm-Features: AVVi8CcW8P0G698t2w9dMFbyNLX1pYu_ywbTj3TI5RGvV3Iym5GgMjKCA1KpA3g
Message-ID: <CAFEAcA8719Q=VCwOm790V6FPA8FyaFZEux=N-7PmOGaaq=O_sw@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] target/arm: handle the WFE trap case
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 29 May 2026 at 09:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Now WFE can actually suspend on A-profile we also need to handle when
> its trapped. To do this we need to pass the instruction size so we can
> deal with the is_16bit syndrome encoding.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Doesn't this need to go earlier in the patchset? Otherwise there's
a point where WFE can go to sleep but doesn't honour the trap bit.

thanks
-- PMM

