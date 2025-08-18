Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A1CA0EE4
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 15:41:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uo1z4-0004KK-Lp; Mon, 18 Aug 2025 11:41:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo1z1-0004Jy-QJ
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 11:41:16 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uo1yz-0005Z8-Ju
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 11:41:15 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e934a3fa4f1so1317356276.1
 for <qemu-arm@nongnu.org>; Mon, 18 Aug 2025 08:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755531672; x=1756136472; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NkV/Yr3CXZXc6brEYyJrAUVBIdanw4X2KVzFG5I/940=;
 b=SBmBllviNKLiFEmZe/KaKAxCzpiQmkrdbSuIgsjdYRzZOCZoCaxWc3/MbOkkz9gyge
 Apz8jlS9IyttKN45UAIWGzhGw1XxPU9gjMEYFdiW95lvFJr6kx7LwurlBIlhyORtCjpq
 VVR4aMeABLMiIG7FrJxDxBk2omqU+DskD5RXv9B/ql3Xt/Pnk/+hDsgPSzzdSfevBhHM
 L5qPjlf452qL2RSCDDtjr8GrwafS2AFlJqdLRYjzIYgfmgdv1wDq4C1dnL0E4M0roe4o
 8qU40PGhUBEbxPE0VYDw59w6ygINdawjxOzZH+EMArw+edcMKAzu6FDCuXYZ2uu+nc6Z
 Ou0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755531672; x=1756136472;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NkV/Yr3CXZXc6brEYyJrAUVBIdanw4X2KVzFG5I/940=;
 b=wnOxRId5Ybf3zrVcyu7wsmfCB8ddUt0RwO3rpIo83vOgAz7iMeqzJhtxZxuM9kOJGh
 GoszC/Egozlo9MrvrSgsoOL/hshET+JsKue5HKRn68835PzLeHlkHjMEOLFpW+vuo/OS
 0j6jVNLfWLeaHU19dDaUoVSY1RqNmSYlJHp/sn7kJ/7SQb4eLF4/tEZzNxtrPlrbaO95
 gmtCMhtdjo7NJdZBpCAOOIyoqmHuKMr6xTup1Y3LnnDLXKvki/eGfc3rMxvIeJfTnX/X
 ry1cFAjJKaSBSAcb+Isueq5XCiBnoM2VtUFhnJg90bJYiFxzINlj9O6MexGPg9l99/AN
 nkMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVof/s+owRSdIUijF0r3/ig0L+hzWiEnk2A+rGHWgppDAADQqwWtpYLsExmSPHIS0h0pQgpQgGXtw==@nongnu.org
X-Gm-Message-State: AOJu0Yyq4ALa5g9sZNAZqSyxFwSvaufq+OlE111jABVlmvcuOXvMc/74
 iHUY4HzL/yCs4Jm225iMwragCH1YFWaGzihxqHWS9mmM8GxAwSb6DLf65VlFTv5AJr/hLUg4Mne
 gwDsCUZKpIOkjDchJAJ9Knk0iKZVdF2LOP0wvu3B5ww==
X-Gm-Gg: ASbGnctfUZ1vHSbC9oUtMS1wOc4XHPFeg1z5AECJzNfN2wfJNY/YMLQAkimvSrbnHXy
 z0UpZ9+BUtc1j1ot4ZH7sdXBvApUWyXiwiWS+Hq3srs4W4CPbyIx8xF3STum+f/ryScV3MtKtQZ
 CaQGPgZHwXWjZ5VscAlSrsnSNVBpp/D45+NE1ko35JsxeNBSgtgWL7EZgbXUG/axF5DyTIZppZd
 zU5nc5B
X-Google-Smtp-Source: AGHT+IHsJOOmNxmwz8fl0TjTywThxhYSK2QWveFY2xXyZnboUJuRd6rtpeTHgG3hhcK4tg3V4BKios+78meEvB3UUp8=
X-Received: by 2002:a05:6902:cc5:b0:e94:da97:ccad with SMTP id
 3f1490d57ef6-e94da97d59bmr2102215276.32.1755531672223; Mon, 18 Aug 2025
 08:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250809211051.68824-1-chichikalyuk@gmail.com>
 <20250809211051.68824-3-chichikalyuk@gmail.com>
In-Reply-To: <20250809211051.68824-3-chichikalyuk@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2025 16:41:00 +0100
X-Gm-Features: Ac12FXxUUjlSHOdGrNbW6SMcmkpz1fflSKfWTLexGKzEh-lqE8u2S58XCzb57tM
Message-ID: <CAFEAcA-XZ7g4iTKza7h8eDya2WQi4QwDL=YEWQcAsRFEaJK7nw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw: arm: acpi: upgrade SPCR table to revision 4
To: Vadim Chichikalyuk <chichikalyuk@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Sat, 9 Aug 2025 at 22:11, Vadim Chichikalyuk <chichikalyuk@gmail.com> wrote:
>
> On the ARM virt machine, there is currently no way to programmatically
> discover the frequency of the UART reference clock solely through the use of
> UEFI/ACPI (without the DTB). The SPCR table can include this information
> as of revision 4, but is currently at revision 2.
>
> Bump the revision to 4, add the clock frequency of 24 MHz and
> complete the other new fields.

This commit message should say why we need to do this,
i.e. why we can't continue to do what we've always done
and not tell the guest about a clock frequency which is
entirely imaginary in any case.

> Signed-off-by: Vadim Chichikalyuk <chichikalyuk@gmail.com>
> ---
>  hw/arm/virt-acpi-build.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index b01fc4f8ef..f685668c5e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -536,6 +536,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  static void
>  spcr_setup(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  {
> +    const char name[] = ".";
>      AcpiSpcrData serial = {
>          .interface_type = 3,       /* ARM PL011 UART */
>          .base_addr.id = AML_AS_SYSTEM_MEMORY,
> @@ -559,13 +560,14 @@ spcr_setup(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          .pci_function = 0,
>          .pci_flags = 0,
>          .pci_segment = 0,
> +        .uart_clk_freq = 24000000,

This is a number which ought to match the existing one in create_fdt()
in hw/arm/virt.c. If we need it in two different files we should
#define it as a constant in include/hw/arm/virt.h.

> +        .precise_baudrate = 0,
> +        .namespace_string_length = sizeof(name),
> +        .namespace_string_offset = 88,

What is this magic number 88 for? The spec says that it's
the offset from the beginning of the structure to wherever
the namespace string is put, but we don't decide that,
the build_spcr() function does. The build_spcr() function
knows what the offset of the name string is, so it should
write this field; the callers shouldn't have to.

>      };

thanks
-- PMM

