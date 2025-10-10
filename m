Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D92CCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 10:06:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7A0j-0000ap-2s; Fri, 10 Oct 2025 06:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7A0h-0000aW-52
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 06:06:04 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7A0b-0003NI-Qo
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 06:06:02 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-63cf081f87fso191146d50.1
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760090754; x=1760695554; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oIoax9uN8gg45sVHNBStsxb2JzoQaro5TWlzSUBN8IQ=;
 b=tAHT2XiefWDB0wSrMI3zXOa+0xQSCMLrhmxDAsuZ2lThHFZiD/v7q1pOu0UMSempgE
 MOs2//Nuy8gXuw10/JnNa+XW1/vF4zqQhmrjUfBhlsbdGK+ekMJUkLGZ8+gUsMjbvTkf
 j8HHRasaa50WdqdxdCM4g5qzzvLjNdUKPB939Sjw8tVCEnBQm0o3lAETEec/+Nl4VDd2
 wF3mIxyt1c1+InhbXMRRbKw19aIVM1FEmTzc7rIpVwav7n3yUqgs8Un2JGURqPi5mGgL
 Pmc9VFGBWw1L5LypONkMOZyXL65OoIYOiWNH8riCKgj1jdILjeDD0nFCn9iX6oGEpgda
 jeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760090754; x=1760695554;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIoax9uN8gg45sVHNBStsxb2JzoQaro5TWlzSUBN8IQ=;
 b=SrQbSUgvdhqifb5tfJr7fvUcHAUr4wP3q6DkBmxQAcO1ra5CC96g4YGb7KBnQkM2wQ
 48vLXfhXuh3/R/5eTry6mdMtfLGs2sa27xPajb/3BjuCQrHwOuLn3cGJa8cERSDsFHW1
 kYr+Y3QfgyiRJtHNE94xMIbXagRQadXVK8hqttUT3i9dvE4fSYjxGKpxwols+tidhFxq
 PzQZQwYQWXmdLi44BG7JW3V5z+vYK/kmZrnA2S3Jp41/bGVXItb32AyLm1L1Jpn2cw/T
 UYAD2+1V3vMeEGkKEFdb+NeMFeHtclII2oSOuBZ6HDKkwpDHHb60Ws7sUP+Ebkd//nr4
 dwHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJmMGC4BrIWrGQAixFluxJu0RSO4zms95SkOtWgg+czu7a0bGx/0VGkYe5AoHhF2vJJuAfnNoSLw==@nongnu.org
X-Gm-Message-State: AOJu0Yw2JtQvchEVleKEj7MrD1ARGj6QCCMSasCasxZ+PgWUzRxYlQTv
 +6JSZbByqO84ORnOOWUDCTmOuaOwLl8Z7vFKs17vtpBhxkNXm3PMMKxSQdhHuCdCJvyzPsL08SJ
 tTKe6aBep+7Z0qV/uZq0thio055Qbci8L8b+jUjx8qw==
X-Gm-Gg: ASbGnctYk961NZB/m54R06lHoqGc/nQfLy5uzcQvSiDtZDx6SWXho1QIzHoJ1//p0k6
 /XlZjU5gRAmhYcYFjfm41GM6mS31NqDCtYGsn+cG+67M4GY5zDCpiCQnwJP/JkfeCQQGlv+zOvR
 QnTcWal9W7FUKZ4Jn8IBDjkGbg4wo1JNIiSqwpQjwbmgsoVojBBvDdH3qfbha8uiVQ85C0zTvle
 HHrvmaBs0M7FGo40j/lvQghVHyxBi4A1k4UvtEjTmXV4e5ybXoS
X-Google-Smtp-Source: AGHT+IF3QESCaFC0aA2EnILx5L3ho7+zGK1rBALBf+620KHP1wALSqdfWhmO1OtrV9tLWjCgGfz2+sGzZhRZ7U0ieUk=
X-Received: by 2002:a05:690e:158e:10b0:63c:e3dc:bef with SMTP id
 956f58d0204a3-63ce3dc1563mr3412328d50.40.1760090754277; Fri, 10 Oct 2025
 03:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251008191716.3005164-1-daan.j.demeyer@gmail.com>
In-Reply-To: <20251008191716.3005164-1-daan.j.demeyer@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Oct 2025 11:05:43 +0100
X-Gm-Features: AS18NWD3-O5OrmtNOmCHdMsQxniwCHYzGfre40vQnil6iNE0F30IMys2Uqs6_jA
Message-ID: <CAFEAcA-iQkqxR5jPtGC1EAtcH4FYD5y71x6RFSWC3vP05krScw@mail.gmail.com>
Subject: Re: [PATCH] Add support for zboot images compressed with zstd
To: Daan De Meyer <daan.j.demeyer@gmail.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, 8 Oct 2025 at 20:17, Daan De Meyer <daan.j.demeyer@gmail.com> wrote:
>
> Signed-off-by: Daan De Meyer <daan.j.demeyer@gmail.com>
> ---
>  hw/arm/boot.c       |  2 +-
>  hw/core/loader.c    | 36 ++++++++++++++++++++++++------------
>  hw/nvram/fw_cfg.c   |  2 +-
>  include/hw/loader.h |  2 +-
>  4 files changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index e77d8679d8..c0dec0343a 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -826,7 +826,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
>      ssize_t size;
>
>      /* On aarch64, it's the bootloader's job to uncompress the kernel. */
> -    size = load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_GUNZIP_BYTES,
> +    size = load_image_gzipped_buffer(filename, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES,
>                                       &buffer);

I would either not bother renaming this constant, or else do
it in a preliminary patch of its own in the series. (That
makes the part of the patch which is making the functional
change easier to read and review.)

> @@ -882,14 +887,6 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
>          return 0;
>      }
>
> -    if (strcmp(header->compression_type, "gzip") != 0) {
> -        fprintf(stderr,
> -                "unable to handle EFI zboot image with \"%.*s\" compression\n",
> -                (int)sizeof(header->compression_type) - 1,
> -                header->compression_type);
> -        return -1;
> -    }
> -
>      ploff = ldl_le_p(&header->payload_offset);
>      plsize = ldl_le_p(&header->payload_size);
>
> @@ -898,8 +895,23 @@ ssize_t unpack_efi_zboot_image(uint8_t **buffer, ssize_t *size)
>          return -1;
>      }
>
> -    data = g_malloc(LOAD_IMAGE_MAX_GUNZIP_BYTES);
> -    bytes = gunzip(data, LOAD_IMAGE_MAX_GUNZIP_BYTES, *buffer + ploff, plsize);
> +    data = g_malloc(LOAD_IMAGE_MAX_DECOMPRESSED_BYTES);
> +
> +    if (strcmp(header->compression_type, "gzip") == 0) {
> +        bytes = gunzip(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);
> +#ifdef CONFIG_ZSTD
> +    } else if (strcmp(header->compression_type, "zstd") == 0) {
> +        size_t ret = ZSTD_decompress(data, LOAD_IMAGE_MAX_DECOMPRESSED_BYTES, *buffer + ploff, plsize);
> +        bytes = ZSTD_isError(ret) ? -1 : (ssize_t) ret;
> +#endif
> +    } else {
> +        fprintf(stderr,
> +                "unable to handle EFI zboot image with \"%.*s\" compression\n",
> +                (int)sizeof(header->compression_type) - 1,
> +                header->compression_type);
> +        return -1;

Moving the "unrecognized compression type" error path down to
here means that we have moved it below the g_malloc() of the
data buffer, so we now need to g_free() to avoid a leak.

> +    }
> +
>      if (bytes < 0) {
>          fprintf(stderr, "failed to decompress EFI zboot image\n");
>          g_free(data);

Otherwise I think this looks OK.

thanks
-- PMM

