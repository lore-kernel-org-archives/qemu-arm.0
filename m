Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83447606A321
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V9m5k4+l
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRY7A-0003lK-It; Thu, 12 Nov 2026 11:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRY6k-0003gy-7L
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 11:57:08 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xRY6h-0007sI-ID
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 11:57:04 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-67c6f1019a3so2162937d50.0
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 08:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794502618; cv=none;
 d=google.com; s=arc-20260327;
 b=GtTR7FuhHKGeYHO1z6hffHv5xVAqMHF1zv4QYCzAqhRuSu7PgG6/nNyvYhhi4aeLFb
 /lcRnPf3XqD2Na94rj2/f3LfMjCqh856BBzGu5OCN5yfP8hV8XShkkf279uMsVOQ89Us
 16tdsHn5SAS5HI3cSI/vygeL17CTo65CxyY0Ifk/YjaXLJ0yoHS/y/LaQMyBz62QSKQH
 AGYz0F3NePhVjC5a3UrCsg2Sr/x8vm4KG+nRtTRxC9XiCg9Te9GMyo5qjeuosEPDw5Ko
 tTTcd1xS+y+TY/jqGso1t+B7DDeDerRfv8ClS6E3AWAk63cB7Cwt22i8ESyqkZIrkiub
 +vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=B7Z8EmkExZ7lbGW2T4pH0RXgFzwbiI1ownej/XCibt0=;
 fh=0qQkA7ZeP+YdlByF1UG98zU2lgqehB6I3PB9zJgekPk=;
 b=n2LaNiCbrf2TlqfwAUpSA7049+ugDwBFKNus/TvjUn9mZc07pKWjQaLFX4utzfNA9m
 pdg6mH44IaPmK4xiI58Sz/Frolr9KCow2696604z4kr4dKaZgUU1eQsCdzVGjz0y79u0
 Px/EBj/+uDz+8Hctu4BxayE51lbnC/7+Ssbckuy4dDMdTCZOAHZjYsFMJb9OI7d0cTge
 ftAZFkfQHNRm8gHLeVMSMMNwuW7OwLtL9AI3NGzY1BiCndAcd5xzVsJA46DybChw0BMt
 xJhIZ3+qX7h14QvokAfbBkXI2JlxIFWo8WSMXWwoEc8HilBolZ3wz+aLNnGy58S9o7ip
 Fs4w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794502618; x=1795107418; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=B7Z8EmkExZ7lbGW2T4pH0RXgFzwbiI1ownej/XCibt0=;
 b=V9m5k4+l9E0k1fNHhy+elPb96aLDfdAtBgB1WW9Xf6hrQu0hh9p+VrY6olZ90Hg0Ly
 PHlohzbOe1HO1c9MVEy3rKMZJCmXQIUT8V31WtfBCn12bFRhNsXMgG1DH8z2dtzNfa/M
 89OQC84gxu3Ba9IldCAR6YBPGr5xKq8Et1qMHPietxUBz5V3Th3Vz/QRZqNI1wAQhT/p
 N7Y5vWc1n+Gqwsj3hgUNI1Id+qgHaM1C+qoqkWal6CLHReEQ93OoxJ2fzqotG/6HWBJ9
 2JBkZdbWBCWZl5i9e1VUpxafbC6ym16iTpib1jVeXm/R/lXrYli3kKJD/rEdn5to8EXt
 sncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794502618; x=1795107418;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=B7Z8EmkExZ7lbGW2T4pH0RXgFzwbiI1ownej/XCibt0=;
 b=ULZJq/D7NVwMnlMSBF4FmLEc0cMHQGzeAeRuTazKUpZAN1yovEXEMFVCZTpWiql5ga
 ssPTLEdmzcDDFaMKA84WNkiiGuYVZ77QreSLczBZYFf8LagH0pgtRW3qTpKZ1lqdJC4e
 axpkIjHH2b4FQiNoEAApL9KsvK6scP7dD+j3hNaOnjU0j4TIjeELmFQ18+J0ZLqd0lGG
 ZMZaafoyV3q/9hxK902qb6LFxFIrZgdxGPmc07Ue0phXjfD6/aEio4j8AEZbikjChYJY
 ExLvmOq8IFplu8cE6sbPeVpPIcSf6Sj3ZpEU6xiXr85KyqljERyPx8OxEGOji+xni3/K
 i0kQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEY/I28mKIHiR02A7Gq/Gi47360v8JRQXRXGCbY8tLEVUCxeD/d0MRWTK8EyFq0oLHmwf31NXR2ow==@nongnu.org
X-Gm-Message-State: APuU4Z+vohp+RVEHgGOr73sGMpgpaPHXRMq6BISjKxykAjPJNQ6ivEfx
 nS8HOose0k5/AUKb4jIWThaR9a9qKeQQWYueBjb0y9TyAgomGZUHLdi70TgwnFAJGhM7KAI+sSW
 qhvqukpD78PBa9gnmHx/LvxYt0GyRU4cyIYqMRlQGzg==
X-Gm-Gg: AYBFou26RU2KytZWrMiQS7odUFsaiuorcdw/AMO9aoRr9CcinWjlEfnltOhdY8qxPCj
 SIqpLkE1bfAidlJAtOTm7YbnIfL3EQVW5BfZDK9GPqmmc85ihmiDAUsw3RKJXSRRMnkfP5AmMm5
 5AgEOrwLFa4YKtr8xmg6DIfT3pbe4LcOFE9ygsMl0GNVUu4mQHu8iTWBm177weCFmZSjHdllBME
 xyhgc3Kr04QTwpx3M2U0NXJDs3CQxC5ujIer+8XFLr0eZUoZ98W/PTXPVPytNwrxFJlG1+nYrwR
 mXEWU/8mUm80OKZAIAfUSl2GfLMqTOc8lFMo8oe74u1GjzAYo4Xf4iPq/jlDWdHNiHrWP4GFzvI
 3MvQ6l26Db7SCG0wUmh8dKo7MHuOg+gTb5EvdxXXfhbaWw+ISORLEidsRawzvD+iKsWYqPY7Ifh
 1aQ8JYuwEjbFeoenxoiVUj
X-Received: by 2002:a05:690e:4847:b0:677:af43:e258 with SMTP id
 956f58d0204a3-67d8971f45bmr3748d50.117.1794502617787; Thu, 12 Nov 2026
 08:56:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112075407.602371-1-kevinren114514@163.com>
In-Reply-To: <20261112075407.602371-1-kevinren114514@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Nov 2026 16:56:45 +0000
X-Gm-Features: AclHuK-_D9VtxgY6OgSHKjd9Oh0s2oumBJOdHbyNd1xaAKJMvsnMSBneixHSI48
Message-ID: <CAFEAcA_P=vMgxMJ=pzKO05yvaTcDuiop-pUmPXRiei1mef=Xsw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt-acpi-build: test vms->acpi_dev before
 building HEST
To: Ren Yanyi <kevinren114514@163.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, shannon.zhaosl@gmail.com, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Thu, 12 Nov 2026 at 07:54, Ren Yanyi <kevinren114514@163.com> wrote:
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
> Test vms->acpi_dev, the device the block actually depends on, so the
> HEST table is only built when the GED device exists.
>
> Fixes: 2e9c5c5bc85a ("acpi/ghes: prepare to change the way HEST offsets are calculated")
> Signed-off-by: Ren Yanyi <kevinren114514@163.com>
> ---
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index d368913..45bdabd 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -1414,7 +1414,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>
>          acpi_ged_state = ACPI_GED(vms->acpi_dev);
>          ags = &acpi_ged_state->ghes_state;
> -        if (ags) {
> +        if (vms->acpi_dev) {

Now we're not trying to check anything to do with the local variables
we just set up, we can move this check up, so that we say
"if (vms->ras && vms->acpi_dev) {".

thanks
-- PMM

