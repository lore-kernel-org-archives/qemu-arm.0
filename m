Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498B0C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 11:02:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whmVN-0002uf-FM; Thu, 09 Jul 2026 07:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmVM-0002te-4i
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:01:20 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmVK-0005CU-Ex
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:01:19 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-7dbcb505578so19893227b3.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 04:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783594877; cv=none;
 d=google.com; s=arc-20260327;
 b=SIF6+273MBds9r4VyKvTFJQfn40wBwLPMfsKVv+gHhZvkuBdUDMzUwcS0lrbbWXeuz
 bzeLeDBuPAul+sHRac0/r8PGVJChwO1oixSjnh5Nm7+0fqHDod/JCwuzTd2ElE/uksew
 MK201NCGOKvJWECopgBCfgSJVGR2zuXKq3L/vWTDdS8f1h3i/luFmY4B2u9nBSym6TyN
 LhZ/Z4GZ+YDY9gQIT37tw8H+NUNZS+mAh/Egp5/KkUU2zs7CqCdRGmiOWn4jjqpy8Y0z
 xDx0+EbnPd2qEOec3rSKM3arkEmgQ+UBVFV7bfDYt7KZ/LWAjKqGTi7JLMX17IXf2LBt
 RiIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TAXL4xpT4eVuUR20/E9jML7+hCl0Aiu/a3Q6Cgbp40g=;
 fh=REMAhb2NbWLgByYQX0+X7hyjc6vgRQ2rgmC3/GiZ7Wk=;
 b=O7E7cJS/IfY+VYx0toy9nrPhlDmDf0lWg7zsT5zte2LNRF8Pkx2cu5Ya2JIh2uwNbk
 LeysGmBmrmWZ+sX13YXm5j4pKGaK6CdHXs+Pi66QFjBCXyTBfGfk1VblXtDaLOKavEK0
 aCJCQQQwamsQZovSmUbes+nS7J2SlaJ1kpT6bkf+QvHkFI+9KYvPY17FhkNialsiRQlR
 YzZh7PX4Piwg671iva0U1E7anCyje/ssP5DouAJwojgbZ/KSdrunfE11fHcga+bG55Fn
 TT/xa6+NpkbZZhNfGbrVLf+1Wx76qhEJGeawfbhGgXWp7XDrLklZeMhyi2xahHj7I9Of
 qztw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783594877; x=1784199677; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TAXL4xpT4eVuUR20/E9jML7+hCl0Aiu/a3Q6Cgbp40g=;
 b=k7b7EbLPwF10yoVTM2NZhob81C10nuBiWDLe+7kPInGGSHwFx7+aALamdRJGoIqdVD
 k/wdqKrXbzoFK+7k4Tg7YVP1fn939JBo3GPvVxB7UuEobiz6Go2+DvbrNggVqEQoBxhf
 yLLujAMfXJw9Z296TifVWEkywb4u5CHg56qaKK1bZQHrYBZK7e6+0g9rIZtmXCm13Xod
 iGMEfXETdmuB69vzfur8HsbqcznDuN4z5Z4gD4VQtrXtYMz2oWI7wVUtgNsrOWbqmiRQ
 XYzEO0N8u9CR22IzpybbRcA7geY7dySds+zMaC2/WXLKp9qKz+7HFfsq9lBekziNXz9k
 rfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783594877; x=1784199677;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TAXL4xpT4eVuUR20/E9jML7+hCl0Aiu/a3Q6Cgbp40g=;
 b=DVISif54Qj85V23pszkYRaNF/8NDWzm8YTgL0d+RXkwzPr3q4/rHqcZbIPxL80TA5R
 NbmS9sWVXmFCfvnPo4hJb6IHDI8+8iQ3JmD68xFXxcJyCHk2PCE08bRB98vyZP7rmnsH
 cuVdqXw8ybiT6l/2F4jofrXiq0QAU+E1k0RjmTo4pU44nhQUabZGRoq2uh+HLOo8HC70
 v8OOKvkrdcI3XOHfkpW+0qrq6cZi2kFYTeV6+cc/NeeVY+CU/6aI6QQ9qbD7OGswzoOt
 mwQSC2vchmrue88SB2FlqmVfgtOcVtljwGW+uCFxC4DjHdVXgIwJRaGFPTP4vxuxWwpH
 DvVA==
X-Gm-Message-State: AOJu0Yx/AxdvxV70SR93F7FLT/8xFadvwT2DWQgTVbilngzaJg52SLnw
 U4W/qVo38/OUfvh14ICWjG2+hoSX1CXgHsGXfZM9z5ovZq4Q2EeqRqrsLmFrp5tLegC/sFdGsyS
 1J1AiQR94bfTvSXNc0FnUjjmWqF9K4EQOLU4PRqovVw==
X-Gm-Gg: AfdE7clR2z1EvuwluKQB2GYh4y30RGqfjclh/c/J6P/KjQIsNX8EcIX9m567mb5LeiI
 ze3rkTyo7CM4jhRGWTP0BoZ+9iHxyGHZbMMRorUvW82rzWXLCliYGqvvqOtn4gCVJZDis+2pmvA
 83lBgbx9PYB8eM4dtIDeZV+RAmj5Z1ecSZLjeLnYTwGYRxbfq0CWqVT+Xy3IJiENhHk2FABQ26Z
 epCaEekIy61Kjn9aSoSU6+reE2Zk4Gu6VVdBxW260k76r3yq+fHeMKOzxhZ4xwT/rDnWi3YUbsK
 VgkbXhqNUAcRN4G1se1OVQRCcq0AS2bq6zeJ98+CvwxexDobQ7jWI1xU
X-Received: by 2002:a05:690e:12cb:b0:664:ae6a:ef4 with SMTP id
 956f58d0204a3-6679f1c516amr4780964d50.82.1783594876900; Thu, 09 Jul 2026
 04:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260707112450.111178-1-skolothumtho@nvidia.com>
In-Reply-To: <20260707112450.111178-1-skolothumtho@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 12:01:05 +0100
X-Gm-Features: AUfX_myqh7PJMmam3llIRbGUEeVmS1xzCz1H12eha40mxKFTrFT3yzj7OKW3xUQ
Message-ID: <CAFEAcA86zv2wYZKT=8ib0EvwzEjF7cByJXfZooBKC9x6M=rCTg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/tegra241-cmdqv: Do not sync GERRORN on VCMDQ
 allocation
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Tue, 7 Jul 2026 at 12:25, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
> When a guest hits a command error, the hardware sets GERROR and the guest
> acknowledges it by writing GERRORN to match. These registers use toggle
> semantics, and since GERROR is read-only, both GERROR and GERRORN may
> remain set after an error has been handled. As long as they stay equal
> there is no pending error, so a subsequent VM is unaffected.
>
> When a new VM starts, QEMU allocates the hardware VCMDQ and flushes its
> cached GERRORN of zero, while the hardware may still have both GERROR and
> GERRORN set from an error the previous guest acknowledged. This makes them
> differ again, so the hardware sees a pending error and stall the VCMDQ,
> leading to CMD_SYNC timeouts.
>
> Do not sync GERRORN when allocating a hardware VCMDQ.
>
> Fixes: 1d0f77535417 ("hw/arm/tegra241-cmdqv: Route allocated VCMDQ Page0 accesses to the mmap'd host VINTF page0")
> Suggested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>



Applied to target-arm.next, thanks.

-- PMM

