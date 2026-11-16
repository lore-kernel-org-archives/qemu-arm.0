Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CB4606A329
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SBBJF0Xz
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xStbH-00089s-Rr; Mon, 16 Nov 2026 05:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xStbD-00089M-QJ
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 05:06:08 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xStbB-0006QT-Gx
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 05:06:06 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-67db1f6f50eso932997d50.0
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 02:06:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794823564; cv=none;
 d=google.com; s=arc-20260327;
 b=VZuKSDjJB7DsO58vafQ9IT+f0IZsU96m2CR2eHXcGX/mbPFp9YfSYWDEa8E4prmepc
 AEYbT2CKnCfHaT2R9NFy5GJiMiN6eZsxyE+LKjQm96WsK3Bh6ns4uFKGXFXz79m/guUL
 CyDMzZV3RTJ4Y/jzKLDlbsodnZOoAk/osGM4f7OY+qBDpO9PlagLytN1NMQHSm6eCjpq
 dXhILLZUSa9ZNHia26EidduAAKDxM2yt7yNtTyp4qRBmr4ANkqyFjglQRetCGjhwwpSa
 WU6yH5b7FvfRoG6lk7aAWBl0skiF24Ae6F16LSz95L4CfvcaLG3AoB79ldLH/gMKfjJI
 uDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jLEhl5WEtP/hz5aYM+RNMwIXSTAE45T4j8RhW18fVH0=;
 fh=M+mw8d6PcYw7St7NRfL8/UtDvi6qIKc+Rmyz3MF0cLA=;
 b=drFodxOm0Jg3nm7onceTzqJZXBVWLyJtz3FvZPfhGLBECPdomQfiVpY/ip6toU+d2j
 lVKCUVuplIBx/Wheos7H+5BJLSeHJWK1EYvFZ2w/youN4JTbMKx5ZqD80Ev7dpAxLynC
 91/PW74lCzTpk6lOlnW3k/5IoljjkSkP9+9BQfXdam7wB8PzdqhN9o7OOX23eROmtxQO
 j+Ipz2w6M5zGOUeoQcB7pABlwPdSQxNtsfArLerYSrDJM0xO+yiX7x0HrrUZDrAeJQQi
 8R/OFy0Gh5VZs07wbJi7aByEOgAl+7xAtDmtmF5hTit1dMsJOi81P2wxDCgRpgp4ciXQ
 U1Lg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794823564; x=1795428364; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=jLEhl5WEtP/hz5aYM+RNMwIXSTAE45T4j8RhW18fVH0=;
 b=SBBJF0XziB9iVtGn33y76+Yq3ivkske7SEKBbxv0txC2EbKQmN2ULp0IxAR24enAgb
 KOJLymn59jRsjCDAe6HiepBC0X3MVPo+eA9bll96z/qcFl+am2/nm5F81n1T+LQIl9T4
 i4jcT/ZC+FbJlb5hHoC/oklADHlYF1bakZNpWw61bHIvtKdPTUHUU2XAcRYwpspFy/lW
 /ni/v7f2RjAXplfmXPXDpfVHcH4O4v6p0Ezs0PAV+CFTomJ5YxR6YA3vE2loVWZphtms
 A6XgkOOwFz11d+CJE2v06ECj53oIl4wltXLTcHy9zuITFMYObn21N1EBkoXU0uFYKM5Z
 x0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794823564; x=1795428364;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jLEhl5WEtP/hz5aYM+RNMwIXSTAE45T4j8RhW18fVH0=;
 b=ViCp4nIwVk3QPLvnu5rYc9wGX9MCrTabpUtyXo/MGE4qyrEK99j3nDr3S9wFwytoEv
 VcOnEVZ+0++132JP7d1GUQr9wN9dd3Ec+pZYLkxwpbgKJE1d5teG4UBAWpJtnCDrAZoC
 Z0Mb94np8cXOZJMY8lcFi+wrdvC2ZW0rwQqDKoIP30sqzOpCgOgVG1xOHzAPLweyEKvY
 KZiB9DFY1JTq2PCQVfV2dPOyjhI1ZjarOuAX/J4r83g7pl9pJYLaaIR7elGWlS4q8rz7
 Y/Ro2JzeJj4CabpqmkoUASJNriRZH0I/xtwQMVHf1ZnmSoWKjLi+1GBVJRqV+MhMOwv1
 5fxw==
X-Forwarded-Encrypted: i=1;
 AL+hErExuH5MzNg+Bnez+132OcCWJ0GTCnsM9IwauatypClMjA6M3qqaMTPF0iiNFZ62LMaHBA0mzGmaFw==@nongnu.org
X-Gm-Message-State: APuU4Z+6ArBsR8v4C7axvFxqZOvdLcXoVHZL7lzg3y+5uJy2zXsGlxr8
 iw4e/jQ86cnIvPI2XKylqNToxHSrIIB4NJclC1cI3ZOQxbTmIowP7Eax61MewQQaWNx7mnqz1N2
 WvHnD64h16AH/W+GpRjNJgBRc8vxspathU1kQR+/f5w==
X-Gm-Gg: AZFdTZeSVF3IbFFqbLQ82outehX3EyrJ8rwDNRSwsRnp4XCMl9pyBELqfrkm4YS5VaU
 1f6HM8JrW87MHNobireuFIw/t39pheTav8KuG5lO+JYjYkAsLirvAGmhzHoxwCR2XPDHcMVX2YH
 SOVBZnk8IrFplKnWQqz+wegl/wYW37GuaCX9zYVSuekhlEtC9LSABv+9+bFl1hnkEb8k4RL1heD
 /BsJi4hdEGFb1KKzgQkQUHf+6Fji0K56Dc6Fwp4GSjSIsaEAOwlIPYyx8/GeB3lHzqpwf9XlgGW
 GC/2Mdm8iFntPc4IdUK5zwoakUTqhmdfjj66gVXI/rsWm8ku9f+QmnDAx60UGNwAk8iMADpCVCm
 xpQjZrMMt5Oj8YxDlkzYgb/uJ2HJuq8awat0eIlOjpnk2I6Y1LeLHITsBAvhHl5HC4u1eMwf5Id
 CakZJCmcmoO3qHBB+vnIno
X-Received: by 2002:a05:690e:1286:b0:67d:c046:4f71 with SMTP id
 956f58d0204a3-67dc04650c8mr438652d50.23.1794823563825; Mon, 16 Nov 2026
 02:06:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113023251.657645-1-kevinren114514@163.com>
In-Reply-To: <20261113023251.657645-1-kevinren114514@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2026 10:05:49 +0000
X-Gm-Features: AclHuK_0m_Kd1OGkeqzgSOIcABUN3e6Uw252epu3AowB10ZyESjI21iy9NPGYFI
Message-ID: <CAFEAcA-_EoTGr3ZuT3X8spbQNj1Onaw=7yoO1ijRQp=WuoB7sw@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/virt-acpi-build: test vms->acpi_dev before
 building HEST
To: Ren Yanyi <kevinren114514@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Fri, 13 Nov 2026 at 02:33, Ren Yanyi <kevinren114514@163.com> wrote:
>
> virt_acpi_build() gates HEST table construction on:
>
>     acpi_ged_state = ACPI_GED(vms->acpi_dev);
>     ags = &acpi_ged_state->ghes_state;
>     if (ags) {
>
> ags is the address of the ghes_state member of AcpiGedState and can
> never be NULL, so the check always passes.  Whether the GED device
> exists is a separate condition (has_ged also depends on firmware
> being loaded and on ACPI being enabled), so a machine started with
> ras=on but without a GED device reaches this code with a NULL
> acpi_ged_state; ags then holds a bogus non-NULL pointer and
> acpi_build_hest() dereferences it.
>
> Test vms->acpi_dev in the enclosing condition instead, so the HEST
> table is only built when the GED device exists and the ACPI_GED()
> cast is always valid.
>
> Fixes: 2e9c5c5bc85a ("acpi/ghes: prepare to change the way HEST offsets are calculated")
> Signed-off-by: Ren Yanyi <kevinren114514@163.com>

I've applied this to target-arm.next, but to let you know: your emails
do not seem to be making it to the mailing list. I only got this one
because I'm on the direct CC list for it.


(Full patch below for the record.)

> ---
>
> Changes since v1:
> - hoist the check into the outer "if (vms->ras && vms->acpi_dev)"
>   condition and unwrap the always-true inner check, as suggested
>   by Peter Maydell
>
>  hw/arm/virt-acpi-build.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d368913..5670d1e 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1406,7 +1406,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      acpi_add_table(table_offsets, tables_blob);
>      build_dbg2(tables_blob, tables->linker, vms);
>
> -    if (vms->ras) {
> +    if (vms->ras && vms->acpi_dev) {
>          AcpiGedState *acpi_ged_state;
>          static const AcpiNotificationSourceId *notify;
>          unsigned int notify_sz;
> @@ -1414,21 +1414,20 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>
>          acpi_ged_state = ACPI_GED(vms->acpi_dev);
>          ags = &acpi_ged_state->ghes_state;
> -        if (ags) {
> -            acpi_add_table(table_offsets, tables_blob);
>
> -            if (!ags->use_hest_addr) {
> -                notify = hest_ghes_notify_10_0;
> -                notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
> -            } else {
> -                notify = hest_ghes_notify;
> -                notify_sz = ARRAY_SIZE(hest_ghes_notify);
> -            }
> +        acpi_add_table(table_offsets, tables_blob);
>
> -            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> -                            tables->linker, notify, notify_sz,
> -                            vms->oem_id, vms->oem_table_id);
> +        if (!ags->use_hest_addr) {
> +            notify = hest_ghes_notify_10_0;
> +            notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
> +        } else {
> +            notify = hest_ghes_notify;
> +            notify_sz = ARRAY_SIZE(hest_ghes_notify);
>          }
> +
> +        acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> +                        tables->linker, notify, notify_sz,
> +                        vms->oem_id, vms->oem_table_id);
>      }
>
>      if (ms->numa_state->num_nodes > 0) {
> --
> 2.53.0
>


thanks
-- PMM

