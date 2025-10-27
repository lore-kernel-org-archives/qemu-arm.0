Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94689CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:28:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDLOT-0005kT-Je; Mon, 27 Oct 2025 07:28:11 -0400
Received: from eggs.gnu.org ([209.51.188.92])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDLOQ-0005kE-Qg
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:28:07 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDLON-0002iS-Ka
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:28:06 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-63d97bcb898so7436915d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761564479; x=1762169279; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4jP1Cz7ht3qDcaecQqPJ9B0CKFuaGBf31D4PnuDzK0=;
 b=JXppUf3hUAPqAFqr6l5bVrhjB1AdY+08odD7TPoAWMyylSZQbcyJO6Gbii6bCHFW6L
 C5bqUm984Uat7XDgx0NOQHoCjvTqyVTgmaILOfBg4HbPzk/2YSiPFKvQ/aTwWDwNaZ22
 gQHDYrXPBwIT1BAecze6a2II5HxJYSP1+5fR1Mbfc7tLFrK92DYV6JH8EYnwee3F0q/P
 zNNfyxjPcOFFkhEkjiiLyP7JYsL7AJgVIm8H0y7jc9uNhUa//EQ9BuS6YuC8WGNRW3Nw
 n45x+4kEm9dcrGqlcEaqWoosh0d/+sx16sfl/PDkM61EhgoGHlSXSoddmtFQnfCvnvLR
 jjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761564479; x=1762169279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4jP1Cz7ht3qDcaecQqPJ9B0CKFuaGBf31D4PnuDzK0=;
 b=s3F37Fdl2upglv19YqQS/FhoCiqp2X/JZPwrEE3zkXFQ9d/Nm/QrXtfLeuU5dYXwtf
 5D4+p5V0xYHMAGh/qY5J3LOvfRvma/NiJY6ND++LM88jmf8r2+4H2xl9KhLVmNu83dBe
 l4W98QE9vt0wtDmL2hx2KDRlkkoI6OgGr9sL1G7eClQZkcvlow5A+HvuGaciAOM1Grhm
 tCezmrL6Ou3PrgnTan6kryjqE4EjMGFWhdYpyxWjUSyhv86G5Cuhm4+XSoZrLkWcDllc
 pNeq3AOKqVxeljJpRhroJHF5zjBkLecBzsYVIQW7Gzc2poXHlz6b0OlvXFL81zDDAjlt
 hD7w==
X-Gm-Message-State: AOJu0Ywb4dju5BcwEPYAThScWo7xR3SnTpFCwOfAYaRdTqjEOXFbZKqh
 rNC3aLXUUHN7/qpHp/2bFhp03liP+lL0Pl6QKHtUaj7iYcpn1wCv1BudnUzoL1z9t0WK7wjbQgd
 8/XhZOJ+UESbYsndcnoK3FjGZUbJDEdZra7fLDYg2jw==
X-Gm-Gg: ASbGncv4k0xTzAfmr30PJL5TVruBxGm7LSiiXcVBmCYJcTQlubMhKF6r0ZDqUhqd5+7
 SV8WBcH/teZLFHW9Du043Tj1o2b611q9xY2D1LtZnIAgL4tDc4+IV1YOMTC3FmJ943POPMbR4U/
 h1ymxNNrIAwji6M5JYJOOprtXh1N2HN/QRwRk0eWe5Dl2mAgB1thIJBdoS+lMBjvSQYjOupO55B
 RRy3dNuOXcdZwy9nBS6ogpvcv5qO0XnNQ/9jKOrbhWhk8FT7xlCbpq913AyLg==
X-Google-Smtp-Source: AGHT+IFhI0/JA7jprOmtw2+D/ZgGi0FtUpueH2qezsAlbhu3t0Bca3EO3/REmwYGsQH11b1j/tgHLZd3UCRIQq91Tzg=
X-Received: by 2002:a05:690e:1543:10b0:63b:a941:90c1 with SMTP id
 956f58d0204a3-63f42b28a6cmr8268042d50.12.1761564479440; Mon, 27 Oct 2025
 04:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251024084350.252702-1-skolothumtho@nvidia.com>
In-Reply-To: <20251024084350.252702-1-skolothumtho@nvidia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Oct 2025 11:27:48 +0000
X-Gm-Features: AWmQ_bnr7tBjA-xLdosCLQmQwrzb33y_WPyCjqWOt-OWzaKBeJHlADY9T_Js7f0
Message-ID: <CAFEAcA8SAQO0frmN-rK6zp_-fEGXLefAXAxHmT=LASqEL-UU5g@mail.gmail.com>
Subject: Re: [PATCH v2] docs/system/arm/virt: Document user-creatable SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 nicolinc@nvidia.com, ddutile@redhat.com, nathanc@nvidia.com, mochs@nvidia.com, 
 jonathan.cameron@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

On Fri, 24 Oct 2025 at 09:46, Shameer Kolothum <skolothumtho@nvidia.com> wr=
ote:
>
> The virt machine now supports creating multiple SMMUv3 instances, each
> associated with a separate PCIe root complex.
>
> Update the documentation with an example.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>

Thanks. I have some minor word-smithing tweaks, but I'll just
apply them to this patch in target-arm.next if you're OK with
that:


--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -224,23 +224,24 @@ SMMU configuration
 """"""""""""""""""

 Machine-wide SMMUv3 IOMMU
-  See the machine-specific ``iommu`` option above. This allows specifying
-  a single, machine-wide SMMUv3 instance that applies to all devices in
-  the PCIe topology.
+  Setting the machine-specific option ``iommu=3Dsmmuv3`` causes QEMU to
+  create a single, machine-wide SMMUv3 instance that applies to all
+  devices in the PCIe topology.

   For information about selectively bypassing devices, refer to
   ``docs/bypass-iommu.txt``.

 User-creatable SMMUv3 devices
-  Allows creating multiple user-defined SMMUv3 devices, each associated
-  with a separate PCIe root complex. This is only permitted if the
-  machine-wide SMMUv3 (``iommu=3Dsmmuv3``) option is not used.
+  You can use the ``-device arm-smmuv3`` option to create multiple
+  user-defined SMMUv3 devices, each associated with a separate PCIe
+  root complex. This is only permitted if the machine-wide SMMUv3
+  (``iommu=3Dsmmuv3``) option is not used. Each ``arm-smmuv3`` device
+  uses the ``primary-bus`` sub-option to specify which PCIe root
+  complex it is associated with.

   This model is useful when you want to mirror a host configuration where
   each NUMA node typically has its own SMMU, allowing the VM topology to
-  align more closely with the host=E2=80=99s hardware layout. Supporting m=
ultiple
-  SMMUv3 instances is also a prerequisite for future accelerated SMMUv3
-  support.
+  align more closely with the host=E2=80=99s hardware layout.

   Example::




(I deleted the sentence about SMMU acceleration because that
isn't upstream yet. When it lands then we can update the
docs if the version of it that lands can't support acceleration
of a single machine-wide accelerator.)

thanks
-- PMM

