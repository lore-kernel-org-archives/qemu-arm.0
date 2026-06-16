Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09B9CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 08:48:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZPSt-0007OA-Gn; Tue, 16 Jun 2026 04:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPSr-0007NU-NQ
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 04:48:09 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPSq-0008If-6d
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 04:48:09 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-6606678420bso4451777d50.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 01:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781599687; cv=none;
 d=google.com; s=arc-20240605;
 b=gtPovNEgqYIAuLmReEBt24YgKkpclBRY0PA+tdlfCUAVqv1i/1BsTsV9XEwY69t5JL
 /WFClQRiTwiDFeExYWKJlJdbs2OXNBj1i97TsFnGEk7oqsA1qvN91/4Ck7KUQWNJoCzc
 aftlxCgwjdDWD09fDFoOlO3krp1rZgKNCjEX3eep2irqcC0S4yGx4PAq4bAaSDvpQkKC
 xnuuHPIFvHA6RY6ZD4zkU6HFD2hHzWioQDEnIbF5HnhEdBe5nv+R2qPZadFaBoTmN1s3
 if2KelA5Cgw7U2UZ8wkNSxjJghGxk8R/wRMJgQAUSMzd/ADqJoLBRtkedXJ3NBifOQtj
 h6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=5r+APlV05BIlIwZRvP7h6ZusidgbpKZ5kC/OOQAO04k=;
 fh=8ieY+U0XOI7d2duPVJz5aNIfwAnJnjQuDw5pZL55hKw=;
 b=WcMqwkW1ouapWeY3B+lXNBWn6y+y8Q1PfTeJd2XxlAdtye50WIQRYHsaBcsaanQMSG
 dm84h6C+SZklivMXzBjZQUfC0zIu8GwuUgLuJIdTDy+mtIozHvpCUbDQA65kyUtXfWFE
 DOKaGeReSktuog6/ni7rKcxK2vP2QaYP5OJOMWKlhbG/JW2FLUUpFGmpSUIaUfiMtXrD
 QMzB3KzYDct2mX62DNHIBtr9ZuMZrMLA6FSVrwKqb1FWZOe2H4sZJL/kltRlCPoNF0Tf
 jZlHTdhzcv9i8v/tRDuOQtL4xLIBCARY/1/0JTGgjX0T6+Aenz0v+MTVrJmkstW+PN16
 NuKg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781599687; x=1782204487; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5r+APlV05BIlIwZRvP7h6ZusidgbpKZ5kC/OOQAO04k=;
 b=eDZtWLf5UCjpYNA0fBVKK09seXZmt7cWzNEapoarSsjGKLKYhLbjvRhkSz8+52G+lt
 ArZzSpRBxOI+Bd5cOTfmQXoPJAsAAKd20e1dxDSw7qO+vf1tfalqS/H7bQAReMDra2rI
 hLZhIc8yMhG9bmrGribcJaNXV1513Sv0pT0t7/ftZXiiowMIXmFzXzfMSRLx2fztMHyu
 kAiRaeYoU55AHHocxg4ixjl2Bfg8laUbNBcQzj0aQ1xslU3BidktnodRO4UoY2leYF+U
 aOMBWx0FSN1uhLk5QpxvogzLpOiomM0ovGGLtPToFvZPV2AeY7OrxcD5/WC2/Q8TZdax
 ptFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781599687; x=1782204487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5r+APlV05BIlIwZRvP7h6ZusidgbpKZ5kC/OOQAO04k=;
 b=a5xi4engsHdAzTiqZrDfSkQViobZcSveitSR9xo5rsK/D9CoLAVFmw7basgWyz06iF
 v2D8ZZ/GN+XMKzQyCgdwFo7+zClYbgCFPjVNBz0QlSSQOdjB9hojpHIUP5IGIk1ahj8N
 gCVVrfQp0EZaSSNN+H1WEcYdEZwZbQhc/IFFTEE1dMtenPMBvTVXX6PkgYZOuPzvdMP5
 LPs9P55DB89JPgxJesih04EhLqPpAzWwoY/JkAAL8SmnhJYY/b2qoPQYFz+NlsCxGJyd
 zZucnbn6aAOBPbjT9tAm6ncjoUBkd7cEUEdqiB+2j8oK2grVobBx2zf5vaY8rg/QrMDO
 GJQQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+JcDejXwZP8T3RuapG/k4EIzXUuBuexiSiiZh0XBi1ja17mullYO5qsiy93HruHvbO4Rfig2bLvg==@nongnu.org
X-Gm-Message-State: AOJu0YzzkOkhW3cog/iUzWJalBkeIkcRAwOuWrjL9TWLHyA8t7e0/5eI
 8P56MUfNnj80kDUP8goiScvuX8ewLSvhnFYYEgalPeQKRneVgFegvoaNhTN2x1Fxr0vQE09cWjl
 7qnilgKUChULXD+j7Dre/631VjJScmtjaGPPh7QB8hQ==
X-Gm-Gg: Acq92OHWVQNxuc7rc3nMo0Xd9Nn8maItDQ4r5uygMfb4gz1QeJq9wYemS6KxYwk0a2y
 PYWGQPtrAq8mjdEthE2tBJ+djmeOMyIpn784WkmatGuXCp5GUt+CEzZJsGYOlwf5l+u9xCEhi4x
 gVoVYSo7Nh2bsq6tU4aAW3vrb8h9AHneK3jFQ5ZyxsQMpnUdXwxvQFe/cycLGikYgNAYOfUOV83
 Ssi+odz1yqkccOLtBusnxp1BzH5SnkslgQkW+jnIGPQ30NrQ1ZK79NYOaPjIUalKc+oIxSxmilO
 se/Md2cz10tclJFU61M3bgNraYAVooqyXczK01LU5KPI7CtRPqp+nqCVnA/KcKs4LCQ=
X-Received: by 2002:a05:690e:11c2:b0:660:580f:694 with SMTP id
 956f58d0204a3-66285054f45mr12676095d50.44.1781599686755; Tue, 16 Jun 2026
 01:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260603124415.1120808-1-eric.auger@redhat.com>
In-Reply-To: <20260603124415.1120808-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 09:47:55 +0100
X-Gm-Features: AVVi8CdEmmahopLC05cpDoFPfOC-yIO_sFj3eYajVZVVWvPG76Dco_nZDjDdT0g
Message-ID: <CAFEAcA8djCh2kL71Sa_6tRikiGT7PU=12yqJwrRuWFESSx+Xbw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/pci/pci: Enforce pci_setup_iommu_per_bus() is
 called only once per bus
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 mst@redhat.com, skolothumtho@nvidia.com, nicolinc@nvidia.com, 
 nathanc@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Wed, 3 Jun 2026 at 13:44, Eric Auger <eric.auger@redhat.com> wrote:
>
> Currently it is possible to attach several arm-smmuv3 devices to the
> same bus although it is a wrong setup.
>
> Change the prototype of pci_setup_iommu_per_bus to pass an error
> handle. This latter is set when iommu_per_bus is already set and
> used by the single caller (smmu_base_realize) to report a useful
> error to the end-user.
>
> While at it document pci_setup_iommu_per_bus callback in the header.
>
> Fixes: 66d2f665e163 ("hw/arm/virt: Allow user-creatable SMMUv3 dev instantiation")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Nathan Chen <nathanc@nvidia.com>
> Reviewed-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

I'll take this into target-arm.next as it's a fix for a function
that's only used by the arm SMMU.

thanks
-- PMM

