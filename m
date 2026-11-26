Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10AE606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NpBw2S3A
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWVjr-0002PI-4e; Thu, 26 Nov 2026 04:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xWVjo-0002M8-Fd
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 04:25:56 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xWVjm-0007Dz-Sv
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 04:25:56 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso48142585e9.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 01:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795685152; x=1796289952; darn=nongnu.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0p02JuRdtubpNHhEGgOVYdJyom/ct9MeB/HDCaC4FgE=;
 b=NpBw2S3AfPO7FRNfGC+5WDQ75AuiMKlH8AD6Zw+23VR+wbbxItYW37RLAFEfYPkS/g
 Xv+bjw4ZMNqkl00oyYTi29dEKBKT2H3nKoq4bEcDf8miX5qnL1KaKv1JbgJYbVoiEXBV
 beXtRv7fzrBromvudtn33wpqu2nijYUc4iWYrxUC+2PXcv84weCgdxkCRH2KIdg6B1Z8
 zpxtHLWU1pNn91b1nJs68WNFjVqU5aSAFadtf8WJ3re7b0QlTeD8H5TcfcHTaIwGf1cT
 0a8l9tvHgqC850uecXl1LalqUWOL7GADJjBOBK4LTVeZ0KN+SXj2TA8UkpKDBV/9z67m
 c75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795685152; x=1796289952;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0p02JuRdtubpNHhEGgOVYdJyom/ct9MeB/HDCaC4FgE=;
 b=WO6EIFpKJV5Oo3tE76+eQDZNzUUlUukhrY0vUas8S/An9HVHlLyXPvTrmVWxdQiWs6
 3hRtLkTiVKvWx/eH5BZBp1QXgVu8oNaUmIgXf23CNrXOqhZpGit5HXaXoql2NZtlDHmh
 hh+mE7Ur727W9AvN/i0zV8j2uw10UTB5/RvkiUxg9ba2akaZdZOXXa7Ry9ZWEUy+wxRS
 1c2VZl97q9BXDatpfCPBsl814cHL2CP5kOplo2d1ORSe6lCJ61ZsU8Pv/EN/pEojoRjj
 Ksm8g5iEjY1QwAD19JPtGdZkzizo/VPeFEyhwgVPRyh0MPGy+N/4GuXSFJBFctpGtW9Q
 Gz+A==
X-Forwarded-Encrypted: i=1;
 AL+hErFtwJjIKprpH2g7cj9W8xtkEw2q8WNwIm86cdiRQcWGcbfI7lY0UIbslzIJQEXuvg/Xvgjqx3GPDw==@nongnu.org
X-Gm-Message-State: APuU4Z81fkYNrtPe0qn/vkoVRg6xFIPJ8v/h7wURCvtQOPG0sJ6J3QOC
 /EFCu5Wfynn2Q5QNvJH8/kkv9ds+t63w8nDbtMxfyWsJXohMHtm6RH/b4tl+ACJPvrA=
X-Gm-Gg: AZFdTZer41WE2Vsu/xXNMmz/aoEFx1D6tn2CCpTFnI4/qPEWAkdboa/OLntjt/br2Os
 KeFEYgQFTW/ijsRKhvO9qg9RuS5IWWZf3LgqwaxJ1DarHlx8QmPdNPAeIRtgg7YlJpjtcjIE1RF
 DsSromwaCIzHY7VMq7Tz5mo3JyLuhMobesSsg16R+WuHQESh1uFeneymnz0dyW26AXTO1hFZUak
 sqr0ykcd6CXJ649ixAuwsc9uebxDImk5zpPyAc2ImtwNIlY9ZqwpmTJYN3nZl2aVRLqynpi291Q
 m1lcTmh9YAaUe80TZmUjHvn/ZC5/BaZ5yNA8g0xvuhZvghKRSh7WhpSGby3I4fSwnMNIkt6bbUJ
 R5mVuWPe6F837i5hOFhm0MZtB0o4KUxcmflWc10Qly1LalfiuNsufxB1Bw/vn02BrZgaT6uRlty
 IOXKUAIOVHA1V+UM/ZV2qUtVDIm0hEnv8pGQngc8AxboAjqkILjZP4pzZ+bCUKLr1KmIm3o0AvY
 4OK7qeKVyClIBEcK5aYWfzHAWOtUm+DXPVTiNz/fQWAwJY0ukD2KiMMnHdbijfq30qEe9FoJXDo
 kxXGfSg23oYUWonAyehS+nvRwrrdF3SW
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id
 5b1f17b1804b1-4bb88810b22mr405250345e9.17.1795685152278; 
 Thu, 26 Nov 2026 01:25:52 -0800 (PST)
Received: from linaro.org ([2a10:d582:31e:0:496e:5802:6210:8370])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b39b6sm540811145e9.12.2026.11.26.01.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 01:25:51 -0800 (PST)
Date: Thu, 26 Nov 2026 09:25:50 +0000
From: Jim MacArthur <jim.macarthur@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Gustavo Romero <gromero@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] hw/arm/sbsa-ref.c: Increase SMMU space for Root
 registers
Message-ID: <awf7HnqCe1AIhMEi@linaro.org>
References: <20261125-jmac-smmu-root-registers-v2-0-9ce0f6aa5097@linaro.org>
 <20261125-jmac-smmu-root-registers-v2-2-9ce0f6aa5097@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-jmac-smmu-root-registers-v2-2-9ce0f6aa5097@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32f.google.com
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

On Wed, Nov 25, 2026 at 05:39:10PM +0000, Jim MacArthur wrote:
> In our implementation, SMMU Root registers are directly after the
> non-optional SMMU registers. Realms registers will be added above the
> root registers later.
> 
> Also force x-root on for sbsa-ref, which will allocate the extra
> space necessary and allow access to the Root registers.
> 
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 158b461eb4..ca1ffe5f94 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -129,7 +129,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
>      [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
>      [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
>      [SBSA_SECURE_UART_MM] =     { 0x60040000, 0x00001000 },
> -    [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
> +    [SBSA_SMMU] =               { 0x60050000, 3 * SMMUV3_PAGE_SIZE },
>      /* Space here reserved for more SMMUs */
>      [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
>      [SBSA_XHCI] =               { 0x60110000, 0x00010000 },
> @@ -630,6 +630,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus,
>                               &error_abort);
>      object_property_set_link(OBJECT(dev), "secure-memory", OBJECT(secure_sysmem),
>                               &error_abort);
> +    object_property_set_bool(OBJECT(dev), "x-root", true, &error_abort);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>      for (i = 0; i < NUM_SMMU_IRQS; i++) {

Apologies, I've missed off a #include at the start of this patch, so V3 will
be out shortly correcting this.

Jim

