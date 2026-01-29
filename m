Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BBBD61017
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 13:42:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlSCo-0005we-PB; Thu, 29 Jan 2026 08:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlSCm-0005uO-Ry
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:37:04 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlSCk-0003Mz-6W
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:37:04 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-79273a294edso9426287b3.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 05:37:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769693821; cv=none;
 d=google.com; s=arc-20240605;
 b=H0hZbQ3BTuQnL60EKiAjxoFoVroJ2dblZZWTnL2BA7s9CUCX/kwXUP6198DqXyEN22
 OJ2bO+a3l23mQXqef58hM9Di7UCb7FlzAeVBDBUw11X225Ti9ZtZZAOmikZRS0hIIL5H
 ZvLrbs26mO61HW15GV/9LqsIw7pa2F/sr0HmYfDrpzLBLmYKNbnPPcEg4ZiIlB29SMqJ
 YtQHommyZV6JhpOfDinaYg1LxofpipqmKhPTEnkxtQptVv0o2Bl+cGjTDA1XP0aVjKOI
 7jFgyYYJlZ4IT9sEwUYLYRklr8GghrO38TGCTv+oQDPUMjospfkx0LbNw+cMNJbJmxLl
 9osQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=sN/IfYN/Xe9ADwXGup/nslEHImNz4BeTCieJNPMoAXo=;
 fh=yzmXej9edFm/b1dNy009GV52zNju1BbWudjqaLUCe5s=;
 b=XKiU2hxdptmcHplJN4mBzp+ZTkuDHv1gUUlHG5CLiybV6kdbrHIw6RwGtnxUJnrVw1
 bluRRWeY86K8/okuZh0eb4uspgsOAuiDD9d6O9pnHlQFolmun1VrAhwuOR5eM3xySYuW
 ujbD5S3Hr+Yz6pYpVDTIvrJOly94IZBsp8ZDh0exWpApr5NejN6GqrtXY4EFhwxTjvSz
 czkxX7EBuyJc6YYuxTRydUAW2C3ZMK2IXLh5hxFgOn0sqyPguNvRFxmotoaeit3g33SI
 da4HCyMAUNlvGHShOJBcyBOtw6x7WdpNDkLL7YGjz3aWiFF3MI0pTkam3cTz4/k5yRkN
 SI7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769693821; x=1770298621; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sN/IfYN/Xe9ADwXGup/nslEHImNz4BeTCieJNPMoAXo=;
 b=BHdU4g+ALqjWSP/GzPWjl6LfkHKXR/BUCEn/P7QohPmpgQ9raUx7YQDDIJSyJbRDx2
 uUbZYMk2eUqNfHQA43Lw0n6D4QJANd9jBbMM6X25sDc2hmO6yda1brzQ/V6DJoeD0t3G
 caU/K2pgOeLZVTiEk9l1H49V88okpT0KVib9Z1k5gRE1uYxoNIRleOlWIO3PnmVL56WP
 WNKJVn6hlj7JZflO69ieqXgs1vohHQg3P1NFXMwHtpreih8kwfuAj6yJCJu0sbjJMphh
 WjV1fyeZvugpzfLJlvY6qTuNN1PGvG5kFGqEqp8PVNP/EJG7Zwy/0epv9I4Sh5m6VaE9
 K4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769693821; x=1770298621;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sN/IfYN/Xe9ADwXGup/nslEHImNz4BeTCieJNPMoAXo=;
 b=DZhZo/LdQomdj6dFO1I9lCaBRe9hiaM/cH97V1Ji8s6Qs/t9MzR4hzkH2AS2gBiipH
 FrAkYJTvFG7WAht18QLaJxYYzlAb3zVJd/OI/lJbM09979BYYO480eKLsMJyNj3P/x6k
 L66JFj6rcRMrMbFqd2HOsDeSod5u/huIgSIpCU5ym+qgvkjXXeavYAn2gDokJPCLoh+J
 NtfFvVAhrCPBUxk5ChZ95pt6/YNru4l5ckYN1iZrqkvCy/twJ9GlHm2u2J78/KiiwoPd
 WJOt9AYYOCqzL1v3nJk03wNQ2+Svmd7noq8a9+VyRdNgqANyy03pMIHUYkJ8US1B/lFz
 dC4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTwdLOVu2m205rcs/pP32nPbhmw+FdgRPzflnYN6Xev1kqyW9a6lXakYH6+1vqG0MAoV2Sqx6Bfw==@nongnu.org
X-Gm-Message-State: AOJu0YyRX0yW80PTZK2owrz/fH05hXKHI6djVc9RyoEOPwsZk/dzTlq2
 +YA/kfLB2Ddq0ppFKv9TUwngp6mAjYhJ3sVGMzZOKvpo3lT/ezjnPFRZEIfjboUPqaLxmoMduV7
 ghnw31ORc7eIOp2l0YpJd78sTsvYMHVD1G6T1Luv+Zw==
X-Gm-Gg: AZuq6aJps37WG1yUwlu8PFTMeksIKx5xrrOzkoFWbcwtOHP673JA568nLZ75YqO5xXI
 v1kK9rzhVRBHCcOivP/0+YLwgxhFPdUCesIVSnXNtuBjypamgvX3qIB/wf6IdWH5reaxRwg4hMH
 fDQjH7QcH9ZUC2zNWe0wYwWe0oJLs8SF2K/n6kKXkmHY+MdKLIETiqEKsM9Z3YkQb/yvMhS3n+x
 MjUCoN30YIJeIzcATPtkDLDztX+6EHieNYnyAPX8qa7dlF6qTkaWj7x5Db/qjeKAyXDBQ==
X-Received: by 2002:a05:690c:14:b0:794:8d58:cac8 with SMTP id
 00721157ae682-7948d58ce74mr39171537b3.4.1769693820790; Thu, 29 Jan 2026
 05:37:00 -0800 (PST)
MIME-Version: 1.0
References: <20260127182805.73212-1-mohamed@unpredictable.fr>
 <20260127182805.73212-6-mohamed@unpredictable.fr>
In-Reply-To: <20260127182805.73212-6-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jan 2026 13:36:49 +0000
X-Gm-Features: AZwV_QhJjQyc2L3PIYwRjF-3BhFl3zXOwzagj7lW2l4jmo7kyVF_gHIOKjteGYU
Message-ID: <CAFEAcA9qtLv1wOKkEmtNO5UsGTAM0x7YD+y8Fsu8hCQRAD_o5A@mail.gmail.com>
Subject: Re: [PATCH v18 05/22] tests: data: update AArch64 ACPI tables
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Phil Dennis-Jordan <phil@philjordan.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Tue, 27 Jan 2026 at 18:28, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> After the previous commit introducing GICv3 + GICv2m configurations,
> update the AArch64 ACPI tables for the GICv2 case.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  tests/data/acpi/aarch64/virt/IORT               | Bin 128 -> 84 bytes
>  tests/data/acpi/aarch64/virt/IORT.smmuv3-dev    | Bin 364 -> 260 bytes
>  tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy | Bin 276 -> 192 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h     |   3 ---
>  4 files changed, 3 deletions(-)

The process documented in tests/qtest/bios-tables-test.c says
that this commit is supposed to have the diff of the disassembled
table data in the commit message, so that human reviewers can
confirm that the changes are as expected. (If you git log
tests/data/acpi you can see how this looks.)

Can you provide the ASL diff, please? (If this is going to be the
only fix needed to this version of the series, which I hope it
will be, then I can update the commit message as I apply the
series, so you don't need to respin, just reply with the updated
commit message with the diff in it.)

thanks
-- PMM

