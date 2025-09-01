Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5217CA0FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Sep 2025 13:04:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ut4DF-00035V-At; Mon, 01 Sep 2025 09:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ut4DE-00034m-0V
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 09:04:44 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1ut4DB-0005z5-V2
 for qemu-arm@nongnu.org; Mon, 01 Sep 2025 09:04:43 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b0439098469so99529666b.1
 for <qemu-arm@nongnu.org>; Mon, 01 Sep 2025 06:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756731880; x=1757336680; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlKj8OKSsrbMCx7XTlHagNjOcu9W5Y4qb5a5EzELU08=;
 b=bmB9l1XGA/TfBDcspZ9XHhtjTd/ncZXUKiUWNrLqdXR4whKmfdc9EGDZ/dTf71XqRp
 RKa7PmA/CxhkttFjDwHmUQSBRjXErTB/1IlDkJlyGkflz29hRiFBq3RmdtvtQ95UYW2+
 bFrB+v5YiKnTu686g4b+xu/ZD1SgK2tq2sGV/ngLBctf6wSkca1NHIkKsXDayA1UinXb
 UOZl3m7L7lfIps4AgWNNyTgtlKWzZzIeJmcHKpFiEbWn3ZwcZi2HIRaN1Ul3IPwiWZ1A
 rBDd0vw14mtHYb+H6o+wEEOkVy35HIqqhdP4W2AfceyhuVuDNEvDayTTTHZ4w6RWjNqR
 mlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756731880; x=1757336680;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlKj8OKSsrbMCx7XTlHagNjOcu9W5Y4qb5a5EzELU08=;
 b=CxAbUgS3RSi7u60XG0jrv6Uegpv8xUmUSMsgA+i8dsFQ+ygthQnt+2Uwf8e7+PG9Yu
 xSPQKklCMtWx6MOkY3mHqXU0fx1ZeL45/zF7zVl4ROmIQzO+FiX9Dir0hGD+K88HAhgK
 VdOyrworhWveIF6zFh92v2bxCZCtzdb4RGMPdbiZN2rO7W/w8s8//ocmEISI/EiHQEOd
 kgePqq9jN0CTsl0vMXqLkPDJZlg+6BlaYJdII0Sk2Fn9lKYbE0jsiBmRNOod/RVclcao
 KS7Fg20jzP4J8Hx369Adb8ezbw799ezSnoFw4lUTqYNhgARPSY8pj3TwguJ1V1zcmNoD
 4D0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo4217WhffPgmMHFsYwyE11ty+fLbY0dy563L19fwOcp1Lt+RptReTj7ig9rzcnXWNfzlKX/kXIg==@nongnu.org
X-Gm-Message-State: AOJu0Yw93N70acguDw5nHHjGr4yhyJV2zCXyO7bQpLpsIFIiE6qNW4UY
 KB9rCZIYd/ck5Ivcur9zFkf/JcArPtUvkd6x3PSWwc01FScgr42ESMIAlm11sOTzBhWokGzubZr
 fMnh/Gwu55kPq4f7MwCemPzE1WeSruiuS+yowUJSA03SbFSZQZw85+Q0=
X-Gm-Gg: ASbGncvaD/llkYT+59Tj397HEnz6KLQy3rzvWXVLbpTYOVAKzGLfr4anqvjgFCWR1ln
 rk8gvLQUg+DWLDz1DK29ouG/vuL/mdQPz2Xn+I8yyu889BZQgsS9oLd3uHHIWFRVy/QA78EIAKE
 x4j8EXhT9hXv10OPaMCZdBIAzWU3qvY4qLwDPkJqSx2oDoL/9g37G4CNlDUria5DDLmmXIVvdDp
 zuRAwxDNxZl40wnNqY=
X-Google-Smtp-Source: AGHT+IGX1I49kNkvlURV0IXi8xO0t68krtT9V1FmXjJ76QABfAyRucSfyA9zVbHRFLdUUVfXLKRNcAtjBb8dA6WgYB4=
X-Received: by 2002:a17:907:c27:b0:afe:63ec:6938 with SMTP id
 a640c23a62f3a-b01d8a308b8mr799651966b.7.1756731879870; Mon, 01 Sep 2025
 06:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250901125304.1047624-1-alex.bennee@linaro.org>
 <20250901125304.1047624-2-alex.bennee@linaro.org>
In-Reply-To: <20250901125304.1047624-2-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 1 Sep 2025 16:04:13 +0300
X-Gm-Features: Ac12FXzcoetJQvq-CpvTIVuKZZaLkftVfX0VbipCW7pubyS08UfUEb4W52rFBk0
Message-ID: <CAAjaMXZNZPyga1xPLemcfF9NDwdw=_nfeW54n5pbbfZgdr7KTQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] hw/arm: use g_autofree for filename in arm_load_dtb
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62d.google.com
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

On Mon, Sep 1, 2025 at 3:54=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> The function has quite a number of exit cases so lets try and clean
> things up with g_autofree. As the fdt hasn't be allocated yet we can
> return directly from the fail point.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


>  hw/arm/boot.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index d391cd01bb1..56fd13b9f7c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -528,20 +528,18 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
>      Error *err =3D NULL;
>
>      if (binfo->dtb_filename) {
> -        char *filename;
> -        filename =3D qemu_find_file(QEMU_FILE_TYPE_DTB, binfo->dtb_filen=
ame);
> +        g_autofree char *filename =3D qemu_find_file(QEMU_FILE_TYPE_DTB,
> +                                                   binfo->dtb_filename);
>          if (!filename) {
>              fprintf(stderr, "Couldn't open dtb file %s\n", binfo->dtb_fi=
lename);
> -            goto fail;
> +            return -1;
>          }
>
>          fdt =3D load_device_tree(filename, &size);
>          if (!fdt) {
>              fprintf(stderr, "Couldn't open dtb file %s\n", filename);
> -            g_free(filename);
>              goto fail;
>          }
> -        g_free(filename);
>      } else {
>          fdt =3D binfo->get_dtb(binfo, &size);
>          if (!fdt) {
> --
> 2.47.2
>
>

