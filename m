Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739AD606A31D
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=azP+YBoU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMnpB-0005T6-NR; Fri, 30 Oct 2026 10:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMnp1-0005QT-93
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:43:12 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMnoz-0005Ea-Kr
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:43:11 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-679965fb848so765046d50.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 07:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793371388; cv=none;
 d=google.com; s=arc-20260327;
 b=G3YKQK7iI7mOLu7A33OE1nraBzr3+sEwzadKUURiwJfl0iZ82iFh3KVXMCF59rbEk+
 Qp/sYFD66Jeia8jk22ngq9+mY7EobPJE4gbedErX1UCSsqpD13Ev0EhcnviG/hzqwYPD
 nPn9qPfN49epe9xErzPFmWObtFTqSjilDJCsRpI7KYA6wKOdVTapDqEpHrCS4wwzUz4+
 w8Mk6tdJVCIvH9+4ZPLBzB8zfZO78Lwp5av7P922jq6CwrklbFdmiHbPDqXwLWq7m+Gu
 NjMIhgnLA/sf7tDpGtmnM00kjVE+UIzBhcZZoMzJcCPM91vYZE5gKhY+2aKgNjBz1UwF
 Qxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5XBfL3zIAxBj5/WTLW4TZNvwKss131iP7qDtg9gvbVY=;
 fh=QCsk2MJAwC8v3g641G5IWUu3/SHW8nwbmNUQrgTMkQA=;
 b=otXv3FuwBIWN5WvqlkoYh9vUgGyTSE7BsfeV9KOy99RnJLU6sZoFOO0N0XqshkTULr
 cQ6r20OBf3J6ahvOqxDqMJk55XWAtbSnmPrzTICmtJ6Be5eLV36HRjGGlN6kDxtukcno
 abt2FIeUlmdq2aHGFCFiAFpqjYUNSWzNZmnZyasKdXoVSS07OWnuf/A5BgmYALzGlOcy
 rJDdj+/iduk9FgpvjA887aT0bi1lRvHY4PlLgD2DOJHtX2OUW5U4tYrab1OVVskVRg3Q
 XmjkXcqYJFvBVn5RMHa70AxRnqzdLRF8p+Skl29gcDfaj91i5Sn81AUC8evqyFTVvMKk
 0PEQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793371388; x=1793976188; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5XBfL3zIAxBj5/WTLW4TZNvwKss131iP7qDtg9gvbVY=;
 b=azP+YBoU8IgQhvQbFB7uHHEVJyI4DwuE8Qnw8WcDAydI/kCSznZDf5NJHlKssUi8vC
 ecRhunPD0Or8UMfjo+Ud46BAS1M4F7ydMBGj2gPR1a1DiBJIU2oGHd9F57KZxcgdQK4g
 XTN893gueQ/qIGOf3Q7eajrSFBDsvPvgm1HTztQYNJCNg9uUmPF0hzsVsDiWpwX6Sqev
 w/ugWDGB7ZPUy5lYIaBSemLovQ2ndhq4yDYEVmCbW1rVxzyzzwdNcUrd6IWtqDB9Qzxs
 pyOV53yqTP8K8nIWLavS7/oe4XpEZ7tbciz0PRxnBdyDxOoo6ymd4tbl8OESviYjSaJ4
 LCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793371388; x=1793976188;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5XBfL3zIAxBj5/WTLW4TZNvwKss131iP7qDtg9gvbVY=;
 b=aYPcdqanns+Ts0z0nfrk4njvJzo0o3dw29YbX8FsTs7OW/e9Xlwupy1I5Ljv3tPq25
 ihiYRcx0ux/NcexzMp4a4c0qBMw4yRgLd9lPkv6U1/NPMTxT/GNXD8gBj8mrxCiGrPHz
 6Nk28x7rgzcqRQx8/9uk5Ie4xOE7n6pkOGqTJ/y4n/eclQroIux5dClvqHtflIY4/HPZ
 x8JHLDfjj988KyH/pMeMxIyFe94C5pWL56D41ZmY/UuUPqMSFa7dit+pv2S1UR6l4ZJo
 kA1j7Oqr5YPJ4ZTwNDxDzHp9lfNREEyUPzEO534xCy7V9e00eU9npyZfmRZT15hjtW25
 wqXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzUFyTAAK+7uz0asHSQ3HSmVGvtNcGabSyeijFrmrPYFdRDQDBoWknqU48MHIvpjE0MDapTUMmSTA==@nongnu.org
X-Gm-Message-State: AFq9FYLC19OXkmhgV+FM2mCiEaM/56/IkY0r/22JRlRKCXNLTmUL/i6m
 hIWVIA0kICpUHt25CJ3k4E6M6xMFUQl3Iqn1+LjUIrVt4QnyK3WTXKc006szEICm0fX4gqMbBtM
 MkVDG7lqrhJZHn5BjqfI8twbjrWAqsFoUfQWdB6c+VQ==
X-Gm-Gg: AYBFou02Bo33JDKnRC3qtKR1/XoedxqoVEvmMdqB8SDX0eLPDi5iChXtCNIwSbIw4pH
 63cXdMq5RWU0ivV5yGoNX8HyUSq7yEAl/OB1PF2z5qF5jMhJbgqFx9jKpYaVFuFoW7JKYh9dvKp
 ZUjFGcnA1/6t9uxwPBVuogHwl2V7fyBDzQKWyAC4U3kvEgMCYFt2VJJMv4MqgmgUCx3chIy2653
 tDURo/TKI2KuP32qxyikhwwOKKfQOYbsqbJkCjTI4AhnR+2fOu0c3oFfN2Nl+3KXN9vsk0dH4pO
 /QJscXA0otOxQ3lPOM5txS98/cLUYyEbA2n+zGPhnAFv9CavMhnAnoh6rVHrkVtUcsqY0EiZE7c
 cNbpK37O95+BdlE3Vj1lQ5RZzSC/tqrilRr/LJN4MPzBd3WXD7Jfio4y5ilysBAg5nyCvFHA+b6
 t2+wtNFGUylRv9Za/Ud86o
X-Received: by 2002:a05:690c:fce:b0:8b1:738a:b44c with SMTP id
 00721157ae682-8b2b66c780bmr12910777b3.23.1793371388004; Fri, 30 Oct 2026
 07:43:08 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030143435.57230-1-sebott@redhat.com>
 <20261030143435.57230-2-sebott@redhat.com>
In-Reply-To: <20261030143435.57230-2-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2026 14:42:56 +0000
X-Gm-Features: AclHuK_r0kqVhi8LlvQGUgGswBkO8dvXYU42AIZd8VarOJKUgeHlI3R_01kyzkM
Message-ID: <CAFEAcA_At+wWDPw7jqCqaB-DD1j706Bm2ekPs_p64w+prSzL2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/arm/cpu64: fix typos in
 kvm_arm_set_cpreg_mig_tolerances()
To: Sebastian Ott <sebott@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 14:34, Sebastian Ott <sebott@redhat.com> wrote:
>
> Fix a couple of typos and a #xa0 space.
>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>  target/arm/cpu64.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

