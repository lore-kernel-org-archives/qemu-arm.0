Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AF0CD8CAA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:00:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWwzp-0001BS-RI; Tue, 09 Jun 2026 10:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWwzn-0001A1-Ve
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 09:59:59 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWwzm-00042C-GN
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 09:59:59 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-660323f7b27so5863298d50.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 06:59:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781013597; cv=none;
 d=google.com; s=arc-20240605;
 b=Jwi0oEFugXpXl8bx5mhfa1cuszGx4CJWUNXnvdKCDCRgveDp7wSLOncJA4v6WUDCiZ
 cvB47kPyVtTA8IrHGfqErKEyabzdHCf4gPt57J3Qo0hgQE/OhSaqIYvcBjTHxkixxFKA
 s0Vd4hOI8uuujRs0EtT1yow0XHnGHGpv5569p78c2+v8grCj7xjpi55nhHzHngwUwk7e
 N/AO4+Ln0+KeowkMW0FMQnNiJlKjBvhMJmRvRQJyQig/hZUwpvpGSm7c3fu/mQU+5r+u
 RSNJeeYcUNM+Bj65rVtNjlLbzluuIRnKciM5rmzCARC1KYxf4UrihQYzmpz2cilK7rgl
 +APg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OhyJqPZjg1+M3+Hnd/IypCSNajvZxsN9GFvQ8gg4HO4=;
 fh=iVvZ8VbnlfSIZHGyTvAg/0UhoZZ3VrtFrl08z0EMh4A=;
 b=GEZ+fg3hwa1NKokoWBiQEA6nryQpoNr3HOQsr7gVH9c23ruIZhU0pXgWObUkQs/DCX
 mLuFldrhKZR9oyjpcT5VVfigWdGDO2irKS3pvNP2FEBPH7Ov+hj1ogPxUwvMqIjgMy9L
 ofRJvtPpeepdcZUG2/DXFvcfECGbWoNTbOWt56XMNbrhZ8yu5PNrKCsVTGcunYVDYuTz
 nXWWRSBZSXrCnLff4JRMTQ5aIYRkpF3fdKE6IVTDMg4ll2NJkqg+gGjrBl2MNEdoWCeh
 r0832pWwLLBfbKPnH/XhW3wcBKujb/iy+cz2rdIT7v+kMwBA6aJnIvB9sCGOV1Xmdn2m
 asCg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781013597; x=1781618397; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OhyJqPZjg1+M3+Hnd/IypCSNajvZxsN9GFvQ8gg4HO4=;
 b=zgtorxHTdnMY1KCJVbbG80U8tS5VlnfXW3g+H5fB7Ib7TklpzeD/nYhqS/IsshKgoy
 HRWxo99nX5MTysqJuGey36mwaql5s1Zjqm3AzSh6uVic+u6bKrGS3cNtvK7Dr1iJApqz
 gu8nj/TV/s2rPpRZWw1L3UedO4o8KC/XHjMFM/XKkidfMOMiHI8BP9U/9srgHCrfhOuM
 y44YPnEdy/HDAkdppDT1m/y5aswj5zclNqqSNFWOlKWO9a68qc2MH28GCFlBzB5qjuTl
 SqbmDf/unEY9gf41v8WvWGwmqxKq8PU3UNImsDH61TUp3p59Ip1vztkCCtM9BVJCB/xC
 X+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781013597; x=1781618397;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OhyJqPZjg1+M3+Hnd/IypCSNajvZxsN9GFvQ8gg4HO4=;
 b=gmciPqJdcWWJm8DiI74xD/DIYeOnJLG/QCRC/sJrcBL9YhlT+biJLjPqQrcX9YWo3a
 L/uLm/ObWKa9d+JcJVSa4GKjnO6nM4/A0SpouXofEa/SsYPbsZvZ1uCvYp7o9+gfr/V6
 3SrS//BEwZwscJNgDpEFX7cxJSPP98rP7SZU5Zix+9Dxsjf3VuHDrS8Ea4M7rz8ZPQmp
 9oY5BZXovaHkkntAEngG5uCona9uc6RSVXOsgmyzFkgRo1+wNJ36u6mMOgpYGRw/77KS
 r2LFuhuXvicOBT4+8nsUNo+tRLfFMMr7Eee3CnMv68onClSp/n4/lTmhMCe8Sk/OSidB
 qc6Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/HcTF2yI0IZOEkSRmW5KsFVBHPn3UDpv7Zd/DkDzAW+cWccX/NAA4bWbeUhDuPviOZ1VadZq8mlA==@nongnu.org
X-Gm-Message-State: AOJu0Yy/c9Krn5dH17cMA5yheVOM+v/tZuJ0jCB7BpwkBWRGGJxV1ItI
 1+ss0JXknDmkxFiDYuJzXAVSzUaEd+s/d6sDOVH4qELKe9apVxWUsTUViiLOQh+Mg5eSVyppnNJ
 WG97ZvdITBP+Mb0HGcdbIVscMTr+4Ti1H65dex8MXew==
X-Gm-Gg: Acq92OGBTly2uHRbHlU9obFcP9m123RBR/cAlnUfMXRPIv1aAaFMhfiWKNV7UeBZ9bz
 UUPSCbaXSo8BOBdbG4IcNt+n8kVauO2iKA5a/mQpmxbkGH3GcxbBJu1zil6X87L1GshRDPbvMsN
 1MoKBueLWmeuejmA/RA5yWmwEoEBH0RF3edF1uVohDFiSXZp+imKydWuHiAVOBn5mIwVfvg0Yj1
 miMhqXtkQ1zofmaINaWBbLyQplkj87RrnT1SCMoFHCIiumjwOEcsRez5CZQtYLqY2eLyQbUhC5n
 jLKi7xKL+2ow46l/k4XuY4OMDKMIvshPXPmVPy08vns2tr6u7aO5ln6mGo+Vsh0CzFC3JGr2iDT
 ijA==
X-Received: by 2002:a05:690e:144b:b0:660:f0e2:8dfa with SMTP id
 956f58d0204a3-661073da663mr16335881d50.1.1781013596955; Tue, 09 Jun 2026
 06:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <aiE5LrpfnJRbkx-A@sirius.home.kraxel.org>
 <CAFEAcA_ow2ro3h0nfhY3jA_XToAnjdVFNPrF25aWLd=X2cnmaw@mail.gmail.com>
 <aia8iXGozAclWQCb@sirius.home.kraxel.org>
 <CAFEAcA9oB_-ao5C8fGYonE7njUMWLHo5-iETeN_XtnFL4PzyvA@mail.gmail.com>
 <aibALjyPTXVUDpDv@sirius.home.kraxel.org>
 <CAFEAcA-VQWKzJ-aNnzYHZ7a+sVP1y6tkUnE3YCPydsqP0uVXvg@mail.gmail.com>
 <aiflCrf0iDwcpj27@sirius.home.kraxel.org>
 <CAFEAcA_+fZnFG_2xH2gXF7ZtGo-WVwAhwkz9ucuS5kXZOYShnw@mail.gmail.com>
 <aif6QGPxr4oMhb94@sirius.home.kraxel.org>
 <CAFEAcA_qjzLjdqi3NWfY3cTDfkE0HmuvxSV3yVuBb+O95zvV9w@mail.gmail.com>
 <aigTPdBzp0q4sbKc@sirius.home.kraxel.org>
In-Reply-To: <aigTPdBzp0q4sbKc@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 14:59:45 +0100
X-Gm-Features: AVVi8CcfahVoBYUIDG1Vy8llPuh-x_5fqiB4RpS62V7JtWWgosyva6O7Nxs4Eds
Message-ID: <CAFEAcA9VLSRgLS8vMUQwip=AT0Zic+T7xQvNRUYjGhwxd4=-dw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: add support for shim loading
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Tue, 9 Jun 2026 at 14:42, Gerd Hoffmann <kraxel@redhat.com> wrote:
> The rpi4 with tcg takes quite some time indeed, but edk2 isn't
> exceptionally slow.  Booting until the kernel panics because there is no
> root filesystem takes ~30 seconds, and those are roughly 50% / 50%
> splitted between firmware and kernel.

Put another way, booting via EDK2 is doubling the time taken :-)

> A good chunk of the firmware time
> is probably the zboot efi stub for kernel self-decompression (would have
> to instrument the firmware for more details on that).
>
> Comparing that to direct boot without firmware does not work for me:
>
>   unable to handle EFI zboot image with "zstd" compression
>   qemu-system-aarch64: could not load kernel '/boot/vmlinuz-7.0.11-200.fc44.aarch64'

That error happens if you didn't have libzstd-dev available when you
built QEMU. A QEMU with zstd support should be able to decompress
a zstd EFI image.

thanks
-- PMM

