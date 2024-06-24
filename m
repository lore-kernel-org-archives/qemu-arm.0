Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp355417njc;
        Sun, 23 Jun 2024 23:04:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3+Ks7BsPg+49qoWS3e44X0d7643/R84kRSQiDpDt1WoknBQuePCDgpic0JEsRLY9rImDRz6ldFkRaNM+OPJimI5IyNRh+
X-Google-Smtp-Source: AGHT+IFGsEl18fWZGqD9L7QdkI1hsDa/EwRJe8j8tCWwrOtBlSuCT+pTxjuiww81SiW7dOlLrHP9
X-Received: by 2002:a67:ff12:0:b0:48b:a44b:c935 with SMTP id ada2fe7eead31-48f4f136bc9mr2158234137.33.1719209061025;
        Sun, 23 Jun 2024 23:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719209061; cv=none;
        d=google.com; s=arc-20160816;
        b=IOBNwNmaCh1dSunPhuow/PJDdd8SyNUyPeINPUksqQdnioP+RfMvXpVQsVkjJbWwuZ
         MB3tNJEs+TuGcT6ItbYGwDwVKHrRKrDA/edrd1ywEEsGNj83MDy/NunsAHvfNi0wA8nV
         suZ+T1VDi7f3g/O5qM7Bd3q2gEaBV7cki9nXqOlrbQQ0D4Ns3WLzOUr1yiKYzx5lukAg
         3ocsYTFmDuXSjKAZMQtUXsyvSn4ac+CdHM1HkHVuTAXDaMP347/e19U5iHkx+bVafBEF
         2bn5GtueP3Mk4hyOmTLt8R86+hNJeualZN+bo+gtyQIho06hPCTRt+/DSplP4GCUvcut
         Sh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=pRjjzrwoopXOsYzu6jLr+pwyQKTmPnQYozm0u0J2YTM=;
        fh=R/i9vYkAn3o8D5/dHWdd3Me1vXsQZ1+Y/4APbpYyJI0=;
        b=KtAfirCrq5YIl29DazxqBxV0cbHPfQWvTzh3UztJFI4erE31++XwV4kGb+GR9Kcqe/
         J5eQPntz336RwoPoFXNHE9ZnGnnthdJCnNzFxFzhthDoaBm+Fbyr01uBypBbOo16hDHJ
         jGGv29eR7fGrThFhfAml9i92a02rSoZ2R2UA9fteo6jb9UXaCEpqv1ll0tT7eZjXTezZ
         lgZBKaQFePFNW8j1Vo79VTP2+HQAkyDqQs17m98zAYnWBQ2VDc8LJiUCQeQHDEPtkkDF
         td1ccUJ9c2pAF+q6q73OBvy1wuwHnBDvt0Dgk6lxetjj/ZsbtaJehAPKaTlTrH7COoHJ
         jI8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iX0XJY3y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51edda9bbsi74649726d6.387.2024.06.23.23.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Jun 2024 23:04:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=iX0XJY3y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sLcnr-000866-Qm; Mon, 24 Jun 2024 02:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sLcnq-00085n-98; Mon, 24 Jun 2024 02:03:46 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1sLcno-00015s-5C; Mon, 24 Jun 2024 02:03:46 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-4ef765e6dcaso169514e0c.1; 
 Sun, 23 Jun 2024 23:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719209022; x=1719813822; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRjjzrwoopXOsYzu6jLr+pwyQKTmPnQYozm0u0J2YTM=;
 b=iX0XJY3yCz4WndDZOsOz17Qub6BdUbHOo1Ye7EZXvIb25rUXypsA44I02mbh+uUcKz
 m68tofezDOgNwCJ3pf61Zgc/vodspvqEn41TBKIIO/cgQz8NcMRCIW+noDivUWquHaij
 8wA42ry40JJH4eGy+hkwRoyNskrg7xOEXfLGuqLPMjoZ2o0g0a0hKTP2iiowCBnEAcl6
 OxUaDS7kf5dPYGUNP2Fx8UuiJkMiMSOg5VIaz2DA6GLWfb6I3dRbvJS3oqmo9vCUfVyV
 BE9B28nhC4eSBfhmzvwuo7Eq6Z8+ClggWlvEgTyCaYTInQxtza0LudScRl1BXw6v46Qa
 3yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719209022; x=1719813822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRjjzrwoopXOsYzu6jLr+pwyQKTmPnQYozm0u0J2YTM=;
 b=nI8rlvFO3diSBN+DCq7CsmcGy3TgiJZtxwDCtA3N8B7fMlzA8cWspI+YfW9qpVtwYh
 hW1CK07QtyNVl+GH8/FL0c2zyRb189qVgw+K75eMiemIIYc3SDgxaFj5zxgKHFLOOHvq
 TjSxZ15Ok0V1FyAgHdfa7Sxd+eb3KdMYz+LPJfnW3SnrmZxs5zmAgwaG/UuwV3MLwiU9
 qanVByjDKPN4XGDLUcz9/+pe5PlvLm1oTCy7OtuFphTe9/x7PvTgmyuU/p8eLamnNYQc
 7/6T0RjZU7KKYgL1Z/UmtZxaknnLCTAZ52UYueJt1uEQ831qUiM8a/WXtRSvLsGm5Svi
 xLsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjh9acmVXEx6QDaNYt7Km3YiAfI1sv4Oa2D5DYdxCv/GiE4dkKiaaBWVS7MAk/HVmjThRG2SMD+0BTcIUJPq6I4PD/TUXPQ6sqnsO44DIhar3FaEEV45u+xHw=
X-Gm-Message-State: AOJu0YyENnPUq4+aSI8gesmyachO7pP8k1U4UBfLjj2bxJXbdBqHV6VE
 q99K6Y3aE1BYFYjrrRdDlPebKxPpHxmlBSFCnbAGYz0tV0dhrAvmJ4kY+G5dHb4KAWVr6TbgD8Z
 MV81+9nGKHWwM7LFm30BvO8abKjg=
X-Received: by 2002:a05:6122:1790:b0:4ef:6865:8ffd with SMTP id
 71dfb90a1353d-4ef6a73802bmr1655165e0c.10.1719209022128; Sun, 23 Jun 2024
 23:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240621115906.1049832-1-sunilvl@ventanamicro.com>
 <20240621115906.1049832-6-sunilvl@ventanamicro.com>
In-Reply-To: <20240621115906.1049832-6-sunilvl@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jun 2024 16:03:15 +1000
Message-ID: <CAKmqyKOXXRtu3U4xPp57_4qoCAx07Q3o50oEVHKPgZ=0EjAoXg@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] tests/qtest/bios-tables-test.c: Add support for
 arch in path
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8SHj+JKJ2fGd

On Fri, Jun 21, 2024 at 9:59=E2=80=AFPM Sunil V L <sunilvl@ventanamicro.com=
> wrote:
>
> Since machine name can be common for multiple architectures (ex: virt),
> add "arch" in the path to search for expected AML files. Since the AML
> files are still under old path, add support for searching with and
> without arch in the path.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/qtest/bios-tables-test.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-tes=
t.c
> index c4a4d1c7bf..29c52952f4 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -78,6 +78,7 @@
>  typedef struct {
>      bool tcg_only;
>      const char *machine;
> +    const char *arch;
>      const char *machine_param;
>      const char *variant;
>      const char *uefi_fl1;
> @@ -262,8 +263,19 @@ static void dump_aml_files(test_data *data, bool reb=
uild)
>          g_assert(exp_sdt->aml);
>
>          if (rebuild) {
> -            aml_file =3D g_strdup_printf("%s/%s/%.4s%s", data_dir, data-=
>machine,
> +            aml_file =3D g_strdup_printf("%s/%s/%s/%.4s%s", data_dir,
> +                                       data->arch, data->machine,
>                                         sdt->aml, ext);
> +
> +            /*
> +             * To keep test cases not failing before the DATA files are =
moved to
> +             * ${arch}/${machine} folder, add this check as well.
> +             */
> +            if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +                aml_file =3D g_strdup_printf("%s/%s/%.4s%s", data_dir,
> +                                           data->machine, sdt->aml, ext)=
;
> +            }
> +
>              if (!g_file_test(aml_file, G_FILE_TEST_EXISTS) &&
>                  sdt->aml_len =3D=3D exp_sdt->aml_len &&
>                  !memcmp(sdt->aml, exp_sdt->aml, sdt->aml_len)) {
> @@ -398,8 +410,13 @@ static GArray *load_expected_aml(test_data *data)
>          memset(&exp_sdt, 0, sizeof(exp_sdt));
>
>  try_again:
> -        aml_file =3D g_strdup_printf("%s/%s/%.4s%s", data_dir, data->mac=
hine,
> -                                   sdt->aml, ext);
> +        aml_file =3D g_strdup_printf("%s/%s/%s/%.4s%s", data_dir, data->=
arch,
> +                                   data->machine, sdt->aml, ext);
> +        if (!g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> +            aml_file =3D g_strdup_printf("%s/%s/%.4s%s", data_dir, data-=
>machine,
> +                                       sdt->aml, ext);
> +        }
> +
>          if (verbosity_level >=3D 2) {
>              fprintf(stderr, "Looking for expected file '%s'\n", aml_file=
);
>          }
> --
> 2.40.1
>
