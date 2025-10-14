Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6113CCD187
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 05:19:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8XRI-0002Wj-5h; Tue, 14 Oct 2025 01:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XRF-0002VP-Bp
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 01:19:09 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v8XRC-0005Ob-7Y
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 01:19:08 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so10076634a12.3
 for <qemu-arm@nongnu.org>; Mon, 13 Oct 2025 22:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760419143; x=1761023943; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZAlk7T6TK2p+DpULEo0NtxKk/ZIZl2cy2Hvke0k38nE=;
 b=cqdLeJtj6gj60ocHyYPYyHcwfab5M1TCI142WoVPyNAqwSu2g/4AhqjJ6hRRR9vKe7
 y1d5ZHmavaGy8yQ8YFHR07uxE8jHxfY0Wui/XymdODRTMyBWmoc3At1HsCNr4HUW81Bw
 lnVfnT8YDcFnUVdo6niLpaBntM33bgbLRXA11/0x12NP1db0Ev0k/XC8+jhVGCc5dcC1
 sZ3NCjEkaW57eyR05ANR+/dkMu8xXrO1HOGx3gKN4vjHUgaNJaMcAbFnYuPTJasqxe3s
 +x3d8+1QAGCiFtB4qGkUpeahJglMTX7m+SoaSPj2385g6nIhZOmuXxh1FCHHgQTKnjJV
 t/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760419143; x=1761023943;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZAlk7T6TK2p+DpULEo0NtxKk/ZIZl2cy2Hvke0k38nE=;
 b=SETPhH4jfo9ohjZe9YQo7EaNBmRhwv7XHLlvzvNWD2U/r0JMFsvEV23Ej8RUMQKZQ+
 2IFwxk9sxj1kIGky/3Q0P3Z7msVWpDrF10Lw+NQonfgweR8aOj5/4pSCiUmJ0O4AYCTu
 piXjc+KGo5PmU+VWopT6JKW1BpPmqEi1oc13BvUgEhAbks/rCeUWteRz410JxRv23olg
 k7hN+Qml1q20ycPpZfFvDot2RXKoGpOw7x6mttKNIJ3FrYslSKfSFFeSkME7QAzrWNDO
 FReNhgbz9AvMu+1QwL8awuNQilsELS59Ab5kCW3523+0wgWIDWEBBmJDzdqq5cLiQXV2
 NP7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDLNmtr9H28SG6JoQszmKZPTbJUc6nyI6DxdhLkDXrZyJw/n0fqz72z2WRSqzIfKgC+jE02hkZ3A==@nongnu.org
X-Gm-Message-State: AOJu0YyIfBbon0ZaCDqHCrAqeAwFqnQ3Oz9XCWbN4IBJ0WHITmIqQ2K9
 +qlaCqhUBz+TWc6yIrroGutm2KadjhVghKi1gFN4jsioegAM4j7fw087Vg0OeQFClBpPQ1XbH1R
 HNTv4bUuRng4n0UzM+kCtgSbtoZO0q01efg==
X-Gm-Gg: ASbGncvX7G5y8FnLDV2BtonX33SrB0tPWvOjPdC5zrBb2Kv5gmmvRO5ZIsWHhZijzSh
 nb0rOs99slVFM/DPUORsEnesfZBNe3U7gnY9Q/wrrVgkmQiEWZgqEU4u983a0CAgLXkZDPPQXlY
 4BTb+PwHSv1TBQoqJ7DFNxr6E0CVUvW1EnVolQ1KRMcR8ArcmxX4MKZfjJjYgojUjFgjhu0c19K
 4Uii5MQgwpkr1wPX1jhWUk/ewsrTBc0f++sS6lfklWFAYuK0uQWfAy4JlbfWi83nsQ=
X-Google-Smtp-Source: AGHT+IGV79/HDVEqu1oh+LwrazhIGg2jJTrJH/TszM1bqSwYgSmGNjr5GmriSxInUIugojyHJu//tdcZTiM9vyrRpRc=
X-Received: by 2002:a05:6402:1469:b0:639:ffd6:993b with SMTP id
 4fb4d7f45d1cf-639ffd6a393mr17024089a12.16.1760419143498; Mon, 13 Oct 2025
 22:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251010134226.72221-1-philmd@linaro.org>
 <20251010134226.72221-7-philmd@linaro.org>
In-Reply-To: <20251010134226.72221-7-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Oct 2025 15:18:37 +1000
X-Gm-Features: AS18NWCjCT2NUdXpwcdshncS05aqvBaiKkJbnAAsctvuvEFFjLEiu-TySDv6H4c
Message-ID: <CAKmqyKMFnTrdeY_i84omjNHE65omMW6EjG_b2MsU19LeLgJ8kw@mail.gmail.com>
Subject: Re: [PATCH 06/16] hw/core/loader: Replace HOST_BIG_ENDIAN #ifdef with
 runtime if() check
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

On Fri, Oct 10, 2025 at 11:46=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Replace compile-time #ifdef with a runtime check to ensure all code
> paths are built and tested. This reduces build-time configuration
> complexity and improves maintainability.
>
> No functional change intended.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/loader.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 477661a0255..aef10cb3f2b 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -491,7 +491,9 @@ ssize_t load_elf_ram_sym(const char *filename,
>
>  static void bswap_uboot_header(uboot_image_header_t *hdr)
>  {
> -#if !HOST_BIG_ENDIAN
> +    if (HOST_BIG_ENDIAN) {
> +        return;
> +    }
>      bswap32s(&hdr->ih_magic);
>      bswap32s(&hdr->ih_hcrc);
>      bswap32s(&hdr->ih_time);
> @@ -499,7 +501,6 @@ static void bswap_uboot_header(uboot_image_header_t *=
hdr)
>      bswap32s(&hdr->ih_load);
>      bswap32s(&hdr->ih_ep);
>      bswap32s(&hdr->ih_dcrc);
> -#endif
>  }
>
>
> --
> 2.51.0
>
>

